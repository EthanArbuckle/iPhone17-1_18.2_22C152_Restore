@interface SettingsButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport14SettingsButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport14SettingsButton)initWithFrame:(CGRect)a3;
- (void)didTapSettingsButton:(id)a3;
@end

@implementation SettingsButton

- (_TtC16MagnifierSupport14SettingsButton)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport14SettingsButton *)sub_2358EED78(a3);
}

- (_TtC16MagnifierSupport14SettingsButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_settingsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset) = xmmword_23595DBF0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SettingsButton();
  v8 = -[SettingsButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_2358EEEE8();

  return v8;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SettingsButton();
  id v4 = a3;
  v5 = (char *)v13.receiver;
  [(SettingsButton *)&v13 menuAttachmentPointForConfiguration:v4];
  double v7 = v6;
  double v8 = *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset + 8];
  double v10 = v9 + *(double *)&v5[OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_offset];

  double v11 = v7 + v8;
  double v12 = v10;
  result.double y = v11;
  result.double x = v12;
  return result;
}

- (void)didTapSettingsButton:(id)a3
{
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport14SettingsButton_settingsDelegate, a2))
  {
    id v5 = a3;
    double v6 = self;
    sub_235872C94();

    swift_unknownObjectRelease();
  }
}

- (NSString)largeContentTitle
{
  sub_2358EF5D0();
  if (v2)
  {
    v3 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (UIImage)largeContentImage
{
  id v2 = sub_2358EF444();
  return (UIImage *)v2;
}

- (void).cxx_destruct
{
}

@end