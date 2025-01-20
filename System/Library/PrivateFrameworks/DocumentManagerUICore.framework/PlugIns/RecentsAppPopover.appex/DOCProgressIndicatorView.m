@interface DOCProgressIndicatorView
- (_TtC17RecentsAppPopover24DOCProgressIndicatorView)initWithFrame:(CGRect)a3;
- (double)fractionCompleted;
- (void)setFractionCompleted:(double)a3;
@end

@implementation DOCProgressIndicatorView

- (double)fractionCompleted
{
  return *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC17RecentsAppPopover24DOCProgressIndicatorView_fractionCompleted);
}

- (void)setFractionCompleted:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC17RecentsAppPopover24DOCProgressIndicatorView_fractionCompleted) = a3;
  v3 = self;
  sub_10028D438();
}

- (_TtC17RecentsAppPopover24DOCProgressIndicatorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover24DOCProgressIndicatorView_preferredIconColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover24DOCProgressIndicatorView_contentView);
}

@end