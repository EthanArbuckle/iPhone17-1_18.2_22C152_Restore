@interface FBSSceneSettingsCore
+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4;
+ (id)protocol;
- (BOOL)isClientFuture;
- (BOOL)isForeground;
- (BOOL)isOccluded;
- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground;
- (BSKeyedSettings)propagatedSettings;
- (CGRect)frame;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSceneClientProcess)clientProcess;
- (char)activityMode;
- (char)jetsamMode;
- (double)level;
- (int64_t)interfaceOrientation;
- (int64_t)interruptionPolicy;
- (void)frame:(CGRect)a3;
- (void)setActivityMode:(char)a3;
- (void)setClientFuture:(BOOL)a3;
- (void)setClientProcess:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterruptionPolicy:(int64_t)a3;
- (void)setJetsamMode:(char)a3;
- (void)setLevel:(double)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setPrefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a3;
- (void)setPropagatedSettings:(id)a3;
@end

@implementation FBSSceneSettingsCore

- (void)frame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = [MEMORY[0x1E4F29238] valueWithBytes:&v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    CGRect v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"displayConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneSettingsCore setDisplayConfiguration:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = v5;
  [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (a3)
  {
    [NSNumber numberWithInteger:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:");
  }
}

- (int64_t)interfaceOrientation
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (CGRect)frame
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  int64_t v3 = v2;
  long long v9 = 0u;
  long long v10 = 0u;
  if (v2)
  {
    id v4 = v2;
    if (!strcmp((const char *)[v4 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}")) {
      [v4 getValue:&v9 size:32];
    }
  }

  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  double v8 = *((double *)&v10 + 1);
  double v7 = *(double *)&v10;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)isForeground
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (id)protocol
{
  return &unk_1EED46F48;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  uint64_t v4 = objc_opt_class();

  return (FBSDisplayConfiguration *)[(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:v4];
}

- (double)level
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  [v2 bs_CGFloatValue];
  double v4 = v3;

  return v4;
}

- (BOOL)isOccluded
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (char)activityMode
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 integerValue];

  return v3;
}

- (char)jetsamMode
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 integerValue];

  return v3;
}

- (BOOL)prefersProcessTaskSuspensionWhileSceneForeground
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)interruptionPolicy
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BSKeyedSettings)propagatedSettings
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  if ([v2 isEmpty])
  {
    id v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1CA80] set];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__FBSSceneSettingsCore_propagatedSettings__block_invoke;
    v6[3] = &unk_1E58F5C90;
    id v3 = v4;
    id v7 = v3;
    [v2 enumerateKeyedObjectsWithBlock:v6];
  }

  return (BSKeyedSettings *)v3;
}

- (void)setForeground:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneSettingsCore *)self setValue:v3 forProperty:a2];
}

- (void)setJetsamMode:(char)a3
{
  if (a3)
  {
    [NSNumber numberWithChar:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
  }
  else
  {
    [(FBSSceneSettingsCore *)self setValue:0 forProperty:a2];
  }
}

- (BOOL)isClientFuture
{
  v2 = [(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setLevel:(double)a3
{
}

- (void)setInterruptionPolicy:(int64_t)a3
{
  if (a3)
  {
    [NSNumber numberWithInteger:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
  }
  else
  {
    -[FBSSceneSettingsCore setValue:forProperty:](self, "setValue:forProperty:");
  }
}

+ (id)descriptionOfValue:(id)a3 forSetting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 matchesProperty:sel_activityMode])
  {
    char v8 = [v6 integerValue];
    long long v9 = NSString;
    uint64_t v10 = NSStringFromFBSSceneActivityMode(v8);
LABEL_5:
    v11 = (void *)v10;
    [v9 stringWithFormat:@"%@ (%d)", v10, v8];
    v12 = LABEL_6:;
LABEL_7:

    goto LABEL_8;
  }
  if ([v7 matchesProperty:sel_jetsamMode])
  {
    char v8 = [v6 integerValue];
    long long v9 = NSString;
    uint64_t v10 = NSStringFromFBSSceneJetsamMode(v8);
    goto LABEL_5;
  }
  if ([v7 matchesProperty:sel_interfaceOrientation])
  {
    [v6 integerValue];
    BSInterfaceOrientationDescription();
  }
  if ([v7 matchesProperty:sel_interruptionPolicy])
  {
    unint64_t v14 = [v6 integerValue];
    v15 = NSString;
    v11 = NSStringFromFBSSceneInterruptionPolicy(v14);
    [v15 stringWithFormat:@"%@ (%ld)", v11, v14];
    goto LABEL_6;
  }
  if ([v7 matchesProperty:sel_propagatedSettings])
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v6;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    v11 = [v19 allKeys];

    v20 = [v11 allObjects];
    v12 = [v20 componentsJoinedByString:@", "];

    goto LABEL_7;
  }
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___FBSSceneSettingsCore;
  v12 = [super descriptionOfValue:v6 forSetting:v7];
LABEL_8:

  return v12;
}

uint64_t __42__FBSSceneSettingsCore_propagatedSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:];
}

- (void)setPropagatedSettings:(id)a3
{
  id v5 = a3;
  [(FBSSceneSettingsCore *)self setValue:0 forProperty:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FBSSceneSettingsCore_setPropagatedSettings___block_invoke;
  v6[3] = &unk_1E58F5CB8;
  void v6[4] = self;
  [v5 enumerateKeyedObjectsWithBlock:v6];
}

uint64_t __46__FBSSceneSettingsCore_setPropagatedSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addPropagatedSetting];
}

- (void)setOccluded:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneSettingsCore *)self setValue:v3 forProperty:a2];
}

- (void)setClientFuture:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneSettingsCore *)self setValue:v3 forProperty:a2];
}

- (void)setActivityMode:(char)a3
{
  if (a3)
  {
    [NSNumber numberWithChar:];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(FBSSceneSettingsCore *)self setValue:v5 forProperty:a2];
  }
  else
  {
    [(FBSSceneSettingsCore *)self setValue:0 forProperty:a2];
  }
}

- (void)setPrefersProcessTaskSuspensionWhileSceneForeground:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneSettingsCore *)self setValue:v3 forProperty:a2];
}

- (FBSceneClientProcess)clientProcess
{
  uint64_t v4 = objc_opt_class();

  return (FBSceneClientProcess *)[(FBSSceneSettingsCore *)self valueForProperty:a2 expectedClass:v4];
}

- (void)setClientProcess:(id)a3
{
}

- (void)setDisplayConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end