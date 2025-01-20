@interface CHPrefixQueryItem
- (BOOL)isEqualToPrefixQueryItem:(id)a3;
- (CGPath)estimatedBaseline;
- (NSSet)strokeIdentifiers;
- (NSString)queryResult;
- (void)dealloc;
@end

@implementation CHPrefixQueryItem

- (void)dealloc
{
  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline) {
    CGPathRelease(estimatedBaseline);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHPrefixQueryItem;
  [(CHPrefixQueryItem *)&v4 dealloc];
}

- (BOOL)isEqualToPrefixQueryItem:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (CHPrefixQueryItem *)a3;
  if (!v4) {
    goto LABEL_12;
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
      int v48 = 138412290;
      v49 = v4;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHPrefixQueryItem: %@", (uint8_t *)&v48, 0xCu);
    }
  }
  if (v4 == self)
  {
    BOOL v46 = 1;
    goto LABEL_14;
  }
  v11 = objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v17 = objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual) {
    goto LABEL_12;
  }
  v28 = objc_msgSend_queryResult(v4, v23, v24, v25, v26, v27);
  v34 = objc_msgSend_queryResult(self, v29, v30, v31, v32, v33);
  int isEqualToString = objc_msgSend_isEqualToString_(v28, v35, (uint64_t)v34, v36, v37, v38);

  if (isEqualToString)
  {
    v45 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v40, v41, v42, v43, v44);
    BOOL v46 = CGPathEqualToPath(v45, self->_estimatedBaseline);
  }
  else
  {
LABEL_12:
    BOOL v46 = 0;
  }
LABEL_14:

  return v46;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSString)queryResult
{
  return self->_queryResult;
}

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end