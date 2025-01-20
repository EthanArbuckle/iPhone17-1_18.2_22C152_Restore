@interface IDSRegistrationPhoneNumberValidationFinishedMetric
- (IDSRegistrationPhoneNumberValidationFinishedMetric)initWithGuid:(id)a3 registrationError:(unsigned int)a4 validationDuration:(id)a5 numberOfSMSSent:(id)a6;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)numberOfSMSSent;
- (NSNumber)validationDuration;
- (NSString)guid;
- (NSString)name;
- (unsigned)registrationError;
@end

@implementation IDSRegistrationPhoneNumberValidationFinishedMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationPhoneNumberValidationFinished";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_guid(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"guid", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_registrationError(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithUnsignedInt_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"registrationError", v15);
  }

  v19 = objc_msgSend_validationDuration(self, v16, v17, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"validationDuration", v19);
  }

  v23 = objc_msgSend_numberOfSMSSent(self, v20, v21, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"numberOfSMSSent", v23);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationPhoneNumberValidationFinishedMetric)initWithGuid:(id)a3 registrationError:(unsigned int)a4 validationDuration:(id)a5 numberOfSMSSent:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSRegistrationPhoneNumberValidationFinishedMetric;
  double v14 = [(IDSRegistrationPhoneNumberValidationFinishedMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guid, a3);
    v15->_registrationError = a4;
    objc_storeStrong((id *)&v15->_validationDuration, a5);
    objc_storeStrong((id *)&v15->_numberOfSMSSent, a6);
  }

  return v15;
}

- (NSString)guid
{
  return self->_guid;
}

- (unsigned)registrationError
{
  return self->_registrationError;
}

- (NSNumber)validationDuration
{
  return self->_validationDuration;
}

- (NSNumber)numberOfSMSSent
{
  return self->_numberOfSMSSent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSMSSent, 0);
  objc_storeStrong((id *)&self->_validationDuration, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end