@interface GDKnosisIntentArgInfo
+ (BOOL)supportsSecureCoding;
- (GDKnosisIntentArgInfo)initWithCoder:(id)a3;
- (GDKnosisIntentArgInfo)initWithIntent:(id)a3 args:(id)a4 score:(id)a5;
- (NSNumber)score;
- (NSSet)args;
- (NSString)intent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisIntentArgInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_args, 0);

  objc_storeStrong((id *)&self->_intent, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSSet)args
{
  return self->_args;
}

- (NSString)intent
{
  return self->_intent;
}

- (GDKnosisIntentArgInfo)initWithCoder:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_intent);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v14, v17, v15, v18, v19, v16, 0);
    v21 = NSStringFromSelector(sel_args);
    v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21, v23);

    if (v24)
    {
      uint64_t v29 = objc_opt_class();
      v30 = NSStringFromSelector(sel_score);
      v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, (uint64_t)v30, v32);

      if (v33)
      {
        self = (GDKnosisIntentArgInfo *)(id)objc_msgSend_initWithIntent_args_score_(self, v34, (uint64_t)v9, (uint64_t)v24, (uint64_t)v33);
        v38 = self;
LABEL_15:

        goto LABEL_16;
      }
      v43 = objc_msgSend_error(v4, v34, v35, v36, v37);

      if (!v43)
      {
        v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        v65 = @"GDKnosisIntentArgInfo score is nil";
        v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v44, (uint64_t)&v65, (uint64_t)&v64, 1);
        v48 = objc_msgSend_errorWithDomain_code_userInfo_(v45, v47, @"GDErrorDomain", 9, (uint64_t)v46);
        objc_msgSend_failWithError_(v4, v49, (uint64_t)v48, v50, v51);
      }
      v33 = 0;
    }
    else
    {
      v41 = objc_msgSend_error(v4, v25, v26, v27, v28);

      if (v41)
      {
        v24 = 0;
        v38 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v67 = @"GDKnosisIntentArgInfo args is nil";
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v42, (uint64_t)&v67, (uint64_t)&v66, 1);
      v59 = objc_msgSend_errorWithDomain_code_userInfo_(v57, v58, @"GDErrorDomain", 9, (uint64_t)v33);
      objc_msgSend_failWithError_(v4, v60, (uint64_t)v59, v61, v62);

      v24 = 0;
    }
LABEL_14:
    v38 = 0;
    goto LABEL_15;
  }
  v39 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v39)
  {
    v52 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28568];
    v69[0] = @"GDKnosisIntentArgInfo intent is nil";
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v69, (uint64_t)&v68, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(v52, v53, @"GDErrorDomain", 9, (uint64_t)v24);
    objc_msgSend_failWithError_(v4, v54, (uint64_t)v33, v55, v56);
    goto LABEL_14;
  }
  v38 = 0;
LABEL_17:

  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  intent = self->_intent;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_intent);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)intent, (uint64_t)v6, v8);

  args = self->_args;
  v10 = NSStringFromSelector(sel_args);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)args, (uint64_t)v10, v12);

  score = self->_score;
  NSStringFromSelector(sel_score);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)score, (uint64_t)v16, v15);
}

- (GDKnosisIntentArgInfo)initWithIntent:(id)a3 args:(id)a4 score:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDKnosisIntentArgInfo;
  uint64_t v15 = [(GDKnosisIntentArgInfo *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    intent = v15->_intent;
    v15->_intent = (NSString *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    args = v15->_args;
    v15->_args = (NSSet *)v22;

    uint64_t v28 = objc_msgSend_copy(v10, v24, v25, v26, v27);
    score = v15->_score;
    v15->_score = (NSNumber *)v28;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end