@interface MOWebDomainCategoryShieldPolicySettingMetadata
- (MOWebDomainCategoryShieldPolicy)defaultValue;
- (MOWebDomainCategoryShieldPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumCategoryCount:(unint64_t)a5 maximumActivityCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9;
- (id)_combine:(id)a3 with:(id)a4;
- (id)combinePersistableValue:(id)a3 with:(id)a4;
- (id)persistableValueFromValue:(id)a3;
- (id)sanitizePersistableValue:(id)a3;
- (id)valueFromPersistableValue:(id)a3;
- (unint64_t)maximumActivityCount;
- (unint64_t)maximumCategoryCount;
@end

@implementation MOWebDomainCategoryShieldPolicySettingMetadata

- (id)valueFromPersistableValue:(id)a3
{
  return +[MOWebDomainCategoryShieldPolicy initializeWithPersistableValue:a3];
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

- (MOWebDomainCategoryShieldPolicy)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)MOWebDomainCategoryShieldPolicySettingMetadata;
  v2 = [(MOSettingMetadata *)&v4 defaultValue];
  return (MOWebDomainCategoryShieldPolicy *)v2;
}

- (MOWebDomainCategoryShieldPolicySettingMetadata)initWithSettingName:(id)a3 defaultPolicy:(id)a4 maximumCategoryCount:(unint64_t)a5 maximumActivityCount:(unint64_t)a6 isPublic:(BOOL)a7 scope:(id)a8 isPrivacySensitive:(BOOL)a9
{
  v12.receiver = self;
  v12.super_class = (Class)MOWebDomainCategoryShieldPolicySettingMetadata;
  result = [(MOSettingMetadata *)&v12 initWithSettingName:a3 defaultValue:a4 isPublic:a7 scope:a8 isPrivacySensitive:a9];
  result->_maximumCategoryCount = a5;
  result->_maximumActivityCount = a6;
  return result;
}

- (id)sanitizePersistableValue:(id)a3
{
  id v4 = a3;
  if (!+[MOWebDomainCategoryShieldPolicy isValidPersistableRepresentation:v4])
  {
    id v7 = 0;
    goto LABEL_8;
  }
  v5 = +[MOWebDomainCategoryShieldPolicy initializeWithPersistableValue:v4];
  v6 = [v5 specificCategories];
  if ([v6 count] <= self->_maximumCategoryCount)
  {
    v8 = [v5 excludedContent];
    unint64_t v9 = [v8 count];
    unint64_t maximumActivityCount = self->_maximumActivityCount;

    if (v9 <= maximumActivityCount)
    {
      objc_super v12 = [v5 specificCategories];
      v13 = +[MOCategory all];
      int v14 = [v12 containsObject:v13];

      if (v14)
      {
        v15 = [v5 excludedContent];
        v16 = +[MOCategoryShieldPolicy allPolicyWithExcludedContent:v15];

        id v7 = [v16 persistableValue];
      }
      else
      {
        id v7 = v4;
      }
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_7:

LABEL_8:
  return v7;
}

- (id)combinePersistableValue:(id)a3 with:(id)a4
{
  id v6 = a4;
  id v7 = [(MOWebDomainCategoryShieldPolicySettingMetadata *)self sanitizePersistableValue:a3];
  v8 = [(MOWebDomainCategoryShieldPolicySettingMetadata *)self sanitizePersistableValue:v6];

  if (v7)
  {
    if (v8)
    {
      unint64_t v9 = +[MOWebDomainCategoryShieldPolicy initializeWithPersistableValue:v7];
      v10 = +[MOWebDomainCategoryShieldPolicy initializeWithPersistableValue:v8];
      v11 = [(MOWebDomainCategoryShieldPolicySettingMetadata *)self _combine:v9 with:v10];
      objc_super v12 = [v11 persistableValue];

      goto LABEL_9;
    }
    id v13 = v7;
    goto LABEL_7;
  }
  if (v8)
  {
    id v13 = v8;
LABEL_7:
    objc_super v12 = v13;
    goto LABEL_9;
  }
  objc_super v12 = 0;
LABEL_9:

  return v12;
}

- (id)_combine:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 policy];
  if (v7 == 2)
  {
    uint64_t v9 = [v6 policy];
    if ((unint64_t)(v9 - 1) >= 2) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (v7 != 1)
  {
    if (!v7)
    {
      v8 = (MOWebDomainCategoryShieldPolicy *)v6;
LABEL_11:
      v10 = v8;
      goto LABEL_16;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [v6 policy];
  if (v9 == 2)
  {
LABEL_13:
    v11 = (void *)MEMORY[0x1E4F1CA80];
    objc_super v12 = [v5 excludedContent];
    id v13 = [v11 setWithArray:v12];

    int v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = [v6 excludedContent];
    v16 = [v14 setWithArray:v15];
    [v13 intersectSet:v16];

    v17 = [MOWebDomainCategoryShieldPolicy alloc];
    v18 = [v13 allObjects];
    v10 = [(MOCategoryShieldPolicy *)v17 initWithPolicy:2 specificCategories:0 excludedContent:v18];
    goto LABEL_15;
  }
  if (v9 != 1)
  {
LABEL_9:
    if (!v9)
    {
      v8 = (MOWebDomainCategoryShieldPolicy *)v5;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1E4F1CA80];
  v20 = [v5 specificCategories];
  id v13 = [v19 setWithArray:v20];

  v21 = [v6 specificCategories];
  [v13 addObjectsFromArray:v21];

  v22 = (void *)MEMORY[0x1E4F1CA80];
  v23 = [v5 excludedContent];
  v18 = [v22 setWithArray:v23];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  v25 = [v6 excludedContent];
  v26 = [v24 setWithArray:v25];
  [v18 intersectSet:v26];

  v27 = [MOWebDomainCategoryShieldPolicy alloc];
  v28 = [v13 allObjects];
  v29 = [v18 allObjects];
  v10 = [(MOCategoryShieldPolicy *)v27 initWithPolicy:1 specificCategories:v28 excludedContent:v29];

LABEL_15:
LABEL_16:

  return v10;
}

- (unint64_t)maximumActivityCount
{
  return self->_maximumActivityCount;
}

- (unint64_t)maximumCategoryCount
{
  return self->_maximumCategoryCount;
}

@end