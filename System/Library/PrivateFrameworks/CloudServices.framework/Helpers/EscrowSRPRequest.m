@interface EscrowSRPRequest
- (Class)responseClass;
- (id)additionalHeaders;
- (id)bodyDictionary;
- (id)command;
- (id)validateInput;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowSRPRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (id)validateInput
{
  v8.receiver = self;
  v8.super_class = (Class)EscrowSRPRequest;
  v3 = [(EscrowGenericRequest *)&v8 validateInput];
  if (!v3)
  {
    v4 = [(EscrowGenericRequest *)self dsid];
    id v5 = [v4 length];

    if (v5)
    {
      v3 = 0;
    }
    else
    {
      v3 = +[CloudServicesError errorWithCode:22 error:0 format:@"Missing DSID"];
      v6 = CloudServicesLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100049FC8();
      }
    }
  }

  return v3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"SRP_INIT";
}

- (id)additionalHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)EscrowSRPRequest;
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
  v11.receiver = self;
  v11.super_class = (Class)EscrowSRPRequest;
  v3 = [(EscrowGenericRequest *)&v11 bodyDictionary];
  id v4 = [(EscrowGenericRequest *)self blob];
  id v5 = [v4 base64EncodedStringWithOptions:0];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"blob"];
  }
  objc_super v6 = [(EscrowGenericRequest *)self bypassToken];

  if (v6)
  {
    v7 = [(EscrowGenericRequest *)self bypassToken];
    [v3 setObject:v7 forKeyedSubscript:@"phoneNumberToken"];
  }
  objc_super v8 = [(EscrowGenericRequest *)self challengeCode];

  if (v8)
  {
    v9 = [(EscrowGenericRequest *)self challengeCode];
    [v3 setObject:v9 forKeyedSubscript:@"smsChallengeCode"];
  }
  if ([(EscrowGenericRequest *)self silentAttempt]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"silentAttempt"];
  }

  return v3;
}

@end