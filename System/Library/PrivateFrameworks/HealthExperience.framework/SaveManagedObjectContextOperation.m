@interface SaveManagedObjectContextOperation
- (_TtC16HealthExperience33SaveManagedObjectContextOperation)init;
- (void)main;
@end

@implementation SaveManagedObjectContextOperation

- (void)main
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthExperience33SaveManagedObjectContextOperation_context);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = self;
  v7[4] = sub_1C284B2C8;
  v7[5] = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1C27BC934;
  v7[3] = &block_descriptor_8;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_release();
  objc_msgSend(v3, sel_performBlock_, v5);
  _Block_release(v5);
}

- (_TtC16HealthExperience33SaveManagedObjectContextOperation)init
{
  result = (_TtC16HealthExperience33SaveManagedObjectContextOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthExperience33SaveManagedObjectContextOperation_context));
}

@end