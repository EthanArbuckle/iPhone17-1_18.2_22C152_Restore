@interface CKRequestInfo
+ (BOOL)supportsSecureCoding;
- (CKRequestInfo)initWithCoder:(id)a3;
- (CKRequestInfo)initWithRequestUUID:(id)a3 responseHTTPHeaders:(id)a4 w3cTiming:(id)a5;
- (NSArray)requestOperations;
- (NSDictionary)responseHTTPHeaders;
- (NSDictionary)w3cNavigationTiming;
- (NSString)operationClassName;
- (NSString)requestUUID;
- (void)encodeWithCoder:(id)a3;
- (void)setOperationClassName:(id)a3;
- (void)setRequestOperations:(id)a3;
@end

@implementation CKRequestInfo

- (CKRequestInfo)initWithRequestUUID:(id)a3 responseHTTPHeaders:(id)a4 w3cTiming:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKRequestInfo;
  v14 = [(CKRequestInfo *)&v28 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v11, v12, v13);
    requestUUID = v14->_requestUUID;
    v14->_requestUUID = (NSString *)v15;

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
    responseHTTPHeaders = v14->_responseHTTPHeaders;
    v14->_responseHTTPHeaders = (NSDictionary *)v20;

    uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);
    w3cNavigationTiming = v14->_w3cNavigationTiming;
    v14->_w3cNavigationTiming = (NSDictionary *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v29 = a3;
  v7 = objc_msgSend_requestUUID(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v29, v8, (uint64_t)v7, @"RequestUUID");

  uint64_t v12 = objc_msgSend_responseHTTPHeaders(self, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v29, v13, (uint64_t)v12, @"ResponseHTTPHeaders");

  v17 = objc_msgSend_w3cNavigationTiming(self, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v29, v18, (uint64_t)v17, @"W3CNavigationTiming");

  if (__sTestOverridesAvailable)
  {
    v22 = objc_msgSend_requestOperations(self, v19, v20, v21);
    objc_msgSend_encodeObject_forKey_(v29, v23, (uint64_t)v22, @"RequestOperations");

    v27 = objc_msgSend_operationClassName(self, v24, v25, v26);
    objc_msgSend_encodeObject_forKey_(v29, v28, (uint64_t)v27, @"OperationClassName");
  }
}

- (CKRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKRequestInfo;
  uint64_t v5 = [(CKRequestInfo *)&v33 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"RequestUUID");
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSString *)v8;

    uint64_t v12 = objc_msgSend_decodePropertyListForKey_(v4, v10, @"ResponseHTTPHeaders", v11);
    responseHTTPHeaders = v5->_responseHTTPHeaders;
    v5->_responseHTTPHeaders = (NSDictionary *)v12;

    uint64_t v16 = objc_msgSend_decodePropertyListForKey_(v4, v14, @"W3CNavigationTiming", v15);
    w3cNavigationTiming = v5->_w3cNavigationTiming;
    v5->_w3cNavigationTiming = (NSDictionary *)v16;

    if (__sTestOverridesAvailable)
    {
      uint64_t v20 = objc_msgSend_decodePropertyListForKey_(v4, v18, @"OperationClassName", v19);
      operationClassName = v5->_operationClassName;
      v5->_operationClassName = (NSString *)v20;

      Class v22 = NSClassFromString(&cfstr_Ckdprequestope.isa);
      if (v22)
      {
        Class v23 = v22;
        uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v25 = objc_opt_class();
        objc_super v28 = objc_msgSend_setWithObjects_(v24, v26, v25, v27, v23, 0);
        uint64_t v30 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, @"RequestOperations");
        requestOperations = v5->_requestOperations;
        v5->_requestOperations = (NSArray *)v30;
      }
    }
  }

  return v5;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (NSDictionary)responseHTTPHeaders
{
  return self->_responseHTTPHeaders;
}

- (NSDictionary)w3cNavigationTiming
{
  return self->_w3cNavigationTiming;
}

- (NSArray)requestOperations
{
  return self->_requestOperations;
}

- (void)setRequestOperations:(id)a3
{
}

- (NSString)operationClassName
{
  return self->_operationClassName;
}

- (void)setOperationClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationClassName, 0);
  objc_storeStrong((id *)&self->_requestOperations, 0);
  objc_storeStrong((id *)&self->_w3cNavigationTiming, 0);
  objc_storeStrong((id *)&self->_responseHTTPHeaders, 0);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

@end