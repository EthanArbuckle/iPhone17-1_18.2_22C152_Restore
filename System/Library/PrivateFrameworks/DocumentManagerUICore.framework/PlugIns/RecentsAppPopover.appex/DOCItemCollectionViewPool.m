@interface DOCItemCollectionViewPool
- (_TtC17RecentsAppPopover25DOCItemCollectionViewPool)init;
- (_TtC17RecentsAppPopover25DOCItemCollectionViewPool)initWithConfiguration:(id)a3;
@end

@implementation DOCItemCollectionViewPool

- (_TtC17RecentsAppPopover25DOCItemCollectionViewPool)initWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (_TtC17RecentsAppPopover25DOCItemCollectionViewPool *)sub_100395604(v3);

  return v4;
}

- (_TtC17RecentsAppPopover25DOCItemCollectionViewPool)init
{
  result = (_TtC17RecentsAppPopover25DOCItemCollectionViewPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover25DOCItemCollectionViewPool_configuration));
  swift_bridgeObjectRelease();
  swift_release();
}

@end