@interface NICarKeyEventNotifier
- (NICarKeyEventNotifier)initWithParentSession:(id)a3;
- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3;
- (void)notifyVehicleLockedWithReason:(int64_t)a3;
- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3;
- (void)notifyVehicleSentRangingSuspendedSubEvent;
- (void)notifyVehicleTerminatedRangingSession;
- (void)notifyVehicleUnlockedWithReason:(int64_t)a3;
@end

@implementation NICarKeyEventNotifier

- (NICarKeyEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NICarKeyEventNotifier;
  v5 = [(NICarKeyEventNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyVehicleUnlockedWithReason:(int64_t)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1EF5DB758;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = [NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NICarKeyEventNotifier_notifyVehicleUnlockedWithReason___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2094 description:@"Parent session is nil"];
  }
}

void __57__NICarKeyEventNotifier_notifyVehicleUnlockedWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_0];
}

- (void)notifyVehicleLockedWithReason:(int64_t)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1EF5DB770;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = [NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__NICarKeyEventNotifier_notifyVehicleLockedWithReason___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2108 description:@"Parent session is nil"];
  }
}

void __55__NICarKeyEventNotifier_notifyVehicleLockedWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1313];
}

- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1EF5DB788;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = [NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NICarKeyEventNotifier_notifyVehicleReadyToDriveWithReason___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2122 description:@"Parent session is nil"];
  }
}

void __61__NICarKeyEventNotifier_notifyVehicleReadyToDriveWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1317];
}

- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1EF5DB7A0;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = [NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__NICarKeyEventNotifier_notifyRangingIntentSentToVehicleWithReason___block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2136 description:@"Parent session is nil"];
  }
}

void __68__NICarKeyEventNotifier_notifyRangingIntentSentToVehicleWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1321];
}

- (void)notifyVehicleTerminatedRangingSession
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = @"CarKeyEventType";
    v13[0] = &unk_1EF5DB7B8;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v6 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__NICarKeyEventNotifier_notifyVehicleTerminatedRangingSession__block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2150 description:@"Parent session is nil"];
  }
}

void __62__NICarKeyEventNotifier_notifyVehicleTerminatedRangingSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1325];
}

- (void)notifyVehicleSentRangingSuspendedSubEvent
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = @"CarKeyEventType";
    v13[0] = &unk_1EF5DB7D0;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v6 = [WeakRetained getInternalConnectionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__NICarKeyEventNotifier_notifyVehicleSentRangingSuspendedSubEvent__block_invoke;
    block[3] = &unk_1E5AC26A8;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }
  else
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2164 description:@"Parent session is nil"];
  }
}

void __66__NICarKeyEventNotifier_notifyVehicleSentRangingSuspendedSubEvent__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _processCarKeyEvent:*(void *)(a1 + 40) reply:&__block_literal_global_1329];
}

- (void).cxx_destruct
{
}

@end