@interface AssetStreamHandle
+ (C2RequestOptions)networkRequestOptions;
+ (void)makeAssetStreamHandleFrom:(NSURL *)a3 with:(NSData *)a4 for:(NSString *)a5 completionHandler:(id)a6;
- (_TtC8CloudKit17AssetStreamHandle)init;
- (id)initFrom:(id)a3 error:(id *)a4;
- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5;
- (id)makeAVPlayerItemWith:(id)a3 options:(id)a4;
- (id)serializedDataAndReturnError:(id *)a3;
- (int64_t)size;
@end

@implementation AssetStreamHandle

+ (C2RequestOptions)networkRequestOptions
{
  id v2 = sub_18AFB6258();

  return (C2RequestOptions *)v2;
}

+ (void)makeAssetStreamHandleFrom:(NSURL *)a3 with:(NSData *)a4 for:(NSString *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;

  sub_18AFB6F50((uint64_t)&unk_1E9126B88, (uint64_t)v11);
}

- (id)initFrom:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  return AssetStreamHandle.init(from:)(v5, v7);
}

- (id)serializedDataAndReturnError:(id *)a3
{
  v3 = self;
  uint64_t v4 = AssetStreamHandle.serializedData()();
  unint64_t v6 = v5;

  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_18AF5AF68(v4, v6);

  return v7.super.isa;
}

- (id)makeAVPlayerItemWith:(id)a3 options:(id)a4
{
  uint64_t v7 = sub_18AF161EC(&qword_1E9126560);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = 1;
  }
  sub_18AF43708((uint64_t)v9, v11, 1, v10);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v12 = self;
  v13 = (void *)AssetStreamHandle.makeAVPlayerItem(with:options:)((uint64_t)v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  sub_18AFBB55C((uint64_t)v9, &qword_1E9126560);

  return v13;
}

- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5
{
  uint64_t v8 = sub_18AF161EC(&qword_1E9126560);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = 1;
  }
  sub_18AF43708((uint64_t)v10, v12, 1, v11);
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  v16 = self;
  v17 = (void *)AssetStreamHandle.makeAVAssetExportSession(with:options:presetName:)((uint64_t)v10, (uint64_t)a4, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18AFBB55C((uint64_t)v10, &qword_1E9126560);

  return v17;
}

- (_TtC8CloudKit17AssetStreamHandle)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)size
{
  id v2 = self;
  int64_t v3 = AssetStreamHandle.size.getter();

  return v3;
}

@end