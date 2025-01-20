@interface DOCBlockOperation
- (_TtC26DocumentManagerExecutables17DOCBlockOperation)init;
- (void)main;
@end

@implementation DOCBlockOperation

- (void)main
{
  v3 = *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t))((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCBlockOperation_block);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = self;
  v5 = self;
  v3(sub_22BE6A26C, v4);

  swift_release();
}

- (_TtC26DocumentManagerExecutables17DOCBlockOperation)init
{
  result = (_TtC26DocumentManagerExecutables17DOCBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end