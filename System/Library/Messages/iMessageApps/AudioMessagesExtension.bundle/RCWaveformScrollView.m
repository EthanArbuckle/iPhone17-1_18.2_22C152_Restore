@interface RCWaveformScrollView
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (CGPoint)contentOffsetInPresentationLayer:(BOOL)a3;
- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4 usingCurrentAnimatedPosition:(BOOL)a5;
- (void)beginIgnoringContentOffsetChanges;
- (void)endIgnoringContentOffsetChanges;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation RCWaveformScrollView

- (void)beginIgnoringContentOffsetChanges
{
}

- (void)endIgnoringContentOffsetChanges
{
}

- (void)setContentOffset:(CGPoint)a3
{
  if (!self->_ignoreContentOffsetChangesCount)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
  }
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  if (!self->_ignoreContentOffsetChangesCount)
  {
    v4.receiver = self;
    v4.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView setContentOffset:animated:](&v4, "setContentOffset:animated:", a4, a3.x, a3.y);
  }
}

- (CGPoint)contentOffsetInPresentationLayer:(BOOL)a3
{
  if (a3)
  {
    objc_super v4 = [(RCWaveformScrollView *)self layer];
    v5 = [v4 presentationLayer];

    if (v5)
    {
      [v5 bounds];
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)RCWaveformScrollView;
      [(RCWaveformScrollView *)&v14 contentOffset];
    }
    double v9 = v6;
    double v11 = v7;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)RCWaveformScrollView;
    [(RCWaveformScrollView *)&v15 contentOffset];
    double v9 = v8;
    double v11 = v10;
  }
  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4 usingCurrentAnimatedPosition:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  if (a5)
  {
    double v12 = [(RCWaveformScrollView *)self layer];
    double v13 = [v12 presentationLayer];

    objc_super v14 = [v13 animationKeys];
    id v15 = [v14 count];

    if (v15)
    {
      v16 = [v11 layer];
      objc_msgSend(v13, "convertRect:fromLayer:", v16, x, y, width, height);
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
    }
    else
    {
      v37.receiver = self;
      v37.super_class = (Class)RCWaveformScrollView;
      -[RCWaveformScrollView convertRect:fromView:](&v37, "convertRect:fromView:", v11, x, y, width, height);
      double v18 = v29;
      double v20 = v30;
      double v22 = v31;
      double v24 = v32;
    }
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)RCWaveformScrollView;
    -[RCWaveformScrollView convertRect:fromView:](&v38, "convertRect:fromView:", v11, x, y, width, height);
    double v18 = v25;
    double v20 = v26;
    double v22 = v27;
    double v24 = v28;
  }

  double v33 = v18;
  double v34 = v20;
  double v35 = v22;
  double v36 = v24;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

@end