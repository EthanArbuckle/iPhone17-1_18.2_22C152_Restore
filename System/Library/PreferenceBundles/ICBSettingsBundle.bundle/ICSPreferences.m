@interface ICSPreferences
+ (id)sharedPreferences;
- (BOOL)automaticDrawerHidingDisabled;
- (BOOL)forceBlurCurrentPoster;
- (BOOL)forceBlurNewPoster;
- (BOOL)hasAdoptedModernInCallAPI;
- (BOOL)hasBannersEnabled;
- (BOOL)hasUserScoreFeedbackViewHidden;
- (BOOL)shouldMakeFakeSOSCall;
- (ICSPreferences)init;
- (TUFeatureFlags)featureFlags;
- (id)domain;
- (int64_t)moments;
- (void)setDomain:(id)a3;
- (void)setForceBlurCurrentPoster:(BOOL)a3;
- (void)setForceBlurNewPoster:(BOOL)a3;
- (void)setHasBannersEnabled:(BOOL)a3;
- (void)setHasUserScoreFeedbackViewHidden:(BOOL)a3;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4;
@end

@implementation ICSPreferences

+ (id)sharedPreferences
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_41AC;
  block[3] = &unk_8248;
  block[4] = a1;
  if (qword_C940 != -1) {
    dispatch_once(&qword_C940, block);
  }
  v2 = (void *)qword_C938;

  return v2;
}

- (ICSPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICSPreferences;
  v2 = [(ICSPreferences *)&v6 init];
  if (v2)
  {
    v3 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;
  }
  return v2;
}

- (id)domain
{
  domain = self->_domain;
  if (!domain)
  {
    self->_domain = (NSString *)@"com.apple.InCallService";

    domain = self->_domain;
  }

  return domain;
}

- (BOOL)hasBannersEnabled
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    LOBYTE(v3) = [(PHPreferences *)self BOOLForKey:@"CleethorpesEnabled" defaultValue:1];
  }
  return v3;
}

- (void)setHasBannersEnabled:(BOOL)a3
{
}

- (BOOL)hasAdoptedModernInCallAPI
{
  return _os_feature_enabled_impl();
}

- (BOOL)automaticDrawerHidingDisabled
{
  return [(PHPreferences *)self BOOLForKey:@"disableAutomaticDrawerHiding" defaultValue:0];
}

- (BOOL)hasUserScoreFeedbackViewHidden
{
  if (!_TUIsInternalInstall()) {
    return 1;
  }

  return [(PHPreferences *)self BOOLForKey:@"UserScoreFeedbackViewHidden" defaultValue:0];
}

- (void)setHasUserScoreFeedbackViewHidden:(BOOL)a3
{
}

- (int64_t)moments
{
  int v3 = NSStringFromSelector("moments");
  int64_t v4 = [(PHPreferences *)self unsignedIntegerForKey:v3 defaultValue:0];

  return v4;
}

- (BOOL)forceBlurCurrentPoster
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    LOBYTE(v3) = [(PHPreferences *)self BOOLForKey:@"BlurCurrentPoster" defaultValue:0];
  }
  return v3;
}

- (BOOL)forceBlurNewPoster
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    LOBYTE(v3) = [(PHPreferences *)self BOOLForKey:@"BlurNewPoster" defaultValue:0];
  }
  return v3;
}

- (BOOL)shouldMakeFakeSOSCall
{
  int v3 = _TUIsInternalInstall();
  if (v3)
  {
    LOBYTE(v3) = [(PHPreferences *)self BOOLForKey:@"ShouldMakeFakeSOSCall" defaultValue:0];
  }
  return v3;
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICSPreferences;
  id v6 = a4;
  id v7 = a3;
  [(PHPreferences *)&v10 setPreferencesValue:v7 forKey:v6];
  id v11 = v6;
  id v12 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v9 = +[NSNotificationCenter defaultCenter];

  [v9 postNotificationName:@"ICSPreferencesDidChangeNotification" object:self userInfo:v8];
}

- (void)setDomain:(id)a3
{
}

- (void)setForceBlurCurrentPoster:(BOOL)a3
{
  self->_forceBlurCurrentPoster = a3;
}

- (void)setForceBlurNewPoster:(BOOL)a3
{
  self->_forceBlurNewPoster = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end