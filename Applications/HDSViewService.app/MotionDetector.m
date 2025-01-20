@interface MotionDetector
- (BOOL)isMoving;
- (CMMotionManager)motion;
- (MotionDetector)init;
- (double)accelerationMagnitude;
- (double)rotationMagnitude;
- (float)accelerationThreshold;
- (float)rotationThreshold;
- (void)dealloc;
- (void)setAccelerationThreshold:(float)a3;
- (void)setMotion:(id)a3;
- (void)setRotationThreshold:(float)a3;
- (void)start;
- (void)stop;
@end

@implementation MotionDetector

- (MotionDetector)init
{
  v11.receiver = self;
  v11.super_class = (Class)MotionDetector;
  v2 = [(MotionDetector *)&v11 init];
  v4 = v2;
  if (v2)
  {
    v2->_rotationMagnitude = 0.0;
    v2->_accelerationMagnitude = 0.0;
    LODWORD(v3) = 1120403456;
    [(MotionDetector *)v2 setAccelerationThreshold:v3];
    LODWORD(v5) = 1120403456;
    [(MotionDetector *)v4 setRotationThreshold:v5];
    id v6 = objc_alloc_init(off_1000ED238());
    [(MotionDetector *)v4 setMotion:v6];

    v7 = [(MotionDetector *)v4 motion];
    unsigned int v8 = [v7 isDeviceMotionAvailable];

    if (v8)
    {
      v9 = [(MotionDetector *)v4 motion];
      [v9 setDeviceMotionUpdateInterval:0.0333333333];
    }
  }
  return v4;
}

- (void)start
{
  double v3 = [(MotionDetector *)self motion];
  unsigned __int8 v4 = [v3 isDeviceMotionActive];

  if ((v4 & 1) == 0)
  {
    id v5 = [(MotionDetector *)self motion];
    [v5 startDeviceMotionUpdates];
  }
}

- (void)stop
{
  double v3 = [(MotionDetector *)self motion];
  unsigned int v4 = [v3 isDeviceMotionActive];

  if (v4)
  {
    id v5 = [(MotionDetector *)self motion];
    [v5 stopDeviceMotionUpdates];
  }
  self->_rotationMagnitude = 0.0;
  self->_accelerationMagnitude = 0.0;
}

- (BOOL)isMoving
{
  double v3 = [(MotionDetector *)self motion];
  unsigned int v4 = [v3 isDeviceMotionActive];

  if (!v4) {
    return 0;
  }
  id v5 = [(MotionDetector *)self motion];
  id v6 = [v5 deviceMotion];

  [v6 rotationRate];
  double v8 = v7;
  [v6 rotationRate];
  double v10 = v9;
  [v6 rotationRate];
  double v12 = v11;
  [v6 rotationRate];
  double v14 = v12 * v13 + v8 * v10;
  [v6 rotationRate];
  double v16 = v15;
  [v6 rotationRate];
  double v18 = sqrt(v14 + v16 * v17);
  self->_rotationMagnitude = v18;
  [(MotionDetector *)self rotationThreshold];
  if (v18 <= v19)
  {
    [v6 userAcceleration];
    double v21 = v20;
    [v6 userAcceleration];
    double v23 = v22;
    [v6 userAcceleration];
    double v25 = v24;
    [v6 userAcceleration];
    double v27 = v25 * v26 + v21 * v23;
    [v6 userAcceleration];
    double v29 = v28;
    [v6 userAcceleration];
    double v31 = sqrt(v27 + v29 * v30);
    self->_accelerationMagnitude = v31;
    [(MotionDetector *)self accelerationThreshold];
    double v33 = v32;

    return v31 > v33;
  }

  return 1;
}

- (void)dealloc
{
  double v3 = [(MotionDetector *)self motion];
  [v3 stopDeviceMotionUpdates];

  v4.receiver = self;
  v4.super_class = (Class)MotionDetector;
  [(MotionDetector *)&v4 dealloc];
}

- (float)rotationThreshold
{
  return self->_rotationThreshold;
}

- (void)setRotationThreshold:(float)a3
{
  self->_rotationThreshold = a3;
}

- (float)accelerationThreshold
{
  return self->_accelerationThreshold;
}

- (void)setAccelerationThreshold:(float)a3
{
  self->_accelerationThreshold = a3;
}

- (double)rotationMagnitude
{
  return self->_rotationMagnitude;
}

- (double)accelerationMagnitude
{
  return self->_accelerationMagnitude;
}

- (CMMotionManager)motion
{
  return self->_motion;
}

- (void)setMotion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end