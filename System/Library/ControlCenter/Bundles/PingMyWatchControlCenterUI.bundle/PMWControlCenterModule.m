@interface PMWControlCenterModule
+ (BOOL)isPingMyWatchSupported;
- (BOOL)isSelected;
- (BOOL)pingInProgress;
- (id)iconGlyph;
- (id)selectedColor;
- (void)_pingDevice;
- (void)_playGliphAnimationWithCompletion:(id)a3;
- (void)setPingInProgress:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PMWControlCenterModule

- (BOOL)isSelected
{
  return self->_pingInProgress;
}

- (void)setSelected:(BOOL)a3
{
  if (a3)
  {
    self->_pingInProgress = 1;
    [(PMWControlCenterModule *)self _pingDevice];
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_2B28;
    v4[3] = &unk_41A0;
    objc_copyWeak(&v5, &location);
    [(PMWControlCenterModule *)self _playGliphAnimationWithCompletion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (id)iconGlyph
{
  v2 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:22.0];
  v3 = +[UIImage systemImageNamed:@"applewatch.radiowaves.left.and.right" withConfiguration:v2];

  return v3;
}

- (id)selectedColor
{
  return +[UIColor systemOrangeColor];
}

- (void)_pingDevice
{
  v3 = pmw_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "PMWControlCenterModule: Sending ping to device", buf, 2u);
  }

  v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2CD0;
  block[3] = &unk_4208;
  block[4] = self;
  dispatch_async(v4, block);
}

+ (BOOL)isPingMyWatchSupported
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)qword_8210;
  uint64_t v13 = qword_8210;
  if (!qword_8210)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_32F8;
    v9[3] = &unk_4258;
    v9[4] = &v10;
    sub_32F8((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  v4 = [v3 sharedInstance];
  id v5 = [v4 getActivePairedDevice];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"C5BAD2E8-BB79-4E9E-8A0D-757C60D31053"];
  unsigned __int8 v7 = [v5 supportsCapability:v6];

  return v7;
}

- (void)_playGliphAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSymbolVariableColorEffect effect];
  id v6 = [v5 effectWithCumulative];

  unsigned __int8 v7 = [(PMWControlCenterModule *)self glyphImageView];
  v8 = +[NSSymbolEffectOptions optionsWithRepeatCount:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3108;
  v10[3] = &unk_4230;
  id v11 = v4;
  id v9 = v4;
  [v7 addSymbolEffect:v6 options:v8 animated:1 completion:v10];
}

- (BOOL)pingInProgress
{
  return self->_pingInProgress;
}

- (void)setPingInProgress:(BOOL)a3
{
  self->_pingInProgress = a3;
}

@end