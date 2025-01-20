@interface BlockShimForPBCodable
- (_TtC8Dendrite21BlockShimForPBCodable)init;
- (_TtC8Dendrite21BlockShimForPBCodable)initWithCoder:(id)a3;
- (_TtC8Dendrite21BlockShimForPBCodable)initWithData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BlockShimForPBCodable

- (_TtC8Dendrite21BlockShimForPBCodable)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error) = 0;
  id v4 = a3;

  result = (_TtC8Dendrite21BlockShimForPBCodable *)sub_24CA86600();
  __break(1u);
  return result;
}

- (void)writeTo:(id)a3
{
  id v4 = *(void (**)(void))((char *)&self->super.super.isa + OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_block);
  id v5 = a3;
  v6 = self;
  v4();
}

- (_TtC8Dendrite21BlockShimForPBCodable)init
{
  result = (_TtC8Dendrite21BlockShimForPBCodable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8Dendrite21BlockShimForPBCodable)initWithData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    sub_24CA86090();
  }
  result = (_TtC8Dendrite21BlockShimForPBCodable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Dendrite21BlockShimForPBCodable_error);
}

@end