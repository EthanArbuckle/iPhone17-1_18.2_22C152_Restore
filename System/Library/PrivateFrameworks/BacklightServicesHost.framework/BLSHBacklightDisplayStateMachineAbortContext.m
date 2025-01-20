@interface BLSHBacklightDisplayStateMachineAbortContext
- (BLSHBacklightDisplayStateMachineAbortContext)initWithDisplayMode:(int64_t)a3 prewarmingDisplayMode:(int64_t)a4 lastSteadyStateDisplayMode:(int64_t)a5 caDisplayState:(int64_t)a6 cbDisplayMode:(int64_t)a7 showingBlankingWindow:(BOOL)a8 sleepMonitorAggregateState:(id)a9 hasEnsureFlipbookCurrent:(BOOL)a10;
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

@implementation BLSHBacklightDisplayStateMachineAbortContext

- (BLSHBacklightDisplayStateMachineAbortContext)initWithDisplayMode:(int64_t)a3 prewarmingDisplayMode:(int64_t)a4 lastSteadyStateDisplayMode:(int64_t)a5 caDisplayState:(int64_t)a6 cbDisplayMode:(int64_t)a7 showingBlankingWindow:(BOOL)a8 sleepMonitorAggregateState:(id)a9 hasEnsureFlipbookCurrent:(BOOL)a10
{
  id v17 = a9;
  v21.receiver = self;
  v21.super_class = (Class)BLSHBacklightDisplayStateMachineAbortContext;
  v18 = [(BLSHBacklightDisplayStateMachineAbortContext *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_displayMode = a3;
    v18->_prewarmingDisplayMode = a4;
    v18->_lastSteadyStateDisplayMode = a5;
    v18->_caDisplayState = a6;
    v18->_cbDisplayMode = a7;
    v18->_showingBlankingWindow = a8;
    v18->_hasEnsureFlipbookCurrent = a10;
    objc_storeStrong((id *)&v18->_sleepMonitorAggregateState, a9);
    v19->_abortTimestamp = mach_continuous_time();
    v19->_abortReason = 2;
    v19->_payloadSize = 20;
    [(BLSHBacklightDisplayStateMachineAbortContext *)v19 _populatePayload];
  }

  return v19;
}

- (NSString)abortReasonString
{
  if (self->_abortReason == 7) {
    return (NSString *)@"DSM_SI";
  }
  else {
    return (NSString *)@"DSM";
  }
}

- (void)setSleepImminentAbortReason
{
  self->_abortReason = 7;
}

- (BOOL)wantsPanic
{
  return self->_abortReason == 7;
}

- (void)_populatePayload
{
  v3 = malloc_type_calloc(1uLL, self->_payloadSize, 0xBB589C9FuLL);
  _DWORD *v3 = 1;
  v3[1] = self->_displayMode;
  v3[2] = self->_prewarmingDisplayMode;
  v3[3] = self->_lastSteadyStateDisplayMode;
  char v4 = v3[4] & 0xFE | ((self->_caDisplayState & 0xFFFFFFFFFFFFFFFELL) == 2);
  *((unsigned char *)v3 + 16) = v4;
  *((unsigned char *)v3 + 16) = v4 & 0xFD | (2 * self->_showingBlankingWindow);
  char v5 = v3[4] & 0xFB | (4 * (BLSBacklightFactorFromCBDisplayMode(self->_cbDisplayMode) != 0));
  *((unsigned char *)v3 + 16) = v5;
  char v6 = v5 & 0xF7 | (8 * (self->_caDisplayState != 1));
  *((unsigned char *)v3 + 16) = v6;
  int64_t caDisplayState = self->_caDisplayState;
  if (caDisplayState == 3 || caDisplayState == 0) {
    char v9 = 16;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)v3 + 16) = v9 | v6 & 0xEF;
  self->_payload = v3;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  char v4 = NSStringFromBLSBacklightDisplayMode(self->_displayMode);
  [v3 appendString:v4 withName:@"displayMode"];

  char v5 = [(SWSystemSleepMonitorAggregateState *)self->_sleepMonitorAggregateState descriptionForTimestamp:self->_abortTimestamp];
  id v6 = (id)[v3 appendObject:v5 withName:@"sleepState"];

  id v7 = (id)[v3 appendBool:self->_hasEnsureFlipbookCurrent withName:@"hasEnsureFlipbookCurrent"];
  v8 = NSStringFromBLSBacklightDisplayMode(self->_prewarmingDisplayMode);
  [v3 appendString:v8 withName:@"prewarmingDisplayMode"];

  char v9 = NSStringFromBLSBacklightDisplayMode(self->_lastSteadyStateDisplayMode);
  [v3 appendString:v9 withName:@"lastSteadyStateDisplayMode"];

  v10 = NSStringFromCADisplayState();
  id v11 = (id)[v3 appendObject:v10 withName:@"caDisplayState"];

  v12 = NSStringFromCBDisplayMode_bls(self->_cbDisplayMode);
  id v13 = (id)[v3 appendObject:v12 withName:@"cbDisplayMode"];

  id v14 = (id)[v3 appendBool:self->_showingBlankingWindow withName:@"showingBlankingWindow"];
  v15 = [v3 build];

  return (NSString *)v15;
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
  v4.super_class = (Class)BLSHBacklightDisplayStateMachineAbortContext;
  [(BLSHBacklightDisplayStateMachineAbortContext *)&v4 dealloc];
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

- (BOOL)hasEnsureFlipbookCurrent
{
  return self->_hasEnsureFlipbookCurrent;
}

- (void).cxx_destruct
{
}

@end