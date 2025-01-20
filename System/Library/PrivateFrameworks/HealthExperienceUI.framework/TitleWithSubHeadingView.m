@interface TitleWithSubHeadingView
- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithFrame:(CGRect)a3;
@end

@implementation TitleWithSubHeadingView

- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  uint64_t v11 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel;
  *(Class *)((char *)&v10->super.super.super.isa + v11) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for TitleWithSubHeadingView();
  v12 = -[TitleWithSubHeadingView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1AD5A9F84();

  return v12;
}

- (_TtC18HealthExperienceUI23TitleWithSubHeadingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);

  result = (_TtC18HealthExperienceUI23TitleWithSubHeadingView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_headingLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI23TitleWithSubHeadingView_subHeadingLabel);
}

@end