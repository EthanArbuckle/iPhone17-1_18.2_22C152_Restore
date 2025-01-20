@interface IDSServerStorageStateMachineCompletedMetric
- (BOOL)wasPrimary;
- (IDSServerStorageStateMachineCompletedMetric)initWithService:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (NSString)service;
- (double)timeTaken;
- (int64_t)linkType;
- (int64_t)numberProcessed;
@end

@implementation IDSServerStorageStateMachineCompletedMetric

- (NSString)name
{
  return (NSString *)@"IDSServerStorageStateMachineCompleted";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_service(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"service", v7);
  }

  v8 = NSNumber;
  uint64_t v12 = objc_msgSend_linkType(self, v9, v10, v11);
  v15 = objc_msgSend_numberWithInteger_(v8, v13, v12, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"linkType", v15);
  }

  v16 = NSNumber;
  uint64_t v20 = objc_msgSend_wasPrimary(self, v17, v18, v19);
  v23 = objc_msgSend_numberWithBool_(v16, v21, v20, v22);
  if (v23) {
    CFDictionarySetValue(v3, @"wasPrimary", v23);
  }

  v24 = NSNumber;
  objc_msgSend_timeTaken(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithDouble_(v24, v28, v29, v30);
  if (v31) {
    CFDictionarySetValue(v3, @"timeTaken", v31);
  }

  v32 = NSNumber;
  uint64_t v36 = objc_msgSend_numberProcessed(self, v33, v34, v35);
  v39 = objc_msgSend_numberWithInteger_(v32, v37, v36, v38);
  if (v39) {
    CFDictionarySetValue(v3, @"numberProcessed", v39);
  }

  return (NSDictionary *)v3;
}

- (IDSServerStorageStateMachineCompletedMetric)initWithService:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSServerStorageStateMachineCompletedMetric;
  double v14 = [(IDSServerStorageStateMachineCompletedMetric *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_service, a3);
    v15->_linkType = a4;
    v15->_wasPrimary = a5;
    v15->_timeTaken = a6;
    v15->_numberProcessed = a7;
  }

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)wasPrimary
{
  return self->_wasPrimary;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (int64_t)numberProcessed
{
  return self->_numberProcessed;
}

- (void).cxx_destruct
{
}

@end