@interface WDAuthorizationRecord
- (BOOL)requestedReading;
- (BOOL)requestedSharing;
- (WDAuthorizationRecord)init;
- (WDAuthorizationRecord)initWithInternalAuthorizationRecord:(id)a3;
- (int64_t)status;
- (void)setStatus:(int64_t)a3;
@end

@implementation WDAuthorizationRecord

- (WDAuthorizationRecord)initWithInternalAuthorizationRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDAuthorizationRecord;
  v6 = [(WDAuthorizationRecord *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalAuthorizationRecord, a3);
    v7->_status = [v5 status];
  }

  return v7;
}

- (WDAuthorizationRecord)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (BOOL)requestedSharing
{
  return [(_HKAuthorizationRecord *)self->_internalAuthorizationRecord requestedSharing];
}

- (BOOL)requestedReading
{
  return [(_HKAuthorizationRecord *)self->_internalAuthorizationRecord requestedReading];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end