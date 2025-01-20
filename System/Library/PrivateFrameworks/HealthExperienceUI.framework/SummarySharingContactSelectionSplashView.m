@interface SummarySharingContactSelectionSplashView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithFrame:(CGRect)a3;
@end

@implementation SummarySharingContactSelectionSplashView

- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *)sub_1AD4033D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = sub_1AD73A4B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A460();
  v12 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler);
  if (v12)
  {
    id v13 = a3;
    v14 = self;
    uint64_t v15 = sub_1AD21485C((uint64_t)v12);
    v12(v15);
    sub_1AD1E4514((uint64_t)v12);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return 0;
}

- (void).cxx_destruct
{
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_openContactsHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI40SummarySharingContactSelectionSplashView_textView);
}

@end