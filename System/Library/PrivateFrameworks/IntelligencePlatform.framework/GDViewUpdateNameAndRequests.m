@interface GDViewUpdateNameAndRequests
+ (BOOL)supportsSecureCoding;
- (GDViewUpdateNameAndRequests)initWithCoder:(id)a3;
- (GDViewUpdateNameAndRequests)initWithName:(id)a3 requests:(id)a4;
- (NSArray)requests;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDViewUpdateNameAndRequests

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)requests
{
  return self->_requests;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7 = objc_msgSend_initWithFormat_(v3, v4, @"<GDViewUpdateNameAndRequests %@, requests: %@>", v5, v6, self->_name, self->_requests);

  return v7;
}

- (GDViewUpdateNameAndRequests)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(sel_name);
  v9 = objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, (uint64_t)v7, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

  if (v9
    && (objc_msgSend_error(v4, v10, v11, v12, v13),
        v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    v16 = (void *)MEMORY[0x1E4F93B90];
    v17 = (void *)MEMORY[0x1B3EB26F0]();
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v24 = objc_msgSend_initWithObjects_(v18, v21, v19, v22, v23, v20, 0);
    v25 = NSStringFromSelector(sel_requests);
    v27 = objc_msgSend_robustDecodeObjectOfClasses_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v16, v26, (uint64_t)v24, (uint64_t)v25, (uint64_t)v4, 1, @"GDViewUpdateSourceKeyError", 9, 0);

    if (v27
      && (objc_msgSend_error(v4, v28, v29, v30, v31),
          v32 = objc_claimAutoreleasedReturnValue(),
          v32,
          !v32))
    {
      self = (GDViewUpdateNameAndRequests *)(id)objc_msgSend_initWithName_requests_(self, v33, (uint64_t)v9, (uint64_t)v27, v34);
      v15 = self;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_name);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)name, (uint64_t)v6, v8);

  requests = self->_requests;
  NSStringFromSelector(sel_requests);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)requests, (uint64_t)v12, v11);
}

- (GDViewUpdateNameAndRequests)initWithName:(id)a3 requests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDViewUpdateNameAndRequests;
  v9 = [(GDViewUpdateNameAndRequests *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_requests, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end