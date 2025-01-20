@interface FBSSceneSettings(BacklightServices)
- (id)bls_presentationDate;
- (id)bls_visualState;
- (uint64_t)bls_hasUnrestrictedFramerateUpdates;
- (uint64_t)bls_isAlwaysOnEnabledForEnvironment;
- (uint64_t)bls_isBlanked;
- (uint64_t)bls_isDelegateActive;
- (uint64_t)bls_isLiveUpdating;
- (uint64_t)bls_renderSeed;
- (void)bls_presentationDate;
- (void)bls_renderSeed;
- (void)bls_visualState;
@end

@implementation FBSSceneSettings(BacklightServices)

- (id)bls_visualState
{
  v1 = [a1 otherSettings];
  v2 = [v1 objectForSetting:200002];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = v6;
  }
  else if (v4)
  {
    v8 = bls_scenes_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(FBSSceneSettings(BacklightServices) *)(uint64_t)v4 bls_visualState];
    }
  }

  return v6;
}

- (uint64_t)bls_isDelegateActive
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200000];

  return v2;
}

- (uint64_t)bls_isBlanked
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200001];

  return v2;
}

- (id)bls_presentationDate
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:200003];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = v6;
  }
  else if (v4)
  {
    v8 = bls_scenes_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(FBSSceneSettings(BacklightServices) *)(uint64_t)v4 bls_presentationDate];
    }
  }

  return v6;
}

- (uint64_t)bls_isAlwaysOnEnabledForEnvironment
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200004];

  return v2;
}

- (uint64_t)bls_renderSeed
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:200005];

  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 unsignedLongLongValue];
  }
  else
  {
    if (v4)
    {
      v8 = bls_scenes_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(FBSSceneSettings(BacklightServices) *)(uint64_t)v4 bls_renderSeed];
      }
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)bls_isLiveUpdating
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200006];

  return v2;
}

- (uint64_t)bls_hasUnrestrictedFramerateUpdates
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 BOOLForSetting:200007];

  return v2;
}

- (void)bls_visualState
{
}

- (void)bls_presentationDate
{
}

- (void)bls_renderSeed
{
}

@end