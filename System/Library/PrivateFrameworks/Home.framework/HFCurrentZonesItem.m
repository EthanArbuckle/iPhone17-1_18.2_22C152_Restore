@interface HFCurrentZonesItem
- (HFCurrentZonesItem)init;
- (HFCurrentZonesItem)initWithRoom:(id)a3;
- (HMRoom)room;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFCurrentZonesItem

- (HFCurrentZonesItem)initWithRoom:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCurrentZonesItem;
  v6 = [(HFCurrentZonesItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_room, a3);
  }

  return v7;
}

- (HFCurrentZonesItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithRoom_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCurrentZonesItem.m", 30, @"%s is unavailable; use %@ instead",
    "-[HFCurrentZonesItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = [(HFCurrentZonesItem *)self room];
  v7 = objc_msgSend(v6, "hf_allZones");
  v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_74];

  if ([v8 count])
  {
    if ((unint64_t)[v8 count] <= 1)
    {
      objc_super v9 = _HFLocalizedStringWithDefaultValue(@"HFZoneModuleCurrentZonesSingularTitle", @"HFZoneModuleCurrentZonesSingularTitle", 1);
      [v5 setObject:v9 forKeyedSubscript:@"title"];

      v10 = [v8 firstObject];
      uint64_t v11 = [v10 name];
      v12 = (void *)v11;
      if (v11) {
        v13 = (__CFString *)v11;
      }
      else {
        v13 = &stru_26C081158;
      }
      [v5 setObject:v13 forKeyedSubscript:@"description"];

      goto LABEL_10;
    }
    v16 = _HFLocalizedStringWithDefaultValue(@"HFZoneModuleCurrentZonesPluralTitle", @"HFZoneModuleCurrentZonesPluralTitle", 1);
    [v5 setObject:v16 forKeyedSubscript:@"title"];

    v15 = @"HFZoneModuleCurrentZonesMultipleZonesDescription";
  }
  else
  {
    v14 = _HFLocalizedStringWithDefaultValue(@"HFZoneModuleCurrentZonesSingularTitle", @"HFZoneModuleCurrentZonesSingularTitle", 1);
    [v5 setObject:v14 forKeyedSubscript:@"title"];

    v15 = @"HFZoneModuleCurrentZonesNone";
  }
  v10 = _HFLocalizedStringWithDefaultValue(v15, v15, 1);
  [v5 setObject:v10 forKeyedSubscript:@"description"];
LABEL_10:

  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  [v5 setObject:v17 forKeyedSubscript:@"dependentHomeKitClasses"];

  [v5 setObject:v8 forKeyedSubscript:@"HFCurrentZonesResultKey"];
  v18 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  [v4 finishWithResult:v18];

  return v4;
}

uint64_t __50__HFCurrentZonesItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
}

@end