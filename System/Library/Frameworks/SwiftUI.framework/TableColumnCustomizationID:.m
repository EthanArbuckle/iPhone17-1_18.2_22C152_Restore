@interface TableColumnCustomizationID:
- (uint64_t)TableColumnCustomizationEntry;
- (void)TableColumnCustomizationEntry;
@end

@implementation TableColumnCustomizationID:

- (void)TableColumnCustomizationEntry
{
  if (!lazy cache variable for type metadata for [TableColumnCustomizationID : TableColumnCustomizationEntry])
  {
    lazy protocol witness table accessor for type TableColumnCustomizationID and conformance TableColumnCustomizationID();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [TableColumnCustomizationID : TableColumnCustomizationEntry]);
    }
  }
}

- (uint64_t)TableColumnCustomizationEntry
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for [TableColumnCustomizationID : TableColumnCustomizationEntry]();
    a2();
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end