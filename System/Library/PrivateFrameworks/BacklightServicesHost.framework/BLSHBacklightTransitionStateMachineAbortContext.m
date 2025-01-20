@interface BLSHBacklightTransitionStateMachineAbortContext
+ (unsigned)backlightChangeRequestExplanationIdentifierFromString:(id)a3;
- (BLSHBacklightTransitionStateMachineAbortContext)initWithCurrentState:(id)a3 targetState:(id)a4 activeEvents:(id)a5 abortedEvents:(id)a6 pendingEnvironmentUpdate:(id)a7 pendingUpdatePresentation:(id)a8 pendingUpdateToSpecifier:(id)a9 pendingUpdateDisplayMode:(id)a10 ensureFlipbookCurrentOperation:(id)a11 queuedEventsToPerform:(id)a12 pendingPrewarmedEvent:(id)a13 environmentStateMachine:(id)a14 sleepMonitorAggregateState:(id)a15;
- (BOOL)hasEnsureFlipbookCurrent;
- (BOOL)wantsPanic;
- (NSString)abortReasonString;
- (NSString)description;
- (const)payload;
- (unint64_t)abortReason;
- (unsigned)payloadSize;
- (void)_populatePayload;
- (void)dealloc;
- (void)setSleepImminentAbortReason;
@end

@implementation BLSHBacklightTransitionStateMachineAbortContext

+ (unsigned)backlightChangeRequestExplanationIdentifierFromString:(id)a3
{
  id v3 = a3;
  if (backlightChangeRequestExplanationIdentifierFromString__onceToken != -1) {
    dispatch_once(&backlightChangeRequestExplanationIdentifierFromString__onceToken, &__block_literal_global);
  }
  v4 = [(id)backlightChangeRequestExplanationIdentifierFromString__exactMatches objectForKeyedSubscript:v3];
  v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 unsignedIntegerValue];
  }
  else if ([v3 containsString:@" - force active"])
  {
    unsigned int v6 = 1000;
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

void __105__BLSHBacklightTransitionStateMachineAbortContext_backlightChangeRequestExplanationIdentifierFromString___block_invoke()
{
  v0 = (void *)backlightChangeRequestExplanationIdentifierFromString__exactMatches;
  backlightChangeRequestExplanationIdentifierFromString__exactMatches = (uint64_t)&unk_26D191630;
}

- (BLSHBacklightTransitionStateMachineAbortContext)initWithCurrentState:(id)a3 targetState:(id)a4 activeEvents:(id)a5 abortedEvents:(id)a6 pendingEnvironmentUpdate:(id)a7 pendingUpdatePresentation:(id)a8 pendingUpdateToSpecifier:(id)a9 pendingUpdateDisplayMode:(id)a10 ensureFlipbookCurrentOperation:(id)a11 queuedEventsToPerform:(id)a12 pendingPrewarmedEvent:(id)a13 environmentStateMachine:(id)a14 sleepMonitorAggregateState:(id)a15
{
  id v40 = a3;
  id v39 = a4;
  id v28 = a5;
  id v38 = a5;
  id v29 = a6;
  id v37 = a6;
  id v30 = a7;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v41.receiver = self;
  v41.super_class = (Class)BLSHBacklightTransitionStateMachineAbortContext;
  v24 = [(BLSHBacklightTransitionStateMachineAbortContext *)&v41 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_currentState, a3);
    objc_storeStrong((id *)&v25->_targetState, a4);
    objc_storeStrong((id *)&v25->_activeEvents, v28);
    objc_storeStrong((id *)&v25->_abortedEvents, v29);
    objc_storeStrong((id *)&v25->_pendingEnvironmentUpdate, v30);
    objc_storeStrong((id *)&v25->_pendingUpdatePresentation, a8);
    objc_storeStrong((id *)&v25->_pendingUpdateToSpecifier, a9);
    objc_storeStrong((id *)&v25->_pendingUpdateDisplayMode, a10);
    objc_storeStrong((id *)&v25->_ensureFlipbookCurrentOperation, a11);
    objc_storeStrong((id *)&v25->_queuedEventsToPerform, a12);
    objc_storeStrong((id *)&v25->_pendingPrewarmedEvent, a13);
    objc_storeStrong((id *)&v25->_environmentStateMachine, a14);
    objc_storeStrong((id *)&v25->_sleepMonitorAggregateState, a15);
    v25->_abortTimestamp = mach_continuous_time();
    v25->_abortReason = 1;
    v25->_payloadSize = 376;
    [(BLSHBacklightTransitionStateMachineAbortContext *)v25 _populatePayload];
  }

  return v25;
}

- (NSString)abortReasonString
{
  if (self->_abortReason == 4) {
    return (NSString *)@"TSM_SI";
  }
  else {
    return (NSString *)@"TSM";
  }
}

- (BOOL)hasEnsureFlipbookCurrent
{
  return self->_ensureFlipbookCurrentOperation != 0;
}

- (void)setSleepImminentAbortReason
{
  self->_abortReason = 4;
}

- (BOOL)wantsPanic
{
  return self->_abortReason == 4;
}

- (void)_populatePayload
{
  id v3 = (char *)malloc_type_calloc(1uLL, self->_payloadSize, 0xD94EE47uLL);
  *(_DWORD *)id v3 = 2;
  *((_DWORD *)v3 + 1) = [(BLSHBacklightAggregateState *)self->_currentState displayMode];
  v4 = [(BLSHBacklightAggregateState *)self->_currentState presentation];
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:v3 + 8 withPresentation:v4];

  *((_DWORD *)v3 + 8) = [(BLSHBacklightMutableTargetState *)self->_targetState displayMode];
  v5 = [(BLSHBacklightMutableTargetState *)self->_targetState presentation];
  +[BLSHBacklightEnvironmentStateMachineAbortPayload populatePresentationStruct:v3 + 36 withPresentation:v5];

  pendingEnvironmentUpdate = self->_pendingEnvironmentUpdate;
  v3[64] = v3[64] & 0xFE | (pendingEnvironmentUpdate != 0);
  if (pendingEnvironmentUpdate)
  {
    v7 = pendingEnvironmentUpdate;
    if ([(BLSHPendingEnvironmentUpdateOperation *)v7 didUpdateInitialState]) {
      char v8 = 2;
    }
    else {
      char v8 = 0;
    }
    v3[64] = v3[64] & 0xFD | v8;
    v9 = [(BLSHPendingEnvironmentUpdateOperation *)v7 triggerEvent];
    *((void *)v3 + 9) = [v9 eventID];

    v10 = [(BLSHPendingEnvironmentUpdateOperation *)v7 triggerEvent];
    *((_DWORD *)v3 + 20) = [v10 state];

    v11 = [(BLSHPendingEnvironmentUpdateOperation *)v7 triggerEvent];
    *((_DWORD *)v3 + 21) = [v11 previousState];

    v12 = [(BLSHPendingEnvironmentUpdateOperation *)v7 initialSpecifier];
    v13 = [v12 presentationDate];
    [v13 timeIntervalSinceReferenceDate];
    *((void *)v3 + 11) = v14;

    v15 = [(BLSHPendingEnvironmentUpdateOperation *)v7 initialSpecifier];

    v16 = [v15 specifiers];
    *((_DWORD *)v3 + 24) = [v16 count];
  }
  v3[104] = v3[104] & 0xFE | (self->_pendingUpdatePresentation != 0);
  v3[108] = v3[108] & 0xFE | (self->_pendingUpdateToSpecifier != 0);
  pendingUpdateDisplayMode = self->_pendingUpdateDisplayMode;
  v3[112] = v3[112] & 0xFE | (pendingUpdateDisplayMode != 0);
  if (pendingUpdateDisplayMode) {
    *((_DWORD *)v3 + 29) = [(BLSHPendingUpdateDisplayMode *)pendingUpdateDisplayMode targetDisplayMode];
  }
  v18 = [(NSArray *)self->_queuedEventsToPerform firstObject];
  _populateBacklightChangeEventStruct(v18, (uint64_t)(v3 + 264));

  _populateBacklightChangeEventStruct(self->_pendingPrewarmedEvent, (uint64_t)(v3 + 320));
  environmentStateMachine = self->_environmentStateMachine;
  id v20 = v3 + 120;
  if (environmentStateMachine) {
    [(BLSHBacklightEnvironmentStateMachine *)environmentStateMachine populateEnvironmentStateMachineStruct:v20];
  }
  else {
    *v20 &= ~1u;
  }
  self->_payload = v3;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(SWSystemSleepMonitorAggregateState *)self->_sleepMonitorAggregateState descriptionForTimestamp:self->_abortTimestamp];
  id v5 = (id)[v3 appendObject:v4 withName:@"sleepState"];

  unsigned int v6 = NSStringFromBLSBacklightChangeEvents();
  id v7 = (id)[v3 appendObject:v6 withName:@"events"];

  id v8 = (id)[v3 appendObject:self->_ensureFlipbookCurrentOperation withName:@"ensureFlipbookCurrentOperation"];
  id v9 = (id)[v3 appendObject:self->_currentState withName:@"currentState"];
  id v10 = (id)[v3 appendObject:self->_targetState withName:@"targetState"];
  id v11 = (id)[v3 appendObject:self->_pendingEnvironmentUpdate withName:@"pendingEnvironmentUpdate"];
  id v12 = (id)[v3 appendObject:self->_pendingUpdatePresentation withName:@"pendingUpdatePresentation"];
  id v13 = (id)[v3 appendObject:self->_pendingUpdateToSpecifier withName:@"pendingUpdateToSpecifier"];
  id v14 = (id)[v3 appendObject:self->_queuedEventsToPerform withName:@"queuedEventsToPerform"];
  id v15 = (id)[v3 appendObject:self->_pendingPrewarmedEvent withName:@"pendingPrewarmedEvent"];
  v16 = [v3 build];

  return (NSString *)v16;
}

- (void)dealloc
{
  payload = (void *)self->_payload;
  if (payload)
  {
    free(payload);
    self->_payload = 0;
    self->_payloadSize = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BLSHBacklightTransitionStateMachineAbortContext;
  [(BLSHBacklightTransitionStateMachineAbortContext *)&v4 dealloc];
}

- (unint64_t)abortReason
{
  return self->_abortReason;
}

- (const)payload
{
  return self->_payload;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepMonitorAggregateState, 0);
  objc_storeStrong((id *)&self->_environmentStateMachine, 0);
  objc_storeStrong((id *)&self->_pendingPrewarmedEvent, 0);
  objc_storeStrong((id *)&self->_queuedEventsToPerform, 0);
  objc_storeStrong((id *)&self->_ensureFlipbookCurrentOperation, 0);
  objc_storeStrong((id *)&self->_pendingUpdateDisplayMode, 0);
  objc_storeStrong((id *)&self->_pendingUpdateToSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingUpdatePresentation, 0);
  objc_storeStrong((id *)&self->_pendingEnvironmentUpdate, 0);
  objc_storeStrong((id *)&self->_abortedEvents, 0);
  objc_storeStrong((id *)&self->_activeEvents, 0);
  objc_storeStrong((id *)&self->_targetState, 0);

  objc_storeStrong((id *)&self->_currentState, 0);
}

@end