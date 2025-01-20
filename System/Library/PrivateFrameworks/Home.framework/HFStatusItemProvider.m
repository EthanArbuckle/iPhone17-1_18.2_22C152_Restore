@interface HFStatusItemProvider
+ (BOOL)hasStatusItemForServiceType:(id)a3;
+ (id)_statusItemClasses;
+ (id)sortOrderForStatusItemCategory:(unint64_t)a3;
+ (id)statusItemComparator;
- (HFCharacteristicValueSource)valueSource;
- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4;
- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 filter:(id)a5;
- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5 filter:(id)a6;
- (HFStatusItemProvider)initWithItems:(id)a3;
- (HMHome)home;
- (HMRoom)room;
- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6;
- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5 filter:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (void)_buildStatusItemsForGroupedStatusItem:(id)a3;
@end

@implementation HFStatusItemProvider

+ (BOOL)hasStatusItemForServiceType:(id)a3
{
  v3 = (void *)MEMORY[0x263F0E708];
  id v4 = a3;
  v5 = objc_msgSend(v3, "hf_standardServiceTypes");
  char v6 = [v5 containsObject:v4];

  return v6;
}

id __74__HFStatusItemProvider__createStatusItemsForHome_room_valueSource_filter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4 && !(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2))
  {
    v5 = 0;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) _buildStatusItemWithClass:a2 home:*(void *)(a1 + 40) room:*(void *)(a1 + 48) valueSource:*(void *)(a1 + 56)];
  }
  return v5;
}

- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[[a3 alloc] initWithHome:v12 room:v11 valueSource:v10];

  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16) {
    [(HFStatusItemProvider *)self _buildStatusItemsForGroupedStatusItem:v16];
  }

  return v14;
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 filter:(id)a5
{
  return [(HFStatusItemProvider *)self initWithHome:a3 room:a4 overrideValueSource:0 filter:a5];
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5 filter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    objc_msgSend(v11, "hf_characteristicValueManager");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v15;
  v17 = [(HFStatusItemProvider *)self _createStatusItemsForHome:v11 room:v12 valueSource:v15 filter:v14];
  v18 = [MEMORY[0x263EFFA08] setWithArray:v17];
  v23.receiver = self;
  v23.super_class = (Class)HFStatusItemProvider;
  v19 = [(HFStaticItemProvider *)&v23 initWithItems:v18];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_home, a3);
    objc_storeStrong((id *)&v19->_room, a4);
    objc_storeStrong((id *)&v19->_valueSource, v16);
    v20 = _Block_copy(v14);
    id filter = v19->_filter;
    v19->_id filter = v20;
  }
  return v19;
}

- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5 filter:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(id)objc_opt_class() _statusItemClasses];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __74__HFStatusItemProvider__createStatusItemsForHome_room_valueSource_filter___block_invoke;
  v21[3] = &unk_264094018;
  id v24 = v12;
  id v25 = v13;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  v19 = objc_msgSend(v14, "na_map:", v21);

  return v19;
}

+ (id)_statusItemClasses
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_3_10);
  }
  v2 = (void *)qword_26AB2EAB8;
  return v2;
}

void __42__HFStatusItemProvider__statusItemClasses__block_invoke_2()
{
  v37 = (void *)MEMORY[0x263EFF980];
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v37, "arrayWithObjects:", v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20,
    v19,
    v18,
    v17,
    v16,
    v15,
    v14,
    v13,
    v12,
    v0,
    v1,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    objc_opt_class(),
  id v10 = 0);
  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
    [v10 addObject:objc_opt_class()];
  }
  id v11 = (void *)qword_26AB2EAB8;
  qword_26AB2EAB8 = (uint64_t)v10;
}

+ (id)sortOrderForStatusItemCategory:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      if (qword_26AB2EAC0 == -1)
      {
        uint64_t v4 = &qword_26AB2EAC8;
        goto LABEL_15;
      }
      uint64_t v6 = &qword_26AB2EAC0;
      uint64_t v7 = &__block_literal_global_50;
      goto LABEL_23;
    case 1uLL:
      if (qword_26AB2EAD0 == -1)
      {
        uint64_t v4 = &qword_26AB2EAD8;
        goto LABEL_15;
      }
      uint64_t v6 = &qword_26AB2EAD0;
      uint64_t v7 = &__block_literal_global_55_1;
      goto LABEL_23;
    case 2uLL:
      if (qword_26AB2EAE0 == -1)
      {
        uint64_t v4 = &qword_26AB2EAE8;
        goto LABEL_15;
      }
      uint64_t v6 = &qword_26AB2EAE0;
      uint64_t v7 = &__block_literal_global_59_0;
      goto LABEL_23;
    case 3uLL:
      if (qword_26AB2EAF0 == -1)
      {
        uint64_t v4 = &qword_26AB2EAF8;
        goto LABEL_15;
      }
      uint64_t v6 = &qword_26AB2EAF0;
      uint64_t v7 = &__block_literal_global_63_1;
      goto LABEL_23;
    case 4uLL:
      if (qword_26AB2EB00 == -1)
      {
        uint64_t v4 = &qword_26AB2EB08;
      }
      else
      {
        uint64_t v6 = &qword_26AB2EB00;
        uint64_t v7 = &__block_literal_global_69_0;
LABEL_23:
        dispatch_once(v6, v7);
        uint64_t v4 = v6 + 1;
      }
LABEL_15:
      a1 = (id)*v4;
      return a1;
    default:
      return a1;
  }
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_2()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  uint64_t v1 = (void *)qword_26AB2EAC8;
  qword_26AB2EAC8 = v0;
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_4()
{
  void v2[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  uint64_t v1 = (void *)qword_26AB2EAD8;
  qword_26AB2EAD8 = v0;
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_6()
{
  v2[12] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  void v2[6] = objc_opt_class();
  void v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:12];
  uint64_t v1 = (void *)qword_26AB2EAE8;
  qword_26AB2EAE8 = v0;
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_8()
{
  uint64_t v15 = (void *)MEMORY[0x263EFF980];
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v15, "arrayWithObjects:", v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()) {
    [v10 addObject:objc_opt_class()];
  }
  id v11 = (void *)qword_26AB2EAF8;
  qword_26AB2EAF8 = (uint64_t)v10;
}

void __55__HFStatusItemProvider_sortOrderForStatusItemCategory___block_invoke_11()
{
  v2[11] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  void v2[6] = objc_opt_class();
  void v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:11];
  uint64_t v1 = (void *)qword_26AB2EB08;
  qword_26AB2EB08 = v0;
}

+ (id)statusItemComparator
{
  return &__block_literal_global_72_0;
}

uint64_t __44__HFStatusItemProvider_statusItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 latestResults];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"statusItemCategory"];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  else {
    uint64_t v9 = &unk_26C0F69F0;
  }
  id v10 = v9;

  id v11 = [v5 latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"statusItemCategory"];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  else {
    uint64_t v14 = &unk_26C0F69F0;
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  if (!v16)
  {
    uint64_t v17 = +[HFStatusItemProvider sortOrderForStatusItemCategory:](HFStatusItemProvider, "sortOrderForStatusItemCategory:", [v10 integerValue]);
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    uint64_t v16 = [v18 compare:v19];
    if (!v16)
    {
      uint64_t v20 = [v4 latestResults];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"priority"];
      uint64_t v22 = (void *)v21;
      uint64_t v23 = &unk_26C0F6A08;
      if (v21) {
        uint64_t v23 = (void *)v21;
      }
      id v36 = v23;

      uint64_t v24 = [v5 latestResults];
      uint64_t v25 = [v24 objectForKeyedSubscript:@"priority"];
      uint64_t v26 = (void *)v25;
      uint64_t v27 = &unk_26C0F6A08;
      if (v25) {
        uint64_t v27 = (void *)v25;
      }
      id v28 = v27;

      uint64_t v29 = v36;
      if ([v36 isEqualToNumber:v28])
      {
        uint64_t v30 = [v4 latestResults];
        uint64_t v35 = [v30 objectForKeyedSubscript:@"sortKey"];

        uint64_t v31 = [v5 latestResults];
        [v31 objectForKeyedSubscript:@"sortKey"];
        uint64_t v32 = v34 = v28;

        uint64_t v29 = v36;
        uint64_t v16 = [v35 localizedStandardCompare:v32];

        id v28 = v34;
      }
      else
      {
        uint64_t v16 = [v28 compare:v36];
      }
    }
  }

  return v16;
}

- (HFStatusItemProvider)initWithItems:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = NSStringFromSelector(sel_initWithHome_room_overrideValueSource_filter_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFStatusItemProvider.m", 236, @"%s is unavailable; use %@ instead",
    "-[HFStatusItemProvider initWithItems:]",
    v6);

  return 0;
}

- (HFStatusItemProvider)initWithHome:(id)a3 room:(id)a4
{
  return [(HFStatusItemProvider *)self initWithHome:a3 room:a4 filter:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFStatusItemProvider *)self home];
  uint64_t v6 = [(HFStatusItemProvider *)self room];
  uint64_t v7 = [(HFStatusItemProvider *)self valueSource];
  uint64_t v8 = [(HFStatusItemProvider *)self filter];
  uint64_t v9 = (void *)[v4 initWithHome:v5 room:v6 overrideValueSource:v7 filter:v8];

  return v9;
}

- (void)_buildStatusItemsForGroupedStatusItem:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() statusItemClasses];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HFStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke;
  v7[3] = &unk_264094040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

void __62__HFStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) home];
  id v6 = [*(id *)(a1 + 40) room];
  uint64_t v7 = [*(id *)(a1 + 40) valueSource];
  id v8 = [v4 _buildStatusItemWithClass:a2 home:v5 room:v6 valueSource:v7];

  [*(id *)(a1 + 40) addItem:v8];
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end