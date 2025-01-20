@interface AccessibilityRelationshipScope.Relationship
- (unint64_t):;
- (void):;
@end

@implementation AccessibilityRelationshipScope.Relationship

- (unint64_t):
{
  unint64_t result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  *a1 = result;
  return result;
}

- (void):
{
  if (!lazy cache variable for type metadata for [AccessibilityRelationshipScope.Relationship : [AccessibilityNode]])
  {
    type metadata accessor for Binding<TabSidebarCustomization>?(255, (unint64_t *)&lazy cache variable for type metadata for [AccessibilityNode], (uint64_t (*)(uint64_t))type metadata accessor for AccessibilityNode, MEMORY[0x1E4FBB320]);
    lazy protocol witness table accessor for type AccessibilityRelationshipScope.Relationship and conformance AccessibilityRelationshipScope.Relationship();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [AccessibilityRelationshipScope.Relationship : [AccessibilityNode]]);
    }
  }
}

@end