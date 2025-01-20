@interface CNLabeledValue
+ (BOOL)isArrayOfEntries:(id)a3 equalToArrayOfEntriesIgnoringIdentifiers:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (CNLabeledValue)labeledValueWithIdentifier:(id)a3 inArray:(id)a4;
+ (CNLabeledValue)labeledValueWithLabel:(NSString *)label value:(id)value;
+ (NSString)localizedStringForLabel:(NSString *)label;
+ (id)Value;
+ (id)allValuesInArray:(id)a3;
+ (id)emptyEntries;
+ (id)entriesByUnifyingEntryArrays:(id)a3 forProperty:(id)a4;
+ (id)entryForIdentifier:(id)a3 inArray:(id)a4;
+ (id)entryWithIdentifier:(id)a3 label:(id)a4 value:(id)a5;
+ (id)firstLabeledValueWithValue:(id)a3 inArray:(id)a4;
+ (id)identifierProvider;
+ (id)labelForIdentifier:(id)a3 inArray:(id)a4;
+ (id)makeIdentifier;
+ (id)propertyDescriptionLocalizationForLabel:(uint64_t)a1;
+ (id)propertyDescriptionOwnersByLabel;
+ (id)testMatchingIdentifier:(id)a3;
+ (id)valueForIdentifier:(id)a3 inArray:(id)a4;
- (BOOL)isBirthday;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringIdentifiers:(id)a3;
- (BOOL)isSuggested;
- (CNLabelValuePair)labelValuePair;
- (CNLabeledValue)init;
- (CNLabeledValue)initWithCoder:(id)a3;
- (CNLabeledValue)initWithIdentifier:(id)a3 label:(id)a4 value:(id)a5;
- (CNLabeledValue)initWithLabel:(NSString *)label value:(id)value;
- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label;
- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label value:(id)value;
- (CNLabeledValue)labeledValueBySettingValue:(id)value;
- (CNValueOrigin)valueOrigin;
- (NSDictionary)storeInfo;
- (NSSet)linkedIdentifiers;
- (NSString)description;
- (NSString)identifier;
- (NSString)label;
- (NSString)localizedAppName;
- (NSString)storeIdentifier;
- (NSString)suggestionFoundInBundleId;
- (SGRecordId)suggestionRecordId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)primitiveInitWithIdentifier:(id)a3 label:(id)a4 value:(id)a5;
- (id)value;
- (int)iOSLegacyIdentifier;
- (unint64_t)hash;
- (void)addStoreInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIOSLegacyIdentifier:(int)a3;
- (void)setLinkedIdentifiers:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setStoreInfo:(id)a3;
@end

@implementation CNLabeledValue

- (id)primitiveInitWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_1 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_1, &__block_literal_global_176);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_1, OS_LOG_TYPE_FAULT)) {
      -[CNLabeledValue primitiveInitWithIdentifier:label:value:]();
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CNLabeledValue;
  v12 = [(CNLabeledValue *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = [[CNLabelValuePair alloc] initWithLabel:v10 value:v11];
    labelValuePair = v13->_labelValuePair;
    v13->_labelValuePair = v14;

    v13->_iOSLegacyIdentifier = CNLabeledValueInvalidIOSIdentifier;
    objc_opt_class();
    v13->_isValueMutable = objc_opt_isKindOfClass() & 1;
    v16 = v13;
  }

  return v13;
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->_iOSLegacyIdentifier = a3;
}

+ (id)emptyEntries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_labelValuePair, 0);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    uint64_t v21 = v5;
    uint64_t v22 = v4;
    uint64_t v23 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v11 = (unint64_t)[(CNLabeledValue *)self identifier];
      unint64_t v12 = (unint64_t)(id)[a3 identifier];
      if (!(v11 | v12) || (int v13 = [(id)v11 isEqual:v12]) != 0)
      {
        unint64_t v14 = (unint64_t)[(CNLabeledValue *)self storeIdentifier];
        unint64_t v15 = (unint64_t)(id)[a3 storeIdentifier];
        if (!(v14 | v15) || (int v13 = [(id)v14 isEqual:v15]) != 0)
        {
          unint64_t v16 = (unint64_t)[(CNLabeledValue *)self linkedIdentifiers];
          unint64_t v17 = (unint64_t)(id)[a3 linkedIdentifiers];
          if (!(v16 | v17) || (int v13 = [(id)v16 isEqual:v17]) != 0)
          {
            unint64_t v18 = (unint64_t)[(CNLabeledValue *)self labelValuePair];
            unint64_t v19 = (unint64_t)(id)[a3 labelValuePair];
            if (!(v18 | v19) || (int v13 = [(id)v18 isEqual:v19]) != 0) {
              LOBYTE(v13) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (id)value
{
  BOOL isValueMutable = self->_isValueMutable;
  labelValuePair = self->_labelValuePair;
  if (isValueMutable)
  {
    uint64_t v4 = [(CNLabelValuePair *)labelValuePair value];
    id v5 = (id)[v4 copy];
  }
  else
  {
    id v5 = labelValuePair->_value;
  }

  return v5;
}

- (NSString)label
{
  return self->_labelValuePair->_label;
}

- (BOOL)isEqualIgnoringIdentifiers:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = (unint64_t)[(CNLabeledValue *)self labelValuePair];
      unint64_t v6 = (unint64_t)(id)[a3 labelValuePair];
      if (!(v5 | v6) || (int v7 = [(id)v5 isEqual:v6]) != 0) {
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (CNLabelValuePair)labelValuePair
{
  return (CNLabelValuePair *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setLinkedIdentifiers:(id)a3
{
}

- (NSSet)linkedIdentifiers
{
  return self->_linkedIdentifiers;
}

- (BOOL)isSuggested
{
  unint64_t v5 = [(CNLabeledValue *)self storeIdentifier];
  if (!v5)
  {
    v2 = +[CNSuggestedContactStore storeIdentifier];
    if (!v2)
    {
      char v8 = 1;
      goto LABEL_14;
    }
  }
  unint64_t v6 = [(CNLabeledValue *)self storeIdentifier];
  int v7 = +[CNSuggestedContactStore storeIdentifier];
  if (([v6 isEqual:v7] & 1) == 0)
  {
    id v9 = [(CNLabeledValue *)self storeIdentifier];
    if (v9
      || (+[CNDonationMapper mapperIdentifier],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = [(CNLabeledValue *)self storeIdentifier];
      unint64_t v11 = +[CNDonationMapper mapperIdentifier];
      char v8 = [v10 isEqual:v11];

      if (v9)
      {

        goto LABEL_13;
      }
    }
    else
    {
      char v8 = 1;
    }

LABEL_13:
    if (v5) {
      goto LABEL_15;
    }
LABEL_14:

    goto LABEL_15;
  }

  char v8 = 1;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

+ (CNLabeledValue)labeledValueWithLabel:(NSString *)label value:(id)value
{
  id v6 = value;
  int v7 = label;
  id v8 = objc_alloc((Class)a1);
  id v9 = +[CNLabeledValue makeIdentifier]();
  id v10 = (void *)[v8 initWithIdentifier:v9 label:v7 value:v6];

  return (CNLabeledValue *)v10;
}

- (CNLabeledValue)initWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[a3 copy];
  unint64_t v11 = (void *)[v9 copy];

  unint64_t v12 = (void *)[v8 copy];
  int v13 = [(CNLabeledValue *)self primitiveInitWithIdentifier:v10 label:v11 value:v12];

  return v13;
}

+ (id)makeIdentifier
{
  self;
  v0 = +[CNLabeledValue identifierProvider]();
  v1 = [v0 makeIdentifier];

  return v1;
}

+ (id)identifierProvider
{
  self;
  if (identifierProvider_cn_once_token_0 != -1) {
    dispatch_once(&identifierProvider_cn_once_token_0, &__block_literal_global_12);
  }
  v0 = (void *)identifierProvider_cn_once_object_0;

  return v0;
}

uint64_t __36__CNLabeledValue_identifierProvider__block_invoke()
{
  identifierProvider_cn_once_object_0 = [[CNUuidIdentifierProvider alloc] initWithSuffix:0];

  return MEMORY[0x1F41817F8]();
}

- (CNLabeledValue)initWithLabel:(NSString *)label value:(id)value
{
  id v6 = value;
  int v7 = label;
  id v8 = +[CNLabeledValue makeIdentifier]();
  id v9 = [(CNLabeledValue *)self initWithIdentifier:v8 label:v7 value:v6];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  id v6 = [(CNLabeledValue *)self label];
  int v7 = [(CNLabeledValue *)self value];
  uint64_t v8 = [(CNLabeledValue *)v4 initWithIdentifier:identifier label:v6 value:v7];

  uint64_t v9 = [(NSString *)self->_storeIdentifier copy];
  id v10 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v9;

  uint64_t v11 = [(NSDictionary *)self->_storeInfo copy];
  unint64_t v12 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v11;

  uint64_t v13 = [(NSSet *)self->_linkedIdentifiers copy];
  unint64_t v14 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v13;

  *(_DWORD *)(v8 + 24) = self->_iOSLegacyIdentifier;
  return (id)v8;
}

+ (id)testMatchingIdentifier:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNLabeledValue_testMatchingIdentifier___block_invoke;
  aBlock[3] = &unk_1E56B4650;
  id v9 = v3;
  id v4 = v3;
  unint64_t v5 = _Block_copy(aBlock);
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __41__CNLabeledValue_testMatchingIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)entryForIdentifier:(id)a3 inArray:(id)a4
{
  id v6 = a4;
  int v7 = [a1 testMatchingIdentifier:a3];
  uint64_t v8 = [v6 indexOfObjectPassingTest:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

+ (NSString)localizedStringForLabel:(NSString *)label
{
  uint64_t v4 = label;
  +[CNLabeledValue propertyDescriptionLocalizationForLabel:]((uint64_t)a1, v4);
  unint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    unint64_t v5 = [MEMORY[0x1E4F5A430] localizedStringForString:v4 class:a1 returningNilIfNotFound:0];
    if (!v5) {
      unint64_t v5 = v4;
    }
  }

  return v5;
}

+ (id)propertyDescriptionLocalizationForLabel:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[CNLabeledValue propertyDescriptionOwnersByLabel]();
  uint64_t v4 = [v3 objectForKeyedSubscript:v2];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 localizedStringForLabel:v2];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)propertyDescriptionOwnersByLabel
{
  self;
  if (propertyDescriptionOwnersByLabel_onceToken != -1) {
    dispatch_once(&propertyDescriptionOwnersByLabel_onceToken, &__block_literal_global_4_1);
  }
  v0 = (void *)propertyDescriptionOwnersByLabel_result;

  return v0;
}

void __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v1 = +[CN multiValueContactProperties];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v7 = [v6 managedLabels];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke_2;
        v10[3] = &unk_1E56B4678;
        id v11 = v0;
        unint64_t v12 = v6;
        objc_msgSend(v7, "_cn_each:", v10);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }

  uint64_t v8 = [v0 copy];
  id v9 = (void *)propertyDescriptionOwnersByLabel_result;
  propertyDescriptionOwnersByLabel_result = v8;
}

uint64_t __50__CNLabeledValue_propertyDescriptionOwnersByLabel__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

+ (id)labelForIdentifier:(id)a3 inArray:(id)a4
{
  uint64_t v4 = [a1 entryForIdentifier:a3 inArray:a4];
  unint64_t v5 = [v4 label];

  return v5;
}

+ (id)valueForIdentifier:(id)a3 inArray:(id)a4
{
  uint64_t v4 = [a1 entryForIdentifier:a3 inArray:a4];
  unint64_t v5 = [v4 value];

  return v5;
}

+ (id)entryWithIdentifier:(id)a3 label:(id)a4 value:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 label:v9 value:v8];

  return v11;
}

+ (BOOL)isArrayOfEntries:(id)a3 equalToArrayOfEntriesIgnoringIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if (v7)
    {
      BOOL v8 = 0;
      for (i = 0; i != v7; BOOL v8 = i >= v7)
      {
        objc_opt_class();
        id v10 = [v5 objectAtIndex:i];
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            id v11 = v10;
          }
          else {
            id v11 = 0;
          }
          id v12 = v11;
        }
        else
        {
          id v12 = 0;
        }

        objc_opt_class();
        long long v13 = [v6 objectAtIndex:i];
        if (v13)
        {
          if (objc_opt_isKindOfClass()) {
            long long v14 = v13;
          }
          else {
            long long v14 = 0;
          }
          id v15 = v14;
        }
        else
        {
          id v15 = 0;
        }

        char v16 = [v12 isEqualIgnoringIdentifiers:v15];
        if ((v16 & 1) == 0) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)entriesByUnifyingEntryArrays:(id)a3 forProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  BOOL v8 = +[CN unifyMultivalues:v6 forProperty:v5 options:v7];

  return v8;
}

+ (id)allValuesInArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "value", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (CNLabeledValue)labeledValueWithIdentifier:(id)a3 inArray:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v14);
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (CNLabeledValue *)v7;
}

+ (id)firstLabeledValueWithValue:(id)a3 inArray:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "value", (void)v14);
        int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CNLabeledValue)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label
{
  uint64_t v4 = label;
  id v5 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  id v7 = [(CNLabelValuePair *)self->_labelValuePair value];
  uint64_t v8 = [(CNLabeledValue *)v5 initWithIdentifier:identifier label:v4 value:v7];

  id v9 = [(CNLabeledValue *)self linkedIdentifiers];
  id v10 = (void *)[v9 copy];
  [(CNLabeledValue *)v8 setLinkedIdentifiers:v10];

  [(CNLabeledValue *)v8 setIOSLegacyIdentifier:[(CNLabeledValue *)self iOSLegacyIdentifier]];

  return v8;
}

- (CNLabeledValue)labeledValueBySettingValue:(id)value
{
  id v4 = value;
  id v5 = [CNLabeledValue alloc];
  identifier = self->_identifier;
  id v7 = [(CNLabelValuePair *)self->_labelValuePair label];
  uint64_t v8 = [(CNLabeledValue *)v5 initWithIdentifier:identifier label:v7 value:v4];

  id v9 = [(CNLabeledValue *)self linkedIdentifiers];
  id v10 = (void *)[v9 copy];
  [(CNLabeledValue *)v8 setLinkedIdentifiers:v10];

  [(CNLabeledValue *)v8 setIOSLegacyIdentifier:[(CNLabeledValue *)self iOSLegacyIdentifier]];

  return v8;
}

- (CNLabeledValue)labeledValueBySettingLabel:(NSString *)label value:(id)value
{
  id v6 = value;
  id v7 = label;
  uint64_t v8 = [[CNLabeledValue alloc] initWithIdentifier:self->_identifier label:v7 value:v6];

  id v9 = [(CNLabeledValue *)self linkedIdentifiers];
  id v10 = (void *)[v9 copy];
  [(CNLabeledValue *)v8 setLinkedIdentifiers:v10];

  [(CNLabeledValue *)v8 setIOSLegacyIdentifier:[(CNLabeledValue *)self iOSLegacyIdentifier]];

  return v8;
}

- (void)addStoreInfo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A270];
  id v5 = [(CNLabeledValue *)self storeInfo];
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    [(CNLabeledValue *)self setStoreInfo:v8];
  }
  else
  {
    id v6 = [(CNLabeledValue *)self storeInfo];
    id v7 = (void *)[v6 mutableCopy];

    [v7 addEntriesFromDictionary:v8];
    [(CNLabeledValue *)self setStoreInfo:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNLabeledValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
  id v7 = [v4 decodeObjectForKey:@"_value"];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    id v8 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNLabeledValue initWithCoder:]();
    }
  }
  else if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CNLabeledValue initWithCoder:]();
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v12 = [(CNLabeledValue *)self primitiveInitWithIdentifier:v5 label:v6 value:v7];
        long long v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = objc_opt_class();
        long long v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        long long v16 = [v4 decodeObjectOfClasses:v15 forKey:@"linkedIdentifiers"];
        uint64_t v17 = [v16 copy];
        uint64_t v18 = (void *)v12[6];
        v12[6] = v17;

        *((_DWORD *)v12 + 6) = [v4 decodeInt32ForKey:@"iOSLegacyIdentifier"];
        uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeIdentifier"];
        uint64_t v20 = [v19 copy];
        uint64_t v21 = (void *)v12[4];
        v12[4] = v20;

        uint64_t v22 = +[CNContact storeInfoFromCoder:v4 storeIdentifier:v12[4] key:@"storeInfo"];
        uint64_t v23 = [v22 copy];
        v24 = (void *)v12[5];
        v12[5] = v23;

        self = v12;
        id v10 = self;
        goto LABEL_14;
      }
      id v8 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CNLabeledValue initWithCoder:].cold.4();
      }
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNLabeledValue initWithCoder:]();
    }
  }

  id v9 = +[CNErrorFactory errorWithCode:2 userInfo:0];
  [v4 failWithError:v9];

  id v10 = 0;
LABEL_14:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"_identifier"];
  id v5 = [(CNLabelValuePair *)self->_labelValuePair label];
  [v7 encodeObject:v5 forKey:@"_label"];

  id v6 = [(CNLabelValuePair *)self->_labelValuePair value];
  [v7 encodeObject:v6 forKey:@"_value"];

  [v7 encodeObject:self->_linkedIdentifiers forKey:@"linkedIdentifiers"];
  [v7 encodeInt32:self->_iOSLegacyIdentifier forKey:@"iOSLegacyIdentifier"];
  [v7 encodeObject:self->_storeIdentifier forKey:@"storeIdentifier"];
  [v7 encodeObject:self->_storeInfo forKey:@"storeInfo"];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  identifier = self->_identifier;
  id v5 = [(CNLabelValuePair *)self->_labelValuePair label];
  id v6 = [(CNLabelValuePair *)self->_labelValuePair value];
  id v7 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"identifier", identifier, @"label", v5, @"value", v6, 0);

  id v8 = (id)[v3 appendName:@"iOSLegacyIdentifier" intValue:self->_iOSLegacyIdentifier];
  id v9 = [v3 build];

  return (NSString *)v9;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  id v4 = [(CNLabeledValue *)self identifier];
  uint64_t v5 = [v3 objectHash:v4];

  id v6 = (void *)MEMORY[0x1E4F5A418];
  id v7 = [(CNLabeledValue *)self storeIdentifier];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  id v9 = (void *)MEMORY[0x1E4F5A418];
  id v10 = [(CNLabeledValue *)self labelValuePair];
  unint64_t v11 = [v9 objectHash:v10] - v8 + 32 * v8 + 506447;

  return v11;
}

+ (id)Value
{
  return &__block_literal_global_153;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSDictionary)storeInfo
{
  return self->_storeInfo;
}

- (void)setStoreInfo:(id)a3
{
}

- (SGRecordId)suggestionRecordId
{
  uint64_t v2 = [(CNLabeledValue *)self storeInfo];
  id v3 = [v2 objectForKey:CNSuggestedContactRecordIdKey];

  return (SGRecordId *)v3;
}

- (NSString)suggestionFoundInBundleId
{
  uint64_t v2 = [(CNLabeledValue *)self storeInfo];
  id v3 = [v2 objectForKey:CNSuggestedContactFoundInBundle];

  return (NSString *)v3;
}

- (CNValueOrigin)valueOrigin
{
  uint64_t v2 = [(CNLabeledValue *)self storeInfo];
  id v3 = [v2 objectForKeyedSubscript:@"valueOrigin"];

  return (CNValueOrigin *)v3;
}

- (NSString)localizedAppName
{
  objc_opt_class();
  id v3 = [(CNLabeledValue *)self value];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = *MEMORY[0x1E4F5A2A0];
  id v7 = [v5 service];
  int v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  id v9 = 0;
  if (v8)
  {
    id v9 = [v5 service];
  }

  return (NSString *)v9;
}

- (BOOL)isBirthday
{
  uint64_t v2 = [(CNLabeledValue *)self label];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F5DED8]];

  return v3;
}

- (void)primitiveInitWithIdentifier:label:value:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "parameter ‘value’ must be nonnull", v1, 2u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error decoding CNLabeledValue: no identifier", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error decoding CNLabeledValue: no value", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error decoding CNLabeledValue: labeled-value value", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error decoding CNLabeledValue: array value", v2, v3, v4, v5, v6);
}

@end