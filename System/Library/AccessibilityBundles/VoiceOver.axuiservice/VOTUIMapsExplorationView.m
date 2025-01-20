@interface VOTUIMapsExplorationView
- (CGPoint)currentCenter;
- (CGPoint)currentLocation;
- (CGPoint)lastLocation;
- (VOTUIMapsExplorationLocationView)currentLocationView;
- (VOTUIMapsExplorationRotaryView)currentRotaryView;
- (VOTUIMapsExplorationView)init;
- (int64_t)currentIndex;
- (int64_t)lastIndex;
- (void)highlightExplorationSegmentWithIndex:(int64_t)a3;
- (void)setCurrentCenter:(CGPoint)a3;
- (void)setCurrentIndex:(int64_t)a3;
- (void)setCurrentLocation:(CGPoint)a3;
- (void)setCurrentLocationView:(id)a3;
- (void)setCurrentRotaryView:(id)a3;
- (void)setLastIndex:(int64_t)a3;
- (void)setLastLocation:(CGPoint)a3;
- (void)updateUIWithCenter:(CGPoint)a3;
- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4;
- (void)updateUIWithCurrentLocation:(CGPoint)a3;
@end

@implementation VOTUIMapsExplorationView

- (VOTUIMapsExplorationView)init
{
  v8.receiver = self;
  v8.super_class = (Class)VOTUIMapsExplorationView;
  v2 = [(VOTUIMapsExplorationView *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastIndex = -1;
    v2->_currentIndex = -1;
    CGPoint v4 = CGPointZero;
    v2->_currentLocation = CGPointZero;
    v2->_lastLocation = v4;
    id v5 = [(VOTUIMapsExplorationView *)v2 currentRotaryView];
    id v6 = [(VOTUIMapsExplorationView *)v3 currentLocationView];
  }
  return v3;
}

- (VOTUIMapsExplorationLocationView)currentLocationView
{
  currentLocationView = self->_currentLocationView;
  if (!currentLocationView)
  {
    CGPoint v4 = -[VOTUIMapsExplorationLocationView initWithFrame:]([VOTUIMapsExplorationLocationView alloc], "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
    [(VOTUIMapsExplorationView *)self currentLocation];
    -[VOTUIMapsExplorationLocationView setCenter:](v4, "setCenter:");
    id v5 = self->_currentLocationView;
    self->_currentLocationView = v4;
    id v6 = v4;

    [(VOTUIMapsExplorationView *)self addSubview:v6];
    v7 = [(VOTUIMapsExplorationView *)self currentLocationView];
    [v7 setAlpha:0.0];

    currentLocationView = self->_currentLocationView;
  }

  return currentLocationView;
}

- (VOTUIMapsExplorationRotaryView)currentRotaryView
{
  currentRotaryView = self->_currentRotaryView;
  if (!currentRotaryView)
  {
    CGPoint v4 = [VOTUIMapsExplorationRotaryView alloc];
    [(VOTUIMapsExplorationView *)self currentLocation];
    v7 = -[VOTUIMapsExplorationRotaryView initWithFrame:atCenter:](v4, "initWithFrame:atCenter:", 0.0, 0.0, 900.0, 900.0, v5, v6);
    objc_super v8 = self->_currentRotaryView;
    self->_currentRotaryView = v7;
    v9 = v7;

    [(VOTUIMapsExplorationView *)self addSubview:v9];
    currentRotaryView = self->_currentRotaryView;
  }

  return currentRotaryView;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_lastIndex = self->_currentIndex;
  self->_currentIndex = a3;
}

- (void)setCurrentLocation:(CGPoint)a3
{
  self->_lastLocation = self->_currentLocation;
  self->_currentLocation = a3;
}

- (void)updateUIWithCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[VOTUIMapsExplorationView setCurrentCenter:](self, "setCurrentCenter:");
  id v6 = [(VOTUIMapsExplorationView *)self currentRotaryView];
  objc_msgSend(v6, "setCenter:", x, y);
}

- (void)updateUIWithCenter:(CGPoint)a3 andExplorationSegments:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(VOTUIMapsExplorationView *)self setLastIndex:-1];
  [(VOTUIMapsExplorationView *)self setCurrentIndex:-1];
  -[VOTUIMapsExplorationView setCurrentCenter:](self, "setCurrentCenter:", x, y);
  objc_super v8 = [(VOTUIMapsExplorationView *)self currentRotaryView];
  objc_msgSend(v8, "setCenter:", x, y);

  id v9 = [(VOTUIMapsExplorationView *)self currentRotaryView];
  [v9 addSubviewsFromExplorationSegments:v7];
}

- (void)updateUIWithCurrentLocation:(CGPoint)a3
{
  -[VOTUIMapsExplorationView setCurrentLocation:](self, "setCurrentLocation:", a3.x, a3.y);
  CGPoint v4 = [(VOTUIMapsExplorationView *)self currentLocationView];

  if (v4)
  {
    [(VOTUIMapsExplorationView *)self currentLocation];
    double v6 = v5;
    [(VOTUIMapsExplorationView *)self lastLocation];
    double v8 = v6 - v7;
    [(VOTUIMapsExplorationView *)self currentLocation];
    double v10 = v9;
    [(VOTUIMapsExplorationView *)self lastLocation];
    double v12 = v10 - v11;
    v13 = [(VOTUIMapsExplorationView *)self currentLocationView];
    [v13 frame];
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    double v19 = v8 + v18;
    double v21 = v12 + v20;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10E4C;
    v24[3] = &unk_3D2B0;
    v24[4] = self;
    +[UIView animateWithDuration:v24 animations:0.2];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10E94;
    v23[3] = &unk_3D3A0;
    v23[4] = self;
    *(double *)&v23[5] = v19;
    *(double *)&v23[6] = v21;
    v23[7] = v15;
    v23[8] = v17;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10F00;
    v22[3] = &unk_3D1C0;
    v22[4] = self;
    +[UIView animateWithDuration:v23 animations:v22 completion:0.5];
  }
}

- (void)highlightExplorationSegmentWithIndex:(int64_t)a3
{
  [(VOTUIMapsExplorationView *)self setCurrentIndex:a3];
  id v4 = [(VOTUIMapsExplorationView *)self currentRotaryView];
  objc_msgSend(v4, "handleHighlightChangeWithLastIndex:andNewIndex:", -[VOTUIMapsExplorationView lastIndex](self, "lastIndex"), -[VOTUIMapsExplorationView currentIndex](self, "currentIndex"));
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (int64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setLastIndex:(int64_t)a3
{
  self->_lastIndedouble x = a3;
}

- (CGPoint)currentCenter
{
  double x = self->_currentCenter.x;
  double y = self->_currentCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentCenter:(CGPoint)a3
{
  self->_currentCenter = a3;
}

- (CGPoint)currentLocation
{
  double x = self->_currentLocation.x;
  double y = self->_currentLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)lastLocation
{
  double x = self->_lastLocation.x;
  double y = self->_lastLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastLocation:(CGPoint)a3
{
  self->_lastLocation = a3;
}

- (void)setCurrentLocationView:(id)a3
{
}

- (void)setCurrentRotaryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRotaryView, 0);

  objc_storeStrong((id *)&self->_currentLocationView, 0);
}

@end