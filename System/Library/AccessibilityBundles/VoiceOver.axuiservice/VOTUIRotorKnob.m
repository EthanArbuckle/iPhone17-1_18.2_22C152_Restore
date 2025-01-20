@interface VOTUIRotorKnob
- (CGPoint)_trackPointForPlacement:(double)a3;
- (VOTUIRotorKnob)initWithFrame:(CGRect)a3;
- (int64_t)count;
- (void)_layoutKnob;
- (void)_layoutMarkerAtPosition:(CGPoint)a3 withCircleLocation:(double)a4 withImageView:(id)a5;
- (void)_layoutTrackMarks;
- (void)_layoutTrackMarks:(int64_t)a3 placements:(double)a4;
- (void)_updateSelectedMarker;
- (void)layoutSubviews;
- (void)reset;
- (void)setCount:(int64_t)a3;
- (void)updatePosition:(BOOL)a3;
@end

@implementation VOTUIRotorKnob

- (VOTUIRotorKnob)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VOTUIRotorKnob;
  v3 = -[VOTUIRotorKnob initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = +[UIImage imageNamed:@"empty" inBundle:v4];
  emptyMarkImage = v3->_emptyMarkImage;
  v3->_emptyMarkImage = (UIImage *)v5;

  uint64_t v7 = +[UIImage imageNamed:@"filled" inBundle:v4];
  selectedMarkImage = v3->_selectedMarkImage;
  v3->_selectedMarkImage = (UIImage *)v7;

  v9 = +[UIImage imageNamed:@"rotor" inBundle:v4];
  v10 = (MarkerImageView *)[objc_allocWithZone((Class)MarkerImageView) initWithImage:v9];
  knobImageView = v3->_knobImageView;
  v3->_knobImageView = v10;

  v12 = (NSMutableArray *)[objc_allocWithZone((Class)NSMutableArray) init];
  markerImageViews = v3->_markerImageViews;
  v3->_markerImageViews = v12;

  uint64_t v14 = 8;
  do
  {
    id v15 = [objc_allocWithZone((Class)MarkerImageView) initWithImage:v3->_emptyMarkImage];
    [(NSMutableArray *)v3->_markerImageViews addObject:v15];

    --v14;
  }
  while (v14);
  v16 = +[UIColor clearColor];
  [(VOTUIRotorKnob *)v3 setBackgroundColor:v16];

  [(VOTUIRotorKnob *)v3 addSubview:v3->_knobImageView];
  return v3;
}

- (void)updatePosition:(BOOL)a3
{
  int64_t position = self->_position;
  if (a3) {
    int64_t v4 = position + 1;
  }
  else {
    int64_t v4 = position - 1;
  }
  self->_int64_t position = v4;
  int64_t count = self->_count;
  if (v4 < 0)
  {
    int64_t v4 = count - 1;
  }
  else
  {
    if (v4 < count) {
      goto LABEL_9;
    }
    int64_t v4 = 0;
  }
  self->_int64_t position = v4;
LABEL_9:
  self->_lastMovementSkippedEmptySpace = 0;
  int64_t v6 = self->_count;
  int v7 = a3;
  if (v6 == 3)
  {
LABEL_12:
    self->_lastMovementSkippedEmptySpace = v4 == v7;
    goto LABEL_13;
  }
  if (v6 == 2)
  {
    int v7 = !a3;
    goto LABEL_12;
  }
LABEL_13:
  self->_lastMovementWasForward = a3;
  self->_needsLayout = 1;
  [(VOTUIRotorKnob *)self setNeedsLayout];
}

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    uint64_t v3 = 8;
    if (a3 < 8) {
      uint64_t v3 = a3;
    }
    self->_int64_t count = v3;
    int64_t position = self->_position;
    if (position >= v3) {
      self->_int64_t position = position % v3;
    }
    self->_needsLayout = 1;
    [(VOTUIRotorKnob *)self setNeedsLayout];
  }
}

- (void)_updateSelectedMarker
{
  id v3 = [(NSMutableArray *)self->_markerImageViews objectAtIndex:self->_position];
  [v3 setImage:self->_selectedMarkImage];
}

- (void)_layoutKnob
{
  if (self->_needsLayout)
  {
    unint64_t position = self->_position;
    if ((position & 0x8000000000000000) == 0
      && position < (unint64_t)[(NSMutableArray *)self->_markerImageViews count])
    {
      int64_t v4 = [(NSMutableArray *)self->_markerImageViews objectAtIndex:self->_position];
      [v4 rotationRadian];
      CGFloat v6 = v5;
      [(MarkerImageView *)self->_knobImageView rotationRadian];
      double v8 = v7;
      long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v21.c = v9;
      *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      memset(&v20, 0, sizeof(v20));
      CGAffineTransformMakeRotation(&v20, v6);
      BOOL lastMovementSkippedEmptySpace = self->_lastMovementSkippedEmptySpace;
      if (lastMovementSkippedEmptySpace)
      {
        CGAffineTransform v21 = v20;
        int64_t count = self->_count;
        double v12 = 0.100000001;
        if (count == 3)
        {
          double v13 = (v6 + v8) * 0.5;
          goto LABEL_10;
        }
        if (count == 2)
        {
          double v13 = 1.57079633;
LABEL_10:
          CGAffineTransformMakeRotation(&v19, v13);
          CGAffineTransform v20 = v19;
        }
      }
      else
      {
        double v12 = 0.150000006;
      }
      [(MarkerImageView *)self->_knobImageView setRotationRadian:v6];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      CGAffineTransform v18 = v20;
      v17[2] = sub_376C;
      v17[3] = &unk_3D198;
      v17[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_37B8;
      v14[3] = &unk_3D1E8;
      v14[4] = self;
      BOOL v16 = lastMovementSkippedEmptySpace;
      *(double *)&v14[5] = v12;
      CGAffineTransform v15 = v21;
      +[UIView animateWithDuration:v17 animations:v14 completion:v12];
    }
  }
}

- (void)_layoutMarkerAtPosition:(CGPoint)a3 withCircleLocation:(double)a4 withImageView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  objc_msgSend(v9, "setCenter:", x, y);
  CGFloat v10 = a4 * 6.28318531;
  [v9 setRotationRadian:v10];
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, v10);
  CGAffineTransform v11 = v12;
  [v9 setTransform:&v11];
  [(VOTUIRotorKnob *)self addSubview:v9];
}

- (void)reset
{
  markerImageViews = self->_markerImageViews;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3A48;
  v3[3] = &unk_3D210;
  v3[4] = self;
  [(NSMutableArray *)markerImageViews enumerateObjectsUsingBlock:v3];
}

- (CGPoint)_trackPointForPlacement:(double)a3
{
  [(MarkerImageView *)self->_knobImageView center];
  double v5 = v4;
  double v7 = v6;
  __double2 v8 = __sincos_stret(a3 * 6.28318531);
  float v9 = v5 + v8.__cosval * 38.0;
  double v10 = ceilf(v9);
  float v11 = v7 + v8.__sinval * 38.0;
  double v12 = ceilf(v11);
  double v13 = v10;
  result.double y = v12;
  result.double x = v13;
  return result;
}

- (void)_layoutTrackMarks:(int64_t)a3 placements:(double)a4
{
  uint64_t v14 = (double *)&v15;
  if (a3 >= 1)
  {
    for (uint64_t i = 0; i != a3; ++i)
    {
      [(VOTUIRotorKnob *)self _trackPointForPlacement:a4];
      double v9 = v8;
      double v11 = v10;
      double v12 = [(NSMutableArray *)self->_markerImageViews objectAtIndex:i];
      -[VOTUIRotorKnob _layoutMarkerAtPosition:withCircleLocation:withImageView:](self, "_layoutMarkerAtPosition:withCircleLocation:withImageView:", v12, v9, v11, a4);

      double v13 = v14++;
      a4 = *v13;
    }
  }
}

- (void)_layoutTrackMarks
{
  int64_t count = self->_count;
  if (count >= 2)
  {
    switch(count)
    {
      case 2:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 2, 0.625, 0x3FEC000000000000, v3, v4, v5, v6, v7, v8);
        break;
      case 3:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 3, 0.0, 0x3FE0000000000000, 0x3FE8000000000000, v4, v5, v6, v7, v8);
        break;
      case 4:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 4, 0.0, 0x3FD0000000000000, 0x3FE0000000000000, 0x3FE8000000000000, v5, v6, v7, v8);
        break;
      case 5:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 5, 0.150000006, 0x3FD6666660000000, 0x3FE19999A0000000, 0x3FE8000000000000, 0x3FEE666660000000, v6, v7, v8);
        break;
      case 6:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 6, 0.075000003, 0x3FD0000000000000, 0x3FDB333340000000, 0x3FE2666660000000, 0x3FE8000000000000, 0x3FED9999A0000000, v7, v8);
        break;
      case 7:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 7, 0.0500000007, 0x3FC6666660000000, 0x3FD4CCCCC0000000, 0x3FDCCCCCC0000000, 0x3FE3333340000000, 0x3FE8000000000000, 0x3FECCCCCC0000000, v8);
        break;
      default:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:](self, "_layoutTrackMarks:placements:", 8, 0.0, 0x3FC0000000000000, 0x3FD0000000000000, 0x3FD8000000000000, 0x3FE0000000000000, 0x3FE4000000000000, 0x3FE8000000000000, 0x3FEC000000000000);
        break;
    }
  }
}

- (void)layoutSubviews
{
  [(VOTUIRotorKnob *)self reset];
  [(VOTUIRotorKnob *)self bounds];
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double MidX = CGRectGetMidX(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  -[MarkerImageView setCenter:](self->_knobImageView, "setCenter:", MidX, CGRectGetMaxY(v10) + -67.0);
  [(VOTUIRotorKnob *)self _layoutTrackMarks];

  [(VOTUIRotorKnob *)self _layoutKnob];
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerImageViews, 0);
  objc_storeStrong((id *)&self->_knobImageView, 0);
  objc_storeStrong((id *)&self->_selectedMarkImage, 0);

  objc_storeStrong((id *)&self->_emptyMarkImage, 0);
}

@end