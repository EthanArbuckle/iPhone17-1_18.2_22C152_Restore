@interface CKFunctionExpressionValidator
- (BOOL)validate:(id)a3 error:(id *)a4;
- (id)CKPropertiesDescription;
@end

@implementation CKFunctionExpressionValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  v119[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v11 = isKindOfClass;
  id v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v118[0] = *MEMORY[0x1E4F28568];
    v14 = objc_msgSend_stringWithFormat_(NSString, v8, @"<%@> is not an expression", v10, v6);
    v118[1] = @"ck_isComparisonError";
    v119[0] = v14;
    v119[1] = MEMORY[0x1E4F1CC38];
    v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v119, (uint64_t)v118, 2);
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, @"CKErrorDomain", 12, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    if (objc_msgSend_expressionType(v6, v8, v9, v10) == 4)
    {
      v21 = objc_msgSend_function(v6, v18, v19, v20);
      v24 = v21;
      if (self) {
        char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)self->_functionName, v23);
      }
      else {
        char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, 0, v23);
      }
      char v26 = isEqualToString;

      if (v26)
      {
        v30 = objc_msgSend_arguments(v6, v27, v28, v29);
        uint64_t v37 = objc_msgSend_count(v30, v31, v32, v33);
        if (self) {
          uint64_t v38 = objc_msgSend_count(self->_argumentValidators, v34, v35, v36);
        }
        else {
          uint64_t v38 = objc_msgSend_count(0, v34, v35, v36);
        }
        uint64_t v39 = v38;

        if (v37 == v39)
        {
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          if (self) {
            argumentValidators = self->_argumentValidators;
          }
          else {
            argumentValidators = 0;
          }
          obj = argumentValidators;
          uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v105, (uint64_t)v111, 16);
          if (v42)
          {
            uint64_t v46 = v42;
            uint64_t v47 = 0;
            uint64_t v48 = *(void *)v106;
            while (2)
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v106 != v48) {
                  objc_enumerationMutation(obj);
                }
                v50 = *(void **)(*((void *)&v105 + 1) + 8 * i);
                v51 = objc_msgSend_arguments(v6, v43, v44, v45);
                objc_msgSend_objectAtIndexedSubscript_(v51, v52, v47 + i, v53);
                v54 = (NSArray *)objc_claimAutoreleasedReturnValue();

                if (a4)
                {
                  id v104 = v12;
                  char v56 = objc_msgSend_validate_error_(v50, v55, (uint64_t)v54, (uint64_t)&v104);
                  id v57 = v104;

                  if ((v56 & 1) == 0)
                  {
                    v94 = (void *)MEMORY[0x1E4F28C58];
                    v109[0] = *MEMORY[0x1E4F28568];
                    v95 = NSString;
                    objc_msgSend_localizedDescription(v57, v58, v59, v60);
                    id v12 = (id)objc_claimAutoreleasedReturnValue();
                    v98 = objc_msgSend_stringWithFormat_(v95, v96, @"Argument %lu of <%@> is invalid: %@", v97, v47 + i, v6, v12);
                    uint64_t v99 = *MEMORY[0x1E4F28A50];
                    v110[0] = v98;
                    v110[1] = v57;
                    v109[1] = v99;
                    v109[2] = @"ck_isComparisonError";
                    v110[2] = MEMORY[0x1E4F1CC38];
                    v101 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v100, (uint64_t)v110, (uint64_t)v109, 3);
                    uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(v94, v102, @"CKErrorDomain", 12, v101);

                    goto LABEL_39;
                  }
                  id v12 = v57;
                }
                else if ((objc_msgSend_validate_error_(v50, v55, (uint64_t)v54, 0) & 1) == 0)
                {
                  goto LABEL_40;
                }
              }
              uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v105, (uint64_t)v111, 16);
              v47 += i;
              BOOL v61 = 1;
              if (v46) {
                continue;
              }
              break;
            }
          }
          else
          {
            BOOL v61 = 1;
          }
LABEL_41:

          if (!a4) {
            goto LABEL_45;
          }
          goto LABEL_42;
        }
        if (a4)
        {
          v74 = (void *)MEMORY[0x1E4F28C58];
          v112[0] = *MEMORY[0x1E4F28568];
          v75 = NSString;
          if (self) {
            v76 = self->_argumentValidators;
          }
          else {
            v76 = 0;
          }
          v54 = v76;
          uint64_t v80 = objc_msgSend_count(v54, v77, v78, v79);
          objc_msgSend_arguments(v6, v81, v82, v83);
          obj = (NSArray *)objc_claimAutoreleasedReturnValue();
          uint64_t v87 = objc_msgSend_count(obj, v84, v85, v86);
          uint64_t v72 = objc_msgSend_stringWithFormat_(v75, v88, @"Invalid number of arguments to <%@>. Expected %lu, but found %lu", v89, v6, v80, v87);
          v112[1] = @"ck_isComparisonError";
          v113[0] = v72;
          v113[1] = MEMORY[0x1E4F1CC38];
          v91 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v90, (uint64_t)v113, (uint64_t)v112, 2);
          uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(v74, v92, @"CKErrorDomain", 12, v91);

LABEL_38:
          id v12 = (id)v72;
LABEL_39:

          id v12 = (id)v65;
LABEL_40:

          BOOL v61 = 0;
          goto LABEL_41;
        }
      }
      else if (a4)
      {
        v66 = (void *)MEMORY[0x1E4F28C58];
        v114[0] = *MEMORY[0x1E4F28568];
        v67 = NSString;
        if (self) {
          functionName = self->_functionName;
        }
        else {
          functionName = 0;
        }
        obj = functionName;
        objc_msgSend_stringWithFormat_(v67, v69, @"%@ does not match function '%@'", v70, v6, obj);
        v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v114[1] = @"ck_isComparisonError";
        v115[0] = v54;
        v115[1] = MEMORY[0x1E4F1CC38];
        uint64_t v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v115, (uint64_t)v114, 2);
        uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(v66, v73, @"CKErrorDomain", 12, v72);

        goto LABEL_38;
      }
    }
    else if (a4)
    {
      v62 = (void *)MEMORY[0x1E4F28C58];
      v116[0] = *MEMORY[0x1E4F28568];
      objc_msgSend_stringWithFormat_(NSString, v18, @"<%@> is not a function expression", v20, v6);
      v116[1] = @"ck_isComparisonError";
      obj = (NSArray *)objc_claimAutoreleasedReturnValue();
      v117[0] = obj;
      v117[1] = MEMORY[0x1E4F1CC38];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v63, (uint64_t)v117, (uint64_t)v116, 2);
      v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v65 = objc_msgSend_errorWithDomain_code_userInfo_(v62, v64, @"CKErrorDomain", 12, v54);
      goto LABEL_39;
    }
    BOOL v61 = 0;
    goto LABEL_45;
  }
  BOOL v61 = 0;
  if (!a4) {
    goto LABEL_45;
  }
LABEL_42:
  if (!v61)
  {
    id v12 = v12;
    BOOL v61 = 0;
    *a4 = v12;
  }
LABEL_45:

  return v61;
}

- (id)CKPropertiesDescription
{
  v3 = NSString;
  if (self)
  {
    v5 = self->_functionName;
    objc_msgSend_stringWithFormat_(v3, v6, @"functionName=%@, validators=%@", v7, v5, self->_argumentValidators);
  }
  else
  {
    v5 = 0;
    objc_msgSend_stringWithFormat_(NSString, a2, @"functionName=%@, validators=%@", v2, 0, 0);
  v8 = };

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentValidators, 0);

  objc_storeStrong((id *)&self->_functionName, 0);
}

@end