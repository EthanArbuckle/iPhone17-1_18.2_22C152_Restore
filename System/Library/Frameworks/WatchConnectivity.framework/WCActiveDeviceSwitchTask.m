@interface WCActiveDeviceSwitchTask
+ (id)taskStateToString:(unint64_t)a3;
- (BOOL)clientReadyForSessionState;
- (id)description;
- (unint64_t)taskState;
- (void)setClientReadyForSessionState:(BOOL)a3;
- (void)setTaskState:(unint64_t)a3;
@end

@implementation WCActiveDeviceSwitchTask

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if ([(WCActiveDeviceSwitchTask *)self clientReadyForSessionState]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  v7 = objc_msgSend((id)objc_opt_class(), "taskStateToString:", -[WCActiveDeviceSwitchTask taskState](self, "taskState"));
  v8 = [v3 stringWithFormat:@"<%@: %p, clientReadyForSessionState: %s, taskState: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)clientReadyForSessionState
{
  return self->_clientReadyForSessionState;
}

- (unint64_t)taskState
{
  return self->_taskState;
}

+ (id)taskStateToString:(unint64_t)a3
{
  id result = @"Queued";
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      id result = @"Started";
      break;
    case 2uLL:
      id result = @"AwaitingActivationRequest";
      break;
    case 3uLL:
      id result = @"ActivationRequested";
      break;
    case 4uLL:
      id result = @"ActivationCompleted";
      break;
    default:
      v4 = @"Halted";
      if (a3 != 999) {
        v4 = @"Unknown";
      }
      if (a3 == 888) {
        id result = @"ActivationFailed";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

- (void)setTaskState:(unint64_t)a3
{
  self->_taskState = a3;
}

- (void)setClientReadyForSessionState:(BOOL)a3
{
  self->_clientReadyForSessionState = a3;
}

@end