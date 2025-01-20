@interface HUDDurationLayer
- (HUDDurationLayer)init;
- (OS_dispatch_queue)queue;
- (double)hangDuration;
- (double)updateInterval;
- (void)setHangDuration:(double)a3;
- (void)setHangDuration:(double)a3 animated:(BOOL)a4;
- (void)setQueue:(id)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation HUDDurationLayer

- (HUDDurationLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUDDurationLayer;
  v2 = [(HUDDurationLayer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    currentAnimation = v2->_currentAnimation;
    v2->_currentAnimation = 0;

    v3->_updateInterval = 0.05;
    v5 = v3;
  }

  return v3;
}

- (void)setHangDuration:(double)a3 animated:(BOOL)a4
{
  double hangDuration = self->_hangDuration;
  if (hangDuration == a3)
  {
    v6 = sub_100006A20();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10001BB28(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else if (a4)
  {
    if (!self->_currentAnimation)
    {
      v15 = sub_100004C14(hangDuration);
      [(HUDDurationLayer *)self setString:v15];

      v16 = sub_100006A20();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10001BC08(self, v16, a3);
      }

      v17 = +[HUDAnimator sharedAnimator];
      double v18 = self->_hangDuration;
      double updateInterval = self->_updateInterval;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100004FF8;
      v42[3] = &unk_100030640;
      v42[4] = self;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000050F4;
      v41[3] = &unk_100030690;
      v41[4] = self;
      v20 = [v17 beginAnimationFromValue:v42 toValue:v41 duration:v18 updateBlock:a3 completionBlock:updateInterval];
      currentAnimation = self->_currentAnimation;
      self->_currentAnimation = v20;
    }
    self->_double hangDuration = a3;
    v22 = sub_100006A20();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10001BB98(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    v6 = +[HUDAnimator sharedAnimator];
    [v6 updateAnimation:self->_currentAnimation toValue:a3 duration:self->_updateInterval];
  }
  else
  {
    self->_double hangDuration = a3;
    v30 = self->_currentAnimation;
    if (v30)
    {
      self->_currentAnimation = 0;
      v31 = v30;

      v32 = +[HUDAnimator sharedAnimator];
      [v32 endAnimation:v31];

      v33 = sub_100006A20();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_10001BCB8(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }
    +[CATransaction setDisableActions:1];
    v6 = sub_100004C14(a3);
    [(HUDDurationLayer *)self setString:v6];
  }
}

- (double)hangDuration
{
  return self->_hangDuration;
}

- (void)setHangDuration:(double)a3
{
  self->_double hangDuration = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_double updateInterval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_currentAnimation, 0);
}

@end