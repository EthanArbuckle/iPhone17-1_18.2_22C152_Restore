@interface ResolvedStyledText.TextLayoutManager.Delegate
- (_TtCCC7SwiftUI18ResolvedStyledText17TextLayoutManager8Delegate)init;
- (id)textLayoutManager:(id)a3 renderingAttributesForLink:(id)a4 atLocation:(id)a5 defaultAttributes:(id)a6;
@end

@implementation ResolvedStyledText.TextLayoutManager.Delegate

- (_TtCCC7SwiftUI18ResolvedStyledText17TextLayoutManager8Delegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ResolvedStyledText.TextLayoutManager.Delegate *)&v3 init];
}

- (id)textLayoutManager:(id)a3 renderingAttributesForLink:(id)a4 atLocation:(id)a5 defaultAttributes:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v9 = a6;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();

  swift_unknownObjectRelease();
  specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
  v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

@end