@interface IDSQueryKeyTransparencyContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQueryKeyTransparencyContext:(id)a3;
- (IDSQueryKeyTransparencyContext)initWithCoder:(id)a3;
- (IDSQueryKeyTransparencyContext)initWithVerifierResult:(id)a3 ticket:(id)a4 accountKey:(id)a5 queryResponseTime:(id)a6 ktOptIn:(unint64_t)a7;
- (KTVerifierResult)verifierResult;
- (NSData)accountKey;
- (NSDate)queryResponseTime;
- (NSUUID)ticket;
- (id)description;
- (unint64_t)hash;
- (unint64_t)ktOptIn;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSQueryKeyTransparencyContext

- (IDSQueryKeyTransparencyContext)initWithVerifierResult:(id)a3 ticket:(id)a4 accountKey:(id)a5 queryResponseTime:(id)a6 ktOptIn:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSQueryKeyTransparencyContext;
  v17 = [(IDSQueryKeyTransparencyContext *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_verifierResult, a3);
    objc_storeStrong((id *)&v18->_ticket, a4);
    objc_storeStrong((id *)&v18->_accountKey, a5);
    objc_storeStrong((id *)&v18->_queryResponseTime, a6);
    v18->_ktOptIn = a7;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_verifierResult(self, v5, v6, v7);
  v12 = objc_msgSend_ticket(self, v9, v10, v11);
  id v16 = objc_msgSend_accountKey(self, v13, v14, v15);
  objc_super v20 = objc_msgSend_queryResponseTime(self, v17, v18, v19);
  v21 = NSNumber;
  uint64_t v25 = objc_msgSend_ktOptIn(self, v22, v23, v24);
  v28 = objc_msgSend_numberWithUnsignedInteger_(v21, v26, v25, v27);
  v31 = objc_msgSend_stringWithFormat_(v3, v29, @"<%@: %p verifierResult: %@, ticket: %@, accountKey: %@, queryResponseTime: %@>, ktOptInStatus: %@", v30, v4, self, v8, v12, v16, v20, v28);

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToQueryKeyTransparencyContext = objc_msgSend_isEqualToQueryKeyTransparencyContext_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToQueryKeyTransparencyContext = 0;
  }

  return isEqualToQueryKeyTransparencyContext;
}

- (BOOL)isEqualToQueryKeyTransparencyContext:(id)a3
{
  double v6 = (IDSQueryKeyTransparencyContext *)a3;
  uint64_t v10 = v6;
  if (self == v6)
  {
    BOOL v24 = 1;
  }
  else
  {
    if (v6)
    {
      double v11 = objc_msgSend_ticket(self, v7, v8, v9);
      v17 = objc_msgSend_ticket(v10, v12, v13, v14);
      if (v11 != v17)
      {
        v3 = objc_msgSend_ticket(self, v15, v16, v18);
        id v4 = objc_msgSend_ticket(v10, v19, v20, v21);
        if (!objc_msgSend_isEqual_(v3, v22, (uint64_t)v4, v23))
        {
          BOOL v24 = 0;
          goto LABEL_24;
        }
      }
      uint64_t v25 = objc_msgSend_verifierResult(self, v15, v16, v18);
      v29 = objc_msgSend_verifierResult(v10, v26, v27, v28);
      if (!objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31))
      {

        BOOL v24 = 0;
        goto LABEL_23;
      }
      v35 = objc_msgSend_accountKey(self, v32, v33, v34);
      v39 = objc_msgSend_accountKey(v10, v36, v37, v38);
      char isEqualToData = objc_msgSend_isEqualToData_(v35, v40, (uint64_t)v39, v41);
      if ((isEqualToData & 1) == 0)
      {
        v81 = v3;
        v45 = objc_msgSend_accountKey(self, v42, v43, v44);
        v77 = objc_msgSend_accountKey(v10, v46, v47, v48);
        v78 = v45;
        if (!objc_msgSend_isEqual_(v45, v49, (uint64_t)v77, v50))
        {
          BOOL v24 = 0;
          v3 = v81;
          goto LABEL_21;
        }
        v3 = v81;
      }
      v80 = v39;
      v82 = v35;
      v51 = objc_msgSend_queryResponseTime(self, v42, v43, v44);
      v55 = objc_msgSend_queryResponseTime(v10, v52, v53, v54);
      v79 = v51;
      char isEqualToDate = objc_msgSend_isEqualToDate_(v51, v56, (uint64_t)v55, v57);
      if (isEqualToDate) {
        goto LABEL_14;
      }
      objc_msgSend_queryResponseTime(self, v58, v59, v61);
      uint64_t v62 = v74 = v4;
      v75 = objc_msgSend_queryResponseTime(v10, v63, v64, v65);
      v76 = (void *)v62;
      v66 = (void *)v62;
      id v4 = v74;
      if (objc_msgSend_isEqual_(v66, v67, (uint64_t)v75, v68))
      {
LABEL_14:
        uint64_t v69 = objc_msgSend_ktOptIn(self, v58, v59, v61);
        BOOL v24 = v69 == objc_msgSend_ktOptIn(v10, v70, v71, v72);
        if (isEqualToDate)
        {
LABEL_20:

          v39 = v80;
          v35 = v82;
          if (isEqualToData)
          {
LABEL_22:

LABEL_23:
            if (v11 == v17)
            {
LABEL_25:

              goto LABEL_26;
            }
LABEL_24:

            goto LABEL_25;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        BOOL v24 = 0;
      }

      goto LABEL_20;
    }
    BOOL v24 = 0;
  }
LABEL_26:

  return v24;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_ticket(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_verifierResult(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  double v21 = objc_msgSend_accountKey(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  v29 = objc_msgSend_queryResponseTime(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  unint64_t v37 = v33 ^ objc_msgSend_ktOptIn(self, v34, v35, v36);

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSQueryKeyTransparencyContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"Ticket");
  uint64_t v37 = 0;
  double v38 = &v37;
  uint64_t v39 = 0x2050000000;
  uint64_t v11 = (void *)qword_1E944F3B0;
  uint64_t v40 = qword_1E944F3B0;
  if (!qword_1E944F3B0)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_19DAF582C;
    v36[3] = &unk_1E5974958;
    v36[4] = &v37;
    sub_19DAF582C((uint64_t)v36, v8, v9, COERCE_DOUBLE(3221225472));
    uint64_t v11 = (void *)v38[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v37, 8);
  uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, (uint64_t)v12, v14, @"VerifierResult");
  uint64_t v16 = objc_opt_class();
  uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, @"AccountKey");
  uint64_t v20 = objc_opt_class();
  uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, v22, @"QueryResponseTime");
  uint64_t v24 = objc_opt_class();
  uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, v26, @"OptInStatus");
  uint64_t v31 = objc_msgSend_unsignedIntegerValue(v27, v28, v29, v30);

  ResponseTime_ktOptIn = (IDSQueryKeyTransparencyContext *)objc_msgSend_initWithVerifierResult_ticket_accountKey_queryResponseTime_ktOptIn_(self, v32, (uint64_t)v15, v33, v10, v19, v23, v31);
  return ResponseTime_ktOptIn;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v8 = objc_msgSend_ticket(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"Ticket");

  double v14 = objc_msgSend_verifierResult(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, @"VerifierResult");

  uint64_t v20 = objc_msgSend_accountKey(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, @"AccountKey");

  double v26 = objc_msgSend_queryResponseTime(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, @"QueryResponseTime");

  uint64_t v29 = NSNumber;
  uint64_t v33 = objc_msgSend_ktOptIn(self, v30, v31, v32);
  objc_msgSend_numberWithUnsignedInteger_(v29, v34, v33, v35);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v38, v37, @"OptInStatus");
}

- (NSUUID)ticket
{
  return self->_ticket;
}

- (KTVerifierResult)verifierResult
{
  return self->_verifierResult;
}

- (NSData)accountKey
{
  return self->_accountKey;
}

- (NSDate)queryResponseTime
{
  return self->_queryResponseTime;
}

- (unint64_t)ktOptIn
{
  return self->_ktOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResponseTime, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
  objc_storeStrong((id *)&self->_verifierResult, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end