@interface INSchema
+ (BOOL)_defaultSchemaCanSupportIntent:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_applicationBundleIdentifierFromBundleIdentifier:(id)a3;
+ (id)_cache;
+ (id)_defaultSchemaForBundle:(id)a3;
+ (id)_defaultSchemaForBundle:(id)a3 contentOptions:(unint64_t)a4;
+ (id)_loadSystemSchema;
+ (id)_schemaWithIntentDefinitionURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6;
+ (id)_supportedClasses;
+ (id)_supportedTypesDictionary;
+ (id)defaultSchema;
+ (id)schemaWithBundleRecord:(id)a3 fallbackToSystemSchema:(BOOL)a4;
+ (id)systemSchema;
+ (void)_resetCache;
- (BOOL)isSystem;
- (INSchema)init;
- (INSchema)initWithCoder:(id)a3;
- (NSArray)_definitionFileURLs;
- (NSDictionary)_typeForClassDictionary;
- (NSDictionary)_typeForSemanticKeypathDictionary;
- (NSMutableDictionary)_configurableParameterCombinationDictionary;
- (NSMutableDictionary)_enums;
- (NSMutableDictionary)_parameterCombinationDictionary;
- (NSMutableDictionary)_schemaDictionary;
- (NSMutableDictionary)_types;
- (NSString)_mainBundleIdentifier;
- (id)_classNamesForClass:(Class)a3;
- (id)_codableDescriptionWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6 codableDescriptionClass:(Class)a7;
- (id)_codableDescriptionsForClass:(Class)a3;
- (id)_configurableParameterCombinationsForClassName:(id)a3;
- (id)_dictionaryRepresentation;
- (id)_dictionaryRepresentationForIntentCodableDescription:(id)a3 intentResponseCodableDescription:(id)a4 appInfo:(id)a5 localizer:(id)a6;
- (id)_initWithContentsOfURLs:(id)a3;
- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4;
- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5;
- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6;
- (id)_intentResponseWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 className:(id)a5 filename:(id)a6 bundleIdentifier:(id)a7 referencedCodableDescriptions:(id)a8;
- (id)_intentWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6;
- (id)_objectDescriptionForClass:(Class)a3 identifier:(id)a4;
- (id)_objectDescriptionForTypeOfClass:(Class)a3;
- (id)_objectDescriptionWithSemanticKeypath:(id)a3;
- (id)_parameterCombinationsForClass:(Class)a3;
- (id)_parameterCombinationsForClassName:(id)a3;
- (id)_typesWithDictionary:(id)a3 filename:(id)a4 bundleIdentifier:(id)a5;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)dictionaryRepresentationForIntent:(id)a3;
- (id)dictionaryRepresentationForIntent:(id)a3 localizer:(id)a4;
- (id)intentCodableDescriptionWithIntentClassName:(id)a3;
- (id)intentResponseCodableDescriptionWithIntentClassName:(id)a3;
- (id)intentResponseCodableDescriptionWithIntentResponseClassName:(id)a3;
- (id)intentWithName:(id)a3;
- (void)_loadIntentsFromArrayOfDictionaries:(id)a3 intentDefinitionNamespace:(id)a4 fromFile:(id)a5 bundleIdentifier:(id)a6 referencedCodableDescriptions:(id)a7 contentOptions:(unint64_t)a8;
- (void)_setObjectDescription:(id)a3 forClass:(Class)a4 identifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSchema

+ (id)_supportedTypesDictionary
{
  if (_supportedTypesDictionary_onceToken != -1) {
    dispatch_once(&_supportedTypesDictionary_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)_supportedTypesDictionary_supportedTypesDictionary;

  return v2;
}

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v64 = a5;
  v11 = [(INSchema *)self init];
  if (v11)
  {
    v11->_system = [v10 isEqualToString:@"com.apple.Intents"];
    objc_storeStrong((id *)&v11->_mainBundleIdentifier, a5);
    uint64_t v12 = [v9 copy];
    definitionFileURLs = v11->_definitionFileURLs;
    v11->_definitionFileURLs = (NSArray *)v12;

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v63 = v9;
    obuint64_t j = v9;
    uint64_t v74 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v74)
    {
      uint64_t v14 = *(void *)v87;
      unint64_t v15 = 0x1E4F1C000uLL;
      id v66 = v10;
      v67 = v11;
      uint64_t v65 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v87 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x192F98250]();
          v19 = (void *)MEMORY[0x192F98250]();
          v20 = *(void **)(v15 + 2536);
          id v85 = 0;
          v21 = [v20 dictionaryWithContentsOfURL:v17 error:&v85];
          id v79 = v85;
          if (v21)
          {
            context = v19;
            v77 = v18;
            v75 = [v21 objectForKeyedSubscript:@"INIntentDefinitionNamespace"];
            char v22 = a6;
            if ((a6 & 2) != 0)
            {
              v72 = v17;
              uint64_t v73 = i;
              enums = v11->_enums;
              v23 = [v17 lastPathComponent];
              v71 = v21;
              id v24 = v21;
              id v25 = v10;
              v26 = [NSString stringWithFormat:@"INEnum%@", @"s"];
              v27 = [v24 objectForKeyedSubscript:v26];

              v69 = v24;
              v28 = [v24 objectForKeyedSubscript:@"INIntentDefinitionNamespace"];
              v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              id v80 = v27;
              uint64_t v30 = [v80 countByEnumeratingWithState:&v90 objects:buf count:16];
              if (v30)
              {
                uint64_t v31 = v30;
                uint64_t v32 = *(void *)v91;
                do
                {
                  for (uint64_t j = 0; j != v31; ++j)
                  {
                    if (*(void *)v91 != v32) {
                      objc_enumerationMutation(v80);
                    }
                    uint64_t v34 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                    v35 = objc_alloc_init(INCodableEnum);
                    [(INCodableEnum *)v35 updateWithDictionary:v34];
                    v36 = [INCodableLocalizationTable alloc];
                    v37 = [v23 stringByDeletingPathExtension];
                    v38 = [(INCodableLocalizationTable *)v36 initWithBundleIdentifier:v25 tableName:v37];
                    [(INCodableEnum *)v35 _setLocalizationTable:v38];

                    [(INCodableEnum *)v35 _setEnumNamespace:v28];
                    v39 = [(INCodableEnum *)v35 name];
                    v40 = INIntentDefinitionNamespacedName((uint64_t)v28, v39);
                    [v29 setObject:v35 forKey:v40];
                  }
                  uint64_t v31 = [v80 countByEnumeratingWithState:&v90 objects:buf count:16];
                }
                while (v31);
              }

              v41 = (void *)[v29 copy];
              [(NSMutableDictionary *)enums addEntriesFromDictionary:v41];

              id v10 = v66;
              v11 = v67;
              char v22 = a6;
              uint64_t v14 = v65;
              v17 = v72;
              uint64_t i = v73;
              v21 = v71;
            }
            uint64_t v42 = i;
            if ((v22 & 4) != 0)
            {
              [v17 lastPathComponent];
              v46 = v44 = v17;
              v43 = [(INSchema *)v11 _typesWithDictionary:v21 filename:v46 bundleIdentifier:v10];

              [(NSMutableDictionary *)v11->_types addEntriesFromDictionary:v43];
            }
            else
            {
              v43 = 0;
              v44 = v17;
            }
            v47 = [NSString stringWithFormat:@"INIntent%@", @"s"];
            v48 = [v21 objectForKeyedSubscript:v47];

            v49 = (void *)MEMORY[0x192F98250]();
            v50 = [v44 lastPathComponent];
            [(INSchema *)v11 _loadIntentsFromArrayOfDictionaries:v48 intentDefinitionNamespace:v75 fromFile:v50 bundleIdentifier:v10 referencedCodableDescriptions:v43 contentOptions:a6];

            uint64_t i = v42;
            v18 = v77;
            unint64_t v15 = 0x1E4F1C000;
          }
          else
          {
            v45 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              v51 = v45;
              v52 = [v17 path];
              *(_DWORD *)buf = 136315650;
              v97 = "-[INSchema _initWithContentsOfURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:]";
              __int16 v98 = 2114;
              v99 = v52;
              __int16 v100 = 2114;
              id v101 = v79;
              _os_log_error_impl(&dword_18CB2F000, v51, OS_LOG_TYPE_ERROR, "%s Invalid intent definition plist found at %{public}@, error: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v74 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v74);
    }

    v53 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](v11->_types, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v54 = [(NSMutableDictionary *)v11->_types allValues];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v81 objects:v94 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v82;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v82 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v81 + 1) + 8 * k);
          v60 = [v59 className];
          [(NSDictionary *)v53 setObject:v59 forKey:v60];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v81 objects:v94 count:16];
      }
      while (v56);
    }

    typeForClassDictionary = v11->_typeForClassDictionary;
    v11->_typeForClassDictionary = v53;

    id v9 = v63;
  }

  return v11;
}

- (BOOL)isSystem
{
  return self->_system;
}

- (NSMutableDictionary)_types
{
  return self->_types;
}

- (NSMutableDictionary)_enums
{
  return self->_enums;
}

- (INSchema)init
{
  v14.receiver = self;
  v14.super_class = (Class)INSchema;
  v2 = [(INSchema *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    schemaDictionary = v2->_schemaDictionary;
    v2->_schemaDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    parameterCombinationDictionary = v2->_parameterCombinationDictionary;
    v2->_parameterCombinationDictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    configurableParameterCombinationDictionary = v2->_configurableParameterCombinationDictionary;
    v2->_configurableParameterCombinationDictionary = (NSMutableDictionary *)v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    types = v2->_types;
    v2->_types = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    enums = v2->_enums;
    v2->_enums = v11;
  }
  return v2;
}

+ (id)defaultSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__INSchema_defaultSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSchema_onceToken != -1) {
    dispatch_once(&defaultSchema_onceToken, block);
  }
  v2 = (void *)defaultSchema_schema;

  return v2;
}

- (id)_parameterCombinationsForClassName:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  uint64_t v5 = [v4 lastObject];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_parameterCombinationDictionary objectForKeyedSubscript:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_configurableParameterCombinationsForClassName:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"."];
  uint64_t v5 = [v4 lastObject];

  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_configurableParameterCombinationDictionary objectForKeyedSubscript:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_loadIntentsFromArrayOfDictionaries:(id)a3 intentDefinitionNamespace:(id)a4 fromFile:(id)a5 bundleIdentifier:(id)a6 referencedCodableDescriptions:(id)a7 contentOptions:(unint64_t)a8
{
  char v52 = a8;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v44 = a4;
  id v50 = a5;
  id v49 = a6;
  id v43 = a7;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v13;
  uint64_t v48 = [v13 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v48)
  {
    unint64_t v14 = 0x1E4F29000uLL;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v17 = [*(id *)(v14 + 24) stringWithFormat:@"INIntent%@", @"UnsupportedPlatforms"];
        v18 = [v16 objectForKeyedSubscript:v17];

        if ((v52 & 8) != 0)
        {
          v20 = [*(id *)(v14 + 24) stringWithFormat:@"INIntent%@", @"ParameterCombinations"];
          [v16 objectForKeyedSubscript:v20];
          char v22 = v21 = v18;
          uint64_t v23 = _INParameterCombinationsWithDictionary(v22, v50, v49);

          v18 = v21;
          v19 = (void *)v23;
        }
        else
        {
          v19 = 0;
        }
        if ((v52 & 0x10) != 0)
        {
          id v24 = [*(id *)(v14 + 24) stringWithFormat:@"INIntent%@", @"ManagedParameterCombinations"];
          id v25 = [v16 objectForKeyedSubscript:v24];
          v51 = _INParameterCombinationsWithDictionary(v25, v50, v49);
        }
        else
        {
          v51 = 0;
        }
        if (v52)
        {
          v46 = v18;
          unint64_t v26 = v14;
          v27 = [(INSchema *)self _intentWithDictionary:v16 intentDefinitionNamespace:v44 filename:v50 bundleIdentifier:v49];
          v28 = [v27 className];
          v29 = [v28 stringByAppendingString:@"Response"];

          uint64_t v30 = [(INSchema *)self _intentResponseWithDictionary:v16 intentDefinitionNamespace:v44 className:v29 filename:v50 bundleIdentifier:v49 referencedCodableDescriptions:v43];
          [v27 _establishReferencedCodableDescriptionsUsingTypes:v43 intentResponseCodableDescription:v30];
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = [v27 className];
          [(INSchema *)self _setObjectDescription:v27 forClass:v31 identifier:v32];

          unint64_t v14 = v26;
          v18 = v46;
          [(INSchema *)self _setObjectDescription:v30 forClass:objc_opt_class() identifier:v29];
        }
        v33 = [*(id *)(v14 + 24) stringWithFormat:@"INIntent%@", @"Name"];
        uint64_t v34 = [v16 objectForKeyedSubscript:v33];

        v35 = [*(id *)(v14 + 24) stringWithFormat:@"INIntent%@", @"ClassName"];
        v36 = [v16 objectForKeyedSubscript:v35];

        if (![v36 length])
        {
          v37 = *(void **)(v14 + 24);
          v38 = [v37 stringWithFormat:@"INIntent%@", @"ClassPrefix"];
          uint64_t v39 = [v16 objectForKeyedSubscript:v38];
          v40 = (void *)v39;
          v41 = &stru_1EDA6DB28;
          if (v39) {
            v41 = (__CFString *)v39;
          }
          uint64_t v42 = [v37 stringWithFormat:@"%@%@Intent", v41, v34];

          v36 = (void *)v42;
        }
        [(NSMutableDictionary *)self->_parameterCombinationDictionary setObject:v19 forKeyedSubscript:v36];
        [(NSMutableDictionary *)self->_configurableParameterCombinationDictionary setObject:v51 forKeyedSubscript:v36];
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v48);
  }
}

- (void)_setObjectDescription:(id)a3 forClass:(Class)a4 identifier:(id)a5
{
  schemaDictionary = self->_schemaDictionary;
  id v9 = a5;
  id v10 = a3;
  v11 = NSStringFromClass(a4);
  uint64_t v12 = [(NSMutableDictionary *)schemaDictionary objectForKeyedSubscript:v11];
  id v13 = v12;
  if (v12)
  {
    id v16 = v12;
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    unint64_t v14 = self->_schemaDictionary;
    unint64_t v15 = NSStringFromClass(a4);
    [(NSMutableDictionary *)v14 setObject:v16 forKeyedSubscript:v15];
  }
  [v16 setObject:v10 forKey:v9];
}

- (id)_intentWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  unint64_t v14 = [(INSchema *)self _codableDescriptionWithDictionary:v13 intentDefinitionNamespace:v12 filename:v11 bundleIdentifier:v10 codableDescriptionClass:objc_opt_class()];

  return v14;
}

- (id)_intentResponseWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 className:(id)a5 filename:(id)a6 bundleIdentifier:(id)a7 referencedCodableDescriptions:(id)a8
{
  unint64_t v14 = NSString;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v14 stringWithFormat:@"INIntent%@", @"Response"];
  char v22 = [v20 objectForKeyedSubscript:v21];

  uint64_t v23 = [(INSchema *)self _codableDescriptionWithDictionary:v22 intentDefinitionNamespace:v19 filename:v17 bundleIdentifier:v16 codableDescriptionClass:objc_opt_class()];

  [v23 _establishReferencedCodableDescriptionsUsingTypes:v15];
  [v23 setClassName:v18];

  return v23;
}

- (id)_typesWithDictionary:(id)a3 filename:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  id v46 = a5;
  id v9 = [NSString stringWithFormat:@"INType%@", @"s"];
  id v10 = [v8 objectForKeyedSubscript:v9];

  uint64_t v42 = v8;
  id v50 = [v8 objectForKeyedSubscript:@"INIntentDefinitionNamespace"];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v17 = [(INSchema *)self _codableDescriptionWithDictionary:v16 intentDefinitionNamespace:v50 filename:v47 bundleIdentifier:v46 codableDescriptionClass:objc_opt_class()];
        id v18 = [(INSchema *)self _mainBundleIdentifier];
        [v17 setMainBundleIdentifier:v18];

        id v19 = [NSString stringWithFormat:@"INType%@", @"SemanticRoot"];
        id v20 = [v16 objectForKeyedSubscript:v19];

        if (v20) {
          [v17 setSemanticRoot:v20];
        }
        v21 = [v17 typeName];
        char v22 = INIntentDefinitionNamespacedName((uint64_t)v50, v21);
        [v11 setObject:v17 forKeyedSubscript:v22];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v13);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v43 = [v11 allValues];
  uint64_t v48 = [v43 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v48)
  {
    uint64_t v45 = *(void *)v56;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v56 != v45) {
          objc_enumerationMutation(v43);
        }
        uint64_t v49 = v23;
        id v24 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v25 = [v24 attributes];
        unint64_t v26 = [v25 allValues];

        uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v52 != v29) {
                objc_enumerationMutation(v26);
              }
              id v31 = *(id *)(*((void *)&v51 + 1) + 8 * j);
              if (v31)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  uint64_t v32 = v31;
                }
                else {
                  uint64_t v32 = 0;
                }
              }
              else
              {
                uint64_t v32 = 0;
              }
              v33 = v32;

              uint64_t v34 = [v33 objectTypeNamespace];
              v35 = [v33 objectTypeName];
              v36 = INIntentDefinitionNamespacedName((uint64_t)v34, v35);
              id v37 = [v11 objectForKeyedSubscript:v36];

              if (v33)
              {
                id WeakRetained = objc_loadWeakRetained(v33 + 21);
                if (!WeakRetained
                  || (uint64_t v39 = WeakRetained,
                      id v40 = objc_loadWeakRetained(v33 + 21),
                      v40,
                      v39,
                      v40 != v37))
                {
                  [v33 setCodableDescription:v37];
                }
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
          }
          while (v28);
        }

        uint64_t v23 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [v43 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v48);
  }

  return v11;
}

- (id)_codableDescriptionWithDictionary:(id)a3 intentDefinitionNamespace:(id)a4 filename:(id)a5 bundleIdentifier:(id)a6 codableDescriptionClass:(Class)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(a7);
  [v16 setSchema:self];
  [v16 updateWithDictionary:v15];

  [v16 setIntentDefinitionNamespace:v14];
  id v17 = [INCodableLocalizationTable alloc];
  id v18 = [v13 stringByDeletingPathExtension];

  id v19 = [(INCodableLocalizationTable *)v17 initWithBundleIdentifier:v12 tableName:v18];
  [v16 _setLocalizationTable:v19];

  return v16;
}

- (NSString)_mainBundleIdentifier
{
  return self->_mainBundleIdentifier;
}

void __37__INSchema__supportedTypesDictionary__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v1 = &unk_1EDBAC6C0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [&unk_1EDBAC6C0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(&unk_1EDBAC6C0);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 objectForKeyedSubscript:@"Name"];
        if (v7) {
          objc_msgSend(v0, "if_setObjectIfNonNil:forKey:", v6, v7);
        }
      }
      uint64_t v3 = [&unk_1EDBAC6C0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  uint64_t v8 = [v0 copy];
  id v9 = (void *)_supportedTypesDictionary_supportedTypesDictionary;
  _supportedTypesDictionary_supportedTypesDictionary = v8;
}

void __25__INSchema_defaultSchema__block_invoke(void *a1)
{
  uint64_t v3 = INContainingBundleURLForCurrentProcess();
  uint64_t v4 = (void *)a1[4];
  id v11 = (id)v3;
  if (v3
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        a1 = objc_claimAutoreleasedReturnValue(),
        [v11 path],
        id v1 = objc_claimAutoreleasedReturnValue(),
        [a1 isReadableFileAtPath:v1]))
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    int v6 = 0;
    int v7 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
    int v7 = 0;
    int v6 = 1;
  }
  uint64_t v8 = [v4 _defaultSchemaForBundle:v5];
  id v9 = (void *)defaultSchema_schema;
  defaultSchema_schema = v8;

  if (v6) {
  if (v7)
  }

  long long v10 = v11;
  if (v11)
  {

    long long v10 = v11;
  }
}

+ (id)_defaultSchemaForBundle:(id)a3 contentOptions:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [v6 bundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.Intents"];

  if (v8)
  {
    id v9 = [a1 systemSchema];
  }
  else
  {
    long long v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 bundleIdentifier];
    long long v12 = +[INSchema _applicationBundleIdentifierFromBundleIdentifier:v11];

    long long v13 = INSchemaURLsWithBundle(v6);
    id v14 = [v6 bundleIdentifier];
    id v9 = [a1 _schemaWithIntentDefinitionURLs:v13 bundleIdentifier:v14 mainBundleIdentifier:v12 contentOptions:a4];
  }

  return v9;
}

+ (id)_schemaWithIntentDefinitionURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5 contentOptions:(unint64_t)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v48 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() _cache];
  long long v12 = [v9 valueForKeyPath:@"path"];
  long long v13 = [v12 sortedArrayUsingSelector:sel_compare_];
  id v14 = [v13 componentsJoinedByString:@"-"];

  uint64_t v15 = NSString;
  id v16 = [NSNumber numberWithUnsignedInteger:a6];
  id v17 = [v15 stringWithFormat:@"%@-%@", v14, v16];

  id v18 = [NSString stringWithFormat:@"%@-%@", v14, &unk_1EDBA7468];
  uint64_t v19 = [v9 count];
  id v20 = 0;
  if (v17 && v19)
  {
    id v46 = v11;
    id v47 = v18;
    unint64_t v42 = a6;
    id v43 = v14;
    id v44 = v10;
    uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v19];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v45 = v9;
    id v21 = v9;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          unint64_t v26 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v28 = [v26 path];
          id v50 = 0;
          uint64_t v29 = [v27 attributesOfItemAtPath:v28 error:&v50];
          id v30 = v50;

          if (v29) {
            BOOL v31 = v30 == 0;
          }
          else {
            BOOL v31 = 0;
          }
          if (v31)
          {
            v35 = [v29 fileModificationDate];
            if (v35) {
              [v49 addObject:v35];
            }
          }
          else
          {
            uint64_t v32 = (void *)INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              v33 = v32;
              uint64_t v34 = [v26 path];
              *(_DWORD *)buf = 136315650;
              long long v58 = "+[INSchema _schemaWithIntentDefinitionURLs:bundleIdentifier:mainBundleIdentifier:contentOptions:]";
              __int16 v59 = 2112;
              long long v60 = v34;
              __int16 v61 = 2114;
              id v62 = v30;
              _os_log_error_impl(&dword_18CB2F000, v33, OS_LOG_TYPE_ERROR, "%s Error reading file (%@) attributes: %{public}@", buf, 0x20u);
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v23);
    }

    id v11 = v46;
    v36 = [v46 objectForKey:v47];
    if (([v47 isEqualToString:v17] & 1) == 0)
    {
      if (v36)
      {
        [v46 removeObjectForKey:v17];
      }
      else
      {
        v36 = [v46 objectForKey:v17];
      }
    }
    id v10 = v44;
    id v20 = [v36 objectForKeyedSubscript:@"schema"];
    if (v20
      && ([v36 objectForKeyedSubscript:@"schemaModificationsDates"],
          id v37 = objc_claimAutoreleasedReturnValue(),
          char v38 = [v37 isEqualToSet:v49],
          v37,
          (v38 & 1) != 0))
    {
      id v9 = v45;
      id v14 = v43;
    }
    else
    {
      id v39 = [[INSchema alloc] _initWithContentsOfURLs:v21 bundleIdentifier:v48 mainBundleIdentifier:v44 contentOptions:v42];

      if (v39)
      {
        v55[0] = @"schemaModificationsDates";
        v55[1] = @"schema";
        v56[0] = v49;
        v56[1] = v39;
        id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
        [v46 setObject:v40 forKey:v17];

        id v20 = v39;
      }
      else
      {
        id v20 = 0;
      }
      id v9 = v45;
      id v14 = v43;
    }

    id v18 = v47;
  }

  return v20;
}

+ (id)_defaultSchemaForBundle:(id)a3
{
  return (id)[a1 _defaultSchemaForBundle:a3 contentOptions:31];
}

+ (id)_cache
{
  if (_cache_onceToken != -1) {
    dispatch_once(&_cache_onceToken, &__block_literal_global_82);
  }
  uint64_t v2 = (void *)_cache_schemaCache;

  return v2;
}

+ (id)_applicationBundleIdentifierFromBundleIdentifier:(id)a3
{
  return INApplicationBundleIdentifierFromBundleIdentifier(a3);
}

uint64_t __18__INSchema__cache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  id v1 = (void *)_cache_schemaCache;
  _cache_schemaCache = (uint64_t)v0;

  uint64_t v2 = (void *)_cache_schemaCache;

  return [v2 setEvictsObjectsWhenApplicationEntersBackground:0];
}

+ (BOOL)_defaultSchemaCanSupportIntent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = INContainingAppProxyForCurrentProcess();
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 siriActionDefinitionURLs];
    int v7 = [v6 objectForKey:v3];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (id)systemSchema
{
  if (systemSchema_isImmortal) {
    goto LABEL_5;
  }
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  if ([v3 isMainThread])
  {

LABEL_5:
    os_unfair_lock_lock(&systemSchemaAccessorLock);
    systemSchema_isImmortal = 1;
    if (!systemSchema)
    {
      uint64_t v6 = [a1 _loadSystemSchema];
      int v7 = (void *)systemSchema;
      systemSchema = v6;
    }
    os_unfair_lock_unlock(&systemSchemaAccessorLock);
    id v8 = (id)systemSchema;
    goto LABEL_8;
  }
  uint64_t v4 = [MEMORY[0x1E4F963E8] currentProcess];
  int v5 = [v4 isApplication];

  if (v5) {
    goto LABEL_5;
  }
  os_unfair_lock_lock(&systemSchemaAccessorLock);
  id v10 = (void *)systemSchema;
  if (!systemSchema)
  {
    uint64_t v11 = [a1 _loadSystemSchema];
    long long v12 = (void *)systemSchema;
    systemSchema = v11;

    id v10 = (void *)systemSchema;
  }
  id v8 = v10;
  if (systemSchema_timerSource) {
    dispatch_source_cancel((dispatch_source_t)systemSchema_timerSource);
  }
  long long v13 = dispatch_get_global_queue(-2, 0);
  dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v13);
  uint64_t v15 = (void *)systemSchema_timerSource;
  systemSchema_timerSource = (uint64_t)v14;

  dispatch_source_set_event_handler((dispatch_source_t)systemSchema_timerSource, &__block_literal_global_38);
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)systemSchema_timerSource, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)systemSchema_timerSource);
  os_unfair_lock_unlock(&systemSchemaAccessorLock);
LABEL_8:

  return v8;
}

+ (id)_loadSystemSchema
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [INSchema alloc];
  uint64_t v4 = INSchemaURLsWithBundle(v2);
  int v5 = [v2 bundleIdentifier];
  id v6 = [(INSchema *)v3 _initWithContentsOfURLs:v4 bundleIdentifier:v5 mainBundleIdentifier:0 contentOptions:31];

  return v6;
}

- (id)intentWithName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  id v5 = objc_alloc(NSClassFromString(v4));
  id v6 = [MEMORY[0x1E4F29128] UUID];
  int v7 = [v6 UUIDString];
  id v8 = (void *)[v5 _initWithIdentifier:v7 schema:self name:v4 data:0];

  return v8;
}

- (id)intentCodableDescriptionWithIntentClassName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  id v5 = [(INSchema *)self _objectDescriptionForClass:objc_opt_class() identifier:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if ([(INSchema *)self isSystem]
    || (id v8 = NSClassFromString(v4),
        INIntentSchemaGetIntentDescriptionWithFacadeClass(v8),
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v13 = v7;
  }
  else
  {
    id v10 = +[INSchema systemSchema];
    uint64_t v11 = [v10 _objectDescriptionForClass:objc_opt_class() identifier:v4];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v12 = v11;
      }
      else {
        long long v12 = 0;
      }
    }
    else
    {
      long long v12 = 0;
    }
    id v14 = v12;

    id v13 = (id)[v14 copy];
    [v13 _updateWithIntentCodableDescription:v7];
  }

  return v13;
}

- (id)_objectDescriptionForClass:(Class)a3 identifier:(id)a4
{
  id v6 = [a4 componentsSeparatedByString:@"."];
  id v7 = [v6 lastObject];

  if (v7)
  {
    schemaDictionary = self->_schemaDictionary;
    id v9 = NSStringFromClass(a3);
    id v10 = [(NSMutableDictionary *)schemaDictionary objectForKeyedSubscript:v9];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionFileURLs, 0);
  objc_storeStrong((id *)&self->_mainBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_enums, 0);
  objc_storeStrong((id *)&self->_typeForSemanticKeypathDictionary, 0);
  objc_storeStrong((id *)&self->_typeForClassDictionary, 0);
  objc_storeStrong((id *)&self->_configurableParameterCombinationDictionary, 0);
  objc_storeStrong((id *)&self->_parameterCombinationDictionary, 0);

  objc_storeStrong((id *)&self->_schemaDictionary, 0);
}

- (NSArray)_definitionFileURLs
{
  return self->_definitionFileURLs;
}

- (NSDictionary)_typeForSemanticKeypathDictionary
{
  return self->_typeForSemanticKeypathDictionary;
}

- (NSDictionary)_typeForClassDictionary
{
  return self->_typeForClassDictionary;
}

- (NSMutableDictionary)_configurableParameterCombinationDictionary
{
  return self->_configurableParameterCombinationDictionary;
}

- (NSMutableDictionary)_parameterCombinationDictionary
{
  return self->_parameterCombinationDictionary;
}

- (NSMutableDictionary)_schemaDictionary
{
  return self->_schemaDictionary;
}

- (id)_dictionaryRepresentation
{
  return self->_schemaDictionary;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSchema;
  id v6 = [(INSchema *)&v11 description];
  id v7 = [(INSchema *)self _dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INSchema *)self descriptionAtIndent:0];
}

- (INSchema)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)INSchema;
  id v5 = [(INSchema *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"schemaDictionary"];
    schemaDictionary = v5->_schemaDictionary;
    v5->_schemaDictionary = (NSMutableDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mainBundleIdentifier"];
    mainBundleIdentifier = v5->_mainBundleIdentifier;
    v5->_mainBundleIdentifier = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  schemaDictionary = self->_schemaDictionary;
  id v5 = a3;
  [v5 encodeObject:schemaDictionary forKey:@"schemaDictionary"];
  [v5 encodeObject:self->_mainBundleIdentifier forKey:@"_mainBundleIdentifier"];
}

- (id)_objectDescriptionWithSemanticKeypath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (!self->_typeForSemanticKeypathDictionary)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA60];
      id v6 = [(INSchema *)self _types];
      objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      uint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = [(INSchema *)self _types];
      uint64_t v9 = [v8 allValues];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v15 = [v14 semanticRoot];
            if (v15) {
              [(NSDictionary *)v7 setObject:v14 forKey:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }

      typeForSemanticKeypathDictionary = self->_typeForSemanticKeypathDictionary;
      self->_typeForSemanticKeypathDictionary = v7;
    }
    uint64_t v17 = [(INSchema *)self _typeForSemanticKeypathDictionary];
    id v18 = [v17 objectForKeyedSubscript:v4];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (id)_dictionaryRepresentationForIntentCodableDescription:(id)a3 intentResponseCodableDescription:(id)a4 appInfo:(id)a5 localizer:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v77 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 className];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v15 = (void *)v13;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v75 = v10;
  uint64_t v17 = [v10 dictionaryRepresentationWithLocalizer:v12];
  id v18 = (void *)[v17 mutableCopy];

  if (v11)
  {
    uint64_t v19 = [v11 actionsRestrictedWhileProtectedDataUnavailable];
    char v20 = [v19 containsObject:v15];

    if (v20)
    {
      uint64_t v21 = 2;
    }
    else
    {
      long long v22 = [v11 actionsRestrictedWhileLocked];
      unsigned int v23 = [v22 containsObject:v15];

      uint64_t v21 = v23;
    }
    uint64_t v24 = [NSNumber numberWithInteger:v21];
    uint64_t v25 = [NSString stringWithFormat:@"INIntent%@", @"Restrictions"];
    objc_msgSend(v18, "if_setObjectIfNonNil:forKey:", v24, v25);
  }
  v76 = v11;
  uint64_t v26 = [v77 dictionaryRepresentationWithLocalizer:v12];
  uint64_t v27 = [NSString stringWithFormat:@"INIntent%@", @"Response"];
  uint64_t v74 = (void *)v26;
  [v18 setObject:v26 forKey:v27];

  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __116__INSchema__dictionaryRepresentationForIntentCodableDescription_intentResponseCodableDescription_appInfo_localizer___block_invoke;
  v94[3] = &unk_1E5517090;
  id v28 = v12;
  id v95 = v28;
  uint64_t v29 = MEMORY[0x192F984C0](v94);
  v72 = [(INSchema *)self _parameterCombinationsForClassName:v15];
  (*(void (**)(uint64_t))(v29 + 16))(v29);
  v31 = id v30 = v15;
  uint64_t v32 = [NSString stringWithFormat:@"INIntent%@", @"ParameterCombinations"];
  [v18 setObject:v31 forKey:v32];

  [(INSchema *)self _configurableParameterCombinationsForClassName:v30];
  v71 = uint64_t v73 = (void *)v29;
  v33 = (*(void (**)(uint64_t))(v29 + 16))(v29);
  uint64_t v34 = [NSString stringWithFormat:@"INIntent%@", @"ManagedParameterCombinations"];
  [v18 setObject:v33 forKey:v34];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v35 = [v75 referencedCodableDescriptions];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v90 objects:v100 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v91 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = [*(id *)(*((void *)&v90 + 1) + 8 * i) dictionaryRepresentationWithLocalizer:v28];
        [v16 addObject:v40];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v90 objects:v100 count:16];
    }
    while (v37);
  }

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v41 = [v75 referencedCodableEnums];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v87 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = [*(id *)(*((void *)&v86 + 1) + 8 * j) dictionaryRepresentationWithLocalizer:v28];
        [v14 addObject:v46];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v43);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v47 = [v77 referencedCodableDescriptions];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v83;
    do
    {
      for (uint64_t k = 0; k != v49; ++k)
      {
        if (*(void *)v83 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = [*(id *)(*((void *)&v82 + 1) + 8 * k) dictionaryRepresentationWithLocalizer:v28];
        [v16 addObject:v52];
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v82 objects:v98 count:16];
    }
    while (v49);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v53 = [v77 referencedCodableEnums];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v78 objects:v97 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v79;
    do
    {
      for (uint64_t m = 0; m != v55; ++m)
      {
        if (*(void *)v79 != v56) {
          objc_enumerationMutation(v53);
        }
        long long v58 = [*(id *)(*((void *)&v78 + 1) + 8 * m) dictionaryRepresentationWithLocalizer:v28];
        [v14 addObject:v58];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v78 objects:v97 count:16];
    }
    while (v55);
  }

  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v60 = [v75 intentDefinitionNamespace];
  __int16 v61 = (void *)v60;
  if (v60) {
    id v62 = (__CFString *)v60;
  }
  else {
    id v62 = &stru_1EDA6DB28;
  }
  [v59 setObject:v62 forKeyedSubscript:@"INIntentDefinitionNamespace"];

  id v63 = [v14 allObjects];
  uint64_t v64 = [NSString stringWithFormat:@"INEnum%@", @"s"];
  [v59 setObject:v63 forKeyedSubscript:v64];

  uint64_t v65 = [v16 allObjects];
  uint64_t v66 = [NSString stringWithFormat:@"INType%@", @"s"];
  [v59 setObject:v65 forKeyedSubscript:v66];

  v96 = v18;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v68 = [NSString stringWithFormat:@"INIntent%@", @"s"];
  [v59 setObject:v67 forKeyedSubscript:v68];

  v69 = [v76 developmentRegion];
  [v59 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F1CFE8]];

  return v59;
}

id __116__INSchema__dictionaryRepresentationForIntentCodableDescription_intentResponseCodableDescription_appInfo_localizer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "allObjects", (void)v16);
        id v12 = [v11 componentsJoinedByString:@","];

        uint64_t v13 = [v5 objectForKeyedSubscript:v10];
        id v14 = [v13 dictionaryRepresentationWithLocalizer:*(void *)(a1 + 32)];
        [v4 setObject:v14 forKey:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)dictionaryRepresentationForIntent:(id)a3 localizer:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 _className];
  uint64_t v9 = [(INSchema *)self intentCodableDescriptionWithIntentClassName:v8];
  uint64_t v10 = [(INSchema *)self intentResponseCodableDescriptionWithIntentClassName:v8];
  id v11 = (void *)v10;
  id v12 = 0;
  if (v9 && v10)
  {
    uint64_t v13 = +[INAppInfo appInfoWithIntent:v6];
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__11882;
    v35 = __Block_byref_object_dispose__11883;
    id v36 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__INSchema_dictionaryRepresentationForIntent_localizer___block_invoke;
    v25[3] = &unk_1E5517068;
    id v30 = &v31;
    v25[4] = self;
    id v14 = v9;
    id v26 = v14;
    id v27 = v11;
    id v23 = v13;
    id v28 = v23;
    id v29 = v7;
    uint64_t v15 = (void (**)(void))MEMORY[0x192F984C0](v25);
    long long v16 = [v14 _localizationTable];
    long long v17 = [v16 bundleIdentifier];

    if (v17)
    {
      long long v18 = +[INImageServiceConnection sharedConnection];
      long long v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v17];
      id v24 = 0;
      [v18 accessBundleContentForBundleIdentifiers:v19 withBlock:v15 error:&v24];
      id v20 = v24;

      if (!v20)
      {
LABEL_10:
        id v12 = (id)v32[5];

        _Block_object_dispose(&v31, 8);
        goto LABEL_11;
      }
    }
    else
    {
      id v20 = 0;
    }
    uint64_t v21 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v38 = "-[INSchema dictionaryRepresentationForIntent:localizer:]";
      __int16 v39 = 2112;
      id v40 = v17;
      __int16 v41 = 2112;
      id v42 = v20;
      _os_log_error_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_ERROR, "%s Error accessing bundle (%@) content: %@", buf, 0x20u);
    }
    v15[2](v15);
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

uint64_t __56__INSchema_dictionaryRepresentationForIntent_localizer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(a1 + 32) _dictionaryRepresentationForIntentCodableDescription:*(void *)(a1 + 40) intentResponseCodableDescription:*(void *)(a1 + 48) appInfo:*(void *)(a1 + 56) localizer:*(void *)(a1 + 64)];

  return MEMORY[0x1F41817F8]();
}

- (id)dictionaryRepresentationForIntent:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(INSchema *)self dictionaryRepresentationForIntent:v4 localizer:v5];

  return v6;
}

- (id)_objectDescriptionForTypeOfClass:(Class)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [(INSchema *)self _typeForClassDictionary];
    id v5 = NSStringFromClass(v3);
    id v3 = [v4 objectForKeyedSubscript:v5];
  }

  return v3;
}

- (id)_codableDescriptionsForClass:(Class)a3
{
  schemaDictionary = self->_schemaDictionary;
  id v4 = NSStringFromClass(a3);
  id v5 = [(NSMutableDictionary *)schemaDictionary objectForKeyedSubscript:v4];
  id v6 = [v5 allValues];

  return v6;
}

- (id)_classNamesForClass:(Class)a3
{
  schemaDictionary = self->_schemaDictionary;
  id v4 = NSStringFromClass(a3);
  id v5 = [(NSMutableDictionary *)schemaDictionary objectForKeyedSubscript:v4];
  id v6 = [v5 allKeys];

  return v6;
}

- (id)_parameterCombinationsForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [(INSchema *)self _parameterCombinationsForClassName:v4];

  return v5;
}

- (id)_initWithContentsOfURLs:(id)a3
{
  return [(INSchema *)self _initWithContentsOfURLs:a3 bundleIdentifier:0];
}

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4 mainBundleIdentifier:(id)a5
{
  return [(INSchema *)self _initWithContentsOfURLs:a3 bundleIdentifier:a4 mainBundleIdentifier:a5 contentOptions:31];
}

- (id)_initWithContentsOfURLs:(id)a3 bundleIdentifier:(id)a4
{
  return [(INSchema *)self _initWithContentsOfURLs:a3 bundleIdentifier:a4 mainBundleIdentifier:0 contentOptions:31];
}

- (id)intentResponseCodableDescriptionWithIntentResponseClassName:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(INSchema *)self _objectDescriptionForClass:objc_opt_class() identifier:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if ([(INSchema *)self isSystem]
    || (uint64_t v8 = NSClassFromString(v4),
        INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v13 = v7;
  }
  else
  {
    uint64_t v10 = +[INSchema systemSchema];
    id v11 = [v10 _objectDescriptionForClass:objc_opt_class() identifier:v4];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;
  }

  return v13;
}

- (id)intentResponseCodableDescriptionWithIntentClassName:(id)a3
{
  id v4 = [a3 stringByAppendingString:@"Response"];
  id v5 = [(INSchema *)self intentResponseCodableDescriptionWithIntentResponseClassName:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_supportedClasses
{
  if (_supportedClasses_onceToken != -1) {
    dispatch_once(&_supportedClasses_onceToken, &__block_literal_global_117);
  }
  uint64_t v2 = (void *)_supportedClasses_supportedClasses;

  return v2;
}

void __29__INSchema__supportedClasses__block_invoke()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  +[INSchema _supportedTypesDictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v13 = v18 = 0u;
  obuint64_t j = [v13 allValues];
  uint64_t v1 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v16 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:@"ObjCType"];
        if (v5)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v6 = v5;
          }
          else {
            id v6 = 0;
          }
        }
        else
        {
          id v6 = 0;
        }
        id v7 = v6;

        uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" <"];
        uint64_t v9 = [v7 componentsSeparatedByCharactersInSet:v8];

        uint64_t v10 = [v9 firstObject];

        objc_msgSend(v0, "if_addObjectIfNonNil:", NSClassFromString(v10));
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v2);
  }

  uint64_t v11 = [v0 copy];
  id v12 = (void *)_supportedClasses_supportedClasses;
  _supportedClasses_supportedClasses = v11;
}

+ (void)_resetCache
{
  uint64_t v2 = [a1 _cache];
  [v2 removeAllObjects];

  os_unfair_lock_lock(&systemSchemaAccessorLock);
  uint64_t v3 = (void *)systemSchema;
  systemSchema = 0;

  os_unfair_lock_unlock(&systemSchemaAccessorLock);
}

+ (id)schemaWithBundleRecord:(id)a3 fallbackToSystemSchema:(BOOL)a4
{
  BOOL v4 = a4;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v8 = [v6 intentDefinitionURLs];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = [v7 orderedSetWithArray:v9];

  uint64_t v11 = [v10 array];
  id v12 = objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_41);

  if ([v12 count])
  {
    id v13 = [INSchema alloc];
    id v14 = [v6 bundleIdentifier];
    long long v15 = [v6 bundleIdentifier];
    id v16 = [(INSchema *)v13 _initWithContentsOfURLs:v12 bundleIdentifier:v14 mainBundleIdentifier:v15];

    if (v16) {
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && INThisProcessCanMapLSDatabase(0))
    {
      long long v17 = objc_opt_new();
      long long v18 = [v6 bundleIdentifier];
      long long v19 = [v17 extensionBundleIdentifiersForSystemAppIdentifier:v18];

      if ([v19 count])
      {
        id v27 = v17;
        uint64_t v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1 selector:sel_compare_];
        v28[0] = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        long long v22 = [v19 sortedArrayUsingDescriptors:v21];

        id v23 = [v22 firstObject];
        uint64_t v24 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v23 allowPlaceholder:0 error:0];
        if (v24)
        {
          uint64_t v25 = (void *)v24;
          id v16 = [a1 schemaWithBundleRecord:v24 fallbackToSystemSchema:v4];

          goto LABEL_14;
        }

        long long v17 = v27;
      }
    }
    id v16 = 0;
  }
  if (v4)
  {
    id v16 = +[INSchema systemSchema];
  }
LABEL_14:

  return v16;
}

uint64_t __58__INSchema_schemaWithBundleRecord_fallbackToSystemSchema___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = INSchemaFileExtensions();
  BOOL v4 = [v2 pathExtension];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

void __24__INSchema_systemSchema__block_invoke()
{
  os_unfair_lock_lock(&systemSchemaAccessorLock);
  if ((systemSchema_isImmortal & 1) == 0)
  {
    id v0 = (void *)systemSchema;
    systemSchema = 0;
  }

  os_unfair_lock_unlock(&systemSchemaAccessorLock);
}

@end