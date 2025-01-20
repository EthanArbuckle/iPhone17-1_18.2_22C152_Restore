@interface ShelfFooterView
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider15ShelfFooterView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider15ShelfFooterView)initWithFrame:(CGRect)a3;
- (void)didTapWithTitleButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ShelfFooterView

- (_TtC18ASMessagesProvider15ShelfFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider15ShelfFooterView *)sub_666E50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider15ShelfFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_667F04();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_6672F4(v11);
  sub_FB9C(v11, v11[3]);
  id v4 = [(ShelfFooterView *)v3 traitCollection];
  sub_77B980();
  double v6 = v5;
  double v8 = v7;

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ShelfFooterView *)&v5 layoutSubviews];
  sub_6672F4(v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v6.receiver;
  [(ShelfFooterView *)&v6 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider15ShelfFooterView_separator];
  sub_FE2C(0, (unint64_t *)&qword_94FFD0);
  id v4 = (void *)sub_77E2F0();
  objc_msgSend(v3, "setBackgroundColor:", v4, v6.receiver, v6.super_class);

  objc_super v5 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider15ShelfFooterView_titleButton];
  [v5 setHidden:0];
  [v5 setTitle:0 forState:0];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithTitleButton:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_667780((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15ShelfFooterView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider15ShelfFooterView_titleButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider15ShelfFooterView_footerAction);

  sub_13308(v3);
}

@end