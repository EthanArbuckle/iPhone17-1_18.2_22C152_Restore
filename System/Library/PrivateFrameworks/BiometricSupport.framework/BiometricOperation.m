@interface BiometricOperation
- (BiometricKitXPCExportedClientObject)client;
- (BiometricOperation)init;
- (id)description;
- (int)status;
- (int)type;
- (int64_t)priority;
- (unsigned)cancelledMessage;
- (unsigned)taskPausedMessage;
- (unsigned)taskResumeFailedMessage;
- (unsigned)taskResumedMessage;
- (void)setClient:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setStatus:(int)a3;
@end

@implementation BiometricOperation

- (BiometricOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BiometricOperation;
  result = [(BiometricOperation *)&v3 init];
  if (result) {
    result->_status = 0;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)BiometricOperation;
  v4 = [(BiometricOperation *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: client=<%p>, status=%u, priority=%ld", v4, self->_client, self->_status, self->_priority];

  return v5;
}

- (int)type
{
  return 0;
}

- (unsigned)taskPausedMessage
{
  return 60;
}

- (unsigned)taskResumedMessage
{
  return 61;
}

- (unsigned)taskResumeFailedMessage
{
  return 62;
}

- (BiometricKitXPCExportedClientObject)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unsigned)cancelledMessage
{
  return self->_cancelledMessage;
}

- (void).cxx_destruct
{
}

@end