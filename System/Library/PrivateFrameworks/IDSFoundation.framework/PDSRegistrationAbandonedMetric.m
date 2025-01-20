@interface PDSRegistrationAbandonedMetric
- (NSDate)heartbeatDate;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)registrationReason;
- (NSString)failureReason;
- (NSString)name;
- (PDSRegistrationAbandonedMetric)initWithFailureReason:(id)a3 registrationReason:(id)a4 heartbeatDate:(id)a5;
@end

@implementation PDSRegistrationAbandonedMetric

- (NSString)name
{
  return (NSString *)@"IDSRegistrationAbandoned";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_failureReason(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"failiureReason", v7);
  }

  v11 = objc_msgSend_registrationReason(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"registrationReason", v11);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v12, v13, @"yyyy-MM-dd HH:mm:ss zzz", v14);
  v18 = objc_msgSend_heartbeatDate(self, v15, v16, v17);
  v21 = objc_msgSend_stringFromDate_(v12, v19, (uint64_t)v18, v20);

  if (v21) {
    CFDictionarySetValue(v3, @"plannedHeartbeatDate", v21);
  }

  return (NSDictionary *)v3;
}

- (PDSRegistrationAbandonedMetric)initWithFailureReason:(id)a3 registrationReason:(id)a4 heartbeatDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PDSRegistrationAbandonedMetric;
  id v12 = [(PDSRegistrationAbandonedMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_failureReason, a3);
    objc_storeStrong((id *)&v13->_registrationReason, a4);
    objc_storeStrong((id *)&v13->_heartbeatDate, a5);
  }

  return v13;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (NSNumber)registrationReason
{
  return self->_registrationReason;
}

- (NSDate)heartbeatDate
{
  return self->_heartbeatDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatDate, 0);
  objc_storeStrong((id *)&self->_registrationReason, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end