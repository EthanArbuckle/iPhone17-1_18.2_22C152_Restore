@interface HFIdleAlarmSensorStatusItem
+ (id)sortKey;
+ (id)statusItemClasses;
- (BOOL)shouldEncapsulateItem:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFIdleAlarmSensorStatusItem

+ (id)statusItemClasses
{
  if (_MergedGlobals_269 != -1) {
    dispatch_once(&_MergedGlobals_269, &__block_literal_global_3_17);
  }
  v2 = (void *)qword_26AB2F228;
  return v2;
}

void __48__HFIdleAlarmSensorStatusItem_statusItemClasses__block_invoke_2()
{
  v4[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)qword_26AB2F228;
  qword_26AB2F228 = v2;
}

+ (id)sortKey
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyIdleAlarmSensors", @"HFStatusSortKeyIdleAlarmSensors", 1);
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFIdleAlarmSensorStatusItem;
  if ([(HFAbstractGroupedStatusItem *)&v9 shouldEncapsulateItem:v4])
  {
    v5 = [v4 latestResults];
    v6 = [v5 objectForKeyedSubscript:@"priority"];
    BOOL v7 = [v6 integerValue] == -1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"sensor.fill"];
  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFIdleAlarmSensorStatusItem;
  v5 = [(HFAbstractGroupedStatusItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HFIdleAlarmSensorStatusItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_26408FB70;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __59__HFIdleAlarmSensorStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [v5 objectForKeyedSubscript:@"hidden"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    v8 = [MEMORY[0x263F58190] futureWithResult:v5];
  }
  else
  {
    id v9 = [v5 objectForKeyedSubscript:@"representedHomeKitObjects"];
    if ([v9 count])
    {
      if ([v9 count] == 1)
      {
        objc_super v10 = [WeakRetained items];
        v11 = [v10 anyObject];
        v12 = [v11 latestResults];
        v13 = [v12 objectForKeyedSubscript:@"title"];

        v14 = [WeakRetained items];
        v15 = [v14 anyObject];
        v16 = [v15 latestResults];
        v17 = [v16 objectForKeyedSubscript:@"description"];

        v18 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleIdleAlarmSensors_One_Legacy", @"HFStatusTitleIdleAlarmSensors_One_Legacy", 1);
        v19 = [WeakRetained shortTitleForFormat:v18];
        [v5 setObject:v19 forKeyedSubscript:@"shortTitle"];
      }
      else
      {
        uint64_t v20 = [v9 count];
        v27 = HFLocalizedStringWithFormat(@"HFStatusIdleAlarm_Multiple", @"%lu", v21, v22, v23, v24, v25, v26, v20);
        v28 = [MEMORY[0x263F08708] newlineCharacterSet];
        v29 = [v27 componentsSeparatedByCharactersInSet:v28];

        v13 = [v29 firstObject];
        if ((unint64_t)[v29 count] < 2)
        {
          v17 = 0;
        }
        else
        {
          v17 = [v29 lastObject];
        }
      }
      [v5 setObject:v17 forKeyedSubscript:@"description"];
      v30 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"sensor.fill"];
      [v5 setObject:v30 forKeyedSubscript:@"icon"];

      [v5 setObject:v13 forKeyedSubscript:@"title"];
    }
    else
    {
      [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    v8 = [MEMORY[0x263F58190] futureWithResult:v5];
  }
  return v8;
}

@end