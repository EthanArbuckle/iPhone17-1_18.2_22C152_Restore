@interface IDSRegistrationAuthenticateMetric
- (BOOL)isDSUser;
- (BOOL)isPhoneUser;
- (BOOL)success;
- (IDSRegistrationAuthenticateMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationError:(unsigned int)a7 isPhoneUser:(BOOL)a8 isDSUser:(BOOL)a9 genericError:(id)a10 URLError:(id)a11 POSIXError:(id)a12;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)POSIXError;
- (NSNumber)URLError;
- (NSNumber)genericError;
- (NSString)guid;
- (NSString)name;
- (unsigned)connectionType;
- (unsigned)registrationError;
- (unsigned)resultCode;
@end

@implementation IDSRegistrationAuthenticateMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationAuthenticate";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_connectionType(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithUnsignedInt_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"connectionType", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_resultCode(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithUnsignedInt_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"resultCode", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_registrationError(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithUnsignedInt_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"registrationError", v31);
  }

  v32 = NSNumber;
  uint64_t isPhoneUser = objc_msgSend_isPhoneUser(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithBool_(v32, v37, isPhoneUser, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"isPhoneUser", v39);
  }

  v40 = NSNumber;
  uint64_t isDSUser = objc_msgSend_isDSUser(self, v41, v42, v43);
  v47 = objc_msgSend_numberWithBool_(v40, v45, isDSUser, v46);
  if (v47) {
    CFDictionarySetValue(v3, @"isDSUser", v47);
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

- (IDSRegistrationAuthenticateMetric)initWithGuid:(id)a3 success:(BOOL)a4 connectionType:(unsigned int)a5 resultCode:(unsigned int)a6 registrationError:(unsigned int)a7 isPhoneUser:(BOOL)a8 isDSUser:(BOOL)a9 genericError:(id)a10 URLError:(id)a11 POSIXError:(id)a12
{
  id v16 = a3;
  id v17 = a10;
  id v18 = a11;
  id v25 = a12;
  v26.receiver = self;
  v26.super_class = (Class)IDSRegistrationAuthenticateMetric;
  double v19 = [(IDSRegistrationAuthenticateMetric *)&v26 init];
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_guid, a3);
    v20->_success = a4;
    v20->_connectionType = a5;
    v20->_resultCode = a6;
    v20->_registrationError = a7;
    v20->_uint64_t isPhoneUser = a8;
    v20->_uint64_t isDSUser = a9;
    objc_storeStrong((id *)&v20->_genericError, a10);
    objc_storeStrong((id *)&v20->_URLError, a11);
    objc_storeStrong((id *)&v20->_POSIXError, a12);
  }

  return v20;
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

- (BOOL)isPhoneUser
{
  return self->_isPhoneUser;
}

- (BOOL)isDSUser
{
  return self->_isDSUser;
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