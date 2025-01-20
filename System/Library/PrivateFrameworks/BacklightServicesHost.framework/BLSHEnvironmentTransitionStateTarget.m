@interface BLSHEnvironmentTransitionStateTarget
- (BLSBacklightChangeEvent)triggerEvent;
- (BLSBacklightSceneVisualState)visualState;
- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 triggerEvent:(id)a5 backlightRampBlock:(id)a6 forIdentifier:(id)a7 previousTarget:(id)a8;
- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 visualState:(id)a5 presentationDate:(id)a6 triggerEvent:(id)a7 pendingBacklightRamp:(id)a8;
- (BLSHEnvironmentTransitionStateTarget)initWithTarget:(id)a3 visualState:(id)a4 presentationDate:(id)a5;
- (BLSHPendingBacklightRamp)pendingBacklightRamp;
- (BOOL)didCompleteAnimation;
- (BOOL)didUpdateInitialState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVisualState:(id)a3 presentationDate:(id)a4;
- (NSDate)presentationDate;
- (id)debugDescription;
- (id)description;
- (int64_t)backlightState;
- (unint64_t)hash;
- (unint64_t)sequenceID;
- (void)setBacklightState:(int64_t)a3;
- (void)setDidCompleteAnimation:(BOOL)a3;
- (void)setDidUpdateInitialState:(BOOL)a3;
@end

@implementation BLSHEnvironmentTransitionStateTarget

- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 triggerEvent:(id)a5 backlightRampBlock:(id)a6 forIdentifier:(id)a7 previousTarget:(id)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (!v17) {
    goto LABEL_15;
  }
  int IsActive = BLSBacklightStateIsActive();
  [v17 backlightState];
  if (IsActive != BLSBacklightStateIsActive()) {
    goto LABEL_15;
  }
  if (v15)
  {
    v19 = 0;
  }
  else
  {
    v19 = [v17 pendingBacklightRamp];
    if ([(BLSHPendingBacklightRamp *)v19 hasPendingRamp])
    {
      v20 = bls_scenes_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = NSStringFromBLSBacklightState();
        int v26 = 134219010;
        v27 = self;
        __int16 v28 = 2114;
        id v29 = v16;
        __int16 v30 = 2114;
        v31 = v21;
        __int16 v32 = 2114;
        id v33 = v17;
        __int16 v34 = 2114;
        id v35 = v14;
        _os_log_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ update to state:%{public}@ – inheriting old backlight ramp existingInProgress:%{public}@ – event:%{public}@", (uint8_t *)&v26, 0x34u);
      }
    }
  }
  if (!v14)
  {
    id v14 = [v17 triggerEvent];
    if (v14)
    {
      v22 = bls_scenes_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = NSStringFromBLSBacklightState();
        int v26 = 134219010;
        v27 = self;
        __int16 v28 = 2114;
        id v29 = v16;
        __int16 v30 = 2114;
        v31 = v23;
        __int16 v32 = 2114;
        id v33 = v17;
        __int16 v34 = 2114;
        id v35 = v14;
        _os_log_impl(&dword_21FCFC000, v22, OS_LOG_TYPE_INFO, "ETS:%p:%{public}@ update to state:%{public}@ – inheriting old triggerEvent existingInProgress:%{public}@ – event:%{public}@", (uint8_t *)&v26, 0x34u);
      }
    }
  }
  if (!v19) {
LABEL_15:
  }
    v19 = [[BLSHPendingBacklightRamp alloc] initWithBacklightRampBlock:v15];
  v24 = [(BLSHEnvironmentTransitionStateTarget *)self initWithSequenceID:a3 backlightState:a4 visualState:0 presentationDate:0 triggerEvent:v14 pendingBacklightRamp:v19];

  return v24;
}

- (BLSHEnvironmentTransitionStateTarget)initWithTarget:(id)a3 visualState:(id)a4 presentationDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 sequenceID];
  uint64_t v12 = [v10 backlightState];
  v13 = [v10 triggerEvent];
  id v14 = [v10 pendingBacklightRamp];

  id v15 = [(BLSHEnvironmentTransitionStateTarget *)self initWithSequenceID:v11 backlightState:v12 visualState:v9 presentationDate:v8 triggerEvent:v13 pendingBacklightRamp:v14];
  return v15;
}

- (BLSHEnvironmentTransitionStateTarget)initWithSequenceID:(unint64_t)a3 backlightState:(int64_t)a4 visualState:(id)a5 presentationDate:(id)a6 triggerEvent:(id)a7 pendingBacklightRamp:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BLSHEnvironmentTransitionStateTarget;
  v18 = [(BLSHEnvironmentTransitionStateTarget *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_sequenceID = a3;
    v18->_backlightState = a4;
    objc_storeStrong((id *)&v18->_visualState, a5);
    objc_storeStrong((id *)&v19->_presentationDate, a6);
    objc_storeStrong((id *)&v19->_triggerEvent, a7);
    objc_storeStrong((id *)&v19->_pendingBacklightRamp, a8);
  }

  return v19;
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __51__BLSHEnvironmentTransitionStateTarget_description__block_invoke;
  id v10 = &unk_2645322D0;
  id v11 = v3;
  uint64_t v12 = self;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

id __51__BLSHEnvironmentTransitionStateTarget_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
  v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) backlightState];
  id v4 = NSStringFromBLSBacklightState();
  id v5 = (id)[v3 appendObject:v4 withName:0];

  v6 = *(id **)(a1 + 40);
  if (v6[5])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = objc_msgSend(v6[5], "bls_shortLoggingString");
    id v9 = (id)[v7 appendObject:v8 withName:0];

    v6 = *(id **)(a1 + 40);
  }
  if (v6[6])
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = objc_msgSend(v6[6], "bls_shortLoggingString");
    id v12 = (id)[v10 appendObject:v11 withName:0];

    v6 = *(id **)(a1 + 40);
  }
  if ([v6 didUpdateInitialState]) {
    id v13 = (id)[*(id *)(a1 + 32) appendObject:@"initialComplete" withName:0];
  }
  id result = (id)[*(id *)(*(void *)(a1 + 40) + 32) hasPendingRamp];
  if (result) {
    return (id)[*(id *)(a1 + 32) appendObject:@"pendingRamp" withName:0];
  }
  return result;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendUInt64:self->_sequenceID withName:@"sequenceID"];
  [(BLSHEnvironmentTransitionStateTarget *)self backlightState];
  id v5 = NSStringFromBLSBacklightState();
  [v3 appendString:v5 withName:@"backlightState"];

  id v6 = (id)[v3 appendObject:self->_visualState withName:@"visualState"];
  uint64_t v7 = [(NSDate *)self->_presentationDate bls_shortLoggingString];
  id v8 = (id)[v3 appendObject:v7 withName:@"presentationDate"];

  id v9 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHEnvironmentTransitionStateTarget didUpdateInitialState](self, "didUpdateInitialState"), @"updatedInitialState", 1);
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSHPendingBacklightRamp hasPendingRamp](self->_pendingBacklightRamp, "hasPendingRamp"), @"hasPendingBacklightRamp", 1);
  id v11 = [v3 build];

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendInt64:self->_sequenceID];
  id v5 = (id)[v3 appendObject:self->_visualState];
  id v6 = (id)[v3 appendObject:self->_presentationDate];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t sequenceID = self->_sequenceID;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke;
  v20[3] = &unk_2645327E8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendInt64:sequenceID counterpart:v20];
  visualState = self->_visualState;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_2;
  v18[3] = &unk_264532810;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:visualState counterpart:v18];
  presentationDate = self->_presentationDate;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_3;
  v16[3] = &unk_264532810;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:presentationDate counterpart:v16];
  LOBYTE(presentationDate) = [v5 isEqual];

  return (char)presentationDate;
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sequenceID];
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) visualState];
}

uint64_t __48__BLSHEnvironmentTransitionStateTarget_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationDate];
}

- (BOOL)isEqualToVisualState:(id)a3 presentationDate:(id)a4
{
  id v4 = a4;
  if (BSEqualObjects()) {
    char v5 = BSEqualObjects();
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)sequenceID
{
  return self->_sequenceID;
}

- (BLSBacklightChangeEvent)triggerEvent
{
  return self->_triggerEvent;
}

- (BLSHPendingBacklightRamp)pendingBacklightRamp
{
  return self->_pendingBacklightRamp;
}

- (BLSBacklightSceneVisualState)visualState
{
  return self->_visualState;
}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void)setBacklightState:(int64_t)a3
{
  self->_backlightState = a3;
}

- (BOOL)didUpdateInitialState
{
  return self->_didUpdateInitialState;
}

- (void)setDidUpdateInitialState:(BOOL)a3
{
  self->_didUpdateInitialState = a3;
}

- (BOOL)didCompleteAnimation
{
  return self->_didCompleteAnimation;
}

- (void)setDidCompleteAnimation:(BOOL)a3
{
  self->_didCompleteAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationDate, 0);
  objc_storeStrong((id *)&self->_visualState, 0);
  objc_storeStrong((id *)&self->_pendingBacklightRamp, 0);

  objc_storeStrong((id *)&self->_triggerEvent, 0);
}

@end