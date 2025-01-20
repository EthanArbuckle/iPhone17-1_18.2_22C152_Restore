@interface CNPropertyDescription
+ (BOOL)supportsSecureCoding;
+ (id)os_log;
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8;
- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7;
- (BOOL)isMultiValue;
- (BOOL)isNonnull;
- (BOOL)isSingleValue;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4;
- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4;
- (BOOL)isWritable;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6;
- (BOOL)supportsABLazyLoading;
- (CNPropertyDescription)initWithCoder:(id)a3;
- (CNPropertyDescription)initWithKey:(id)a3 readSelector:(SEL)a4 writeSelector:(SEL)a5;
- (Class)valueClass;
- (NSArray)equivalentLabelSets;
- (NSString)key;
- (SEL)readSelector;
- (SEL)writeSelector;
- (id)CNMutableValueForABMultivalue;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (id)nilValue;
- (id)stringForIndexingForContact:(id)a3;
- (id)unifiableLabelsForLabel:(id)a3;
- (id)valueForKeyTransform;
- (id)valueWithResetIdentifiers:(id)a3;
- (void)ABValueForABPerson:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)assertValueType:(id)a3;
- (void)copyFromABPerson:(void *)a3 toContact:(id)a4;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNPropertyDescription

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions stringFromABBytes:a3 length:a4];
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  return 0;
}

- (void)assertValueType:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    [(CNPropertyDescription *)self valueClass];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x1E4F1CA00];
      v5 = CNPropertyInvalidTypeExceptionName;
      uint64_t v6 = objc_opt_class();
      v7 = [(CNPropertyDescription *)self key];
      [v4 raise:v5, @"Value %@ has incorrect type %@ for key %@. It should be %@.", v8, v6, v7, -[CNPropertyDescription valueClass](self, "valueClass") format];
    }
  }
}

- (id)unifiableLabelsForLabel:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(CNPropertyDescription *)self equivalentLabelSets];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 containsObject:v4])
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v20 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
                if (([v16 isEqualToString:v4] & 1) == 0) {
                  [v5 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (NSArray)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_1 != -1) {
    dispatch_once(&equivalentLabelSets_cn_once_token_1, &__block_literal_global_10_3);
  }
  v2 = (void *)equivalentLabelSets_cn_once_object_1;

  return (NSArray *)v2;
}

- (BOOL)isMultiValue
{
  return 0;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)abPropertyID:(int *)a3
{
  return 0;
}

- (id)nilValue
{
  return 0;
}

- (BOOL)isWritable
{
  return self->_writeSelector != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPropertyDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];

  if (v5)
  {
    uint64_t v6 = +[CN contactPropertiesByKey];
    uint64_t v7 = [(CNPropertyDescription *)v6 objectForKeyedSubscript:v5];

    self = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CNPropertyDescription)initWithKey:(id)a3 readSelector:(SEL)a4 writeSelector:(SEL)a5
{
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNPropertyDescription;
  v9 = [(CNPropertyDescription *)&v21 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    key = v9->_key;
    v9->_key = (NSString *)v10;

    if (a4) {
      SEL v12 = a4;
    }
    else {
      SEL v12 = 0;
    }
    v9->_readSelector = v12;
    if (a5) {
      SEL v13 = a5;
    }
    else {
      SEL v13 = 0;
    }
    v9->_writeSelector = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNPropertyDescription_initWithKey_readSelector_writeSelector___block_invoke;
    aBlock[3] = &unk_1E56B8750;
    id v20 = v8;
    uint64_t v14 = _Block_copy(aBlock);
    uint64_t v15 = [v14 copy];
    id valueForKeyTransform = v9->_valueForKeyTransform;
    v9->_id valueForKeyTransform = (id)v15;

    v17 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueForKeyTransform, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

uint64_t __44__CNPropertyDescription_equivalentLabelSets__block_invoke()
{
  equivalentLabelSets_cn_once_object_1 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C978]);

  return MEMORY[0x1F41817F8]();
}

- (id)CNMutableValueForABMultivalue
{
  return 0;
}

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  return 0;
}

- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7
{
  return 0;
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (BOOL)supportsABLazyLoading
{
  int v3 = -1;
  if ([(CNPropertyDescription *)self abPropertyID:&v3]) {
    return ABCPersonPropertySupportsLazyLoading();
  }
  else {
    return 1;
  }
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  ABPropertyID property = 0;
  [(CNPropertyDescription *)self abPropertyID:&property];
  if (ABPersonGetTypeOfProperty(property) == 1 && ![a3 length]) {
    a3 = 0;
  }
  return ABRecordSetValue(a4, property, a3, a5);
}

- (void)ABValueForABPerson:(void *)a3
{
  ABPropertyID property = 0;
  [(CNPropertyDescription *)self abPropertyID:&property];
  result = (void *)ABRecordCopyValue(a3, property);
  if (result) {
    return (void *)CFAutorelease(result);
  }
  return result;
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  CFTypeRef cf = 0;
  BOOL v7 = -[CNPropertyDescription setABValue:onABPerson:error:](self, "setABValue:onABPerson:error:", -[CNPropertyDescription ABValueFromCNValue:](self, "ABValueFromCNValue:", a3, a4, a5), a4, &cf);
  BOOL v8 = v7;
  if (a6)
  {
    if (!v7)
    {
      *a6 = +[CNErrorFactory errorForiOSABError:cf];
      if (cf) {
        CFRelease(cf);
      }
    }
  }
  return v8;
}

- (void)copyFromABPerson:(void *)a3 toContact:(id)a4
{
  id v6 = a4;
  id v7 = [(CNPropertyDescription *)self CNValueFromABValue:[(CNPropertyDescription *)self ABValueForABPerson:a3]];
  [(CNPropertyDescription *)self setCNValue:v7 onContact:v6];
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_17 != -1) {
    dispatch_once(&os_log_cn_once_token_0_17, &__block_literal_global_107);
  }
  v2 = (void *)os_log_cn_once_object_0_17;

  return v2;
}

uint64_t __31__CNPropertyDescription_os_log__block_invoke()
{
  os_log_cn_once_object_0_17 = (uint64_t)os_log_create("com.apple.contacts", "CNPropertyDescription");

  return MEMORY[0x1F41817F8]();
}

uint64_t __64__CNPropertyDescription_initWithKey_readSelector_writeSelector___block_invoke(uint64_t a1, void *a2)
{
  return [a2 valueForKey:*(void *)(a1 + 32)];
}

- (BOOL)isSingleValue
{
  return 1;
}

- (id)valueWithResetIdentifiers:(id)a3
{
  id v3 = a3;

  return v3;
}

- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v6)
  {
    id v6 = [(CNPropertyDescription *)self nilValue];
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v8 = [(CNPropertyDescription *)self nilValue];
    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  char v9 = [MEMORY[0x1E4F5A3E0] isObject:v6 equalToOther:v8];

  return v9;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  CNAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  CNAbstractMethodException();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6 && [v6 conformsToProtocol:&unk_1EE094630])
  {
    id v12 = 0;
    char v8 = [v7 isValid:&v12];
    id v9 = v12;
    if ((v8 & 1) == 0 && a4)
    {
      uint64_t v10 = [(CNPropertyDescription *)self key];
      *a4 = +[CNErrorFactory errorByPrependingKeyPath:v10 toKeyPathsInError:v9];
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNPropertyDescription *)self key];
  [v6 setValue:v7 forKey:v8];
}

- (id)CNValueForContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNPropertyDescription *)self key];
  id v6 = [v4 valueForKey:v5];

  return v6;
}

- (id)stringForIndexingForContact:(id)a3
{
  id v4 = a3;
  if ([(CNPropertyDescription *)self isSingleValue])
  {
    v5 = [(CNPropertyDescription *)self CNValueForContact:v4];
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

  return v6;
}

- (SEL)readSelector
{
  if (self->_readSelector) {
    return self->_readSelector;
  }
  else {
    return 0;
  }
}

- (SEL)writeSelector
{
  if (self->_writeSelector) {
    return self->_writeSelector;
  }
  else {
    return 0;
  }
}

- (id)valueForKeyTransform
{
  return self->_valueForKeyTransform;
}

- (BOOL)isNonnull
{
  return self->_isNonnull;
}

@end