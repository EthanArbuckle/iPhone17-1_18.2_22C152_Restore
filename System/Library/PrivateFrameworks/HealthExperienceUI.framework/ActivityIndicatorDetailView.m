@interface ActivityIndicatorDetailView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithFrame:(CGRect)a3;
@end

@implementation ActivityIndicatorDetailView

- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27ActivityIndicatorDetailView *)sub_1AD62EC00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27ActivityIndicatorDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD630F7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView____lazy_storage___detailTextView));
  sub_1AD2EFD40((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_action);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_titleTopOrCenterAnchor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI27ActivityIndicatorDetailView_detailTextViewTopAnchor);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = sub_1AD73A4B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A460();
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1AD6310E8((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end