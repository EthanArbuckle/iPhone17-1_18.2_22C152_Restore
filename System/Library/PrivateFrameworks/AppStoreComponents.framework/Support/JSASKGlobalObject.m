@interface JSASKGlobalObject
- (ASCJSClientObject)client;
- (JSExport)loc;
- (NSDictionary)props;
- (_TtC19appstorecomponentsd12JSUserObject)user;
- (_TtC19appstorecomponentsd14JSArcadeObject)arcade;
- (_TtC19appstorecomponentsd17JSASKGlobalObject)init;
- (_TtC19appstorecomponentsd20JSAppleSiliconObject)appleSilicon;
- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)featureFlags;
- (_TtC19appstorecomponentsd20JSStoreMetricsObject)storeMetrics;
- (_TtC19appstorecomponentsd22JSClientOrderingObject)clientOrdering;
- (_TtC19appstorecomponentsd23JSAppDistributionObject)appDistribution;
- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)metricsIdentifiers;
- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)personalizationStore;
@end

@implementation JSASKGlobalObject

- (ASCJSClientObject)client
{
  return (ASCJSClientObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_client));
}

- (JSExport)loc
{
  v2 = (void *)swift_unknownObjectRetain();

  return (JSExport *)v2;
}

- (_TtC19appstorecomponentsd20JSStoreMetricsObject)storeMetrics
{
  return (_TtC19appstorecomponentsd20JSStoreMetricsObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_storeMetrics);
}

- (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject)metricsIdentifiers
{
  return (_TtC19appstorecomponentsd26JSMetricsIdentifiersObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_metricsIdentifiers);
}

- (NSDictionary)props
{
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (_TtC19appstorecomponentsd12JSUserObject)user
{
  return (_TtC19appstorecomponentsd12JSUserObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_user));
}

- (_TtC19appstorecomponentsd22JSClientOrderingObject)clientOrdering
{
  return (_TtC19appstorecomponentsd22JSClientOrderingObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_clientOrdering);
}

- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)personalizationStore
{
  return (_TtC19appstorecomponentsd28JSPersonalizationStoreObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_personalizationStore);
}

- (_TtC19appstorecomponentsd14JSArcadeObject)arcade
{
  return (_TtC19appstorecomponentsd14JSArcadeObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_arcade));
}

- (_TtC19appstorecomponentsd20JSAppleSiliconObject)appleSilicon
{
  return (_TtC19appstorecomponentsd20JSAppleSiliconObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_appleSilicon);
}

- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)featureFlags
{
  return (_TtC19appstorecomponentsd20JSFeatureFlagsObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_featureFlags);
}

- (_TtC19appstorecomponentsd23JSAppDistributionObject)appDistribution
{
  return (_TtC19appstorecomponentsd23JSAppDistributionObject *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_appDistribution);
}

- (_TtC19appstorecomponentsd17JSASKGlobalObject)init
{
  result = (_TtC19appstorecomponentsd17JSASKGlobalObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_metricsIdentifiers));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_personalizationStore));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd17JSASKGlobalObject_appDistribution);
}

@end