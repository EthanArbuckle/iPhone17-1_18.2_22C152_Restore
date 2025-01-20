@interface StoreKitServiceErrorMetadata
- (NSString)environment;
- (NSString)serverCorrelationID;
- (NSString)storefrontCountryCode;
- (_TtC9storekitd28StoreKitServiceErrorMetadata)init;
- (void)setEnvironment:(id)a3;
- (void)setServerCorrelationID:(id)a3;
- (void)setStorefrontCountryCode:(id)a3;
@end

@implementation StoreKitServiceErrorMetadata

- (NSString)serverCorrelationID
{
  return (NSString *)sub_1000BA338((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1000BA2F0);
}

- (void)setServerCorrelationID:(id)a3
{
}

- (NSString)environment
{
  return (NSString *)sub_1000BA338((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1000BA394);
}

- (void)setEnvironment:(id)a3
{
}

- (NSString)storefrontCountryCode
{
  return (NSString *)sub_1000BA338((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1000BA464);
}

- (void)setStorefrontCountryCode:(id)a3
{
}

- (_TtC9storekitd28StoreKitServiceErrorMetadata)init
{
  return (_TtC9storekitd28StoreKitServiceErrorMetadata *)sub_1000BA4E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end