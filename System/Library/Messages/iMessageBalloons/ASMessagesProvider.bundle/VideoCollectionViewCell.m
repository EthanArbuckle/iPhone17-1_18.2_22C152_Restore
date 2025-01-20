@interface VideoCollectionViewCell
- (_TtC18ASMessagesProvider23VideoCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23VideoCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation VideoCollectionViewCell

- (_TtC18ASMessagesProvider23VideoCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_772A80();
  swift_unknownObjectWeakInit();

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  v8 = -[VideoCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  id v9 = [(VideoCollectionViewCell *)v8 contentView];
  objc_msgSend(v9, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v8;
}

- (_TtC18ASMessagesProvider23VideoCollectionViewCell)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_772A80();
  swift_unknownObjectWeakInit();

  result = (_TtC18ASMessagesProvider23VideoCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = v3.receiver;
  [(VideoCollectionViewCell *)&v3 prepareForReuse];
  sub_5C69B0();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for VideoCollectionViewCell();
  id v2 = v13.receiver;
  [(VideoCollectionViewCell *)&v13 layoutSubviews];
  id v3 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_2C368();
  sub_772580();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  objc_msgSend(Strong, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  id v2 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider23VideoCollectionViewCell_configuration;
  uint64_t v3 = sub_772B40();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_unknownObjectWeakDestroy();
}

@end