@interface OnboardingBottomButton
- (_TtC10StickerKit22OnboardingBottomButton)initWithCoder:(id)a3;
- (_TtC10StickerKit22OnboardingBottomButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateConfiguration;
@end

@implementation OnboardingBottomButton

- (void)updateConfiguration
{
  v2 = self;
  sub_245321C6C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_245321EF4();
}

- (_TtC10StickerKit22OnboardingBottomButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC10StickerKit22OnboardingBottomButton_effectLabel;
  id v10 = objc_allocWithZone(MEMORY[0x263F828E8]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[OnboardingBottomButton initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit22OnboardingBottomButton)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC10StickerKit22OnboardingBottomButton_effectLabel;
  id v7 = objc_allocWithZone(MEMORY[0x263F828E8]);
  id v8 = a3;
  uint64_t v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  id v10 = [(OnboardingBottomButton *)&v12 initWithCoder:v8];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit22OnboardingBottomButton_effectLabel));
}

@end