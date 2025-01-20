@interface WFGetDistanceUnitPickerParameter
- (id)defaultSerializedRepresentation;
@end

@implementation WFGetDistanceUnitPickerParameter

- (id)defaultSerializedRepresentation
{
  if ([MEMORY[0x263F85370] usesMetricSystemForUnitType:*MEMORY[0x263F857C8]]) {
    v2 = @"Kilometers";
  }
  else {
    v2 = @"Miles";
  }
  v3 = (void *)MEMORY[0x263F86F00];
  return (id)[v3 serializedRepresentationFromValue:v2];
}

@end