@interface ViewProperties#1inCCUIControlTemplateView.updateProperties(_:animated:)
- (BOOL)isEnabled;
- (BOOL)isRedacted;
- (BOOL)isSelected;
- (NSString)subtitle;
- (NSString)title;
- (_TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties)init;
- (id)copyWithZone:()_:animated:;
- (void)setEnabled:()_:animated:;
- (void)setRedacted:()_:animated:;
- (void)setSelected:()_:animated:;
- (void)setSubtitle:()_:animated:;
- (void)setTitle:()_:animated:;
@end

@implementation ViewProperties#1inCCUIControlTemplateView.updateProperties(_:animated:)

- (NSString)title
{
  return (NSString *)sub_1D8379280((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_title);
}

- (void)setTitle:()_:animated:
{
}

- (NSString)subtitle
{
  return (NSString *)sub_1D8379280((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_subtitle);
}

- (void)setSubtitle:()_:animated:
{
}

- (BOOL)isEnabled
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isEnabled);
}

- (void)setEnabled:()_:animated:
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isEnabled) = a3;
}

- (BOOL)isRedacted
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isRedacted);
}

- (void)setRedacted:()_:animated:
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isRedacted) = a3;
}

- (BOOL)isSelected
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isSelected);
}

- (void)setSelected:()_:animated:
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties_isSelected) = a3;
}

- (id)copyWithZone:()_:animated:
{
  v4 = (char *)objc_allocWithZone((Class)_s14ViewPropertiesCMa());
  v5 = self;
  id v6 = sub_1D837BC24(v5, v4);

  return v6;
}

- (_TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties)init
{
  result = (_TtCFE18ControlCenterUIKitCSo23CCUIControlTemplateView16updatePropertiesFTFPSo33CCUIControlTemplateViewProperties_T_8animatedSb_T_L_14ViewProperties *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end