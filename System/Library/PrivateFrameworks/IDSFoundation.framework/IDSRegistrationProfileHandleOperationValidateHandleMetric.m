@interface IDSRegistrationProfileHandleOperationValidateHandleMetric
- (BOOL)success;
- (IDSRegistrationProfileHandleOperationValidateHandleMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationError:(unsigned int)a7 vettingStatus:(unsigned int)a8 genericError:(id)a9 URLError:(id)a10 POSIXError:(id)a11;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)POSIXError;
- (NSNumber)URLError;
- (NSNumber)genericError;
- (NSString)guid;
- (NSString)name;
- (unsigned)connectionType;
- (unsigned)registrationError;
- (unsigned)resultCode;
- (unsigned)vettingStatus;
@end

@implementation IDSRegistrationProfileHandleOperationValidateHandleMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationProfileHandleOperationLinkHandles";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_success(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"success", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_connectionType(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"connectionType", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_resultCode(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"resultCode", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_registrationError(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithUnsignedInt_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"registrationError", v39);
  }

  v40 = NSNumber;
  uint64_t v44 = objc_msgSend_vettingStatus(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithUnsignedInt_(v40, v45, v44, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"vettingStatus", v47);
  }

  v51 = objc_msgSend_genericError(self, v48, v49, v50);
  if (v51) {
    CFDictionarySetValue(v3, @"genericError", v51);
  }

  v55 = objc_msgSend_URLError(self, v52, v53, v54);
  if (v55) {
    CFDictionarySetValue(v3, @"URLError", v55);
  }

  v59 = objc_msgSend_POSIXError(self, v56, v57, v58);
  if (v59) {
    CFDictionarySetValue(v3, @"POSIXError", v59);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationProfileHandleOperationValidateHandleMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationError:(unsigned int)a7 vettingStatus:(unsigned int)a8 genericError:(id)a9 URLError:(id)a10 POSIXError:(id)a11
{
  id v24 = a3;
  id v15 = a9;
  id v16 = a10;
  id v17 = a11;
  v25.receiver = self;
  v25.super_class = (Class)IDSRegistrationProfileHandleOperationValidateHandleMetric;
  uint64_t v18 = [(IDSRegistrationProfileHandleOperationValidateHandleMetric *)&v25 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_guid, a3);
    v19->_success = a4;
    v19->_connectionType = a5;
    v19->_resultCode = a6;
    v19->_registrationError = a7;
    v19->_vettingStatus = a8;
    objc_storeStrong((id *)&v19->_genericError, a9);
    objc_storeStrong((id *)&v19->_URLError, a10);
    objc_storeStrong((id *)&v19->_POSIXError, a11);
  }

  return v19;
}

- (NSString)guid
{
  return self->_guid;
}

- (BOOL)success
{
  return self->_success;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (unsigned)resultCode
{
  return self->_resultCode;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (unsigned)vettingStatus
{
  return self->_vettingStatus;
}

- (NSNumber)genericError
{
  return self->_genericError;
}

- (NSNumber)URLError
{
  return self->_URLError;
}

- (NSNumber)POSIXError
{
  return self->_POSIXError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_POSIXError, 0);
  objc_storeStrong((id *)&self->_URLError, 0);
  objc_storeStrong((id *)&self->_genericError, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end