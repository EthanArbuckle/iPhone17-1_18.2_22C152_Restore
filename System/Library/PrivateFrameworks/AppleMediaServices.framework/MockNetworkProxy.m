@interface MockNetworkProxy
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (_TtC18AppleMediaServices16MockNetworkProxy)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation MockNetworkProxy

+ (BOOL)canInitWithRequest:(id)a3
{
  uint64_t v3 = sub_18DD4D300();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18DD4D2A0();
  unsigned __int8 v7 = static MockNetworkProxy.canInit(with:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  uint64_t v3 = sub_18DD4D300();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  unsigned __int8 v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v13 - v8;
  sub_18DD4D2A0();
  static MockNetworkProxy.canonicalRequest(for:)();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_18DD4D280();
  v10(v9, v3);
  return v11;
}

- (_TtC18AppleMediaServices16MockNetworkProxy)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  uint64_t v7 = sub_18DD4D300();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18DD4D2A0();
  id v10 = a4;
  swift_unknownObjectRetain();
  return (_TtC18AppleMediaServices16MockNetworkProxy *)sub_18D76FCA0((uint64_t)v9, a4, (uint64_t)a5);
}

- (void)startLoading
{
  v2 = self;
  MockNetworkProxy.startLoading()();
}

- (void)stopLoading
{
  v2 = self;
  MockNetworkProxy.stopLoading()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AppleMediaServices16MockNetworkProxy_networkProxy));
}

@end