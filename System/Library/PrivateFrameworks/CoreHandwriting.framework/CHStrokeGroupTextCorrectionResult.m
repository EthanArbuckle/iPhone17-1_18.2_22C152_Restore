@interface CHStrokeGroupTextCorrectionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStrokeGroupTextCorrectionResult:(id)a3;
- (CHStrokeGroupTextCorrectionResult)init;
- (CHStrokeGroupTextCorrectionResult)initWithCoder:(id)a3;
- (CHStrokeGroupTextCorrectionResult)initWithTextCorrectionResult:(id)a3 inputStrokeIdentifiers:(id)a4;
- (CHTextCorrectionResult)textCorrectionResult;
- (NSArray)inputStrokeIdentifiers;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHStrokeGroupTextCorrectionResult

- (CHStrokeGroupTextCorrectionResult)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupTextCorrectionResult)initWithTextCorrectionResult:(id)a3 inputStrokeIdentifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHStrokeGroupTextCorrectionResult;
  v9 = [(CHStrokeGroupTextCorrectionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textCorrectionResult, a3);
    objc_storeStrong((id *)&v10->_inputStrokeIdentifiers, a4);
  }

  return v10;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CHStrokeGroupTextCorrectionResult;
  v3 = [(CHStrokeGroupTextCorrectionResult *)&v16 description];
  v9 = objc_msgSend_textCorrectionResult(self, v4, v5, v6, v7, v8);
  v14 = objc_msgSend_stringByAppendingFormat_(v3, v10, @" %@", v11, v12, v13, v9);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v4, (uint64_t)self->_textCorrectionResult, @"textCorrectionResult", v5, v6);
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->_inputStrokeIdentifiers, @"inputStrokeIdentifiers", v8, v9);
}

- (CHStrokeGroupTextCorrectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"textCorrectionResult", v7, v8);
  uint64_t v10 = objc_opt_class();
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"inputStrokeIdentifiers", v12, v13);
  v18 = (CHStrokeGroupTextCorrectionResult *)objc_msgSend_initWithTextCorrectionResult_inputStrokeIdentifiers_(self, v15, (uint64_t)v9, (uint64_t)v14, v16, v17);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToStrokeGroupTextCorrectionResult:(id)a3
{
  id v4 = (CHStrokeGroupTextCorrectionResult *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {
    char v29 = 1;
    goto LABEL_11;
  }
  textCorrectionResult = self->_textCorrectionResult;
  objc_msgSend_textCorrectionResult(v4, v5, v6, v7, v8, v9);
  uint64_t v17 = (CHTextCorrectionResult *)objc_claimAutoreleasedReturnValue();
  if (textCorrectionResult == v17)
  {
  }
  else
  {
    v18 = objc_msgSend_textCorrectionResult(v10, v12, v13, v14, v15, v16);
    int isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_textCorrectionResult, v20, v21, v22);

    if (!isEqual)
    {
      char v29 = 0;
      goto LABEL_11;
    }
  }
  inputStrokeIdentifiers = self->_inputStrokeIdentifiers;
  objc_msgSend_inputStrokeIdentifiers(v10, v24, v25, v26, v27, v28);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (inputStrokeIdentifiers == v36)
  {
    char v29 = 1;
  }
  else
  {
    v37 = objc_msgSend_inputStrokeIdentifiers(v10, v31, v32, v33, v34, v35);
    char v29 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_inputStrokeIdentifiers, v39, v40, v41);
  }
LABEL_11:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToStrokeGroupTextCorrectionResult = objc_msgSend_isEqualToStrokeGroupTextCorrectionResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToStrokeGroupTextCorrectionResult;
  }
  else
  {

    return 0;
  }
}

- (NSArray)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (CHTextCorrectionResult)textCorrectionResult
{
  return self->_textCorrectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCorrectionResult, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
}

@end