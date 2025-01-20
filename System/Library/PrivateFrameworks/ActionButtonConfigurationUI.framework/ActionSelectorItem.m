@interface ActionSelectorItem
- (BOOL)canBeHighlighted;
- (NSString)identifier;
- (UIColor)color;
- (UIImage)image;
- (_TtC27ActionButtonConfigurationUI18ActionSelectorItem)init;
@end

@implementation ActionSelectorItem

- (UIColor)color
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured) == 1) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, *(double *)((char *)&self->super.isa+ OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor), *(double *)&self->sectionIdentifier[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor], *(double *)&self->title[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor], *(double *)&self->title[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor + 8]);
  }
  else {
    id v2 = 0;
  }
  return (UIColor *)v2;
}

- (UIImage)image
{
  id v2 = self;
  sub_2473E0FA8();
  v4 = v3;

  return (UIImage *)v4;
}

- (NSString)identifier
{
  sub_24740DCF0();
  id v2 = (void *)sub_24740DCC0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)canBeHighlighted
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured);
}

- (_TtC27ActionButtonConfigurationUI18ActionSelectorItem)init
{
  result = (_TtC27ActionButtonConfigurationUI18ActionSelectorItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end