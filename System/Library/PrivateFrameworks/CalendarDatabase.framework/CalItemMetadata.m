@interface CalItemMetadata
+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5;
+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4;
+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_whitelistedClassesForSecureCoding;
+ (id)metadataWithData:(id)a3;
+ (id)metadataWithICSComponent:(id)a3;
- (CalItemMetadata)init;
- (CalItemMetadata)initWithCoder:(id)a3;
- (CalItemMetadata)initWithICSComponent:(id)a3;
- (NSDictionary)unrecognizedProperties;
- (id)dataRepresentationWithExistingMetaData:(id)a3;
- (id)propertyValueForComparison:(id)a3 propertyKey:(id)a4;
- (void)applyToComponent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CalItemMetadata

+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (isRecognizedProperty_inComponent__onceToken_0 != -1) {
    dispatch_once(&isRecognizedProperty_inComponent__onceToken_0, &__block_literal_global_22);
  }
  if ([v6 isEqualToString:@"VTODO"]
    && ([(id)isRecognizedProperty_inComponent__savedPropertiesForTodosOnly containsObject:v5] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [(id)isRecognizedProperty_inComponent__sSavedProps containsObject:v5];
  }

  return v7;
}

uint64_t __52__CalItemMetadata_isRecognizedProperty_inComponent___block_invoke()
{
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v0 = objc_msgSend(v6, "initWithObjects:", *MEMORY[0x1E4FB8148], *MEMORY[0x1E4FB8150], *MEMORY[0x1E4FB8158], *MEMORY[0x1E4FB8180], *MEMORY[0x1E4FB8178], *MEMORY[0x1E4FB8190], *MEMORY[0x1E4FB8198], *MEMORY[0x1E4FB81A0], *MEMORY[0x1E4FB81A8], *MEMORY[0x1E4FB81B8], *MEMORY[0x1E4FB81D0], *MEMORY[0x1E4FB81D8], *MEMORY[0x1E4FB81F0], *MEMORY[0x1E4FB81F8], *MEMORY[0x1E4FB8210], *MEMORY[0x1E4FB8220], *MEMORY[0x1E4FB8238],
         *MEMORY[0x1E4FB8240],
         *MEMORY[0x1E4FB8248],
         *MEMORY[0x1E4FB8260],
         *MEMORY[0x1E4FB8288],
         *MEMORY[0x1E4FB8298],
         *MEMORY[0x1E4FB82A0],
         *MEMORY[0x1E4FB82A8],
         *MEMORY[0x1E4FB82D0],
         *MEMORY[0x1E4FB82D8],
         *MEMORY[0x1E4FB8218],
         *MEMORY[0x1E4FB8110],
         *MEMORY[0x1E4FB80F0],
         *MEMORY[0x1E4FB80E8],
         *MEMORY[0x1E4FB8090],
         *MEMORY[0x1E4FB8010],
         *MEMORY[0x1E4FB8058],
         *MEMORY[0x1E4FB81E8],
         *MEMORY[0x1E4FB8060],
         *MEMORY[0x1E4FB8008],
         *MEMORY[0x1E4FB80C0],
         *MEMORY[0x1E4FB80D0],
         *MEMORY[0x1E4FB80D8],
         *MEMORY[0x1E4FB80C8],
         *MEMORY[0x1E4FB80E0],
         *MEMORY[0x1E4FB7FF8],
         *MEMORY[0x1E4FB8000],
         *MEMORY[0x1E4FB8018],
         *MEMORY[0x1E4FB8020],
         *MEMORY[0x1E4FB8028],
         *MEMORY[0x1E4FB8030],
         *MEMORY[0x1E4FB8040],
         *MEMORY[0x1E4FB8088],
         *MEMORY[0x1E4FB8098],
         *MEMORY[0x1E4FB80A0],
         *MEMORY[0x1E4FB80A8],
         *MEMORY[0x1E4FB80B0],
         *MEMORY[0x1E4FB80B8],
         *MEMORY[0x1E4FB7FE0],
         *MEMORY[0x1E4FB8070],
         *MEMORY[0x1E4FB7FE8],
         *MEMORY[0x1E4FB7FF0],
         0);
  v1 = (void *)isRecognizedProperty_inComponent__sSavedProps;
  isRecognizedProperty_inComponent__sSavedProps = v0;

  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4FB8230], *MEMORY[0x1E4FB81B0], *MEMORY[0x1E4FB8170], *MEMORY[0x1E4FB8068], *MEMORY[0x1E4FB7FC8], 0);
  uint64_t v4 = isRecognizedProperty_inComponent__savedPropertiesForTodosOnly;
  isRecognizedProperty_inComponent__savedPropertiesForTodosOnly = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5
{
  uint64_t v6 = isRecognizedParameter_forProperty_inComponent__onceToken_0;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&isRecognizedParameter_forProperty_inComponent__onceToken_0, &__block_literal_global_3);
  }
  v9 = [(id)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0 objectForKeyedSubscript:v7];

  char v10 = [v9 containsObject:v8];
  return v10;
}

void __65__CalItemMetadata_isRecognizedParameter_forProperty_inComponent___block_invoke()
{
  v16[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB8128], *MEMORY[0x1E4FB8120], *MEMORY[0x1E4FB8050], 0);
  v15[0] = *MEMORY[0x1E4FB8198];
  uint64_t v1 = *MEMORY[0x1E4FB82B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB82B8], 0);
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E4FB81A8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v1, 0);
  v16[1] = v3;
  v15[2] = *MEMORY[0x1E4FB81D0];
  uint64_t v4 = *MEMORY[0x1E4FB82E0];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB82E0], v1, 0);
  v16[2] = v5;
  v15[3] = *MEMORY[0x1E4FB8240];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v4, v1, 0);
  v16[3] = v6;
  v15[4] = *MEMORY[0x1E4FB8248];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB8250], 0);
  uint64_t v8 = *MEMORY[0x1E4FB8090];
  v16[4] = v7;
  v16[5] = v0;
  uint64_t v9 = *MEMORY[0x1E4FB8008];
  v15[5] = v8;
  v15[6] = v9;
  uint64_t v10 = *MEMORY[0x1E4FB80D8];
  v16[6] = v0;
  v16[7] = v0;
  uint64_t v11 = *MEMORY[0x1E4FB80F0];
  v15[7] = v10;
  v15[8] = v11;
  v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB8100], *MEMORY[0x1E4FB80F8], 0);
  v16[8] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:9];
  v14 = (void *)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0;
  isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName_0 = v13;
}

+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken_0;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken_0, &__block_literal_global_6);
  }
  char v6 = [(id)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0 containsObject:v5];

  return v6;
}

uint64_t __81__CalItemMetadata_shouldSkipSavingUnrecognizedParametersForProperty_inComponent___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4FB8148], *MEMORY[0x1E4FB8150], *MEMORY[0x1E4FB8220], *MEMORY[0x1E4FB81D8], 0);
  uint64_t v2 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0;
  shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters_0 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (CalItemMetadata)initWithICSComponent:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CalItemMetadata;
  id v5 = [(CalItemMetadata *)&v60 init];
  if (v5)
  {
    char v6 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8E81000, v6, OS_LOG_TYPE_DEBUG, "Initializing calItem metadata", buf, 2u);
    }
    id v7 = [(id)objc_opt_class() name];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 unrecognizedComponentName];
    }
    uint64_t v10 = v9;

    v47 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v37 = v4;
    uint64_t v11 = [v4 properties];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v57;
      uint64_t v38 = *(void *)v57;
      v39 = v11;
      do
      {
        uint64_t v15 = 0;
        uint64_t v41 = v13;
        do
        {
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
          v17 = [v16 uppercaseString];
          v18 = [v11 objectForKey:v16];
          if ([(id)objc_opt_class() isRecognizedProperty:v17 inComponent:v10])
          {
            if (([(id)objc_opt_class() shouldSkipSavingUnrecognizedParametersForProperty:v17 inComponent:v10] & 1) == 0)
            {
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v19 = v18;
              uint64_t v42 = [v19 countByEnumeratingWithState:&v52 objects:v62 count:16];
              if (v42)
              {
                uint64_t v20 = *(void *)v53;
                v45 = v18;
                v46 = v17;
                v44 = v19;
                uint64_t v40 = *(void *)v53;
                do
                {
                  uint64_t v21 = 0;
                  do
                  {
                    if (*(void *)v53 != v20)
                    {
                      uint64_t v22 = v21;
                      objc_enumerationMutation(v19);
                      uint64_t v21 = v22;
                    }
                    uint64_t v43 = v21;
                    v23 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
                    long long v48 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    v24 = [v23 allParameters];
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v61 count:16];
                    if (v25)
                    {
                      uint64_t v26 = v25;
                      uint64_t v27 = *(void *)v49;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v26; ++i)
                        {
                          if (*(void *)v49 != v27) {
                            objc_enumerationMutation(v24);
                          }
                          v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                          uint64_t v30 = objc_opt_class();
                          v31 = [v29 uppercaseString];
                          LOBYTE(v30) = [(id)v30 isRecognizedParameter:v31 forProperty:v16 inComponent:v10];

                          if ((v30 & 1) == 0)
                          {

                            [(NSDictionary *)v47 setObject:v44 forKey:v16];
                            uint64_t v14 = v38;
                            uint64_t v11 = v39;
                            uint64_t v13 = v41;
                            v18 = v45;
                            v17 = v46;
                            goto LABEL_34;
                          }
                        }
                        uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v61 count:16];
                        if (v26) {
                          continue;
                        }
                        break;
                      }
                    }

                    uint64_t v21 = v43 + 1;
                    uint64_t v14 = v38;
                    uint64_t v11 = v39;
                    uint64_t v20 = v40;
                    uint64_t v13 = v41;
                    v18 = v45;
                    v17 = v46;
                    id v19 = v44;
                  }
                  while (v43 + 1 != v42);
                  uint64_t v32 = [v44 countByEnumeratingWithState:&v52 objects:v62 count:16];
                  uint64_t v20 = v40;
                  uint64_t v42 = v32;
                }
                while (v32);
              }
            }
          }
          else
          {
            v33 = v18;
            v34 = CDBiCalendarConversionHandle;
            if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v64 = v16;
              _os_log_impl(&dword_1A8E81000, v34, OS_LOG_TYPE_DEBUG, "Found an unrecognized property: %@", buf, 0xCu);
            }
            v18 = v33;
            [(NSDictionary *)v47 setObject:v33 forKey:v16];
          }
LABEL_34:

          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v13);
    }
    unrecognizedProperties = v5->_unrecognizedProperties;
    v5->_unrecognizedProperties = v47;

    id v4 = v37;
  }

  return v5;
}

- (CalItemMetadata)init
{
  return [(CalItemMetadata *)self initWithICSComponent:0];
}

- (id)propertyValueForComparison:(id)a3 propertyKey:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 values];

    if ([v5 count] == 1) {
      [v5 objectAtIndexedSubscript:0];
    }
    else {
    char v6 = [v5 sortedArrayUsingSelector:sel_compare_];
    }
    id v4 = v5;
  }
  else
  {
    char v6 = [v4 value];
  }

  return v6;
}

- (void)applyToComponent:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)objc_opt_class() name];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 unrecognizedComponentName];
  }
  long long v53 = v6;

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = self->_unrecognizedProperties;
  uint64_t v43 = [(NSDictionary *)obj countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v69;
    *(void *)&long long v7 = 138543362;
    long long v40 = v7;
    id v45 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v69 != v42)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v44 = v8;
        uint64_t v10 = *(void **)(*((void *)&v68 + 1) + 8 * v8);
        long long v54 = objc_msgSend(v10, "uppercaseString", v40);
        if (([(id)objc_opt_class() isRecognizedProperty:v54 inComponent:v53] & 1) == 0)
        {
          uint64_t v11 = [v3 propertiesForName:v10];

          if (!v11)
          {
            id v46 = [(NSDictionary *)self->_unrecognizedProperties objectForKey:v10];
            objc_msgSend(v3, "setProperties:forName:");
            goto LABEL_53;
          }
          uint64_t v12 = CDBiCalendarConversionHandle;
          if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v40;
            v73 = v10;
            _os_log_impl(&dword_1A8E81000, v12, OS_LOG_TYPE_FAULT, "We have a value for %{public}@, but the item already has properties with that name! _isSavedProp may be out of date.", buf, 0xCu);
          }
        }
        uint64_t v13 = [v3 propertiesForName:v10];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v46 = v13;
        uint64_t v49 = [v13 countByEnumeratingWithState:&v64 objects:v78 count:16];
        if (v49)
        {
          long long v51 = 0;
          uint64_t v48 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v65 != v48) {
                objc_enumerationMutation(v46);
              }
              uint64_t v15 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              long long v52 = [(CalItemMetadata *)self propertyValueForComparison:v15 propertyKey:v10];
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v16 = [(NSDictionary *)self->_unrecognizedProperties objectForKeyedSubscript:v10];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v77 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v50 = i;
                uint64_t v19 = *(void *)v61;
LABEL_20:
                uint64_t v20 = 0;
                while (1)
                {
                  if (*(void *)v61 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void **)(*((void *)&v60 + 1) + 8 * v20);
                  uint64_t v22 = v10;
                  v23 = [(CalItemMetadata *)self propertyValueForComparison:v21 propertyKey:v10];
                  if ([v23 isEqual:v52])
                  {
                    if (![v51 containsObject:v21]) {
                      break;
                    }
                  }

                  ++v20;
                  uint64_t v10 = v22;
                  if (v18 == v20)
                  {
                    uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v77 count:16];
                    if (v18) {
                      goto LABEL_20;
                    }
                    uint64_t i = v50;
                    goto LABEL_46;
                  }
                }
                id v24 = v21;

                if (!v24)
                {
                  uint64_t v10 = v22;
                  uint64_t i = v50;
                  goto LABEL_48;
                }
                id v25 = v51;
                if (!v51) {
                  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                }
                long long v51 = v25;
                [v25 addObject:v24];
                uint64_t v26 = [v15 allParameters];
                id v47 = v24;
                uint64_t v27 = [v24 allParameters];
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v76 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  uint64_t v30 = *(void *)v57;
                  do
                  {
                    for (uint64_t j = 0; j != v29; ++j)
                    {
                      if (*(void *)v57 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      uint64_t v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
                      v33 = [v26 objectForKey:v32];
                      if (v33)
                      {
                      }
                      else
                      {
                        uint64_t v34 = objc_opt_class();
                        v35 = [v32 uppercaseString];
                        LOBYTE(v34) = [(id)v34 isRecognizedParameter:v35 forProperty:v54 inComponent:v53];

                        if ((v34 & 1) == 0)
                        {
                          v36 = [v15 parameterValueForName:v32];

                          if (v36)
                          {
                            id v37 = CDBiCalendarConversionHandle;
                            if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543618;
                              v73 = v32;
                              __int16 v74 = 2114;
                              v75 = v22;
                              _os_log_impl(&dword_1A8E81000, v37, OS_LOG_TYPE_FAULT, "We have a value for parameter %{public}@ on %{public}@, but the property already has a parameter with that name! -isRecognizedParameter:forProperty:inComponent: may be out of date.", buf, 0x16u);
                            }
                          }
                          else
                          {
                            uint64_t v38 = [v27 objectForKey:v32];
                            [v15 setParameterValue:v38 forName:v32];
                          }
                        }
                      }
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v76 count:16];
                  }
                  while (v29);
                }

                id v3 = v45;
                uint64_t v10 = v22;
                uint64_t i = v50;
                v16 = v47;
              }
LABEL_46:

LABEL_48:
            }
            uint64_t v49 = [v46 countByEnumeratingWithState:&v64 objects:v78 count:16];
          }
          while (v49);
        }
        else
        {
          long long v51 = 0;
        }

LABEL_53:
        uint64_t v8 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v39 = [(NSDictionary *)obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      uint64_t v43 = v39;
    }
    while (v39);
  }
}

+ (id)_whitelistedClassesForSecureCoding
{
  if (_whitelistedClassesForSecureCoding_onceToken != -1) {
    dispatch_once(&_whitelistedClassesForSecureCoding_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)_whitelistedClassesForSecureCoding_whitelistedClasses;
  return v2;
}

void __53__CalItemMetadata__whitelistedClassesForSecureCoding__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  id v3 = (void *)_whitelistedClassesForSecureCoding_whitelistedClasses;
  _whitelistedClassesForSecureCoding_whitelistedClasses = v2;
}

- (id)dataRepresentationWithExistingMetaData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = [(id)objc_opt_class() _whitelistedClassesForSecureCoding];
  id v21 = 0;
  uint64_t v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v21];
  id v8 = v21;

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (id)[v7 mutableCopy];

      if (v9) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    uint64_t v10 = CDBiCalendarConversionHandle;
    if (!os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    uint64_t v11 = "Unknown object in external data for item.  Dropping it.  object is %@";
    goto LABEL_10;
  }
  uint64_t v10 = CDBiCalendarConversionHandle;
  if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    uint64_t v11 = "Failed to unarchive external data for item. Error = %@";
LABEL_10:
    _os_log_impl(&dword_1A8E81000, v10, OS_LOG_TYPE_DEBUG, v11, buf, 0xCu);
  }
LABEL_11:

LABEL_12:
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_13:
  id v20 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v20];
  id v13 = v20;
  if (v12)
  {
    [v9 setObject:v12 forKey:@"iCalExtraProperties"];
  }
  else
  {
    uint64_t v14 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      _os_log_impl(&dword_1A8E81000, v14, OS_LOG_TYPE_ERROR, "Error archiving item metadata: %@", buf, 0xCu);
    }
  }

  id v19 = 0;
  uint64_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v19];
  id v16 = v19;
  if (!v15)
  {
    uint64_t v17 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v16;
      _os_log_impl(&dword_1A8E81000, v17, OS_LOG_TYPE_ERROR, "Error archiving external representation dictionary: %@", buf, 0xCu);
    }
  }

  return v15;
}

+ (id)metadataWithICSComponent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithICSComponent:v4];

  return v5;
}

+ (id)metadataWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
LABEL_12:
    id v9 = 0;
    goto LABEL_15;
  }
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v5 = [(id)objc_opt_class() _whitelistedClassesForSecureCoding];
  id v15 = 0;
  uint64_t v6 = [v4 unarchivedObjectOfClasses:v5 fromData:v3 error:&v15];
  id v7 = v15;

  if (!v6)
  {
    uint64_t v12 = CDBiCalendarConversionHandle;
    if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_1A8E81000, v12, OS_LOG_TYPE_DEBUG, "Failed to unarchive external data to fetch item metadata. Error = %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  id v8 = [v6 objectForKey:@"iCalExtraProperties"];
  if (v8)
  {
    id v14 = v7;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v14];
    id v10 = v14;

    if (!v9)
    {
      uint64_t v11 = CDBiCalendarConversionHandle;
      if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v10;
        _os_log_impl(&dword_1A8E81000, v11, OS_LOG_TYPE_DEBUG, "Failed to unarchive extra properties from external data. Error = %@", buf, 0xCu);
      }
      id v9 = 0;
    }
    id v7 = v10;
  }
  else
  {
    id v9 = 0;
  }

LABEL_15:
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CalItemMetadata)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CalItemMetadata;
  uint64_t v5 = [(CalItemMetadata *)&v18 init];
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_30);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__xPropsClasses forKey:@"CalXProps"];
    unrecognizedProperties = v5->_unrecognizedProperties;
    v5->_unrecognizedProperties = (NSDictionary *)v6;

    if ([v4 containsValueForKey:@"CalClassification"])
    {
      unsigned int v8 = [v4 decodeIntForKey:@"CalClassification"];
      id v9 = objc_alloc(MEMORY[0x1E4FB7F70]);
      id v10 = [MEMORY[0x1E4FB7F08] numberWithLong:v8];
      uint64_t v11 = (void *)[v9 initWithValue:v10 type:5005];

      uint64_t v12 = v5->_unrecognizedProperties;
      if (v12) {
        uint64_t v13 = [(NSDictionary *)v12 mutableCopy];
      }
      else {
        uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      id v14 = (NSDictionary *)v13;
      v19[0] = v11;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [(NSDictionary *)v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB8160]];

      id v16 = v5->_unrecognizedProperties;
      v5->_unrecognizedProperties = v14;
    }
    if (!v5->_unrecognizedProperties)
    {
      v5->_unrecognizedProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
  }

  return v5;
}

void __33__CalItemMetadata_initWithCoder___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)initWithCoder__xPropsClasses;
  initWithCoder__xPropsClasses = v2;
}

- (NSDictionary)unrecognizedProperties
{
  return self->_unrecognizedProperties;
}

- (void).cxx_destruct
{
}

- (void)dataRepresentationWithExistingMetaData:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = objc_begin_catch(a1);
  uint64_t v2 = CDBiCalendarConversionHandle;
  if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    id v4 = v1;
    _os_log_impl(&dword_1A8E81000, v2, OS_LOG_TYPE_DEBUG, "exception %@ while trying to unarchive external data for item", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

@end