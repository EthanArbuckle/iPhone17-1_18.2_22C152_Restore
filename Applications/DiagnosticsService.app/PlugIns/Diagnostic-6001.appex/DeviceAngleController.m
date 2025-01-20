@interface DeviceAngleController
- (CMMotionManager)motionManager;
- (id)readDeviceAnglesFrom:(id)a3;
- (void)setMotionManager:(id)a3;
- (void)start;
@end

@implementation DeviceAngleController

- (void)start
{
  id v3 = objc_alloc_init((Class)CMMotionManager);
  [(DeviceAngleController *)self setMotionManager:v3];

  v4 = [(DeviceAngleController *)self motionManager];
  unsigned __int8 v5 = [v4 isDeviceMotionAvailable];

  if (v5)
  {
    v6 = [(DeviceAngleController *)self motionManager];
    [v6 setDeviceMotionUpdateInterval:0.100000001];

    v7 = [(DeviceAngleController *)self motionManager];
    v8 = +[NSOperationQueue mainQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000037AC;
    v10[3] = &unk_100004098;
    v10[4] = self;
    [v7 startDeviceMotionUpdatesToQueue:v8 withHandler:v10];
  }
  else
  {
    v9 = [(DeviceAngleController *)self result];
    [v9 setStatusCode:&off_100004148];

    [(DeviceAngleController *)self setFinished:1];
  }
}

- (id)readDeviceAnglesFrom:(id)a3
{
  v4 = [a3 attitude];
  [v4 roll];
  float v6 = v5 * 57.2957802;
  [v4 pitch];
  float v8 = v7 * 57.2957802;
  [v4 yaw];
  float v10 = v9 * 57.2957802;
  v11 = +[NSString stringWithFormat:@"%f", v8];
  v12 = +[NSString stringWithFormat:@"%f", v6];
  v13 = +[NSString stringWithFormat:@"%f", v10];
  v17[0] = @"pitch";
  v17[1] = @"roll";
  v18[0] = v11;
  v18[1] = v12;
  v17[2] = @"yaw";
  v18[2] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  v15 = [(DeviceAngleController *)self motionManager];
  [v15 stopDeviceMotionUpdates];

  return v14;
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
}

@end