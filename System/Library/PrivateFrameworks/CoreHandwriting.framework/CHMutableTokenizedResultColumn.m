@interface CHMutableTokenizedResultColumn
- (CHMutableTokenizedResultColumn)initWithTokenRows:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)addTokenRowWithTokens:(id)a3;
- (void)removeTokenRowAtIndex:(int64_t)a3;
- (void)setTokenRowWithTokens:(id)a3 atIndex:(int64_t)a4;
- (void)setTokenRows:(id)a3;
- (void)sortTokenRows;
@end

@implementation CHMutableTokenizedResultColumn

- (CHMutableTokenizedResultColumn)initWithTokenRows:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHMutableTokenizedResultColumn;
  v10 = [(CHTokenizedResultColumn *)&v14 initWithTokenRows:MEMORY[0x1E4F1CBF0]];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_mutableCopy(v4, v5, v6, v7, v8, v9);
    tokenRows = v10->super._tokenRows;
    v10->super._tokenRows = (NSArray *)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CHTokenizedResultColumn alloc];
  tokenRows = self->super._tokenRows;
  return (id)objc_msgSend_initWithTokenRows_(v4, v5, (uint64_t)tokenRows, v6, v7, v8);
}

- (void)setTokenRows:(id)a3
{
  if (self->super._tokenRows != a3)
  {
    uint64_t v7 = (NSArray *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3, v4, v5);
    tokenRows = self->super._tokenRows;
    self->super._tokenRows = v7;
  }
}

- (int64_t)addTokenRowWithTokens:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7, v8, v9))
  {

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v15 = objc_msgSend_firstObject(v4, v10, v11, v12, v13, v14);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v25 = objc_opt_class();
    if (self) {
LABEL_4:
    }
      self = self->super._tokenRows;
  }
  else
  {
    v28 = objc_msgSend_firstObject(v4, v17, v18, v19, v20, v21);
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) == 0)
    {
      if (self)
      {
        objc_msgSend_addObject_(self->super._tokenRows, v30, (uint64_t)v4, v31, v32, v33);
        self = self->super._tokenRows;
      }
      else
      {
        objc_msgSend_addObject_(0, v30, (uint64_t)v4, v31, v32, v33);
      }
      uint64_t v26 = objc_msgSend_count(self, v34, v35, v36, v37, v38);
      goto LABEL_13;
    }
    v25 = objc_opt_class();
    if (self) {
      goto LABEL_4;
    }
  }
  uint64_t v26 = objc_msgSend_mergeTokenRow_intoUniqueRows_(v25, v22, (uint64_t)v4, (uint64_t)self, v23, v24);
LABEL_13:
  int64_t v39 = v26;

  return v39;
}

- (void)setTokenRowWithTokens:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (self)
  {
    uint64_t v12 = self->super._tokenRows;
    unint64_t v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);

    if (v18 > a4) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v35 = objc_msgSend_count(0, v6, v7, v8, v9, v10);

    if (v35 > a4) {
      goto LABEL_10;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v22 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    if (self)
    {
      v28 = self->super._tokenRows;
      uint64_t v34 = objc_msgSend_count(v28, v29, v30, v31, v32, v33);
    }
    else
    {
      v28 = 0;
      uint64_t v34 = objc_msgSend_count(0, v23, v24, v25, v26, v27);
    }
    int v36 = 134218240;
    int64_t v37 = a4;
    __int16 v38 = 2048;
    uint64_t v39 = v34;
    _os_log_impl(&dword_1C492D000, v22, OS_LOG_TYPE_FAULT, "Invalid index %ld when trying to replace a row from column with %lu rows.", (uint8_t *)&v36, 0x16u);
  }
LABEL_10:
  if (self) {
    self = self->super._tokenRows;
  }
  objc_msgSend_setObject_atIndexedSubscript_(self, v19, (uint64_t)v11, a4, v20, v21);
}

- (void)removeTokenRowAtIndex:(int64_t)a3
{
  uint64_t v7 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    uint64_t v8 = self->super._tokenRows;
    unint64_t v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

    if (v14 > a3) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v32 = objc_msgSend_count(0, a2, a3, v3, v4, v5);

    if (v32 > a3) {
      goto LABEL_10;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v19 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    if (v7)
    {
      uint64_t v25 = v7->super._tokenRows;
      uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v31 = objc_msgSend_count(0, v20, v21, v22, v23, v24);
    }
    int v33 = 134218240;
    int64_t v34 = a3;
    __int16 v35 = 2048;
    uint64_t v36 = v31;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_FAULT, "Invalid index %ld when trying to remvove a row from column with %lu rows.", (uint8_t *)&v33, 0x16u);
  }
LABEL_10:
  if (v7) {
    uint64_t v7 = v7->super._tokenRows;
  }
  objc_msgSend_removeObjectAtIndex_(v7, v15, a3, v16, v17, v18);
}

- (void)sortTokenRows
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_firstObject(self->super._tokenRows, a2, v2, v3, v4, v5);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  tokenRows = self->super._tokenRows;
  if (isKindOfClass)
  {
    uint64_t v15 = &unk_1F2012B70;
LABEL_4:
    objc_msgSend_sortUsingComparator_(tokenRows, v9, (uint64_t)v15, v11, v12, v13);
    return;
  }
  uint64_t v16 = objc_msgSend_firstObject(tokenRows, v9, v10, v11, v12, v13);
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();

  if (v17)
  {
    tokenRows = self->super._tokenRows;
    uint64_t v15 = &unk_1F20130D0;
    goto LABEL_4;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v18 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = objc_msgSend_firstObject(self->super._tokenRows, v19, v20, v21, v22, v23);
    int v26 = 138412290;
    id v27 = (id)objc_opt_class();
    id v25 = v27;
    _os_log_impl(&dword_1C492D000, v18, OS_LOG_TYPE_ERROR, "Unexpected token class (%@) encountered when sorting token rows.", (uint8_t *)&v26, 0xCu);
  }
}

@end