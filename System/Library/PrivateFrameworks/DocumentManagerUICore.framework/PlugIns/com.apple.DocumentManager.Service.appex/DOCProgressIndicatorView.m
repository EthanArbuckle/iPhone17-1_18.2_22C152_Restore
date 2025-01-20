@interface DOCProgressIndicatorView
- (_TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView)initWithFrame:(CGRect)a3;
- (double)fractionCompleted;
- (void)setFractionCompleted:(double)a3;
@end

@implementation DOCProgressIndicatorView

- (double)fractionCompleted
{
  return *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView_fractionCompleted);
}

- (void)setFractionCompleted:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView_fractionCompleted) = a3;
  v3 = self;
  sub_1001E4580();
}

- (_TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView_preferredIconColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCProgressIndicatorView_contentView);
}

@end