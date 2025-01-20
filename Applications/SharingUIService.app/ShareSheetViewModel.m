@interface ShareSheetViewModel
- (BOOL)isCollaborative;
- (BOOL)isLoadingMetadata;
- (BOOL)isModeSwitchDisabled;
- (BOOL)isSharingExpanded;
- (BOOL)reloadData;
- (BOOL)showCustomHeaderButton;
- (BOOL)showHeaderSpecialization;
- (BOOL)showOptions;
- (BOOL)supportsCollaboration;
- (BOOL)supportsSendCopy;
- (BOOL)updateProxiesWithAnimation;
- (NSArray)actionProxies;
- (NSArray)applicationActivityTypes;
- (NSArray)metadataValues;
- (NSArray)peopleSuggestionProxies;
- (NSArray)shareProxies;
- (NSArray)urlRequests;
- (NSArray)urlSandboxExtensions;
- (NSAttributedString)customHeaderButtonTitle;
- (NSDictionary)activitiesByUUID;
- (NSNumber)customViewControllerSectionHeightWrapper;
- (NSNumber)customViewControllerVerticalInsetWrapper;
- (NSNumber)nearbyCountSlotID;
- (NSString)collaborationModeTitle;
- (NSString)customOptionsTitle;
- (SLCollaborationFooterViewModel)collaborationFooterViewModel;
- (UIColor)customHeaderButtonColor;
- (UIViewController)customViewController;
- (_TtC16SharingUIService19ShareSheetViewModel)init;
- (void)setActionProxies:(id)a3;
- (void)setActivitiesByUUID:(id)a3;
- (void)setApplicationActivityTypes:(id)a3;
- (void)setCollaborationFooterViewModel:(id)a3;
- (void)setCollaborationModeTitle:(id)a3;
- (void)setCustomHeaderButtonColor:(id)a3;
- (void)setCustomHeaderButtonTitle:(id)a3;
- (void)setCustomOptionsTitle:(id)a3;
- (void)setCustomViewController:(id)a3;
- (void)setCustomViewControllerSectionHeightWrapper:(id)a3;
- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsLoadingMetadata:(BOOL)a3;
- (void)setIsModeSwitchDisabled:(BOOL)a3;
- (void)setIsSharingExpanded:(BOOL)a3;
- (void)setMetadataValues:(id)a3;
- (void)setNearbyCountSlotID:(id)a3;
- (void)setPeopleSuggestionProxies:(id)a3;
- (void)setReloadData:(BOOL)a3;
- (void)setShareProxies:(id)a3;
- (void)setShowCustomHeaderButton:(BOOL)a3;
- (void)setShowHeaderSpecialization:(BOOL)a3;
- (void)setShowOptions:(BOOL)a3;
- (void)setSupportsCollaboration:(BOOL)a3;
- (void)setSupportsSendCopy:(BOOL)a3;
- (void)setUpdateProxiesWithAnimation:(BOOL)a3;
- (void)setUrlRequests:(id)a3;
- (void)setUrlSandboxExtensions:(id)a3;
@end

@implementation ShareSheetViewModel

- (BOOL)isSharingExpanded
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded);
}

- (void)setIsSharingExpanded:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded) = a3;
}

- (NSArray)metadataValues
{
  sub_100008D18(0, (unint64_t *)&unk_100043380);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setMetadataValues:(id)a3
{
  sub_100008D18(0, (unint64_t *)&unk_100043380);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)isLoadingMetadata
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata);
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata) = a3;
}

- (NSArray)urlRequests
{
  return (NSArray *)sub_100010CD8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests, (void (*)(void))&type metadata accessor for URLRequest);
}

- (void)setUrlRequests:(id)a3
{
}

- (NSArray)urlSandboxExtensions
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)setUrlSandboxExtensions:(id)a3
{
  if (a3) {
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions) = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)showOptions
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions);
}

- (void)setShowOptions:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions) = a3;
}

- (NSString)customOptionsTitle
{
  return (NSString *)sub_100011040((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle);
}

- (void)setCustomOptionsTitle:(id)a3
{
}

- (BOOL)showCustomHeaderButton
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton);
}

- (void)setShowCustomHeaderButton:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton) = a3;
}

- (BOOL)showHeaderSpecialization
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization);
}

- (void)setShowHeaderSpecialization:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization) = a3;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle));
}

- (void)setCustomHeaderButtonTitle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle) = (Class)a3;
  id v3 = a3;
}

- (UIColor)customHeaderButtonColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor));
}

- (void)setCustomHeaderButtonColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isModeSwitchDisabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled);
}

- (void)setIsModeSwitchDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled) = a3;
}

- (BOOL)supportsCollaboration
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration);
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration) = a3;
}

- (BOOL)supportsSendCopy
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy);
}

- (void)setSupportsSendCopy:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy) = a3;
}

- (BOOL)isCollaborative
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative);
}

- (void)setIsCollaborative:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative) = a3;
}

- (NSString)collaborationModeTitle
{
  return (NSString *)sub_100011040((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle);
}

- (void)setCollaborationModeTitle:(id)a3
{
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return (SLCollaborationFooterViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel));
}

- (void)setCollaborationFooterViewModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel) = (Class)a3;
  id v3 = a3;
}

- (UIViewController)customViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController));
}

- (void)setCustomViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController) = (Class)a3;
  id v3 = a3;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper));
}

- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper) = (Class)a3;
  id v3 = a3;
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper));
}

- (void)setCustomViewControllerSectionHeightWrapper:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper) = (Class)a3;
  id v3 = a3;
}

- (NSArray)peopleSuggestionProxies
{
  return (NSArray *)sub_1000112DC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies, &qword_100043C68);
}

- (void)setPeopleSuggestionProxies:(id)a3
{
}

- (NSArray)shareProxies
{
  return (NSArray *)sub_1000112DC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies, &qword_100043C70);
}

- (void)setShareProxies:(id)a3
{
}

- (NSArray)actionProxies
{
  return (NSArray *)sub_1000112DC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies, &qword_100043C70);
}

- (void)setActionProxies:(id)a3
{
}

- (NSNumber)nearbyCountSlotID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID));
}

- (void)setNearbyCountSlotID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)activitiesByUUID
{
  type metadata accessor for UUID();
  sub_100008D18(0, &qword_100043C80);
  sub_100012590((unint64_t *)&unk_100043C88);
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setActivitiesByUUID:(id)a3
{
  type metadata accessor for UUID();
  sub_100008D18(0, &qword_100043C80);
  sub_100012590((unint64_t *)&unk_100043C88);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID) = (Class)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (NSArray)applicationActivityTypes
{
  return (NSArray *)sub_100010CD8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes, type metadata accessor for ActivityType);
}

- (void)setApplicationActivityTypes:(id)a3
{
}

- (BOOL)reloadData
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData);
}

- (void)setReloadData:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData) = a3;
}

- (BOOL)updateProxiesWithAnimation
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation);
}

- (void)setUpdateProxiesWithAnimation:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation) = a3;
}

- (_TtC16SharingUIService19ShareSheetViewModel)init
{
  result = (_TtC16SharingUIService19ShareSheetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end