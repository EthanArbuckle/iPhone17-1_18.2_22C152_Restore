@interface HDHealthRecordRulesetReferenceRule
+ (id)referenceRulesetsForRules:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (HDHealthRecordRulesetReferenceRule)initWithKeyPath:(id)a3 allowedTypes:(id)a4 disallowedTypes:(id)a5;
- (NSSet)allowedResourceTypes;
- (NSSet)disallowedResourceTypes;
- (NSString)keyPath;
- (id)description;
- (int64_t)appliesTo;
- (unint64_t)hash;
@end

@implementation HDHealthRecordRulesetReferenceRule

- (HDHealthRecordRulesetReferenceRule)initWithKeyPath:(id)a3 allowedTypes:(id)a4 disallowedTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDHealthRecordRulesetReferenceRule;
  v11 = [(HDHealthRecordRulesetReferenceRule *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    keyPath = v11->_keyPath;
    v11->_keyPath = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x263EFFA08] setWithArray:v9];
    allowedResourceTypes = v11->_allowedResourceTypes;
    v11->_allowedResourceTypes = (NSSet *)v14;

    uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v10];
    disallowedResourceTypes = v11->_disallowedResourceTypes;
    v11->_disallowedResourceTypes = (NSSet *)v16;
  }
  return v11;
}

+ (id)referenceRulesetsForRules:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = 0x263EFF000uLL;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    v35 = v7;
    v36 = v6;
    uint64_t v31 = *(void *)v44;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v32 = v9;
      do
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * v11);
        v13 = [v7 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 componentsSeparatedByString:@","];

        if (![v14 count])
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"No contained resource type specified for reference rule for key path %@", v12);
LABEL_31:

          id v29 = 0;
          goto LABEL_32;
        }
        uint64_t v38 = v12;
        uint64_t v33 = v11;
        id v15 = objc_alloc_init(*(Class *)(v5 + 2432));
        id v16 = objc_alloc_init(*(Class *)(v5 + 2432));
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v34 = v14;
        id v17 = v14;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v40;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v40 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              v23 = [MEMORY[0x263F08708] whitespaceCharacterSet];
              v24 = [v22 stringByTrimmingCharactersInSet:v23];

              if ([(__CFString *)v24 length])
              {
                id v25 = v15;
                if ([(__CFString *)v24 hasPrefix:@"!"]
                  && (unint64_t)[(__CFString *)v24 length] >= 2)
                {
                  v26 = [(__CFString *)v24 substringFromIndex:1];

                  if ([(__CFString *)v26 isEqualToString:@"Any"])
                  {
                    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"I'm afraid you're not allowed to specify \"!%@\", @"Any"");
                    id v27 = v25;
                    goto LABEL_30;
                  }
                  id v27 = v16;
                }
                else
                {
                  v26 = v24;
                  id v27 = v25;
                }
                if ([(__CFString *)v26 isEqualToString:@"Any"])
                {

                  v26 = @"Any";
                }
                if ([v25 containsObject:v26]
                  || [v16 containsObject:v26])
                {
                  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Duplicate definition of resource type \"%@\" for keyPath \"%@\"", v26, v38);
LABEL_30:

                  id v7 = v35;
                  v6 = v36;
                  uint64_t v14 = v34;
                  goto LABEL_31;
                }
                [v27 addObject:v26];
              }
              else
              {
                v26 = v24;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        v28 = [[HDHealthRecordRulesetReferenceRule alloc] initWithKeyPath:v38 allowedTypes:v15 disallowedTypes:v16];
        v6 = v36;
        [v36 addObject:v28];

        uint64_t v11 = v33 + 1;
        id v7 = v35;
        unint64_t v5 = 0x263EFF000;
        uint64_t v10 = v31;
      }
      while (v33 + 1 != v32);
      uint64_t v9 = [v35 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v29 = v6;
LABEL_32:

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keyPath hash];
  uint64_t v4 = [(NSSet *)self->_allowedResourceTypes hash] ^ v3;
  return v4 ^ [(NSSet *)self->_disallowedResourceTypes hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDHealthRecordRulesetReferenceRule *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      keyPath = self->_keyPath;
      id v7 = [(HDHealthRecordRulesetReferenceRule *)v5 keyPath];
      if (keyPath != v7)
      {
        uint64_t v8 = [(HDHealthRecordRulesetReferenceRule *)v5 keyPath];
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_30;
        }
        uint64_t v9 = (void *)v8;
        uint64_t v10 = self->_keyPath;
        uint64_t v11 = [(HDHealthRecordRulesetReferenceRule *)v5 keyPath];
        if (![(NSString *)v10 isEqualToString:v11])
        {
          LOBYTE(v12) = 0;
LABEL_29:

          goto LABEL_30;
        }
        v28 = v9;
        id v29 = v11;
      }
      allowedResourceTypes = self->_allowedResourceTypes;
      uint64_t v14 = [(HDHealthRecordRulesetReferenceRule *)v5 allowedResourceTypes];
      if (allowedResourceTypes != v14)
      {
        uint64_t v12 = [(HDHealthRecordRulesetReferenceRule *)v5 allowedResourceTypes];
        if (!v12) {
          goto LABEL_24;
        }
        id v15 = self->_allowedResourceTypes;
        id v16 = [(HDHealthRecordRulesetReferenceRule *)v5 allowedResourceTypes];
        if (![(NSSet *)v15 isEqualToSet:v16])
        {

          LOBYTE(v12) = 0;
LABEL_27:
          BOOL v23 = keyPath == v7;
          uint64_t v9 = v28;
LABEL_28:
          uint64_t v11 = v29;
          if (!v23) {
            goto LABEL_29;
          }
LABEL_30:

          goto LABEL_31;
        }
        id v25 = v16;
        id v27 = v12;
      }
      disallowedResourceTypes = self->_disallowedResourceTypes;
      uint64_t v18 = [(HDHealthRecordRulesetReferenceRule *)v5 disallowedResourceTypes];
      LOBYTE(v12) = disallowedResourceTypes == (NSSet *)v18;
      if (disallowedResourceTypes == (NSSet *)v18)
      {
      }
      else
      {
        uint64_t v19 = (void *)v18;
        uint64_t v20 = [(HDHealthRecordRulesetReferenceRule *)v5 disallowedResourceTypes];
        if (v20)
        {
          v21 = (void *)v20;
          uint64_t v12 = self->_disallowedResourceTypes;
          v22 = [(HDHealthRecordRulesetReferenceRule *)v5 disallowedResourceTypes];
          LOBYTE(v12) = [v12 isEqualToSet:v22];

          if (allowedResourceTypes == v14)
          {

            goto LABEL_27;
          }

          goto LABEL_25;
        }
      }
      if (allowedResourceTypes == v14)
      {
LABEL_25:

        goto LABEL_27;
      }

LABEL_24:
      uint64_t v9 = v28;

      BOOL v23 = keyPath == v7;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
  }
LABEL_31:

  return (char)v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)HDHealthRecordRulesetReferenceRule;
  uint64_t v4 = [(HDHealthRecordRulesetReferenceRule *)&v7 description];
  unint64_t v5 = (void *)[v3 initWithFormat:@"%@ for «%@»", v4, self->_keyPath];

  return v5;
}

- (int64_t)appliesTo
{
  return self->_appliesTo;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSSet)allowedResourceTypes
{
  return self->_allowedResourceTypes;
}

- (NSSet)disallowedResourceTypes
{
  return self->_disallowedResourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedResourceTypes, 0);
  objc_storeStrong((id *)&self->_allowedResourceTypes, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end