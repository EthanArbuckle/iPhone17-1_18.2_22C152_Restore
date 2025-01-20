@interface IDSIDKTData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSIDKTData)initWithCoder:(id)a3;
- (IDSIDKTData)initWithVerifierResult:(id)a3 requestID:(id)a4;
- (KTVerifierResult)verifierResult;
- (NSUUID)verificationRequestID;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSIDKTData

- (IDSIDKTData)initWithVerifierResult:(id)a3 requestID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSIDKTData;
  v9 = [(IDSIDKTData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_verifierResult, a3);
    objc_storeStrong((id *)&v10->_verificationRequestID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_verificationRequestID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"IDSIDKTDataVerificationRequestID");

  objc_msgSend_verifierResult(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"IDSIDKTDataVerifierResult");
}

- (IDSIDKTData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9 = objc_msgSend_decodeObjectForKey_(v4, v5, @"IDSIDKTDataVerificationRequestID", v6);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  double v10 = (void *)qword_1E944F3A8;
  uint64_t v23 = qword_1E944F3A8;
  if (!qword_1E944F3A8)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_19DAA811C;
    v19[3] = &unk_1E5974958;
    v19[4] = &v20;
    sub_19DAA811C((uint64_t)v19, v7, v8, COERCE_DOUBLE(3221225472));
    double v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, (uint64_t)v11, v13, @"IDSIDKTDataVerifierResult");
  v17 = (IDSIDKTData *)objc_msgSend_initWithVerifierResult_requestID_(self, v15, (uint64_t)v14, v16, v9);

  return v17;
}

- (id)debugDescription
{
  v5 = NSString;
  double v6 = objc_msgSend_verifierResult(self, a2, v2, v3);
  double v10 = objc_msgSend_verificationRequestID(self, v7, v8, v9);
  double v13 = objc_msgSend_stringWithFormat_(v5, v11, @"Verifier Result: %@, Request ID: %@", v12, v6, v10);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (IDSIDKTData *)a3;
  if (self == v5)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v6 = v5;
      verifierResult = self->_verifierResult;
      id v11 = objc_msgSend_verifierResult(v6, v8, v9, v10);
      char isEqual = objc_msgSend_isEqual_(verifierResult, v12, (uint64_t)v11, v13);
      if ((isEqual & 1) != 0
        || (double v3 = self->_verifierResult,
            objc_msgSend_verifierResult(v6, v14, v15, v17),
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            v3 == (KTVerifierResult *)v18))
      {
        verificationRequestID = self->_verificationRequestID;
        v21 = objc_msgSend_verificationRequestID(v6, v14, v15, v17);
        if (objc_msgSend_isEqual_(verificationRequestID, v22, (uint64_t)v21, v23))
        {
          BOOL v19 = 1;
        }
        else
        {
          v27 = self->_verificationRequestID;
          objc_msgSend_verificationRequestID(v6, v24, v25, v26);
          v28 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          BOOL v19 = v27 == v28;
        }
        if (isEqual) {
          goto LABEL_13;
        }
      }
      else
      {
        BOOL v19 = 0;
        double v3 = (KTVerifierResult *)v18;
      }

LABEL_13:
      goto LABEL_14;
    }
    BOOL v19 = 0;
  }
LABEL_14:

  return v19;
}

- (NSUUID)verificationRequestID
{
  return self->_verificationRequestID;
}

- (KTVerifierResult)verifierResult
{
  return self->_verifierResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifierResult, 0);
  objc_storeStrong((id *)&self->_verificationRequestID, 0);
}

@end