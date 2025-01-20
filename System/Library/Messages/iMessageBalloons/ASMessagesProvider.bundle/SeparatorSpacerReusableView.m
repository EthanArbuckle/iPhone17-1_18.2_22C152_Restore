@interface SeparatorSpacerReusableView
- (_TtC18ASMessagesProvider27SeparatorSpacerReusableView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorSpacerReusableView

- (_TtC18ASMessagesProvider27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider27SeparatorSpacerReusableView *)sub_66FB74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider27SeparatorSpacerReusableView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC18ASMessagesProvider27SeparatorSpacerReusableView_separatorInsets);
  long long v6 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v5[1] = v6;
  uint64_t v7 = OBJC_IVAR____TtC18ASMessagesProvider27SeparatorSpacerReusableView_lineView;
  id v8 = objc_allocWithZone((Class)UIView);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)objc_msgSend(v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC18ASMessagesProvider27SeparatorSpacerReusableView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_66FE14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27SeparatorSpacerReusableView_lineView));
}

@end