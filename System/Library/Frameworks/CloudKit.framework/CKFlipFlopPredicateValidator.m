@interface CKFlipFlopPredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKFlipFlopPredicateValidator)initWithValidator:(id)a3;
- (CKObjectValidating)validator;
- (id)CKPropertiesDescription;
- (void)setValidator:(id)a3;
@end

@implementation CKFlipFlopPredicateValidator

- (CKFlipFlopPredicateValidator)initWithValidator:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKFlipFlopPredicateValidator;
  id v3 = a3;
  v4 = [(CKFlipFlopPredicateValidator *)&v8 init];
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10 = objc_msgSend_validator(self, v7, v8, v9);
  v12 = v10;
  if (!a4)
  {
    char v17 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, 0);

    id v14 = 0;
    if (v17)
    {
      BOOL v16 = 1;
      id v15 = 0;
      goto LABEL_24;
    }
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
      if (!a4) {
        goto LABEL_23;
      }
      goto LABEL_14;
    }
    id v18 = v6;
    unint64_t v22 = objc_msgSend_predicateOperatorType(v18, v19, v20, v21);
    if (v22 > 5 || (uint64_t v26 = qword_18B1F3CE8[v22], objc_msgSend_comparisonPredicateModifier(v18, v23, v24, v25)))
    {
      id v15 = 0;
      goto LABEL_11;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F28B98]);
    v32 = objc_msgSend_rightExpression(v18, v29, v30, v31);
    v36 = objc_msgSend_leftExpression(v18, v33, v34, v35);
    uint64_t v40 = objc_msgSend_options(v18, v37, v38, v39);
    v42 = objc_msgSend_initWithLeftExpression_rightExpression_modifier_type_options_(v28, v41, (uint64_t)v32, (uint64_t)v36, 0, v26, v40);

    v46 = objc_msgSend_validator(self, v43, v44, v45);
    v48 = v46;
    if (a4)
    {
      id v52 = 0;
      char v49 = objc_msgSend_validate_error_(v46, v47, (uint64_t)v42, (uint64_t)&v52);
      id v15 = v52;

      if (v49) {
        goto LABEL_26;
      }
    }
    else
    {
      char v51 = objc_msgSend_validate_error_(v46, v47, (uint64_t)v42, 0);

      id v15 = 0;
      if (v51)
      {
LABEL_26:

        goto LABEL_4;
      }
    }
LABEL_11:

    if (!a4) {
      goto LABEL_23;
    }
LABEL_14:
    if (v14)
    {
      id v27 = v14;
      id v14 = v27;
LABEL_18:
      BOOL v16 = 0;
      *a4 = v27;
      goto LABEL_24;
    }
    if (v15)
    {
      id v27 = v15;
      id v15 = v27;
      id v14 = 0;
      goto LABEL_18;
    }
    id v14 = 0;
LABEL_23:
    BOOL v16 = 0;
    goto LABEL_24;
  }
  id v53 = 0;
  char v13 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)&v53);
  id v14 = v53;

  if ((v13 & 1) == 0) {
    goto LABEL_7;
  }
  id v15 = 0;
LABEL_4:
  BOOL v16 = 1;
LABEL_24:

  return v16;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_validator(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"validator=%@", v7, v5);

  return v8;
}

- (CKObjectValidating)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end