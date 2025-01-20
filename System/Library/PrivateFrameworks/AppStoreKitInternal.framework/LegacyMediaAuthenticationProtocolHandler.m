@interface LegacyMediaAuthenticationProtocolHandler
- (_TtC19AppStoreKitInternal40LegacyMediaAuthenticationProtocolHandler)init;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
@end

@implementation LegacyMediaAuthenticationProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1E1C9F93C(v10, v11, a5, (uint64_t)a6);
}

- (_TtC19AppStoreKitInternal40LegacyMediaAuthenticationProtocolHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LegacyMediaAuthenticationProtocolHandler();
  return [(AMSURLProtocolHandler *)&v3 init];
}

@end