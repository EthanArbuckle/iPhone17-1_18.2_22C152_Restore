@interface ProfileBarButton
- (_TtC18HealthExperienceUI16ProfileBarButton)init;
- (_TtC18HealthExperienceUI16ProfileBarButton)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI16ProfileBarButton)initWithFrame:(CGRect)a3;
- (void)openProfileViewControllerWithSender:(id)a3;
@end

@implementation ProfileBarButton

- (_TtC18HealthExperienceUI16ProfileBarButton)init
{
  return -[ProfileBarButton initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 34.0, 34.0);
}

- (_TtC18HealthExperienceUI16ProfileBarButton)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI16ProfileBarButton *)sub_1AD1C1274(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI16ProfileBarButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton____lazy_storage___meContactView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton_gestureRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProfileBarButton();
  return [(ProfileBarButton *)&v5 initWithCoder:a3];
}

- (void)openProfileViewControllerWithSender:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AD7404B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    objc_super v5 = self;
  }
  sub_1AD44BAB0();

  sub_1AD1CC09C((uint64_t)v6, (uint64_t)&qword_1EB7414B0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1AD1F67C0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton____lazy_storage___meContactView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI16ProfileBarButton_gestureRecognizer);
}

@end