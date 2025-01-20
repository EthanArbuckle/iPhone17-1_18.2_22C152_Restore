@interface IDSRegistrationRenewCredentialsCompletedMetric
- (IDSRegistrationRenewCredentialsCompletedMetric)initWithRenewResult:(int64_t)a3 errorDomain:(id)a4 errorCode:(int64_t)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSString)errorDomain;
- (NSString)name;
- (int64_t)errorCode;
- (int64_t)renewResult;
@end

@implementation IDSRegistrationRenewCredentialsCompletedMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationRenewCredentialsCompleted";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_renewResult(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"renewResult", v11);
  }

  v15 = objc_msgSend_errorDomain(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"errorDomain", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_errorCode(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithInteger_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"errorCode", v23);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationRenewCredentialsCompletedMetric)initWithRenewResult:(int64_t)a3 errorDomain:(id)a4 errorCode:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSRegistrationRenewCredentialsCompletedMetric;
  double v10 = [(IDSRegistrationRenewCredentialsCompletedMetric *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_renewResult = a3;
    objc_storeStrong((id *)&v10->_errorDomain, a4);
    v11->_errorCode = a5;
  }

  return v11;
}

- (int64_t)renewResult
{
  return self->_renewResult;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end