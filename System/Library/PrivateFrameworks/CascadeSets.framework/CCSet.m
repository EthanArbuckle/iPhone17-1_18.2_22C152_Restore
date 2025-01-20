@interface CCSet
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithKey:(id)a3 descriptors:(id)a4;
+ (id)serializedSetEnumerator:(id)a3;
+ (id)setEnumerator;
+ (id)setEnumeratorWithUseCase:(id)a3;
+ (id)setFromResourceSpecifier:(id)a3 inContainer:(id)a4 error:(id *)a5;
+ (id)setFromXPCDictionary:(id)a3 error:(id *)a4;
- (BMAccount)account;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isInUserVault;
- (CCSet)init;
- (CCSet)initWithCoder:(id)a3;
- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 descriptors:(id)a5 options:(unsigned __int8)a6 error:(id *)a7;
- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 encodedDescriptors:(id)a5 descriptors:(id)a6 options:(unsigned __int8)a7 error:(id *)a8;
- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 encodedDescriptors:(id)a5 options:(unsigned __int8)a6 error:(id *)a7;
- (NSArray)descriptors;
- (NSNumber)uniqueHash;
- (NSString)encodedDescriptors;
- (NSString)personaIdentifier;
- (id)_computeUniqueHash;
- (id)changePublisher;
- (id)changePublisherWithUseCase:(id)a3;
- (id)description;
- (id)descriptorWithKey:(id)a3;
- (id)prefixedInstanceIdentifier:(id)a3;
- (id)prefixedSharedIdentifier:(id)a3;
- (id)serializeWithUseCase:(id)a3 enumerateToBookmark:(id)a4 error:(id *)a5;
- (id)serializeWithUseCase:(id)a3 error:(id *)a4;
- (id)toResourceSpecifier;
- (id)toXPCDictionary;
- (unint64_t)hash;
- (unsigned)itemType;
- (unsigned)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCSet

- (id)toResourceSpecifier
{
  v3 = CCTypeIdentifierRegistryBridge();
  v4 = [v3 setIdentifierForItemType:self->_itemType];

  v5 = (void *)[objc_alloc(MEMORY[0x263F29E98]) initWithType:4 name:v4 descriptors:self->_descriptors options:self->_options];

  return v5;
}

+ (id)setFromResourceSpecifier:(id)a3 inContainer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = CCTypeIdentifierRegistryBridge();
  v10 = [v7 name];
  uint64_t v11 = [v9 itemTypeForSetIdentifier:v10];

  if (v11 == (unsigned __int16)CCTypeIdentifierUnknown)
  {
    v12 = CCInvalidSetItemTypeIdentifierErrorForIdentifier(v11);
    CCSetError(a5, v12);
  }
  else
  {
    v13 = [v7 descriptors];
    v12 = +[CCSetDescriptor setDescriptorsFromResourceDescriptors:v13 error:a5];

    if (v12)
    {
      int v14 = [v7 options];
      uint64_t v15 = v14 | [v8 isInUserVault];
      id v16 = objc_alloc((Class)objc_opt_class());
      v17 = [v8 personaIdentifier];
      v18 = (void *)[v16 initWithItemType:v11 personaIdentifier:v17 descriptors:v12 options:v15 error:a5];

      goto LABEL_6;
    }
  }
  v18 = 0;
LABEL_6:

  return v18;
}

- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 descriptors:(id)a5 options:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  uint64_t v10 = a3;
  id v12 = a4;
  id v13 = a5;
  int v14 = +[BMResourceDescriptor encodedStringFromDescriptors:v13 error:a7];
  if (v14)
  {
    self = [(CCSet *)self initWithItemType:v10 personaIdentifier:v12 encodedDescriptors:v14 descriptors:v13 options:v8 error:a7];
    uint64_t v15 = self;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 encodedDescriptors:(id)a5 descriptors:(id)a6 options:(unsigned __int8)a7 error:(id *)a8
{
  v32 = a8;
  uint64_t v12 = a3;
  id v33 = a4;
  id v14 = a5;
  id v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)CCSet;
  id v16 = [(CCSet *)&v34 init];
  v17 = v16;
  if (v16)
  {
    v16->_itemType = v12;
    v18 = objc_msgSend((id)objc_opt_class(), "descriptorWithKey:descriptors:", 0x26FDC1258, v15, v32, v33);
    v19 = [v18 value];

    if (v19)
    {
      uint64_t v20 = [objc_alloc(MEMORY[0x263F29E60]) initWithAccountIdentifier:v19];
      account = v17->_account;
      v17->_account = (BMAccount *)v20;
    }
    objc_storeStrong((id *)&v17->_descriptors, a6);
    objc_storeStrong((id *)&v17->_encodedDescriptors, a5);
    objc_storeStrong((id *)&v17->_personaIdentifier, a4);
    v17->_options = a7;
    uint64_t v22 = [(CCSet *)v17 _computeUniqueHash];
    uniqueHash = v17->_uniqueHash;
    v17->_uniqueHash = (NSNumber *)v22;
  }
  v24 = CCTypeIdentifierRegistryBridge();
  char v25 = [v24 isValidItemType:v12];

  if ((v25 & 1) != 0
    && (CCTypeIdentifierRegistryBridge(),
        v26 = objc_claimAutoreleasedReturnValue(),
        [v26 setIdentifierForItemType:v12],
        v27 = objc_claimAutoreleasedReturnValue(),
        uint64_t v28 = [v27 length],
        v27,
        v26,
        v28))
  {
    v29 = v17;
  }
  else
  {
    v30 = CCInvalidSetItemTypeIdentifierErrorForIdentifier(v12);
    CCSetError(v32, v30);

    v29 = 0;
  }

  return v29;
}

- (unsigned)itemType
{
  return self->_itemType;
}

- (id)descriptorWithKey:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() descriptorWithKey:v4 descriptors:self->_descriptors];

  return v5;
}

+ (id)descriptorWithKey:(id)a3 descriptors:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "key", (void)v14);
        char v12 = [v11 isEqual:v5];

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

- (id)_computeUniqueHash
{
  v3 = objc_opt_new();
  [v3 appendBytes:&self->_itemType length:2];
  id v4 = [(NSString *)self->_encodedDescriptors dataUsingEncoding:4];
  [v3 appendData:v4];

  personaIdentifier = self->_personaIdentifier;
  if (personaIdentifier)
  {
    id v6 = [(NSString *)personaIdentifier dataUsingEncoding:4];
    [v3 appendData:v6];
  }
  int options = self->_options;
  p_int options = &self->_options;
  if (options) {
    [v3 appendBytes:p_options length:1];
  }
  v9 = CCHash64(v3);

  return v9;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_storeStrong((id *)&self->_uniqueHash, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

+ (id)setEnumerator
{
  return (id)[a1 setEnumeratorWithUseCase:*MEMORY[0x263F29E28]];
}

+ (id)setEnumeratorWithUseCase:(id)a3
{
  return +[CCDatabaseSetEnumerator defaultEnumeratorWithUseCase:a3];
}

+ (id)serializedSetEnumerator:(id)a3
{
  id v3 = a3;
  id v4 = [[CCSerializedSetEnumerator alloc] initWithSerializedSetData:v3];

  return v4;
}

- (CCSet)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSet)initWithItemType:(unsigned __int16)a3 personaIdentifier:(id)a4 encodedDescriptors:(id)a5 options:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  uint64_t v10 = a3;
  id v12 = a4;
  id v13 = a5;
  long long v14 = +[BMResourceDescriptor descriptorsFromEncodedString:v13 error:a7];
  if (v14)
  {
    self = [(CCSet *)self initWithItemType:v10 personaIdentifier:v12 encodedDescriptors:v13 descriptors:v14 options:v8 error:a7];
    long long v15 = self;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)prefixedSharedIdentifier:(id)a3
{
  uniqueHash = self->_uniqueHash;
  id v4 = [a3 sharedIdentifier];
  id v5 = CCConcatenateHash64(uniqueHash, v4);

  return v5;
}

- (id)prefixedInstanceIdentifier:(id)a3
{
  uniqueHash = self->_uniqueHash;
  id v4 = [a3 instanceIdentifier];
  id v5 = CCConcatenateHash64(uniqueHash, v4);

  return v5;
}

- (id)changePublisher
{
  return [(CCSet *)self changePublisherWithUseCase:*MEMORY[0x263F29E28]];
}

- (id)changePublisherWithUseCase:(id)a3
{
  return +[CCSetChangePublisher publisherForSet:self useCase:a3];
}

- (id)serializeWithUseCase:(id)a3 error:(id *)a4
{
  return [(CCSet *)self serializeWithUseCase:a3 enumerateToBookmark:0 error:a4];
}

- (id)serializeWithUseCase:(id)a3 enumerateToBookmark:(id)a4 error:(id *)a5
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = self;
  }
  else {
    uint64_t v8 = [[CCSerializedSet alloc] initWithSet:self useCase:v7 error:a5];
  }
  v9 = v8;

  return v9;
}

- (BOOL)isInUserVault
{
  return self->_options & 1;
}

- (id)description
{
  if ([(NSString *)self->_encodedDescriptors length])
  {
    id v3 = [NSString stringWithFormat:@" [%@]", self->_encodedDescriptors];
  }
  else
  {
    id v3 = &stru_26FDBF2B8;
  }
  if (self->_personaIdentifier)
  {
    id v4 = [NSString stringWithFormat:@" persona: %@", self->_personaIdentifier];
  }
  else
  {
    id v4 = &stru_26FDBF2B8;
  }
  if (self->_options)
  {
    id v5 = NSString;
    id v6 = BMResourceOptionsDescription();
    id v7 = [v5 stringWithFormat:@" options: %@", v6];
  }
  else
  {
    id v7 = &stru_26FDBF2B8;
  }
  uint64_t v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v11 = CCTypeIdentifierRegistryBridge();
  id v12 = [v11 setIdentifierForItemType:self->_itemType];
  id v13 = [v8 stringWithFormat:@"{%@: %@%@%@%@}", v10, v12, v3, v4, v7];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCSet *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCSet *)self isEqualToSet:v5];

  return v6;
}

- (BOOL)isEqualToSet:(id)a3
{
  return [(NSNumber *)self->_uniqueHash isEqual:*((void *)a3 + 5)];
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_uniqueHash unsignedLongLongValue];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CCSet)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"t"];
  if (v5 == (unsigned __int16)CCTypeIdentifierUnknown)
  {
    BOOL v6 = 0;
  }
  else
  {
    unsigned __int16 v7 = v5;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    if (v8)
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
      id v13 = 0;
      uint64_t v10 = -[CCSet initWithItemType:personaIdentifier:encodedDescriptors:options:error:](self, "initWithItemType:personaIdentifier:encodedDescriptors:options:error:", v7, v9, v8, [v4 decodeInt32ForKey:@"o"], &v13);
      id v11 = v13;
      if (!v10) {
        [v4 failWithError:v11];
      }
      self = v10;

      BOOL v6 = self;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t itemType = self->_itemType;
  id v5 = a3;
  [v5 encodeInteger:itemType forKey:@"t"];
  [v5 encodeObject:self->_encodedDescriptors forKey:@"d"];
  [v5 encodeObject:self->_personaIdentifier forKey:@"p"];
  [v5 encodeInt32:self->_options forKey:@"o"];
}

+ (id)setFromXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int16 uint64 = xpc_dictionary_get_uint64(v5, (const char *)[@"t" UTF8String]);
  unsigned __int16 v7 = _NSStringFromXPCDictionary(v5, (const char *)[@"d" UTF8String]);
  uint64_t v8 = _NSStringFromXPCDictionary(v5, (const char *)[@"p" UTF8String]);
  unsigned __int8 v9 = xpc_dictionary_get_uint64(v5, (const char *)[@"o" UTF8String]);

  uint64_t v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithItemType:uint64 personaIdentifier:v8 encodedDescriptors:v7 options:v9 error:a4];

  return v10;
}

- (id)toXPCDictionary
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, (const char *)[@"t" UTF8String], self->_itemType);
  xpc_dictionary_set_string(empty, (const char *)[@"d" UTF8String], -[NSString UTF8String](self->_encodedDescriptors, "UTF8String"));
  if (self->_personaIdentifier) {
    xpc_dictionary_set_string(empty, (const char *)[@"p" UTF8String], -[NSString UTF8String](self->_personaIdentifier, "UTF8String"));
  }
  if (self->_options) {
    xpc_dictionary_set_uint64(empty, (const char *)[@"o" UTF8String], self->_options);
  }

  return empty;
}

- (BMAccount)account
{
  return self->_account;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (NSNumber)uniqueHash
{
  return self->_uniqueHash;
}

- (NSString)encodedDescriptors
{
  return self->_encodedDescriptors;
}

- (unsigned)options
{
  return self->_options;
}

@end