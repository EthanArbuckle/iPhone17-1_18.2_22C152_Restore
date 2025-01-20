@interface IDSRegistrationAuthenticationParametersReceivedMetric
- (IDSRegistrationAuthenticationParametersReceivedMetric)initWithErrorCode:(int64_t)a3 timeIntervalSinceAuthenticationParameterRequest:(double)a4;
- (NSCopying)awdRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (double)timeIntervalSinceAuthenticationParameterRequest;
- (int64_t)errorCode;
- (unsigned)awdIdentifier;
@end

@implementation IDSRegistrationAuthenticationParametersReceivedMetric

- (IDSRegistrationAuthenticationParametersReceivedMetric)initWithErrorCode:(int64_t)a3 timeIntervalSinceAuthenticationParameterRequest:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IDSRegistrationAuthenticationParametersReceivedMetric;
  result = [(IDSRegistrationAuthenticationParametersReceivedMetric *)&v7 init];
  if (result)
  {
    result->_errorCode = a3;
    result->_timeIntervalSinceAuthenticationParameterRequest = a4;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"RegistrationAuthenticationParametersReceived";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_errorCode(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"ErrorCode", v11);
  }

  v12 = NSNumber;
  objc_msgSend_timeIntervalSinceAuthenticationParameterRequest(self, v13, v14, v15);
  v19 = objc_msgSend_numberWithDouble_(v12, v16, v17, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"TimeIntervalSinceRequest", v19);
  }

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555936;
}

- (NSCopying)awdRepresentation
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v7 = objc_msgSend_errorCode(self, v4, v5, v6);
  objc_msgSend_setError_(v3, v8, v7, v9);
  objc_msgSend_timeIntervalSinceAuthenticationParameterRequest(self, v10, v11, v12);
  objc_msgSend_setTimeIntervalSinceRequest_(v3, v14, (unint64_t)(v13 * 1000.0), v13 * 1000.0);
  return (NSCopying *)v3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (double)timeIntervalSinceAuthenticationParameterRequest
{
  return self->_timeIntervalSinceAuthenticationParameterRequest;
}

@end