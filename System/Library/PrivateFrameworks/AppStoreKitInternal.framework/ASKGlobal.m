@interface ASKGlobal
- (ASKClient)client;
- (JSExport)adsLoc;
- (NSDictionary)props;
- (_TtC19AppStoreKitInternal11JSAdsObject)ads;
- (_TtC19AppStoreKitInternal12AppleSilicon)appleSilicon;
- (_TtC19AppStoreKitInternal12JSGameCenter)gameCenter;
- (_TtC19AppStoreKitInternal12JSUserObject)user;
- (_TtC19AppStoreKitInternal14JSArcadeObject)arcade;
- (_TtC19AppStoreKitInternal14JSFeatureFlags)featureFlags;
- (_TtC19AppStoreKitInternal14JSUserDefaults)userDefaults;
- (_TtC19AppStoreKitInternal15JSAMSEngagement)amsEngagement;
- (_TtC19AppStoreKitInternal15JSStorageObject)storage;
- (_TtC19AppStoreKitInternal16JSTimeoutManager)timeoutManager;
- (_TtC19AppStoreKitInternal16JSTreatmentStore)treatmentStore;
- (_TtC19AppStoreKitInternal20JSResilientDeepLinks)resilientDeepLinks;
- (_TtC19AppStoreKitInternal20JSStoreMetricsObject)storeMetrics;
- (_TtC19AppStoreKitInternal21ClientOrderingWrapper)clientOrdering;
- (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject)metricsIdentifiers;
- (_TtC19AppStoreKitInternal28JSPersonalizationStoreObject)personalizationStore;
- (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager)onDeviceSearchHistoryManager;
- (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager)onDeviceRecommendationsManager;
- (_TtC19AppStoreKitInternal9ASKGlobal)init;
- (_TtP19AppStoreKitInternal17LocalizerProtocol_)loc;
@end

@implementation ASKGlobal

- (_TtC19AppStoreKitInternal15JSStorageObject)storage
{
  return (_TtC19AppStoreKitInternal15JSStorageObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_storage));
}

- (ASKClient)client
{
  return (ASKClient *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_client));
}

- (_TtC19AppStoreKitInternal14JSArcadeObject)arcade
{
  return (_TtC19AppStoreKitInternal14JSArcadeObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_arcade));
}

- (JSExport)adsLoc
{
  v2 = (void *)swift_unknownObjectRetain();
  return (JSExport *)v2;
}

- (NSDictionary)props
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5BCA8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (_TtC19AppStoreKitInternal12JSUserObject)user
{
  return (_TtC19AppStoreKitInternal12JSUserObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_user));
}

- (_TtP19AppStoreKitInternal17LocalizerProtocol_)loc
{
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP19AppStoreKitInternal17LocalizerProtocol_ *)v2;
}

- (_TtC19AppStoreKitInternal11JSAdsObject)ads
{
  return (_TtC19AppStoreKitInternal11JSAdsObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_ads));
}

- (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager)onDeviceRecommendationsManager
{
  return (_TtC19AppStoreKitInternal38AppStoreOnDeviceRecommendationsManager *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_onDeviceRecommendationsManager);
}

- (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager)onDeviceSearchHistoryManager
{
  return (_TtC19AppStoreKitInternal28OnDeviceSearchHistoryManager *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_onDeviceSearchHistoryManager);
}

- (_TtC19AppStoreKitInternal20JSResilientDeepLinks)resilientDeepLinks
{
  return (_TtC19AppStoreKitInternal20JSResilientDeepLinks *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_resilientDeepLinks);
}

- (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject)metricsIdentifiers
{
  return (_TtC19AppStoreKitInternal26JSMetricsIdentifiersObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_metricsIdentifiers);
}

- (_TtC19AppStoreKitInternal16JSTimeoutManager)timeoutManager
{
  return (_TtC19AppStoreKitInternal16JSTimeoutManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_timeoutManager));
}

- (_TtC19AppStoreKitInternal21ClientOrderingWrapper)clientOrdering
{
  return (_TtC19AppStoreKitInternal21ClientOrderingWrapper *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_clientOrdering);
}

- (_TtC19AppStoreKitInternal15JSAMSEngagement)amsEngagement
{
  return (_TtC19AppStoreKitInternal15JSAMSEngagement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                               + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_amsEngagement));
}

- (_TtC19AppStoreKitInternal20JSStoreMetricsObject)storeMetrics
{
  return (_TtC19AppStoreKitInternal20JSStoreMetricsObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_storeMetrics);
}

- (_TtC19AppStoreKitInternal14JSFeatureFlags)featureFlags
{
  return (_TtC19AppStoreKitInternal14JSFeatureFlags *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_featureFlags));
}

- (_TtC19AppStoreKitInternal12AppleSilicon)appleSilicon
{
  return (_TtC19AppStoreKitInternal12AppleSilicon *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_appleSilicon));
}

- (_TtC19AppStoreKitInternal12JSGameCenter)gameCenter
{
  return (_TtC19AppStoreKitInternal12JSGameCenter *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_gameCenter));
}

- (_TtC19AppStoreKitInternal16JSTreatmentStore)treatmentStore
{
  return (_TtC19AppStoreKitInternal16JSTreatmentStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_treatmentStore));
}

- (_TtC19AppStoreKitInternal28JSPersonalizationStoreObject)personalizationStore
{
  return (_TtC19AppStoreKitInternal28JSPersonalizationStoreObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_personalizationStore);
}

- (_TtC19AppStoreKitInternal14JSUserDefaults)userDefaults
{
  return (_TtC19AppStoreKitInternal14JSUserDefaults *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_userDefaults));
}

- (_TtC19AppStoreKitInternal9ASKGlobal)init
{
  result = (_TtC19AppStoreKitInternal9ASKGlobal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_onDeviceRecommendationsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_onDeviceSearchHistoryManager));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal9ASKGlobal_userDefaults);
}

@end