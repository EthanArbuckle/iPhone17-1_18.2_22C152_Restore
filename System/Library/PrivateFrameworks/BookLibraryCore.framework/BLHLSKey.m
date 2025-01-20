@interface BLHLSKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHLSKey:(id)a3;
- (BOOL)isFormatSupported;
- (NSString)iv;
- (NSString)keyFormat;
- (NSString)keyFormatVersions;
- (NSURL)url;
- (id)description;
- (int64_t)method;
- (unint64_t)hash;
- (void)setPropertiesFromAttributeList:(id)a3;
@end

@implementation BLHLSKey

- (void)setPropertiesFromAttributeList:(id)a3
{
  id v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, @"METHOD", v6);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(@"NONE", v7, (uint64_t)v29, v8))
  {
    int64_t v11 = 1;
LABEL_7:
    self->_method = v11;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(@"AES-128", v9, (uint64_t)v29, v10))
  {
    int64_t v11 = 2;
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(@"SAMPLE-AES", v9, (uint64_t)v29, v10))
  {
    int64_t v11 = 3;
    goto LABEL_7;
  }
  self->_method = 0;
LABEL_8:
  v12 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"URI", v10);
  objc_msgSend_URLWithString_(NSURL, v13, (uint64_t)v12, v14);
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v15;

  objc_msgSend_objectForKeyedSubscript_(v4, v17, @"KEYFORMAT", v18);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyFormat = self->_keyFormat;
  self->_keyFormat = v19;

  objc_msgSend_objectForKeyedSubscript_(v4, v21, @"KEYFORMATVERSIONS", v22);
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyFormatVersions = self->_keyFormatVersions;
  self->_keyFormatVersions = v23;

  objc_msgSend_objectForKeyedSubscript_(v4, v25, @"IV", v26);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();

  iv = self->_iv;
  self->_iv = v27;
}

- (BOOL)isFormatSupported
{
  return objc_msgSend_isEqualToString_(self->_keyFormat, a2, @"com.apple.streamingkeydelivery", v2);
}

- (id)description
{
  id v4 = NSString;
  v5 = objc_msgSend_numberWithInteger_(NSNumber, a2, self->_method, v2);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"{%@, %@, %@, %@, %@}", v7, v5, self->_url, self->_keyFormat, self->_keyFormatVersions, self->_iv);

  return v8;
}

- (BOOL)isEqualToHLSKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  url = self->_url;
  if (url)
  {
    uint64_t v10 = objc_msgSend_url(v4, v5, v6, v7);
    int isEqual = objc_msgSend_isEqual_(url, v11, (uint64_t)v10, v12);

    if (!isEqual) {
      goto LABEL_10;
    }
  }
  keyFormat = self->_keyFormat;
  if (keyFormat)
  {
    v15 = objc_msgSend_keyFormat(v8, v5, v6, v7);
    int isEqualToString = objc_msgSend_isEqualToString_(keyFormat, v16, (uint64_t)v15, v17);

    if (!isEqualToString) {
      goto LABEL_10;
    }
  }
  iv = self->_iv;
  if (iv)
  {
    v20 = objc_msgSend_iv(v8, v5, v6, v7);
    int v23 = objc_msgSend_isEqualToString_(iv, v21, (uint64_t)v20, v22);

    if (!v23) {
      goto LABEL_10;
    }
  }
  keyFormatVersions = self->_keyFormatVersions;
  if (keyFormatVersions
    && (objc_msgSend_keyFormatVersions(v8, v5, v6, v7),
        v25 = objc_claimAutoreleasedReturnValue(),
        int v28 = objc_msgSend_isEqualToString_(keyFormatVersions, v26, (uint64_t)v25, v27),
        v25,
        !v28))
  {
LABEL_10:
    BOOL v30 = 0;
  }
  else
  {
    int64_t method = self->_method;
    BOOL v30 = method == objc_msgSend_method(v8, v5, v6, v7);
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLHLSKey *)a3;
  if (self == v4)
  {
    char isEqualToHLSKey = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      v5 = BUDynamicCast();
      char isEqualToHLSKey = objc_msgSend_isEqualToHLSKey_(self, v6, (uint64_t)v5, v7);
    }
    else
    {
      char isEqualToHLSKey = 0;
    }
  }

  return isEqualToHLSKey;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_url, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_iv, v6, v7, v8) ^ v5;
  uint64_t v13 = objc_msgSend_hash(self->_keyFormat, v10, v11, v12);
  return v9 ^ v13 ^ objc_msgSend_hash(self->_keyFormatVersions, v14, v15, v16) ^ self->_method;
}

- (int64_t)method
{
  return self->_method;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)keyFormat
{
  return self->_keyFormat;
}

- (NSString)keyFormatVersions
{
  return self->_keyFormatVersions;
}

- (NSString)iv
{
  return self->_iv;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iv, 0);
  objc_storeStrong((id *)&self->_keyFormatVersions, 0);
  objc_storeStrong((id *)&self->_keyFormat, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end