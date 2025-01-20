@interface CKThrowBalloonViewAttributes
- (CGRect)startFrame;
- (CKBalloonView)throwBalloonView;
- (NSDictionary)supplementaryViews;
- (void)setStartFrame:(CGRect)a3;
- (void)setSupplementaryViews:(id)a3;
- (void)setThrowBalloonView:(id)a3;
@end

@implementation CKThrowBalloonViewAttributes

- (CKBalloonView)throwBalloonView
{
  return self->_throwBalloonView;
}

- (void)setThrowBalloonView:(id)a3
{
}

- (NSDictionary)supplementaryViews
{
  return self->_supplementaryViews;
}

- (void)setSupplementaryViews:(id)a3
{
}

- (CGRect)startFrame
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryViews, 0);

  objc_storeStrong((id *)&self->_throwBalloonView, 0);
}

@end