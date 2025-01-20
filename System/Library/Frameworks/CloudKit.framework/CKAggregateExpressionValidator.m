@interface CKAggregateExpressionValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (CKAggregateExpressionValidator)initWithValidators:(id)a3;
- (NSArray)subExpressionValidators;
- (id)CKPropertiesDescription;
- (void)setSubExpressionValidators:(id)a3;
@end

@implementation CKAggregateExpressionValidator

- (CKAggregateExpressionValidator)initWithValidators:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKAggregateExpressionValidator;
  id v3 = a3;
  v4 = [(CKAggregateExpressionValidator *)&v8 init];
  objc_msgSend_setSubExpressionValidators_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v137[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10 = objc_msgSend_subExpressionValidators(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v19 = isKindOfClass;
  id v20 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    v136[0] = *MEMORY[0x1E4F28568];
    v22 = objc_msgSend_stringWithFormat_(NSString, v16, @"<%@> is not an expression", v18, v6);
    v136[1] = @"ck_isComparisonError";
    v137[0] = v22;
    v137[1] = MEMORY[0x1E4F1CC38];
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v137, (uint64_t)v136, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, @"CKErrorDomain", 12, v24);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v19)
  {
    if (objc_msgSend_expressionType(v6, v16, v17, v18) == 14)
    {
      uint64_t v29 = objc_msgSend_constantValue(v6, v26, v27, v28);
      if (v29)
      {
        v33 = (void *)v29;
        v34 = objc_msgSend_constantValue(v6, v30, v31, v32);
        objc_opt_class();
        char v35 = objc_opt_isKindOfClass();

        if (v35)
        {
          v37 = objc_msgSend_subExpressionValidators(self, v30, v36, v32);
          unint64_t v41 = objc_msgSend_count(v37, v38, v39, v40);

          id v126 = v6;
          if (v41 < 2)
          {
LABEL_11:
            v45 = objc_msgSend_constantValue(v6, v42, v43, v44);
            v64 = objc_msgSend_subExpressionValidators(self, v61, v62, v63);
            v68 = objc_msgSend_firstObject(v64, v65, v66, v67);

            if (objc_msgSend_count(v45, v69, v70, v71))
            {
              uint64_t v75 = 0;
              v76 = v20;
              while (1)
              {
                if (v14 != 1)
                {
                  v77 = objc_msgSend_subExpressionValidators(self, v72, v73, v74);
                  uint64_t v80 = objc_msgSend_objectAtIndexedSubscript_(v77, v78, v75, v79);
                  v81 = v68;
                  v68 = (void *)v80;
                }
                objc_msgSend_objectAtIndexedSubscript_(v45, v72, v75, v74);
                id v20 = (id)objc_claimAutoreleasedReturnValue();
                if (a4)
                {
                  v83 = a4;
                  v84 = v45;
                  id v127 = v76;
                  v85 = v68;
                  char v86 = objc_msgSend_validate_error_(v68, v82, (uint64_t)v20, (uint64_t)&v127);
                  id v87 = v127;

                  if ((v86 & 1) == 0)
                  {
                    v116 = (void *)MEMORY[0x1E4F28C58];
                    v128[0] = *MEMORY[0x1E4F28568];
                    v117 = NSString;
                    v118 = objc_msgSend_localizedDescription(v87, v88, v89, v90);
                    v121 = objc_msgSend_stringWithFormat_(v117, v119, @"Aggregate value %lu of <%@> is invalid: %@", v120, v75, v126, v118);
                    uint64_t v122 = *MEMORY[0x1E4F28A50];
                    v129[0] = v121;
                    v129[1] = v87;
                    v128[1] = v122;
                    v128[2] = @"ck_isComparisonError";
                    v129[2] = MEMORY[0x1E4F1CC38];
                    v124 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v123, (uint64_t)v129, (uint64_t)v128, 3);
                    v76 = objc_msgSend_errorWithDomain_code_userInfo_(v116, v125, @"CKErrorDomain", 12, v124);

                    v45 = v84;
                    a4 = v83;
                    v68 = v85;
                    goto LABEL_28;
                  }
                  v76 = v87;
                  v45 = v84;
                  a4 = v83;
                  v68 = v85;
                }
                else if ((objc_msgSend_validate_error_(v68, v82, (uint64_t)v20, 0) & 1) == 0)
                {
                  goto LABEL_28;
                }

                if (++v75 >= (unint64_t)objc_msgSend_count(v45, v91, v92, v93))
                {
                  BOOL v94 = 1;
                  goto LABEL_29;
                }
              }
            }
            BOOL v94 = 1;
            goto LABEL_30;
          }
          v45 = objc_msgSend_constantValue(v6, v42, v43, v44);
          uint64_t v49 = objc_msgSend_count(v45, v46, v47, v48);
          v53 = objc_msgSend_subExpressionValidators(self, v50, v51, v52);
          uint64_t v57 = objc_msgSend_count(v53, v54, v55, v56);

          if (v49 == v57)
          {

            goto LABEL_11;
          }
          if (!a4)
          {
            BOOL v94 = 0;
LABEL_31:

            if (!a4) {
              goto LABEL_35;
            }
            goto LABEL_32;
          }
          v100 = (void *)MEMORY[0x1E4F28C58];
          v130[0] = *MEMORY[0x1E4F28568];
          v101 = NSString;
          v68 = objc_msgSend_subExpressionValidators(self, v58, v59, v60);
          uint64_t v105 = objc_msgSend_count(v68, v102, v103, v104);
          uint64_t v109 = objc_msgSend_count(v45, v106, v107, v108);
          uint64_t v112 = objc_msgSend_stringWithFormat_(v101, v110, @"Invalid number of values in <%@>. Expected %lu, but found %lu", v111, v6, v105, v109);
          v130[1] = @"ck_isComparisonError";
          v131[0] = v112;
          v131[1] = MEMORY[0x1E4F1CC38];
          v114 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v113, (uint64_t)v131, (uint64_t)v130, 2);
          v76 = objc_msgSend_errorWithDomain_code_userInfo_(v100, v115, @"CKErrorDomain", 12, v114);

          id v20 = (id)v112;
LABEL_28:

          BOOL v94 = 0;
LABEL_29:
          id v20 = v76;
LABEL_30:

          id v6 = v126;
          goto LABEL_31;
        }
      }
      if (a4)
      {
        v95 = (void *)MEMORY[0x1E4F28C58];
        v132[0] = *MEMORY[0x1E4F28568];
        id v126 = v6;
        v45 = objc_msgSend_stringWithFormat_(NSString, v30, @"%@ is not a valid aggregate", v32, v6);
        v132[1] = @"ck_isComparisonError";
        v133[0] = v45;
        v133[1] = MEMORY[0x1E4F1CC38];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v97, (uint64_t)v133, (uint64_t)v132, 2);
        goto LABEL_27;
      }
    }
    else if (a4)
    {
      v95 = (void *)MEMORY[0x1E4F28C58];
      v134[0] = *MEMORY[0x1E4F28568];
      id v126 = v6;
      v45 = objc_msgSend_stringWithFormat_(NSString, v26, @"<%@> is not an aggregate expression", v28, v6);
      v134[1] = @"ck_isComparisonError";
      v135[0] = v45;
      v135[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v96, (uint64_t)v135, (uint64_t)v134, 2);
      v68 = LABEL_27:;
      v76 = objc_msgSend_errorWithDomain_code_userInfo_(v95, v98, @"CKErrorDomain", 12, v68);
      goto LABEL_28;
    }
    BOOL v94 = 0;
    goto LABEL_35;
  }
  BOOL v94 = 0;
  if (!a4) {
    goto LABEL_35;
  }
LABEL_32:
  if (!v94)
  {
    id v20 = v20;
    BOOL v94 = 0;
    *a4 = v20;
  }
LABEL_35:

  return v94;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_subExpressionValidators(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"validators=%@", v7, v5);

  return v8;
}

- (NSArray)subExpressionValidators
{
  return self->_subExpressionValidators;
}

- (void)setSubExpressionValidators:(id)a3
{
}

- (void).cxx_destruct
{
}

@end