@interface IDSDeliveryControllerTimeMetric
- (BOOL)usedMMCS;
- (BOOL)usedPipeline;
- (IDSDeliveryControllerTimeMetric)initWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (double)timeToSend;
- (int64_t)endpointCount;
- (int64_t)responseCode;
- (unsigned)rtcType;
@end

@implementation IDSDeliveryControllerTimeMetric

- (IDSDeliveryControllerTimeMetric)initWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSDeliveryControllerTimeMetric;
  v17 = [(IDSDeliveryControllerTimeMetric *)&v21 init];
  if (v17)
  {
    objc_msgSend_timeIntervalSinceDate_(v15, v16, (uint64_t)v14, v18);
    v17->_timeToSend = v19;
    v17->_endpointCount = a5;
    v17->_usedPipeline = a6;
    v17->_usedMMCS = a7;
    v17->_responseCode = a8;
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)@"DeliveryControllerTime";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = NSNumber;
  objc_msgSend_timeToSend(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithDouble_(v4, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"TimeToSend", v11);
  }

  v12 = NSNumber;
  uint64_t v16 = objc_msgSend_endpointCount(self, v13, v14, v15);
  double v19 = objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
  if (v19) {
    CFDictionarySetValue(v3, @"EndpointCount", v19);
  }

  v20 = NSNumber;
  uint64_t v24 = objc_msgSend_usedPipeline(self, v21, v22, v23);
  v27 = objc_msgSend_numberWithBool_(v20, v25, v24, v26);
  if (v27) {
    CFDictionarySetValue(v3, @"UsedPipeline", v27);
  }

  v28 = NSNumber;
  uint64_t v32 = objc_msgSend_usedMMCS(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithBool_(v28, v33, v32, v34);
  if (v35) {
    CFDictionarySetValue(v3, @"UsedMMCS", v35);
  }

  v36 = NSNumber;
  uint64_t v40 = objc_msgSend_responseCode(self, v37, v38, v39);
  v43 = objc_msgSend_numberWithInteger_(v36, v41, v40, v42);
  if (v43) {
    CFDictionarySetValue(v3, @"ResponseCode", v43);
  }

  CFDictionarySetValue(v3, @"Version", &unk_1EF028DB0);
  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeDeliveryControllerTime;
}

- (double)timeToSend
{
  return self->_timeToSend;
}

- (int64_t)endpointCount
{
  return self->_endpointCount;
}

- (BOOL)usedPipeline
{
  return self->_usedPipeline;
}

- (BOOL)usedMMCS
{
  return self->_usedMMCS;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

@end