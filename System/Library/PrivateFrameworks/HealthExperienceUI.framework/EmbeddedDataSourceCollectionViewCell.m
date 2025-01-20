@interface EmbeddedDataSourceCollectionViewCell
- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)prepareForReuse;
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation EmbeddedDataSourceCollectionViewCell

- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_eventHandlerSink) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  v9 = (objc_class *)type metadata accessor for EmbeddedDataSourceCollectionViewCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[EmbeddedDataSourceCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_eventHandlerSink) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  id v6 = a3;

  result = (_TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmbeddedDataSourceCollectionViewCell();
  id v2 = v7.receiver;
  [(EmbeddedDataSourceCollectionViewCell *)&v7 prepareForReuse];
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v3 = (uint64_t)v2 + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  swift_beginAccess();
  sub_1AD1EF2DC(v3, (uint64_t)v4);
  swift_beginAccess();
  sub_1AD205C2C((uint64_t)v5, v3);
  swift_endAccess();
  sub_1AD6E8464((uint64_t)v4);
  sub_1AD1E1AA8((uint64_t)v5);
  sub_1AD1E1AA8((uint64_t)v4);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1AD6E8DC4((uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_collectionViewController));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI36EmbeddedDataSourceCollectionViewCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20E2C8();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73D2B0();
  [(EmbeddedDataSourceCollectionViewCell *)self invalidateIntrinsicContentSize];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end