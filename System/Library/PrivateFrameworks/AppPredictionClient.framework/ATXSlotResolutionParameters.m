@interface ATXSlotResolutionParameters
- (ATXSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation ATXSlotResolutionParameters

- (ATXSlotResolutionParameters)initWithAction:(id)a3 slots:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)ATXSlotResolutionParameters;
  v9 = [(ATXSlotResolutionParameters *)&v56 init];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1AD0D3C30]();
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v9->_slots, a4);
    if ([v7 actionType] == 1)
    {
      v9->_hash = [v7 hash];
    }
    else
    {
      v11 = [v8 parameters];

      if (v11)
      {
        v41 = v10;
        v42 = v9;
        id v44 = v7;
        uint64_t v12 = [v8 hash];
        v13 = [(ATXAction *)v9->_action intent];
        v14 = objc_msgSend(v13, "atx_nonNilParametersByName");

        v15 = [v8 parameters];
        v16 = [v15 allObjects];
        v17 = [v16 sortedArrayUsingSelector:sel_compare_];

        v18 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
        id v43 = v8;
        v19 = [v8 parameters];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        obuint64_t j = v17;
        uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v53;
          v45 = v18;
          v46 = v14;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v53 != v22) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              if (!v19
                || [v19 containsObject:*(void *)(*((void *)&v52 + 1) + 8 * i)])
              {
                uint64_t v25 = [v24 hash];
                v26 = [v14 objectForKeyedSubscript:v24];
                v27 = v26;
                if (v26)
                {
                  id v28 = v26;
                }
                else
                {
                  id v28 = [MEMORY[0x1E4F1CA98] null];
                }
                v29 = v28;
                uint64_t v12 = v25 - v12 + 32 * v12;

                [(NSArray *)v18 addObject:v29];
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v30 = objc_msgSend(v29, "atx_locationHashWithLevel:", 17);
                    uint64_t v12 = 31 * (31 * v12 + HIDWORD(v30)) + v30;
                  }
                  else
                  {
                    v31 = [v29 location];
                    unint64_t v32 = objc_msgSend(v31, "atx_locationHashWithLevel:", 17);
                    uint64_t v12 = 31 * (31 * v12 + HIDWORD(v32)) + v32;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v50 = 0u;
                    long long v51 = 0u;
                    long long v48 = 0u;
                    long long v49 = 0u;
                    id v33 = v29;
                    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v57 count:16];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v49;
                      do
                      {
                        for (uint64_t j = 0; j != v35; ++j)
                        {
                          if (*(void *)v49 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          uint64_t v12 = [*(id *)(*((void *)&v48 + 1) + 8 * j) hash] - v12 + 32 * v12;
                        }
                        uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v57 count:16];
                      }
                      while (v35);
                    }

                    v18 = v45;
                    v14 = v46;
                  }
                  else
                  {
                    uint64_t v12 = [v29 hash] - v12 + 32 * v12;
                  }
                }
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
          }
          while (v21);
        }

        v9 = v42;
        values = v42->_values;
        v42->_values = v18;
        v42->_hash = v12;

        id v8 = v43;
        id v7 = v44;
        v10 = v41;
      }
      else
      {
        v39 = [v7 intent];
        v9->_hash = objc_msgSend(v39, "atx_backingStoreDataHash");
      }
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXSlotResolutionParameters *)a3;
  if (self == v4)
  {
    char v12 = 1;
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = 0;
    goto LABEL_38;
  }
  v5 = v4;
  if (self->_hash != v5->_hash)
  {
LABEL_7:
    char v12 = 0;
    goto LABEL_37;
  }
  v6 = [(ATXSlotSet *)self->_slots parameters];

  if (!v6)
  {
    v13 = self->_action;
    v14 = (NSArray *)v13;
    if (v13 == v5->_action) {
      char v12 = 1;
    }
    else {
      char v12 = -[ATXAction isEqual:](v13, "isEqual:");
    }
    goto LABEL_36;
  }
  slots = self->_slots;
  id v8 = v5->_slots;
  if (slots == v8)
  {
  }
  else
  {
    v9 = v8;
    v10 = slots;
    BOOL v11 = [(ATXSlotSet *)v10 isEqual:v9];

    if (!v11) {
      goto LABEL_7;
    }
  }
  values = v5->_values;
  v14 = self->_values;
  v16 = values;
  if (v14 == v16) {
    goto LABEL_32;
  }
  uint64_t v17 = [(NSArray *)v14 count];
  if (v17 != [(NSArray *)v16 count])
  {
    char v12 = 0;
    goto LABEL_35;
  }
  unint64_t v32 = [(NSArray *)v14 count];
  if (!v32)
  {
LABEL_32:
    char v12 = 1;
    goto LABEL_35;
  }
  char v12 = 0;
  uint64_t v18 = 0;
  v31 = v16;
  while (1)
  {
    v19 = [(NSArray *)v14 objectAtIndexedSubscript:v18];
    uint64_t v20 = [(NSArray *)v16 objectAtIndexedSubscript:v18];
    id v21 = v19;
    id v22 = v20;
    if (v21 != v22) {
      break;
    }

    v16 = v31;
LABEL_30:
    char v12 = ++v18 >= v32;
    if (v32 == v18) {
      goto LABEL_35;
    }
  }
  v23 = v22;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_39;
    }
    [v21 distanceFromLocation:v23];
    char v25 = v24 < 100.0;
    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v25 = [v21 isEqual:v23];
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v21 location];
    uint64_t v27 = [v23 location];
    id v28 = (void *)v27;
    char v25 = 0;
    if (v26 && v27)
    {
      [v26 distanceFromLocation:v27];
      char v25 = v29 < 100.0;
    }

LABEL_29:
    v16 = v31;
    if ((v25 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
LABEL_39:

  v16 = v31;
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_38:
  return v12 & 1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ATXSlotSet *)self->_slots parameters];
  id v7 = [v6 allObjects];
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  v9 = [v8 componentsJoinedByString:@" "];
  v10 = [v3 stringWithFormat:@"<%@ %@>", v5, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_slots, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end