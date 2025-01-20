@interface UnifiedButtonRow
- (void)layoutSubviews;
@end

@implementation UnifiedButtonRow

- (void)layoutSubviews
{
  v2 = self;
  sub_2358FF8C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_button0));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_button1));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_expansionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_sliderAnimator));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_scrollView);
}

@end