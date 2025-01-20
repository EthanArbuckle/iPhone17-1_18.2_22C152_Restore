@interface IDSRegistrationDailyPNRStatusMetric
- (BOOL)hasMultipleSIMs;
- (BOOL)pnrCurrentlyRegistered;
- (BOOL)pnrRegisteredToday;
- (IDSRegistrationDailyPNRStatusMetric)initWithPNRCurrentlyRegistered:(BOOL)a3 pnrRegisteredToday:(BOOL)a4 pnrMechanism:(id)a5 errorCode:(id)a6 hasMultipleSIMs:(BOOL)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)errorCode;
- (NSString)name;
- (NSString)pnrMechanism;
@end

@implementation IDSRegistrationDailyPNRStatusMetric

- (NSString)name
{
  return (NSString *)@"PNRRegStatus";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_pnrCurrentlyRegistered, v5);
  if (v6) {
    CFDictionarySetValue(v3, @"pnr_registered", v6);
  }

  v9 = objc_msgSend_numberWithBool_(NSNumber, v7, self->_pnrRegisteredToday, v8);
  if (v9) {
    CFDictionarySetValue(v3, @"pnr_activation_reregistration", v9);
  }

  pnrMechanism = self->_pnrMechanism;
  if (pnrMechanism) {
    CFDictionarySetValue(v3, @"transport", pnrMechanism);
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    CFDictionarySetValue(v3, @"error_codes", errorCode);
  }
  v14 = objc_msgSend_numberWithBool_(NSNumber, v10, self->_hasMultipleSIMs, v11);
  if (v14) {
    CFDictionarySetValue(v3, @"has_multiple_sims", v14);
  }

  return (NSDictionary *)v3;
}

- (IDSRegistrationDailyPNRStatusMetric)initWithPNRCurrentlyRegistered:(BOOL)a3 pnrRegisteredToday:(BOOL)a4 pnrMechanism:(id)a5 errorCode:(id)a6 hasMultipleSIMs:(BOOL)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSRegistrationDailyPNRStatusMetric;
  v15 = [(IDSRegistrationDailyPNRStatusMetric *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_pnrCurrentlyRegistered = a3;
    v15->_pnrRegisteredToday = a4;
    objc_storeStrong((id *)&v15->_pnrMechanism, a5);
    objc_storeStrong((id *)&v16->_errorCode, a6);
    v16->_hasMultipleSIMs = a7;
  }

  return v16;
}

- (BOOL)pnrCurrentlyRegistered
{
  return self->_pnrCurrentlyRegistered;
}

- (BOOL)pnrRegisteredToday
{
  return self->_pnrRegisteredToday;
}

- (NSString)pnrMechanism
{
  return self->_pnrMechanism;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (BOOL)hasMultipleSIMs
{
  return self->_hasMultipleSIMs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_pnrMechanism, 0);
}

@end