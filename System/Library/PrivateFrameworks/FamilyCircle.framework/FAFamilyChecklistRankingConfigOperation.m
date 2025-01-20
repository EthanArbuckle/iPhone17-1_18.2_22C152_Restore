@interface FAFamilyChecklistRankingConfigOperation
- (_TtC13familycircled39FAFamilyChecklistRankingConfigOperation)initWithNetworkService:(id)a3;
- (void)familyChecklistRankingConfigWith:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation FAFamilyChecklistRankingConfigOperation

- (_TtC13familycircled39FAFamilyChecklistRankingConfigOperation)initWithNetworkService:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint;
  id v5 = a3;
  v6 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)String._bridgeToObjectiveC()();
  if (qword_10005E518 != -1) {
    swift_once();
  }
  uint64_t v7 = static FAFamilyChecklistRankingConfigCache.shared;
  v8 = (uint64_t *)((char *)v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
  v8[3] = type metadata accessor for FAFamilyChecklistRankingConfigCache();
  v8[4] = (uint64_t)&protocol witness table for FAFamilyChecklistRankingConfigCache;
  uint64_t *v8 = v7;
  swift_retain();

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for FAFamilyChecklistRankingConfigOperation();
  v9 = [(FANetworkClient *)&v11 initWithNetworkService:v5];

  return v9;
}

- (void)familyChecklistRankingConfigWith:(unint64_t)a3 completionHandler:(id)a4
{
  sub_100006CB4(&qword_10005E7B8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10005E868;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10005E7D0;
  v13[5] = v12;
  v14 = self;
  sub_100033A4C((uint64_t)v8, (uint64_t)&unk_10005E7D8, (uint64_t)v13);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint));
  v3 = (char *)self + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache;
  sub_100026F54((uint64_t)v3);
}

@end