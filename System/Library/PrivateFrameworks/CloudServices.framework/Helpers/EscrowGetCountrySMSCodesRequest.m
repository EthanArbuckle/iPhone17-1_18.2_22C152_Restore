@interface EscrowGetCountrySMSCodesRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
@end

@implementation EscrowGetCountrySMSCodesRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"GET_COUNTRY_SMS_CODES";
}

- (id)bodyDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)EscrowGetCountrySMSCodesRequest;
  v2 = [(EscrowGenericRequest *)&v4 bodyDictionary];
  [v2 setObject:@"com.apple.securebackup.record" forKeyedSubscript:@"label"];

  return v2;
}

@end