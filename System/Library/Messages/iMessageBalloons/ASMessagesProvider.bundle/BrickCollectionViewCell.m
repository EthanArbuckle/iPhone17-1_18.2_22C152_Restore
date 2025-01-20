@interface BrickCollectionViewCell
- (_TtC18ASMessagesProvider23BrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23BrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BrickCollectionViewCell

- (_TtC18ASMessagesProvider23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider23BrickCollectionViewCell *)sub_37BDBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider23BrickCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_shortDescriptionLabel) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_shortDescriptionLabelText);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC18ASMessagesProvider23BrickCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_37C3A4();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(BrickCollectionViewCell *)&v4 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_shortDescriptionLabelText];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  swift_bridgeObjectRelease();
  sub_37C058();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_shortDescriptionLabel));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider23BrickCollectionViewCell_artworkView);
}

@end