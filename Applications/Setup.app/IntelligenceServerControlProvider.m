@interface IntelligenceServerControlProvider
- (_TtC5Setup33IntelligenceServerControlProvider)init;
- (void)isFeatureEnabledFromCache:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation IntelligenceServerControlProvider

- (void)isFeatureEnabledFromCache:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031D530;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031E190;
  v14[5] = v13;
  v15 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031D850, (uint64_t)v14);
  swift_release();
}

- (_TtC5Setup33IntelligenceServerControlProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligenceServerControlProvider();
  return [(IntelligenceServerControlProvider *)&v3 init];
}

@end