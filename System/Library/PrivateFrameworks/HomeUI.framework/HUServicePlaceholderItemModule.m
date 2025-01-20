@interface HUServicePlaceholderItemModule
- (HFStaticItemProvider)placeholderItemProvider;
- (HUDashboardContext)context;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setContext:(id)a3;
- (void)setPlaceholderItemProvider:(id)a3;
@end

@implementation HUServicePlaceholderItemModule

- (id)buildItemProviders
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = +[HUAddAccessoryUtilities addAccessoryLocalizationStringKey];
  v5 = [v3 stringWithFormat:@"HFStaticItem-%@", v4];

  id v6 = objc_alloc(MEMORY[0x1E4F695C0]);
  v22[0] = *MEMORY[0x1E4F68AB8];
  v7 = +[HUAddAccessoryUtilities addAccessoryString];
  uint64_t v8 = *MEMORY[0x1E4F68B30];
  v23[0] = v7;
  v23[1] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4F689E8];
  v22[1] = v8;
  v22[2] = v9;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"plus"];
  uint64_t v11 = *MEMORY[0x1E4F68B10];
  v23[2] = v10;
  v23[3] = MEMORY[0x1E4F1CC28];
  uint64_t v12 = *MEMORY[0x1E4F68BB0];
  v22[3] = v11;
  v22[4] = v12;
  v23[4] = v5;
  v22[5] = *MEMORY[0x1E4F688B0];
  v23[5] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  v14 = (void *)[v6 initWithResults:v13];

  id v15 = objc_alloc(MEMORY[0x1E4F695C8]);
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
  v17 = (void *)[v15 initWithItems:v16];
  [(HUServicePlaceholderItemModule *)self setPlaceholderItemProvider:v17];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [(HUServicePlaceholderItemModule *)self placeholderItemProvider];
  v20 = [v18 setWithObject:v19];

  return v20;
}

- (void)setPlaceholderItemProvider:(id)a3
{
}

- (HFStaticItemProvider)placeholderItemProvider
{
  return self->_placeholderItemProvider;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"servicePlaceholder"];
  v7 = [(HUServicePlaceholderItemModule *)self placeholderItemProvider];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v8 allObjects];

  [v6 setItems:v9];
  v10 = (void *)MEMORY[0x1E4F69220];
  v14[0] = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v12 = [v10 filterSections:v11 toDisplayedItems:v5];

  return v12;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderItemProvider, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end