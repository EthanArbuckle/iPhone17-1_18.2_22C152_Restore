@interface ProfileGradientView
+ (Class)layerClass;
- (_TtC18HealthExperienceUI19ProfileGradientView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19ProfileGradientView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)updateGradient;
@end

@implementation ProfileGradientView

- (_TtC18HealthExperienceUI19ProfileGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI19ProfileGradientView *)sub_1AD1C1670(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1AD1B341C();
}

+ (Class)layerClass
{
  type metadata accessor for GradientLayer();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)updateGradient
{
  v2 = self;
  sub_1AD5F4C50();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI19ProfileGradientView_displayLink);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for ProfileGradientView();
    [(ProfileGradientView *)&v4 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI19ProfileGradientView_displayLink));
}

- (_TtC18HealthExperienceUI19ProfileGradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD5F5818();
}

@end