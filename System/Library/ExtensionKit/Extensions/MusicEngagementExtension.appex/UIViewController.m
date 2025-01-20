@interface UIViewController
- (BOOL)canPresentViewControllers;
- (NSArray)completePlayActivityFeatureNames;
- (NSData)playActivityRecommendationData;
- (NSString)combinedPlayActivityFeatureName;
- (NSString)playActivityFeatureName;
- (UIViewController)playActivityFeatureNameSourceViewController;
- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3;
- (void)setPlayActivityFeatureNameSourceViewController:(id)a3;
@end

@implementation UIViewController

- (UIViewController)playActivityFeatureNameSourceViewController
{
  v2 = self;
  id v3 = UIViewController.playActivityFeatureNameSourceViewController.getter();

  return (UIViewController *)v3;
}

- (void)setPlayActivityFeatureNameSourceViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  UIViewController.playActivityFeatureNameSourceViewController.setter(a3);
}

- (NSData)playActivityRecommendationData
{
  return (NSData *)0;
}

- (NSString)playActivityFeatureName
{
  return (NSString *)@objc UIViewController.playActivityFeatureName.getter(self, (uint64_t)a2, (void (*)(void))UITab.playActivityFeatureName.getter);
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100493400;
  id v6 = a3;
  v7 = self;
  v8 = [(UIViewController *)v7 playActivityFeatureName];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  *(void *)(v5 + 32) = v9;
  *(void *)(v5 + 40) = v11;

  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (NSArray)completePlayActivityFeatureNames
{
  v2 = self;
  UIViewController.completePlayActivityFeatureNames.getter();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (NSString)combinedPlayActivityFeatureName
{
  v2 = self;
  NSArray v3 = [(UIViewController *)v2 completePlayActivityFeatureNames];
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type String and conformance String();
  Sequence<>.joined(separator:)();

  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (BOOL)canPresentViewControllers
{
  v2 = self;
  NSArray v3 = [(UIViewController *)v2 popoverPresentationController];

  if (v3) {
  return v3 == 0;
  }
}

@end