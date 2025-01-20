@interface AXBridgedSettings
- (AXBridgedSettings)init;
- (BOOL)observeWithSelector:(SEL)a3 listener:(id)a4 block:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation AXBridgedSettings

- (BOOL)observeWithSelector:(SEL)a3 listener:(id)a4 block:(id)a5
{
  v7 = _Block_copy(a5);
  swift_unknownObjectRetain();
  v8 = self;
  sub_18FD02660();
  swift_unknownObjectRelease();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  LOBYTE(a3) = AXBridgedSettings.observe(with:listener:block:)((uint64_t)a3, v10, (uint64_t)sub_18FCDD2A4, v9);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  return a3 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v4 = self;
  AXBridgedSettings.forwardingTarget(for:)((uint64_t)a3, (uint64_t)v12);

  uint64_t v5 = v13;
  if (v13)
  {
    v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)sub_18FD02BF0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (AXBridgedSettings)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXBridgedSettings____lazy_storage___selectorTargetMap) = 0;
  v3.receiver = self;
  v3.super_class = (Class)AXBridgedSettings;
  return [(AXBridgedSettings *)&v3 init];
}

- (void).cxx_destruct
{
}

@end