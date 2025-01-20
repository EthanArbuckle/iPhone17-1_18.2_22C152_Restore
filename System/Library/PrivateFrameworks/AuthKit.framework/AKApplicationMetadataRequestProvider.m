@interface AKApplicationMetadataRequestProvider
- (AKApplicationMetadataRequestProvider)init;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 url:(id)a4;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (AKApplicationMetadataRequestProvider)initWithUrlBagKey:(id)a3;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
@end

@implementation AKApplicationMetadataRequestProvider

- (unint64_t)expectedResponseType
{
  return 0;
}

- (unint64_t)requestBodyType
{
  return 0;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_10012713C(v5);

  return 1;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v6 = self;
    id v7 = a3;
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    v11 = self;
    uint64_t v8 = 0;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_10012730C(v8, v10);

  sub_1000D89D4(v8, v10);
  return 1;
}

- (AKApplicationMetadataRequestProvider)initWithUrlBagKey:(id)a3
{
  id v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  v6 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *id v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(AKURLRequestProviderImpl *)&v8 initWithUrlBagKey:a3];
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v8 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *id v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(AKURLRequestProviderImpl *)&v10 initWithContext:a3 urlBagKey:a4];
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v10 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *unint64_t v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return [(AKURLRequestProviderImpl *)&v12 initWithContext:a3 urlBagKey:a4 shouldCacheResource:v5];
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  BOOL v7 = a5;
  v11 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v12 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  void *v11 = 0;
  v11[1] = 0;
  v14.receiver = self;
  v14.super_class = v12;
  return [(AKURLRequestProviderImpl *)&v14 initWithContext:a3 urlBagKey:a4 shouldCacheResource:v7 accountManager:a6];
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 url:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v10 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  *objc_super v10 = 0;
  v10[1] = 0;
  swift_unknownObjectRetain();
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  objc_super v14 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = [(AKURLRequestProviderImpl *)&v17 initWithContext:a3 url:v13];
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (AKApplicationMetadataRequestProvider)init
{
  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  v4 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(AKApplicationMetadataRequestProvider *)&v6 init];
}

- (void).cxx_destruct
{
}

@end