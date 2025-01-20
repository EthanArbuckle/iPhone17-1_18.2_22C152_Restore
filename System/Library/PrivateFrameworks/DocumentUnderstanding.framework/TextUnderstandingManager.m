@interface TextUnderstandingManager
+ (_TtC21DocumentUnderstanding24TextUnderstandingManager)shared;
- (_TtC21DocumentUnderstanding24TextUnderstandingManager)init;
- (int64_t)getExtractionCategoryFrom:(id)a3;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)extractEventWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int64_t)a5 completion:(id)a6;
- (void)extractPersonalIDWithLines:(id)a3 pid:(int64_t)a4 completion:(id)a5;
- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5;
- (void)incrementallyUpdatePoem;
- (void)onBoardPoem;
- (void)pingWithReply:(id)a3;
- (void)triggerSpotlightFileUpdateNoArgsWithReply:(id)a3;
@end

@implementation TextUnderstandingManager

+ (_TtC21DocumentUnderstanding24TextUnderstandingManager)shared
{
  id v2 = static TextUnderstandingManager.shared.getter();
  return (_TtC21DocumentUnderstanding24TextUnderstandingManager *)v2;
}

- (_TtC21DocumentUnderstanding24TextUnderstandingManager)init
{
  return (_TtC21DocumentUnderstanding24TextUnderstandingManager *)sub_2368B7E94();
}

- (void)pingWithReply:(id)a3
{
}

- (void)triggerSpotlightFileUpdateNoArgsWithReply:(id)a3
{
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_2368BDD94();
  uint64_t v7 = sub_23697B1DC();
  uint64_t v8 = sub_23697AF6C();
  uint64_t v10 = v9;
  _Block_copy(v6);
  v11 = self;
  sub_2368B87E4(v7, v8, v10, (uint64_t)v11, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = sub_23697A24C();
  unint64_t v12 = v11;

  _Block_copy(v8);
  sub_2368B8C70(v10, v12, a4, (uint64_t)v13, (void (**)(void, void))v8);
  _Block_release(v8);
  sub_2367B8A20(v10, v12);
}

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  id v8 = a3;
  unint64_t v12 = self;
  uint64_t v9 = sub_23697A24C();
  unint64_t v11 = v10;

  *(void *)(swift_allocObject() + 16) = v7;
  TextUnderstandingManager.foundInEventResult(withSerializedDocument:documentType:completion:)();
  swift_release();
  sub_2367B8A20(v9, v11);
}

- (void)onBoardPoem
{
  id v2 = self;
  TextUnderstandingManager.onBoardPoem()();
}

- (void)incrementallyUpdatePoem
{
  id v2 = self;
  TextUnderstandingManager.incrementallyUpdatePoem()();
}

- (int64_t)getExtractionCategoryFrom:(id)a3
{
  sub_2367B7DBC(&qword_2688984E0);
  uint64_t v4 = sub_23697B1DC();
  v5 = self;
  int64_t v6 = sub_2368BB270(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)extractPersonalIDWithLines:(id)a3 pid:(int64_t)a4 completion:(id)a5
{
  int64_t v6 = _Block_copy(a5);
  sub_23697B1DC();
  *(void *)(swift_allocObject() + 16) = v6;
  uint64_t v7 = self;
  TextUnderstandingManager.extractPersonalID(withLines:pid:completion:)();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)extractEventWithSerializedDocument:(id)a3 documentType:(int64_t)a4 pid:(int64_t)a5 completion:(id)a6
{
  id v8 = _Block_copy(a6);
  id v9 = a3;
  v13 = self;
  uint64_t v10 = sub_23697A24C();
  unint64_t v12 = v11;

  *(void *)(swift_allocObject() + 16) = v8;
  TextUnderstandingManager.extractEvent(withSerializedDocument:documentType:pid:completion:)();
  swift_release();
  sub_2367B8A20(v10, v12);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager_foundInEventsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___client));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___updater));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21DocumentUnderstanding24TextUnderstandingManager____lazy_storage___bulkupdater);
}

@end