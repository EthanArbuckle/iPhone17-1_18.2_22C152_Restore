@interface CCItemMessage
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)contentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (id)metaContentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 forParentField:(id)a4 isRepeatedSubMessage:(BOOL)a5 repeatedSubMessageIndex:(unsigned int)a6 usingBlock:(id)a7;
- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 usingBlock:(id)a4;
- (CCItemMessage)initWithData:(id)a3 error:(id *)a4;
- (CCItemMessage)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSData)innerData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)hash;
@end

@implementation CCItemMessage

- (void).cxx_destruct
{
}

- (CCItemMessage)initWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([(CCItemMessage *)self isMemberOfClass:objc_opt_class()]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Cannot use base classes directly. Please use CCItemMessage"];
  }
  id v22 = 0;
  BOOL v8 = CCValidateNonNilField(@"data", (uint64_t)v7, &v22);
  id v9 = v22;
  if (!v8)
  {
    CCSetError(a4, v9);

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  v10 = (objc_class *)objc_opt_class();
  id v21 = v9;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass(@"data", v7, v10, &v21);
  id v12 = v21;

  if ((IsInstanceOfExpectedClass & 1) == 0)
  {
    CCSetError(a4, v12);

    goto LABEL_13;
  }
  v20.receiver = self;
  v20.super_class = (Class)CCItemMessage;
  v13 = [(CCItemMessage *)&v20 init];
  self = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_innerData, a3);
  }
  innerData = self->_innerData;
  id v19 = v12;
  BOOL v15 = [(CCItemMessage *)self initializeFieldValuesFromData:innerData error:&v19];
  id v16 = v19;

  if (!v15 || v16)
  {
    CCSetError(a4, v16);

    goto LABEL_13;
  }
  self = self;
  v17 = self;
LABEL_14:

  return v17;
}

- (NSData)innerData
{
  return self->_innerData;
}

+ (id)contentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v7 = a4;
  BOOL v8 = CCTypeIdentifierRegistryBridge();
  id v9 = (void *)[v8 itemMessageSubclassForItemType:v6];

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "contentMessageClass")), "initWithData:error:", v7, a5);
  }
  else
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Provided item type %hu is not a valid item identifier", v6);
    id v12 = CCUnrecognizedIdentifierErrorForDescription(v11);
    CCSetError(a5, v12);

    v10 = 0;
  }

  return v10;
}

+ (id)metaContentMessageForItemType:(unsigned __int16)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v7 = a4;
  BOOL v8 = CCTypeIdentifierRegistryBridge();
  id v9 = (void *)[v8 itemMessageSubclassForItemType:v6];

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "metaContentMessageClass")), "initWithData:error:", v7, a5);
  }
  else
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"Provided item type %hu is not a valid item identifier", v6);
    id v12 = CCUnrecognizedIdentifierErrorForDescription(v11);
    CCSetError(a5, v12);

    v10 = 0;
  }

  return v10;
}

+ (unsigned)itemType
{
  return CCTypeIdentifierUnknown;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (Class)contentMessageClass
{
  return 0;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 usingBlock:(id)a4
{
  return [(CCItemMessage *)self recursivelyEnumerateFieldsWithError:a3 forParentField:0 isRepeatedSubMessage:0 repeatedSubMessageIndex:0 usingBlock:a4];
}

- (BOOL)recursivelyEnumerateFieldsWithError:(id *)a3 forParentField:(id)a4 isRepeatedSubMessage:(BOOL)a5 repeatedSubMessageIndex:(unsigned int)a6 usingBlock:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9;
  v30 = __Block_byref_object_dispose__9;
  id v31 = 0;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  objc_super v20 = __124__CCItemMessage_recursivelyEnumerateFieldsWithError_forParentField_isRepeatedSubMessage_repeatedSubMessageIndex_usingBlock___block_invoke;
  id v21 = &unk_26527AA48;
  id v13 = v11;
  unsigned int v25 = a6;
  id v22 = v13;
  v24 = &v26;
  id v14 = v12;
  id v23 = v14;
  BOOL v15 = (void *)MEMORY[0x24C5B1320](&v18);
  -[CCItemMessage enumerateFieldsUsingBlock:parentFieldType:](self, "enumerateFieldsUsingBlock:parentFieldType:", v15, objc_msgSend(v13, "fieldType", v18, v19, v20, v21));
  if (a3) {
    *a3 = (id) v27[5];
  }
  BOOL v16 = v27[5] == 0;

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __124__CCItemMessage_recursivelyEnumerateFieldsWithError_forParentField_isRepeatedSubMessage_repeatedSubMessageIndex_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [v3 setParentMessageField:*(void *)(a1 + 32)];
  [v3 setRepeatedSubMessageIndex:*(unsigned int *)(a1 + 56)];
  if ([v3 dataType] == 18)
  {
    v4 = [v3 subMessageValueNoCopy];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v6 + 40);
    [v4 recursivelyEnumerateFieldsWithError:&obj forParentField:v3 isRepeatedSubMessage:0 repeatedSubMessageIndex:0 usingBlock:v5];
    objc_storeStrong((id *)(v6 + 40), obj);
LABEL_11:

    goto LABEL_12;
  }
  if ([v3 dataType] == 19)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v4 = [v3 repeatedSubMessageValueNoCopy];
    uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v4);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = *(void *)(a1 + 40);
          uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
          id v21 = *(id *)(v14 + 40);
          [v12 recursivelyEnumerateFieldsWithError:&v21 forParentField:v3 isRepeatedSubMessage:1 repeatedSubMessageIndex:v9 + v11 usingBlock:v13];
          objc_storeStrong((id *)(v14 + 40), v21);
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v9 = (v9 + v11);
      }
      while (v8);
    }
    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v15 = [v3 error];

  if (v15)
  {
    BOOL v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v17 = [v3 error];
    uint64_t v18 = CCErrorByJoiningMismatchedFieldAccessorErrorUnderlyingErrors(v16, v17);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    objc_super v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
LABEL_12:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CCItemMessage *)self data];
    uint64_t v7 = [v5 data];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      uint64_t v8 = [(CCItemMessage *)self data];
      uint64_t v9 = [v5 data];
      char v10 = [v8 isEqualToData:v9];
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
  v2 = [(CCItemMessage *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  id v2 = [NSString alloc];
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)[v2 initWithFormat:@"%@ - itemType: %hu", v4, objc_msgSend((id)objc_opt_class(), "itemType")];

  return v5;
}

- (id)jsonDictionary
{
  id v2 = objc_opt_new();

  return v2;
}

- (CCItemMessage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = (void *)[(NSData *)self->_innerData copy];
  uint64_t v6 = (void *)[v4 initWithData:v5 error:0];

  return v6;
}

@end