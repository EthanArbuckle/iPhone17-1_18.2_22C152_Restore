@interface AMUISelectedConfigurations
+ (id)lastUpdatedDateFromDictionaryRepresentation:(id)a3;
+ (id)lastUsedDateFromDictionaryRepresentation:(id)a3;
- (AMUISelectedConfigurations)init;
- (AMUISelectedConfigurations)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUpdateDate;
- (NSDate)lastUseDate;
- (NSDictionary)dictionaryRepresentation;
- (NSMutableDictionary)selections;
- (id)_initWithLastUseDate:(void *)a3 lastUpdateDate:(void *)a4 selections:;
- (id)lastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a3;
- (unint64_t)hash;
- (void)setLastSelectedConfigurationUUID:(id)a3 forProviderBundleIdentifier:(id)a4;
- (void)setLastUpdateDate:(id)a3;
- (void)setLastUseDate:(id)a3;
- (void)setSelections:(id)a3;
@end

@implementation AMUISelectedConfigurations

- (AMUISelectedConfigurations)init
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [NSDictionary dictionary];
  v5 = (AMUISelectedConfigurations *)-[AMUISelectedConfigurations _initWithLastUseDate:lastUpdateDate:selections:]((id *)&self->super.isa, v3, v3, v4);

  return v5;
}

- (id)_initWithLastUseDate:(void *)a3 lastUpdateDate:(void *)a4 selections:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)AMUISelectedConfigurations;
    v11 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      uint64_t v12 = [v10 mutableCopy];
      id v13 = a1[3];
      a1[3] = (id)v12;
    }
  }

  return a1;
}

- (AMUISelectedConfigurations)initWithDictionaryRepresentation:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  uint64_t v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"lastUseDate", objc_opt_class());
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  uint64_t v11 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"lastUpdateDate", objc_opt_class());
  uint64_t v12 = (void *)v11;
  if (v11) {
    id v13 = (void *)v11;
  }
  else {
    id v13 = v6;
  }
  id v14 = v13;

  objc_super v15 = objc_msgSend(v5, "bs_safeDictionaryForKey:", @"selections");

  v16 = [MEMORY[0x263EFF9A0] dictionary];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __63__AMUISelectedConfigurations_initWithDictionaryRepresentation___block_invoke;
  v20[3] = &unk_265224C00;
  id v21 = v16;
  id v17 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v20];
  v18 = (AMUISelectedConfigurations *)-[AMUISelectedConfigurations _initWithLastUseDate:lastUpdateDate:selections:]((id *)&self->super.isa, v10, v14, v17);

  return v18;
}

void __63__AMUISelectedConfigurations_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v15 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v15;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = objc_opt_class();
  id v11 = v6;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v9 && v13)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
    if (v14) {
      [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v9];
    }
  }
}

+ (id)lastUsedDateFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"lastUseDate", objc_opt_class());

  return v4;
}

+ (id)lastUpdatedDateFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"lastUpdateDate", objc_opt_class());

  return v4;
}

- (id)lastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  lastUseDate = self->_lastUseDate;
  self->_lastUseDate = v6;

  id v8 = [(NSMutableDictionary *)self->_selections objectForKeyedSubscript:v5];

  return v8;
}

- (void)setLastSelectedConfigurationUUID:(id)a3 forProviderBundleIdentifier:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v11 = a3;
  id v8 = [v6 date];
  objc_storeStrong((id *)&self->_lastUpdateDate, v8);
  lastUseDate = self->_lastUseDate;
  self->_lastUseDate = v8;
  uint64_t v10 = v8;

  [(NSMutableDictionary *)self->_selections setObject:v11 forKeyedSubscript:v7];
}

- (NSDictionary)dictionaryRepresentation
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_selections, "count"));
  selections = self->_selections;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __54__AMUISelectedConfigurations_dictionaryRepresentation__block_invoke;
  uint64_t v12 = &unk_265224C28;
  id v13 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)selections enumerateKeysAndObjectsUsingBlock:&v9];
  v14[0] = @"lastUseDate";
  v14[1] = @"lastUpdateDate";
  lastUpdateDate = self->_lastUpdateDate;
  v15[0] = self->_lastUseDate;
  v15[1] = lastUpdateDate;
  v14[2] = @"selections";
  v15[2] = v5;
  id v7 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3, v9, v10, v11, v12);

  return (NSDictionary *)v7;
}

void __54__AMUISelectedConfigurations_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 UUIDString];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_selections hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  lastUseDate = self->_lastUseDate;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke;
  v20[3] = &unk_265224C50;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:lastUseDate counterpart:v20];
  lastUpdateDate = self->_lastUpdateDate;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke_2;
  v18[3] = &unk_265224C50;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:lastUpdateDate counterpart:v18];
  selections = self->_selections;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __38__AMUISelectedConfigurations_isEqual___block_invoke_3;
  v16[3] = &unk_265224C50;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:selections counterpart:v16];
  LOBYTE(selections) = [v5 isEqual];

  return (char)selections;
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __38__AMUISelectedConfigurations_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (NSDate)lastUseDate
{
  return self->_lastUseDate;
}

- (void)setLastUseDate:(id)a3
{
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (NSMutableDictionary)selections
{
  return self->_selections;
}

- (void)setSelections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selections, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);

  objc_storeStrong((id *)&self->_lastUseDate, 0);
}

@end