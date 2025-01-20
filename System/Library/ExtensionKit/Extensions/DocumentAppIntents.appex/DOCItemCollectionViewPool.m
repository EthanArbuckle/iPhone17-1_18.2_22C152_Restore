@interface DOCItemCollectionViewPool
- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)init;
- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)initWithConfiguration:(id)a3;
@end

@implementation DOCItemCollectionViewPool

- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)initWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18DocumentAppIntents25DOCItemCollectionViewPool *)sub_1003F6628(v3);

  return v4;
}

- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)init
{
  result = (_TtC18DocumentAppIntents25DOCItemCollectionViewPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents25DOCItemCollectionViewPool_configuration));
  swift_bridgeObjectRelease();

  swift_release();
}

@end