@interface CNUIUserActionDirectionsTarget
@end

@implementation CNUIUserActionDirectionsTarget

id __92___CNUIUserActionDirectionsTarget_actionsForPostalAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [(id)objc_opt_class() mapsUrlFromLabeledValue:v3 contact:*(void *)(a1 + 40)];
  v5 = (void *)MEMORY[0x263EFEA30];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *MEMORY[0x263EFE0A0];
  v8 = [v3 identifier];

  v9 = [v5 contactPropertyWithContactNoCopy:v6 propertyKey:v7 identifier:v8];

  uint64_t v10 = *MEMORY[0x263EFDF00];
  v11 = [*(id *)(a1 + 32) bundleIdentifier];
  v12 = [MEMORY[0x263F335E0] futureWithResult:v4];
  v13 = +[CNUIUserActionItem itemWithType:v10 contactProperty:v9 bundleIdentifier:v11 url:v12 isSensitive:1 group:10 options:0];

  return v13;
}

@end