@interface ProductLookupEvent
+ (NSString)name;
- (BOOL)canCreatePayload;
- (NSString)extensionName;
- (NSString)itemKind;
- (NSString)productID;
- (_TtC17StoreKitUIService18ProductLookupEvent)init;
- (void)configureWithItem:(id)a3 compatibleExtension:(id)a4;
- (void)setExtensionName:(id)a3;
- (void)setItemKind:(id)a3;
- (void)setProductID:(id)a3;
@end

@implementation ProductLookupEvent

- (NSString)productID
{
  return (NSString *)sub_10002D088((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002D040);
}

- (void)setProductID:(id)a3
{
}

- (NSString)extensionName
{
  return (NSString *)sub_10002D088((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002D0E4);
}

- (void)setExtensionName:(id)a3
{
}

- (NSString)itemKind
{
  return (NSString *)sub_10002D088((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_10002D1B4);
}

- (void)setItemKind:(id)a3
{
}

- (void)configureWithItem:(id)a3 compatibleExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10002D234(v6, a4);
}

+ (NSString)name
{
  sub_10002D3C8();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)canCreatePayload
{
  return sub_10002D40C();
}

- (_TtC17StoreKitUIService18ProductLookupEvent)init
{
  return (_TtC17StoreKitUIService18ProductLookupEvent *)sub_10002D428();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end