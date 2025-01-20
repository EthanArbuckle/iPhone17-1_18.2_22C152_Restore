@interface EscrowRecoveryRequest
- (Class)responseClass;
- (id)additionalHeaders;
- (id)bodyDictionary;
- (id)command;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowRecoveryRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"RECOVER";
}

- (id)additionalHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)EscrowRecoveryRequest;
  v3 = [(EscrowGenericRequest *)&v6 additionalHeaders];
  id v4 = [v3 mutableCopy];

  if ([(EscrowGenericRequest *)self duplicate]
    || [(EscrowGenericRequest *)self silentDoubleRecovery])
  {
    [v4 setObject:@"true" forKeyedSubscript:@"X-Apple-Cyrus-Silent-Recovery"];
  }

  return v4;
}

- (id)bodyDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)EscrowRecoveryRequest;
  v3 = [(EscrowGenericRequest *)&v9 bodyDictionary];
  id v4 = [(EscrowGenericRequest *)self blob];
  v5 = [v4 base64EncodedStringWithOptions:0];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"blob"];
  }
  objc_super v6 = [(EscrowGenericRequest *)self challengeCode];

  if (v6)
  {
    v7 = [(EscrowGenericRequest *)self challengeCode];
    [v3 setObject:v7 forKeyedSubscript:@"smsChallengeCode"];
  }
  if ([(EscrowGenericRequest *)self silentAttempt]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"silentAttempt"];
  }

  return v3;
}

@end