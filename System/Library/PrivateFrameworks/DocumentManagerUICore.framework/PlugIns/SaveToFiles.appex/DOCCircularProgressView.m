@interface DOCCircularProgressView
- (_TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10043D0CC();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_10043B394();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10043B4D4(v4);
}

- (_TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFilesP33_E00FC2276126AB757D5E26B73731E9B223DOCCircularProgressView_progressBackgroundColor);
}

@end