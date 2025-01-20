@interface CHSEquivalentBundleIdentifierResolver
+ (id)defaultResolver;
- (CHSEquivalentBundleIdentifierResolver)init;
- (CHSEquivalentBundleIdentifierResolver)initWithCategoriesPrimitives:(id)a3;
- (id)equivalentBundleIdentifiersForBundleIdentifier:(id)a3;
@end

@implementation CHSEquivalentBundleIdentifierResolver

- (CHSEquivalentBundleIdentifierResolver)init
{
  type metadata accessor for ConcreteCategoriesPrimitives();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSEquivalentBundleIdentifierResolver_categoriesPrimitives) = (Class)swift_allocObject();
  v4.receiver = self;
  v4.super_class = (Class)CHSEquivalentBundleIdentifierResolver;
  return [(CHSEquivalentBundleIdentifierResolver *)&v4 init];
}

- (CHSEquivalentBundleIdentifierResolver)initWithCategoriesPrimitives:(id)a3
{
  swift_unknownObjectRetain();
  v5 = [(CHSEquivalentBundleIdentifierResolver *)self init];
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___CHSEquivalentBundleIdentifierResolver_categoriesPrimitives) = (Class)a3;
  swift_unknownObjectRelease();
  return v5;
}

+ (id)defaultResolver
{
  type metadata accessor for ConcreteCategoriesPrimitives();
  id v2 = objc_msgSend(objc_allocWithZone((Class)CHSEquivalentBundleIdentifierResolver), sel_initWithCategoriesPrimitives_, swift_allocObject());
  swift_release();
  return v2;
}

- (id)equivalentBundleIdentifiersForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_190D41978();
  uint64_t v6 = v5;
  v7 = self;
  sub_190D1256C(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_190D41C98();
  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
}

@end