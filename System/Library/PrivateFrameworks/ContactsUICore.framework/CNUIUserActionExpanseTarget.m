@interface CNUIUserActionExpanseTarget
@end

@implementation CNUIUserActionExpanseTarget

id __73___CNUIUserActionExpanseTarget_actionsForContact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 key];
  unint64_t v5 = +[CNHandle handleTypeForPropertyKey:v4];

  v6 = [CNHandle alloc];
  v7 = [v3 value];
  v8 = objc_msgSend(v7, "_cnui_URLDestinationID");
  v9 = [(CNHandle *)v6 initWithStringValue:v8 type:v5];

  v10 = objc_msgSend(NSURL, "_cnui_expanseURLFutureWithHandle:", v9);
  uint64_t v11 = *MEMORY[0x263EFDF08];
  v12 = [*(id *)(a1 + 32) bundleIdentifier];
  v13 = +[CNUIUserActionItem itemWithType:v11 contactProperty:v3 bundleIdentifier:v12 url:v10 group:2 options:0];

  v16[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

  return v14;
}

@end