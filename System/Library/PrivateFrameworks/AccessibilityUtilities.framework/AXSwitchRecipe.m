@interface AXSwitchRecipe
+ (id)recipeWithDictionaryRepresentation:(id)a3;
- (AXSwitchRecipe)init;
- (BOOL)shouldContinueScanning;
- (NSArray)mappings;
- (NSString)menuIconIdentifier;
- (NSString)name;
- (NSString)unlocalizedName;
- (NSUUID)uuid;
- (double)timeout;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setMappings:(id)a3;
- (void)setMenuIconIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUnlocalizedName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation AXSwitchRecipe

+ (id)recipeWithDictionaryRepresentation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"Name"];
  [v5 setName:v6];

  v7 = [v4 objectForKeyedSubscript:@"UnlocalizedName"];
  [v5 setUnlocalizedName:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  v9 = [v4 objectForKeyedSubscript:@"UUID"];
  v10 = (void *)[v8 initWithUUIDString:v9];

  [v5 setUuid:v10];
  v11 = (void *)MEMORY[0x1E4F1CA48];
  v12 = [v4 objectForKeyedSubscript:@"Mappings"];
  v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"Mappings", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[AXSwitchRecipeMapping recipeMappingWithDictionaryRepresentation:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  [v5 setMappings:v13];
  v20 = [v4 objectForKeyedSubscript:@"Timeout"];
  [v20 doubleValue];
  objc_msgSend(v5, "setTimeout:");

  v21 = [v4 objectForKeyedSubscript:@"MenuIconIdentifier"];
  [v5 setMenuIconIdentifier:v21];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = [(AXSwitchRecipe *)self unlocalizedName];

  if (v4)
  {
    id v5 = [(AXSwitchRecipe *)self unlocalizedName];
    v6 = @"UnlocalizedName";
  }
  else
  {
    v7 = [(AXSwitchRecipe *)self name];

    if (!v7) {
      goto LABEL_6;
    }
    id v5 = [(AXSwitchRecipe *)self name];
    v6 = @"Name";
  }
  [v3 setObject:v5 forKeyedSubscript:v6];

LABEL_6:
  id v8 = [(AXSwitchRecipe *)self uuid];

  if (!v8) {
    _AXAssert();
  }
  v9 = [(AXSwitchRecipe *)self uuid];

  if (v9)
  {
    v10 = [(AXSwitchRecipe *)self uuid];
    v11 = [v10 UUIDString];
    [v3 setObject:v11 forKeyedSubscript:@"UUID"];
  }
  v12 = (void *)MEMORY[0x1E4F1CA48];
  v13 = [(AXSwitchRecipe *)self mappings];
  v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [(AXSwitchRecipe *)self mappings];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  [v3 setObject:v14 forKeyedSubscript:@"Mappings"];
  v21 = NSNumber;
  [(AXSwitchRecipe *)self timeout];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  [v3 setObject:v22 forKeyedSubscript:@"Timeout"];

  long long v23 = [(AXSwitchRecipe *)self menuIconIdentifier];

  if (v23)
  {
    long long v24 = [(AXSwitchRecipe *)self menuIconIdentifier];
    [v3 setObject:v24 forKeyedSubscript:@"MenuIconIdentifier"];
  }

  return v3;
}

- (AXSwitchRecipe)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXSwitchRecipe;
  v2 = [(AXSwitchRecipe *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    [(AXSwitchRecipe *)v2 setUuid:v3];
  }
  return v2;
}

- (BOOL)shouldContinueScanning
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(AXSwitchRecipe *)self mappings];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 action];
        if ([v8 isEqualToString:@"Select"])
        {

LABEL_13:
          BOOL v11 = 1;
          goto LABEL_14;
        }
        v9 = [v7 longPressAction];
        char v10 = [v9 isEqualToString:@"Select"];

        if (v10) {
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (NSString)name
{
  name = self->_name;
  if (name) {
    goto LABEL_2;
  }
  uint64_t v5 = [(AXSwitchRecipe *)self unlocalizedName];

  if (!v5)
  {
    name = self->_name;
LABEL_2:
    uint64_t v3 = name;
    goto LABEL_5;
  }
  v6 = [(AXSwitchRecipe *)self unlocalizedName];
  AXLocalizedString(v6);
  uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_5:

  return v3;
}

- (void)setName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_name = &self->_name;
  if (self->_name != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_name, a3);
    p_name = (NSString **)[(AXSwitchRecipe *)self setUnlocalizedName:0];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_name, v5);
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)AXSwitchRecipe;
  uint64_t v3 = [(AXSwitchRecipe *)&v11 description];
  uint64_t v4 = [(AXSwitchRecipe *)self name];
  uint64_t v5 = [(AXSwitchRecipe *)self uuid];
  v6 = [(AXSwitchRecipe *)self mappings];
  v7 = NSNumber;
  [(AXSwitchRecipe *)self timeout];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = [v3 stringByAppendingFormat:@"\nName: %@\nUUID: %@\nMappings: %@\nTimeout: %@", v4, v5, v6, v8];

  return v9;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSArray)mappings
{
  return self->_mappings;
}

- (void)setMappings:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (void)setUnlocalizedName:(id)a3
{
}

- (NSString)menuIconIdentifier
{
  return self->_menuIconIdentifier;
}

- (void)setMenuIconIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuIconIdentifier, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end