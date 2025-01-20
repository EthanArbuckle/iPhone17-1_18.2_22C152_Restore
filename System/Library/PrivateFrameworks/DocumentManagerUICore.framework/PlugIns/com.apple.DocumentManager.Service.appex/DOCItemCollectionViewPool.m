@interface DOCItemCollectionViewPool
- (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool)init;
- (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool)initWithConfiguration:(id)a3;
@end

@implementation DOCItemCollectionViewPool

- (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool)initWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool *)sub_10041258C(v3);

  return v4;
}

- (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool)init
{
  result = (_TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service25DOCItemCollectionViewPool_configuration));
  swift_bridgeObjectRelease();
  swift_release();
}

@end