@interface AGAttribute:
- (void)WeakBox<AttributeInfoTrace.Scope>;
@end

@implementation AGAttribute:

- (void)WeakBox<AttributeInfoTrace.Scope>
{
  if (!lazy cache variable for type metadata for [AGAttribute : WeakBox<AttributeInfoTrace.Scope>])
  {
    type metadata accessor for AGAttribute(255);
    type metadata accessor for [(_:)](255, &lazy cache variable for type metadata for WeakBox<AttributeInfoTrace.Scope>, (uint64_t (*)(uint64_t))type metadata accessor for AttributeInfoTrace.Scope, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for WeakBox);
    lazy protocol witness table accessor for type AGNamedTraceEventID and conformance AGNamedTraceEventID((unint64_t *)&lazy protocol witness table cache variable for type AGAttribute and conformance AGAttribute, type metadata accessor for AGAttribute);
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [AGAttribute : WeakBox<AttributeInfoTrace.Scope>]);
    }
  }
}

@end