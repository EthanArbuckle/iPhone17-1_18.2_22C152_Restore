@interface BLHLSMap
- (BLHLSMap)initWithURL:(id)a3;
- (NSURL)url;
- (id)description;
- (void)setPropertiesFromAttributeList:(id)a3;
@end

@implementation BLHLSMap

- (BLHLSMap)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLHLSMap;
  v6 = [(BLHLSMap *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (void)setPropertiesFromAttributeList:(id)a3
{
  objc_msgSend_objectForKeyedSubscript_(a3, a2, @"URI", v3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(NSURL, v5, (uint64_t)v9, v6);
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v7;
}

- (id)description
{
  v4 = NSString;
  id v5 = objc_msgSend_url(self, a2, v2, v3);
  v8 = objc_msgSend_stringWithFormat_(v4, v6, @"%@", v7, v5);

  return v8;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end