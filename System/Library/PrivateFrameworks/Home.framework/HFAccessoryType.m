@interface HFAccessoryType
+ (NAIdentity)na_identity;
+ (id)_cache;
+ (id)categoryType:(id)a3;
+ (id)categoryTypeWithCategory:(id)a3;
+ (id)matterDeviceType:(id)a3;
+ (id)mediaSystemType;
+ (id)serviceType:(id)a3;
+ (id)serviceType:(id)a3 subtype:(id)a4;
+ (id)serviceTypeWithService:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_init;
- (id)filterAccessoryRepresentableObjects:(id)a3;
- (unint64_t)hash;
@end

@implementation HFAccessoryType

+ (id)serviceTypeWithService:(id)a3
{
  id v4 = a3;
  v5 = [v4 associatedServiceType];
  v6 = v5;
  if (!v5)
  {
    v6 = [v4 serviceType];
  }
  v7 = [v4 serviceSubtype];
  v8 = [a1 serviceType:v6 subtype:v7];

  if (!v5) {
  return v8;
  }
}

+ (id)serviceType:(id)a3 subtype:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x263F0D5E8]])
  {

    id v8 = v6;
    id v7 = 0;
  }
  else
  {
    id v9 = v6;
    id v8 = v9;
    if (v7)
    {
      uint64_t v10 = [v9 stringByAppendingFormat:@"-%@", v7];

      id v8 = (id)v10;
    }
  }
  v11 = +[HFAccessoryType _cache]();
  v12 = [v11 objectForKey:v8];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __39__HFAccessoryType_serviceType_subtype___block_invoke;
    v16[3] = &unk_26408ED60;
    id v17 = v6;
    id v18 = v7;
    id v20 = a1;
    id v19 = v8;
    __39__HFAccessoryType_serviceType_subtype___block_invoke(v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

+ (id)_cache
{
  self;
  if (qword_26AB2E888 != -1) {
    dispatch_once(&qword_26AB2E888, &__block_literal_global_26);
  }
  v0 = (void *)_MergedGlobals_29;
  return v0;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)matterDeviceType:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"matterDeviceType-%i", objc_msgSend(v4, "intValue"));
  id v6 = +[HFAccessoryType _cache]();
  id v7 = [v6 objectForKey:v5];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__HFAccessoryType_matterDeviceType___block_invoke;
    v11[3] = &unk_26408ED88;
    id v12 = v4;
    id v14 = a1;
    id v13 = v5;
    __36__HFAccessoryType_matterDeviceType___block_invoke((uint64_t)v11);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

HFMatterDeviceAccessoryType *__36__HFAccessoryType_matterDeviceType___block_invoke(uint64_t a1)
{
  v2 = [[HFMatterDeviceAccessoryType alloc] initWithDeviceType:*(void *)(a1 + 32)];
  v3 = +[HFAccessoryType _cache]();
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];

  return v2;
}

+ (id)serviceType:(id)a3
{
  return (id)[a1 serviceType:a3 subtype:0];
}

+ (id)mediaSystemType
{
  if (qword_26AB2E890 != -1) {
    dispatch_once(&qword_26AB2E890, &__block_literal_global_43);
  }
  v2 = (void *)qword_26AB2E898;
  return v2;
}

+ (id)categoryType:(id)a3
{
  id v4 = a3;
  self;
  if (qword_26AB2E8A0 != -1) {
    dispatch_once(&qword_26AB2E8A0, &__block_literal_global_55);
  }
  id v5 = (id)qword_26AB2E8A8;
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [a1 serviceType:v6];
  }
  else
  {
    id v8 = +[HFAccessoryType _cache]();
    id v9 = [v8 objectForKey:v4];
    uint64_t v10 = v9;
    if (v9)
    {
      id v7 = v9;
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __32__HFAccessoryType_categoryType___block_invoke;
      v12[3] = &unk_26408ED38;
      id v13 = v4;
      id v14 = a1;
      __32__HFAccessoryType_categoryType___block_invoke((uint64_t)v12);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

HFCategoryAccessoryType *__32__HFAccessoryType_categoryType___block_invoke(uint64_t a1)
{
  v2 = [[HFCategoryAccessoryType alloc] initWithCategoryType:*(void *)(a1 + 32)];
  v3 = +[HFAccessoryType _cache]();
  [v3 setObject:v2 forKey:*(void *)(a1 + 32)];

  return v2;
}

uint64_t __34__HFAccessoryType_mediaSystemType__block_invoke_2()
{
  qword_26AB2E898 = [(HFAccessoryType *)[HFMediaSystemAccessoryType alloc] _init];
  return MEMORY[0x270F9A758]();
}

HFServiceAccessoryType *__39__HFAccessoryType_serviceType_subtype___block_invoke(void *a1)
{
  v2 = [[HFServiceAccessoryType alloc] initWithServiceType:a1[4] subtype:a1[5]];
  v3 = +[HFAccessoryType _cache]();
  [v3 setObject:v2 forKey:a1[6]];

  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HFAccessoryType;
  return [(HFAccessoryType *)&v3 init];
}

uint64_t __25__HFAccessoryType__cache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_MergedGlobals_29;
  _MergedGlobals_29 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_29;
  return [v2 setName:@"HFAccessoryType-cache"];
}

void __50__HFAccessoryType__accessoryCategoryToServiceType__block_invoke_2()
{
  v32[23] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0D708];
  uint64_t v1 = *MEMORY[0x263F0AFD8];
  v31[0] = *MEMORY[0x263F0AFC8];
  v31[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D720];
  v32[0] = v0;
  v32[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0B000];
  v31[2] = *MEMORY[0x263F0AFE8];
  v31[3] = v3;
  v32[2] = v0;
  v32[3] = v2;
  uint64_t v4 = *MEMORY[0x263F0D618];
  uint64_t v5 = *MEMORY[0x263F0B048];
  v31[4] = *MEMORY[0x263F0B018];
  v31[5] = v5;
  uint64_t v6 = *MEMORY[0x263F0D6A8];
  v32[4] = v4;
  v32[5] = v6;
  uint64_t v7 = *MEMORY[0x263F0D798];
  uint64_t v8 = *MEMORY[0x263F0B070];
  v31[6] = *MEMORY[0x263F0B058];
  v31[7] = v8;
  uint64_t v9 = *MEMORY[0x263F0D6C8];
  v32[6] = v7;
  v32[7] = v9;
  uint64_t v10 = *MEMORY[0x263F0D6D8];
  uint64_t v11 = *MEMORY[0x263F0B0B8];
  v31[8] = *MEMORY[0x263F0B078];
  v31[9] = v11;
  uint64_t v12 = *MEMORY[0x263F0D780];
  v32[8] = v10;
  v32[9] = v12;
  uint64_t v13 = *MEMORY[0x263F0D7D0];
  uint64_t v14 = *MEMORY[0x263F0B0F0];
  v31[10] = *MEMORY[0x263F0B0E0];
  v31[11] = v14;
  uint64_t v15 = *MEMORY[0x263F0D820];
  v32[10] = v13;
  v32[11] = v15;
  uint64_t v16 = *MEMORY[0x263F0D7D8];
  uint64_t v17 = *MEMORY[0x263F0B120];
  v31[12] = *MEMORY[0x263F0B100];
  v31[13] = v17;
  uint64_t v18 = *MEMORY[0x263F0D880];
  v32[12] = v16;
  v32[13] = v18;
  uint64_t v19 = *MEMORY[0x263F0D808];
  uint64_t v20 = *MEMORY[0x263F0B140];
  v31[14] = *MEMORY[0x263F0B130];
  v31[15] = v20;
  uint64_t v21 = *MEMORY[0x263F0D740];
  v32[14] = v19;
  v32[15] = v21;
  uint64_t v22 = *MEMORY[0x263F0D828];
  uint64_t v23 = *MEMORY[0x263F0B170];
  v31[16] = *MEMORY[0x263F0B158];
  v31[17] = v23;
  uint64_t v24 = *MEMORY[0x263F0D850];
  v32[16] = v22;
  v32[17] = v24;
  uint64_t v25 = *MEMORY[0x263F0B198];
  v31[18] = *MEMORY[0x263F0B188];
  v31[19] = v25;
  v32[18] = v24;
  v32[19] = v24;
  uint64_t v26 = *MEMORY[0x263F0D870];
  uint64_t v27 = *MEMORY[0x263F0B1C8];
  v31[20] = *MEMORY[0x263F0B1A8];
  v31[21] = v27;
  uint64_t v28 = *MEMORY[0x263F0D8A8];
  v32[20] = v26;
  v32[21] = v28;
  v31[22] = *MEMORY[0x263F0B1E0];
  v32[22] = *MEMORY[0x263F0D8B8];
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:23];
  v30 = (void *)qword_26AB2E8A8;
  qword_26AB2E8A8 = v29;
}

+ (id)categoryTypeWithCategory:(id)a3
{
  uint64_t v4 = [a3 categoryType];
  uint64_t v5 = [a1 categoryType:v4];

  return v5;
}

+ (NAIdentity)na_identity
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAccessoryType.m", 158, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAccessoryType na_identity]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)filterAccessoryRepresentableObjects:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__HFAccessoryType_Filtering__filterAccessoryRepresentableObjects___block_invoke;
  v5[3] = &unk_26408FD78;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "na_filter:", v5);
  return v3;
}

uint64_t __66__HFAccessoryType_Filtering__filterAccessoryRepresentableObjects___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "hf_accessoryType");
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end