@interface HUDashboardContext
+ (id)camerasDashboardWithTitle:(id)a3 forHome:(id)a4;
+ (id)categoryDashboardForAccessoryTypeGroup:(id)a3 home:(id)a4 room:(id)a5;
+ (id)homeDashboardForHome:(id)a3;
+ (id)roomDashboardForRoom:(id)a3 home:(id)a4;
+ (id)scenesDashboardWithTitle:(id)a3 forHome:(id)a4;
+ (id)speakersAndTVsDashboardWithTitle:(id)a3 forHome:(id)a4;
- (BOOL)accessoryRepresentableHasStandardTileRepresentation:(id)a3;
- (BOOL)allowsAdding;
- (BOOL)allowsAnnounce;
- (BOOL)allowsEditing;
- (BOOL)allowsEnergyIndicator;
- (BOOL)allowsHomeNavigation;
- (BOOL)canPresentDetailsViewControllerForSectionWithIdentifier:(id)a3;
- (BOOL)canShowHeaderForSectionWithIdentifier:(id)a3;
- (BOOL)canShowNoHomeAccessView;
- (BOOL)includePredictedScenes;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCreateModule:(Class)a3;
- (BOOL)shouldDelayItemUpdatesForViewVisibility;
- (BOOL)shouldHideAccessoryRepresentable:(id)a3;
- (BOOL)shouldHideEmptySections;
- (BOOL)shouldHideForGuests;
- (BOOL)shouldHideHomeKitObject:(id)a3;
- (BOOL)shouldHideInRoomSectionForAccessoryRepresentableItem:(id)a3;
- (BOOL)shouldHidePlaceholderService;
- (BOOL)shouldHideSectionWithIdentifier:(id)a3;
- (BOOL)shouldHideStatusItemClass:(Class)a3;
- (BOOL)shouldIncludeRoomInAccessoryNames;
- (HFAccessoryTypeGroup)accessoryTypeGroup;
- (HMHome)home;
- (HMRoom)room;
- (HUDashboardContext)init;
- (NSString)description;
- (NSString)menuEditActionTitle;
- (NSString)menuEditActionTitleLocalizationKey;
- (NSString)overrideDashboardTitle;
- (NSString)typeDescriptionForAnalytics;
- (int64_t)accessoryGroupingStyle;
- (int64_t)backgroundStyle;
- (int64_t)cameraPresentationStyle;
- (int64_t)filterPresentationStyle;
- (int64_t)maximumNumberOfItemsInSectionWithIdentifier:(id)a3;
- (int64_t)scenePresentationStyle;
- (unint64_t)accessoryLikeItemObjectLevel;
- (void)setAccessoryGroupingStyle:(int64_t)a3;
- (void)setAccessoryLikeItemObjectLevel:(unint64_t)a3;
- (void)setAllowsAdding:(BOOL)a3;
- (void)setAllowsAnnounce:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsEnergyIndicator:(BOOL)a3;
- (void)setAllowsHomeNavigation:(BOOL)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setCameraPresentationStyle:(int64_t)a3;
- (void)setFilterPresentationStyle:(int64_t)a3;
- (void)setIncludePredictedScenes:(BOOL)a3;
- (void)setOverrideDashboardTitle:(id)a3;
- (void)setScenePresentationStyle:(int64_t)a3;
- (void)setShouldDelayItemUpdatesForViewVisibility:(BOOL)a3;
- (void)setShouldHideEmptySections:(BOOL)a3;
- (void)setShouldHideForGuests:(BOOL)a3;
- (void)setShouldHidePlaceholderService:(BOOL)a3;
- (void)setShouldIncludeRoomInAccessoryNames:(BOOL)a3;
@end

@implementation HUDashboardContext

+ (id)homeDashboardForHome:(id)a3
{
  id v3 = a3;
  v4 = sub_1BE4AC62C(v3);

  return v4;
}

+ (id)roomDashboardForRoom:(id)a3 home:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_1BE4AC420(v5, v6);

  return v7;
}

+ (id)categoryDashboardForAccessoryTypeGroup:(id)a3 home:(id)a4 room:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = sub_1BE4ACAAC(v7, v8, a5);

  return v10;
}

+ (id)camerasDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1BE4A6D70((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1BE4ACD08);
}

+ (id)scenesDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1BE4A6D70((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1BE4ACEB0);
}

+ (id)speakersAndTVsDashboardWithTitle:(id)a3 forHome:(id)a4
{
  return sub_1BE4A6D70((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, id))sub_1BE4AD00C);
}

- (HUDashboardContext)init
{
}

- (NSString)description
{
  v2 = self;
  sub_1BE4A6F18();

  id v3 = (void *)sub_1BE9C49B8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BE9C5638();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_1BE4A7168((uint64_t)v8);

  sub_1BE39DA0C((uint64_t)v8, (uint64_t *)&unk_1EBA45A30);
  return v6 & 1;
}

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___HUDashboardContext_home));
}

- (HMRoom)room
{
  return (HMRoom *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___HUDashboardContext_room));
}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  if (self->home[OBJC_IVAR___HUDashboardContext_type]) {
    id v2 = 0;
  }
  else {
    id v2 = *(id *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type);
  }

  return (HFAccessoryTypeGroup *)v2;
}

- (NSString)typeDescriptionForAnalytics
{
  return (NSString *)sub_1BE4A7D50(self, (uint64_t)a2, (void (*)(void))sub_1BE4A770C);
}

- (NSString)menuEditActionTitle
{
  id v2 = self;
  sub_1BE4A7DD0();
  v4 = v3;
  if (v3)
  {
    id v5 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
    char v6 = HULocalizedString(v5);

    sub_1BE9C49F8();
    v4 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
  }

  return (NSString *)v4;
}

- (NSString)menuEditActionTitleLocalizationKey
{
  return (NSString *)sub_1BE4A7D50(self, (uint64_t)a2, (void (*)(void))sub_1BE4A7DD0);
}

- (int64_t)accessoryGroupingStyle
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryGroupingStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setAccessoryGroupingStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryGroupingStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (unint64_t)accessoryLikeItemObjectLevel
{
  id v2 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryLikeItemObjectLevel);
  swift_beginAccess();
  return *v2;
}

- (void)setAccessoryLikeItemObjectLevel:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_accessoryLikeItemObjectLevel);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (BOOL)allowsAdding
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAdding;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsAdding:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAdding;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsAnnounce
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAnnounce;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsAnnounce:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsAnnounce;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsEditing
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEditing:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEditing;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsEnergyIndicator
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEnergyIndicator;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsEnergyIndicator:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsEnergyIndicator;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)allowsHomeNavigation
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsHomeNavigation;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsHomeNavigation:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_allowsHomeNavigation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)includePredictedScenes
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_includePredictedScenes;
  swift_beginAccess();
  return *v2;
}

- (void)setIncludePredictedScenes:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_includePredictedScenes;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)backgroundStyle
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_backgroundStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_backgroundStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)scenePresentationStyle
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_scenePresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setScenePresentationStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_scenePresentationStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)cameraPresentationStyle
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_cameraPresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setCameraPresentationStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_cameraPresentationStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)filterPresentationStyle
{
  id v2 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_filterPresentationStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setFilterPresentationStyle:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_filterPresentationStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)overrideDashboardTitle
{
  id v2 = (char *)self + OBJC_IVAR___HUDashboardContext_overrideDashboardTitle;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    id v3 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setOverrideDashboardTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BE9C49F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  id v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUDashboardContext_overrideDashboardTitle);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)shouldDelayItemUpdatesForViewVisibility
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldDelayItemUpdatesForViewVisibility;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldDelayItemUpdatesForViewVisibility:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldDelayItemUpdatesForViewVisibility;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldHideEmptySections
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideEmptySections;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldHideEmptySections:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideEmptySections;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldHidePlaceholderService
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHidePlaceholderService;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldHidePlaceholderService:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHidePlaceholderService;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldHideForGuests
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideForGuests;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldHideForGuests:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldHideForGuests;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)shouldIncludeRoomInAccessoryNames
{
  id v2 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldIncludeRoomInAccessoryNames;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIncludeRoomInAccessoryNames:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___HUDashboardContext_shouldIncludeRoomInAccessoryNames;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)accessoryRepresentableHasStandardTileRepresentation:(id)a3
{
  return sub_1BE4A976C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1BE4A903C);
}

- (BOOL)shouldHideAccessoryRepresentable:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = sub_1BE4AB6B8(a3, v5);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)shouldHideInRoomSectionForAccessoryRepresentableItem:(id)a3
{
  return sub_1BE4A976C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1BE4A9684);
}

- (BOOL)shouldHideHomeKitObject:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = sub_1BE4AB184((uint64_t)a3, v5);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)shouldHideStatusItemClass:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v5 = self;
  LOBYTE(ObjCClassMetadata) = sub_1BE4A9830(ObjCClassMetadata);

  return ObjCClassMetadata & 1;
}

- (BOOL)shouldCreateModule:(Class)a3
{
  if (!swift_dynamicCastMetatype()) {
    return 1;
  }
  if (self->home[OBJC_IVAR___HUDashboardContext_type] == 2
    && *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type) == 0)
  {
    return objc_msgSend(self, sel_isHomeControlService) ^ 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)shouldHideSectionWithIdentifier:(id)a3
{
  return sub_1BE4AAE98(self, (uint64_t)a2, (uint64_t)a3, sub_1BE4A9CE8);
}

- (BOOL)canShowHeaderForSectionWithIdentifier:(id)a3
{
  return sub_1BE4AAE98(self, (uint64_t)a2, (uint64_t)a3, sub_1BE4AA978);
}

- (BOOL)canPresentDetailsViewControllerForSectionWithIdentifier:(id)a3
{
  return sub_1BE4AAE98(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1BE4AAA84);
}

- (int64_t)maximumNumberOfItemsInSectionWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1BE9C49F8();
  uint64_t v6 = v5;
  if (sub_1BE9C49F8() == v4 && v7 == v6)
  {
    v12 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_1BE9C5C28();
    v10 = self;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type);
  int v14 = self->home[OBJC_IVAR___HUDashboardContext_type];

  swift_bridgeObjectRelease();
  if (v13) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v14 == 2;
  }
  if (v15) {
    return 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)canShowNoHomeAccessView
{
  return !*(Class *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type)
      && self->home[OBJC_IVAR___HUDashboardContext_type] == 2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUDashboardContext_type);
  unsigned __int8 v4 = self->home[OBJC_IVAR___HUDashboardContext_type];

  sub_1BE4AD1A4(v3, v4);
}

@end