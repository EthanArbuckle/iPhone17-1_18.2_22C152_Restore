@interface WFAddressAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFAddressAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  v6 = [(WFAddressAction *)self parameterValueForKey:@"WFAddressLine1" ofClass:objc_opt_class()];
  v7 = [(WFAddressAction *)self parameterValueForKey:@"WFAddressLine2" ofClass:objc_opt_class()];
  v8 = [(WFAddressAction *)self parameterValueForKey:@"WFCity" ofClass:objc_opt_class()];
  v9 = [(WFAddressAction *)self parameterValueForKey:@"WFState" ofClass:objc_opt_class()];
  v10 = [(WFAddressAction *)self parameterValueForKey:@"WFCountry" ofClass:objc_opt_class()];
  v11 = [(WFAddressAction *)self parameterValueForKey:@"WFPostalCode" ofClass:objc_opt_class()];
  v12 = [MEMORY[0x263EFF980] array];
  if ([v6 length]) {
    [v12 addObject:v6];
  }
  if ([v7 length]) {
    [v12 addObject:v7];
  }
  if ([v12 count])
  {
    v13 = [v12 componentsJoinedByString:@"\n"];
  }
  else
  {
    v13 = 0;
  }
  if ([v13 length]
    || [v8 length]
    || [v9 length]
    || [v11 length]
    || [v10 length])
  {
    v14 = [(WFAddressAction *)self output];
    v15 = [MEMORY[0x263F33990] streetAddressWithStreet:v13 subLocality:0 city:v8 subAdministrativeArea:0 state:v9 postalCode:v11 country:v10 isoCountryCode:0 label:0];
    [v14 addObject:v15];
  }
  else
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F870B8];
    v21[0] = *MEMORY[0x263F08338];
    v20 = WFLocalizedString(@"No Address");
    v22[0] = v20;
    v21[1] = *MEMORY[0x263F08320];
    v17 = WFLocalizedString(@"Please enter a valid address into the Street Address action.");
    v22[1] = v17;
    v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *a4 = [v18 errorWithDomain:v19 code:5 userInfo:v16];
  }
}

@end