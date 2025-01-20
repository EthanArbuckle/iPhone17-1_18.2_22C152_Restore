@interface FBSProcessExecutionStrategy
+ (id)background;
+ (id)backgroundWithUI;
+ (id)policyWithReason:(unsigned int)a3 flags:(unsigned int)a4;
+ (id)strategyForSchedulingPolicy:(int64_t)a3 graphicsPolicy:(int64_t)a4 jetsamPolicy:(int64_t)a5;
+ (id)userInteractive;
+ (id)userInteractiveWithoutUI;
+ (void)initialize;
- (BOOL)isCustomPolicy;
- (NSString)debugDescription;
- (NSString)strategyName;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)graphicsPolicy;
- (int64_t)jetsamPolicy;
- (int64_t)schedulingPolicy;
- (unsigned)flags;
- (unsigned)reason;
- (void)setCustomPolicy:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGraphicsPolicy:(int64_t)a3;
- (void)setJetsamPolicy:(int64_t)a3;
- (void)setReason:(unsigned int)a3;
- (void)setSchedulingPolicy:(int64_t)a3;
- (void)setStrategyName:(id)a3;
@end

@implementation FBSProcessExecutionStrategy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    BSSelfTaskHasEntitlement();
  }
}

+ (id)userInteractive
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FBSProcessExecutionStrategy_userInteractive__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userInteractive_onceToken != -1) {
    dispatch_once(&userInteractive_onceToken, block);
  }
  v2 = (void *)userInteractive___UIPolicy;

  return v2;
}

uint64_t __46__FBSProcessExecutionStrategy_userInteractive__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) strategyForSchedulingPolicy:2 graphicsPolicy:1 jetsamPolicy:1];
  v2 = (void *)userInteractive___UIPolicy;
  userInteractive___UIPolicy = v1;

  v3 = (void *)userInteractive___UIPolicy;

  return [v3 setStrategyName:@"UserInteractive"];
}

+ (id)userInteractiveWithoutUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__FBSProcessExecutionStrategy_userInteractiveWithoutUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userInteractiveWithoutUI_onceToken != -1) {
    dispatch_once(&userInteractiveWithoutUI_onceToken, block);
  }
  v2 = (void *)userInteractiveWithoutUI___UINoGPUPolicy;

  return v2;
}

uint64_t __55__FBSProcessExecutionStrategy_userInteractiveWithoutUI__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) strategyForSchedulingPolicy:2 graphicsPolicy:0 jetsamPolicy:1];
  v2 = (void *)userInteractiveWithoutUI___UINoGPUPolicy;
  userInteractiveWithoutUI___UINoGPUPolicy = v1;

  v3 = (void *)userInteractiveWithoutUI___UINoGPUPolicy;

  return [v3 setStrategyName:@"UserInteractiveWithoutUI"];
}

+ (id)backgroundWithUI
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__FBSProcessExecutionStrategy_backgroundWithUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (backgroundWithUI_onceToken != -1) {
    dispatch_once(&backgroundWithUI_onceToken, block);
  }
  v2 = (void *)backgroundWithUI___BGUIPolicy;

  return v2;
}

uint64_t __47__FBSProcessExecutionStrategy_backgroundWithUI__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) strategyForSchedulingPolicy:1 graphicsPolicy:1 jetsamPolicy:0];
  v2 = (void *)backgroundWithUI___BGUIPolicy;
  backgroundWithUI___BGUIPolicy = v1;

  v3 = (void *)backgroundWithUI___BGUIPolicy;

  return [v3 setStrategyName:@"BackgroundWithUI"];
}

+ (id)background
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__FBSProcessExecutionStrategy_background__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (background_onceToken != -1) {
    dispatch_once(&background_onceToken, block);
  }
  v2 = (void *)background___BGPolicy;

  return v2;
}

uint64_t __41__FBSProcessExecutionStrategy_background__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) strategyForSchedulingPolicy:1 graphicsPolicy:0 jetsamPolicy:0];
  v2 = (void *)background___BGPolicy;
  background___BGPolicy = v1;

  v3 = (void *)background___BGPolicy;

  return [v3 setStrategyName:@"Background"];
}

+ (id)strategyForSchedulingPolicy:(int64_t)a3 graphicsPolicy:(int64_t)a4 jetsamPolicy:(int64_t)a5
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setSchedulingPolicy:a3];
  [v8 setGraphicsPolicy:a4];
  [v8 setJetsamPolicy:a5];
  if (a3 < 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    if (a5 == 1)
    {
      BOOL v9 = __CanTakeWorkspaceAssertions == 0;
      unsigned int v10 = 10000;
      unsigned int v11 = 9;
    }
    else
    {
      BOOL v9 = __CanTakeSystemAppAssertions == 0;
      unsigned int v10 = 10004;
      unsigned int v11 = 4;
    }
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v10;
    }
  }
  unsigned int v13 = a3 > 0;
  if (a3 > 1) {
    v13 |= 2u;
  }
  if (a4 > 0) {
    v13 |= 0x20u;
  }
  if (a5 <= 0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v13 | 8;
  }
  [v8 setReason:v12];
  [v8 setFlags:v14];
  [v8 setCustomPolicy:0];

  return v8;
}

+ (id)policyWithReason:(unsigned int)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = objc_alloc_init((Class)a1);
  [v6 setFlags:v4];
  [v6 setReason:v5];
  [v6 setCustomPolicy:1];

  return v6;
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSProcessExecutionStrategy *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSProcessExecutionStrategy *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  uint64_t v4 = v3;
  if (self->_strategyName) {
    strategyName = (__CFString *)self->_strategyName;
  }
  else {
    strategyName = @"Custom";
  }
  id v6 = (id)[v3 appendObject:strategyName withName:@"strategyName"];
  if (![(FBSProcessExecutionStrategy *)self isCustomPolicy])
  {
    unint64_t schedulingPolicy = self->_schedulingPolicy;
    id v8 = @"(unknown)";
    if (schedulingPolicy <= 2) {
      id v8 = off_1E58F6910[schedulingPolicy];
    }
    id v9 = (id)[v4 appendObject:v8 withName:@"scheduling"];
    int64_t graphicsPolicy = self->_graphicsPolicy;
    unsigned int v11 = @"full";
    if (graphicsPolicy != 1) {
      unsigned int v11 = @"(unknown)";
    }
    if (graphicsPolicy) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = @"none";
    }
    id v13 = (id)[v4 appendObject:v12 withName:@"graphics"];
    int64_t jetsamPolicy = self->_jetsamPolicy;
    v15 = @"foreground";
    if (jetsamPolicy != 1) {
      v15 = @"(unknown)";
    }
    if (jetsamPolicy) {
      v16 = v15;
    }
    else {
      v16 = @"default";
    }
    id v17 = (id)[v4 appendObject:v16 withName:@"jetsam"];
  }

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSProcessExecutionStrategy *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSProcessExecutionStrategy *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__FBSProcessExecutionStrategy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E58F4AB0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  v7 = v11;
  id v8 = v6;

  return v8;
}

void __69__FBSProcessExecutionStrategy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 32) + 12);
  if ((int)v2 > 9999)
  {
    if (v2 == 10000)
    {
      v3 = @"resume";
      goto LABEL_11;
    }
    if (v2 == 10004)
    {
      v3 = @"finishTaskUnbounded";
      goto LABEL_11;
    }
LABEL_8:
    id v4 = (id)[*(id *)(a1 + 40) appendUnsignedInt:v2 withName:@"bksReason"];
    goto LABEL_12;
  }
  if (v2 == 4)
  {
    v3 = @"finishTask";
    goto LABEL_11;
  }
  if (v2 != 9) {
    goto LABEL_8;
  }
  v3 = @"viewService";
LABEL_11:
  [*(id *)(a1 + 40) appendString:v3 withName:@"bksReason"];
LABEL_12:
  id v9 = [MEMORY[0x1E4F1CA48] array];
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if (v5)
  {
    [v9 addObject:@"preventTaskSuspend"];
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
    if ((v5 & 2) == 0)
    {
LABEL_14:
      if ((v5 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_14;
  }
  [v9 addObject:@"preventTaskThrottleDown"];
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v9 addObject:@"allowIdleSleep"];
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v9 addObject:@"foregroundResourcePriority"];
  int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  if ((v5 & 0x10) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_26:
  [v9 addObject:@"allowSuspendOnSleep"];
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 16) & 0x20) != 0) {
LABEL_18:
  }
    [v9 addObject:@"preventThrottleDownUI"];
LABEL_19:
  id v6 = *(void **)(a1 + 40);
  v7 = [v9 componentsJoinedByString:@", "];
  id v8 = [NSString stringWithFormat:@"bksFlags (%u)", *(unsigned int *)(*(void *)(a1 + 32) + 16)];
  [v6 appendString:v7 withName:v8 skipIfEmpty:1];
}

- (NSString)strategyName
{
  return self->_strategyName;
}

- (void)setStrategyName:(id)a3
{
}

- (int64_t)schedulingPolicy
{
  return self->_schedulingPolicy;
}

- (void)setSchedulingPolicy:(int64_t)a3
{
  self->_unint64_t schedulingPolicy = a3;
}

- (int64_t)graphicsPolicy
{
  return self->_graphicsPolicy;
}

- (void)setGraphicsPolicy:(int64_t)a3
{
  self->_int64_t graphicsPolicy = a3;
}

- (int64_t)jetsamPolicy
{
  return self->_jetsamPolicy;
}

- (void)setJetsamPolicy:(int64_t)a3
{
  self->_int64_t jetsamPolicy = a3;
}

- (BOOL)isCustomPolicy
{
  return self->_customPolicy;
}

- (void)setCustomPolicy:(BOOL)a3
{
  self->_customPolicy = a3;
}

- (unsigned)reason
{
  return self->_bksReason;
}

- (void)setReason:(unsigned int)a3
{
  self->_bksReason = a3;
}

- (unsigned)flags
{
  return self->_bksFlags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_bksFlags = a3;
}

- (void).cxx_destruct
{
}

@end