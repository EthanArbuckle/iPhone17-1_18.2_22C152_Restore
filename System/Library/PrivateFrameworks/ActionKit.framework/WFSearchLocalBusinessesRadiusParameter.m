@interface WFSearchLocalBusinessesRadiusParameter
- (BOOL)shouldUseMetricSystem;
- (id)defaultSerializedRepresentation;
@end

@implementation WFSearchLocalBusinessesRadiusParameter

- (id)defaultSerializedRepresentation
{
  if ([(WFSearchLocalBusinessesRadiusParameter *)self shouldUseMetricSystem]) {
    [NSNumber numberWithDouble:1.5];
  }
  else {
  v3 = [NSNumber numberWithInteger:1];
  }
  v4 = [MEMORY[0x263F08A30] localizedStringFromNumber:v3 numberStyle:1];
  v5 = (void *)[objc_alloc(MEMORY[0x263F86D48]) initWithValue:v4];
  if ([(WFSearchLocalBusinessesRadiusParameter *)self shouldUseMetricSystem]) {
    [MEMORY[0x263F08CE8] kilometers];
  }
  else {
  v6 = [MEMORY[0x263F08CE8] miles];
  }
  id v7 = objc_alloc(MEMORY[0x263F86DF8]);
  v8 = [v6 symbol];
  v9 = (void *)[v7 initWithMagnitudeState:v5 unitString:v8];

  v10 = [v9 serializedRepresentation];

  return v10;
}

- (BOOL)shouldUseMetricSystem
{
  return [MEMORY[0x263F85370] usesMetricSystemForUnitType:*MEMORY[0x263F857C8]];
}

@end