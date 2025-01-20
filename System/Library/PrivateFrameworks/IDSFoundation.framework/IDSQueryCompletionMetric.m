@interface IDSQueryCompletionMetric
- (BOOL)hasEmptyResult;
- (BOOL)success;
- (BOOL)wasReversePushAttempted;
- (IDSQueryCompletionMetric)initWithService:(id)a3 querySuccess:(BOOL)a4 connectionType:(unsigned int)a5 queryTimeInterval:(double)a6 queryURITypes:(unsigned int)a7 conferenceResultCode:(unsigned int)a8 queryErrorType:(unsigned int)a9 queryError:(id)a10 wasReversePushAttempted:(BOOL)a11 hasEmptyResult:(BOOL)a12 queryReason:(id)a13 retryCount:(unint64_t)a14 uriCount:(unint64_t)a15;
- (NSDictionary)dictionaryRepresentation;
- (NSError)queryError;
- (NSString)name;
- (NSString)queryReason;
- (NSString)serviceIdentifier;
- (double)queryTimeInterval;
- (unint64_t)retryCount;
- (unint64_t)uriCount;
- (unsigned)conferenceResultCode;
- (unsigned)connectionType;
- (unsigned)queryErrorType;
- (unsigned)queryURITypes;
@end

@implementation IDSQueryCompletionMetric

- (NSString)name
{
  return (NSString *)@"IDSQueryCompletion";
}

- (IDSQueryCompletionMetric)initWithService:(id)a3 querySuccess:(BOOL)a4 connectionType:(unsigned int)a5 queryTimeInterval:(double)a6 queryURITypes:(unsigned int)a7 conferenceResultCode:(unsigned int)a8 queryErrorType:(unsigned int)a9 queryError:(id)a10 wasReversePushAttempted:(BOOL)a11 hasEmptyResult:(BOOL)a12 queryReason:(id)a13 retryCount:(unint64_t)a14 uriCount:(unint64_t)a15
{
  id v21 = a3;
  id v22 = a10;
  id v23 = a13;
  v29.receiver = self;
  v29.super_class = (Class)IDSQueryCompletionMetric;
  v24 = [(IDSQueryCompletionMetric *)&v29 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_serviceIdentifier, a3);
    v25->_success = a4;
    v25->_queryTimeInterval = a6;
    v25->_connectionType = a5;
    v25->_queryURITypes = a7;
    v25->_conferenceResultCode = a8;
    v25->_queryErrorType = a9;
    objc_storeStrong((id *)&v25->_queryError, a10);
    v25->_wasReversePushAttempted = a11;
    v25->_hasEmptyResult = a12;
    objc_storeStrong((id *)&v25->_queryReason, a13);
    v25->_retryCount = a14;
    v25->_uriCount = a15;
  }

  return v25;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    CFDictionarySetValue(v3, @"service", serviceIdentifier);
  }
  v8 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_success, v5);
  if (v8) {
    CFDictionarySetValue(v6, @"querySuccess", v8);
  }

  v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, self->_connectionType, v10);
  if (v11) {
    CFDictionarySetValue(v6, @"connectionType", v11);
  }

  v14 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, self->_queryTimeInterval);
  if (v14) {
    CFDictionarySetValue(v6, @"queryTimeInterval", v14);
  }

  v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, self->_queryURITypes, v16);
  if (v17) {
    CFDictionarySetValue(v6, @"queryURITypes", v17);
  }

  v20 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v18, self->_queryErrorType, v19);
  if (v20) {
    CFDictionarySetValue(v6, @"queryErrorType", v20);
  }

  id v21 = NSNumber;
  uint64_t v25 = objc_msgSend_code(self->_queryError, v22, v23, v24);
  v28 = objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  if (v28) {
    CFDictionarySetValue(v6, @"queryErrorCode", v28);
  }

  v31 = objc_msgSend_numberWithBool_(NSNumber, v29, self->_wasReversePushAttempted, v30);
  if (v31) {
    CFDictionarySetValue(v6, @"wasReversePushAttempted", v31);
  }

  v34 = objc_msgSend_numberWithBool_(NSNumber, v32, self->_hasEmptyResult, v33);
  if (v34) {
    CFDictionarySetValue(v6, @"hasEmptyResult", v34);
  }

  queryReason = self->_queryReason;
  if (queryReason) {
    CFDictionarySetValue(v6, @"queryReason", queryReason);
  }
  v38 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v35, self->_retryCount, v36);
  if (v38) {
    CFDictionarySetValue(v6, @"retryCount", v38);
  }

  v41 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, self->_uriCount, v40);
  if (v41) {
    CFDictionarySetValue(v6, @"uriCount", v41);
  }

  return (NSDictionary *)v6;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (double)queryTimeInterval
{
  return self->_queryTimeInterval;
}

- (unsigned)queryURITypes
{
  return self->_queryURITypes;
}

- (unsigned)conferenceResultCode
{
  return self->_conferenceResultCode;
}

- (unsigned)queryErrorType
{
  return self->_queryErrorType;
}

- (NSError)queryError
{
  return self->_queryError;
}

- (BOOL)wasReversePushAttempted
{
  return self->_wasReversePushAttempted;
}

- (BOOL)hasEmptyResult
{
  return self->_hasEmptyResult;
}

- (NSString)queryReason
{
  return self->_queryReason;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)uriCount
{
  return self->_uriCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryReason, 0);
  objc_storeStrong((id *)&self->_queryError, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end