@interface StoreItemResponseSwift
+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5;
+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5 now:(id)a6 hourSpreadFactor:(id)a7;
- (_TtC9appstored22StoreItemResponseSwift)init;
@end

@implementation StoreItemResponseSwift

+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5
{
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001644C(&qword_1005A3658);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  static Date.now.getter();
  sub_10001F4D8(a3, a4, (uint64_t)v11, (uint64_t)v14, a5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v15 = type metadata accessor for DateInterval();
  uint64_t v16 = *(void *)(v15 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  }
  return isa;
}

+ (id)nextOptimalDownloadWindowWithHour:(int64_t)a3 minute:(int64_t)a4 duration:(double)a5 now:(id)a6 hourSpreadFactor:(id)a7
{
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001644C(&qword_1005A3658);
  __chkstk_darwin(v15 - 8);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a7);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  _Block_copy(v18);
  sub_100020220(a3, a4, (uint64_t)v14, (uint64_t (**)(void))v18, (uint64_t)v17, a5);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  _Block_release(v18);
  uint64_t v19 = type metadata accessor for DateInterval();
  uint64_t v20 = *(void *)(v19 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v17, 1, v19) != 1)
  {
    Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
  }
  return isa;
}

- (_TtC9appstored22StoreItemResponseSwift)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(StoreItemResponseSwift *)&v3 init];
}

@end