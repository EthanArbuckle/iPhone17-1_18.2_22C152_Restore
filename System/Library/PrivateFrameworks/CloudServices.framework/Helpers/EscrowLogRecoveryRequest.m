@interface EscrowLogRecoveryRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
@end

@implementation EscrowLogRecoveryRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = [(EscrowGenericRequest *)self baseURL];
  v3 = [v2 stringByAppendingString:@"/escrowproxy/api/recovery_log"];

  return v3;
}

- (id)command
{
  return @"RECOVERYLOG";
}

- (id)bodyDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)EscrowLogRecoveryRequest;
  v3 = [(EscrowGenericRequest *)&v8 bodyDictionary];
  v4 = [(EscrowGenericRequest *)self recoveryUUID];
  [v3 setObject:v4 forKeyedSubscript:@"recovery_uuid"];

  v5 = [(EscrowGenericRequest *)self doubleRecoveryUUID];
  [v3 setObject:v5 forKeyedSubscript:@"double_recovery_uuid"];

  if ([(EscrowGenericRequest *)self recoveryResult]) {
    v6 = &__kCFBooleanTrue;
  }
  else {
    v6 = &__kCFBooleanFalse;
  }
  [v3 setObject:v6 forKeyedSubscript:@"recovery_result"];

  return v3;
}

@end