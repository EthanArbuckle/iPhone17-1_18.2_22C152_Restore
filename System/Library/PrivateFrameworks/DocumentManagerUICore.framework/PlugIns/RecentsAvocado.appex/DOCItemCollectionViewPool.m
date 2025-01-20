@interface DOCItemCollectionViewPool
- (_TtC14RecentsAvocado25DOCItemCollectionViewPool)init;
- (_TtC14RecentsAvocado25DOCItemCollectionViewPool)initWithConfiguration:(id)a3;
@end

@implementation DOCItemCollectionViewPool

- (_TtC14RecentsAvocado25DOCItemCollectionViewPool)initWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (_TtC14RecentsAvocado25DOCItemCollectionViewPool *)sub_1003D35E4(v3);

  return v4;
}

- (_TtC14RecentsAvocado25DOCItemCollectionViewPool)init
{
  result = (_TtC14RecentsAvocado25DOCItemCollectionViewPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado25DOCItemCollectionViewPool_configuration));
  swift_bridgeObjectRelease();
  swift_release();
}

@end