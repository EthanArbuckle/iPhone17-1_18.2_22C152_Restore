@interface CNiOSABPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolicy:(id)a3;
- (BOOL)isReadonly;
- (BOOL)shouldAddContact:(id)a3;
- (BOOL)shouldRemoveContact:(id)a3;
- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6;
- (CNiOSABPolicy)initWithAddressBookPolicy:(void *)a3 readOnly:(BOOL)a4;
- (CNiOSABPolicy)initWithCoder:(id)a3;
- (id)_orderedLabels:(id)a3 withOrder:(id)a4;
- (id)supportedLabelsForContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3;
- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABPolicy

- (CNiOSABPolicy)initWithAddressBookPolicy:(void *)a3 readOnly:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABPolicy;
  v6 = [(CNiOSABPolicy *)&v9 init];
  v7 = v6;
  if (a3 && v6)
  {
    v6->_iOSABPolicy = a3;
    CFRetain(a3);
    v7->_abSourceIsContentReadonly = a4;
    v7->_fakePerson = (void *)ABPersonCreate();
  }
  return v7;
}

- (void)dealloc
{
  CFRelease(self->_fakePerson);
  CFRelease(self->_iOSABPolicy);
  v3.receiver = self;
  v3.super_class = (Class)CNiOSABPolicy;
  [(CNiOSABPolicy *)&v3 dealloc];
}

- (BOOL)isReadonly
{
  return self->_abSourceIsContentReadonly;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v3 = a3;
  v4 = +[CN contactPropertiesByKey];
  v5 = [v4 objectForKey:v3];

  if (v5 && (int v10 = 0, [v5 abPropertyID:&v10]))
  {
    unsigned int v6 = ABPolicyMaximumNumberOfValuesForProperty();
    if (v6 >= 2 && [v5 isSingleValue])
    {
      unint64_t v7 = 1;
    }
    else
    {
      if (v6 == 0x7FFFFFFF) {
        int v8 = -1;
      }
      else {
        int v8 = v6;
      }
      unint64_t v7 = v8;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[CN contactPropertiesByKey];
  unsigned int v6 = [v5 objectForKey:v4];

  if (v6 && (int v24 = 0, [v6 abPropertyID:&v24]))
  {
    unint64_t v7 = (void *)ABPolicyCopySupportedLabelsForProperty();
    if (v7)
    {
      int v8 = [MEMORY[0x1E4F1CA48] array];
      objc_super v9 = +[CNiOSABConstantsMapping ABToCNLabelConstantsMapping];
      uint64_t v10 = ABPolicyCopyPreferredLabelsForProperty();
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v11 = [v7 allKeys];
      v19 = (void *)v10;
      v12 = [(CNiOSABPolicy *)self _orderedLabels:v11 withOrder:v10];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = [v9 mappedConstant:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            [v8 addObject:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v14);
      }
    }
    else if ([v6 isSingleValue])
    {
      int v8 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_orderedLabels:(id)a3 withOrder:(id)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (a4)
  {
    unint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA70];
    id v8 = a4;
    objc_super v9 = (void *)[[v7 alloc] initWithArray:v8];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [v9 intersectSet:v10];
    [v9 addObjectsFromArray:v6];
    id v11 = [v9 array];
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = +[CNiOSABConstantsMapping CNToABLabelConstantsMapping];
  id v8 = [v7 mappedConstant:v5];

  objc_super v9 = +[CN contactPropertiesByKey];
  uint64_t v10 = [v9 objectForKey:v6];

  if (v10
    && (int v15 = 0, [v10 abPropertyID:&v15])
    && (CFDictionaryRef v11 = (const __CFDictionary *)ABPolicyCopySupportedLabelsForProperty()) != 0)
  {
    CFDictionaryRef v12 = v11;
    if (CFDictionaryContainsKey(v11, v8)) {
      unint64_t Value = (unint64_t)CFDictionaryGetValue(v12, v8);
    }
    else {
      unint64_t Value = 0;
    }
    CFRelease(v12);
  }
  else
  {
    unint64_t Value = -1;
  }

  return Value;
}

- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6
{
  id v8 = a3;
  if (self->_abSourceIsContentReadonly)
  {
    ShouldSetunint64_t Value = 0;
  }
  else
  {
    id v10 = a4;
    CFDictionaryRef v11 = +[CN contactPropertiesByKey];
    CFDictionaryRef v12 = [v11 objectForKey:v10];

    if (v12)
    {
      int v14 = 0;
      ShouldSetunint64_t Value = 0;
      if ([v12 abPropertyID:&v14])
      {
        [v12 ABValueFromCNValue:v8];
        ShouldSetunint64_t Value = ABPolicyShouldSetValue();
      }
    }
    else
    {
      ShouldSetunint64_t Value = 0;
    }
  }
  return ShouldSetValue;
}

- (BOOL)shouldAddContact:(id)a3
{
  if (self->_abSourceIsContentReadonly) {
    return 0;
  }
  else {
    return MEMORY[0x1F41070D0](self->_iOSABPolicy, 0, self->_fakePerson, 0);
  }
}

- (BOOL)shouldRemoveContact:(id)a3
{
  if (self->_abSourceIsContentReadonly) {
    return 0;
  }
  else {
    return MEMORY[0x1F41070D8](self->_iOSABPolicy, 0, self->_fakePerson, 0);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CNiOSABPolicy *)self isEqualToPolicy:v4];

  return v5;
}

- (BOOL)isEqualToPolicy:(id)a3
{
  if (!self->_abSourceIsContentReadonly == (*((unsigned char *)a3 + 24) != 0)) {
    return 0;
  }
  else {
    return MEMORY[0x1F41070C0](self->_iOSABPolicy, *((void *)a3 + 1));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = (const void *)ABPolicyCreateWithCoder();
  uint64_t v6 = [v4 decodeBoolForKey:@"read-only"];

  unint64_t v7 = [(CNiOSABPolicy *)self initWithAddressBookPolicy:v5 readOnly:v6];
  CFRelease(v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ABPolicyEncodeWithCoder();
  [v4 encodeBool:self->_abSourceIsContentReadonly forKey:@"read-only"];
}

@end