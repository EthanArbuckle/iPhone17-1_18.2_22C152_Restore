@interface MTRClusterOtaSoftwareUpdateRequestor
- (MTRClusterOtaSoftwareUpdateRequestor)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeDefaultOtaProvidersWithParams:(MTRReadParams *)params;
- (void)announceOtaProviderWithParams:(MTROtaSoftwareUpdateRequestorClusterAnnounceOtaProviderParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterOtaSoftwareUpdateRequestor

- (MTRClusterOtaSoftwareUpdateRequestor)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRClusterOtaSoftwareUpdateRequestor *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)announceOtaProviderWithParams:(MTROtaSoftwareUpdateRequestorClusterAnnounceOtaProviderParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (NSDictionary)readAttributeDefaultOtaProvidersWithParams:(MTRReadParams *)params
{
  v3 = objc_msgSend_readAttributeDefaultOTAProvidersWithParams_(self, a2, (uint64_t)params);

  return (NSDictionary *)v3;
}

- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeDefaultOtaProvidersWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
}

@end