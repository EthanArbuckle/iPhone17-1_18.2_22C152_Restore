@interface AVCenterTapGestureRecognizer
- (BOOL)shouldReceiveEvent:(id)a3;
@end

@implementation AVCenterTapGestureRecognizer

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  v5 = [(AVCenterTapGestureRecognizer *)self view];
  if (v5
    && (v23.receiver = self,
        v23.super_class = (Class)AVCenterTapGestureRecognizer,
        [(AVCenterTapGestureRecognizer *)&v23 shouldReceiveEvent:v4]))
  {
    v6 = [v4 allTouches];
    v7 = [v6 anyObject];

    [v5 bounds];
    double v9 = v8;
    double v11 = v10;
    [v5 center];
    double v13 = v12;
    double v15 = v14;
    [v7 locationInView:v5];
    if (v11 >= v9) {
      double v18 = v9;
    }
    else {
      double v18 = v11;
    }
    double v19 = fmin(v18 * 0.1, 100.0);
    if (v19 <= 14.0)
    {
      BOOL v21 = 0;
    }
    else
    {
      BOOL v20 = vabdd_f64(v13, v16) <= v19;
      BOOL v21 = vabdd_f64(v15, v17) <= v19 && v20;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

@end