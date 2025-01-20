@interface CHTextInputQueryItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextInputQueryItem:(id)a3;
- (CHTextCorrectionResult)correctionResult;
- (NSArray)strokeIdentifiers;
- (NSNumber)itemIdentifier;
- (NSNumber)itemStableIdentifier;
- (id)description;
- (unint64_t)hash;
@end

@implementation CHTextInputQueryItem

- (id)description
{
  v7 = objc_msgSend_correctionResult(self, a2, v2, v3, v4, v5);
  v18 = objc_msgSend_error(v7, v8, v9, v10, v11, v12);
  if (v18)
  {
    v19 = NSString;
    v20 = objc_msgSend_correctionResult(self, v13, v14, v15, v16, v17);
    v26 = objc_msgSend_error(v20, v21, v22, v23, v24, v25);
    v32 = objc_msgSend_localizedDescription(v26, v27, v28, v29, v30, v31);
    objc_msgSend_stringWithFormat_(v19, v33, @", error: %@", v34, v35, v36, v32);
    v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v100 = &stru_1F20141C8;
  }

  v101.receiver = self;
  v101.super_class = (Class)CHTextInputQueryItem;
  v99 = [(CHTextInputQueryItem *)&v101 description];
  v42 = objc_msgSend_correctionResult(self, v37, v38, v39, v40, v41);
  v48 = objc_msgSend_textResult(v42, v43, v44, v45, v46, v47);
  uint64_t v54 = objc_msgSend_topTranscription(v48, v49, v50, v51, v52, v53);
  v60 = (void *)v54;
  if (v54) {
    v61 = (__CFString *)v54;
  }
  else {
    v61 = &stru_1F20141C8;
  }
  v62 = objc_msgSend_itemIdentifier(self, v55, v56, v57, v58, v59);
  v68 = objc_msgSend_itemStableIdentifier(self, v63, v64, v65, v66, v67);
  v74 = objc_msgSend_correctionResult(self, v69, v70, v71, v72, v73);
  uint64_t v80 = objc_msgSend_resultType(v74, v75, v76, v77, v78, v79);
  v86 = objc_msgSend_strokeIdentifiers(self, v81, v82, v83, v84, v85);
  uint64_t v92 = objc_msgSend_count(v86, v87, v88, v89, v90, v91);
  v97 = objc_msgSend_stringByAppendingFormat_(v99, v93, @" text: '%@', itemID: %@, stableItemID: %@, type: %ld, strokes: %ld%@", v94, v95, v96, v61, v62, v68, v80, v92, v100);

  return v97;
}

- (BOOL)isEqualToTextInputQueryItem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CHTextInputQueryItem *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char isEqual = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v11 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          int v31 = 138412290;
          v32 = v5;
          _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_FAULT, "item should be of class CHTextInputQueryItem: %@", (uint8_t *)&v31, 0xCu);
        }
      }
      uint64_t v12 = objc_msgSend_strokeIdentifiers(v5, v6, v7, v8, v9, v10);
      int isEqualToArray = objc_msgSend_isEqualToArray_(v12, v13, (uint64_t)self->_strokeIdentifiers, v14, v15, v16);

      correctionResult = self->_correctionResult;
      if (correctionResult) {
        char isEqual = 0;
      }
      else {
        char isEqual = isEqualToArray;
      }
      if (correctionResult && isEqualToArray)
      {
        uint64_t v25 = objc_msgSend_correctionResult(v5, v18, v19, v20, v21, v22);
        char isEqual = objc_msgSend_isEqual_(v25, v26, (uint64_t)self->_correctionResult, v27, v28, v29);
      }
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToTextInputQueryItem = objc_msgSend_isEqualToTextInputQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTextInputQueryItem;
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

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSNumber)itemStableIdentifier
{
  return self->_itemStableIdentifier;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHTextCorrectionResult)correctionResult
{
  return self->_correctionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemStableIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end