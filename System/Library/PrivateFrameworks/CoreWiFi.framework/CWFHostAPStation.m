@interface CWFHostAPStation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHostAPStation:(id)a3;
- (CWFHostAPStation)initWithCoder:(id)a3;
- (NSString)BSSID;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBSSID:(id)a3;
@end

@implementation CWFHostAPStation

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = objc_msgSend_BSSID(self, v4, v5, v6, v7);
  v13 = objc_msgSend_redactedForWiFi(v8, v9, v10, v11, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, @"bssid", v15);

  v19 = sub_1B4F59CC8(v3, 0, 1u);
  if (v19)
  {
    v20 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v19, v17, v18);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)description
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_BSSID(self, v7, v8, v9, v10);
  v16 = objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  objc_msgSend_appendFormat_(v6, v17, @"bssid=%@", v18, v19, v16);

  return (NSString *)v6;
}

- (BOOL)isEqualToHostAPStation:(id)a3
{
  id v4 = a3;
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v4, v6, v7, v8, v9);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID == v14)
  {
    char isEqual = 1;
  }
  else if (self->_BSSID)
  {
    uint64_t v19 = objc_msgSend_BSSID(v4, v10, v11, v12, v13);
    if (v19)
    {
      v20 = self->_BSSID;
      v21 = objc_msgSend_BSSID(v4, v15, v16, v17, v18);
      char isEqual = objc_msgSend_isEqual_(v20, v22, (uint64_t)v21, v23, v24);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFHostAPStation *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToHostAPStation = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToHostAPStation = objc_msgSend_isEqualToHostAPStation_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToHostAPStation = 0;
  }

  return isEqualToHostAPStation;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_BSSID, a2, v2, v3, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFHostAPStation, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setBSSID_(v11, v12, (uint64_t)self->_BSSID, v13, v14);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_BSSID, @"_BSSID", v3);
}

- (CWFHostAPStation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CWFHostAPStation;
  uint64_t v5 = [(CWFHostAPStation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_BSSID", v8);
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v9;
  }
  return v5;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end