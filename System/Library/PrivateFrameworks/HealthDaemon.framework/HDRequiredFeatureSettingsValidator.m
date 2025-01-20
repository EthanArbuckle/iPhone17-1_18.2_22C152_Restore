@interface HDRequiredFeatureSettingsValidator
- (HDRequiredFeatureSettingsValidator)initWithRequiredSettingsKeys:(id)a3;
- (id)featureSettingsGivenBaseSettings:(id)a3 onboardingCompletion:(id)a4 error:(id *)a5;
@end

@implementation HDRequiredFeatureSettingsValidator

- (HDRequiredFeatureSettingsValidator)initWithRequiredSettingsKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDRequiredFeatureSettingsValidator;
  v5 = [(HDRequiredFeatureSettingsValidator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requiredSettingsKeys = v5->_requiredSettingsKeys;
    v5->_requiredSettingsKeys = (NSArray *)v6;
  }
  return v5;
}

- (id)featureSettingsGivenBaseSettings:(id)a3 onboardingCompletion:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    v11 = [v9 keyValueStorage];
    v12 = [v11 allKeys];
    int v13 = objc_msgSend(v12, "hk_containsObjectsInArray:", self->_requiredSettingsKeys);

    if (v13)
    {
      id v14 = v9;
      goto LABEL_11;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    v17 = [(NSArray *)self->_requiredSettingsKeys componentsJoinedByString:@", "];
    v18 = [v9 keyValueStorage];
    v19 = [v18 allKeys];
    v20 = [v19 componentsJoinedByString:@", "];
    objc_msgSend(v16, "hk_assignError:code:format:", a5, 3, @"Expected feature settings keys [%@] but received keys [%@]", v17, v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Expected feature settings but no feature settings present"");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
}

@end