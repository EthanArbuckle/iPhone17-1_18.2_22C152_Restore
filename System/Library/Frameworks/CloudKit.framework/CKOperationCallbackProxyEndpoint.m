@interface CKOperationCallbackProxyEndpoint
+ (BOOL)supportsSecureCoding;
- (CKOperationCallbackProxyEndpoint)initWithClass:(Class)a3 protocol:(id)a4 endpoint:(id)a5;
- (CKOperationCallbackProxyEndpoint)initWithCoder:(id)a3;
- (Class)cls;
- (NSXPCInterface)interface;
- (NSXPCListenerEndpoint)endpoint;
- (Protocol)protocol;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKOperationCallbackProxyEndpoint

- (CKOperationCallbackProxyEndpoint)initWithClass:(Class)a3 protocol:(id)a4 endpoint:(id)a5
{
  id v10 = a4;
  id v14 = a5;
  if (a3)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v20 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, @"CKOperationCallbackProxy.m", 36, @"Invalid parameter not satisfying: %@", @"protocol");

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, @"CKOperationCallbackProxy.m", 35, @"Invalid parameter not satisfying: %@", @"cls");

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, @"CKOperationCallbackProxy.m", 37, @"Invalid parameter not satisfying: %@", @"endpoint");

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)CKOperationCallbackProxyEndpoint;
  v15 = [(CKOperationCallbackProxyEndpoint *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cls, a3);
    objc_storeStrong((id *)&v16->_protocol, a4);
    objc_storeStrong((id *)&v16->_endpoint, a5);
  }

  return v16;
}

- (NSXPCInterface)interface
{
  if (qword_1EB279A58 != -1) {
    dispatch_once(&qword_1EB279A58, &unk_1ED7EEF58);
  }
  id v3 = (id)qword_1EB279A50;
  objc_sync_enter(v3);
  v4 = NSString;
  uint64_t v8 = objc_msgSend_cls(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_protocol(self, v9, v10, v11);
  v15 = objc_msgSend_stringWithFormat_(v4, v13, @"%@:%@", v14, v8, v12);

  v21 = objc_msgSend_objectForKey_((void *)qword_1EB279A50, v16, (uint64_t)v15, v17);
  if (!v21)
  {
    v22 = (void *)MEMORY[0x1E4F29280];
    v23 = objc_msgSend_protocol(self, v18, v19, v20);
    v21 = objc_msgSend_interfaceWithProtocol_(v22, v24, (uint64_t)v23, v25);

    v29 = objc_msgSend_cls(self, v26, v27, v28);
    objc_msgSend_applyDaemonCallbackInterfaceTweaks_(v29, v30, (uint64_t)v21, v31);
    objc_msgSend_setObject_forKey_((void *)qword_1EB279A50, v32, (uint64_t)v21, (uint64_t)v15);
  }

  objc_sync_exit(v3);

  return (NSXPCInterface *)v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v31 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v28 = [CKException alloc];
    id v30 = (id)objc_msgSend_initWithName_format_(v28, v29, *MEMORY[0x1E4F1C3B8], @"This class must only be encoded by NSXPCCoder");
    objc_exception_throw(v30);
  }
  uint64_t v7 = objc_msgSend_cls(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_protocol(self, v8, v9, v10);
  uint64_t v12 = sub_18B043CB4(v7, v11);
  v15 = objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1ED7EFFB8, v14);

  objc_msgSend_encodeObject_forKey_(v31, v16, (uint64_t)v15, @"CK.classNames");
  objc_msgSend_protocol(self, v17, v18, v19);
  uint64_t v20 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v21 = NSStringFromProtocol(v20);
  objc_msgSend_encodeObject_forKey_(v31, v22, (uint64_t)v21, @"CK.protocolName");

  v26 = objc_msgSend_endpoint(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v31, v27, (uint64_t)v26, @"CK.endpoint");
}

- (CKOperationCallbackProxyEndpoint)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v40, 2);
  uint64_t v10 = objc_msgSend_setWithArray_(v5, v8, (uint64_t)v7, v9);
  uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"CK.classNames");

  v15 = objc_msgSend_CKCompactMap_(v12, v13, (uint64_t)&unk_1ED7F0158, v14);
  uint64_t Object = objc_msgSend_lastObject(v15, v16, v17, v18);
  if (!Object)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v20 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v33 = v20;
      objc_msgSend_lastObject(v12, v34, v35, v36);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      int v38 = 138412290;
      v39 = v37;
    }
  }
  uint64_t v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"CK.protocolName");
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = NSProtocolFromString(v23);
  if (!v24)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      int v38 = 138412290;
      v39 = v23;
    }
  }
  uint64_t v26 = objc_opt_class();
  v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"CK.endpoint");
  if (!Object) {
    uint64_t Object = objc_opt_class();
  }
  if (v24) {
    uint64_t v30 = objc_msgSend_initWithClass_protocol_endpoint_(self, v28, Object, (uint64_t)v24, v29);
  }
  else {
    uint64_t v30 = objc_msgSend_initWithClass_protocol_endpoint_(self, v28, Object, (uint64_t)&unk_1ED84A578, v29);
  }
  id v31 = (CKOperationCallbackProxyEndpoint *)v30;

  return v31;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (Class)cls
{
  return self->_cls;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cls, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end