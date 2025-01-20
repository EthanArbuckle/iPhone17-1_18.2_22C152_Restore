@interface CKComparisonPredicateValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKObjectValidating)leftExpressionValidator;
- (CKObjectValidating)modifierValidator;
- (CKObjectValidating)operatorValidator;
- (CKObjectValidating)optionsValidator;
- (CKObjectValidating)rightExpressionValidator;
- (id)CKPropertiesDescription;
- (void)setLeftExpressionValidator:(id)a3;
- (void)setModifierValidator:(id)a3;
- (void)setOperatorValidator:(id)a3;
- (void)setOptionsValidator:(id)a3;
- (void)setRightExpressionValidator:(id)a3;
@end

@implementation CKComparisonPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v121[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v120[0] = *MEMORY[0x1E4F28568];
    v20 = objc_msgSend_stringWithFormat_(NSString, v7, @"%@ is not a comparison predicate", v9, v6);
    v120[1] = @"ck_isComparisonError";
    v121[0] = v20;
    v121[1] = MEMORY[0x1E4F1CC38];
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v121, (uint64_t)v120, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v23, @"CKErrorDomain", 12, v22);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
LABEL_25:
      id v18 = v18;
      char v83 = 0;
      *a4 = v18;
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  v10 = objc_msgSend_modifierValidator(self, v7, v8, v9);
  v12 = v10;
  if (a4)
  {
    id v109 = 0;
    char v13 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)&v109);
    id v14 = v109;

    if ((v13 & 1) == 0)
    {
      v47 = (void *)MEMORY[0x1E4F28C58];
      v118[0] = *MEMORY[0x1E4F28568];
      v55 = NSString;
      v49 = objc_msgSend_localizedDescription(v14, v15, v16, v17);
      v52 = objc_msgSend_stringWithFormat_(v55, v56, @"Invalid modifier in <%@>: %@", v57, v6, v49);
      uint64_t v58 = *MEMORY[0x1E4F28A50];
      v119[0] = v52;
      v119[1] = v14;
      v118[1] = v58;
      v118[2] = @"ck_isComparisonError";
      v119[2] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v59, (uint64_t)v119, (uint64_t)v118, 3);
      goto LABEL_23;
    }
    id v18 = v14;
  }
  else
  {
    char v24 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, 0);

    id v18 = 0;
    if ((v24 & 1) == 0) {
      goto LABEL_21;
    }
  }
  v25 = objc_msgSend_leftExpressionValidator(self, v15, v16, v17);
  v30 = objc_msgSend_leftExpression(v6, v26, v27, v28);
  if (!a4)
  {
    char v60 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, 0);

    if (v60)
    {
      v64 = objc_msgSend_operatorValidator(self, v61, v62, v63);
      char v66 = objc_msgSend_validate_error_(v64, v65, (uint64_t)v6, 0);

      if (v66)
      {
        v70 = objc_msgSend_optionsValidator(self, v67, v68, v69);
        char v72 = objc_msgSend_validate_error_(v70, v71, (uint64_t)v6, 0);

        if (v72)
        {
          id v14 = v18;
          goto LABEL_18;
        }
      }
    }
LABEL_21:
    char v83 = 0;
    goto LABEL_26;
  }
  id v108 = v18;
  char v31 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, (uint64_t)&v108);
  id v14 = v108;

  if ((v31 & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    v116[0] = *MEMORY[0x1E4F28568];
    v84 = NSString;
    v49 = objc_msgSend_localizedDescription(v14, v32, v33, v34);
    v52 = objc_msgSend_stringWithFormat_(v84, v85, @"Invalid left expression in <%@>: %@", v86, v6, v49);
    uint64_t v87 = *MEMORY[0x1E4F28A50];
    v117[0] = v52;
    v117[1] = v14;
    v116[1] = v87;
    v116[2] = @"ck_isComparisonError";
    v117[2] = MEMORY[0x1E4F1CC38];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v88, (uint64_t)v117, (uint64_t)v116, 3);
    goto LABEL_23;
  }
  v35 = objc_msgSend_operatorValidator(self, v32, v33, v34);
  id v107 = v14;
  char v37 = objc_msgSend_validate_error_(v35, v36, (uint64_t)v6, (uint64_t)&v107);
  id v18 = v107;

  if ((v37 & 1) == 0)
  {
    v93 = (void *)MEMORY[0x1E4F28C58];
    v114[0] = *MEMORY[0x1E4F28568];
    v94 = NSString;
    v49 = objc_msgSend_localizedDescription(v18, v38, v39, v40);
    v52 = objc_msgSend_stringWithFormat_(v94, v95, @"Invalid operator in <%@>: %@", v96, v6, v49);
    uint64_t v97 = *MEMORY[0x1E4F28A50];
    v115[0] = v52;
    v115[1] = v18;
    v114[1] = v97;
    v114[2] = @"ck_isComparisonError";
    v115[2] = MEMORY[0x1E4F1CC38];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v98, (uint64_t)v115, (uint64_t)v114, 3);
    v89 = LABEL_28:;
    uint64_t v91 = objc_msgSend_errorWithDomain_code_userInfo_(v93, v99, @"CKErrorDomain", 12, v89);
    id v14 = v18;
    goto LABEL_24;
  }
  v41 = objc_msgSend_optionsValidator(self, v38, v39, v40);
  id v106 = v18;
  char v43 = objc_msgSend_validate_error_(v41, v42, (uint64_t)v6, (uint64_t)&v106);
  id v14 = v106;

  if ((v43 & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E4F28C58];
    v112[0] = *MEMORY[0x1E4F28568];
    v48 = NSString;
    v49 = objc_msgSend_localizedDescription(v14, v44, v45, v46);
    v52 = objc_msgSend_stringWithFormat_(v48, v50, @"Invalid options in <%@>: %@", v51, v6, v49);
    uint64_t v53 = *MEMORY[0x1E4F28A50];
    v113[0] = v52;
    v113[1] = v14;
    v112[1] = v53;
    v112[2] = @"ck_isComparisonError";
    v113[2] = MEMORY[0x1E4F1CC38];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v54, (uint64_t)v113, (uint64_t)v112, 3);
    v89 = LABEL_23:;
    uint64_t v91 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v90, @"CKErrorDomain", 12, v89);
LABEL_24:

    id v18 = (id)v91;
    goto LABEL_25;
  }
LABEL_18:
  v73 = objc_msgSend_rightExpressionValidator(self, v44, v45, v46);
  v78 = objc_msgSend_rightExpression(v6, v74, v75, v76);
  if (!a4)
  {
    char v83 = objc_msgSend_validate_error_(v73, v77, (uint64_t)v78, 0);

    id v18 = v14;
    goto LABEL_26;
  }
  id v105 = v14;
  char v79 = objc_msgSend_validate_error_(v73, v77, (uint64_t)v78, (uint64_t)&v105);
  id v18 = v105;

  if ((v79 & 1) == 0)
  {
    v93 = (void *)MEMORY[0x1E4F28C58];
    v110[0] = *MEMORY[0x1E4F28568];
    v100 = NSString;
    v49 = objc_msgSend_localizedDescription(v18, v80, v81, v82);
    v52 = objc_msgSend_stringWithFormat_(v100, v101, @"Invalid right expression in <%@>: %@", v102, v6, v49);
    uint64_t v103 = *MEMORY[0x1E4F28A50];
    v111[0] = v52;
    v111[1] = v18;
    v110[1] = v103;
    v110[2] = @"ck_isComparisonError";
    v111[2] = MEMORY[0x1E4F1CC38];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v104, (uint64_t)v111, (uint64_t)v110, 3);
    goto LABEL_28;
  }
  char v83 = 1;
LABEL_26:

  return v83;
}

- (id)CKPropertiesDescription
{
  v3 = objc_opt_new();
  v7 = objc_msgSend_modifierValidator(self, v4, v5, v6);

  if (v7)
  {
    v11 = NSString;
    v12 = objc_msgSend_modifierValidator(self, v8, v9, v10);
    v15 = objc_msgSend_stringWithFormat_(v11, v13, @"modifierValidator=%@", v14, v12);
    objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);
  }
  id v18 = objc_msgSend_leftExpressionValidator(self, v8, v9, v10);

  if (v18)
  {
    v22 = NSString;
    v23 = objc_msgSend_leftExpressionValidator(self, v19, v20, v21);
    v26 = objc_msgSend_stringWithFormat_(v22, v24, @"leftExpressionValidator=%@", v25, v23);
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26, v28);
  }
  v29 = objc_msgSend_operatorValidator(self, v19, v20, v21);

  if (v29)
  {
    uint64_t v33 = NSString;
    uint64_t v34 = objc_msgSend_operatorValidator(self, v30, v31, v32);
    char v37 = objc_msgSend_stringWithFormat_(v33, v35, @"operatorValidator=%@", v36, v34);
    objc_msgSend_addObject_(v3, v38, (uint64_t)v37, v39);
  }
  uint64_t v40 = objc_msgSend_optionsValidator(self, v30, v31, v32);

  if (v40)
  {
    v44 = NSString;
    uint64_t v45 = objc_msgSend_optionsValidator(self, v41, v42, v43);
    v48 = objc_msgSend_stringWithFormat_(v44, v46, @"optionsValidator=%@", v47, v45);
    objc_msgSend_addObject_(v3, v49, (uint64_t)v48, v50);
  }
  uint64_t v51 = objc_msgSend_rightExpressionValidator(self, v41, v42, v43);

  if (v51)
  {
    v55 = NSString;
    v56 = objc_msgSend_rightExpressionValidator(self, v52, v53, v54);
    v59 = objc_msgSend_stringWithFormat_(v55, v57, @"rightExpressionValidator=%@", v58, v56);
    objc_msgSend_addObject_(v3, v60, (uint64_t)v59, v61);
  }
  uint64_t v62 = objc_msgSend_componentsJoinedByString_(v3, v52, @", ", v54);

  return v62;
}

- (CKObjectValidating)modifierValidator
{
  return self->_modifierValidator;
}

- (void)setModifierValidator:(id)a3
{
}

- (CKObjectValidating)leftExpressionValidator
{
  return self->_leftExpressionValidator;
}

- (void)setLeftExpressionValidator:(id)a3
{
}

- (CKObjectValidating)operatorValidator
{
  return self->_operatorValidator;
}

- (void)setOperatorValidator:(id)a3
{
}

- (CKObjectValidating)optionsValidator
{
  return self->_optionsValidator;
}

- (void)setOptionsValidator:(id)a3
{
}

- (CKObjectValidating)rightExpressionValidator
{
  return self->_rightExpressionValidator;
}

- (void)setRightExpressionValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpressionValidator, 0);
  objc_storeStrong((id *)&self->_optionsValidator, 0);
  objc_storeStrong((id *)&self->_operatorValidator, 0);
  objc_storeStrong((id *)&self->_leftExpressionValidator, 0);

  objc_storeStrong((id *)&self->_modifierValidator, 0);
}

@end