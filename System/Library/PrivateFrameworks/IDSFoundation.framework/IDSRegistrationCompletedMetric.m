@interface IDSRegistrationCompletedMetric
- (BOOL)wasSuccessful;
- (IDSRegistrationCompletedMetric)initWithRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6;
- (NSCopying)awdRepresentation;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)serviceIdentifier;
- (int)registrationType;
- (int64_t)registrationError;
- (unsigned)awdIdentifier;
- (unsigned)rtcType;
@end

@implementation IDSRegistrationCompletedMetric

- (IDSRegistrationCompletedMetric)initWithRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6
{
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IDSRegistrationCompletedMetric;
  v11 = [(IDSRegistrationCompletedMetric *)&v19 init];
  v15 = v11;
  if (v11)
  {
    v11->_registrationType = a3;
    uint64_t v16 = objc_msgSend_copy(v10, v12, v13, v14);
    serviceIdentifier = v15->_serviceIdentifier;
    v15->_serviceIdentifier = (NSString *)v16;

    v15->_wasSuccessful = a5;
    v15->_registrationError = a6;
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)@"RegistrationCompleted";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_registrationType(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInt_(v4, v9, v8, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"ErrorDomain", v11);
  }

  v15 = objc_msgSend_serviceIdentifier(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"ServiceIdentifier", v15);
  }

  uint64_t v16 = NSNumber;
  uint64_t v20 = objc_msgSend_wasSuccessful(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithBool_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"WasSuccessful", v23);
  }

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_registrationError(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"IDSRegistrationError", v31);
  }

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2555931;
}

- (NSCopying)awdRepresentation
{
  id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  uint64_t v7 = objc_msgSend_registrationType(self, v4, v5, v6);
  objc_msgSend_setRegistrationType_(v3, v8, v7, v9);
  uint64_t v13 = objc_msgSend_serviceIdentifier(self, v10, v11, v12);
  objc_msgSend_setServiceIdentifier_(v3, v14, (uint64_t)v13, v15);

  uint64_t v19 = objc_msgSend_wasSuccessful(self, v16, v17, v18);
  objc_msgSend_setWasSuccessful_(v3, v20, v19, v21);
  uint64_t v25 = objc_msgSend_registrationError(self, v22, v23, v24);
  objc_msgSend_setRegistrationError_(v3, v26, v25, v27);
  return (NSCopying *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeRegistrationCompletion;
}

- (int)registrationType
{
  return self->_registrationType;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (int64_t)registrationError
{
  return self->_registrationError;
}

- (void).cxx_destruct
{
}

@end