@interface ProductTitleView.IconTitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView)initWithCoder:(id)a3;
- (_TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTitleView.IconTitleView

- (_TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView *)sub_5C5274(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5C5E7C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_5C393C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5C55FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView_appTitleView));
  sub_14C88((uint64_t)self+ OBJC_IVAR____TtCC18ASMessagesProvider16ProductTitleViewP33_B6FD29DCFB294C5E4B32A2A2A0D38B9713IconTitleView_iconAspectRatio, (uint64_t *)&unk_95A6C0);
}

@end