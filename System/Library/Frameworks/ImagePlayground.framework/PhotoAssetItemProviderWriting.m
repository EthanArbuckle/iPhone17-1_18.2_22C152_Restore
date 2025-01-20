@interface PhotoAssetItemProviderWriting
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (_TtC15ImagePlayground29PhotoAssetItemProviderWriting)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation PhotoAssetItemProviderWriting

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  if (qword_268E37C10 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2443BA7A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_2443BA4F0();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  v10 = (void *)sub_2441F9BCC(v6, v8, (uint64_t)v9, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();

  return v10;
}

- (_TtC15ImagePlayground29PhotoAssetItemProviderWriting)init
{
  result = (_TtC15ImagePlayground29PhotoAssetItemProviderWriting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end