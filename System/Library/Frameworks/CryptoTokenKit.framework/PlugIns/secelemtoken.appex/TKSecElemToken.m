@interface TKSecElemToken
- (TKSecElemToken)initWithTokenDriver:(id)a3 instanceID:(id)a4 error:(id *)a5;
- (id)token:(id)a3 createSessionWithError:(id *)a4;
@end

@implementation TKSecElemToken

- (TKSecElemToken)initWithTokenDriver:(id)a3 instanceID:(id)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TKSecElemToken;
  return -[TKSecElemToken initWithTokenDriver:instanceID:](&v6, "initWithTokenDriver:instanceID:", a3, a4, a5);
}

- (id)token:(id)a3 createSessionWithError:(id *)a4
{
  v4 = [[TKSecElemTokenSession alloc] initWithToken:self];

  return v4;
}

@end