@interface PKFadeOutStrokeAnimation
- (BOOL)isDoneAtTime:(double)a3;
- (PKFadeOutStrokeAnimation)initWithStroke:(id)a3 startTime:(double)a4 duration:(double)a5;
- (PKStroke)stroke;
- (double)duration;
- (double)startTime;
- (id)newStrokeAtTime:(double)a3;
@end

@implementation PKFadeOutStrokeAnimation

- (PKFadeOutStrokeAnimation)initWithStroke:(id)a3 startTime:(double)a4 duration:(double)a5
{
  id v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKFadeOutStrokeAnimation;
  v10 = [(PKFadeOutStrokeAnimation *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stroke, a3);
    v11->_startTime = a4;
    v12 = [v9 ink];
    uint64_t v13 = [v12 color];
    startColor = v11->_startColor;
    v11->_startColor = (UIColor *)v13;

    v11->_duration = a5;
  }

  return v11;
}

- (id)newStrokeAtTime:(double)a3
{
  v5 = [(PKFadeOutStrokeAnimation *)self stroke];
  v6 = (void *)[v5 mutableCopy];

  [(PKFadeOutStrokeAnimation *)self startTime];
  double v8 = a3 - v7;
  [(PKFadeOutStrokeAnimation *)self duration];
  double v10 = v8 / v9;
  [(UIColor *)self->_startColor alphaComponent];
  double v12 = 0.0;
  if (v10 <= 1.0) {
    double v12 = 1.0 - v10;
  }
  uint64_t v13 = [(UIColor *)self->_startColor colorWithAlphaComponent:v11 * v12];
  v14 = [(PKFadeOutStrokeAnimation *)self stroke];
  v15 = [v14 ink];
  objc_super v16 = [v15 identifier];
  v17 = [(PKFadeOutStrokeAnimation *)self stroke];
  v18 = [v17 ink];
  [v18 weight];
  v19 = +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v16, v13);
  [v6 setInk:v19];

  return v6;
}

- (BOOL)isDoneAtTime:(double)a3
{
  [(PKFadeOutStrokeAnimation *)self startTime];
  double v6 = v5;
  [(PKFadeOutStrokeAnimation *)self duration];
  return v6 + v7 <= a3;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);

  objc_storeStrong((id *)&self->_startColor, 0);
}

@end