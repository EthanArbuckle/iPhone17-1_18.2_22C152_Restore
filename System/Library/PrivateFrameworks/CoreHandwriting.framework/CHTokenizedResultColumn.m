@interface CHTokenizedResultColumn
+ (BOOL)supportsSecureCoding;
- (BOOL)containsStartingTokenEquivalentToToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CHTokenizedResultColumn)init;
- (CHTokenizedResultColumn)initWithCoder:(id)a3;
- (CHTokenizedResultColumn)initWithTokenRows:(id)a3;
- (NSArray)mathTokenRows;
- (NSArray)textTokenRows;
- (NSArray)tokenRows;
- (NSIndexSet)strokeIndexes;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)indexOfEquivalentTokenRow:(id)a3 tokenRange:(_NSRange)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTokenizedResultColumn

- (CHTokenizedResultColumn)init
{
  return (CHTokenizedResultColumn *)objc_msgSend_initWithTokenRows_(self, a2, MEMORY[0x1E4F1CBF0], v2, v3, v4);
}

- (CHTokenizedResultColumn)initWithTokenRows:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHTokenizedResultColumn;
  v10 = [(CHTokenizedResultColumn *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    tokenRows = v10->_tokenRows;
    v10->_tokenRows = (NSArray *)v11;
  }
  return v10;
}

- (CHTokenizedResultColumn)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_super v14 = objc_msgSend_setWithObjects_(v4, v10, v6, v11, v12, v13, v7, v8, v9, 0);
  v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, @"tokenRows", v16, v17);

  if (v18)
  {
    v23 = (CHTokenizedResultColumn *)objc_msgSend_initWithTokenRows_(self, v19, (uint64_t)v18, v20, v21, v22);
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v24 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v25 = v28;
      _os_log_impl(&dword_1C492D000, v24, OS_LOG_TYPE_ERROR, "%@ decoding failed. Result token rows are required to be nonnull when constructing a request", buf, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_tokenRows, @"tokenRows", v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CHMutableTokenizedResultColumn alloc];
  tokenRows = self->_tokenRows;
  return (id)objc_msgSend_initWithTokenRows_(v4, v5, (uint64_t)tokenRows, v6, v7, v8);
}

- (id)description
{
  uint64_t v7 = objc_msgSend_tokenRows(self, a2, v2, v3, v4, v5);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1C4A06594;
  v32[3] = &unk_1E64E2298;
  v32[4] = self;
  uint64_t v11 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v7, v8, @"\n", (uint64_t)v32, v9, v10);

  v31.receiver = self;
  v31.super_class = (Class)CHTokenizedResultColumn;
  uint64_t v12 = [(CHTokenizedResultColumn *)&v31 description];
  v18 = objc_msgSend_tokenRows(self, v13, v14, v15, v16, v17);
  uint64_t v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_stringByAppendingFormat_(v12, v25, @" rows: %ld {\n%@\n}", v26, v27, v28, v24, v11);

  return v29;
}

- (int64_t)indexOfEquivalentTokenRow:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  tokenRows = self->_tokenRows;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4A068AC;
  v16[3] = &unk_1E64E22C0;
  NSUInteger v19 = location;
  NSUInteger v20 = length;
  id v9 = v7;
  id v17 = v9;
  v18 = &v21;
  objc_msgSend_enumerateObjectsUsingBlock_(tokenRows, v10, (uint64_t)v16, v11, v12, v13);
  int64_t v14 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (BOOL)containsStartingTokenEquivalentToToken:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  tokenRows = self->_tokenRows;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4A06A90;
  v12[3] = &unk_1E64E22E8;
  id v6 = v4;
  id v13 = v6;
  int64_t v14 = &v15;
  objc_msgSend_enumerateObjectsUsingBlock_(tokenRows, v7, (uint64_t)v12, v8, v9, v10);
  LOBYTE(tokenRows) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)tokenRows;
}

- (NSIndexSet)strokeIndexes
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], a2, v2, v3, v4, v5);
  if (objc_msgSend_count(self->_tokenRows, v8, v9, v10, v11, v12))
  {
    char v18 = objc_msgSend_firstObject(self->_tokenRows, v13, v14, v15, v16, v17);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, (uint64_t)v40, 16, v20);
    if (v21)
    {
      uint64_t v27 = v21;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v18);
          }
          v30 = objc_msgSend_strokeIndexes(*(void **)(*((void *)&v36 + 1) + 8 * i), v22, v23, v24, v25, v26);
          objc_msgSend_addIndexes_(v7, v31, (uint64_t)v30, v32, v33, v34);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v36, (uint64_t)v40, 16, v26);
      }
      while (v27);
    }
  }
  return (NSIndexSet *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHTokenizedResultColumn *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        self = (CHTokenizedResultColumn *)self->_tokenRows;
        uint64_t v12 = objc_msgSend_tokenRows(v5, v6, v7, v8, v9, v10);
        LOBYTE(self) = objc_msgSend_isEqualToArray_(self, v13, (uint64_t)v12, v14, v15, v16);
      }
    }

    return (char)self;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_tokenRows, a2, v2, v3, v4, v5);
}

- (NSArray)textTokenRows
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_firstObject(self->_tokenRows, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  if (v13)
  {
    NSUInteger v19 = (void *)v13;
    uint64_t v20 = objc_msgSend_firstObject(self->_tokenRows, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_firstObject(v20, v21, v22, v23, v24, v25);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v7 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v33 = objc_msgSend_firstObject(self->_tokenRows, v28, v29, v30, v31, v32);
      long long v39 = objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
      int v43 = 138412290;
      id v44 = (id)objc_opt_class();
      id v40 = v44;
      _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_FAULT, "Invalid class (%@) in text token rows.", (uint8_t *)&v43, 0xCu);
    }
  }

LABEL_8:
  tokenRows = self->_tokenRows;
  return tokenRows;
}

- (NSArray)mathTokenRows
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_firstObject(self->_tokenRows, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_firstObject(v7, v8, v9, v10, v11, v12);
  if (v13)
  {
    NSUInteger v19 = (void *)v13;
    uint64_t v20 = objc_msgSend_firstObject(self->_tokenRows, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_firstObject(v20, v21, v22, v23, v24, v25);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v7 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v33 = objc_msgSend_firstObject(self->_tokenRows, v28, v29, v30, v31, v32);
      long long v39 = objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
      int v43 = 138412290;
      id v44 = (id)objc_opt_class();
      id v40 = v44;
      _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_FAULT, "Invalid class (%@) in text token rows.", (uint8_t *)&v43, 0xCu);
    }
  }

LABEL_8:
  tokenRows = self->_tokenRows;
  return tokenRows;
}

- (NSArray)tokenRows
{
  return self->_tokenRows;
}

- (void).cxx_destruct
{
}

@end