@interface GDViewUpdateSourceResponse
+ (BOOL)supportsSecureCoding;
- (GDSourceListenerConfigIdentifier)configIdentifier;
- (GDViewUpdateSourceResponse)initWithCoder:(id)a3;
- (GDViewUpdateSourceResponse)initWithConfigIdentifier:(id)a3 bookmark:(id)a4 response:(id)a5;
- (NSData)bookmark;
- (NSString)response;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDViewUpdateSourceResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);

  objc_storeStrong((id *)&self->_configIdentifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  configIdentifier = self->_configIdentifier;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_configIdentifier);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)configIdentifier, (uint64_t)v6, v8);

  bookmark = self->_bookmark;
  v10 = NSStringFromSelector(sel_bookmark);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)bookmark, (uint64_t)v10, v12);

  response = self->_response;
  NSStringFromSelector(sel_response);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)response, (uint64_t)v16, v15);
}

- (GDViewUpdateSourceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_configIdentifier);
  v9 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, (uint64_t)v7, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

  if (v9
    && (objc_msgSend_error(v4, v10, v11, v12, v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    id v16 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_bookmark);
    v20 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v16, v19, v17, (uint64_t)v18, (uint64_t)v4, 0, @"GDViewUpdateSourceKeyError", 9, 0);

    v25 = objc_msgSend_error(v4, v21, v22, v23, v24);

    if (v25)
    {
      uint64_t v15 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v27 = objc_opt_class();
      v28 = NSStringFromSelector(sel_response);
      v30 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v26, v29, v27, (uint64_t)v28, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

      if (v30
        && (objc_msgSend_error(v4, v31, v32, v33, v34),
            v35 = objc_claimAutoreleasedReturnValue(),
            v35,
            !v35))
      {
        self = (GDViewUpdateSourceResponse *)(id)objc_msgSend_initWithConfigIdentifier_bookmark_response_(self, v36, (uint64_t)v9, (uint64_t)v20, (uint64_t)v30);
        uint64_t v15 = self;
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (GDViewUpdateSourceResponse)initWithConfigIdentifier:(id)a3 bookmark:(id)a4 response:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GDViewUpdateSourceResponse;
  uint64_t v12 = [(GDViewUpdateSourceResponse *)&v21 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configIdentifier, a3);
    objc_storeStrong((id *)&v13->_bookmark, a4);
    uint64_t v18 = objc_msgSend_copy(v11, v14, v15, v16, v17);
    response = v13->_response;
    v13->_response = (NSString *)v18;
  }
  return v13;
}

- (GDSourceListenerConfigIdentifier)configIdentifier
{
  return self->_configIdentifier;
}

- (NSData)bookmark
{
  return self->_bookmark;
}

- (NSString)response
{
  return self->_response;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"<GDViewUpdateSourceResponse configId: %@, response: %@>", v5, v6, self->_configIdentifier, self->_response);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end