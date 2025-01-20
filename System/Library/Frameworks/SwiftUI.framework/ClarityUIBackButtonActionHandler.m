@interface ClarityUIBackButtonActionHandler
- (_TtC7SwiftUI32ClarityUIBackButtonActionHandler)init;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation ClarityUIBackButtonActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  type metadata accessor for BSAction();
  lazy protocol witness table accessor for type BSAction and conformance NSObject();
  unint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  specialized ClarityUIBackButtonActionHandler._respond(to:for:in:from:)(v10);

  swift_bridgeObjectRelease();
  v15.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v15.super.isa;
}

- (_TtC7SwiftUI32ClarityUIBackButtonActionHandler)init
{
  return (_TtC7SwiftUI32ClarityUIBackButtonActionHandler *)@objc ClarityUIBackButtonAction.init()(self, (uint64_t)a2, type metadata accessor for ClarityUIBackButtonActionHandler);
}

@end