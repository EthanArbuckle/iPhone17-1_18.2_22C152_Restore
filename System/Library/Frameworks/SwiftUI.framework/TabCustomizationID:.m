@interface TabCustomizationID:
- (uint64_t)TabCustomizationEntry;
- (uint64_t)TabSectionCustomizationEntry;
- (void)TabCustomizationEntry;
@end

@implementation TabCustomizationID:

- (void)TabCustomizationEntry
{
  if (!*a2)
  {
    lazy protocol witness table accessor for type TabCustomizationID and conformance TabCustomizationID();
    unint64_t v3 = type metadata accessor for Dictionary();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

- (uint64_t)TabSectionCustomizationEntry
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for [TabCustomizationID : TabCustomizationEntry](255, &lazy cache variable for type metadata for [TabCustomizationID : TabSectionCustomizationEntry]);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)TabCustomizationEntry
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for [TabCustomizationID : TabCustomizationEntry](255, &lazy cache variable for type metadata for [TabCustomizationID : TabCustomizationEntry]);
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end