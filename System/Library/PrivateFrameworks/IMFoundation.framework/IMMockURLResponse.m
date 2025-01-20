@interface IMMockURLResponse
+ (BOOL)supportsSecureCoding;
+ (id)objectFromPlist:(id)a3;
- (IMMockURLResponse)initWithCoder:(id)a3;
- (NSData)data;
- (NSHTTPURLResponse)response;
- (NSString)mockID;
- (NSString)requestBodyKeyPath;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setMockID:(id)a3;
- (void)setRequestBodyKeyPath:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation IMMockURLResponse

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_response(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"mockResponse");

  v13 = objc_msgSend_data(self, v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, @"mockData");

  v18 = objc_msgSend_requestBodyKeyPath(self, v15, v16, v17);
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v18, @"requestBodyKeyPath");

  objc_msgSend_mockID(self, v20, v21, v22);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v24, @"mockID");
}

- (IMMockURLResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IMMockURLResponse;
  uint64_t v7 = [(IMMockURLResponse *)&v27 init];
  if (v7)
  {
    v8 = objc_msgSend_decodeObjectForKey_(v4, v5, @"mockResponse", v6);
    objc_msgSend_setResponse_(v7, v9, (uint64_t)v8, v10);

    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"mockData");
    objc_msgSend_setData_(v7, v14, (uint64_t)v13, v15);

    uint64_t v16 = objc_opt_class();
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, @"requestBodyKeyPath");
    objc_msgSend_setRequestBodyKeyPath_(v7, v19, (uint64_t)v18, v20);

    uint64_t v21 = objc_opt_class();
    v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"mockID");
    objc_msgSend_setMockID_(v7, v24, (uint64_t)v23, v25);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectFromPlist:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"status", v5);
  uint64_t v10 = (int)objc_msgSend_intValue(v6, v7, v8, v9);

  v13 = objc_msgSend_objectForKey_(v3, v11, @"headers", v12);
  uint64_t v16 = objc_msgSend_objectForKey_(v3, v14, @"requestBodyForKeyPath", v15);
  v19 = objc_msgSend_objectForKey_(v3, v17, @"mockID", v18);
  id v20 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v23 = objc_msgSend_objectForKey_(v3, v21, @"url", v22);
  v26 = objc_msgSend_initWithString_(v20, v24, (uint64_t)v23, v25);

  id v27 = objc_alloc(MEMORY[0x1E4F28D20]);
  v29 = objc_msgSend_initWithURL_statusCode_HTTPVersion_headerFields_(v27, v28, (uint64_t)v26, v10, @"http 1.1", v13);
  v30 = objc_alloc_init(IMMockURLResponse);
  v33 = objc_msgSend_objectForKey_(v3, v31, @"body", v32);

  uint64_t v45 = 0;
  v37 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v34, (uint64_t)v33, 100, 0, &v45);
  if (v45) {
    NSLog(&cfstr_SErrorSerializ.isa, "+[IMMockURLResponse objectFromPlist:]", v45);
  }
  objc_msgSend_setData_(v30, v35, (uint64_t)v37, v36);
  objc_msgSend_setResponse_(v30, v38, (uint64_t)v29, v39);
  objc_msgSend_setRequestBodyKeyPath_(v30, v40, (uint64_t)v16, v41);
  objc_msgSend_setMockID_(v30, v42, (uint64_t)v19, v43);

  return v30;
}

- (NSHTTPURLResponse)response
{
  return (NSHTTPURLResponse *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (NSString)requestBodyKeyPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestBodyKeyPath:(id)a3
{
}

- (NSString)mockID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_requestBodyKeyPath, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end