@interface JETreatmentAction
+ (id)treatmentActionWithField:(id)a3 configuration:(id)a4 topic:(id)a5;
- (JETreatmentAction)initWithField:(id)a3 configuration:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
- (id)performAction:(uint64_t)a3 atKeyIndex:(void *)a4 context:;
- (uint64_t)sourceField;
- (void)performActionWithContext:(id)a3;
@end

@implementation JETreatmentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceKeyPath, 0);
  objc_storeStrong((id *)&self->_destinationKeyPath, 0);
  objc_storeStrong((id *)&self->_extractAndReplaceConfig, 0);
  objc_storeStrong((id *)&self->_fieldsMap, 0);
  objc_storeStrong((id *)&self->_whitelistedFields, 0);
  objc_storeStrong((id *)&self->_blacklistedFields, 0);
  objc_storeStrong(&self->_overrideFieldValue, 0);
  objc_storeStrong((id *)&self->_sourceField, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

- (uint64_t)sourceField
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)performActionWithContext:(id)a3
{
  id v4 = a3;
  -[JETreatmentContext metrics]((uint64_t)v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[JETreatmentAction performAction:atKeyIndex:context:]((id *)&self->super.isa, v6, 0, v4);
  v5 = (char *)objc_claimAutoreleasedReturnValue();
  -[JETreatmentContext setMetrics:](v4, v5);
}

- (id)performAction:(uint64_t)a3 atKeyIndex:(void *)a4 context:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    if ([a1[10] count] == a3)
    {
      a1 = [a1 performAction:v7 context:v8];
    }
    else
    {
      id v9 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }

      if (v10)
      {
        v11 = [a1[10] objectAtIndexedSubscript:a3];
        v12 = [a1[9] objectAtIndexedSubscript:a3];
        if ([v11 hasSuffix:@"[]"])
        {
          uint64_t v13 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);

          v14 = [v10 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v15 = v14;
          }
          else {
            id v15 = 0;
          }

          if (v15)
          {
            uint64_t v31 = v13;
            v32 = v10;
            v33 = v12;
            v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v30 = v15;
            id v20 = v15;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v35;
              uint64_t v24 = a3 + 1;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v35 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v26 = -[JETreatmentAction performAction:atKeyIndex:context:](a1, *(void *)(*((void *)&v34 + 1) + 8 * i), v24, v8);
                  if (v26) {
                    [v19 addObject:v26];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
              }
              while (v22);
            }

            v12 = v33;
            if ([v33 hasSuffix:@"[]"])
            {
              uint64_t v27 = objc_msgSend(v33, "substringToIndex:", objc_msgSend(v33, "length") - 2);

              v12 = (void *)v27;
            }
            uint64_t v13 = v31;
            id v10 = v32;
            id v15 = v30;
            v28 = objc_msgSend(v32, "mutableCopy", v30);
            [v28 setObject:v19 forKeyedSubscript:v12];
            a1 = (id *)[v28 copy];
          }
          else
          {
            a1 = (id *)v9;
          }

          v11 = (void *)v13;
        }
        else
        {
          v16 = [v10 objectForKeyedSubscript:v11];
          v17 = -[JETreatmentAction performAction:atKeyIndex:context:](a1, v16, a3 + 1, v8);

          v18 = (void *)[v10 mutableCopy];
          [v18 setObject:v17 forKeyedSubscript:v12];
          a1 = (id *)[v18 copy];
        }
      }
      else
      {
        a1 = (id *)v9;
      }
    }
  }

  return a1;
}

- (id)performAction:(id)a3 context:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self)
  {
    if (self->_blacklisted)
    {
      id v8 = 0;
      goto LABEL_64;
    }
    if (self->_overrideFieldValue)
    {
      id v9 = self->_overrideFieldValue;

      id v6 = v9;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      fieldsMap = self->_fieldsMap;
    }
    else {
      fieldsMap = 0;
    }
    id v49 = v7;
    if ([(NSDictionary *)fieldsMap count])
    {
      v56 = (void *)[v6 mutableCopy];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      if (self) {
        v11 = self->_fieldsMap;
      }
      else {
        v11 = 0;
      }
      obuint64_t j = v11;
      uint64_t v54 = [(NSDictionary *)obj countByEnumeratingWithState:&v66 objects:v73 count:16];
      if (v54)
      {
        uint64_t v52 = *(void *)v67;
        v53 = self;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v67 != v52) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v66 + 1) + 8 * v12);
            if (self) {
              v14 = self->_fieldsMap;
            }
            else {
              v14 = 0;
            }
            id v15 = v14;
            v16 = [(NSDictionary *)v15 objectForKeyedSubscript:v13];

            objc_opt_class();
            uint64_t v55 = v13;
            v57 = v16;
            if (objc_opt_isKindOfClass())
            {
              v72 = v16;
              id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v17 = v16;
              }
              else {
                id v17 = 0;
              }
            }
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            id v18 = v17;
            uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v71 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v63;
              while (2)
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v63 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  id v24 = v6;
                  v25 = [v23 componentsSeparatedByString:@"."];
                  v26 = NullableValueForKeyPathArray(v24, v25, 0);

                  if (v26)
                  {
                    [v56 setObject:v26 forKeyedSubscript:v55];

                    goto LABEL_34;
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v62 objects:v71 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }
LABEL_34:

            ++v12;
            self = v53;
          }
          while (v12 != v54);
          uint64_t v27 = [(NSDictionary *)obj countByEnumeratingWithState:&v66 objects:v73 count:16];
          uint64_t v54 = v27;
        }
        while (v27);
      }

      id v7 = v49;
      if (self) {
        goto LABEL_39;
      }
    }
    else
    {
      v56 = v6;
      if (self)
      {
LABEL_39:
        whitelistedFields = self->_whitelistedFields;
        goto LABEL_40;
      }
    }
    whitelistedFields = 0;
LABEL_40:
    if ([(NSArray *)whitelistedFields count])
    {
      id v29 = objc_alloc(MEMORY[0x1E4F1CA60]);
      if (self) {
        id v30 = self->_whitelistedFields;
      }
      else {
        id v30 = 0;
      }
      uint64_t v31 = objc_msgSend(v29, "initWithCapacity:", -[NSArray count](v30, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      if (self) {
        v32 = self->_whitelistedFields;
      }
      else {
        v32 = 0;
      }
      v33 = v32;
      uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v59 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * j);
            uint64_t v39 = [v56 objectForKeyedSubscript:v38];
            [v31 setObject:v39 forKeyedSubscript:v38];
          }
          uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v35);
      }

      id v7 = v50;
      if (self) {
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v31 = v56;
      if (self)
      {
LABEL_53:
        blacklistedFields = self->_blacklistedFields;
        goto LABEL_54;
      }
    }
    blacklistedFields = 0;
LABEL_54:
    if ([(NSArray *)blacklistedFields count])
    {
      v41 = (void *)[v31 mutableCopy];
      id v6 = v41;
      if (self) {
        v42 = self->_blacklistedFields;
      }
      else {
        v42 = 0;
      }
      [v41 removeObjectsForKeys:v42];

      if (self) {
        goto LABEL_58;
      }
    }
    else
    {
      id v6 = v31;
      if (self)
      {
LABEL_58:
        extractAndReplaceConfig = self->_extractAndReplaceConfig;
        goto LABEL_59;
      }
    }
    extractAndReplaceConfig = 0;
LABEL_59:
    if ([(NSDictionary *)extractAndReplaceConfig count])
    {
      if (self) {
        v44 = self->_extractAndReplaceConfig;
      }
      else {
        v44 = 0;
      }
      v45 = v44;
      v46 = -[JETreatmentContext metrics]((uint64_t)v7);
      uint64_t v47 = +[JEExtractAndReplaceField metricsAfterExtractAndReplaceSubFieldWithConfig:v45 metrics:v46];

      id v6 = (id)v47;
    }
  }
  id v6 = v6;
  id v8 = v6;
LABEL_64:

  return v8;
}

+ (id)treatmentActionWithField:(id)a3 configuration:(id)a4 topic:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (!v11)
  {
    v14 = 0;
    goto LABEL_24;
  }
  uint64_t v12 = [v11 objectForKeyedSubscript:@"treatmentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if ([v13 isEqualToString:@"numberDeres"])
  {
    id v15 = JEDeresNumberTreatmentAction;
LABEL_22:
    v16 = (JEHashTreatmentAction *)[[v15 alloc] initWithField:v7 configuration:v11];
    goto LABEL_23;
  }
  if ([v13 isEqualToString:@"urlDeres"])
  {
    id v15 = JEDeresURLTreatmentAction;
    goto LABEL_22;
  }
  if (![v13 isEqualToString:@"hash"])
  {
    if ([v13 isEqualToString:@"versionDeres"])
    {
      id v15 = JEDeresVersionTreatmentAction;
    }
    else if ([v13 isEqualToString:@"impressionDurationFilter"])
    {
      id v15 = JEImpressionDurationFilteringTreatmentAction;
    }
    else if ([v13 isEqualToString:@"allowList"])
    {
      id v15 = _TtC9JetEngine33AllowedFieldValuesTreatmentAction;
    }
    else
    {
      id v15 = JETreatmentAction;
    }
    goto LABEL_22;
  }
  v16 = [[JEHashTreatmentAction alloc] initWithField:v7 configuration:v11 topic:v9];
LABEL_23:
  v14 = v16;

LABEL_24:
  return v14;
}

- (JETreatmentAction)initWithField:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)JETreatmentAction;
  id v8 = [(JETreatmentAction *)&v46 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    field = v8->_field;
    v8->_field = (NSString *)v9;

    id v11 = [v7 objectForKeyedSubscript:@"sourceField"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    uint64_t v13 = [v12 copy];
    sourceField = v8->_sourceField;
    v8->_sourceField = (NSString *)v13;

    uint64_t v15 = [v7 objectForKeyedSubscript:@"overrideFieldValue"];
    id overrideFieldValue = v8->_overrideFieldValue;
    v8->_id overrideFieldValue = (id)v15;

    id v17 = [v7 objectForKeyedSubscript:@"blacklisted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    v8->_blacklisted = [v18 BOOLValue];
    uint64_t v19 = [v7 objectForKeyedSubscript:@"whitelistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    uint64_t v21 = [v20 copy];
    whitelistedFields = v8->_whitelistedFields;
    v8->_whitelistedFields = (NSArray *)v21;

    uint64_t v23 = [v7 objectForKeyedSubscript:@"blacklistedFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    uint64_t v25 = [v24 copy];
    blacklistedFields = v8->_blacklistedFields;
    v8->_blacklistedFields = (NSArray *)v25;

    uint64_t v27 = [v7 objectForKeyedSubscript:@"fieldsMap"];
    objc_opt_class();
    v45 = v24;
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    uint64_t v29 = [v28 copy];
    fieldsMap = v8->_fieldsMap;
    v8->_fieldsMap = (NSDictionary *)v29;

    uint64_t v31 = [v7 objectForKeyedSubscript:@"extractAndReplace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }
    else {
      id v32 = 0;
    }

    uint64_t v33 = [v32 copy];
    extractAndReplaceConfig = v8->_extractAndReplaceConfig;
    v8->_extractAndReplaceConfig = (NSDictionary *)v33;

    uint64_t v35 = v8->_field;
    uint64_t v36 = [(NSString *)v35 componentsSeparatedByString:@"."];
    destinationKeyPath = v8->_destinationKeyPath;
    v8->_destinationKeyPath = (NSArray *)v36;

    uint64_t v38 = [(NSString *)v8->_sourceField length];
    uint64_t v39 = v8->_destinationKeyPath;
    if (v38)
    {
      v40 = (NSArray *)[(NSArray *)v39 mutableCopy];
      [(NSArray *)v40 removeLastObject];
      [(NSArray *)v40 addObject:v8->_sourceField];
      uint64_t v41 = [(NSArray *)v40 copy];
      sourceKeyPath = v8->_sourceKeyPath;
      v8->_sourceKeyPath = (NSArray *)v41;
    }
    else
    {
      v43 = v39;
      v40 = v8->_sourceKeyPath;
      v8->_sourceKeyPath = v43;
    }
  }
  return v8;
}

@end