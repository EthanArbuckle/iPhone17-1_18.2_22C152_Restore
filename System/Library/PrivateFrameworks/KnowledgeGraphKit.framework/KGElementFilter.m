@interface KGElementFilter
+ (id)any;
- (BOOL)includeTombstones;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesElement:(id)a3;
- (BOOL)matchesLabels:(id)a3;
- (BOOL)matchesProperties:(id)a3;
- (BOOL)noLabelsOrProperties;
- (KGElementFilter)initWithRequiredLabels:(id)a3 optionalLabels:(id)a4 properties:(id)a5;
- (NSArray)optionalLabels;
- (NSArray)requiredLabels;
- (NSDictionary)properties;
- (unint64_t)hash;
- (void)setIncludeTombstones:(BOOL)a3;
@end

@implementation KGElementFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_optionalLabels, 0);
  objc_storeStrong((id *)&self->_requiredLabels, 0);
}

- (void)setIncludeTombstones:(BOOL)a3
{
  self->_includeTombstones = a3;
}

- (BOOL)includeTombstones
{
  return self->_includeTombstones;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSArray)optionalLabels
{
  return self->_optionalLabels;
}

- (NSArray)requiredLabels
{
  return self->_requiredLabels;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSArray *)self->_requiredLabels hash] + 2654435769;
  unint64_t v4 = ([(NSArray *)self->_optionalLabels hash] + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return ([(NSDictionary *)self->_properties hash] + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (KGElementFilter *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if ([(KGElementFilter *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    BOOL v6 = [(NSArray *)self->_requiredLabels isEqualToArray:v5->_requiredLabels]
      && [(NSArray *)self->_optionalLabels isEqualToArray:v5->_optionalLabels]
      && [(NSDictionary *)self->_properties isEqualToDictionary:v5->_properties];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)matchesProperties:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSDictionary *)self->_properties count])
  {
    unint64_t v5 = [(NSDictionary *)self->_properties count];
    if (v5 <= [v4 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v7 = self->_properties;
      uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v47;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v47 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * v11);
            v13 = -[NSDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v12, v37);
            v14 = [v4 objectForKeyedSubscript:v12];
            v15 = [v14 kgPropertyValue];

            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              char v16 = [v13 containsObject:v15];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v18 = v13;
                v19 = [v18 value];
                switch([v18 comparator])
                {
                  case 0:
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_fault_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "KGBinaryPredicate is KGPredicateComparator_None", buf, 2u);
                    }
                    goto LABEL_55;
                  case 1:
                    char v20 = [v19 isEqual:v15];

                    if ((v20 & 1) == 0) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 2:
                    char v21 = [v19 isEqual:v15];

                    if (v21) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 3:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    uint64_t v22 = [v15 compare:v19];

                    if (v22 != -1) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 4:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    uint64_t v23 = [v15 compare:v19];

                    if (v23 == 1) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 5:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    uint64_t v24 = [v15 compare:v19];

                    if (v24 != 1) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 6:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    uint64_t v25 = [v15 compare:v19];

                    if (v25 == -1) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 7:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    uint64_t v26 = [v15 compare:v19 options:1];

                    if (v26) {
                      goto LABEL_56;
                    }
                    goto LABEL_50;
                  case 8:
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_55;
                    }
                    id v38 = v18;
                    v39 = v7;
                    id v27 = v15;
                    v28 = v19;
                    id v29 = v27;
                    v37 = v28;
                    id v30 = v28;
                    long long v41 = 0u;
                    long long v42 = 0u;
                    long long v43 = 0u;
                    long long v44 = 0u;
                    id obj = v29;
                    uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
                    if (!v31) {
                      goto LABEL_48;
                    }
                    uint64_t v32 = v31;
                    uint64_t v33 = *(void *)v42;
                    break;
                  default:
                    goto LABEL_49;
                }
                while (2)
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v42 != v33) {
                      objc_enumerationMutation(obj);
                    }
                    if (!objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "compare:options:", v30, 1, v37))
                    {
LABEL_48:

                      id v18 = v38;
                      v7 = v39;
                      v19 = v37;
LABEL_49:

LABEL_50:
                      goto LABEL_14;
                    }
                  }
                  uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
                  if (v32) {
                    continue;
                  }
                  break;
                }
                v15 = obj;

                v19 = v30;
                id v18 = v38;
                v7 = v39;
LABEL_55:

LABEL_56:
LABEL_57:
                BOOL v6 = 0;
                goto LABEL_58;
              }
              char v16 = [v15 isEqual:v13];
            }
            char v17 = v16;

            if ((v17 & 1) == 0) {
              goto LABEL_57;
            }
LABEL_14:
            ++v11;
          }
          while (v11 != v9);
          uint64_t v35 = [(NSDictionary *)v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
          uint64_t v9 = v35;
        }
        while (v35);
      }
      BOOL v6 = 1;
LABEL_58:
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)matchesLabels:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  BOOL v11 = 0;
  if (![(NSArray *)self->_requiredLabels count]
    || (unint64_t v6 = -[NSArray count](self->_requiredLabels, "count"), v6 <= [v4 count])
    && (v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_requiredLabels],
        int v8 = [v7 isSubsetOfSet:v5],
        v7,
        v8))
  {
    if (![(NSArray *)self->_optionalLabels count]
      || (uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_optionalLabels],
          int v10 = [v5 intersectsSet:v9],
          v9,
          v10))
    {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (BOOL)matchesElement:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 labels];
  unint64_t v6 = [v5 allObjects];
  BOOL v7 = [(KGElementFilter *)self matchesLabels:v6];

  if (v7)
  {
    int v8 = [v4 properties];
    BOOL v9 = [(KGElementFilter *)self matchesProperties:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)noLabelsOrProperties
{
  return ![(NSArray *)self->_requiredLabels count]
      && ![(NSArray *)self->_optionalLabels count]
      && [(NSDictionary *)self->_properties count] == 0;
}

- (KGElementFilter)initWithRequiredLabels:(id)a3 optionalLabels:(id)a4 properties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)KGElementFilter;
  uint64_t v12 = [(KGElementFilter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requiredLabels, a3);
    objc_storeStrong((id *)&v13->_optionalLabels, a4);
    objc_storeStrong((id *)&v13->_properties, a5);
  }

  return v13;
}

+ (id)any
{
  id v2 = objc_alloc((Class)a1);
  unint64_t v3 = (void *)[v2 initWithRequiredLabels:MEMORY[0x1E4F1CBF0] optionalLabels:MEMORY[0x1E4F1CBF0] properties:MEMORY[0x1E4F1CC08]];
  return v3;
}

@end