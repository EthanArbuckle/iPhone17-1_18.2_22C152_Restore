@interface GDViewAccessToken
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysAvailable;
- (GDViewAccessToken)initWithCoder:(id)a3;
- (GDViewAccessToken)initWithToken:(id)a3 url:(id)a4 tableName:(id)a5 alwaysAvailable:(BOOL)a6;
- (NSData)token;
- (NSString)tableName;
- (NSURL)url;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDViewAccessToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

- (BOOL)alwaysAvailable
{
  return self->_alwaysAvailable;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)token
{
  return self->_token;
}

- (GDViewAccessToken)initWithCoder:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)GDViewAccessToken;
  v6 = [(GDViewAccessToken *)&v38 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v8, v7, @"token", v9);
    if (!v14)
    {
      v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12, v13);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)v6, @"GDViewAccessToken.m", 56, @"Invalid parameter not satisfying: %@", @"token");
    }
    objc_storeStrong((id *)&v6->_token, v14);
    uint64_t v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v5, v16, v15, @"url", v17);
    v22 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v36 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19, v20, v21);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, (uint64_t)v6, @"GDViewAccessToken.m", 59, @"Invalid parameter not satisfying: %@", @"url");
    }
    url = v6->_url;
    v6->_url = v22;
    v24 = v22;

    uint64_t v25 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v5, v26, v25, @"tableName", v27);
    tableName = v6->_tableName;
    v6->_tableName = (NSString *)v28;

    v6->_alwaysAvailable = objc_msgSend_decodeBoolForKey_(v5, v30, @"alwaysAvailable", v31, v32);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  token = self->_token;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)token, @"token", v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_url, @"url", v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_tableName, @"tableName", v10);
  objc_msgSend_encodeBool_forKey_(v13, v11, self->_alwaysAvailable, @"alwaysAvailable", v12);
}

- (GDViewAccessToken)initWithToken:(id)a3 url:(id)a4 tableName:(id)a5 alwaysAvailable:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v33.receiver = self;
  v33.super_class = (Class)GDViewAccessToken;
  uint64_t v17 = [(GDViewAccessToken *)&v33 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend_copy(v10, v13, v14, v15, v16);
    token = v17->_token;
    v17->_token = (NSData *)v18;

    uint64_t v24 = objc_msgSend_copy(v11, v20, v21, v22, v23);
    url = v17->_url;
    v17->_url = (NSURL *)v24;

    uint64_t v30 = objc_msgSend_copy(v12, v26, v27, v28, v29);
    tableName = v17->_tableName;
    v17->_tableName = (NSString *)v30;

    v17->_alwaysAvailable = a6;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end