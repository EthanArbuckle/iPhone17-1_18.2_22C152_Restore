@interface BusinessDetailsViewModel
- (_TtC7ChatKit24BusinessDetailsViewModel)init;
- (_TtC7ChatKit24BusinessDetailsViewModel)initWithConversation:(id)a3;
@end

@implementation BusinessDetailsViewModel

- (_TtC7ChatKit24BusinessDetailsViewModel)initWithConversation:(id)a3
{
  id v3 = a3;
  sub_18F734594(v3);
  v5 = v4;

  return v5;
}

- (_TtC7ChatKit24BusinessDetailsViewModel)init
{
  result = (_TtC7ChatKit24BusinessDetailsViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC7ChatKit24BusinessDetailsViewModel___observationRegistrar;
  uint64_t v4 = sub_18F7B6470();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end