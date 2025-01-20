@interface HDHealthRecordRulesetResource
+ (id)resourceFromDictionary:(id)a3 resourceName:(id)a4 error:(id *)a5;
- (BOOL)evaluateWithObject:(id)a3;
- (HDHRConditionRule)condition;
- (HDHealthRecordClinicalType)clinicalType;
- (NSArray)APIReferenceRules;
- (NSArray)containReferences;
- (NSArray)displayNameKeyPaths;
- (NSArray)retrieveReferences;
- (NSDictionary)medicalRecordProperties;
- (NSDictionary)redactionRules;
- (NSString)resourceName;
- (NSString)resourceType;
@end

@implementation HDHealthRecordRulesetResource

+ (id)resourceFromDictionary:(id)a3 resourceName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(HDHealthRecordRulesetResource);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 100, @"Couldn't construct ruleset resource - init failed");
    v18 = 0;
    goto LABEL_55;
  }
  uint64_t v10 = [v8 copy];
  resourceName = v9->_resourceName;
  v9->_resourceName = (NSString *)v10;

  v12 = objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", @"clinicalType", objc_opt_class(), a5);
  if (v12)
  {
    v13 = [[HDHealthRecordClinicalType alloc] initWithClinicalTypeName:v12];
    clinicalType = v9->_clinicalType;
    v9->_clinicalType = v13;

    if (v9->_clinicalType)
    {
      id v56 = 0;
      v15 = objc_msgSend(v7, "hk_safeArrayIfExistsForKeyPath:error:", @"containReferences", &v56);
      id v16 = v56;
      id v17 = v16;
      if (!v15 && v16)
      {
        if (a5)
        {
          id v17 = v16;
          v18 = 0;
          *a5 = v17;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
        goto LABEL_53;
      }
      objc_storeStrong((id *)&v9->_containReferences, v15);

      id v55 = 0;
      v19 = objc_msgSend(v7, "hk_safeValueIfExistsForKeyPath:class:error:", @"apiContainedReferenceRules", objc_opt_class(), &v55);
      id v20 = v55;
      id v17 = v20;
      if (!v19 && v20)
      {
        if (a5)
        {
          id v17 = v20;
          v18 = 0;
          *a5 = v17;
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        _HKLogDroppedError();
LABEL_30:
        v18 = 0;
        goto LABEL_52;
      }
      if ([v19 count])
      {
        uint64_t v21 = +[HDHealthRecordRulesetReferenceRule referenceRulesetsForRules:v19 error:a5];
        if (!v21) {
          goto LABEL_30;
        }
        APIReferenceRules = v9->_APIReferenceRules;
        v9->_APIReferenceRules = (NSArray *)v21;
      }
      v47 = v19;
      id v54 = v17;
      v23 = objc_msgSend(v7, "hk_safeArrayIfExistsForKeyPath:error:", @"retrieveReferences", &v54);
      id v24 = v54;

      v25 = v23;
      if (!v23 && v24)
      {
        if (a5)
        {
          id v24 = v24;
          v18 = 0;
          *a5 = v24;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
        goto LABEL_51;
      }
      v46 = v23;
      objc_storeStrong((id *)&v9->_retrieveReferences, v23);
      id v53 = v24;
      v26 = objc_msgSend(v7, "hk_safeArrayForKeyPath:error:", @"displayNameKeyPaths", &v53);
      id v27 = v53;

      if (v26)
      {
        objc_storeStrong((id *)&v9->_displayNameKeyPaths, v26);
      }
      else if (v27)
      {
        if (a5)
        {
          id v27 = v27;
          v18 = 0;
          *a5 = v27;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
LABEL_50:

        id v24 = v27;
        v25 = v46;
LABEL_51:
        v19 = v47;

        id v17 = v24;
        goto LABEL_52;
      }
      v45 = v26;
      id v52 = v27;
      v28 = objc_msgSend(v7, "hk_safeDictionaryIfExistsForKeyPath:error:", @"redactionRules", &v52);
      id v29 = v52;

      v30 = v28;
      if (v28 || !v29)
      {
        v44 = v28;
        objc_storeStrong((id *)&v9->_redactionRules, v28);
        id v51 = v29;
        uint64_t v31 = objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", @"properties", objc_opt_class(), &v51);
        id v32 = v51;

        medicalRecordProperties = v9->_medicalRecordProperties;
        v9->_medicalRecordProperties = (NSDictionary *)v31;

        if ([(NSDictionary *)v9->_medicalRecordProperties count])
        {

          id v50 = 0;
          v34 = objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", @"resourcePath", objc_opt_class(), &v50);
          id v35 = v50;
          id v29 = v35;
          if (v34 || !v35)
          {
            if (v34) {
              v36 = v34;
            }
            else {
              v36 = v8;
            }
            uint64_t v37 = [v36 copy];
            resourceType = v9->_resourceType;
            v9->_resourceType = (NSString *)v37;

            id v49 = 0;
            v39 = objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", @"condition", objc_opt_class(), &v49);
            id v29 = v49;
            if (v39)
            {
              id v48 = v29;
              v40 = [[HDHRConditionRule alloc] initWithDefinition:v39 error:&v48];
              id v41 = v48;

              condition = v9->_condition;
              v9->_condition = v40;

              id v29 = v41;
            }
            v30 = v44;
            v18 = v9;
          }
          else
          {
            objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 3, @"resource must have resourcePath", v35);
            v18 = 0;
            v30 = v44;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a5, 3, @"resource properties must be non-empty", v32);
          v18 = 0;
          id v29 = v32;
          v30 = v44;
        }
      }
      else if (a5)
      {
        id v29 = v29;
        v18 = 0;
        *a5 = v29;
      }
      else
      {
        _HKLogDroppedError();
        v18 = 0;
      }

      id v27 = v29;
      v26 = v45;
      goto LABEL_50;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 100, @"Couldn't construct ruleset resource for unknown clinical type \"%@\"", v12);
  }
  v18 = 0;
LABEL_54:

LABEL_55:
  return v18;
}

- (BOOL)evaluateWithObject:(id)a3
{
  condition = self->_condition;
  return !condition || [(HDHRConditionRule *)condition evaluateWith:a3];
}

- (HDHealthRecordClinicalType)clinicalType
{
  return self->_clinicalType;
}

- (NSArray)containReferences
{
  return self->_containReferences;
}

- (NSArray)APIReferenceRules
{
  return self->_APIReferenceRules;
}

- (NSArray)retrieveReferences
{
  return self->_retrieveReferences;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSDictionary)medicalRecordProperties
{
  return self->_medicalRecordProperties;
}

- (NSArray)displayNameKeyPaths
{
  return self->_displayNameKeyPaths;
}

- (NSDictionary)redactionRules
{
  return self->_redactionRules;
}

- (HDHRConditionRule)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_redactionRules, 0);
  objc_storeStrong((id *)&self->_displayNameKeyPaths, 0);
  objc_storeStrong((id *)&self->_medicalRecordProperties, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_retrieveReferences, 0);
  objc_storeStrong((id *)&self->_APIReferenceRules, 0);
  objc_storeStrong((id *)&self->_containReferences, 0);
  objc_storeStrong((id *)&self->_clinicalType, 0);
}

@end