@interface HFZoneBuilderItem
- (HFZoneBuilder)zoneBuilder;
- (HFZoneBuilderItem)initWithZoneBuilder:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFZoneBuilderItem

- (HFZoneBuilderItem)initWithZoneBuilder:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFZoneBuilderItem.m", 20, @"Invalid parameter not satisfying: %@", @"zoneBuilder" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFZoneBuilderItem;
  v7 = [(HFZoneBuilderItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_zoneBuilder, a3);
  }

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v5 = [(HFZoneBuilderItem *)self zoneBuilder];
  id v6 = [v5 zone];

  v7 = [(HFZoneBuilderItem *)self zoneBuilder];
  uint64_t v8 = [v7 name];
  v15 = (void *)v8;
  if (v6)
  {
    [(HFMutableItemUpdateOutcome *)v4 setObject:v8 forKeyedSubscript:@"title"];
  }
  else
  {
    v16 = HFLocalizedStringWithFormat(@"HFZoneSuggestionNameFormat", @"%@", v9, v10, v11, v12, v13, v14, v8);
    [(HFMutableItemUpdateOutcome *)v4 setObject:v16 forKeyedSubscript:@"title"];
  }
  v17 = [(HFZoneBuilderItem *)self zoneBuilder];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v17 forKeyedSubscript:@"zoneBuilder"];

  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [(HFMutableItemUpdateOutcome *)v4 setObject:v18 forKeyedSubscript:@"dependentHomeKitClasses"];

  v19 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v19;
}

- (HFZoneBuilder)zoneBuilder
{
  return self->_zoneBuilder;
}

- (void).cxx_destruct
{
}

@end