@interface IDSGFTMetricsRequest
- (IDSGFTMetricsRequest)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6;
- (void)receivedResponse:(unsigned int)a3;
@end

@implementation IDSGFTMetricsRequest

- (IDSGFTMetricsRequest)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)IDSGFTMetricsRequest;
  v6 = [(IDSGFTMetricsReferencePoint *)&v10 initWithFromType:a3 fromUniqueID:a4 anonymizer:a5 templateDictionary:a6];
  if (v6)
  {
    double v7 = ids_monotonic_time();
    objc_msgSend_event_uniqueID_time_(v6, v8, @"req", v7, &unk_1EF028DF8);
  }
  return v6;
}

- (void)receivedResponse:(unsigned int)a3
{
  objc_msgSend_numberWithUnsignedInt_(NSNumber, a2, *(uint64_t *)&a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_uniqueID_reason_(self, v5, @"rsp", v6, &unk_1EF028DF8, v7);
}

@end