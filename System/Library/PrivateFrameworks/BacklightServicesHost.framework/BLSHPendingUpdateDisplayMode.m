@interface BLSHPendingUpdateDisplayMode
+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4;
+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4 withPendingOperation:(id)a5 abandonedInProgressOperation:(id)a6 isNullOperationAllowed:(BOOL)a7;
- (BLSHPendingDirectRampDisplayMode)rampOperation;
- (BLSHPendingUpdateDisplayMode)inProgressOperation;
- (BLSHPendingUpdateDisplayMode)initWithCurrentDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4;
- (BOOL)isCompleted;
- (BOOL)isDirectRamp;
- (BOOL)isStarted;
- (BOOL)isStartedButIncomplete;
- (BOOL)isTwoPhaseUpdate;
- (NSString)description;
- (int64_t)currentDisplayMode;
- (int64_t)targetDisplayMode;
- (int64_t)type;
- (void)setCompleted:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation BLSHPendingUpdateDisplayMode

+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4 withPendingOperation:(id)a5 abandonedInProgressOperation:(id)a6 isNullOperationAllowed:(BOOL)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __166__BLSHPendingUpdateDisplayMode_operationForUpdateFromCurrentDisplayMode_toTargetDisplayMode_withPendingOperation_abandonedInProgressOperation_isNullOperationAllowed___block_invoke;
  v30[3] = &__block_descriptor_40_e38_B16__0__BLSHPendingUpdateDisplayMode_8l;
  v30[4] = a4;
  v13 = (unsigned int (**)(void, void))MEMORY[0x223C5E2B0](v30);
  if (((unsigned int (**)(void, id))v13)[2](v13, v11))
  {
    v14 = bls_backlight_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:]((uint64_t)v11, v14);
    }

    v15 = (BLSHPendingDirectRampDisplayMode *)v11;
LABEL_9:
    v17 = v15;
    goto LABEL_36;
  }
  if (((unsigned int (**)(void, id))v13)[2](v13, v12))
  {
    v16 = bls_backlight_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:toTargetDisplayMode:withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:]((uint64_t)v12, v16);
    }

    v15 = (BLSHPendingDirectRampDisplayMode *)v12;
    goto LABEL_9;
  }
  BOOL v18 = IsDisplayModeTransitionToAlwaysOn(a3, a4);
  int v19 = IsDisplayModeTransitionToActiveOn(a3, a4);
  v20 = [v11 inProgressOperation];
  if (v20)
  {
    v21 = bls_backlight_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v29 = NSStringFromBLSBacklightDisplayMode(a4);
      uint64_t v27 = NSStringFromBLSBacklightDisplayMode(a3);
      *(_DWORD *)buf = 138543874;
      v32 = v20;
      __int16 v33 = 2114;
      v34 = v29;
      __int16 v35 = 2114;
      uint64_t v36 = v27;
      v28 = (void *)v27;
      _os_log_debug_impl(&dword_21FCFC000, v21, OS_LOG_TYPE_DEBUG, "TSM: pendingIsStartedButIncomplete: %{public}@ targetDisplayMode:%{public}@ currentDisplayMode:%{public}@", buf, 0x20u);
    }
    uint64_t v22 = [v20 currentDisplayMode];
    if (v18 && IsDisplayModeTransitionToAlwaysOn(v22, [v20 targetDisplayMode]))
    {
      a3 = v22;
    }
    else if (v19 && IsDisplayModeTransitionToActiveOn(v22, [v20 targetDisplayMode]))
    {
      a3 = v22;
    }
  }
  else if (a3 == a4 && a7)
  {
    v17 = 0;
    goto LABEL_35;
  }
  if (IsActiveOnBrightnessForBLSBacklightDisplayMode(a4)
    && IsAlwaysOnBrightnessForBLSBacklightDisplayMode(a3))
  {
    v23 = [[BLSHPendingDirectRampDisplayMode alloc] initWithRampBeginDisplayMode:3 targetDisplayMode:4];
    p_super = &v23->super;
    if (a3 == 3)
    {
      v17 = v23;
LABEL_34:

      goto LABEL_35;
    }
    v25 = [(BLSHPendingUpdateDisplayMode *)[BLSHPendingTwoPhaseUpdateDisplayMode alloc] initWithCurrentDisplayMode:a3 targetDisplayMode:3];
    v17 = (BLSHPendingDirectRampDisplayMode *)v25;
LABEL_33:
    -[BLSHPendingTwoPhaseUpdateDisplayMode setNext:](v25, "setNext:", p_super, v29);
    [(BLSHPendingTwoPhaseUpdateDisplayMode *)p_super setPrevious:v17];
    goto LABEL_34;
  }
  if (IsActiveOnBrightnessForBLSBacklightDisplayMode(a3)
    && IsAlwaysOnBrightnessForBLSBacklightDisplayMode(a4))
  {
    v17 = [[BLSHPendingDirectRampDisplayMode alloc] initWithRampBeginDisplayMode:4 targetDisplayMode:3];
    if (a4 != 3)
    {
      p_super = [(BLSHPendingUpdateDisplayMode *)[BLSHPendingTwoPhaseUpdateDisplayMode alloc] initWithCurrentDisplayMode:3 targetDisplayMode:a4];
      v25 = &v17->super;
      goto LABEL_33;
    }
  }
  else
  {
    v17 = [[BLSHPendingUpdateDisplayMode alloc] initWithCurrentDisplayMode:a3 targetDisplayMode:a4];
  }
LABEL_35:

LABEL_36:

  return v17;
}

BOOL __166__BLSHPendingUpdateDisplayMode_operationForUpdateFromCurrentDisplayMode_toTargetDisplayMode_withPendingOperation_abandonedInProgressOperation_isNullOperationAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 && ([v3 isFullyCompleted] & 1) == 0)
  {
    v6 = [v4 last];
    BOOL v5 = [v6 targetDisplayMode] == *(void *)(a1 + 32);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)operationForUpdateFromCurrentDisplayMode:(int64_t)a3 toTargetDisplayMode:(int64_t)a4
{
  return +[BLSHPendingUpdateDisplayMode operationForUpdateFromCurrentDisplayMode:a3 toTargetDisplayMode:a4 withPendingOperation:0 abandonedInProgressOperation:0 isNullOperationAllowed:0];
}

- (BLSHPendingUpdateDisplayMode)initWithCurrentDisplayMode:(int64_t)a3 targetDisplayMode:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BLSHPendingUpdateDisplayMode;
  result = [(BLSHPendingUpdateDisplayMode *)&v7 init];
  if (result)
  {
    result->_currentDisplayMode = a3;
    result->_targetDisplayMode = a4;
  }
  return result;
}

- (BLSHPendingUpdateDisplayMode)inProgressOperation
{
  if ([(BLSHPendingUpdateDisplayMode *)self isStarted]
    && ![(BLSHPendingUpdateDisplayMode *)self isCompleted])
  {
    id v3 = self;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isStartedButIncomplete
{
  v2 = [(BLSHPendingUpdateDisplayMode *)self inProgressOperation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isTwoPhaseUpdate
{
  return 0;
}

- (BOOL)isDirectRamp
{
  return 0;
}

- (BLSHPendingDirectRampDisplayMode)rampOperation
{
  return 0;
}

- (int64_t)type
{
  return 4;
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isStarted](self, "isStarted"), @"started");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), @"completed");
  v6 = NSStringFromBLSBacklightDisplayMode(self->_targetDisplayMode);
  [v3 appendString:v6 withName:@"target"];

  objc_super v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (int64_t)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (int64_t)targetDisplayMode
{
  return self->_targetDisplayMode;
}

+ (void)operationForUpdateFromCurrentDisplayMode:(uint64_t)a1 toTargetDisplayMode:(NSObject *)a2 withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "TSM: using existing pending:%{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)operationForUpdateFromCurrentDisplayMode:(uint64_t)a1 toTargetDisplayMode:(NSObject *)a2 withPendingOperation:abandonedInProgressOperation:isNullOperationAllowed:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "TSM: reusing abandoned:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end