@interface CKDLongLivedOperationPersistedCallback
+ (BOOL)supportsSecureCoding;
- (BOOL)isCompletionCallback;
- (CKDLongLivedOperationPersistedCallback)initWithCoder:(id)a3;
- (CKDLongLivedOperationPersistedCallback)initWithProtocol:(id)a3 invocation:(id)a4 isCompletionCallback:(BOOL)a5;
- (NSInvocation)invocation;
- (Protocol)protocol;
- (void)_validateInvocation;
- (void)encodeWithCoder:(id)a3;
- (void)setInvocation:(id)a3;
- (void)setIsCompletionCallback:(BOOL)a3;
- (void)setProtocol:(id)a3;
@end

@implementation CKDLongLivedOperationPersistedCallback

- (void)_validateInvocation
{
  objc_msgSend_protocol(self, a2, v2);
  v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v6 = NSStringFromProtocol(v5);

  v9 = objc_msgSend_invocation(self, v7, v8);
  v12 = (const char *)objc_msgSend_selector(v9, v10, v11);
  v13 = NSStringFromSelector(v12);

  v16 = objc_msgSend_protocol(self, v14, v15);
  v19 = objc_msgSend_invocation(self, v17, v18);
  objc_msgSend_selector(v19, v20, v21);
  v22 = CKExtendedMethodSignatureForProtocolSelector();

  if (!v22)
  {
    v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CKDLongLivedOperationPersistedCallback.m", 40, @"Selector %@ not part of expected protocol %@", v6, v13);
  }
  v25 = objc_msgSend_invocation(self, v23, v24);
  v28 = objc_msgSend_methodSignature(v25, v26, v27);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4F04BF4;
  aBlock[3] = &unk_1E64F5C10;
  aBlock[4] = self;
  SEL v51 = a2;
  id v29 = v6;
  id v49 = v29;
  id v30 = v13;
  id v50 = v30;
  v31 = _Block_copy(aBlock);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1C4F04C94;
  v44[3] = &unk_1E64F5C10;
  v44[4] = self;
  id v45 = v29;
  id v46 = v30;
  SEL v47 = a2;
  id v32 = v30;
  id v33 = v29;
  v34 = _Block_copy(v44);
  v37 = objc_msgSend_invocation(self, v35, v36);
  uint64_t v40 = objc_msgSend_numberOfArguments(v28, v38, v39);
  objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v37, v41, 2, v40 - 2, 0, v34, v31);
}

- (CKDLongLivedOperationPersistedCallback)initWithProtocol:(id)a3 invocation:(id)a4 isCompletionCallback:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKDLongLivedOperationPersistedCallback;
  uint64_t v11 = [(CKDLongLivedOperationPersistedCallback *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_protocol, a3);
    objc_storeStrong((id *)&v12->_invocation, a4);
    v12->_isCompletionCallback = a5;
    objc_msgSend__validateInvocation(v12, v13, v14);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDLongLivedOperationPersistedCallback)initWithCoder:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CKDLongLivedOperationPersistedCallback;
  v5 = [(CKDLongLivedOperationPersistedCallback *)&v56 init];
  if (!v5) {
    goto LABEL_25;
  }
  context = (void *)MEMORY[0x1C8789E70]();
  uint64_t v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"ProtocolNamme");
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v9 = NSProtocolFromString(v8);
  if (v9)
  {
    objc_storeStrong((id *)&v5->_protocol, v9);
    uint64_t v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"SelectorName");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSSelectorFromString(v12);
    objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)v9, v13, 1, 1);
    if (MethodDescription.name)
    {
      v5->_isCompletionCallback = objc_msgSend_decodeBoolForKey_(v4, MethodDescription.types, @"isCompletionCallback");
      uint64_t v15 = objc_opt_class();
      v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"ArgumentTypes");
      objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)MethodDescription.types);
      id v45 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v45, v18, (uint64_t)v44))
      {
        v43 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v19, (uint64_t)MethodDescription.types);
        uint64_t v21 = objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E4F1CA18], v20, (uint64_t)v43);
        objc_msgSend_retainArguments(v21, v22, v23);
        objc_msgSend_setSelector_(v21, v24, (uint64_t)v13);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1C4F054AC;
        aBlock[3] = &unk_1E64F5C38;
        id v25 = v4;
        id v54 = v25;
        id v26 = v21;
        id v55 = v26;
        v42 = _Block_copy(aBlock);
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = sub_1C4F0552C;
        v50[3] = &unk_1E64F5C60;
        id v27 = v25;
        id v51 = v27;
        id v28 = v26;
        id v52 = v28;
        id v29 = _Block_copy(v50);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = sub_1C4F055F4;
        v47[3] = &unk_1E64F5C60;
        id v48 = v27;
        id v30 = v28;
        id v49 = v30;
        v31 = _Block_copy(v47);
        uint64_t v34 = objc_msgSend_numberOfArguments(v43, v32, v33);
        objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v30, v35, 2, v34 - 2, v42, v29, v31);
        objc_storeStrong((id *)&v5->_invocation, v21);
        int v36 = 0;
      }
      else
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v39 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v58 = v45;
          __int16 v59 = 2114;
          v60 = v44;
          __int16 v61 = 2114;
          v62 = v8;
          __int16 v63 = 2114;
          v64 = v12;
          _os_log_error_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_ERROR, "Unexpected live argument types \"%{public}@\" vs. archived argument types \"%{public}@\" on -[%{public}@ %{public}@], ignoring", buf, 0x2Au);
        }
        int v36 = 1;
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v38 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v58 = v12;
        __int16 v59 = 2112;
        v60 = v9;
        _os_log_error_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_ERROR, "Unknown selector name %{public}@ not found on protocol %@, ignoring", buf, 0x16u);
      }
      int v36 = 1;
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v37 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v8;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Unknown protocol name %{public}@ in operation info, ignoring", buf, 0xCu);
    }
    int v36 = 1;
  }

  if (v36) {
    uint64_t v40 = 0;
  }
  else {
LABEL_25:
  }
    uint64_t v40 = v5;

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1C8789E70]();
  objc_msgSend_protocol(self, v6, v7);
  uint64_t v8 = (Protocol *)objc_claimAutoreleasedReturnValue();
  Name = protocol_getName(v8);

  uint64_t v11 = objc_msgSend_stringWithUTF8String_(NSString, v10, (uint64_t)Name);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"ProtocolNamme");

  uint64_t v15 = objc_msgSend_invocation(self, v13, v14);
  uint64_t v18 = (const char *)objc_msgSend_selector(v15, v16, v17);

  v19 = sel_getName(v18);
  uint64_t v21 = objc_msgSend_stringWithUTF8String_(NSString, v20, (uint64_t)v19);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"SelectorName");

  objc_msgSend_encodeBool_forKey_(v4, v23, self->_isCompletionCallback, @"isCompletionCallback");
  objc_msgSend_protocol(self, v24, v25);
  id v26 = (Protocol *)objc_claimAutoreleasedReturnValue();
  types = protocol_getMethodDescription(v26, v18, 1, 1).types;

  id v29 = objc_msgSend_stringWithUTF8String_(NSString, v28, (uint64_t)types);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, @"ArgumentTypes");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4F059A4;
  aBlock[3] = &unk_1E64F5C38;
  void aBlock[4] = self;
  id v31 = v4;
  id v59 = v31;
  id v32 = _Block_copy(aBlock);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = sub_1C4F05A90;
  v56[3] = &unk_1E64F5C60;
  v56[4] = self;
  id v33 = v31;
  id v57 = v33;
  uint64_t v34 = _Block_copy(v56);
  uint64_t v50 = MEMORY[0x1E4F143A8];
  uint64_t v51 = 3221225472;
  id v52 = sub_1C4F05B44;
  v53 = &unk_1E64F5C60;
  id v54 = self;
  id v35 = v33;
  id v55 = v35;
  int v36 = _Block_copy(&v50);
  uint64_t v39 = objc_msgSend_invocation(self, v37, v38, v50, v51, v52, v53, v54);
  v42 = objc_msgSend_invocation(self, v40, v41);
  id v45 = objc_msgSend_methodSignature(v42, v43, v44);
  uint64_t v48 = objc_msgSend_numberOfArguments(v45, v46, v47);
  objc_msgSend_CKIterateArgumentsForIndexRange_primitiveTypeBlock_objectBlock_blockBlock_(v39, v49, 2, v48 - 2, v32, v34, v36);
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
}

- (BOOL)isCompletionCallback
{
  return self->_isCompletionCallback;
}

- (void)setIsCompletionCallback:(BOOL)a3
{
  self->_isCompletionCallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end