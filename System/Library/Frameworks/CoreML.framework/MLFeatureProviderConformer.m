@interface MLFeatureProviderConformer
- (BOOL)_sequenceConcatConsumesOptionalInputNamed:(id)a3;
- (BOOL)passthroughStateFeatures;
- (BOOL)usingRank5Mapping;
- (MLFeatureProviderConformer)initWithFeatureDescriptions:(id)a3 defaultValues:(id)a4 usingRank5Mapping:(BOOL)a5 optionalInputTypes:(id)a6 passthroughStateFeatures:(BOOL)a7;
- (NSArray)featureDescriptions;
- (NSDictionary)defaultValues;
- (NSDictionary)optionalInputTypes;
- (id)_fabricateFeatureForDescription:(id)a3 error:(id *)a4;
- (id)conformFeatures:(id)a3 error:(id *)a4;
@end

@implementation MLFeatureProviderConformer

- (MLFeatureProviderConformer)initWithFeatureDescriptions:(id)a3 defaultValues:(id)a4 usingRank5Mapping:(BOOL)a5 optionalInputTypes:(id)a6 passthroughStateFeatures:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MLFeatureProviderConformer;
  v15 = [(MLFeatureProviderConformer *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    featureDescriptions = v15->_featureDescriptions;
    v15->_featureDescriptions = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    defaultValues = v15->_defaultValues;
    v15->_defaultValues = (NSDictionary *)v18;

    v15->_usingRank5Mapping = a5;
    uint64_t v20 = [v14 copy];
    optionalInputTypes = v15->_optionalInputTypes;
    v15->_optionalInputTypes = (NSDictionary *)v20;

    v15->_passthroughStateFeatures = a7;
  }

  return v15;
}

- (id)conformFeatures:(id)a3 error:(id *)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  BOOL v64 = [(MLFeatureProviderConformer *)self usingRank5Mapping];
  v5 = [(MLFeatureProviderConformer *)self featureDescriptions];
  uint64_t v63 = [v5 count];

  v71 = [v72 featureNames];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = [(MLFeatureProviderConformer *)self featureDescriptions];
  uint64_t v6 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  v66 = self;
  if (!v6)
  {
    uint64_t v70 = 0;
    v7 = 0;
    goto LABEL_36;
  }
  uint64_t v70 = 0;
  v7 = 0;
  uint64_t v68 = v6;
  uint64_t v69 = *(void *)v82;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v82 != v69) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v81 + 1) + 8 * v8);
      v10 = [v9 name];
      if ([v71 containsObject:v10])
      {
        v11 = [v72 featureValueForName:v10];
      }
      else
      {
        v11 = 0;
      }
      id v12 = v9;
      id v13 = v11;
      if (![v13 type])
      {

        goto LABEL_14;
      }
      if ([v12 type] != 5)
      {

LABEL_19:
        id v18 = v12;
        id v19 = v13;
        uint64_t v20 = [v18 name];
        if ([v18 type] == 5)
        {
          v21 = [v18 multiArrayConstraint];
          id v87 = 0;
          char v22 = [v21 isAllowedValue:v19 isNeuralNetworkInputOrOutput:1 usingRank5Mapping:v64 featureName:v20 error:&v87];
          id v23 = v87;

          if ((v22 & 1) == 0)
          {
            v48 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              v59 = [v23 localizedDescription];
              *(_DWORD *)buf = 138412802;
              v94 = v20;
              __int16 v95 = 2112;
              id v96 = v19;
              __int16 v97 = 2112;
              v98 = v59;
              _os_log_error_impl(&dword_19E58B000, v48, OS_LOG_TYPE_ERROR, "multiArrayConstraint isAllowedValue: fails for MLFeatureTypeMultiArray feature %@ with featureValue %@. Error description: %@", buf, 0x20u);
            }
            if (a4) {
              goto LABEL_80;
            }
LABEL_81:

            goto LABEL_82;
          }
LABEL_28:

LABEL_29:
          ++v70;
          goto LABEL_30;
        }
        if ([v18 type] == 8)
        {
          v24 = [v18 stateConstraint];
          id v86 = 0;
          char v25 = [v24 isAllowedValue:v19 error:&v86];
          id v23 = v86;

          if (v25) {
            goto LABEL_28;
          }
          v50 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v60 = [v23 localizedDescription];
            *(_DWORD *)buf = 138412802;
            v94 = v20;
            __int16 v95 = 2112;
            id v96 = v19;
            __int16 v97 = 2112;
            v98 = v60;
            _os_log_error_impl(&dword_19E58B000, v50, OS_LOG_TYPE_ERROR, "stateConstraint 'isAllowedValue:' fails for MLFeatureTypeState feature '%@' with featureValue %@. Error description: %@", buf, 0x20u);
          }
          if (!a4) {
            goto LABEL_81;
          }
        }
        else
        {
          if ([v18 type] != 4)
          {

            goto LABEL_29;
          }
          if ([v19 type] != 4)
          {
            v52 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v61 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v18 type]);
              *(_DWORD *)buf = 138412802;
              v94 = v20;
              __int16 v95 = 2112;
              id v96 = v19;
              __int16 v97 = 2112;
              v98 = v61;
              _os_log_error_impl(&dword_19E58B000, v52, OS_LOG_TYPE_ERROR, "The model expects input feature %@ to be an image, but the input (%@) is of type %@.", buf, 0x20u);
            }
            if (!a4)
            {

              goto LABEL_82;
            }
            v53 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v91 = *MEMORY[0x1E4F28568];
            v54 = NSString;
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v18 type]);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            v55 = [v54 stringWithFormat:@"The model expects input feature %@ to be an image, but the input (%@) is of type %@.", v20, v19, v23];
            v92 = v55;
            v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            *a4 = [v53 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v56];

            goto LABEL_81;
          }
          v26 = [v18 imageConstraint];
          id v85 = 0;
          char v27 = [v26 isAllowedValue:v19 error:&v85];
          id v23 = v85;

          if (v27) {
            goto LABEL_28;
          }
          v57 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v62 = [v23 localizedDescription];
            *(_DWORD *)buf = 138412802;
            v94 = v20;
            __int16 v95 = 2112;
            id v96 = v19;
            __int16 v97 = 2112;
            v98 = v62;
            _os_log_error_impl(&dword_19E58B000, v57, OS_LOG_TYPE_ERROR, "multiArrayConstraint isAllowedValue: fails for MLFeatureTypeImage feature %@ with featureValue %@. Error description: %@", buf, 0x20u);
          }
          if (!a4) {
            goto LABEL_81;
          }
        }
LABEL_80:
        id v23 = v23;
        *a4 = v23;
        goto LABEL_81;
      }
      id v14 = [v13 multiArrayValue];
      v15 = [v14 shape];
      BOOL v16 = [v15 count] == 0;

      if (!v16) {
        goto LABEL_19;
      }
LABEL_14:
      if (!v7)
      {
        v7 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      v17 = [(MLFeatureProviderConformer *)v66 _fabricateFeatureForDescription:v12 error:a4];
      if (!v17)
      {
        id v19 = v13;
LABEL_82:

        v29 = 0;
        goto LABEL_83;
      }
      [v7 setObject:v17 forKeyedSubscript:v10];

LABEL_30:
      ++v8;
    }
    while (v68 != v8);
    uint64_t v28 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    uint64_t v68 = v28;
  }
  while (v28);
LABEL_36:

  if (v70 == v63 && v63 == [v71 count])
  {
    v29 = (MLDictionaryFeatureProvider *)v72;
    goto LABEL_83;
  }
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v70];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v31 = [(MLFeatureProviderConformer *)v66 featureDescriptions];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v78 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v36 = [v35 name];
        v37 = [v7 objectForKeyedSubscript:v36];
        BOOL v38 = v37 == 0;

        if (v38)
        {
          v39 = [v35 name];
          [v30 addObject:v39];
        }
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v32);
  }

  if ([(MLFeatureProviderConformer *)v66 passthroughStateFeatures])
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v40 = [v72 featureNames];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v88 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v74 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v73 + 1) + 8 * j);
          v45 = [v72 featureValueForName:v44];
          if ([v45 type] == 8) {
            [v30 addObject:v44];
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v88 count:16];
      }
      while (v41);
    }
  }
  v46 = +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:v30 providedBy:v72];
  if (v7)
  {
    v29 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v7];
    if (v29)
    {
      uint64_t v47 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v29 addedToFeaturesProvidedBy:v46];

      v46 = (MLDictionaryFeatureProvider *)v47;
      goto LABEL_63;
    }
  }
  else
  {
LABEL_63:
    v46 = v46;
    v29 = v46;
  }

LABEL_83:

  return v29;
}

- (NSArray)featureDescriptions
{
  return self->_featureDescriptions;
}

- (BOOL)usingRank5Mapping
{
  return self->_usingRank5Mapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);

  objc_storeStrong((id *)&self->_featureDescriptions, 0);
}

- (BOOL)passthroughStateFeatures
{
  return self->_passthroughStateFeatures;
}

- (NSDictionary)optionalInputTypes
{
  return self->_optionalInputTypes;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (BOOL)_sequenceConcatConsumesOptionalInputNamed:(id)a3
{
  id v4 = a3;
  v5 = [(MLFeatureProviderConformer *)self optionalInputTypes];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  char v7 = [v6 isEqual:&unk_1EF11A010];

  return v7;
}

- (id)_fabricateFeatureForDescription:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 name];
  if ([v6 isOptional])
  {
    if ([v6 type] == 5)
    {
      BOOL v8 = [(MLFeatureProviderConformer *)self _sequenceConcatConsumesOptionalInputNamed:v7];
      v9 = [(MLFeatureProviderConformer *)self defaultValues];
      v10 = [v9 objectForKeyedSubscript:v7];

      v11 = [v6 multiArrayConstraint];
      id v12 = [v11 shape];

      if (v8)
      {
        if ([v12 count] == 1)
        {
          if ([(MLFeatureProviderConformer *)self usingRank5Mapping])
          {
            v42[0] = &unk_1EF119FF8;
            v42[1] = &unk_1EF11A010;
            id v13 = [v12 objectAtIndexedSubscript:0];
            v42[2] = v13;
            v42[3] = &unk_1EF11A010;
            v42[4] = &unk_1EF11A010;
            id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];
          }
          else
          {
            v41[0] = &unk_1EF119FF8;
            v41[1] = &unk_1EF11A010;
            v41[2] = &unk_1EF11A010;
            v41[3] = &unk_1EF11A010;
            v29 = [v12 objectAtIndexedSubscript:0];
            v41[4] = v29;
            id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
          }
        }
        else if ([v12 count] == 2)
        {
          v40[0] = &unk_1EF119FF8;
          v40[1] = &unk_1EF11A010;
          v40[2] = &unk_1EF11A010;
          char v27 = [v12 objectAtIndexedSubscript:0];
          v40[3] = v27;
          uint64_t v28 = [v12 objectAtIndexedSubscript:1];
          v40[4] = v28;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
        }
        else if ([v12 count] == 3)
        {
          v39[0] = &unk_1EF119FF8;
          v39[1] = &unk_1EF11A010;
          v30 = [v12 objectAtIndexedSubscript:0];
          v39[2] = v30;
          v31 = [v12 objectAtIndexedSubscript:1];
          v39[3] = v31;
          uint64_t v32 = [v12 objectAtIndexedSubscript:2];
          v39[4] = v32;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:5];
        }
        else if ([v12 count] == 4)
        {
          v38[0] = &unk_1EF119FF8;
          uint64_t v33 = [v12 objectAtIndexedSubscript:0];
          v38[1] = v33;
          v34 = [v12 objectAtIndexedSubscript:1];
          v38[2] = v34;
          v35 = [v12 objectAtIndexedSubscript:2];
          v38[3] = v35;
          v36 = [v12 objectAtIndexedSubscript:3];
          v38[4] = v36;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v12];
          [v14 setObject:&unk_1EF119FF8 atIndexedSubscript:0];
        }
      }
      else
      {
        id v14 = v12;
      }
      id v23 = [v6 multiArrayConstraint];
      uint64_t v24 = [v23 dataType];

      char v25 = [[MLMultiArray alloc] initWithShape:v14 dataType:v24 error:a4];
      v17 = v25;
      if (v25)
      {
        if (!v10) {
          v10 = &unk_1EF119FF8;
        }
        [(MLMultiArray *)v25 fillWithNumber:v10];
        id v18 = +[MLFeatureValue featureValueWithMultiArray:v17];
      }
      else
      {
        id v18 = 0;
      }

      goto LABEL_23;
    }
    id v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v37 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v6 type]);
      *(_DWORD *)buf = 138412546;
      v46 = v7;
      __int16 v47 = 2112;
      v48 = v37;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Feature %@ is required but not specified. The feature is %@. An optional feature is allowed only for MultiArray.", buf, 0x16u);
    }
    if (a4)
    {
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v21 = NSString;
      v10 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v6 type]);
      v17 = [v21 stringWithFormat:@"Feature %@ is required but not specified. The feature is %@. An optional feature is allowed only for MultiArray.", v7, v10];
      uint64_t v44 = v17;
      char v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      *a4 = [v20 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v22];

      id v18 = 0;
      goto LABEL_23;
    }
LABEL_15:
    id v18 = 0;
    goto LABEL_24;
  }
  v15 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v7;
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Feature %@ is required but not specified.", buf, 0xCu);
  }

  if (!a4) {
    goto LABEL_15;
  }
  BOOL v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v49 = *MEMORY[0x1E4F28568];
  v10 = [NSString stringWithFormat:@"Feature %@ is required but not specified.", v7];
  v50[0] = v10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  [v16 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v17];
  id v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:

  return v18;
}

@end