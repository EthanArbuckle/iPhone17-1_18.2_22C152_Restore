@interface ATXContextualEngine
+ (ATXContextualEngine)sharedInstance;
- (ATXContextualEngine)init;
- (void)donateRerankedBlendingSuggestions:(id)a3;
@end

@implementation ATXContextualEngine

+ (ATXContextualEngine)sharedInstance
{
  if (qword_1EBD24350 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBD24348;
  return (ATXContextualEngine *)v2;
}

- (ATXContextualEngine)init
{
  return (ATXContextualEngine *)sub_1D138E7C4();
}

- (void)donateRerankedBlendingSuggestions:(id)a3
{
  sub_1D138FAF4();
  uint64_t v4 = sub_1D13F2748();
  v5 = (void *)MEMORY[0x1E4FBC8C8];
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x88);
  v7 = self;
  v8 = (void *)v6();
  (*(void (**)(uint64_t))((*v5 & *v8) + 0xA8))(v4);

  v9 = (void *)(*(uint64_t (**)(void))((*v5 & (uint64_t)v7->super.isa) + 0xA0))();
  (*(void (**)(void))((*v5 & *v9) + 0x90))();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXContextualEngine_internalServer);
}

@end