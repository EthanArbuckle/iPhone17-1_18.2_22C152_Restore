@interface AFUISceneConfiguration
+ (id)defaultSiriSceneConfigurationWithInitialBounds:(CGRect)a3 onDisplay:(id)a4;
+ (id)stringForInvalidationReason:(unint64_t)a3;
- (AFUISceneConfiguration)init;
- (BOOL)cancelSceneLoadingAfterTimeout;
- (BOOL)foreground;
- (CGRect)bounds;
- (CGRect)initialBounds;
- (FBSSceneParameters)sceneParameters;
- (UIEdgeInsets)initialSafeAreaInsets;
- (double)sceneLoadingTimeOutDuration;
- (id)_initWithInitialBounds:(CGRect)a3 displayConfiguration:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)launchIntent;
- (int64_t)preferredDeferralMode;
- (int64_t)userInterfaceStyle;
- (unint64_t)deactivationReasonMask;
- (void)_setupPlatformSpecificDefaultSettings;
- (void)configureMutableSceneSettings:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCancelSceneLoadingAfterTimeout:(BOOL)a3;
- (void)setDeactivationReasonMask:(unint64_t)a3;
- (void)setForeground:(BOOL)a3;
- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setLaunchIntent:(int64_t)a3;
- (void)setPreferredDeferralMode:(int64_t)a3;
- (void)setSceneLoadingTimeOutDuration:(double)a3;
- (void)setSceneParameters:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation AFUISceneConfiguration

- (AFUISceneConfiguration)init
{
  v3 = objc_opt_class();
  v4 = [MEMORY[0x263F3F430] mainConfiguration];
  objc_msgSend(v3, "defaultSiriSceneConfigurationWithInitialBounds:onDisplay:", v4, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  v5 = (AFUISceneConfiguration *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_initWithInitialBounds:(CGRect)a3 displayConfiguration:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  if (!v10)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"AFUISceneConfiguration.m", 38, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)AFUISceneConfiguration;
  v11 = [(AFUISceneConfiguration *)&v29 init];
  v12 = v11;
  if (v11)
  {
    v11->_cancelSceneLoadingAfterTimeout = 1;
    v11->_sceneLoadingTimeOutDuration = 60.0;
    v11->_initialBounds.origin.CGFloat x = x;
    v11->_initialBounds.origin.CGFloat y = y;
    v11->_initialBounds.size.CGFloat width = width;
    v11->_initialBounds.size.CGFloat height = height;
    uint64_t v13 = [v10 copy];
    displayConfiguration = v12->_displayConfiguration;
    v12->_displayConfiguration = (FBSDisplayConfiguration *)v13;

    v12->_foreground = 1;
    *(_OWORD *)&v12->_launchIntent = xmmword_2230F5C90;
    long long v15 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v12->_initialSafeAreaInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v12->_initialSafeAreaInsets.bottom = v15;
    *(_OWORD *)&v12->_userInterfaceStyle = xmmword_2230F5CA0;
    CGFloat v16 = x;
    *(CGFloat *)&long long v15 = y;
    CGFloat v17 = width;
    CGFloat v18 = height;
    if (CGRectEqualToRect(*(CGRect *)((char *)&v15 - 8), *MEMORY[0x263F001A0]))
    {
      [(FBSDisplayConfiguration *)v12->_displayConfiguration bounds];
      CGFloat x = v19;
      CGFloat y = v20;
      CGFloat width = v21;
      CGFloat height = v22;
      v23 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        v24 = v23;
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        v25 = NSStringFromCGRect(v35);
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFUISceneConfiguration _initWithInitialBounds:displayConfiguration:]";
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_error_impl(&dword_223099000, v24, OS_LOG_TYPE_ERROR, "%s #sceneHosting Initializing AFUISceneConfiguration with null bounds, falling back to displayConfiguration's bounds: %@", buf, 0x16u);
LABEL_9:
      }
    }
    else
    {
      v26 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v26;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        v25 = NSStringFromCGRect(v36);
        *(_DWORD *)buf = 136315394;
        v31 = "-[AFUISceneConfiguration _initWithInitialBounds:displayConfiguration:]";
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_impl(&dword_223099000, v24, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Initializing AFUISceneConfiguration using bounds: %@", buf, 0x16u);
        goto LABEL_9;
      }
    }
    v12->_bounds.origin.CGFloat x = x;
    v12->_bounds.origin.CGFloat y = y;
    v12->_bounds.size.CGFloat width = width;
    v12->_bounds.size.CGFloat height = height;
    [(AFUISceneConfiguration *)v12 _setupPlatformSpecificDefaultSettings];
  }

  return v12;
}

- (FBSSceneParameters)sceneParameters
{
  int v3 = [(FBSDisplayConfiguration *)self->_displayConfiguration isCarDisplay];
  v4 = off_264690E48;
  if (!v3) {
    v4 = off_264690DE8;
  }
  v5 = [(__objc2_class *)*v4 specification];
  v6 = (void *)[objc_alloc(MEMORY[0x263F3F768]) initWithSpecification:v5];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__AFUISceneConfiguration_sceneParameters__block_invoke;
  v8[3] = &unk_2646917C0;
  v8[4] = self;
  [v6 updateSettingsWithBlock:v8];

  return (FBSSceneParameters *)v6;
}

uint64_t __41__AFUISceneConfiguration_sceneParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureMutableSceneSettings:a2];
}

- (void)configureMutableSceneSettings:(id)a3
{
  v4 = (void *)MEMORY[0x263F82E88];
  id v17 = a3;
  v5 = [v4 _applicationKeyWindow];
  uint64_t v6 = [v5 interfaceOrientation];

  if ([(FBSDisplayConfiguration *)self->_displayConfiguration isCarDisplay]
    || ([MEMORY[0x263F82670] currentDevice],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 userInterfaceIdiom],
        v7,
        v8 == 2))
  {
    double x = self->_bounds.origin.x;
    double y = self->_bounds.origin.y;
    double width = self->_bounds.size.width;
    double height = self->_bounds.size.height;
  }
  else
  {
    [(FBSDisplayConfiguration *)self->_displayConfiguration bounds];
    double x = v13;
    double y = v14;
    double width = v15;
    double height = v16;
  }
  [v17 setForeground:self->_foreground];
  [v17 setDisplayConfiguration:self->_displayConfiguration];
  [v17 setLevel:0.0];
  [v17 setDeviceOrientationEventsEnabled:0];
  objc_msgSend(v17, "setFrame:", x, y, width, height);
  [v17 setInterfaceOrientation:v6];
  [v17 setUserInterfaceStyle:self->_userInterfaceStyle];
  objc_msgSend(v17, "setSafeAreaInsetsPortrait:", self->_initialSafeAreaInsets.top, self->_initialSafeAreaInsets.left, self->_initialSafeAreaInsets.bottom, self->_initialSafeAreaInsets.right);
  [v17 setDeactivationReasons:self->_deactivationReasonMask];
}

+ (id)stringForInvalidationReason:(unint64_t)a3
{
  if (a3 < 6) {
    return off_2646924D8[a3];
  }
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    +[AFUISceneConfiguration stringForInvalidationReason:](a3, v5);
  }
  return 0;
}

- (void)_setupPlatformSpecificDefaultSettings
{
  int v3 = [MEMORY[0x263F82670] currentDevice];
  unint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 2)
  {
    *(_WORD *)&self->_foreground = 0;
    self->_launchIntent = 3;
    int64_t v5 = 1;
  }
  else
  {
    if (v4 > 1) {
      return;
    }
    int64_t v5 = 2;
  }
  self->_preferredDeferralMode = v5;
}

+ (id)defaultSiriSceneConfigurationWithInitialBounds:(CGRect)a3 onDisplay:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInitialBounds:displayConfiguration:", v8, x, y, width, height);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithInitialBounds:displayConfiguration:", self->_displayConfiguration, self->_initialBounds.origin.x, self->_initialBounds.origin.y, self->_initialBounds.size.width, self->_initialBounds.size.height);
  [v4 setForeground:self->_foreground];
  [v4 setLaunchIntent:self->_launchIntent];
  [v4 setPreferredDeferralMode:self->_preferredDeferralMode];
  [v4 setSceneLoadingTimeOutDuration:self->_sceneLoadingTimeOutDuration];
  [v4 setCancelSceneLoadingAfterTimeout:self->_cancelSceneLoadingAfterTimeout];
  [v4 setUserInterfaceStyle:self->_userInterfaceStyle];
  int64_t v5 = (void *)[(FBSSceneParameters *)self->_sceneParameters copy];
  [v4 setSceneParameters:v5];

  objc_msgSend(v4, "setInitialSafeAreaInsets:", self->_initialSafeAreaInsets.top, self->_initialSafeAreaInsets.left, self->_initialSafeAreaInsets.bottom, self->_initialSafeAreaInsets.right);
  [v4 setDeactivationReasonMask:self->_deactivationReasonMask];
  return v4;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)AFUISceneConfiguration;
  int v3 = [(AFUISceneConfiguration *)&v10 description];
  unint64_t v4 = NSStringFromBOOL();
  int64_t v5 = NSStringFromCGRect(self->_bounds);
  uint64_t v6 = NSStringFromUIEdgeInsets(self->_initialSafeAreaInsets);
  v7 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  id v8 = [v3 stringByAppendingFormat:@", foreground: %@, bounds: %@, safeAreaInsets: %@, deactivationReasonMask: %@", v4, v5, v6, v7];

  return v8;
}

- (BOOL)foreground
{
  return self->_foreground;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (int64_t)launchIntent
{
  return self->_launchIntent;
}

- (void)setLaunchIntent:(int64_t)a3
{
  self->_launchIntent = a3;
}

- (int64_t)preferredDeferralMode
{
  return self->_preferredDeferralMode;
}

- (void)setPreferredDeferralMode:(int64_t)a3
{
  self->_preferredDeferralMode = a3;
}

- (BOOL)cancelSceneLoadingAfterTimeout
{
  return self->_cancelSceneLoadingAfterTimeout;
}

- (void)setCancelSceneLoadingAfterTimeout:(BOOL)a3
{
  self->_cancelSceneLoadingAfterTimeout = a3;
}

- (double)sceneLoadingTimeOutDuration
{
  return self->_sceneLoadingTimeOutDuration;
}

- (void)setSceneLoadingTimeOutDuration:(double)a3
{
  self->_sceneLoadingTimeOutDuration = a3;
}

- (CGRect)initialBounds
{
  double x = self->_initialBounds.origin.x;
  double y = self->_initialBounds.origin.y;
  double width = self->_initialBounds.size.width;
  double height = self->_initialBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsets
{
  double top = self->_initialSafeAreaInsets.top;
  double left = self->_initialSafeAreaInsets.left;
  double bottom = self->_initialSafeAreaInsets.bottom;
  double right = self->_initialSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_initialSafeAreaInsets = a3;
}

- (void)setSceneParameters:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (unint64_t)deactivationReasonMask
{
  return self->_deactivationReasonMask;
}

- (void)setDeactivationReasonMask:(unint64_t)a3
{
  self->_deactivationReasonMask = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneParameters, 0);

  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

+ (void)stringForInvalidationReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "+[AFUISceneConfiguration stringForInvalidationReason:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s unknown invalidation reason: %li", (uint8_t *)&v2, 0x16u);
}

@end