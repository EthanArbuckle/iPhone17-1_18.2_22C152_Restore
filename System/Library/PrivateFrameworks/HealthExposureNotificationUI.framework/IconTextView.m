@interface IconTextView
- (CGSize)intrinsicContentSize;
- (UIColor)tintColor;
- (_TtC28HealthExposureNotificationUI12IconTextView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI12IconTextView)initWithFrame:(CGRect)a3;
- (void)didTapText:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation IconTextView

- (_TtC28HealthExposureNotificationUI12IconTextView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack;
  id v6 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);

  result = (_TtC28HealthExposureNotificationUI12IconTextView *)sub_2294195F8();
  __break(1u);
  return result;
}

- (void)didTapText:(id)a3
{
  if (MEMORY[0x22A6B8930]((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate, a2))
  {
    id v5 = a3;
    id v6 = self;
    sub_2293BE608();

    swift_unknownObjectRelease();
  }
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack), sel_frame);
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  double v2 = [(IconTextView *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v6 = a3;
  id v7 = self;
  [(IconTextView *)&v11 setTintColor:v6];
  uint64_t v8 = *(Class *)((char *)&v7->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = [(IconTextView *)&v10 tintColor];
  objc_msgSend(v8, sel_setTintColor_, v9);
}

- (_TtC28HealthExposureNotificationUI12IconTextView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_icon));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2293A5F58((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_textStack));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI12IconTextView_iconView);
}

@end