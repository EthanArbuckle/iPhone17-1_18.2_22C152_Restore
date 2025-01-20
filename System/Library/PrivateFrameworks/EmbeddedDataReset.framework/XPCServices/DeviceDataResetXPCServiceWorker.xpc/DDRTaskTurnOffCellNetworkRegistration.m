@interface DDRTaskTurnOffCellNetworkRegistration
- (__CTServerConnection)serverConnection;
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
- (void)setServerConnection:(__CTServerConnection *)a3;
@end

@implementation DDRTaskTurnOffCellNetworkRegistration

- (__CTServerConnection)serverConnection
{
  result = self->_serverConnection;
  if (!result)
  {
    result = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    self->_serverConnection = result;
    if (!result)
    {
      v4 = DDRLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100008C7C(v4);
      }

      return self->_serverConnection;
    }
  }
  return result;
}

- (void)run
{
  NSLog(@"turn off cell registration run", a2);
  if ([(DDRTaskTurnOffCellNetworkRegistration *)self serverConnection])
  {
    [(DDRTaskTurnOffCellNetworkRegistration *)self serverConnection];
    unint64_t v3 = _CTServerConnectionDisableRegistration();
    unint64_t v4 = HIDWORD(v3);
    if (HIDWORD(v3))
    {
      int v5 = v3;
      v6 = DDRLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100008CC0(v5, v4, v6);
      }
    }
  }
}

- (double)estimatedTimeOfCompletion
{
  return 0.4;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.turnOffCellNetworkRegistration";
}

- (void)setServerConnection:(__CTServerConnection *)a3
{
  self->_serverConnection = a3;
}

@end