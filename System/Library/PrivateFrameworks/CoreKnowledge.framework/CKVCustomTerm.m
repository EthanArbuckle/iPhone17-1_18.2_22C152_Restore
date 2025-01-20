@interface CKVCustomTerm
+ (BOOL)supportsSecureCoding;
+ (id)customTermFromItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCustomTerm:(id)a3;
- (CKVCustomTerm)init;
- (CKVCustomTerm)initWithCoder:(id)a3;
- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5;
- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5 vocabularyId:(id)a6;
- (NSString)description;
- (NSString)itemId;
- (NSString)term;
- (NSString)vocabularyId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)toItemWithError:(id *)a3;
- (unint64_t)hash;
- (unsigned)vocabularyType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVCustomTerm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyId, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

- (NSString)vocabularyId
{
  return self->_vocabularyId;
}

- (NSString)term
{
  return self->_term;
}

- (unsigned)vocabularyType
{
  return self->_vocabularyType;
}

- (NSString)itemId
{
  return self->_itemId;
}

- (id)toItemWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F71FF8]);
  int v6 = [(CKVCustomTerm *)self vocabularyType];
  v7 = [(CKVCustomTerm *)self itemId];
  uint64_t v8 = [v5 setItemType:1 itemId:v7 error:a3];
  if (!v8) {
    goto LABEL_6;
  }
  v9 = (void *)v8;
  uint64_t v10 = CKVCustomTypeToFieldType(v6);
  v11 = [(CKVCustomTerm *)self term];
  uint64_t v12 = [v5 addFieldWithType:v10 value:v11 error:a3];
  if (!v12)
  {

LABEL_6:
    goto LABEL_7;
  }
  v13 = (void *)v12;
  v14 = [(CKVCustomTerm *)self vocabularyId];
  v15 = [v5 addFieldWithType:20 value:v14 error:a3];

  if (v15)
  {
    v16 = [v5 buildItemWithError:a3];
    goto LABEL_8;
  }
LABEL_7:
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_itemId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_WORD *)(v5 + 8) = self->_vocabularyType;
  uint64_t v8 = [(NSString *)self->_term copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_vocabularyId copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_itemId hash];
  v4 = [NSNumber numberWithUnsignedShort:self->_vocabularyType];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v3 ^ [(NSString *)self->_term hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_vocabularyId hash];

  return v7;
}

- (BOOL)isEqualToCustomTerm:(id)a3
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    char v13 = 0;
    goto LABEL_30;
  }
  itemId = self->_itemId;
  uint64_t v10 = itemId;
  if (!itemId)
  {
    NSUInteger v3 = [v7 itemId];
    if (!v3)
    {
      int vocabularyType = self->_vocabularyType;
      int v12 = 0;
      char v13 = 0;
      if (vocabularyType != [v8 vocabularyType])
      {
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_12;
    }
    uint64_t v10 = self->_itemId;
  }
  v4 = [v8 itemId];
  if (([(NSString *)v10 isEqual:v4] & 1) == 0)
  {

    char v13 = 0;
    goto LABEL_28;
  }
  int v11 = self->_vocabularyType;
  if (v11 != [v8 vocabularyType])
  {
    char v13 = 0;
LABEL_27:

    goto LABEL_28;
  }
  int v12 = 1;
LABEL_12:
  term = self->_term;
  v16 = term;
  if (!term)
  {
    uint64_t v17 = [v8 term];
    if (!v17)
    {
      int v27 = v12;
      v26 = 0;
      int v18 = 0;
      goto LABEL_19;
    }
    v26 = (void *)v17;
    v16 = self->_term;
  }
  uint64_t v5 = [v8 term];
  if (![(NSString *)v16 isEqual:v5])
  {
    char v13 = 0;
    goto LABEL_25;
  }
  int v27 = v12;
  int v18 = 1;
LABEL_19:
  vocabularyId = self->_vocabularyId;
  v20 = vocabularyId;
  if (!vocabularyId)
  {
    uint64_t v21 = [v8 vocabularyId];
    if (!v21)
    {
      v24 = 0;
      char v13 = 1;
LABEL_33:

      if (v18) {
        goto LABEL_24;
      }
      goto LABEL_34;
    }
    v25 = (void *)v21;
    v20 = self->_vocabularyId;
  }
  v22 = [v8 vocabularyId];
  char v13 = [(NSString *)v20 isEqual:v22];

  if (!vocabularyId)
  {
    v24 = v25;
    goto LABEL_33;
  }
  if (v18)
  {
LABEL_24:
    int v12 = v27;
LABEL_25:

    if (term) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  int v12 = v27;
  if (term)
  {
LABEL_26:
    if (!v12) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_35:

  if (v12) {
    goto LABEL_27;
  }
LABEL_28:
  if (!itemId) {
    goto LABEL_29;
  }
LABEL_30:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKVCustomTerm *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVCustomTerm *)self isEqualToCustomTerm:v5];

  return v6;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)CKVCustomTerm;
  NSUInteger v3 = [(CKVCustomTerm *)&v8 description];
  itemId = self->_itemId;
  uint64_t v5 = CKVCustomTypeToNumber(self->_vocabularyType);
  BOOL v6 = [v3 stringByAppendingFormat:@"%@: %@ %@: %@, %@: %@, %@: %@", @"itemId", itemId, @"vocabType", v5, @"term", self->_term, @"vocabId", self->_vocabularyId];

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  itemId = self->_itemId;
  id v5 = a3;
  [v5 encodeObject:itemId forKey:@"itemId"];
  [v5 encodeInteger:self->_vocabularyType forKey:@"vocabType"];
  [v5 encodeObject:self->_term forKey:@"term"];
  [v5 encodeObject:self->_vocabularyId forKey:@"vocabId"];
}

- (CKVCustomTerm)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVCustomTerm;
  id v5 = [(CKVCustomTerm *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemId"];
    itemId = v5->_itemId;
    v5->_itemId = (NSString *)v6;

    v5->_int vocabularyType = [v4 decodeIntegerForKey:@"vocabType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"term"];
    term = v5->_term;
    v5->_term = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vocabId"];
    vocabularyId = v5->_vocabularyId;
    v5->_vocabularyId = (NSString *)v10;
  }
  return v5;
}

- (CKVCustomTerm)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use - initWithItemId:termType:term:vocabularyId" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5 vocabularyId:(id)a6
{
  int v8 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CKVCustomTerm;
  objc_super v13 = [(CKVCustomTerm *)&v29 init];
  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v14 = [v10 copy];
  itemId = v13->_itemId;
  v13->_itemId = (NSString *)v14;

  v16 = v13->_itemId;
  if (!v16 || ![(NSString *)v16 length]) {
    goto LABEL_11;
  }
  v13->_int vocabularyType = v8;
  if (!CKVCustomTypeIsValid(v8))
  {
    v23 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v25 = v23;
      v26 = (objc_class *)objc_opt_class();
      int v27 = NSStringFromClass(v26);
      v28 = CKVCustomTypeToNumber(v13->_vocabularyType);
      *(_DWORD *)buf = 136315650;
      v31 = "-[CKVCustomTerm initWithItemId:vocabularyType:term:vocabularyId:]";
      __int16 v32 = 2112;
      v33 = v27;
      __int16 v34 = 2112;
      v35 = v28;
      _os_log_error_impl(&dword_1A77B3000, v25, OS_LOG_TYPE_ERROR, "%s Cannot construct %@ with invalid vocabularyType: %@", buf, 0x20u);
    }
    goto LABEL_11;
  }
  uint64_t v17 = [v11 copy];
  term = v13->_term;
  v13->_term = (NSString *)v17;

  v19 = v13->_term;
  if (!v19 || ![(NSString *)v19 length])
  {
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  uint64_t v20 = [v12 copy];
  vocabularyId = v13->_vocabularyId;
  v13->_vocabularyId = (NSString *)v20;

LABEL_8:
  v22 = v13;
LABEL_12:

  return v22;
}

- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5
{
  return [(CKVCustomTerm *)self initWithItemId:a3 vocabularyType:a4 term:a5 vocabularyId:0];
}

+ (id)customTermFromItem:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 itemType] == 1)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    *(void *)&long long v34 = __Block_byref_object_dispose_;
    *((void *)&v34 + 1) = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __36__CKVCustomTerm_customTermFromItem___block_invoke;
    v19[3] = &unk_1E5CF95C0;
    v19[4] = &v20;
    v19[5] = buf;
    [v3 enumerateFieldsUsingBlock:v19];
    uint64_t v4 = [*(id *)(*(void *)&buf[8] + 40) fieldType];
    if ((unint64_t)(v4 - 1) > 0x12) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = word_1A78361A0[v4 - 1];
    }
    int v8 = [CKVCustomTerm alloc];
    v9 = [v3 itemId];
    id v10 = [*(id *)(*(void *)&buf[8] + 40) value];
    id v7 = [(CKVCustomTerm *)v8 initWithItemId:v9 vocabularyType:v5 term:v10 vocabularyId:v21[5]];

    if (!v7)
    {
      id v11 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v17);
        *(_DWORD *)v26 = 136315650;
        int v27 = "+[CKVCustomTerm customTermFromItem:]";
        __int16 v28 = 2112;
        objc_super v29 = v18;
        __int16 v30 = 2112;
        id v31 = v3;
        _os_log_error_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to initialize %@ from item: %@", v26, 0x20u);
      }
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v6 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = v6;
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      v16 = KVItemTypeName();
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "+[CKVCustomTerm customTermFromItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 2112;
      v33 = v15;
      LOWORD(v34) = 2112;
      *(void *)((char *)&v34 + 2) = v16;
      _os_log_error_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected item: %@ expected %@ with itemType: %@", buf, 0x2Au);
    }
    id v7 = 0;
  }

  return v7;
}

void __36__CKVCustomTerm_customTermFromItem___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 fieldType] == 20)
  {
    uint64_t v3 = [v8 value];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v8;
    uint64_t v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end