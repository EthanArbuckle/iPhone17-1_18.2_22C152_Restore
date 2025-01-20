@interface MediaAuthenticationProtocolHandler
- (_TtC19AppStoreKitInternal34MediaAuthenticationProtocolHandler)initWithTokenService:(id)a3;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
@end

@implementation MediaAuthenticationProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1E1C9FD44(v10, v11, a5, (uint64_t)a6);
}

- (_TtC19AppStoreKitInternal34MediaAuthenticationProtocolHandler)initWithTokenService:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AMSMediaProtocolHandler *)&v5 initWithTokenService:a3];
}

@end