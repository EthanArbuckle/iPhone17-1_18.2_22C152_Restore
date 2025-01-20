@interface EscrowCertificateRequest
- (Class)responseClass;
- (NSDictionary)requestDictionary;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
@end

@implementation EscrowCertificateRequest

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = [(EscrowGenericRequest *)self baseURL];
  v3 = [v2 stringByAppendingString:@"/escrowproxy/api/get_club_cert"];

  return v3;
}

- (id)command
{
  return @"GETCLUB";
}

- (id)bodyDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)EscrowCertificateRequest;
  v3 = [(EscrowGenericRequest *)&v6 bodyDictionary];
  v4 = [(EscrowCertificateRequest *)self requestDictionary];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (NSDictionary)requestDictionary
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  v4 = [(EscrowGenericRequest *)self recordLabel];
  [v3 setObject:v4 forKeyedSubscript:@"label"];

  v5 = [(EscrowGenericRequest *)self baseRootCertVersions];

  if (v5)
  {
    objc_super v6 = [(EscrowGenericRequest *)self baseRootCertVersions];
    [v3 setObject:v6 forKeyedSubscript:@"baseRootCertVersions"];
  }
  v7 = [(EscrowGenericRequest *)self trustedRootCertVersions];

  if (v7)
  {
    v8 = [(EscrowGenericRequest *)self trustedRootCertVersions];
    [v3 setObject:v8 forKeyedSubscript:@"trustedRootCertVersions"];
  }

  return (NSDictionary *)v3;
}

@end