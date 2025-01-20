@interface SCATPointPickerCenterPoint
- (BOOL)isCenterPoint;
- (CGPath)scatPath;
- (CGRect)scatFrame;
- (SCATPointPickerCenterPointDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation SCATPointPickerCenterPoint

- (CGRect)scatFrame
{
  v3 = [(SCATPointPickerCenterPoint *)self delegate];
  [v3 scannerFrameForPointPickerCenterPoint:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPath)scatPath
{
  v3 = [(SCATPointPickerCenterPoint *)self delegate];
  double v4 = (CGPath *)[v3 scannerPathForPointPickerCenterPoint:self];

  return v4;
}

- (BOOL)isCenterPoint
{
  return 1;
}

- (SCATPointPickerCenterPointDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATPointPickerCenterPointDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end