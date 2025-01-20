@interface CHSIntentReference
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (CHSIntentReference)new;
+ (id)_decodeFromOPACK:(id)a3 error:(id *)a4;
+ (id)_encodeToOPACK:(id)a3 error:(id *)a4;
+ (id)_schemaDataFromIntent:(id)a3 error:(id *)a4;
- (BOOL)_isPartial;
- (BOOL)_isSchemaSeparated;
- (BOOL)isEqual:(id)a3;
- (CHSIntentReference)init;
- (CHSIntentReference)initWithBSXPCCoder:(id)a3;
- (CHSIntentReference)initWithCoder:(id)a3;
- (CHSIntentReference)initWithIntent:(id)a3;
- (CHSIntentReference)initWithIntent:(id)a3 schemaData:(id)a4;
- (CHSIntentReference)initWithIntentData:(id)a3 configData:(id)a4 schemaData:(id)a5 stableHash:(int64_t)a6;
- (INIntent)intent;
- (NSData)_intentData;
- (NSData)_partialConfigData;
- (NSData)_partialSchemaData;
- (NSString)description;
- (id)_copyFillingInSchema:(id)a3;
- (id)_copyWithoutSchemaDataIfNecessary;
- (id)_initWithGenericIntent:(id)a3 schemaData:(id)a4;
- (id)_initWithIntentInMemoryOnly:(id)a3;
- (id)_typedIntent;
- (int64_t)stableHash;
- (unint64_t)hash;
- (void)_setPartialSchemaData:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSIntentReference

+ (CHSIntentReference)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSIntentReference.m" lineNumber:35 description:@"+[CHSIntentReference new] is unavailable."];

  return 0;
}

- (CHSIntentReference)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:40 description:@"-[CHSIntentReference init] is unavailable."];

  return 0;
}

- (id)_initWithIntentInMemoryOnly:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSIntentReference;
  v6 = [(CHSIntentReference *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inMemoryIntent, a3);
    v7->_stableHash = [v5 _indexingHash];
  }

  return v7;
}

- (CHSIntentReference)initWithIntent:(id)a3
{
  v4 = _genericiseIntent(a3);
  id v5 = [(CHSIntentReference *)self _initWithGenericIntent:v4 schemaData:0];

  return v5;
}

- (CHSIntentReference)initWithIntent:(id)a3 schemaData:(id)a4
{
  id v6 = a4;
  v7 = _genericiseIntent(a3);
  v8 = [(CHSIntentReference *)self _initWithGenericIntent:v7 schemaData:v6];

  return v8;
}

- (id)_initWithGenericIntent:(id)a3 schemaData:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 _indexingHash];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v19 = 0;
      uint64_t v11 = [v6 _backingStoreData];
      v12 = (void *)v11;
      if (v11)
      {
        v13 = MEMORY[0x192FD6CE0](v11, 0, &v19);
        if (!v19)
        {
          self = [(CHSIntentReference *)self initWithIntentData:0 configData:v13 schemaData:v7 stableHash:v8];
          v10 = self;
          goto LABEL_16;
        }
        v14 = CHSLogChronoServices();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [MEMORY[0x1E4F28ED0] numberWithInt:v19];
          -[CHSIntentReference _initWithGenericIntent:schemaData:](v15, buf, v14);
        }
      }
      else
      {
        v13 = CHSLogChronoServices();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v16 = (objc_class *)objc_opt_class();
          v17 = NSStringFromClass(v16);
          [(CHSIntentReference *)v17 _initWithGenericIntent:buf schemaData:v13];
        }
      }
      v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
  }
  objc_super v9 = _intentDataFromIntent((uint64_t)v6);
  if (v9)
  {
    self = [(CHSIntentReference *)self initWithIntentData:v9 configData:0 schemaData:0 stableHash:v8];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

LABEL_17:
  return v10;
}

- (CHSIntentReference)initWithIntentData:(id)a3 configData:(id)a4 schemaData:(id)a5 stableHash:(int64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (v12)
  {
    if (v13)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:91 description:@"Can't specify split intent data along with unified intent data"];

      if (!v15) {
        goto LABEL_6;
      }
    }
    else if (!v14)
    {
      goto LABEL_6;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:92 description:@"Can't specify split condif data along with unified intent data"];
  }
  else
  {
    if (v13) {
      goto LABEL_6;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:94 description:@"Must specify partial config data if not specifying unified intent data"];
  }

LABEL_6:
  v21.receiver = self;
  v21.super_class = (Class)CHSIntentReference;
  v17 = [(CHSIntentReference *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_stableHash = a6;
    objc_storeStrong((id *)&v17->_intentData, a3);
    objc_storeStrong((id *)&v18->_partialConfigData, a4);
    objc_storeStrong((id *)&v18->_partialSchemaData, a5);
  }

  return v18;
}

- (INIntent)intent
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  inMemoryIntent = self->_inMemoryIntent;
  if (inMemoryIntent)
  {
    v3 = inMemoryIntent;
    goto LABEL_23;
  }
  intentData = self->_intentData;
  if (!intentData)
  {
    if (!self->_partialConfigData)
    {
      v3 = 0;
      goto LABEL_23;
    }
    if (!self->_partialSchemaData)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:126 description:@"Cannot rehydrate a partialized intent with missing schema data."];
    }
    int v20 = 0;
    uint64_t v8 = (void *)OPACKDecodeData();
    objc_super v9 = (void *)OPACKDecodeData();
    id v19 = 0;
    v10 = [MEMORY[0x1E4F304D0] makeFromWidgetPlistableRepresentation:v8 error:&v19];
    id v11 = v19;
    if (v11)
    {
      id v12 = v11;
      id v13 = CHSLogChronoServices();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v12;
        _os_log_impl(&dword_190C6F000, v13, OS_LOG_TYPE_DEFAULT, "Error decoding partialized schema intent: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v18 = 0;
      id v13 = [v10 _copyApplyingNewBackingStoreData:v9 error:&v18];
      id v12 = v18;
      if (!v12)
      {
        id v13 = v13;
        v3 = (INIntent *)v13;
        goto LABEL_22;
      }
      id v14 = CHSLogChronoServices();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v12;
        _os_log_impl(&dword_190C6F000, v14, OS_LOG_TYPE_DEFAULT, "Error decoding partialized intent: %{public}@", buf, 0xCu);
      }
    }
    v3 = 0;
LABEL_22:

    goto LABEL_23;
  }
  id v21 = 0;
  v3 = +[CHSIntentReference _decodeFromOPACK:intentData error:&v21];
  id v6 = v21;
  if (v6)
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "Error decoding intent: %{public}@", buf, 0xCu);
    }
  }
LABEL_23:
  return v3;
}

- (BOOL)_isPartial
{
  return self->_partialConfigData && self->_partialSchemaData == 0;
}

- (BOOL)_isSchemaSeparated
{
  return self->_partialConfigData != 0;
}

- (id)_copyFillingInSchema:(id)a3
{
  v4 = (NSData *)a3;
  id v5 = v4;
  if (self->_partialConfigData)
  {
    if (self->_partialSchemaData == v4) {
      id v6 = self;
    }
    else {
      id v6 = [[CHSIntentReference alloc] initWithIntentData:0 configData:self->_partialConfigData schemaData:v4 stableHash:self->_stableHash];
    }
    objc_super v9 = v6;
  }
  else
  {
    id v7 = [CHSIntentReference alloc];
    uint64_t v8 = [(CHSIntentReference *)self intent];
    objc_super v9 = [(CHSIntentReference *)v7 initWithIntent:v8 schemaData:v5];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSIntentReference *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (self->_stableHash == v5->_stableHash
        && (NSUInteger v6 = [(NSData *)self->_intentData length], v6 == [(NSData *)v5->_intentData length])
        && (NSUInteger v7 = [(NSData *)self->_partialConfigData length],
            v7 == [(NSData *)v5->_partialConfigData length]))
      {
        char v8 = BSEqualObjects();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSData *)self->_intentData length];
  NSUInteger v4 = v3 + [(NSData *)self->_partialConfigData length];
  return v4 + [(INIntent *)self->_inMemoryIntent hash] + 19;
}

- (id)_copyWithoutSchemaDataIfNecessary
{
  if (self->_partialSchemaData)
  {
    v2 = [CHSIntentReference alloc];
    intentData = self->_intentData;
    partialConfigData = self->_partialConfigData;
    int64_t stableHash = self->_stableHash;
    return [(CHSIntentReference *)v2 initWithIntentData:intentData configData:partialConfigData schemaData:0 stableHash:stableHash];
  }
  else
  {
    return self;
  }
}

+ (id)_schemaDataFromIntent:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = 0;
LABEL_4:
    id v6 = v6;
    id v7 = 0;
    char v8 = v6;
    goto LABEL_5;
  }
  id v20 = 0;
  v10 = (void *)[v5 _copyWithoutBackingStoreData:&v20];
  id v11 = v20;
  id v19 = v11;
  id v12 = [v10 widgetPlistableRepresentation:&v19];
  id v7 = v19;

  id v6 = 0;
  if (!v7 && v12)
  {
    *(_DWORD *)buf = 0;
    id v6 = (id)MEMORY[0x192FD6CE0](v12, 0, buf);
    if (*(_DWORD *)buf)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      id v14 = NSString;
      v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
      v16 = [v14 stringWithFormat:@"Unable to encode intent schema: %@", v15];
      v24[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      id v7 = [v13 errorWithDomain:@"CHSErrorDomain" code:6 userInfo:v17];
    }
    else
    {
      id v7 = 0;
    }
  }

  if (!v7) {
    goto LABEL_4;
  }
  id v18 = CHSLogChronoServices();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_190C6F000, v18, OS_LOG_TYPE_DEFAULT, "Error extracting schema from intent: %{public}@", buf, 0xCu);
  }

  if (a4)
  {
    id v7 = v7;
    char v8 = 0;
    *a4 = v7;
  }
  else
  {
    char v8 = 0;
  }
LABEL_5:

  return v8;
}

- (id)_typedIntent
{
  v2 = [(CHSIntentReference *)self intent];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v2;
    }
    else
    {
      INTypedIntentWithIntent();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    NSUInteger v4 = v3;
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CHSIntentReference_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __51__CHSIntentReference_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendPointer:*(void *)(a1 + 40) withName:@"CHSIntentReference"];
  return (id)[*(id *)(a1 + 32) appendInt64:*(void *)(*(void *)(a1 + 40) + 16) withName:@"hash"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (self->_inMemoryIntent)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:298 description:@"Cannot encode an in-memory representation of an intent."];
  }
  id v5 = _unifiedIntentDataIfPossible(self);
  if (v5) {
    partialConfigData = 0;
  }
  else {
    partialConfigData = self->_partialConfigData;
  }
  id v7 = partialConfigData;
  [v9 encodeInt64:self->_stableHash forKey:@"stableHash"];
  if (v5) {
    [v9 encodeObject:v5 forKey:@"idata"];
  }
  if (v7) {
    [v9 encodeObject:v7 forKey:@"pcdata"];
  }
}

- (CHSIntentReference)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (CHSIntentReference *)[v4 decodeInt64ForKey:@"stableHash"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idata"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pcdata"];
  if (v5)
  {
    self = [(CHSIntentReference *)self initWithIntentData:v6 configData:v7 schemaData:0 stableHash:v5];
    id v5 = self;
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v9 = a3;
  if (self->_inMemoryIntent)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CHSIntentReference.m" lineNumber:329 description:@"Cannot encode an in-memory representation of an intent."];
  }
  id v5 = _unifiedIntentDataIfPossible(self);
  if (v5) {
    partialConfigData = 0;
  }
  else {
    partialConfigData = self->_partialConfigData;
  }
  id v7 = partialConfigData;
  [v9 encodeInt64:self->_stableHash forKey:@"stableHash"];
  if (v5) {
    [v9 encodeObject:v5 forKey:@"idata"];
  }
  if (v7) {
    [v9 encodeObject:v7 forKey:@"pcdata"];
  }
}

- (CHSIntentReference)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = (CHSIntentReference *)[v4 decodeInt64ForKey:@"stableHash"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idata"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pcdata"];
  if (v5)
  {
    self = [(CHSIntentReference *)self initWithIntentData:v6 configData:v7 schemaData:0 stableHash:v5];
    id v5 = self;
  }

  return v5;
}

+ (id)_encodeToOPACK:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v15 = 0;
  id v6 = [v5 widgetPlistableRepresentation:&v15];
  id v7 = v15;
  char v8 = (void *)[v6 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isAppIntent"];
  }
  if (v8)
  {
    int v14 = 0;
    id v9 = (void *)MEMORY[0x192FD6CE0](v8, 0, &v14);
    id v10 = v9;
    if (!v14)
    {
      id v10 = v9;
      id v12 = v10;
      goto LABEL_11;
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CHSErrorDomain" code:6 userInfo:0];

    id v7 = (id)v11;
  }
  else
  {
    id v10 = 0;
  }
  id v12 = 0;
  if (a4 && v7)
  {
    id v7 = v7;
    id v12 = 0;
    *a4 = v7;
  }
LABEL_11:

  return v12;
}

+ (id)_decodeFromOPACK:(id)a3 error:(id *)a4
{
  int v12 = 0;
  id v5 = (void *)OPACKDecodeData();
  id v6 = [v5 objectForKeyedSubscript:@"isAppIntent"];
  [v6 BOOLValue];

  if (v5)
  {
    id v11 = 0;
    id v7 = [(id)objc_opt_class() makeFromWidgetPlistableRepresentation:v5 error:&v11];
    id v8 = v11;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CHSErrorDomain" code:6 userInfo:0];
    id v8 = v9;
    id v7 = 0;
    if (a4 && v9)
    {
      id v8 = v9;
      id v7 = 0;
      *a4 = v8;
    }
  }

  return v7;
}

- (int64_t)stableHash
{
  return self->_stableHash;
}

- (NSData)_partialSchemaData
{
  return self->_partialSchemaData;
}

- (void)_setPartialSchemaData:(id)a3
{
}

- (NSData)_partialConfigData
{
  return self->_partialConfigData;
}

- (NSData)_intentData
{
  return self->_intentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSchemaData, 0);
  objc_storeStrong((id *)&self->_partialConfigData, 0);
  objc_storeStrong((id *)&self->_intentData, 0);
  objc_storeStrong((id *)&self->_inMemoryIntent, 0);
}

- (void)_initWithGenericIntent:(uint8_t *)buf schemaData:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543619;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2113;
  *(void *)(buf + 14) = a2;
}

- (void)_initWithGenericIntent:(os_log_t)log schemaData:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Error encoding intent backing store data: %{public}@", buf, 0xCu);
}

@end