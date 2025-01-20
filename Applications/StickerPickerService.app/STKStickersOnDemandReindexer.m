@interface STKStickersOnDemandReindexer
+ (void)reindexStickersIfNecessaryWithCompletionHandler:(id)a3;
- (STKStickersOnDemandReindexer)init;
@end

@implementation STKStickersOnDemandReindexer

+ (void)reindexStickersIfNecessaryWithCompletionHandler:(id)a3
{
  sub_100007848(&qword_100015B50);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_100015A18;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100015A28;
  v11[5] = v10;
  sub_100009544((uint64_t)v6, (uint64_t)&unk_100015A38, (uint64_t)v11);
  swift_release();
}

- (STKStickersOnDemandReindexer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return [(STKStickersOnDemandReindexer *)&v3 init];
}

@end