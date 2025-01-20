@interface CRKTransportInvalidator
+ (void)invalidateTransport:(id)a3;
+ (void)invalidateTransportOperationDidFinish:(id)a3;
@end

@implementation CRKTransportInvalidator

+ (void)invalidateTransport:(id)a3
{
  id v4 = a3;
  v6 = [[CRKInvalidateTransportOperation alloc] initWithTransport:v4];

  [(CRKInvalidateTransportOperation *)v6 addTarget:a1 selector:sel_invalidateTransportOperationDidFinish_ forOperationEvents:6];
  v5 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v5 addOperation:v6];
}

+ (void)invalidateTransportOperationDidFinish:(id)a3
{
  v3 = [a3 error];
  if (v3)
  {
    if (_CRKLogGeneral_onceToken_4 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_4, &__block_literal_global_19);
    }
    id v4 = (void *)_CRKLogGeneral_logObj_4;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_4, OS_LOG_TYPE_ERROR)) {
      +[CRKTransportInvalidator invalidateTransportOperationDidFinish:](v4, v3);
    }
  }
}

+ (void)invalidateTransportOperationDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 verboseDescription];
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Transport invalidator failed to invalidate transport: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end