@interface BLSBacklightFBSSceneEnvironment
- (BLSAlwaysOnFrameSpecifier)frameSpecifier;
- (BLSAlwaysOnSession)alwaysOnSession;
- (BLSBacklightFBSSceneEnvironment)initWithFBSScene:(id)a3;
- (BLSBacklightSceneEnvironmentDelegate)delegate;
- (BLSBacklightSceneEnvironmentUpdating)updater;
- (BLSBacklightSceneVisualState)visualState;
- (BOOL)hasUnrestrictedFramerateUpdates;
- (BOOL)isAnimatingVisualState;
- (BOOL)isDelegateActive;
- (BOOL)isDisplayBlanked;
- (BOOL)isLiveUpdating;
- (BOOL)optsOutOfProcessAssertions;
- (BOOL)supportsAlwaysOn;
- (FBSScene)_FBSScene;
- (NSDate)presentationDate;
- (NSString)description;
- (NSString)identifier;
- (id)frameSpecifierForSettings:(id)a1;
- (void)_setFBSScene:(id)a3;
- (void)invalidateAllTimelinesForReason:(id)a3;
- (void)setAlwaysOnSession:(id)a3;
- (void)setAnimatingVisualState:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setOptsOutOfProcessAssertions:(BOOL)a3;
- (void)setSupportsAlwaysOn:(BOOL)a3;
- (void)setUpdater:(id)a3;
@end

@implementation BLSBacklightFBSSceneEnvironment

- (void)invalidateAllTimelinesForReason:(id)a3
{
  id v4 = a3;
  v5 = bls_scenes_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BLSBacklightFBSSceneEnvironment invalidateAllTimelinesForReason:](self);
  }

  v6 = [[BLSInvalidateFrameSpecifiersAction alloc] initWithReason:v4];
  v7 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  [v7 sendActions:v8];
}

- (BLSBacklightSceneEnvironmentDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_delegate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BLSBacklightFBSSceneEnvironment)initWithFBSScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSBacklightFBSSceneEnvironment;
  v5 = [(BLSBacklightFBSSceneEnvironment *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = bls_scenes_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BLSBacklightFBSSceneEnvironment initWithFBSScene:]((uint64_t)v6, v4);
    }

    v8 = [[BLSBacklightSceneEnvironmentUpdater alloc] initWithEnvironment:v6];
    updater = v6->_updater;
    v6->_updater = (BLSBacklightSceneEnvironmentUpdating *)v8;

    [(BLSBacklightFBSSceneEnvironment *)v6 _setFBSScene:v4];
  }

  return v6;
}

- (void)_setFBSScene:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_delegate, a3);
  os_unfair_lock_unlock(&self->_lock);
  v6 = bls_scenes_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = @"NULL";
    }
    v9 = [(BLSBacklightFBSSceneEnvironment *)self identifier];
    *(_DWORD *)buf = 134219010;
    v14 = self;
    __int16 v15 = 2048;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v5 != 0;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1B55DE000, v6, OS_LOG_TYPE_DEFAULT, "%p setDelegate:<%p %{public}@> hasDelegate:%{BOOL}u for environment:%{public}@", buf, 0x30u);
    if (v5) {
  }
    }
  v10 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__BLSBacklightFBSSceneEnvironment_setDelegate___block_invoke;
  v11[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  BOOL v12 = v5 != 0;
  [v10 updateClientSettingsWithBlock:v11];
}

- (void)setSupportsAlwaysOn:(BOOL)a3
{
  id v5 = bls_scenes_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(BLSBacklightFBSSceneEnvironment *)self setSupportsAlwaysOn:v5];
  }

  v6 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BLSBacklightFBSSceneEnvironment_setSupportsAlwaysOn___block_invoke;
  v7[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  BOOL v8 = a3;
  [v6 updateClientSettingsWithBlock:v7];
}

- (NSString)identifier
{
  v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (FBSScene)_FBSScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbsScene);

  return (FBSScene *)WeakRetained;
}

uint64_t __55__BLSBacklightFBSSceneEnvironment_setSupportsAlwaysOn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setSupportsAlwaysOn:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __47__BLSBacklightFBSSceneEnvironment_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setHasDelegate:", *(unsigned __int8 *)(a1 + 32));
}

- (NSString)description
{
  v3 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  id v4 = [v3 settings];
  id v5 = [v3 clientSettings];
  v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7 = [(BLSBacklightFBSSceneEnvironment *)self identifier];
  [v6 appendString:v7 withName:@"identifier"];

  id v8 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_isDelegateActive"), @"active");
  id v9 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[BLSBacklightFBSSceneEnvironment isAnimatingVisualState](self, "isAnimatingVisualState"), @"animatingVisualState", 1);
  id v10 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_isLiveUpdating"), @"liveUpdating");
  id v11 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v4, "bls_hasUnrestrictedFramerateUpdates"), @"unrestrictedFramerate");
  if (objc_msgSend(v5, "bls_supportsAlwaysOn"))
  {
    uint64_t v12 = objc_msgSend(v4, "bls_isAlwaysOnEnabledForEnvironment");
    v13 = @"aoEnabled";
    v14 = v6;
  }
  else
  {
    v13 = @"aoSupport";
    v14 = v6;
    uint64_t v12 = 0;
  }
  id v15 = (id)[v14 appendBool:v12 withName:v13];
  id v16 = objc_msgSend(v4, "bls_visualState");
  id v17 = (id)[v6 appendObject:v16 withName:@"visualState"];

  v18 = objc_msgSend(v4, "bls_presentationDate");
  __int16 v19 = objc_msgSend(v18, "bls_shortLoggingString");
  id v20 = (id)[v6 appendObject:v19 withName:@"presentationDate" skipIfNil:0];

  __int16 v21 = -[BLSBacklightFBSSceneEnvironment frameSpecifierForSettings:](self, v4);
  id v22 = (id)[v6 appendObject:v21 withName:@"frameSpecifier" skipIfNil:1];

  id v23 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", -[BLSBacklightFBSSceneEnvironment optsOutOfProcessAssertions](self, "optsOutOfProcessAssertions"), @"optsOutOfProcessAssertions", 1);
  v24 = [v6 build];

  return (NSString *)v24;
}

- (id)frameSpecifierForSettings:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    v3 = objc_msgSend(a2, "bls_presentationDate");
    id v4 = [v2 alwaysOnSession];
    id v2 = [v4 specifierForPresentationDate:v3];
  }

  return v2;
}

- (BLSBacklightSceneEnvironmentUpdating)updater
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_updater;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setUpdater:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_updater, a3);
  os_unfair_lock_unlock(&self->_lock);
  v6 = bls_scenes_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(BLSBacklightFBSSceneEnvironment *)(uint64_t)self setUpdater:v6];
  }
}

- (BOOL)isDelegateActive
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_isDelegateActive");

  return v4;
}

- (BOOL)isDisplayBlanked
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_isBlanked");

  return v4;
}

- (BLSBacklightSceneVisualState)visualState
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_visualState");

  return (BLSBacklightSceneVisualState *)v4;
}

- (NSDate)presentationDate
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_presentationDate");

  return (NSDate *)v4;
}

- (BLSAlwaysOnFrameSpecifier)frameSpecifier
{
  v3 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  char v4 = [v3 settings];
  id v5 = -[BLSBacklightFBSSceneEnvironment frameSpecifierForSettings:](self, v4);

  return (BLSAlwaysOnFrameSpecifier *)v5;
}

- (BOOL)isLiveUpdating
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_isLiveUpdating");

  return v4;
}

- (BOOL)hasUnrestrictedFramerateUpdates
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 settings];
  char v4 = objc_msgSend(v3, "bls_hasUnrestrictedFramerateUpdates");

  return v4;
}

- (BOOL)supportsAlwaysOn
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 clientSettings];
  char v4 = objc_msgSend(v3, "bls_supportsAlwaysOn");

  return v4;
}

- (BOOL)optsOutOfProcessAssertions
{
  id v2 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v3 = [v2 clientSettings];
  char v4 = objc_msgSend(v3, "bls_optsOutOfProcessAssertions");

  return v4;
}

- (void)setOptsOutOfProcessAssertions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = bls_scenes_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(BLSBacklightFBSSceneEnvironment *)self identifier];
    *(_DWORD *)buf = 134218498;
    id v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = v3;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1B55DE000, v5, OS_LOG_TYPE_INFO, "%p setOptsOutOfProcessAssertions:%{BOOL}u for environment:%{public}@", buf, 0x1Cu);
  }
  v7 = [(BLSBacklightFBSSceneEnvironment *)self _FBSScene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__BLSBacklightFBSSceneEnvironment_setOptsOutOfProcessAssertions___block_invoke;
  v8[3] = &__block_descriptor_33_e39_v16__0__FBSMutableSceneClientSettings_8l;
  BOOL v9 = v3;
  [v7 updateClientSettingsWithBlock:v8];
}

uint64_t __65__BLSBacklightFBSSceneEnvironment_setOptsOutOfProcessAssertions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_setOptsOutOfProcessAssertions:", *(unsigned __int8 *)(a1 + 32));
}

- (BLSAlwaysOnSession)alwaysOnSession
{
  return (BLSAlwaysOnSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAlwaysOnSession:(id)a3
{
}

- (BOOL)isAnimatingVisualState
{
  return self->_animatingVisualState;
}

- (void)setAnimatingVisualState:(BOOL)a3
{
  self->_animatingVisualState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fbsScene);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_alwaysOnSession, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithFBSScene:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  id v2 = [a2 debugDescription];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_1B55DE000, v3, v4, "%p create environment:%@ for scene:%@", v5, v6, v7, v8, 2u);
}

- (void)setUpdater:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1B55DE000, log, OS_LOG_TYPE_DEBUG, "%p setUpdater: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)setSupportsAlwaysOn:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = a2 & 1;
  uint64_t v6 = [a1 identifier];
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v6;
  _os_log_debug_impl(&dword_1B55DE000, a3, OS_LOG_TYPE_DEBUG, "%p setSupportsAlwaysOn:%{BOOL}u for environment:%{public}@", (uint8_t *)&v7, 0x1Cu);
}

- (void)invalidateAllTimelinesForReason:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_0(&dword_1B55DE000, v2, v3, "%p invalidateAllTimelinesForReason:%{public}@ for environment:%{public}@", v4, v5, v6, v7, 2u);
}

@end