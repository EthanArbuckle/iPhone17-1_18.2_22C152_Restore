@interface CloudAssetsAssetStreamHandle
+ (id)makeAssetStreamHandleWithPartition:(id)a3 owner:(id)a4 accessToken:(id)a5 requestorID:(id)a6 signature:(id)a7 referenceSignature:(id)a8 size:(int64_t)a9 assetKey:(id)a10 filenameExtension:(id)a11 applicationID:(id)a12 error:(id *)a13;
- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)init;
- (id)initFrom:(id)a3 error:(id *)a4;
- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5;
- (id)makeAVPlayerItemWith:(id)a3 options:(id)a4;
- (id)serializedDataAndReturnError:(id *)a3;
- (int64_t)size;
@end

@implementation CloudAssetsAssetStreamHandle

+ (id)makeAssetStreamHandleWithPartition:(id)a3 owner:(id)a4 accessToken:(id)a5 requestorID:(id)a6 signature:(id)a7 referenceSignature:(id)a8 size:(int64_t)a9 assetKey:(id)a10 filenameExtension:(id)a11 applicationID:(id)a12 error:(id *)a13
{
  v45 = a13;
  id v55 = a1;
  unint64_t v56 = a9;
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v47 = *(void *)(v15 - 8);
  uint64_t v48 = v15;
  MEMORY[0x1F4188790](v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v57 = v18;
  uint64_t v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v58 = v19;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v51 = v21;
  uint64_t v52 = v20;
  id v22 = a7;
  id v23 = a8;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  uint64_t v50 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v28 = v27;

  uint64_t v49 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  id v30 = v29;

  uint64_t v31 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v33 = v32;

  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v36 = v35;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  *(void *)&long long v44 = v34;
  *((void *)&v44 + 1) = v36;
  unint64_t v46 = v33;
  *(void *)&long long v43 = v31;
  *((void *)&v43 + 1) = v33;
  *((void *)&v42 + 1) = v56;
  id v55 = v30;
  *(void *)&long long v42 = v30;
  uint64_t v37 = v49;
  *((void *)&v41 + 1) = v49;
  unint64_t v56 = v28;
  *(void *)&long long v41 = v28;
  uint64_t v38 = v50;
  id v39 = static CloudAssetsAssetStreamHandle.makeAssetStreamHandle(partition:owner:accessToken:requestorID:signature:referenceSignature:size:assetKey:filenameExtension:applicationID:)((uint64_t)v17, v54, v57, v53, v58, v52, v51, v50, v41, v42, v43, v44);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v17, v48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18AF5AF68(v31, v46);
  sub_18AF5AF68(v37, (unint64_t)v55);
  sub_18AF5AF68(v38, v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v39;
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
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v12 = self;
  v13 = (void *)CloudAssetsAssetStreamHandle.makeAVPlayerItem(with:options:)();

  swift_bridgeObjectRelease();
  sub_18AF8F1F4((uint64_t)v9);

  return v13;
}

- (id)makeAVAssetExportSessionWith:(id)a3 options:(id)a4 presetName:(id)a5
{
  uint64_t v8 = sub_18AF161EC(&qword_1E9126560);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
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
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  v14 = (void *)CloudAssetsAssetStreamHandle.makeAVAssetExportSession(with:options:presetName:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18AF8F1F4((uint64_t)v10);

  return v14;
}

- (id)initFrom:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  return CloudAssetsAssetStreamHandle.init(from:)(v5, v7);
}

- (id)serializedDataAndReturnError:(id *)a3
{
  v3 = self;
  uint64_t v4 = CloudAssetsAssetStreamHandle.serializedData()();
  unint64_t v6 = v5;

  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_18AF5AF68(v4, v6);

  return v7.super.isa;
}

- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8CloudKit28CloudAssetsAssetStreamHandle_assetStreamHandle;
  uint64_t v3 = type metadata accessor for AssetStreamHandle();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (int64_t)size
{
  v2 = self;
  int64_t v3 = CloudAssetsAssetStreamHandle.size.getter();

  return v3;
}

@end