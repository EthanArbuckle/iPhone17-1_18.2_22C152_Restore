@interface CCUIModuleIconElement
- (BOOL)expandsGridSizeClassesForAccessibility;
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_canBeAddedToStack;
- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3;
- (BOOL)sbh_supportsRemovableBackground;
- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies;
- (CCUIModuleIconElement)init;
- (CCUIModuleIconElement)initWithModuleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 standardSupportedGridSizeClasses:(id)a5 expandsGridSizeClassesForAccessibility:(BOOL)a6;
- (CCUIModuleIconElement)initWithUniqueIdentifier:(id)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 standardSupportedGridSizeClasses:(id)a6 expandsGridSizeClassesForAccessibility:(BOOL)a7;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)moduleIdentifier;
- (NSString)sbh_appName;
- (NSString)sbh_galleryItemIdentifier;
- (NSString)sbh_widgetDescription;
- (NSString)sbh_widgetName;
- (NSString)uniqueIdentifier;
- (SBHIconGridSizeClassSet)standardSupportedGridSizeClasses;
- (SBHIconGridSizeClassSet)supportedGridSizeClasses;
- (UIColor)accentColor;
- (UIColor)backgroundColor;
- (UIColor)mostInterestingColor;
- (id)copyWithUniqueIdentifier;
- (id)copyWithZone:(void *)a3;
- (id)icon:(id)a3 displayNameForLocation:(id)a4;
- (id)supportedGridSizeClassesForIcon:(id)a3;
- (int64_t)hash;
- (int64_t)preferredGallerySizeClass;
- (unint64_t)priorityForIcon:(id)a3;
- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3;
- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3;
- (unint64_t)sbh_supportedSizeClasses;
- (void)appendDescriptionToStream:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPreferredGallerySizeClass:(int64_t)a3;
- (void)updateSupportedGridSizeClassesForAccessibilityContentSizeCategory:(BOOL)a3;
@end

@implementation CCUIModuleIconElement

- (NSString)moduleIdentifier
{
  return (NSString *)sub_24A7C8148();
}

- (NSString)containerBundleIdentifier
{
  return (NSString *)sub_24A7C8148();
}

- (SBHIconGridSizeClassSet)standardSupportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses));
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility);
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return (SBHIconGridSizeClassSet *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses));
}

- (NSString)uniqueIdentifier
{
  return (NSString *)sub_24A7C8148();
}

- (NSString)displayName
{
  v2 = (char *)self + OBJC_IVAR___CCUIModuleIconElement_displayName;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24A7DCA40();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)preferredGallerySizeClass
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredGallerySizeClass:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (void)updateSupportedGridSizeClassesForAccessibilityContentSizeCategory:(BOOL)a3
{
  uint64_t v4 = self;
  sub_24A7C85A0(a3);
}

- (CCUIModuleIconElement)initWithModuleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 standardSupportedGridSizeClasses:(id)a5 expandsGridSizeClassesForAccessibility:(BOOL)a6
{
  BOOL v18 = a6;
  v17 = self;
  uint64_t v7 = sub_24A7DC930();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7DCA40();
  sub_24A7DCA40();
  id v11 = a5;
  sub_24A7DC920();
  sub_24A7DC910();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  v15 = [(CCUIModuleIconElement *)v17 initWithUniqueIdentifier:v12 moduleIdentifier:v13 containerBundleIdentifier:v14 standardSupportedGridSizeClasses:v11 expandsGridSizeClassesForAccessibility:v18];

  return v15;
}

- (CCUIModuleIconElement)initWithUniqueIdentifier:(id)a3 moduleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 standardSupportedGridSizeClasses:(id)a6 expandsGridSizeClassesForAccessibility:(BOOL)a7
{
  uint64_t v9 = sub_24A7DCA40();
  uint64_t v11 = v10;
  uint64_t v12 = sub_24A7DCA40();
  uint64_t v14 = v13;
  uint64_t v15 = sub_24A7DCA40();
  uint64_t v17 = v16;
  id v18 = a6;
  v19 = (CCUIModuleIconElement *)sub_24A7CA660(v9, v11, v12, v14, v15, v17, v18, a7);

  return v19;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = [(CCUIModuleIconElement *)v8 displayName];
  if (v9)
  {
    uint64_t v10 = v9;
    sub_24A7DCA40();

    uint64_t v11 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v11 = 0;
  }
  return v11;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  v3 = [(CCUIModuleIconElement *)self supportedGridSizeClasses];
  return v3;
}

- (id)copyWithUniqueIdentifier
{
  v2 = self;
  v3 = CCUIModuleIconElement.copyWithUniqueIdentifier()();

  return v3;
}

- (int64_t)hash
{
  v2 = self;
  unint64_t v3 = CCUIModuleIconElement.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_24A7DCC20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = CCUIModuleIconElement.isEqual(_:)((uint64_t)v8);

  sub_24A7CA94C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  unint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = objc_msgSend(v3, sel_descriptionForRootObject_, v4);
  sub_24A7DCA40();

  char v6 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (id)copyWithZone:(void *)a3
{
  unint64_t v3 = self;
  sub_24A7C974C(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_24A7DCD70();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  id v5 = self;
  CCUIModuleIconElement.appendDescription(to:)(v4);
}

- (CCUIModuleIconElement)init
{
  result = (CCUIModuleIconElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  unint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses);
}

- (NSString)sbh_galleryItemIdentifier
{
  v2 = self;
  CCUIModuleIconElement.sbh_galleryItemIdentifier.getter();

  unint64_t v3 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)sbh_appName
{
  v2 = self;
  CCUIModuleIconElement.sbh_appName.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)sbh_widgetName
{
  v2 = self;
  uint64_t v3 = [(CCUIModuleIconElement *)v2 displayName];
  if (!v3) {
    uint64_t v3 = [(CCUIModuleIconElement *)v2 moduleIdentifier];
  }
  sub_24A7DCA40();

  uint64_t v4 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (unint64_t)sbh_supportedSizeClasses
{
  return 0;
}

- (NSString)sbh_widgetDescription
{
  return (NSString *)0;
}

- (BOOL)sbh_canBeAddedToStack
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackground
{
  return 0;
}

- (BOOL)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (UIColor)backgroundColor
{
  return (UIColor *)0;
}

- (UIColor)accentColor
{
  return (UIColor *)0;
}

- (UIColor)mostInterestingColor
{
  return (UIColor *)0;
}

- (unint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (unint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:(unint64_t)a3
{
  return 0;
}

- (BOOL)sbh_isLinkedOnOrAfter:(unint64_t)a3
{
  return 1;
}

@end