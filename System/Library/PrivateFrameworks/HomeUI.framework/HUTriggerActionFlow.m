@interface HUTriggerActionFlow
+ (id)selectFlowForState:(unint64_t)a3;
- (BOOL)hasChangedState;
- (BOOL)isFinished;
- (BOOL)isLastState;
- (BOOL)isSingleFlow;
- (BOOL)isStandalone;
- (HUTriggerActionFlow)initWithEditorMode:(unint64_t)a3;
- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3;
- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3 hasChangedState:(BOOL)a4;
- (id)getNextState;
- (unint64_t)_nextState;
- (unint64_t)flowState;
@end

@implementation HUTriggerActionFlow

- (HUTriggerActionFlow)initWithEditorMode:(unint64_t)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = [(HUTriggerActionFlow *)self initWithFlowState:v3];

  return v4;
}

- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3
{
  return [(HUTriggerActionFlow *)self initWithFlowState:a3 hasChangedState:0];
}

- (HUTriggerActionFlow)initWithFlowState:(unint64_t)a3 hasChangedState:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionFlow;
  result = [(HUTriggerActionFlow *)&v7 init];
  if (result)
  {
    result->_flowState = a3;
    result->_hasChangedState = a4;
  }
  return result;
}

+ (id)selectFlowForState:(unint64_t)a3
{
  v4 = [HUTriggerActionFlow alloc];
  if (a3 == 7) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = [(HUTriggerActionFlow *)v4 initWithFlowState:v5];

  return v6;
}

- (unint64_t)_nextState
{
  unint64_t v3 = [(HUTriggerActionFlow *)self flowState];
  if (v3 < 8) {
    return qword_1BEA1A0B0[v3];
  }

  return [(HUTriggerActionFlow *)self flowState];
}

- (id)getNextState
{
  v2 = [[HUTriggerActionFlow alloc] initWithFlowState:[(HUTriggerActionFlow *)self _nextState] hasChangedState:1];

  return v2;
}

- (BOOL)isStandalone
{
  return [(HUTriggerActionFlow *)self flowState] == 4
      || [(HUTriggerActionFlow *)self flowState] == 5
      || [(HUTriggerActionFlow *)self flowState] == 6
      || [(HUTriggerActionFlow *)self flowState] == 7;
}

- (BOOL)isFinished
{
  return [(HUTriggerActionFlow *)self flowState] == 8;
}

- (BOOL)isSingleFlow
{
  if ([(HUTriggerActionFlow *)self _nextState] == 8) {
    return ![(HUTriggerActionFlow *)self hasChangedState];
  }
  else {
    return 0;
  }
}

- (BOOL)isLastState
{
  return [(HUTriggerActionFlow *)self _nextState] == 8;
}

- (unint64_t)flowState
{
  return self->_flowState;
}

- (BOOL)hasChangedState
{
  return self->_hasChangedState;
}

@end