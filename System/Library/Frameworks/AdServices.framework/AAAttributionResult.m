@interface AAAttributionResult
+ (BOOL)supportsSecureCoding;
- (AAAttributionResult)initWithCoder:(id)a3;
- (AAAttributionResult)initWithError:(id)a3;
- (AAAttributionResult)initWithToken:(id)a3 source:(int64_t)a4;
- (AAAttributionResult)initWithToken:(id)a3 success:(BOOL)a4 error:(id)a5 source:(int64_t)a6;
- (BOOL)success;
- (NSError)error;
- (NSString)storeFront;
- (NSString)token;
- (double)daemonRunningTime;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setDaemonRunningTime:(double)a3;
- (void)setStoreFront:(id)a3;
@end

@implementation AAAttributionResult

- (AAAttributionResult)initWithToken:(id)a3 source:(int64_t)a4
{
  return (AAAttributionResult *)MEMORY[0x270F9A6D0](self, sel_initWithToken_success_error_source_, a3, 1, 0, a4);
}

- (AAAttributionResult)initWithError:(id)a3
{
  return (AAAttributionResult *)MEMORY[0x270F9A6D0](self, sel_initWithToken_success_error_source_, 0, 0, a3, 0);
}

- (AAAttributionResult)initWithToken:(id)a3 success:(BOOL)a4 error:(id)a5 source:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AAAttributionResult;
  v13 = [(AAAttributionResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_token, a3);
    v14->_success = a4;
    objc_storeStrong((id *)&v14->_error, a5);
    v14->_source = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v58 = a3;
  v9 = objc_msgSend_token(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v58, v10, (uint64_t)v9, @"token", v11, v12);

  uint64_t v18 = objc_msgSend_success(self, v13, v14, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v58, v19, v18, @"success", v20, v21);
  v27 = objc_msgSend_error(self, v22, v23, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v58, v28, (uint64_t)v27, @"error", v29, v30);

  v36 = objc_msgSend_storeFront(self, v31, v32, v33, v34, v35);
  objc_msgSend_encodeObject_forKey_(v58, v37, (uint64_t)v36, @"storeFront", v38, v39);

  objc_msgSend_daemonRunningTime(self, v40, v41, v42, v43, v44);
  objc_msgSend_encodeDouble_forKey_(v58, v45, @"daemonRunningTime", v46, v47, v48);
  uint64_t v54 = objc_msgSend_source(self, v49, v50, v51, v52, v53);
  objc_msgSend_encodeInteger_forKey_(v58, v55, v54, @"source", v56, v57);
}

- (AAAttributionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AAAttributionResult;
  uint64_t v5 = [(AAAttributionResult *)&v38 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"token", v8, v9);
    token = v5->_token;
    v5->_token = (NSString *)v10;

    v5->_success = objc_msgSend_decodeBoolForKey_(v4, v12, @"success", v13, v14, v15);
    uint64_t v16 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"error", v18, v19);
    error = v5->_error;
    v5->_error = (NSError *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"storeFront", v24, v25);
    storeFront = v5->_storeFront;
    v5->_storeFront = (NSString *)v26;

    objc_msgSend_decodeDoubleForKey_(v4, v28, @"daemonRunningTime", v29, v30, v31);
    v5->_daemonRunningTime = v32;
    v5->_source = objc_msgSend_decodeIntegerForKey_(v4, v33, @"source", v34, v35, v36);
  }

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)source
{
  return self->_source;
}

- (double)daemonRunningTime
{
  return self->_daemonRunningTime;
}

- (void)setDaemonRunningTime:(double)a3
{
  self->_daemonRunningTime = a3;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (void)setStoreFront:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end