@interface IDSEngramKeyFetchMetric
- (IDSEngramKeyFetchMetric)initWithKeyFetchError:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSError)keyFetchError;
- (NSString)name;
@end

@implementation IDSEngramKeyFetchMetric

- (IDSEngramKeyFetchMetric)initWithKeyFetchError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSEngramKeyFetchMetric;
  v6 = [(IDSEngramKeyFetchMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyFetchError, a3);
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)@"EngramKeyFetch";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_keyFetchError(self, v4, v5, v6);
  v11 = objc_msgSend_domain(v7, v8, v9, v10);

  if (v11) {
    CFDictionarySetValue(v3, @"ErrorDomain", v11);
  }

  v12 = NSNumber;
  v16 = objc_msgSend_keyFetchError(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_code(v16, v17, v18, v19);
  v23 = objc_msgSend_numberWithInteger_(v12, v21, v20, v22);

  if (v23) {
    CFDictionarySetValue(v3, @"ErrorCode", v23);
  }

  return (NSDictionary *)v3;
}

- (NSError)keyFetchError
{
  return self->_keyFetchError;
}

- (void).cxx_destruct
{
}

@end