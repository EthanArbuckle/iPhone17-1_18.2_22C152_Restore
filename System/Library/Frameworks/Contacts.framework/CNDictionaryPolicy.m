@interface CNDictionaryPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isContactPropertySupported:(id)a3;
- (CNDictionaryPolicy)initWithCoder:(id)a3;
- (CNDictionaryPolicy)initWithDictionary:(id)a3;
- (id)contactRestrictionsForLabeledProperty:(id)a3;
- (id)supportedLabelsForContactProperty:(id)a3;
- (id)unsupportedAttributesForLabeledContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNDictionaryPolicy

- (CNDictionaryPolicy)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNDictionaryPolicy;
  v5 = [(CNDictionaryPolicy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    policyDictionary = v5->_policyDictionary;
    v5->_policyDictionary = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)contactRestrictionsForLabeledProperty:(id)a3
{
  policyDictionary = self->_policyDictionary;
  id v4 = a3;
  v5 = [(NSDictionary *)policyDictionary objectForKey:@"CNContact"];
  uint64_t v6 = [v5 objectForKey:@"LabeledValueRestrictions"];
  v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  v3 = [(CNDictionaryPolicy *)self contactRestrictionsForLabeledProperty:a3];
  id v4 = [v3 objectForKey:@"UnsupportedValueKeys"];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1C978] array];
  }

  return v4;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v4 = a3;
  v5 = [(CNDictionaryPolicy *)self contactRestrictionsForLabeledProperty:v4];
  uint64_t v6 = [v5 objectForKey:@"MaximumNumber"];
  v7 = v6;
  if (v6)
  {
    id v8 = (id)[v6 unsignedIntegerValue];
  }
  else
  {
    if (![(CNDictionaryPolicy *)self isContactPropertySupported:v4])
    {
      unint64_t v9 = 0;
      goto LABEL_7;
    }
    v11.receiver = self;
    v11.super_class = (Class)CNDictionaryPolicy;
    id v8 = [(CNPermissivePolicy *)&v11 maximumCountOfValuesForContactProperty:v4];
  }
  unint64_t v9 = (unint64_t)v8;
LABEL_7:

  return v9;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  v3 = [(CNDictionaryPolicy *)self contactRestrictionsForLabeledProperty:a3];
  id v4 = [v3 objectForKey:@"SupportedLabels"];
  objc_opt_class();
  v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 allKeys];
  }

  return v5;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNDictionaryPolicy *)self contactRestrictionsForLabeledProperty:v6];
  unint64_t v9 = [v8 objectForKey:@"SupportedLabels"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v10 = [v9 objectForKey:v7];
    objc_super v11 = v10;
    if (v10)
    {
      id v12 = (id)[v10 unsignedIntegerValue];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)CNDictionaryPolicy;
      id v12 = [(CNPermissivePolicy *)&v16 maximumCountOfValuesForContactProperty:v6 label:v7];
    }
    id v13 = v12;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CNDictionaryPolicy;
    id v13 = [(CNPermissivePolicy *)&v15 maximumCountOfValuesForContactProperty:v6 label:v7];
  }

  return (unint64_t)v13;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  policyDictionary = self->_policyDictionary;
  id v4 = a3;
  v5 = [(NSDictionary *)policyDictionary objectForKey:@"CNContact"];
  id v6 = [v5 objectForKey:@"UnsupportedAttributes"];
  char v7 = [v6 containsObject:v4];

  return v7 ^ 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDictionaryPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CNDictionaryPolicy *)self initWithDictionary:0];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    objc_super v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    objc_super v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_policyDictionary"];
    uint64_t v12 = [v11 copy];
    policyDictionary = v5->_policyDictionary;
    v5->_policyDictionary = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end