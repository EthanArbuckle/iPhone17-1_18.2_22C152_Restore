@interface _HKComparisonFilter
+ (BOOL)_isValidValue:(id)a3 forKeyPath:(id)a4 allowedClases:(id)a5 error:(id *)a6;
+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3;
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (BOOL)requiresSubpredicate;
+ (BOOL)supportsSecureCoding;
+ (id)_filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7 isSubpredicate:(BOOL)a8;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6;
+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 isSubpredicate:(BOOL)a7;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)dataTypes;
- (NSString)description;
- (NSString)keyPath;
- (_HKComparisonFilter)initWithCoder:(id)a3;
- (id)_initWithKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7;
- (id)value;
- (int64_t)keyPathIntegerValue;
- (unint64_t)applicationSDKVersionToken;
- (unint64_t)hash;
- (unint64_t)operatorType;
- (void)configureInMemoryFilter;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKComparisonFilter

- (id)_initWithKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HKComparisonFilter;
  v15 = [(_HKComparisonFilter *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v16;

    v15->_operatorType = a4;
    if ([v13 conformsToProtocol:&unk_1EECE7A20]) {
      id v18 = (id)[v13 copy];
    }
    else {
      id v18 = v13;
    }
    id value = v15->_value;
    v15->_id value = v18;

    objc_storeStrong((id *)&v15->_dataTypes, a6);
    v15->_applicationSDKVersionToken = a7;
    atomic_store(0, (unsigned __int8 *)&v15->_hasBeenConfiguredFlag);
  }

  return v15;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  keyPath = self->_keyPath;
  v6 = HKStringFromPredicateOperatorType(self->_operatorType);
  id value = self->_value;
  v8 = [(NSSet *)self->_dataTypes allObjects];
  v9 = [v8 componentsJoinedByString:@", "];
  v10 = [v3 stringWithFormat:@"<%@: %@ '%@' %@ for [%@], sdk_token=%llu>", v4, keyPath, v6, value, v9, self->_applicationSDKVersionToken];

  return (NSString *)v10;
}

+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 isSubpredicate:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [a1 _filterForKeyPath:v14 operatorType:a4 value:v13 dataTypes:v12 applicationSDKVersionToken:HKApplicationSDKVersionToken() isSubpredicate:v7];

  return v15;
}

+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6
{
  return (id)[a1 filterForKeyPath:a3 operatorType:a4 value:a5 dataTypes:a6 isSubpredicate:0];
}

+ (id)_filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7 isSubpredicate:(BOOL)a8
{
  int v8 = a8;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (![a1 supportsKeyPath:v14 forTypes:v16]) {
    goto LABEL_4;
  }
  if ([a1 requiresSubpredicate] != v8)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = [v16 allObjects];
    v20 = [v19 componentsJoinedByString:@", "];
    [v17 raise:v18, @"Keypath should only be used in subpredicates '%@' for %@.%@", v20, objc_opt_class(), v14 format];

LABEL_4:
    objc_super v21 = 0;
    goto LABEL_15;
  }
  id v35 = 0;
  char v22 = [a1 areValidTypes:v16 forKeyPath:v14 error:&v35];
  id v23 = v35;
  if (v22)
  {
    if ([a1 isAllowedPredicateOperatorType:a4 forKeyPath:v14])
    {
      id v34 = v23;
      char v24 = [a1 isValidValue:v15 forKeyPath:v14 operatorType:a4 dataTypes:v16 error:&v34];
      id v25 = v34;

      if (v24)
      {
        objc_super v21 = (void *)[objc_alloc((Class)a1) _initWithKeyPath:v14 operatorType:a4 value:v15 dataTypes:v16 applicationSDKVersionToken:a7];
        [v21 configureInMemoryFilter];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid value '%@' for %@.%@: %@", v15, objc_opt_class(), v14, v25 format];
        objc_super v21 = 0;
      }
      id v23 = v25;
      goto LABEL_14;
    }
    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3C8];
    v32 = HKStringFromPredicateOperatorType(a4);
    [v30 raise:v31, @"Invalid operatorType '%@' for %@.%@", v32, objc_opt_class(), v14 format];
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    v28 = [v16 allObjects];
    v29 = [v28 componentsJoinedByString:@", "];
    [v26 raise:v27, @"Invalid data types '%@' for %@.%@: %@", v29, objc_opt_class(), v14, v23 format];
  }
  objc_super v21 = 0;
LABEL_14:

LABEL_15:

  return v21;
}

+ (BOOL)requiresSubpredicate
{
  return 0;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 allowedDataTypeClassesForKeyPath:v9];
  if ([v8 count] || (objc_msgSend(a1, "allowsEmptyDataTypesSetForKeyPath:", v9) & 1) != 0)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      char v22 = a5;
      id v23 = v9;
      uint64_t v14 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __54___HKComparisonFilter_areValidTypes_forKeyPath_error___block_invoke;
          v24[3] = &unk_1E58C7568;
          v24[4] = v16;
          if ((objc_msgSend(v10, "hk_containsObjectPassingTest:", v24) & 1) == 0)
          {
            uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
            v19 = [v10 allObjects];
            v20 = [v19 componentsJoinedByString:@", "];
            objc_msgSend(v18, "hk_assignError:code:format:", v22, 3, @"'%@' not found in allowed data types classes (%@)", v16, v20);

            BOOL v17 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v17 = 1;
LABEL_13:
      id v9 = v23;
    }
    else
    {
      BOOL v17 = 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Filter requires at least one data type");
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a1 allowedValueClassesForKeyPath:v10];
  LOBYTE(a7) = [a1 _isValidValue:v11 forKeyPath:v10 allowedClases:v12 error:a7];

  return (char)a7;
}

- (void)configureInMemoryFilter
{
  if (atomic_exchange(&self->_hasBeenConfiguredFlag._Value, 1u))
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    v5 = NSStringFromSelector(a2);
    [v3 raise:v4, @"%@ has already been called for %@", v5, self format];
  }
  v6 = objc_opt_class();
  id v7 = [(_HKComparisonFilter *)self keyPath];
  self->_keyPathIntegerValue = [v6 enumRepresentationForKeyPath:v7];
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return a3 < 6;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 0;
}

+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3
{
  return 0;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  return -1;
}

+ (BOOL)_isValidValue:(id)a3 forKeyPath:(id)a4 allowedClases:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke;
  v33[3] = &unk_1E58C7568;
  id v13 = v10;
  id v34 = v13;
  if ((objc_msgSend(v12, "hk_containsObjectPassingTest:", v33) & 1) == 0)
  {
    objc_super v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = objc_opt_class();
    id v26 = v12;
    char v22 = @"%@ is not in the set of valid clases %@";
    id v23 = v21;
LABEL_16:
    objc_msgSend(v23, "hk_assignError:code:format:", a6, 3, v22, v25, v26);
    BOOL v20 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v20 = 1;
      goto LABEL_20;
    }
  }
  if (![v13 count] && (objc_msgSend(a1, "allowsEmptyContainerValuesForKeyPath:", v11) & 1) == 0)
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    char v22 = @"Filter does not support empty containers as values";
    goto LABEL_16;
  }
  id v27 = v11;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke_2;
        v28[3] = &unk_1E58C7568;
        v28[4] = v19;
        if ((objc_msgSend(v12, "hk_containsObjectPassingTest:", v28) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, @"%@ is not in the set of valid clases %@", objc_opt_class(), v12);

          BOOL v20 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 1;
LABEL_18:
  id v11 = v27;
LABEL_20:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_HKComparisonFilter *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v8 = [(NSString *)v5->_keyPath isEqualToString:self->_keyPath]
        && v5->_operatorType == self->_operatorType
        && ((id value = v5->_value, v7 = self->_value, value == v7) || v7 && objc_msgSend(value, "isEqual:"))
        && [(NSSet *)v5->_dataTypes isEqual:self->_dataTypes]
        && v5->_applicationSDKVersionToken == self->_applicationSDKVersionToken;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_operatorType ^ [(NSString *)self->_keyPath hash];
  uint64_t v4 = [self->_value hash];
  return v3 ^ v4 ^ [(NSSet *)self->_dataTypes hash] ^ self->_applicationSDKVersionToken;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKComparisonFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"operatorType"];
  id v7 = [(id)objc_opt_class() allowedValueClassesForKeyPath:v5];
  BOOL v8 = [v4 decodeObjectOfClasses:v7 forKey:@"value"];

  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dataTypes"];

  uint64_t v11 = [v4 decodeInt64ForKey:@"sdkVersionToken"];
  uint64_t v12 = HKBitPatternCastSignedToUnsignedInt64(v11);
  id v13 = [(id)objc_opt_class() _filterForKeyPath:v5 operatorType:v6 value:v8 dataTypes:v10 applicationSDKVersionToken:v12 isSubpredicate:0];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKComparisonFilter;
  id v4 = a3;
  [(_HKFilter *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyPath, @"keyPath", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_operatorType forKey:@"operatorType"];
  [v4 encodeObject:self->_value forKey:@"value"];
  [v4 encodeObject:self->_dataTypes forKey:@"dataTypes"];
  [v4 encodeInt64:self->_applicationSDKVersionToken forKey:@"sdkVersionToken"];
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (id)value
{
  return self->_value;
}

- (NSSet)dataTypes
{
  return self->_dataTypes;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (int64_t)keyPathIntegerValue
{
  return self->_keyPathIntegerValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypes, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return 0;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];

  return (id)[v3 set];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_3();
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];

  return (id)[v3 set];
}

@end