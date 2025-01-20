@interface IDSKTVerificationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)optedIn;
- (IDSKTVerificationResult)initWithCoder:(id)a3;
- (NSArray)endpointTransparencyStates;
- (NSArray)unverifiedPushTokens;
- (NSArray)verifiedPushTokens;
- (NSString)uri;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpointTransparencyStates:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setUnverifiedPushTokens:(id)a3;
- (void)setUri:(id)a3;
- (void)setVerifiedPushTokens:(id)a3;
@end

@implementation IDSKTVerificationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTVerificationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IDSKTVerificationResult;
  v5 = [(IDSKTVerificationResult *)&v44 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"URI");
    uri = v5->_uri;
    v5->_uri = (NSString *)v9;

    v5->_optedIn = objc_msgSend_decodeBoolForKey_(v4, v11, @"OptedIn", v12);
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v18 = objc_msgSend_setWithObjects_(v13, v16, v14, v17, v15, 0);
    uint64_t v21 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, v20, @"VerifiedPushTokens");
    verifiedPushTokens = v5->_verifiedPushTokens;
    v5->_verifiedPushTokens = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v28 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v25, 0);
    uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, v30, @"UnverifiedPushTokens");
    unverifiedPushTokens = v5->_unverifiedPushTokens;
    v5->_unverifiedPushTokens = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    v38 = objc_msgSend_setWithObjects_(v33, v36, v34, v37, v35, 0);
    uint64_t v41 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, v40, @"EndpointTransparencyStates");
    endpointTransparencyStates = v5->_endpointTransparencyStates;
    v5->_endpointTransparencyStates = (NSArray *)v41;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v8 = objc_msgSend_uri(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"URI");

  uint64_t v14 = objc_msgSend_optedIn(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, v14, v16, @"OptedIn");
  double v20 = objc_msgSend_verifiedPushTokens(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, @"VerifiedPushTokens");

  v26 = objc_msgSend_unverifiedPushTokens(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, @"UnverifiedPushTokens");

  objc_msgSend_endpointTransparencyStates(self, v29, v30, v31);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, @"EndpointTransparencyStates");
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  self->_optedIn = a3;
}

- (NSArray)verifiedPushTokens
{
  return self->_verifiedPushTokens;
}

- (void)setVerifiedPushTokens:(id)a3
{
}

- (NSArray)unverifiedPushTokens
{
  return self->_unverifiedPushTokens;
}

- (void)setUnverifiedPushTokens:(id)a3
{
}

- (NSArray)endpointTransparencyStates
{
  return self->_endpointTransparencyStates;
}

- (void)setEndpointTransparencyStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointTransparencyStates, 0);
  objc_storeStrong((id *)&self->_unverifiedPushTokens, 0);
  objc_storeStrong((id *)&self->_verifiedPushTokens, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end