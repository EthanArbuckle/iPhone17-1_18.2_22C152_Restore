@interface BMResourceDescriptor
+ (BOOL)_validateInput:(id)a3 description:(id)a4 error:(id *)a5;
+ (BOOL)enumerateDescriptorsFromEncodedString:(id)a3 error:(id *)a4 usingBlock:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_illegalCharactersSet;
+ (id)descriptorsFromEncodedString:(id)a3 error:(id *)a4;
+ (id)encodedStringFromDescriptors:(id)a3 error:(id *)a4;
+ (id)sortedDescriptorsDetectingDuplicates:(id)a3 error:(id *)a4;
- (BMResourceDescriptor)initWithCoder:(id)a3;
- (BMResourceDescriptor)initWithEncodedString:(id)a3 error:(id *)a4;
- (BMResourceDescriptor)initWithKey:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)key;
- (NSString)value;
- (id)description;
- (id)encodedString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMResourceDescriptor

- (BMResourceDescriptor)initWithEncodedString:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 componentsSeparatedByString:@"="];
    if ([v7 count] == 2)
    {
      v8 = [v7 firstObject];
      v9 = [v7 lastObject];
      self = [(BMResourceDescriptor *)self initWithKey:v8 value:v9 error:a4];

      v10 = self;
      goto LABEL_10;
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v14 = [NSString stringWithFormat:@"Encoded string invalid: %@ (%@)", v6, v7];
    v23 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v16 = v18;
    uint64_t v17 = 3;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v12 = NSString;
    v13 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v13);
    v14 = [v12 stringWithFormat:@"Invalid class for encodedString - expected: %@ received: %@", v7, objc_opt_class()];
    v25[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v16 = v11;
    uint64_t v17 = 1;
  }
  v19 = [v16 errorWithDomain:@"BMResourceDescriptorError" code:v17 userInfo:v15];
  v20 = v19;
  if (a4 && v19) {
    *a4 = v19;
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (BMResourceDescriptor)initWithKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMResourceDescriptor;
  v11 = [(BMResourceDescriptor *)&v26 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v11->_key, a3);
  v13 = objc_opt_class();
  key = v12->_key;
  id v25 = 0;
  char v15 = [v13 _validateInput:key description:@"key" error:&v25];
  id v16 = v25;
  id v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (!a5 || !v16) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v12->_value, a4);
  v18 = objc_opt_class();
  value = v12->_value;
  id v24 = v17;
  char v20 = [v18 _validateInput:value description:@"value" error:&v24];
  id v21 = v24;

  if ((v20 & 1) == 0)
  {
    if (!a5)
    {
      id v17 = v21;
      goto LABEL_12;
    }
    id v17 = v21;
    if (!v21)
    {
LABEL_12:

      uint64_t v22 = 0;
      goto LABEL_13;
    }
LABEL_11:
    id v17 = v17;
    *a5 = v17;
    goto LABEL_12;
  }

LABEL_5:
  uint64_t v22 = v12;
LABEL_13:

  return v22;
}

+ (BOOL)_validateInput:(id)a3 description:(id)a4 error:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    char v20 = NSStringFromClass(v19);
    id v21 = [v18 stringWithFormat:@"Invalid class for %@ - expected: %@ received: %@", v9, v20, objc_opt_class()];
    v36[0] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v23 = [v17 errorWithDomain:@"BMResourceDescriptorError" code:1 userInfo:v22];
    id v24 = v23;
    if (a5 && v23) {
      *a5 = v23;
    }

    goto LABEL_17;
  }
  if (![v8 length])
  {
    id v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    char v20 = [NSString stringWithFormat:@"Invalid empty string for %@", v9];
    v34 = v20;
    objc_super v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = &v34;
    v28 = &v33;
LABEL_14:
    id v21 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    v29 = [v25 errorWithDomain:@"BMResourceDescriptorError" code:3 userInfo:v21];
    id v22 = v29;
    if (a5 && v29)
    {
      id v22 = v29;
      *a5 = v22;
    }
LABEL_17:

    BOOL v16 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = [v8 length];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = [v8 characterAtIndex:v12];
      v14 = [a1 _illegalCharactersSet];
      int v15 = [v14 characterIsMember:v13];

      if (v15) {
        break;
      }
      if (v11 == ++v12) {
        goto LABEL_7;
      }
    }
    id v25 = (void *)MEMORY[0x1E4F28C58];
    char v20 = [NSString stringWithFormat:@"Invalid %@: \"%@\" contains whitespace or separator character: '%c'", v9, v8, v13, *MEMORY[0x1E4F28568]];
    v32 = v20;
    objc_super v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = &v32;
    v28 = &v31;
    goto LABEL_14;
  }
LABEL_7:
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

+ (id)_illegalCharactersSet
{
  if (_illegalCharactersSet_onceToken != -1) {
    dispatch_once(&_illegalCharactersSet_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_illegalCharactersSet_characterSet;
  return v2;
}

- (NSString)key
{
  return self->_key;
}

+ (id)encodedStringFromDescriptors:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v18 stringWithFormat:@"Invalid class for descriptors - expected: %@ received: %@", v9, objc_opt_class()];
    v31[0] = v7;
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v21 = [v17 errorWithDomain:@"BMResourceDescriptorError" code:1 userInfo:v20];
    id v22 = v21;
    if (a4 && v21) {
      *a4 = v21;
    }

    BOOL v16 = 0;
    goto LABEL_17;
  }
  if ([v6 count])
  {
    id v28 = 0;
    id v7 = [a1 sortedDescriptorsDetectingDuplicates:v6 error:&v28];
    id v8 = v28;
    id v9 = v8;
    if (!v7 || v8)
    {
      BOOL v16 = 0;
      if (a4 && v8)
      {
        id v9 = v8;
        BOOL v16 = 0;
        *a4 = v9;
      }
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v7;
      uint64_t v11 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v7);
            }
            int v15 = [*(id *)(*((void *)&v24 + 1) + 8 * i) encodedString];
            [v10 addObject:v15];
          }
          uint64_t v12 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v12);
      }

      BOOL v16 = [v10 componentsJoinedByString:@"&"];
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v16 = &stru_1F0B3A038;
LABEL_18:

  return v16;
}

+ (id)sortedDescriptorsDetectingDuplicates:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__BMResourceDescriptor_sortedDescriptorsDetectingDuplicates_error___block_invoke;
  v14[3] = &unk_1E6023510;
  v14[4] = &v15;
  id v6 = [v5 sortedArrayUsingComparator:v14];
  if ([(id)v16[5] count])
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"Found descriptors with duplicate keys: %@", v16[5]];
    v22[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v10 = [v7 errorWithDomain:@"BMResourceDescriptorError" code:2 userInfo:v9];
    uint64_t v11 = v10;
    if (a4 && v10) {
      *a4 = v10;
    }

    id v12 = 0;
  }
  else
  {
    id v12 = v6;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (id)encodedString
{
  return (id)[NSString stringWithFormat:@"%@%@%@", self->_key, @"=", self->_value];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)descriptorsFromEncodedString:(id)a3 error:(id *)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__BMResourceDescriptor_descriptorsFromEncodedString_error___block_invoke;
  v12[3] = &unk_1E6023538;
  id v9 = v7;
  id v13 = v9;
  LODWORD(a4) = [v8 enumerateDescriptorsFromEncodedString:v6 error:a4 usingBlock:v12];

  if (a4) {
    uint64_t v10 = (void *)[v9 copy];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)enumerateDescriptorsFromEncodedString:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v11 = NSString;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"Invalid class for encodedString - expected: %@ received: %@", v13, objc_opt_class()];
    v28[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    BOOL v16 = [v10 errorWithDomain:@"BMResourceDescriptorError" code:1 userInfo:v15];
    id v9 = v16;
    if (a4 && v16) {
      *a4 = v16;
    }

    LOBYTE(v9) = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (([v7 isEqual:&stru_1F0B3A038] & 1) == 0)
  {
    [v7 componentsSeparatedByString:@"&"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
LABEL_10:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v14);
        }
        id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEncodedString:*(void *)(*((void *)&v22 + 1) + 8 * v20) error:a4];
        if (!v9) {
          break;
        }
        v8[2](v8, v9);

        if (v18 == ++v20)
        {
          uint64_t v18 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
          LOBYTE(v9) = 1;
          if (v18) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
    id v13 = v14;
    goto LABEL_19;
  }
  LOBYTE(v9) = 1;
LABEL_20:

  return (char)v9;
}

uint64_t __59__BMResourceDescriptor_descriptorsFromEncodedString_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (NSString)value
{
  return self->_value;
}

- (BMResourceDescriptor)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];

  if (v5)
  {
    id v15 = 0;
    id v6 = [(BMResourceDescriptor *)self initWithEncodedString:v5 error:&v15];
    id v7 = v15;
    id v8 = v6;
    self = v8;
    if (v8) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v11 = v8;
    }
    else
    {
      uint64_t v10 = __biome_log_for_category(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412802;
        uint64_t v17 = v14;
        __int16 v18 = 2112;
        uint64_t v19 = v5;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_1B30A0000, v10, OS_LOG_TYPE_ERROR, "%@ could not unarchive descriptor from encoded string: %@, error: %@", buf, 0x20u);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMResourceDescriptor *)self encodedString];
  [v4 encodeObject:v5 forKey:@"s"];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(BMResourceDescriptor *)self key];
  id v7 = [(BMResourceDescriptor *)self value];
  id v8 = (void *)[v3 initWithFormat:@"%@ - key: %@ value: %@", v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __67__BMResourceDescriptor_sortedDescriptorsDetectingDuplicates_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 key];
  id v8 = [v6 key];
  if ([v7 isEqual:v8])
  {
    BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v9 addObject:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  uint64_t v13 = [v7 compare:v8];

  return v13;
}

void __45__BMResourceDescriptor__illegalCharactersSet__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  [v2 addCharactersInString:@"="];
  [v2 addCharactersInString:@"&"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_illegalCharactersSet_characterSet;
  _illegalCharactersSet_characterSet = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMResourceDescriptor *)self key];
    id v7 = [v5 key];
    if ([v6 isEqual:v7])
    {
      id v8 = [(BMResourceDescriptor *)self value];
      BOOL v9 = [v5 value];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(BMResourceDescriptor *)self key];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMResourceDescriptor *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

@end