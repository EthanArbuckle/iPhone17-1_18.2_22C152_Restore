@interface HAHDPinnedContentTaskServer
+ (NSString)taskIdentifier;
- (HAHDPinnedContentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_applyDifferencesWithDifferences:(id)a3 inDomain:(id)a4 completion:(id)a5;
- (void)remote_fetchPinnedContentInDomain:(id)a3 withCompletion:(id)a4;
- (void)remote_movePinnedContentWithIdentifier:(id)a3 inDomain:(id)a4 toIndex:(id)a5 completion:(id)a6;
- (void)remote_pinContentWithIdentifier:(id)a3 inDomain:(id)a4 atIndex:(id)a5 completion:(id)a6;
- (void)remote_unpinAllContentInDomain:(id)a3 withCompletion:(id)a4;
- (void)remote_unpinContentWithIdentifier:(id)a3 inDomain:(id)a4 completion:(id)a5;
@end

@implementation HAHDPinnedContentTaskServer

- (id)exportedInterface
{
  sub_250D5DD50();
  v2 = (void *)MEMORY[0x253387420]();
  return v2;
}

- (id)remoteInterface
{
  sub_250D5DD50();
  v2 = (void *)sub_250D5DD30();
  return v2;
}

- (void)remote_fetchPinnedContentInDomain:(id)a3 withCompletion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_250D5E010();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_250D43188(v6, v8, (void (*)(void, void *))sub_250D43B00, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (HAHDPinnedContentTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v10 = sub_250D5DE50();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D5DE40();
  id v14 = a4;
  id v15 = a5;
  swift_unknownObjectRetain();
  v16 = (void *)sub_250D5DE30();
  v17 = (objc_class *)type metadata accessor for PinnedContentTaskServer();
  v20.receiver = self;
  v20.super_class = v17;
  v18 = [(HDStandardTaskServer *)&v20 initWithUUID:v16 configuration:v14 client:v15 delegate:a6];

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v18;
}

+ (NSString)taskIdentifier
{
  sub_250D5DD50();
  sub_250D5DD20();
  v2 = (void *)sub_250D5DFF0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)remote_pinContentWithIdentifier:(id)a3 inDomain:(id)a4 atIndex:(id)a5 completion:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_250D5E010();
  unint64_t v11 = v10;
  uint64_t v12 = sub_250D5E010();
  uint64_t v14 = v13;
  _Block_copy(v8);
  id v15 = a5;
  v16 = self;
  sub_250D53D84(v9, v11, v12, v14, a5, v16, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_unpinContentWithIdentifier:(id)a3 inDomain:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = sub_250D5E010();
  unint64_t v9 = v8;
  uint64_t v10 = sub_250D5E010();
  uint64_t v12 = v11;
  _Block_copy(v6);
  uint64_t v13 = self;
  sub_250D53FAC(v7, v9, v10, v12, v13, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_movePinnedContentWithIdentifier:(id)a3 inDomain:(id)a4 toIndex:(id)a5 completion:(id)a6
{
  unint64_t v8 = _Block_copy(a6);
  uint64_t v9 = sub_250D5E010();
  unint64_t v11 = v10;
  uint64_t v12 = sub_250D5E010();
  uint64_t v14 = v13;
  _Block_copy(v8);
  id v15 = a5;
  v16 = self;
  sub_250D5419C(v9, v11, v12, v14, v15, v16, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)remote_unpinAllContentInDomain:(id)a3 withCompletion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_250D5E010();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_250D543B0(v6, v8, v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)remote_applyDifferencesWithDifferences:(id)a3 inDomain:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  sub_250D5DDB0();
  unint64_t v7 = sub_250D5E090();
  uint64_t v8 = sub_250D5E010();
  uint64_t v10 = v9;
  _Block_copy(v6);
  unint64_t v11 = self;
  sub_250D54840(v7, v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end