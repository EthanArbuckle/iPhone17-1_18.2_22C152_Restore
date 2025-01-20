@interface GDKnosisExecStep
+ (BOOL)supportsSecureCoding;
- (GDKnosisExecStep)initWithCoder:(id)a3;
- (GDKnosisExecStep)initWithKgQueryNode:(id)a3 indexQuery:(id)a4 messages:(id)a5;
- (NSArray)messages;
- (NSString)indexQuery;
- (NSString)kgQueryNode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisExecStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_indexQuery, 0);

  objc_storeStrong((id *)&self->_kgQueryNode, 0);
}

- (NSArray)messages
{
  return self->_messages;
}

- (NSString)indexQuery
{
  return self->_indexQuery;
}

- (NSString)kgQueryNode
{
  return self->_kgQueryNode;
}

- (GDKnosisExecStep)initWithCoder:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_kgQueryNode);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  v14 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v14)
  {
    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_indexQuery);
    v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, (uint64_t)v17, v19);

    v25 = objc_msgSend_error(v4, v21, v22, v23, v24);

    if (v25)
    {
      v15 = 0;
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_messages);
    v30 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v28, v26, (uint64_t)v27, v29);

    if (!v30)
    {
      v35 = objc_msgSend_error(v4, v31, v32, v33, v34);

      if (v35)
      {
        v15 = 0;
        goto LABEL_9;
      }
      v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46[0] = @"GDKnosisExecStep messages is nil";
      v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v36, (uint64_t)v46, (uint64_t)&v45, 1);
      v41 = objc_msgSend_errorWithDomain_code_userInfo_(v38, v40, @"GDErrorDomain", 9, (uint64_t)v39);
      objc_msgSend_failWithError_(v4, v42, (uint64_t)v41, v43, v44);
    }
    self = (GDKnosisExecStep *)(id)objc_msgSend_initWithKgQueryNode_indexQuery_messages_(self, v31, (uint64_t)v9, (uint64_t)v20, (uint64_t)v30);
    v15 = self;
LABEL_9:

    goto LABEL_10;
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  kgQueryNode = self->_kgQueryNode;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_kgQueryNode);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)kgQueryNode, (uint64_t)v6, v8);

  indexQuery = self->_indexQuery;
  v10 = NSStringFromSelector(sel_indexQuery);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)indexQuery, (uint64_t)v10, v12);

  messages = self->_messages;
  NSStringFromSelector(sel_messages);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)messages, (uint64_t)v16, v15);
}

- (GDKnosisExecStep)initWithKgQueryNode:(id)a3 indexQuery:(id)a4 messages:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)GDKnosisExecStep;
  uint64_t v15 = [(GDKnosisExecStep *)&v31 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
    kgQueryNode = v15->_kgQueryNode;
    v15->_kgQueryNode = (NSString *)v16;

    uint64_t v22 = objc_msgSend_copy(v9, v18, v19, v20, v21);
    indexQuery = v15->_indexQuery;
    v15->_indexQuery = (NSString *)v22;

    uint64_t v28 = objc_msgSend_copy(v10, v24, v25, v26, v27);
    messages = v15->_messages;
    v15->_messages = (NSArray *)v28;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end