@interface BLHLSMedia
- (NSString)name;
- (NSString)type;
- (NSURL)url;
- (id)description;
- (void)setPropertiesFromAttributeList:(id)a3;
@end

@implementation BLHLSMedia

- (void)setPropertiesFromAttributeList:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, @"TYPE", v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v7;

  objc_msgSend_objectForKeyedSubscript_(v4, v9, @"URI", v10);
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v11;

  objc_msgSend_objectForKeyedSubscript_(v4, v13, @"NAME", v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  name = self->_name;
  self->_name = v15;
}

- (id)description
{
  v5 = NSString;
  uint64_t v6 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_type(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_url(self, v11, v12, v13);
  v17 = objc_msgSend_stringWithFormat_(v5, v15, @"%@(%@): %@", v16, v6, v10, v14);

  return v17;
}

- (NSString)type
{
  return self->_type;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end