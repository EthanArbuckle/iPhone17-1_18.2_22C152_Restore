@interface CKActionMenuGestureRecognizer
+ (id)actionMenuGestureRecognizer;
- (CGPoint)_convertVelocitySample:(id)a3 fromScreenCoordinatesToView:(id)a4;
- (CGPoint)velocityInView:(id)a3;
- (CKActionMenuGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CKActionMenuGestureRecognizer

+ (id)actionMenuGestureRecognizer
{
  v2 = [CKActionMenuGestureRecognizer alloc];
  v3 = +[CKActionMenuWindow sharedInstance];
  v4 = [(CKActionMenuGestureRecognizer *)v2 initWithTarget:v3 action:sel_actionMenuGestureRecognized_];

  [(CKActionMenuGestureRecognizer *)v4 setMinimumPressDuration:0.255];

  return v4;
}

- (CKActionMenuGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CKActionMenuGestureRecognizer;
  v4 = [(CKActionMenuGestureRecognizer *)&v12 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v11.receiver = v4;
    v11.super_class = (Class)CKActionMenuGestureRecognizer;
    [(CKActionMenuGestureRecognizer *)&v11 setAllowableMovement:1.79769313e308];
    v6 = objc_alloc_init(CKActionMenuGestureVelocitySample);
    velocitySample = v5->_velocitySample;
    v5->_velocitySample = v6;

    v8 = objc_alloc_init(CKActionMenuGestureVelocitySample);
    previousVelocitySample = v5->_previousVelocitySample;
    v5->_previousVelocitySample = v8;
  }
  return v5;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)CKActionMenuGestureRecognizer;
  [(CKActionMenuGestureRecognizer *)&v4 reset];
  CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_velocitySample->start = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_velocitySample->end = v3;
  self->_velocitySample->dt = 0.0;
  self->_previousVelocitySample->start = v3;
  self->_previousVelocitySample->end = v3;
  self->_previousVelocitySample->dt = 0.0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CKActionMenuGestureRecognizer;
  id v6 = a4;
  id v7 = a3;
  [(CKActionMenuGestureRecognizer *)&v16 touchesBegan:v7 withEvent:v6];
  objc_msgSend(v6, "timestamp", v16.receiver, v16.super_class);
  double v9 = v8;

  v10 = [v7 anyObject];

  objc_super v11 = [v10 window];
  [v10 locationInView:0];
  objc_msgSend(v11, "convertPoint:toWindow:", 0);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  self->_lastScreenLocation.x = v13;
  self->_lastScreenLocation.y = v15;
  self->_lastTouchTime = v9;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CKActionMenuGestureRecognizer;
  id v6 = a4;
  id v7 = a3;
  [(CKActionMenuGestureRecognizer *)&v18 touchesMoved:v7 withEvent:v6];
  objc_msgSend(v6, "timestamp", v18.receiver, v18.super_class);
  double v9 = v8;

  v10 = [v7 anyObject];

  objc_super v11 = [v10 window];
  [v10 locationInView:0];
  objc_msgSend(v11, "convertPoint:toWindow:", 0);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = v9 - self->_lastTouchTime;
  if (v16 > 0.008)
  {
    self->_previousVelocitySample->start = self->_velocitySample->start;
    self->_previousVelocitySample->end = self->_velocitySample->end;
    self->_previousVelocitySample->dt = self->_velocitySample->dt;
    self->_velocitySample->start = self->_lastScreenLocation;
    velocitySample = self->_velocitySample;
    velocitySample->end.x = v13;
    velocitySample->end.y = v15;
    self->_velocitySample->dt = v16;
  }
  self->_lastScreenLocation.x = v13;
  self->_lastScreenLocation.y = v15;
  self->_lastTouchTime = v9;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4 = a3;
  [(CKActionMenuGestureRecognizer *)self _convertVelocitySample:self->_velocitySample fromScreenCoordinatesToView:v4];
  double v6 = v5;
  double v8 = v7;
  if (self->_previousVelocitySample->dt > 0.00000011920929)
  {
    -[CKActionMenuGestureRecognizer _convertVelocitySample:fromScreenCoordinatesToView:](self, "_convertVelocitySample:fromScreenCoordinatesToView:");
    double v6 = v9 * 0.75 + v6 * 0.25;
    double v8 = v10 * 0.75 + v8 * 0.25;
  }

  double v11 = v6;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_convertVelocitySample:(id)a3 fromScreenCoordinatesToView:(id)a4
{
  double v6 = (double *)a3;
  id v7 = a4;
  double v8 = v7;
  if (v6[5] >= 0.001)
  {
    if (v7)
    {
      id v11 = v7;
    }
    else
    {
      double v12 = [(CKActionMenuGestureRecognizer *)self view];
      id v11 = [v12 window];
    }
    objc_msgSend(MEMORY[0x1E4F42D90], "convertPoint:toView:", v11, v6[1], v6[2]);
    double v14 = v13;
    double v16 = v15;
    objc_msgSend(MEMORY[0x1E4F42D90], "convertPoint:toView:", v11, v6[3], v6[4]);
    double v18 = v6[5];
    double v9 = (v17 - v14) / v18;
    double v10 = (v19 - v16) / v18;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v20 = v9;
  double v21 = v10;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);

  objc_storeStrong((id *)&self->_velocitySample, 0);
}

@end