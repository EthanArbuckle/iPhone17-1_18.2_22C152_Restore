@interface MetadataRibbonEditorsChoiceView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MetadataRibbonEditorsChoiceView

- (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView *)sub_111F58(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_id;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_itemType;
  uint64_t v7 = sub_774970();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_labelMaxWidth;
  *(void *)v8 = 0;
  v8[8] = 1;
  v9 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_truncationLegibilityThreshold;
  *(void *)v9 = 0;
  v9[8] = 1;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_allowsTruncation) = 2;
  id v10 = a3;

  result = (_TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_112A10();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_112CD4();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_leadingLaurelImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_trailingLaurelImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_editorsChoiceLabel));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_id, (uint64_t *)&unk_9563B0);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31MetadataRibbonEditorsChoiceView_itemType, &qword_9505D0);
}

@end