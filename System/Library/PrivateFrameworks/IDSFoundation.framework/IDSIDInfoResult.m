@interface IDSIDInfoResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSGameCenterData)gameCenterData;
- (IDSIDInfoResult)initWithCoder:(id)a3;
- (IDSIDInfoResult)initWithURI:(id)a3 status:(int64_t)a4 endpoints:(id)a5 ktData:(id)a6 gameCenterData:(id)a7;
- (IDSIDKTData)ktData;
- (NSArray)endpoints;
- (NSString)uri;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSIDInfoResult

- (IDSIDInfoResult)initWithURI:(id)a3 status:(int64_t)a4 endpoints:(id)a5 ktData:(id)a6 gameCenterData:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSIDInfoResult;
  v17 = [(IDSIDInfoResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uri, a3);
    v18->_status = a4;
    objc_storeStrong((id *)&v18->_endpoints, a5);
    objc_storeStrong((id *)&v18->_ktData, a6);
    objc_storeStrong((id *)&v18->_gameCenterData, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_uri(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_status(self, v7, v8, v9);
  id v14 = objc_msgSend_endpoints(self, v11, v12, v13);
  v18 = objc_msgSend_ktData(self, v15, v16, v17);
  v22 = objc_msgSend_gameCenterData(self, v19, v20, v21);
  v25 = objc_msgSend_stringWithFormat_(v5, v23, @"<IDSIDInfoResult %p>: uri %@ status %ld endpoints %@ ktData %@ gameCenterData %@", v24, self, v6, v10, v14, v18, v22);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IDSIDInfoResult *)a3;
  if (self == v4)
  {
    BOOL v51 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uri = self->_uri;
      uint64_t v10 = objc_msgSend_uri(v5, v7, v8, v9);
      if (!objc_msgSend_isEqualToString_(uri, v11, (uint64_t)v10, v12))
      {
        BOOL v51 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v15 = objc_msgSend_numberWithInteger_(NSNumber, v13, self->_status, v14);
      uint64_t v16 = NSNumber;
      uint64_t v20 = objc_msgSend_status(v5, v17, v18, v19);
      v23 = objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
      if (!objc_msgSend_isEqualToNumber_(v15, v24, (uint64_t)v23, v25))
      {
        BOOL v51 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v28 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v26, (uint64_t)self->_endpoints, v27);
      v29 = (void *)MEMORY[0x1E4F1CAD0];
      v33 = objc_msgSend_endpoints(v5, v30, v31, v32);
      v36 = objc_msgSend_setWithArray_(v29, v34, (uint64_t)v33, v35);
      if (!objc_msgSend_isEqualToSet_(v28, v37, (uint64_t)v36, v38))
      {
        BOOL v51 = 0;
LABEL_21:

        goto LABEL_22;
      }
      v66 = v28;
      ktData = self->_ktData;
      v43 = objc_msgSend_ktData(v5, v39, v40, v41);
      char isEqual = objc_msgSend_isEqual_(ktData, v44, (uint64_t)v43, v45);
      if ((isEqual & 1) == 0)
      {
        v49 = self->_ktData;
        objc_msgSend_ktData(v5, v46, v47, v48);
        v50 = (IDSIDKTData *)objc_claimAutoreleasedReturnValue();
        if (v49 != v50)
        {
          BOOL v51 = 0;
          v28 = v66;

LABEL_20:
          goto LABEL_21;
        }
        v62 = v49;
      }
      v64 = v43;
      gameCenterData = self->_gameCenterData;
      v53 = objc_msgSend_gameCenterData(v5, v46, v47, v48, v62);
      if (objc_msgSend_isEqual_(gameCenterData, v54, (uint64_t)v53, v55))
      {

        BOOL v51 = 1;
      }
      else
      {
        v59 = self->_gameCenterData;
        objc_msgSend_gameCenterData(v5, v56, v57, v58);
        v60 = (IDSGameCenterData *)objc_claimAutoreleasedReturnValue();
        BOOL v51 = v59 == v60;
      }
      v28 = v66;
      v43 = v64;
      if ((isEqual & 1) == 0) {

      }
      goto LABEL_20;
    }
    BOOL v51 = 0;
  }
LABEL_24:

  return v51;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_uri(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"IDSIDInfoResultURIKey");

  uint64_t v14 = objc_msgSend_status(self, v11, v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v15, v14, v16, @"IDSIDInfoResultStatusKey");
  uint64_t v20 = objc_msgSend_endpoints(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, @"IDSIDInfoResultEndpointsKey");

  v26 = objc_msgSend_ktData(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, @"IDSIDInfoResultKTDataKey");

  objc_msgSend_gameCenterData(self, v29, v30, v31);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v34, v33, @"IDSIDInfoResultGameCenterDataKey");
}

- (IDSIDInfoResult)initWithCoder:(id)a3
{
  id v4 = a3;
  double v7 = objc_msgSend_decodeObjectForKey_(v4, v5, @"IDSIDInfoResultURIKey", v6);
  uint64_t v10 = objc_msgSend_decodeIntegerForKey_(v4, v8, @"IDSIDInfoResultStatusKey", v9);
  double v13 = objc_msgSend_decodeObjectForKey_(v4, v11, @"IDSIDInfoResultEndpointsKey", v12);
  double v16 = objc_msgSend_decodeObjectForKey_(v4, v14, @"IDSIDInfoResultKTDataKey", v15);
  double v19 = objc_msgSend_decodeObjectForKey_(v4, v17, @"IDSIDInfoResultGameCenterDataKey", v18);

  double v22 = (IDSIDInfoResult *)objc_msgSend_initWithURI_status_endpoints_ktData_gameCenterData_(self, v20, (uint64_t)v7, v21, v10, v13, v16, v19);
  return v22;
}

- (NSString)uri
{
  return self->_uri;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (IDSIDKTData)ktData
{
  return self->_ktData;
}

- (IDSGameCenterData)gameCenterData
{
  return self->_gameCenterData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameCenterData, 0);
  objc_storeStrong((id *)&self->_ktData, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end