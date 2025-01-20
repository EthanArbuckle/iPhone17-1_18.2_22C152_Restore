@interface CCSControlCenterOperationService
+ (id)sharedService;
- (CCSControlCenterOperationServiceDelegate)delegate;
- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4;
- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4;
- (void)requestIconElementState:(id)a3 completionHandler:(id)a4;
- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CCSControlCenterOperationService

+ (id)sharedService
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CCSControlCenterOperationService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, block);
  }
  v2 = (void *)sharedService_instance;

  return v2;
}

uint64_t __49__CCSControlCenterOperationService_sharedService__block_invoke(uint64_t a1)
{
  sharedService_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained handleIconElementRequestWithOperationService:self iconElementRequest:v8 completionHandler:v7];
}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained handleControlCenterOperationTypeWithOperationService:self operationType:a3 completionHandler:v7];
}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained requestIconElementStateWithOperationService:self iconElementRequest:v8 completionHandler:v7];
}

- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained resetToDefaultLayoutWithCompletionHandler:v4];
}

- (CCSControlCenterOperationServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCSControlCenterOperationServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end