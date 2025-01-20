@interface IDSOpportunisticData
+ (BOOL)supportsSecureCoding;
- (BOOL)isInvalid;
- (BOOL)shouldSendToDestination:(id)a3;
- (IDSOpportunisticData)initWithCoder:(id)a3;
- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7;
- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7 sendCount:(id)a8;
- (IDSOpportunisticOptions)options;
- (NSData)data;
- (NSMutableDictionary)sendCount;
- (NSString)accountUniqueID;
- (NSString)identifier;
- (NSString)serviceName;
- (id)copy;
- (id)description;
- (int64_t)sendCountForURI:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementSendCountForDestination:(id)a3;
- (void)markInvalid;
- (void)setAccountUniqueID:(id)a3;
- (void)setData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSendCount:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation IDSOpportunisticData

- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7
{
  v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v12);
  v21 = (IDSOpportunisticData *)objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(self, v19, (uint64_t)v17, v20, v16, v15, v14, v13, v18);

  return v21;
}

- (IDSOpportunisticData)initWithData:(id)a3 identifier:(id)a4 serviceName:(id)a5 accountUniqueID:(id)a6 options:(id)a7 sendCount:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IDSOpportunisticData;
  id v18 = [(IDSOpportunisticData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_data, a3);
    objc_storeStrong((id *)&v19->_identifier, a4);
    objc_storeStrong((id *)&v19->_serviceName, a5);
    objc_storeStrong((id *)&v19->_accountUniqueID, a6);
    objc_storeStrong((id *)&v19->_options, a7);
    objc_storeStrong((id *)&v19->_sendCount, a8);
  }

  return v19;
}

- (BOOL)isInvalid
{
  if (!self->_data) {
    return 1;
  }
  v7 = objc_msgSend_expiryDate(self->_options, a2, v2, v3);
  if (v7)
  {
    v9 = objc_msgSend_expiryDate(self->_options, v5, v6, v8);
    v10 = objc_opt_new();
    BOOL v13 = objc_msgSend_compare_(v9, v11, (uint64_t)v10, v12) == -1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)markInvalid
{
  data = self->_data;
  self->_data = 0;
}

- (BOOL)shouldSendToDestination:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isInvalid(self, v5, v6, v7))
  {
    BOOL v10 = 0;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v11 = objc_msgSend_normalizedURIs(v4, v8, v9, 0.0, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, v13, v37, 16);
    if (v14)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v11);
          }
          uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v21 = objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v15, v20, v16);
          if (objc_msgSend_integerValue(v21, v22, v23, v24) >= 3)
          {

LABEL_15:
            BOOL v10 = 0;
            goto LABEL_16;
          }
          v28 = objc_msgSend_blocklistedDestinations(self->_options, v25, v26, v27);
          char v31 = objc_msgSend_containsObject_(v28, v29, v20, v30);

          if (v31) {
            goto LABEL_15;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v33, v16, v37, 16);
        BOOL v10 = 1;
        if (v17) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v10 = 1;
    }
LABEL_16:
  }
  return v10;
}

- (void)incrementSendCountForDestination:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = objc_msgSend_normalizedURIs(a3, a2, (uint64_t)a3, 0.0, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, v6, v32, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v8, v13, v9);

        if (v14)
        {
          uint64_t v17 = NSNumber;
          uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(self->_sendCount, v15, v13, v16);
          uint64_t v22 = objc_msgSend_integerValue(v18, v19, v20, v21);
          v25 = objc_msgSend_numberWithInteger_(v17, v23, v22 + 1, v24);
          objc_msgSend_setObject_forKeyedSubscript_(self->_sendCount, v26, (uint64_t)v25, v27, v13);
        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(self->_sendCount, v15, (uint64_t)&unk_1EF028C90, v16, v13);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v28, v9, v32, 16);
    }
    while (v10);
  }
}

- (int64_t)sendCountForURI:(id)a3
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(self->_sendCount, a2, (uint64_t)a3, v3);
  int64_t v8 = objc_msgSend_integerValue(v4, v5, v6, v7);

  return v8;
}

- (id)copy
{
  id v3 = objc_alloc((Class)objc_opt_class());
  double v7 = objc_msgSend_data(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_identifier(self, v8, v9, v10);
  id v15 = objc_msgSend_serviceName(self, v12, v13, v14);
  v19 = objc_msgSend_accountUniqueID(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_options(self, v20, v21, v22);
  double v27 = objc_msgSend_sendCount(self, v24, v25, v26);
  long long v30 = objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(v3, v28, (uint64_t)v7, v29, v11, v15, v19, v23, v27);

  return v30;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v8 = objc_msgSend_identifier(self, v5, v6, v7);
  double v12 = objc_msgSend_data(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_length(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_serviceName(self, v17, v18, v19);
  double v24 = objc_msgSend_accountUniqueID(self, v21, v22, v23);
  long long v28 = objc_msgSend_options(self, v25, v26, v27);
  long long v31 = objc_msgSend_stringWithFormat_(v3, v29, @"<%@:%p %@, %llu bytes, service: %@, account: %@, options: %@>", v30, v4, self, v8, v16, v20, v24, v28);

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOpportunisticData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"data");
  uint64_t v9 = objc_opt_class();
  double v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"identifier");
  uint64_t v13 = objc_opt_class();
  uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, @"accountUniqueID");
  uint64_t v17 = objc_opt_class();
  uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, v19, @"service");
  uint64_t v21 = objc_opt_class();
  double v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, @"options");
  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  long long v31 = objc_msgSend_setWithObjects_(v25, v29, v26, v30, v27, v28, 0);
  long long v34 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v32, (uint64_t)v31, v33, @"sendCount");

  v37 = (IDSOpportunisticData *)objc_msgSend_initWithData_identifier_serviceName_accountUniqueID_options_sendCount_(self, v35, (uint64_t)v8, v36, v12, v20, v16, v24, v34);
  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v8 = objc_msgSend_data(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"data");

  uint64_t v14 = objc_msgSend_identifier(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, @"identifier");

  uint64_t v20 = objc_msgSend_serviceName(self, v17, v18, v19);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, @"service");

  uint64_t v26 = objc_msgSend_accountUniqueID(self, v23, v24, v25);
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, @"accountUniqueID");

  v32 = objc_msgSend_options(self, v29, v30, v31);
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v32, v34, @"options");

  objc_msgSend_sendCount(self, v35, v36, v37);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v40, v39, @"sendCount");
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)accountUniqueID
{
  return self->_accountUniqueID;
}

- (void)setAccountUniqueID:(id)a3
{
}

- (IDSOpportunisticOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSMutableDictionary)sendCount
{
  return self->_sendCount;
}

- (void)setSendCount:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendCount, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_accountUniqueID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end