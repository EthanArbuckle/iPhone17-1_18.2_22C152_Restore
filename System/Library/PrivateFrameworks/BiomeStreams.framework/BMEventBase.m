@interface BMEventBase
+ (NSArray)columns;
+ (NSArray)propertyDefinitions;
+ (NSArray)protoFields;
+ (NSArray)validKeyPaths;
+ (id)convertValue:(id)a3 toType:(int64_t)a4;
- (BMEventBase)init;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isValidWithContext:(id)a3 error:(id *)a4;
- (NSArray)_validators;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)json;
- (id)jsonDictionary;
- (id)valueForKeyPath:(id)a3;
- (void)init;
- (void)json;
- (void)set_validators:(id)a3;
@end

@implementation BMEventBase

- (void).cxx_destruct
{
}

+ (id)convertValue:(id)a3 toType:(int64_t)a4
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    switch(a4)
    {
      case 0:
        id v9 = v7;
        goto LABEL_14;
      case 1:
        v11 = (void *)MEMORY[0x1E4F1C9C8];
        [v7 doubleValue];
        objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        v12 = (void *)MEMORY[0x1E4F1C9C8];
        [v7 doubleValue];
        objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));
          }
          else
          {
            v13 = [MEMORY[0x1E4F28B00] currentHandler];
            [v13 handleFailureInMethod:a2, a1, @"BMEventBase.m", 190, @"Unexpected UUID value: %@", v8 object file lineNumber description];

LABEL_13:
            id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
          }
        }
LABEL_14:
        a1 = v9;
        break;
      case 4:
        goto LABEL_13;
      default:
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"BMEventBase.m", 195, @"Unknown converted type: %ld", a4);

        break;
    }
  }
  else
  {
    a1 = 0;
  }

  return a1;
}

- (BMEventBase)init
{
  v5.receiver = self;
  v5.super_class = (Class)BMEventBase;
  v2 = [(BMEventBase *)&v5 init];
  if (v2 && [(BMEventBase *)v2 isMemberOfClass:objc_opt_class()])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[BMEventBase init]();
    }
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v5 = self->__validators;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        NSSelectorFromString(v4);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 valueForKey:v4];
          if (v11)
          {
            v12 = (void *)v11;

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)BMEventBase;
  v12 = [(BMEventBase *)&v14 valueForKeyPath:v4];
LABEL_12:

  return v12;
}

+ (NSArray)columns
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)propertyDefinitions
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)protoFields
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)validKeyPaths
{
  return (NSArray *)&unk_1EDDD76F0;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->__validators;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 |= objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isValidWithContext:error:", v6, a4, (void)v15) ^ 1;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
    char v13 = v10 ^ 1;
  }
  else
  {
    char v13 = 1;
  }

  return v13 & 1;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->__validators;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v10 |= objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "isCompleteWithContext:error:", v6, a4, (void)v15) ^ 1;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
    char v13 = v10 ^ 1;
  }
  else
  {
    char v13 = 1;
  }

  return v13 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->__validators;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)jsonDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)json
{
  v3 = [(BMEventBase *)self jsonDictionary];
  id v11 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v11];
  id v5 = v11;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v9 = v4;
  }
  else
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(BMEventBase *)(uint64_t)self json];
    }

    id v9 = 0;
  }

  return v9;
}

- (NSArray)_validators
{
  return self->__validators;
}

- (void)set_validators:(id)a3
{
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  int v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl(&dword_18E67D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Attempt to instantiate pure-virtual base class %@", (uint8_t *)&v2, 0xCu);
}

- (void)json
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_18E67D000, a3, OS_LOG_TYPE_ERROR, "Failed to serialize event %@ to JSON: %@", (uint8_t *)&v5, 0x16u);
}

@end