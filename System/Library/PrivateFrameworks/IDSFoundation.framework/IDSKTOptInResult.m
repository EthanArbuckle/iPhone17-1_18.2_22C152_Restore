@interface IDSKTOptInResult
+ (BOOL)supportsSecureCoding;
- (BOOL)success;
- (IDSKTOptInResult)init;
- (IDSKTOptInResult)initWithCoder:(id)a3;
- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 optedInOutURIs:(id)a4 serverSMTByURI:(id)a5 error:(id)a6;
- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 serverProvidedSMT:(id)a4 error:(id)a5;
- (NSArray)optedInOutURIs;
- (NSData)serverProvidedSMT;
- (NSDictionary)serverSMTByURI;
- (NSError)error;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSKTOptInResult

- (IDSKTOptInResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSKTOptInResult;
  v2 = [(IDSKTOptInResult *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_success = 0;
    error = v2->_error;
    v2->_error = 0;

    serverProvidedSMT = v3->_serverProvidedSMT;
    v3->_serverProvidedSMT = 0;
  }
  return v3;
}

- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 serverProvidedSMT:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IDSKTOptInResult;
  v11 = [(IDSKTOptInResult *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_success = a3;
    objc_storeStrong((id *)&v11->_serverProvidedSMT, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    optedInOutURIs = v12->_optedInOutURIs;
    v12->_optedInOutURIs = v13;

    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    serverSMTByURI = v12->_serverSMTByURI;
    v12->_serverSMTByURI = v15;
  }
  return v12;
}

- (IDSKTOptInResult)initWithSuccess:(BOOL)a3 optedInOutURIs:(id)a4 serverSMTByURI:(id)a5 error:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IDSKTOptInResult;
  v13 = [(IDSKTOptInResult *)&v29 init];
  v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    if (v10) {
      v15 = (NSArray *)v10;
    }
    else {
      v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    optedInOutURIs = v14->_optedInOutURIs;
    v14->_optedInOutURIs = v15;

    if (v11) {
      v17 = (NSDictionary *)v11;
    }
    else {
      v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    serverSMTByURI = v14->_serverSMTByURI;
    v14->_serverSMTByURI = v17;

    if (v14->_serverSMTByURI)
    {
      v22 = objc_msgSend_allValues(v14->_serverSMTByURI, v19, v20, v21);
      uint64_t v26 = objc_msgSend_firstObject(v22, v23, v24, v25);
      serverProvidedSMT = v14->_serverProvidedSMT;
      v14->_serverProvidedSMT = (NSData *)v26;
    }
    else
    {
      v14->_serverSMTByURI = 0;
    }
    objc_storeStrong((id *)&v14->_error, a6);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IDSKTOptInResult;
  v6 = [(IDSKTOptInResult *)&v30 init];
  if (v6)
  {
    v6->_success = objc_msgSend_decodeBoolForKey_(v4, v5, @"Success", v7);
    uint64_t v8 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, v10, @"Error");
    error = v6->_error;
    v6->_error = (NSError *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"SMT");
    serverProvidedSMT = v6->_serverProvidedSMT;
    v6->_serverProvidedSMT = (NSData *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v19, v18, v20, @"OptInOutURIs");
    optedInOutURIs = v6->_optedInOutURIs;
    v6->_optedInOutURIs = (NSArray *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v25, v23, v26, v24, @"ServerSMTsByURI");
    serverSMTByURI = v6->_serverSMTByURI;
    v6->_serverSMTByURI = (NSDictionary *)v27;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL success = self->_success;
  id v15 = a3;
  objc_msgSend_encodeBool_forKey_(v15, v5, success, v6, @"Success");
  objc_msgSend_encodeObject_forKey_(v15, v7, (uint64_t)self->_error, v8, @"Error");
  objc_msgSend_encodeObject_forKey_(v15, v9, (uint64_t)self->_serverProvidedSMT, v10, @"SMT");
  objc_msgSend_encodeObject_forKey_(v15, v11, (uint64_t)self->_optedInOutURIs, v12, @"OptInOutURIs");
  objc_msgSend_encodeObject_forKey_(v15, v13, (uint64_t)self->_serverSMTByURI, v14, @"ServerSMTsByURI");
}

- (id)description
{
  if (self->_success) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IDSKTOptInResult: %p, success: %@, error: %@, serverProvidedSMT: %@, optedInOutURIs: %@, serverSMTByURI: %@>", v2, self, @"YES", self->_error, self->_serverProvidedSMT, self->_optedInOutURIs, self->_serverSMTByURI);
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<IDSKTOptInResult: %p, success: %@, error: %@, serverProvidedSMT: %@, optedInOutURIs: %@, serverSMTByURI: %@>", v2, self, @"NO", self->_error, self->_serverProvidedSMT, self->_optedInOutURIs, self->_serverSMTByURI);
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)serverProvidedSMT
{
  return self->_serverProvidedSMT;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)optedInOutURIs
{
  return self->_optedInOutURIs;
}

- (NSDictionary)serverSMTByURI
{
  return self->_serverSMTByURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSMTByURI, 0);
  objc_storeStrong((id *)&self->_optedInOutURIs, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serverProvidedSMT, 0);
}

@end