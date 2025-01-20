@interface CKDTrafficLogger
+ (CKDTrafficLogger)shared;
- (CKDTrafficLogger)init;
- (void)finishRequestLogWithRequestUUID:(NSString *)a3 completionHandler:(id)a4;
- (void)logPartialRequestObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5;
- (void)logPartialResponseObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5;
- (void)logRequestBodyStreamResetWithRequestUUID:(NSString *)a3 completionHandler:(id)a4;
- (void)logRequestWithRequestUUID:(NSString *)a3 request:(NSURLRequest *)a4 url:(NSURL *)a5 method:(NSString *)a6 messageClass:(NSString *)a7 parsingStandaloneMessage:(BOOL)a8 completionHandler:(id)aBlock;
- (void)logResponseConfigurationWithRequestUUID:(NSString *)a3 format:(int64_t)a4 messageClass:(NSString *)a5 completionHandler:(id)a6;
- (void)logResponseWithRequestUUID:(NSString *)a3 response:(NSHTTPURLResponse *)a4 completionHandler:(id)a5;
@end

@implementation CKDTrafficLogger

+ (CKDTrafficLogger)shared
{
  v2 = (void *)static TrafficLogger.shared.getter();
  return (CKDTrafficLogger *)v2;
}

- (CKDTrafficLogger)init
{
  return (CKDTrafficLogger *)TrafficLogger.init()();
}

- (void)logRequestWithRequestUUID:(NSString *)a3 request:(NSURLRequest *)a4 url:(NSURL *)a5 method:(NSString *)a6 messageClass:(NSString *)a7 parsingStandaloneMessage:(BOOL)a8 completionHandler:(id)aBlock
{
  v16 = _Block_copy(aBlock);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = a7;
  *(unsigned char *)(v17 + 56) = a8;
  *(void *)(v17 + 64) = v16;
  *(void *)(v17 + 72) = self;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  swift_retain();
  sub_1C4D2EB24((uint64_t)&unk_1EA3CB958, v17);
}

- (void)logResponseWithRequestUUID:(NSString *)a3 response:(NSHTTPURLResponse *)a4 completionHandler:(id)a5
{
}

- (void)logPartialRequestObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5
{
}

- (void)logRequestBodyStreamResetWithRequestUUID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)logResponseConfigurationWithRequestUUID:(NSString *)a3 format:(int64_t)a4 messageClass:(NSString *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a5;
  swift_retain();
  sub_1C4D2EB24((uint64_t)&unk_1EA3CB918, (uint64_t)v11);
}

- (void)logPartialResponseObjectDataWithRequestUUID:(NSString *)a3 objectData:(NSData *)a4 completionHandler:(id)a5
{
}

- (void)finishRequestLogWithRequestUUID:(NSString *)a3 completionHandler:(id)a4
{
}

@end