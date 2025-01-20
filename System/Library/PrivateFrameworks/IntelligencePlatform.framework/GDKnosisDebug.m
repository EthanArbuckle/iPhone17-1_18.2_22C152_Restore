@interface GDKnosisDebug
+ (BOOL)supportsSecureCoding;
- (GDKnosisDebug)initWithCoder:(id)a3;
- (GDKnosisDebug)initWithIndexCallCount:(int)a3 execSteps:(id)a4 messages:(id)a5;
- (NSArray)execSteps;
- (NSArray)messages;
- (int)indexCallCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisDebug

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);

  objc_storeStrong((id *)&self->_execSteps, 0);
}

- (NSArray)messages
{
  return self->_messages;
}

- (NSArray)execSteps
{
  return self->_execSteps;
}

- (int)indexCallCount
{
  return self->_indexCallCount;
}

- (GDKnosisDebug)initWithCoder:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = NSStringFromSelector(sel_indexCallCount);
  uint64_t v9 = objc_msgSend_decodeIntForKey_(v4, v6, (uint64_t)v5, v7, v8);

  v14 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v14)
  {
    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_execSteps);
    v20 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v18, v16, (uint64_t)v17, v19);

    if (!v20)
    {
      v34 = objc_msgSend_error(v4, v21, v22, v23, v24);

      if (v34)
      {
        v15 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"GDKnosisDebug execSteps is nil";
      v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v56, (uint64_t)&v55, 1);
      v42 = objc_msgSend_errorWithDomain_code_userInfo_(v39, v41, @"GDErrorDomain", 9, (uint64_t)v40);
      objc_msgSend_failWithError_(v4, v43, (uint64_t)v42, v44, v45);
    }
    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_messages);
    v29 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v27, v25, (uint64_t)v26, v28);

    if (!v29)
    {
      v36 = objc_msgSend_error(v4, v30, v31, v32, v33);

      if (v36)
      {
        v15 = 0;
        goto LABEL_10;
      }
      v46 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      v54 = @"GDKnosisDebug messages is nil";
      v47 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)&v54, (uint64_t)&v53, 1);
      v49 = objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, @"GDErrorDomain", 9, (uint64_t)v47);
      objc_msgSend_failWithError_(v4, v50, (uint64_t)v49, v51, v52);
    }
    self = (GDKnosisDebug *)(id)objc_msgSend_initWithIndexCallCount_execSteps_messages_(self, v30, v9, (uint64_t)v20, (uint64_t)v29);
    v15 = self;
LABEL_10:

    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t indexCallCount = self->_indexCallCount;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_indexCallCount);
  objc_msgSend_encodeInt_forKey_(v5, v7, indexCallCount, (uint64_t)v6, v8);

  execSteps = self->_execSteps;
  v10 = NSStringFromSelector(sel_execSteps);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)execSteps, (uint64_t)v10, v12);

  messages = self->_messages;
  NSStringFromSelector(sel_messages);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)messages, (uint64_t)v16, v15);
}

- (GDKnosisDebug)initWithIndexCallCount:(int)a3 execSteps:(id)a4 messages:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDKnosisDebug;
  v10 = [(GDKnosisDebug *)&v25 init];
  uint64_t v15 = v10;
  if (v10)
  {
    v10->_uint64_t indexCallCount = a3;
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    execSteps = v15->_execSteps;
    v15->_execSteps = (NSArray *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    messages = v15->_messages;
    v15->_messages = (NSArray *)v22;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end