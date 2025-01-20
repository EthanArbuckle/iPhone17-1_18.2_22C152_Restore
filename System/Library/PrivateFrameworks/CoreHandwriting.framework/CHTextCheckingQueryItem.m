@interface CHTextCheckingQueryItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextCheckingQueryItem:(id)a3;
- (BOOL)isEquivalentToTextCheckingQueryItem:(id)a3;
- (CGPath)estimatedBaseline;
- (NSArray)replacementStrings;
- (NSSet)strokeIdentifiers;
- (NSTextCheckingResult)textCheckingResult;
- (_NSRange)replacementRange;
- (id)description;
- (int)textCheckingResultType;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CHTextCheckingQueryItem

- (void)dealloc
{
  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline) {
    CGPathRelease(estimatedBaseline);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHTextCheckingQueryItem;
  [(CHTextCheckingQueryItem *)&v4 dealloc];
}

- (id)description
{
  v23.receiver = self;
  v23.super_class = (Class)CHTextCheckingQueryItem;
  v3 = [(CHTextCheckingQueryItem *)&v23 description];
  v9 = objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  uint64_t textCheckingResultType = self->_textCheckingResultType;
  v16 = objc_msgSend_replacementStrings(self, v11, v12, v13, v14, v15);
  v21 = objc_msgSend_stringByAppendingFormat_(v3, v17, @" strokeIdentifiers: %@, correction type = %d, replacement strings = %@", v18, v19, v20, v9, textCheckingResultType, v16);

  return v21;
}

- (BOOL)isEqualToTextCheckingQueryItem:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (CHTextCheckingQueryItem *)a3;
  if (!v4) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v53 = 138412290;
      v54 = v4;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHTextCheckingQueryItem: %@", (uint8_t *)&v53, 0xCu);
    }
  }
  if (v4 == self)
  {
    BOOL v51 = 1;
    goto LABEL_15;
  }
  v11 = objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v17 = objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual) {
    goto LABEL_13;
  }
  if (objc_msgSend_textCheckingResultType(v4, v23, v24, v25, v26, v27) == self->_textCheckingResultType
    && (objc_msgSend_replacementStrings(v4, v28, v29, v30, v31, v32),
        v33 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_replacementStrings(self, v34, v35, v36, v37, v38),
        v39 = objc_claimAutoreleasedReturnValue(),
        int v44 = objc_msgSend_isEqual_(v33, v40, (uint64_t)v39, v41, v42, v43),
        v39,
        v33,
        v44))
  {
    v50 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v45, v46, v47, v48, v49);
    BOOL v51 = CGPathEqualToPath(v50, self->_estimatedBaseline);
  }
  else
  {
LABEL_13:
    BOOL v51 = 0;
  }
LABEL_15:

  return v51;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTextCheckingQueryItem = objc_msgSend_isEqualToTextCheckingQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTextCheckingQueryItem;
  }
  else
  {

    return 0;
  }
}

- (BOOL)isEquivalentToTextCheckingQueryItem:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (CHTextCheckingQueryItem *)a3;
  if (!v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v30 = 138412290;
      uint64_t v31 = v4;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHTextCheckingQueryItem: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  if (v4 == self)
  {
    BOOL v28 = 1;
    goto LABEL_13;
  }
  v11 = objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v17 = objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (isEqual) {
    BOOL v28 = objc_msgSend_textCheckingResultType(v4, v23, v24, v25, v26, v27) == self->_textCheckingResultType;
  }
  else {
LABEL_11:
  }
    BOOL v28 = 0;
LABEL_13:

  return v28;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5) ^ self->_textCheckingResultType;
}

- (NSArray)replacementStrings
{
  v64[1] = *MEMORY[0x1E4F143B8];
  int textCheckingResultType = self->_textCheckingResultType;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (textCheckingResultType != 1)
  {
    if (textCheckingResultType) {
      goto LABEL_13;
    }
    textCheckingResult = self->_textCheckingResult;
    if (textCheckingResult)
    {
      v10 = objc_msgSend_replacementString(textCheckingResult, a2, v2, v3, v4, v5);

      if (v10)
      {
        v11 = objc_msgSend_alternativeStrings(self->_textCheckingResult, a2, v2, v3, v4, v5);
        uint64_t v17 = objc_msgSend_count(v11, v12, v13, v14, v15, v16);

        uint64_t v26 = objc_msgSend_replacementString(self->_textCheckingResult, v18, v19, v20, v21, v22);
        if (v17)
        {
          v63 = v26;
          uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)&v63, 1, v24, v25);
          v33 = objc_msgSend_alternativeStrings(self->_textCheckingResult, v28, v29, v30, v31, v32);
          uint64_t v8 = objc_msgSend_arrayByAddingObjectsFromArray_(v27, v34, (uint64_t)v33, v35, v36, v37);
        }
        else
        {
          v64[0] = v26;
          uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v64, 1, v24, v25);
        }
      }
    }
  }
  uint64_t v38 = self->_textCheckingResult;
  if (v38)
  {
    if (self->_textCheckingResultGrammarDetailIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = objc_msgSend_grammarDetails(v38, a2, v2, v3, v4, v5);
      BOOL v45 = (unint64_t)objc_msgSend_count(v39, v40, v41, v42, v43, v44) > self->_textCheckingResultGrammarDetailIndex;

      if (v45)
      {
        BOOL v51 = objc_msgSend_grammarDetails(self->_textCheckingResult, v46, v47, v48, v49, v50);
        v56 = objc_msgSend_objectAtIndexedSubscript_(v51, v52, self->_textCheckingResultGrammarDetailIndex, v53, v54, v55);
        uint64_t v61 = objc_msgSend_objectForKey_(v56, v57, @"NSGrammarCorrections", v58, v59, v60);

        uint64_t v8 = (void *)v61;
      }
    }
  }
LABEL_13:
  return (NSArray *)v8;
}

- (_NSRange)replacementRange
{
  int textCheckingResultType = self->_textCheckingResultType;
  if (textCheckingResultType == 1)
  {
    textCheckingResult = self->_textCheckingResult;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (textCheckingResult && self->_textCheckingResultGrammarDetailIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = objc_msgSend_grammarDetails(textCheckingResult, a2, v2, v3, v4, v5);
      unint64_t v20 = objc_msgSend_count(v14, v15, v16, v17, v18, v19);
      unint64_t textCheckingResultGrammarDetailIndex = self->_textCheckingResultGrammarDetailIndex;

      if (v20 <= textCheckingResultGrammarDetailIndex) {
        goto LABEL_11;
      }
      uint64_t v27 = objc_msgSend_grammarDetails(self->_textCheckingResult, v22, v23, v24, v25, v26);
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v27, v28, self->_textCheckingResultGrammarDetailIndex, v29, v30, v31);
      uint64_t v37 = objc_msgSend_objectForKey_(v32, v33, @"NSGrammarRange", v34, v35, v36);
      uint64_t v12 = objc_msgSend_rangeValue(v37, v38, v39, v40, v41, v42);
      NSUInteger v13 = v43;
    }
    else
    {
      NSUInteger v13 = 0;
    }
LABEL_12:
    NSUInteger v9 = v12;
    NSUInteger v10 = v13;
    goto LABEL_13;
  }
  if (textCheckingResultType)
  {
LABEL_11:
    NSUInteger v13 = 0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  uint64_t v8 = self->_textCheckingResult;
  NSUInteger v9 = objc_msgSend_range(v8, a2, v2, v3, v4, v5);
LABEL_13:
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (int)textCheckingResultType
{
  return self->_textCheckingResultType;
}

- (NSTextCheckingResult)textCheckingResult
{
  return self->_textCheckingResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckingResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end