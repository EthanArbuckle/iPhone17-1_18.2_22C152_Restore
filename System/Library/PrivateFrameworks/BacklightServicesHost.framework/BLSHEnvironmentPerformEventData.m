@interface BLSHEnvironmentPerformEventData
- (BLSHEnvironmentPerformEventData)initWithStateMachineOldBacklightState:(int64_t)a3 eventPreviousBacklightState:(int64_t)a4 eventNewBacklightState:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (int64_t)eventNewBacklightState;
- (int64_t)eventPreviousBacklightState;
- (int64_t)stateMachineOldBacklightState;
- (unint64_t)startedTime;
@end

@implementation BLSHEnvironmentPerformEventData

- (BLSHEnvironmentPerformEventData)initWithStateMachineOldBacklightState:(int64_t)a3 eventPreviousBacklightState:(int64_t)a4 eventNewBacklightState:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BLSHEnvironmentPerformEventData;
  v8 = [(BLSHEnvironmentPerformEventData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_stateMachineOldBacklightState = a3;
    v8->_eventPreviousBacklightState = a4;
    v8->_eventNewBacklightState = a5;
    v8->_startedTime = mach_continuous_time();
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = NSStringFromBLSBacklightState();
  v5 = NSStringFromBLSBacklightState();
  v6 = NSStringFromBLSBacklightState();
  id v7 = objc_alloc(MEMORY[0x263EFF910]);
  v8 = objc_msgSend(v7, "bls_initWithMachContinuousTime:", self->_startedTime);
  v9 = objc_msgSend(v8, "bls_shortLoggingString");
  v10 = [v3 stringWithFormat:@"event (%@) %@->%@ %@", v4, v5, v6, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t stateMachineOldBacklightState = self->_stateMachineOldBacklightState;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke;
  v20[3] = &unk_2645327E8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendInteger:stateMachineOldBacklightState counterpart:v20];
  int64_t eventPreviousBacklightState = self->_eventPreviousBacklightState;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_2;
  v18[3] = &unk_2645327E8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendInteger:eventPreviousBacklightState counterpart:v18];
  int64_t eventNewBacklightState = self->_eventNewBacklightState;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_3;
  v16[3] = &unk_2645327E8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendInteger:eventNewBacklightState counterpart:v16];
  LOBYTE(eventNewBacklightState) = [v5 isEqual];

  return eventNewBacklightState;
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stateMachineOldBacklightState];
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPreviousBacklightState];
}

uint64_t __43__BLSHEnvironmentPerformEventData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventNewBacklightState];
}

- (int64_t)stateMachineOldBacklightState
{
  return self->_stateMachineOldBacklightState;
}

- (int64_t)eventPreviousBacklightState
{
  return self->_eventPreviousBacklightState;
}

- (int64_t)eventNewBacklightState
{
  return self->_eventNewBacklightState;
}

- (unint64_t)startedTime
{
  return self->_startedTime;
}

@end