@interface CHDataDetectorQueryItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDataDetectorQueryItem:(id)a3;
- (CGPath)estimatedBaseline;
- (DDScannerResult)dataDetectorResult;
- (NSSet)strokeIdentifiers;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation CHDataDetectorQueryItem

- (void)dealloc
{
  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline) {
    CGPathRelease(estimatedBaseline);
  }
  v4.receiver = self;
  v4.super_class = (Class)CHDataDetectorQueryItem;
  [(CHDataDetectorQueryItem *)&v4 dealloc];
}

- (id)description
{
  v28.receiver = self;
  v28.super_class = (Class)CHDataDetectorQueryItem;
  v3 = [(CHDataDetectorQueryItem *)&v28 description];
  v9 = objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  v15 = objc_msgSend_dataDetectorResult(self, v10, v11, v12, v13, v14);
  v21 = objc_msgSend_type(v15, v16, v17, v18, v19, v20);
  v26 = objc_msgSend_stringByAppendingFormat_(v3, v22, @" strokeIdentifiers: %@, result type: %@", v23, v24, v25, v9, v21);

  return v26;
}

- (BOOL)isEqualToDataDetectorQueryItem:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (CHDataDetectorQueryItem *)a3;
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
      int v84 = 138412290;
      v85 = v4;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHDataDetectorQueryItem: %@", (uint8_t *)&v84, 0xCu);
    }
  }
  if (v4 == self)
  {
    BOOL v82 = 1;
    goto LABEL_15;
  }
  uint64_t v11 = objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  uint64_t v17 = objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  int isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual) {
    goto LABEL_13;
  }
  objc_super v28 = objc_msgSend_dataDetectorResult(v4, v23, v24, v25, v26, v27);
  int v34 = objc_msgSend_category(v28, v29, v30, v31, v32, v33);
  v40 = objc_msgSend_dataDetectorResult(self, v35, v36, v37, v38, v39);
  BOOL v46 = v34 == objc_msgSend_category(v40, v41, v42, v43, v44, v45);

  if (!v46) {
    goto LABEL_13;
  }
  v52 = objc_msgSend_dataDetectorResult(v4, v47, v48, v49, v50, v51);
  v58 = objc_msgSend_type(v52, v53, v54, v55, v56, v57);
  v64 = objc_msgSend_dataDetectorResult(self, v59, v60, v61, v62, v63);
  v70 = objc_msgSend_type(v64, v65, v66, v67, v68, v69);
  int isEqualToString = objc_msgSend_isEqualToString_(v58, v71, (uint64_t)v70, v72, v73, v74);

  if (isEqualToString)
  {
    v81 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v76, v77, v78, v79, v80);
    BOOL v82 = CGPathEqualToPath(v81, self->_estimatedBaseline);
  }
  else
  {
LABEL_13:
    BOOL v82 = 0;
  }
LABEL_15:

  return v82;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToDataDetectorQueryItem = objc_msgSend_isEqualToDataDetectorQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToDataDetectorQueryItem;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
}

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (DDScannerResult)dataDetectorResult
{
  return self->_dataDetectorResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end