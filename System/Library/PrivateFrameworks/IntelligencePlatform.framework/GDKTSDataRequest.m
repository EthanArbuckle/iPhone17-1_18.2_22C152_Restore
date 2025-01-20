@interface GDKTSDataRequest
+ (BOOL)supportsSecureCoding;
- (GDKTSDataRequest)initWithCoder:(id)a3;
- (GDKTSDataRequest)initWithParameters:(id)a3;
- (GDKTSDataRequest)initWithParameters:(id)a3 cadence:(int64_t)a4;
- (GDKTSQueryParams)parameters;
- (NSString)requestID;
- (int64_t)cadence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKTSDataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (int64_t)cadence
{
  return self->_cadence;
}

- (GDKTSQueryParams)parameters
{
  return self->_parameters;
}

- (GDKTSDataRequest)initWithCoder:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_parameters);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_cadence);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);
    int v23 = objc_msgSend_intValue(v18, v19, v20, v21, v22);

    if (v23
      || (objc_msgSend_error(v4, v24, v25, v26, v27),
          v39 = objc_claimAutoreleasedReturnValue(),
          v39,
          !v39))
    {
      v28 = objc_msgSend_initWithParameters_cadence_(self, v24, (uint64_t)v9, v23, v27);
    }
    else
    {
      v28 = objc_msgSend_initWithParameters_(self, v24, (uint64_t)v9, v40, v27);
    }
    self = v28;
    v38 = self;
  }
  else
  {
    v29 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v29)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = @"GDKTSQueryParams is nil";
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v43, (uint64_t)&v42, 1);
      v34 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, @"GDErrorDomain", 9, (uint64_t)v32);
      objc_msgSend_failWithError_(v4, v35, (uint64_t)v34, v36, v37);
    }
    v38 = 0;
  }

  return v38;
}

- (void)encodeWithCoder:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_parameters);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)parameters, (uint64_t)v6, v8);

  objc_msgSend_numberWithInteger_(NSNumber, v9, self->_cadence, v10, v11);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = NSStringFromSelector(sel_cadence);
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)v15, (uint64_t)v12, v14);
}

- (GDKTSDataRequest)initWithParameters:(id)a3 cadence:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDKTSDataRequest;
  uint64_t v11 = [(GDKTSDataRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    parameters = v11->_parameters;
    v11->_parameters = (GDKTSQueryParams *)v12;

    v11->_cadence = a4;
  }

  return v11;
}

- (GDKTSDataRequest)initWithParameters:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDKTSDataRequest;
  uint64_t v9 = [(GDKTSDataRequest *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    parameters = v9->_parameters;
    v9->_parameters = (GDKTSQueryParams *)v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end