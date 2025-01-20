@interface MOUserSafetyScanningPolicySettingMetadata
- (MOUserSafetyScanningPolicy)defaultValue;
- (MOUserSafetyScanningPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 interventionCombineOperator:(int64_t)a5 rankedInterventionTypes:(id)a6 maximumApplicationCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10;
- (NSDictionary)rankedInterventionTypes;
- (id)_combine:(id)a3 with:(id)a4;
- (id)_combineInterventionType:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (int64_t)interventionCombineOperator;
- (unint64_t)maximumApplicationCount;
@end

@implementation MOUserSafetyScanningPolicySettingMetadata

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOUserSafetyScanningPolicy initializeWithPersistableValue:a3];
}

- (id)persistableValueFromValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 persistableValue];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MOUserSafetyScanningPolicy)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOUserSafetyScanningPolicySettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (MOUserSafetyScanningPolicy *)v2;
}

- (MOUserSafetyScanningPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 interventionCombineOperator:(int64_t)a5 rankedInterventionTypes:(id)a6 maximumApplicationCount:(unint64_t)a7 isPublic:(BOOL)a8 scope:(id)a9 isPrivacySensitive:(BOOL)a10
{
  BOOL v10 = a8;
  v16 = (NSDictionary *)a6;
  v20.receiver = self;
  v20.super_class = (Class)MOUserSafetyScanningPolicySettingMetadata;
  v17 = [(MOSettingMetadata *)&v20 initWithSettingName:a3 defaultValue:a4 isPublic:v10 scope:a9 isPrivacySensitive:a10];
  v17->_interventionCombineOperator = a5;
  rankedInterventionTypes = v17->_rankedInterventionTypes;
  v17->_rankedInterventionTypes = v16;

  v17->_maximumApplicationCount = a7;
  return v17;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  if (+[MOUserSafetyScanningPolicy isValidPersistableRepresentation:v4])
  {
    v5 = +[MOUserSafetyScanningPolicy initializeWithPersistableValue:v4];
    v6 = [v5 applications];
    unint64_t v7 = [v6 count];
    unint64_t maximumApplicationCount = self->_maximumApplicationCount;

    if (v7 <= maximumApplicationCount) {
      id v9 = v4;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(MOUserSafetyScanningPolicySettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOUserSafetyScanningPolicySettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      id v9 = +[MOUserSafetyScanningPolicy initializeWithPersistableValue:v7];
      BOOL v10 = +[MOUserSafetyScanningPolicy initializeWithPersistableValue:v8];
      v11 = [(MOUserSafetyScanningPolicySettingMetadata *)self _combine:v9 with:v10];
      v12 = [v11 persistableValue];

      goto LABEL_9;
    }
    id v13 = v7;
    goto LABEL_7;
  }
  if (v8)
  {
    id v13 = v8;
LABEL_7:
    v12 = v13;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 policy];
  if (v10 == 2)
  {
    unint64_t v11 = [v9 policy];
    if (v11 >= 2)
    {
      if (v11 == 2)
      {
        v12 = [v8 interventionType];
        id v13 = [v9 interventionType];
        v14 = [(MOUserSafetyScanningPolicySettingMetadata *)self _combineInterventionType:v12 with:v13];

        v15 = [[MOUserSafetyScanningPolicy alloc] initWithAllServices:0 allApplications:0 interventionType:v14];
        goto LABEL_15;
      }
      goto LABEL_12;
    }
LABEL_11:
    v17 = (MOUserSafetyScanningPolicy *)v8;
LABEL_14:
    v15 = v17;
    goto LABEL_15;
  }
  if (v10 != 1)
  {
    if (v10) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v16 = [v9 policy];
  if (v16 == 2)
  {
LABEL_13:
    v17 = (MOUserSafetyScanningPolicy *)v9;
    goto LABEL_14;
  }
  if (v16 != 1)
  {
    if (v16)
    {
LABEL_12:
      v15 = 0;
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  v46 = v8;
  v19 = [v8 allServices];
  objc_super v20 = (void *)[v19 mutableCopy];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v49 = v9;
  id obj = [v9 allServices];
  uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v21) {
    goto LABEL_33;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v55;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v55 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      v26 = [v20 objectForKeyedSubscript:v25];

      if (!v26)
      {
        v5 = [v49 allServices];
        v30 = [v5 objectForKeyedSubscript:v25];
        [v20 setObject:v30 forKeyedSubscript:v25];
LABEL_30:

        goto LABEL_31;
      }
      v27 = (void *)MEMORY[0x1E4F28ED0];
      v5 = [v20 objectForKeyedSubscript:v25];
      int v28 = [v5 BOOLValue];
      if (v28)
      {
        id v9 = [v49 allServices];
        id v4 = [v9 objectForKeyedSubscript:v25];
        uint64_t v29 = [v4 BOOLValue];
      }
      else
      {
        uint64_t v29 = 0;
      }
      v31 = [v27 numberWithInt:v29];
      [v20 setObject:v31 forKeyedSubscript:v25];

      if (v28)
      {

        v30 = v9;
        goto LABEL_30;
      }
LABEL_31:
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  }
  while (v22);
LABEL_33:

  v32 = [v46 allApplications];
  v33 = (void *)[v32 mutableCopy];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v47 = [v49 allApplications];
  uint64_t v34 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (!v34) {
    goto LABEL_48;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v51;
  while (2)
  {
    uint64_t v37 = 0;
    while (2)
    {
      if (*(void *)v51 != v36) {
        objc_enumerationMutation(v47);
      }
      uint64_t v38 = *(void *)(*((void *)&v50 + 1) + 8 * v37);
      v39 = [v33 objectForKeyedSubscript:v38];

      if (!v39)
      {
        v41 = [v49 allApplications];
        v44 = [v41 objectForKeyedSubscript:v38];
        [v33 setObject:v44 forKeyedSubscript:v38];
        goto LABEL_45;
      }
      v40 = (void *)MEMORY[0x1E4F28ED0];
      v41 = [v33 objectForKeyedSubscript:v38];
      int v42 = [v41 BOOLValue];
      if (v42)
      {
        id obj = [v49 allApplications];
        v5 = [obj objectForKeyedSubscript:v38];
        uint64_t v43 = [v5 BOOLValue];
      }
      else
      {
        uint64_t v43 = 0;
      }
      v45 = [v40 numberWithInt:v43];
      [v33 setObject:v45 forKeyedSubscript:v38];

      if (v42)
      {

        v44 = obj;
LABEL_45:
      }
      if (v35 != ++v37) {
        continue;
      }
      break;
    }
    uint64_t v35 = [v47 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v35) {
      continue;
    }
    break;
  }
LABEL_48:

  v15 = [[MOUserSafetyScanningPolicy alloc] initWithAllServices:v20 allApplications:v33 interventionType:0];
  id v8 = v46;
  id v9 = v49;
LABEL_15:

  return v15;
}

- (id)_combineInterventionType:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_rankedInterventionTypes objectForKeyedSubscript:v6];
  id v9 = [(NSDictionary *)self->_rankedInterventionTypes objectForKeyedSubscript:v7];
  int64_t interventionCombineOperator = self->_interventionCombineOperator;
  if (interventionCombineOperator == 1)
  {
    uint64_t v13 = [v8 integerValue];
    BOOL v12 = v13 > [v9 integerValue];
    goto LABEL_5;
  }
  if (!interventionCombineOperator)
  {
    uint64_t v11 = [v8 integerValue];
    BOOL v12 = v11 < [v9 integerValue];
LABEL_5:
    if (v12) {
      v14 = v6;
    }
    else {
      v14 = v7;
    }
    self = v14;
  }

  return self;
}

- (int64_t)interventionCombineOperator
{
  return self->_interventionCombineOperator;
}

- (NSDictionary)rankedInterventionTypes
{
  return self->_rankedInterventionTypes;
}

- (unint64_t)maximumApplicationCount
{
  return self->_maximumApplicationCount;
}

- (void).cxx_destruct
{
}

@end