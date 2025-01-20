@interface NISystemEventNotifier
- (NISystemEventNotifier)initWithParentSession:(id)a3;
- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
- (void)notifyPassiveAccessIntent:(unsigned int)a3;
@end

@implementation NISystemEventNotifier

- (NISystemEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NISystemEventNotifier;
  v5 = [(NISystemEventNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyPassiveAccessIntent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1EF5DB758;
    v15[0] = @"SystemEventDictKey_EventType";
    v15[1] = @"SystemEventDictKey_PassiveAccessIntentOptions";
    v7 = [NSNumber numberWithUnsignedInt:v3];
    v16[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NISystemEventNotifier_notifyPassiveAccessIntent___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2727 description:@"Parent session is nil"];
  }
}

void __51__NISystemEventNotifier_notifyPassiveAccessIntent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processSystemEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1486];
}

- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  BOOL v5 = a3;
  v19[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v19[0] = &unk_1EF5DB770;
    v18[0] = @"SystemEventDictKey_EventType";
    v18[1] = @"SystemEventDictKey_ResourceUsageLimitExceededValue";
    v9 = [NSNumber numberWithBool:v5];
    v19[1] = v9;
    v18[2] = @"SystemEventDictKey_ConfigurationType";
    id v10 = NSStringFromClass(a4);
    v19[2] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    v12 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__NISystemEventNotifier__notifyResourceUsageLimitExceeded_forSessionConfigurationType___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v16 = WeakRetained;
    id v17 = v11;
    id v13 = v11;
    dispatch_sync(v12, block);
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2743 description:@"Parent session is nil"];
  }
}

void __87__NISystemEventNotifier__notifyResourceUsageLimitExceeded_forSessionConfigurationType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processSystemEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1488];
}

- (void).cxx_destruct
{
}

@end