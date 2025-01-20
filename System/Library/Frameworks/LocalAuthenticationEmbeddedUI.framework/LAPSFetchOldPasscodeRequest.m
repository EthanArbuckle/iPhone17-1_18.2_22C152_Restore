@interface LAPSFetchOldPasscodeRequest
- (LAPSFetchOldPasscodeRequest)init;
- (LAPSPasscodeType)passcodeType;
- (int64_t)backoffTimeout;
- (int64_t)failedAttempts;
- (void)setBackoffTimeout:(int64_t)a3;
- (void)setFailedAttempts:(int64_t)a3;
- (void)setPasscodeType:(id)a3;
@end

@implementation LAPSFetchOldPasscodeRequest

- (LAPSFetchOldPasscodeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)LAPSFetchOldPasscodeRequest;
  v2 = [(LAPSFetchOldPasscodeRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[LAPSPasscodeType noneType];
    passcodeType = v2->_passcodeType;
    v2->_passcodeType = (LAPSPasscodeType *)v3;
  }
  return v2;
}

- (LAPSPasscodeType)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(id)a3
{
}

- (int64_t)failedAttempts
{
  return self->_failedAttempts;
}

- (void)setFailedAttempts:(int64_t)a3
{
  self->_failedAttempts = a3;
}

- (int64_t)backoffTimeout
{
  return self->_backoffTimeout;
}

- (void)setBackoffTimeout:(int64_t)a3
{
  self->_backoffTimeout = a3;
}

- (void).cxx_destruct
{
}

@end