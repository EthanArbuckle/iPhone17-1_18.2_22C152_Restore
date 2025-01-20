@interface EscrowAccountInfoRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowAccountInfoRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = [(EscrowGenericRequest *)self baseURL];
  v3 = [v2 stringByAppendingString:@"/escrowproxy/api/get_records"];

  return v3;
}

- (id)command
{
  return @"GETRECORDS";
}

- (id)bodyDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)EscrowAccountInfoRequest;
  v2 = [(EscrowGenericRequest *)&v4 bodyDictionary];
  [v2 setObject:@"com.apple.securebackup.record" forKeyedSubscript:@"label"];

  return v2;
}

- (void)performRequestWithHandler:(id)a3
{
}

@end