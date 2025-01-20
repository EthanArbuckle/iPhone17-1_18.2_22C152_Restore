@interface ACActivityCenter
- (ACActivityCenter)init;
- (BOOL)areActivitiesEnabled;
- (BOOL)isActivityActive:(id)a3;
- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3;
- (id)observeContentUpdatesWithHandler:(id)a3;
- (id)observeDescriptorsWithHandler:(id)a3;
- (void)disableActivitiesWithBundleIdentifier:(id)a3;
- (void)endActivity:(id)a3;
@end

@implementation ACActivityCenter

- (ACActivityCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACActivityCenter;
  v2 = [(ACActivityCenter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ActivityCenterObjcBridge shared];
    activityCenter = v2->_activityCenter;
    v2->_activityCenter = (_TtC11ActivityKit24ActivityCenterObjcBridge *)v3;
  }
  return v2;
}

- (id)observeDescriptorsWithHandler:(id)a3
{
  id v4 = a3;
  activityCenter = self->_activityCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke;
  v13[3] = &unk_265176808;
  id v6 = v4;
  id v14 = v6;
  v7 = [(ActivityCenterObjcBridge *)activityCenter observeDescriptorsWithHandler:v13];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F29CD8]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke_2;
    v11[3] = &unk_2651767B8;
    id v12 = v7;
    v9 = (void *)[v8 initWithIdentifier:@"ACActivityCenter" forReason:@"allDescriptor listener" invalidationBlock:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

uint64_t __50__ACActivityCenter_observeDescriptorsWithHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)observeContentUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  activityCenter = self->_activityCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke;
  v13[3] = &unk_265176830;
  id v6 = v4;
  id v14 = v6;
  v7 = [(ActivityCenterObjcBridge *)activityCenter observeActivityContentUpdatesWithHandler:v13];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F29CD8]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke_2;
    v11[3] = &unk_2651767B8;
    id v12 = v7;
    v9 = (void *)[v8 initWithIdentifier:@"ACActivityCenter" forReason:@"activity content update observer" invalidationBlock:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __53__ACActivityCenter_observeContentUpdatesWithHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3
{
  id v4 = a3;
  activityCenter = self->_activityCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke;
  v13[3] = &unk_265176858;
  id v6 = v4;
  id v14 = v6;
  v7 = [(ActivityCenterObjcBridge *)activityCenter observeActivitiesExceedingReducedPushBudgetWithHandler:v13];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F29CD8]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke_2;
    v11[3] = &unk_2651767B8;
    id v12 = v7;
    v9 = (void *)[v8 initWithIdentifier:@"ACActivityCenter" forReason:@"activities exceeding reduced push level listener" invalidationBlock:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __75__ACActivityCenter_observeActivitiesExceedingReducedPushBudgetWithHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (BOOL)isActivityActive:(id)a3
{
  return [(ActivityCenterObjcBridge *)self->_activityCenter isActivityActiveWithIdentifier:a3];
}

- (BOOL)areActivitiesEnabled
{
  return [(ActivityCenterObjcBridge *)self->_activityCenter areActivitiesEnabled];
}

- (void)endActivity:(id)a3
{
}

- (void)disableActivitiesWithBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end