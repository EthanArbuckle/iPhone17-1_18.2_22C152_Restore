@interface DAOrientationDetector
- (CMMotionManager)motionManager;
- (DAOrientationDetector)initWithxThreshold:(id)a3 zThreshold:(id)a4;
- (NSNumber)xThreshold;
- (NSNumber)yThreshold;
- (NSNumber)zThreshold;
- (void)setMotionManager:(id)a3;
- (void)setXThreshold:(id)a3;
- (void)setYThreshold:(id)a3;
- (void)setZThreshold:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DAOrientationDetector

- (DAOrientationDetector)initWithxThreshold:(id)a3 zThreshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DAOrientationDetector;
  v8 = [(DAOrientationDetector *)&v16 init];
  if (v8)
  {
    [v6 doubleValue];
    if (v9 == 0.0)
    {
      v10 = +[NSNumber numberWithDouble:0.4];
    }
    else
    {
      v10 = (NSNumber *)v6;
    }
    xThreshold = v8->_xThreshold;
    v8->_xThreshold = v10;

    [v7 doubleValue];
    if (v12 == 0.0)
    {
      v13 = +[NSNumber numberWithDouble:0.4];
    }
    else
    {
      v13 = (NSNumber *)v7;
    }
    zThreshold = v8->_zThreshold;
    v8->_zThreshold = v13;
  }
  return v8;
}

- (void)start
{
  id v3 = objc_alloc_init((Class)CMMotionManager);
  [(DAOrientationDetector *)self setMotionManager:v3];

  v4 = [(DAOrientationDetector *)self motionManager];
  unsigned int v5 = [v4 isAccelerometerAvailable];

  if (v5)
  {
    id v6 = [(DAOrientationDetector *)self motionManager];
    [v6 setAccelerometerUpdateInterval:0.01];

    id v7 = [(DAOrientationDetector *)self motionManager];
    id v8 = objc_alloc_init((Class)NSOperationQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002D60;
    v9[3] = &unk_100010458;
    v9[4] = self;
    [v7 startAccelerometerUpdatesToQueue:v8 withHandler:v9];
  }
}

- (void)stop
{
  id v3 = [(DAOrientationDetector *)self motionManager];

  if (v3)
  {
    v4 = [(DAOrientationDetector *)self motionManager];
    unsigned int v5 = [v4 isAccelerometerActive];

    if (v5)
    {
      id v6 = [(DAOrientationDetector *)self motionManager];
      [v6 stopAccelerometerUpdates];
    }
    [(DAOrientationDetector *)self setMotionManager:0];
  }
}

- (NSNumber)xThreshold
{
  return self->_xThreshold;
}

- (void)setXThreshold:(id)a3
{
}

- (NSNumber)yThreshold
{
  return self->_yThreshold;
}

- (void)setYThreshold:(id)a3
{
}

- (NSNumber)zThreshold
{
  return self->_zThreshold;
}

- (void)setZThreshold:(id)a3
{
}

- (CMMotionManager)motionManager
{
  return self->_motionManager;
}

- (void)setMotionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_zThreshold, 0);
  objc_storeStrong((id *)&self->_yThreshold, 0);

  objc_storeStrong((id *)&self->_xThreshold, 0);
}

@end