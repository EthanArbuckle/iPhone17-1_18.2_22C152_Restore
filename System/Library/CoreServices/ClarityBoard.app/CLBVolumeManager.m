@interface CLBVolumeManager
+ (float)stepAmount;
+ (id)sharedInstance;
- (BOOL)isShowingHUD;
- (CLBVolumeManager)init;
- (NSTimer)debouncerTimer;
- (UIWindow)window;
- (float)volume;
- (void)_decreaseVolume;
- (void)_increaseVolume;
- (void)_resetHUDHiding;
- (void)hideHUD;
- (void)setDebouncerTimer:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWindow:(id)a3;
- (void)showHUDInWindow:(id)a3;
- (void)startDecreasingVolume;
- (void)startIncreasingVolume;
- (void)stopVolumeUpdates;
@end

@implementation CLBVolumeManager

+ (id)sharedInstance
{
  if (qword_100180FB8 != -1) {
    dispatch_once(&qword_100180FB8, &stru_10015BED8);
  }
  v2 = (void *)qword_100180FB0;

  return v2;
}

+ (float)stepAmount
{
  return 0.1;
}

- (CLBVolumeManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLBVolumeManager;
  v2 = [(CLBVolumeManager *)&v5 init];
  if (v2)
  {
    v3 = +[AVSystemController sharedAVSystemController];
    [v3 getActiveCategoryVolume:&v2->_volume andName:0];
  }
  return v2;
}

- (void)startIncreasingVolume
{
  [(CLBVolumeManager *)self _increaseVolume];
  self->_timer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_increaseVolume" selector:0 userInfo:1 repeats:0.5];

  _objc_release_x1();
}

- (void)startDecreasingVolume
{
  [(CLBVolumeManager *)self _decreaseVolume];
  self->_timer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_decreaseVolume" selector:0 userInfo:1 repeats:0.5];

  _objc_release_x1();
}

- (void)stopVolumeUpdates
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)setVolume:(float)a3
{
  float v4 = 1.0;
  if (a3 <= 1.0) {
    float v4 = a3;
  }
  self->_volume = fmaxf(v4, 0.0);
  objc_super v5 = +[AVSystemController sharedAVSystemController];
  id v14 = 0;
  [v5 getActiveCategoryVolume:0 andName:&v14];
  id v6 = v14;
  *(float *)&double v7 = a3;
  [v5 setVolumeTo:v6 forCategory:v7];
  *(float *)&double v8 = a3;
  [v5 setActiveCategoryVolumeTo:v8];
  v15[0] = AVSystemController_EffectiveVolumeNotificationParameter_VolumeChangeReason;
  v15[1] = AVSystemController_EffectiveVolumeNotificationParameter_Category;
  v16[0] = @"ExplicitVolumeChange";
  v16[1] = @"Audio/Video";
  v15[2] = AVSystemController_EffectiveVolumeNotificationParameter_Volume;
  *(float *)&double v9 = a3;
  v10 = +[NSNumber numberWithFloat:v9];
  v16[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 postNotificationName:AVSystemController_EffectiveVolumeDidChangeNotification object:0 userInfo:v11];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:@"CLBVolumeManagerVolumeDidChange" object:0];
}

- (void)_increaseVolume
{
  [(CLBVolumeManager *)self _resetHUDHiding];
  [(CLBVolumeManager *)self volume];
  float v4 = v3;
  +[CLBVolumeManager stepAmount];
  *(float *)&double v5 = v4 + *(float *)&v5;

  [(CLBVolumeManager *)self setVolume:v5];
}

- (void)_decreaseVolume
{
  [(CLBVolumeManager *)self _resetHUDHiding];
  [(CLBVolumeManager *)self volume];
  float v4 = v3;
  +[CLBVolumeManager stepAmount];
  *(float *)&double v5 = v4 - *(float *)&v5;

  [(CLBVolumeManager *)self setVolume:v5];
}

- (float)volume
{
  return self->_volume;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (NSTimer)debouncerTimer
{
  return self->_debouncerTimer;
}

- (void)setDebouncerTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncerTimer, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

- (BOOL)isShowingHUD
{
  v2 = self;
  float v3 = [(CLBVolumeManager *)v2 window];

  if (v3) {
  return v3 != 0;
  }
}

- (void)showHUDInWindow:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100065B08(v4);
}

- (void)hideHUD
{
  v2 = self;
  sub_100065EF0();
}

- (void)_resetHUDHiding
{
  id v6 = self;
  v2 = [(CLBVolumeManager *)v6 debouncerTimer];
  [(NSTimer *)v2 invalidate];

  float v3 = [(CLBVolumeManager *)v6 window];
  if (v3)
  {
    id v4 = (CLBVolumeManager *)v3;
    [(UIWindow *)v3 setAlpha:1.0];

    double v5 = v4;
  }
  else
  {
    double v5 = v6;
  }
}

@end