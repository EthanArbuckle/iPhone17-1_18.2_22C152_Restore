@interface EscrowSMSChallengeRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
@end

@implementation EscrowSMSChallengeRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"GENERATE_SMS_CHALLENGE";
}

- (id)bodyDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)EscrowSMSChallengeRequest;
  v2 = [(EscrowGenericRequest *)&v4 bodyDictionary];
  [v2 setObject:@"com.apple.securebackup.record" forKeyedSubscript:@"label"];

  return v2;
}

@end