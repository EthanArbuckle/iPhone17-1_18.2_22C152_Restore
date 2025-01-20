@interface LinkableTextCollectionViewCell
- (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel)accessibilityBodyLabel;
- (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LinkableTextCollectionViewCell

- (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell *)sub_3CC578();
}

- (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_bodyText;
  uint64_t v8 = sub_FD50(&qword_961AA0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;

  result = (_TtC18ASMessagesProvider30LinkableTextCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3CC004();
}

- (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel)accessibilityBodyLabel
{
  return (_TtC18ASMessagesProvider22DynamicTypeLinkedLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_bodyLabel);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_bodyLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider30LinkableTextCollectionViewCell_bodyText, &qword_961A98);
}

@end