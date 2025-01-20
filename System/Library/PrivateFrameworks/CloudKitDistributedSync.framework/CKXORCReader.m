@interface CKXORCReader
- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3;
- (BOOL)_setInputWithError:(id *)a3;
- (BOOL)createReaderIfNecessaryWithError:(id *)a3;
- (BOOL)loadBatchWithRow:(unint64_t)a3 forStruct:(unint64_t)a4;
- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4;
- (BOOL)setReadableStorage:(id)a3 error:(id *)a4;
- (CKDSReadableStorage)storage;
- (CKXORCHelpers)helpers;
- (CKXORCReader)initWithSchema:(id)a3;
- (CKXORCReader)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5;
- (CKXORCReaderOptions)options;
- (id).cxx_construct;
- (id)rowsForStructColumn:(unint64_t)a3;
- (int64_t)lengthForList:(id *)a3;
- (unint64_t)loadCount;
- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3 forStruct:(unint64_t)a4;
- (unint64_t)valueSizeForField:(unint64_t)a3;
- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5;
- (void)copyData:(void *)a3 forList:(id *)a4;
- (void)createRowReaderForStruct:(unint64_t)a3;
- (void)listColumnForReference:(unint64_t)a3;
- (void)rootColumnForStruct:(unint64_t)a3;
- (void)setLoadCount:(unint64_t)a3;
- (void)setStorage:(id)a3;
- (void)structColumnForStruct:(unint64_t)a3;
- (void)structReferenceColumnForReference:(unint64_t)a3;
- (void)valueColumnForField:(unint64_t)a3;
@end

@implementation CKXORCReader

- (CKXORCReader)initWithSchema:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v4, v6, *MEMORY[0x1E4F1C3B8], @"%@ is unavailable", v5);

  return 0;
}

- (CKXORCReader)initWithSchema:(id)a3 helpers:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v13 = a5;
  if (!v10)
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 144, @"The ORC reader requires a helper object conforming to CKXORCHelpers");
  }
  v20.receiver = self;
  v20.super_class = (Class)CKXORCReader;
  v14 = [(CKXReaderBase *)&v20 initWithSchema:v9];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_helpers, a4);
    v16 = v13;
    if (!v13) {
      v16 = objc_opt_new();
    }
    objc_storeStrong((id *)&v15->_options, v16);
    if (!v13) {
  }
    }
  return v15;
}

- (BOOL)createReaderIfNecessaryWithError:(id *)a3
{
  v12[7] = *MEMORY[0x1E4F143B8];
  if (!self->_reader.__ptr_.__value_)
  {
    v4 = objc_msgSend_storage(self, a2, (uint64_t)a3);

    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      v6 = NSStringFromSelector(sel_setReadableStorage_error_);
      objc_msgSend_raise_format_(v5, v7, *MEMORY[0x1E4F1C3C8], @"Call %@ before writing data", v6);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1DD30CBE8;
    v12[3] = &unk_1E6CBAD08;
    v12[4] = self;
    v8 = v12;
    sub_1DD30CBE8((uint64_t)v8, v9, v10);
  }
  return 1;
}

- (void)createRowReaderForStruct:(unint64_t)a3
{
  v13[10] = *MEMORY[0x1E4F143B8];
  v6 = self;
  if (!v6->_reader.__ptr_.__value_)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v4, v5);
    v11 = objc_msgSend_stringWithUTF8String_(NSString, v10, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v12, (uint64_t)v11, @"CKXORCReaderWriter.mm", 135, @"Reader not present: make sure that -[CKXORCReader setData:error:] has been called");
  }
  begin = v6->_structToReaderBatchPair.__begin_;
  if (a3 >= ((char *)v6->_structToReaderBatchPair.__end_ - (char *)begin) >> 4 || !begin[2 * a3])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1DD30D304;
    v13[3] = &unk_1E6CBAD30;
    v13[4] = v6;
    v13[5] = a3;
    v8 = v13;
    sub_1DD30D304((uint64_t)v8);
  }
}

- (BOOL)loadBatchWithRow:(unint64_t)a3 forStruct:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = self;
  if (!v9->_reader.__ptr_.__value_)
  {
    id v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    v15 = objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v13, v16, (uint64_t)v15, @"CKXORCReaderWriter.mm", 135, @"Reader not present: make sure that -[CKXORCReader setData:error:] has been called");
  }
  objc_msgSend_createRowReaderForStruct_(v9, v10, a4);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1DD30DC3C;
  v17[3] = &unk_1E6CBAD58;
  v17[4] = v9;
  v17[5] = &v18;
  v17[6] = a3;
  v17[7] = a2;
  v17[8] = a4;
  v11 = v17;
  sub_1DD30DC3C((uint64_t)v11);

  LOBYTE(v11) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return (char)v11;
}

- (unint64_t)offsetInCurrentBatchForRow:(unint64_t)a3 forStruct:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend_loadBatchWithRow_forStruct_(self, a2, a3);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1DD30E424;
  v19[3] = &unk_1E6CBAD80;
  v19[4] = self;
  uint64_t v20 = &v22;
  unint64_t v21 = a4;
  uint64_t v8 = v19;
  uint64_t v9 = *((void *)self->_structToReaderBatchPair.__begin_ + 2 * a4);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 48))(v9);
  *(void *)(v20[1] + 24) = v10;

  unint64_t v13 = *(void *)(*((void *)self->_structToReaderBatchPair.__begin_ + 2 * a4 + 1) + 16);
  unint64_t v14 = v23[3];
  unint64_t v15 = a3 - v14;
  if (a3 < v14 || v15 >= v13)
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 279, @"Incorrect rows loaded: row %llu does not fit in range %llu->llu", a3, v23[3], v23[3] + v13);

    unint64_t v15 = a3 - v23[3];
  }
  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)rowsForStructColumn:(unint64_t)a3
{
  v16[11] = *MEMORY[0x1E4F143B8];
  v7 = self;
  if (!v7->_reader.__ptr_.__value_)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    unint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v13, (uint64_t)"void CKXReaderCheck(CKXORCReader *__strong)");
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v12, v15, (uint64_t)v14, @"CKXORCReaderWriter.mm", 135, @"Reader not present: make sure that -[CKXORCReader setData:error:] has been called");
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DD30E884;
  v16[3] = &unk_1E6CBADA8;
  v16[4] = v7;
  v16[5] = a3;
  v16[6] = a2;
  uint64_t v8 = v16;
  sub_1DD30E884((uint64_t)v8, v9, v10);

  return v7->_rowsForTopLevelContainerStructs.__begin_[a3];
}

- (void)rootColumnForStruct:(unint64_t)a3
{
  objc_msgSend_createRowReaderForStruct_(self, a2, a3);
  uint64_t v8 = (const void *)*((void *)self->_structToReaderBatchPair.__begin_ + 2 * a3 + 1);
  if (!v8
    || (result = __dynamic_cast(v8, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0)) == 0)
  {
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 325, @"Root column not found");

    return 0;
  }
  return result;
}

- (BOOL)setReadableStorage:(id)a3 error:(id *)a4
{
  uint64_t v7 = (CKDSReadableStorage *)a3;
  if (self->_storage == v7)
  {
    char v9 = 1;
  }
  else
  {
    objc_storeStrong((id *)&self->_storage, a3);
    char v9 = objc_msgSend__setInputWithError_(self, v8, (uint64_t)a4);
  }

  return v9;
}

- (BOOL)_setInputWithError:(id *)a3
{
  value = self->_reader.__ptr_.__value_;
  self->_reader.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Reader *, SEL))(*(void *)value + 8))(value, a2);
  }
  begin = (uint64_t *)self->_structToReaderBatchPair.__begin_;
  for (i = (uint64_t *)self->_structToReaderBatchPair.__end_; i != begin; sub_1DD3149D0(i))
    i -= 2;
  self->_structToReaderBatchPair.__end_ = begin;
  uint64_t v8 = self->_rowsForTopLevelContainerStructs.__begin_;
  for (j = self->_rowsForTopLevelContainerStructs.var0; j != v8; --j)
  {
    uint64_t v10 = *(j - 1);
  }
  self->_rowsForTopLevelContainerStructs.var0 = v8;
  self->_loadCount = 0;
  id v15 = 0;
  char ReaderIfNecessaryWithError = objc_msgSend_createReaderIfNecessaryWithError_(self, a2, (uint64_t)&v15);
  id v12 = v15;
  unint64_t v13 = v12;
  if (a3 && (ReaderIfNecessaryWithError & 1) == 0) {
    *a3 = v12;
  }

  return ReaderIfNecessaryWithError;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DD30F3FC;
  v16[3] = &unk_1E6CBADD0;
  v16[4] = self;
  v17 = &v18;
  uint64_t v7 = v16;
  uint64_t v8 = (*(uint64_t (**)(Reader *))(*(void *)self->_reader.__ptr_.__value_ + 24))(self->_reader.__ptr_.__value_);
  *(void *)(v17[1] + 24) = v8;

  if (v19[3])
  {
    v11 = objc_msgSend_schema(self, v9, v10);
    BOOL v13 = sub_1DD2FE7C8((BOOL)v11, (const char *)a4, v12);

    retstr->var0 = a4;
    p_var1 = &retstr->var1;
    if (v13)
    {
      *(_OWORD *)p_var1 = xmmword_1DD3261C0;
    }
    else
    {
      unint64_t *p_var1 = 0;
      p_var1[1] = 0;
    }
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
  }
  _Block_object_dispose(&v18, 8);
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  char v9 = objc_msgSend_schema(self, a3, a4);
  unint64_t v11 = sub_1DD2FE38C((uint64_t)v9, (const char *)a4, v10);

  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_structReferenceColumnForReference_(self, v12, a4);
  if (result
    && (id v15 = result,
        result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v14, a5->var2, a5->var0), *((unsigned char *)&result->var0 + v15[1].var2)))
  {
    result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v16, a5->var2, a5->var0);
    unint64_t v17 = a5->var2 + *(void *)(v15[4].var0 + 8 * (void)result);
    retstr->var0 = v11;
    retstr->var1 = 0;
  }
  else
  {
    unint64_t v17 = -1;
    retstr->var0 = 0;
    retstr->var1 = -1;
  }
  retstr->var2 = v17;
  return result;
}

- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4
{
  uint64_t v8 = objc_msgSend_schema(self, a2, a3);
  uint64_t v10 = sub_1DD2FE014((uint64_t)v8, (const char *)a3, v9);

  if (v10 == 1)
  {
    uint64_t v16 = objc_msgSend_structReferenceColumnForReference_(self, v11, a3);
    if (!v16) {
      return 1;
    }
  }
  else
  {
    if (v10 != 2) {
      goto LABEL_8;
    }
    BOOL v13 = objc_msgSend_schema(self, v11, v12);
    uint64_t v15 = sub_1DD2FE0E0((uint64_t)v13, (const char *)a3, v14);

    if ((unint64_t)(v15 - 1) >= 2)
    {
      if (!v15 || v15 == 3)
      {
        uint64_t v16 = objc_msgSend_listColumnForReference_(self, v11, a3);
        if (!v16) {
          return 1;
        }
        return *(unsigned char *)(*(void *)(v16 + 40)
                        + objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, a4->var2, a4->var0)) == 0;
      }
LABEL_8:
      v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 423, @"Invalid field type");

      return 0;
    }
    uint64_t v16 = objc_msgSend_valueColumnForField_(self, v11, a3);
    if (!v16) {
      return 1;
    }
  }
  return *(unsigned char *)(*(void *)(v16 + 40)
                  + objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, a4->var2, a4->var0)) == 0;
}

- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  uint64_t v9 = objc_msgSend_schema(self, a3, a4);
  uint64_t v11 = sub_1DD2FE0E0((uint64_t)v9, (const char *)a4, v10);

  if (v11)
  {
    uint64_t v15 = -1;
  }
  else
  {
    uint64_t v16 = objc_msgSend_schema(self, v13, v14);
    uint64_t v15 = sub_1DD2FE42C((uint64_t)v16, (const char *)a4, v17);
  }
  if (a5->var1 == 1)
  {
    result = ($3CC19D079FD0B010EE84973AA846B91B *)(id)objc_msgSend_rowsForStructColumn_(self, v13, v15);
    unint64_t v18 = 1;
    unint64_t var2 = a4;
  }
  else
  {
    unint64_t v18 = 0;
    unint64_t var2 = a5->var2;
  }
  retstr->var0 = v15;
  retstr->var1 = a4;
  retstr->unint64_t var2 = v18;
  retstr->var3 = var2;
  return result;
}

- (int64_t)lengthForList:(id *)a3
{
  uint64_t v4 = (uint64_t)a2;
  uint64_t v6 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  if (v6) {
    uint64_t v7 = *(void *)(v6[10] + 56 * a3->var1 + 16);
  }
  else {
    uint64_t v7 = 0;
  }

  uint64_t v10 = objc_msgSend_schema(self, v8, v9);
  uint64_t v12 = sub_1DD2FE0E0((uint64_t)v10, (const char *)a3->var1, v11);

  unint64_t var3 = a3->var3;
  if ((unint64_t)(v12 - 1) < 2)
  {
    if (a3->var2 == 1)
    {
      v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, v4, self, @"CKXORCReaderWriter.mm", 470, @"Invalid list");
    }
    uint64_t v16 = (const void *)objc_msgSend_valueColumnForField_(self, v13, a3->var1);
    if (!v16) {
      return 0;
    }
    uint64_t v17 = __dynamic_cast(v16, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F38782D0, 0);
    if (!v17) {
      return 0;
    }
    return *(void *)(v17[17] + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v18, var3, v7));
  }
  else
  {
    if (v12)
    {
      if (v12 != 3) {
        return v4;
      }
LABEL_14:
      uint64_t v22 = objc_msgSend_listColumnForReference_(self, v13, a3->var1);
      if (v22)
      {
        uint64_t v24 = v22;
        uint64_t v25 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v23, var3, v7);
        return *(void *)(*(void *)(v24 + 96) + 8 * v25 + 8) - *(void *)(*(void *)(v24 + 96) + 8 * v25);
      }
      return 0;
    }
    if (a3->var2 != 1) {
      goto LABEL_14;
    }
    v19 = objc_msgSend_rowsForStructColumn_(self, v13, a3->var0);
    uint64_t v4 = objc_msgSend_count(v19, v20, v21);
  }
  return v4;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4
{
  if (a5->var0 == -1)
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a3, a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 486, @"Invalid struct");
  }
  long long v10 = *(_OWORD *)&a5->var2;
  v31[0] = *(_OWORD *)&a5->var0;
  v31[1] = v10;
  if (objc_msgSend_lengthForList_(self, a3, (uint64_t)v31) <= a4)
  {
    v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 489, @"Index out of range");
  }
  if (a5->var2 == 1)
  {
    objc_msgSend_rowsForStructColumn_(self, v11, a5->var0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1DD314844;
    v32[3] = &unk_1E6CBAE70;
    v32[5] = &v34;
    v32[6] = a4;
    v32[4] = v33;
    objc_msgSend_enumerateRangesUsingBlock_(v13, v14, (uint64_t)v32);
    unint64_t v16 = v35[3];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v15, *MEMORY[0x1E4F1C4A8], @"Index %lu out of range", a4);
      unint64_t v16 = v35[3];
    }
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    unint64_t v18 = objc_msgSend_schema(self, v11, v12);
    if (v18) {
      uint64_t v19 = *(void *)(v18[10] + 56 * a5->var1 + 16);
    }
    else {
      uint64_t v19 = 0;
    }

    uint64_t v23 = objc_msgSend_listColumnForReference_(self, v20, a5->var1);
    if (!v23)
    {
      v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v21, v22);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a3, self, @"CKXORCReaderWriter.mm", 499, @"Unexpected null struct list column in reader");
    }
    uint64_t v24 = *(void *)(*(void *)(v23 + 96)
                    + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v21, a5->var3, v19));
    result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)__dynamic_cast(*(const void **)(v23 + 120), (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0);
    unint64_t v16 = a5->var3 + *(void *)(result[4].var0 + 8 * (v24 + a4));
  }
  retstr->var0 = a5->var0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = v16;
  return result;
}

- (unint64_t)valueSizeForField:(unint64_t)a3
{
  uint64_t v4 = objc_msgSend_schema(self, a2, a3);
  unint64_t v6 = sub_1DD2FE180((uint64_t)v4, (const char *)a3, v5);

  return v6;
}

- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5
{
  if (a5->var1 == 1)
  {
    uint64_t v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 520, @"Invalid struct");
  }
  uint64_t v9 = (const void *)objc_msgSend_valueColumnForField_(self, a2, a4);
  if (v9)
  {
    long long v10 = __dynamic_cast(v9, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0);
    if (v10)
    {
      uint64_t v12 = v10;
      unint64_t var2 = a5->var2;
      uint64_t v14 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v11, var2, a5->var0);
      if (a3)
      {
        if (*(unsigned char *)(v12[5] + v14))
        {
          size_t v16 = objc_msgSend_valueSizeForField_(self, v15, a4);
          unint64_t v18 = (const void *)(v12[12]
                             + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, var2, a5->var0));
          memcpy(a3, v18, v16);
        }
      }
    }
  }
}

- (void)copyData:(void *)a3 forList:(id *)a4
{
  uint64_t v5 = a3;
  if (a4->var0 != -1)
  {
    v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 533, @"Invalid struct");
  }
  if (a4->var2 == 1)
  {
    v52 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 534, @"Invalid list");
  }
  uint64_t v8 = objc_msgSend_schema(self, a2, (uint64_t)a3);
  uint64_t v10 = sub_1DD2FE0E0((uint64_t)v8, (const char *)a4->var1, v9);

  if ((unint64_t)(v10 - 1) < 2)
  {
    uint64_t v24 = objc_msgSend_schema(self, v11, v12);
    if (v24) {
      uint64_t v25 = *(void *)(v24[10] + 56 * a4->var1 + 16);
    }
    else {
      uint64_t v25 = 0;
    }

    v27 = (const void *)objc_msgSend_valueColumnForField_(self, v26, a4->var1);
    if (v27)
    {
      v28 = __dynamic_cast(v27, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F38782D0, 0);
      if (v28)
      {
        v30 = v28;
        unint64_t var3 = a4->var3;
        uint64_t v32 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v29, var3, v25);
        if (v5)
        {
          if (*(unsigned char *)(v30[5] + v32))
          {
            uint64_t v34 = *(const void **)(v30[12] + 8
                                           * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v33, var3, v25));
            size_t v36 = *(void *)(v30[17] + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v35, var3, v25));
            memcpy(v5, v34, v36);
          }
        }
      }
    }
  }
  else if (v10)
  {
    if (v10 == 3)
    {
      id v13 = objc_msgSend_schema(self, v11, v12);
      uint64_t v14 = v13 ? *(void *)(v13[10] + 56 * a4->var1 + 16) : 0;

      uint64_t v16 = objc_msgSend_listColumnForReference_(self, v15, a4->var1);
      if (v16)
      {
        unint64_t v18 = (void *)v16;
        unint64_t v19 = a4->var3;
        uint64_t v20 = objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v17, v19, v14);
        if (v5)
        {
          if (*(unsigned char *)(v18[5] + v20))
          {
            uint64_t v22 = (const void *)v18[15];
            uint64_t v23 = v22
                ? __dynamic_cast(v22, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0): 0;
            long long v38 = *(_OWORD *)&a4->var2;
            v55[0] = *(_OWORD *)&a4->var0;
            v55[1] = v38;
            uint64_t v39 = objc_msgSend_lengthForList_(self, v21, (uint64_t)v55);
            uint64_t v41 = *(void *)(v18[12] + 8 * objc_msgSend_offsetInCurrentBatchForRow_forStruct_(self, v40, v19, v14));
            uint64_t v43 = objc_msgSend_valueSizeForField_(self, v42, a4->var1);
            if (v39 >= 1)
            {
              uint64_t v46 = v43;
              uint64_t v47 = 8 * v41;
              do
              {
                if (v46 == 8)
                {
                  void *v5 = *(void *)(v23[12] + v47);
                }
                else
                {
                  v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v44, v45);
                  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 578, @"Array integer size %lu not supported", v46);
                }
                ++v5;
                v47 += 8;
                --v39;
              }
              while (v39);
            }
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v37, (uint64_t)a2, self, @"CKXORCReaderWriter.mm", 540, @"Invalid list type");
  }
}

- (void)structColumnForStruct:(unint64_t)a3
{
  result = **(void ***)(objc_msgSend_rootColumnForStruct_(self, a2, a3) + 80);
  if (result)
  {
    return __dynamic_cast(result, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
  }
  return result;
}

- (void)structReferenceColumnForReference:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_schema(self, a2, a3);
  if (v5) {
    uint64_t v6 = *(void *)(v5[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v6 = 0;
  }

  uint64_t v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  uint64_t v11 = objc_msgSend_helpers(self, v9, v10);
  unint64_t v13 = objc_msgSend_structReferenceIndexForReference_(v11, v12, a3);

  uint64_t v14 = *(void *)(v8 + 80);
  if (v13 >= (*(void *)(v8 + 88) - v14) >> 3) {
    return 0;
  }
  uint64_t v15 = *(const void **)(v14 + 8 * v13);
  if (!v15) {
    return 0;
  }
  return __dynamic_cast(v15, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878118, 0);
}

- (void)listColumnForReference:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_schema(self, a2, a3);
  if (v5) {
    uint64_t v6 = *(void *)(v5[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v6 = 0;
  }

  uint64_t v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  uint64_t v11 = objc_msgSend_helpers(self, v9, v10);
  unint64_t v13 = objc_msgSend_listColumnIndexForReference_(v11, v12, a3);

  uint64_t v14 = *(void *)(v8 + 80);
  if (v13 >= (*(void *)(v8 + 88) - v14) >> 3) {
    return 0;
  }
  uint64_t v15 = *(const void **)(v14 + 8 * v13);
  if (!v15) {
    return 0;
  }
  return __dynamic_cast(v15, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878100, 0);
}

- (void)valueColumnForField:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_schema(self, a2, a3);
  if (v5) {
    uint64_t v6 = *(void *)(v5[10] + 56 * a3 + 16);
  }
  else {
    uint64_t v6 = 0;
  }

  uint64_t v8 = objc_msgSend_structColumnForStruct_(self, v7, v6);
  uint64_t v11 = objc_msgSend_helpers(self, v9, v10);
  unint64_t v13 = objc_msgSend_valueColumnIndexForField_(v11, v12, a3);

  uint64_t v14 = *(void *)(v8 + 80);
  if (v13 >= (*(void *)(v8 + 88) - v14) >> 3) {
    return 0;
  }
  else {
    return *(void **)(v14 + 8 * v13);
  }
}

- (CKDSReadableStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (CKXORCHelpers)helpers
{
  return self->_helpers;
}

- (CKXORCReaderOptions)options
{
  return self->_options;
}

- (unint64_t)loadCount
{
  return self->_loadCount;
}

- (void)setLoadCount:(unint64_t)a3
{
  self->_loadCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  begin = self->_rowsForTopLevelContainerStructs.__begin_;
  if (begin)
  {
    var0 = self->_rowsForTopLevelContainerStructs.var0;
    uint64_t v5 = self->_rowsForTopLevelContainerStructs.__begin_;
    if (var0 != begin)
    {
      do
      {
        uint64_t v6 = *--var0;
      }
      while (var0 != begin);
      uint64_t v5 = self->_rowsForTopLevelContainerStructs.__begin_;
    }
    self->_rowsForTopLevelContainerStructs.var0 = begin;
    operator delete(v5);
  }
  uint64_t v7 = (uint64_t *)self->_structToReaderBatchPair.__begin_;
  if (v7)
  {
    end = (uint64_t *)self->_structToReaderBatchPair.__end_;
    uint64_t v9 = self->_structToReaderBatchPair.__begin_;
    if (end != v7)
    {
      do
      {
        end -= 2;
        sub_1DD3149D0(end);
      }
      while (end != v7);
      uint64_t v9 = self->_structToReaderBatchPair.__begin_;
    }
    self->_structToReaderBatchPair.__end_ = v7;
    operator delete(v9);
  }
  value = self->_reader.__ptr_.__value_;
  self->_reader.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v11 = *(void (**)(void))(*(void *)value + 8);
    v11();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end