@interface IntelligenceServerControlProvider
- (_TtC13BuddyMigrator33IntelligenceServerControlProvider)init;
- (void)isFeatureEnabledFromCache:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation IntelligenceServerControlProvider

- (void)isFeatureEnabledFromCache:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_EC40(&qword_26F00);
  __chkstk_darwin(v7 - 8, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = v11;
  *(void *)(v12 + 32) = self;
  uint64_t v13 = sub_16520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_27028;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26E60;
  v15[5] = v14;
  v16 = self;
  sub_154BC((uint64_t)v10, (uint64_t)&unk_26F20, (uint64_t)v15);
  swift_release();
}

- (_TtC13BuddyMigrator33IntelligenceServerControlProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntelligenceServerControlProvider();
  return [(IntelligenceServerControlProvider *)&v3 init];
}

@end