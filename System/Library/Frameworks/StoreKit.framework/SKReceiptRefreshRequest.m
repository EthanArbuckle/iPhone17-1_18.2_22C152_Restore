@interface SKReceiptRefreshRequest
- (BOOL)_wantsExpired;
- (BOOL)_wantsRevoked;
- (BOOL)_wantsVPP;
- (NSDictionary)receiptProperties;
- (SKReceiptRefreshRequest)initWithReceiptProperties:(NSDictionary *)properties;
- (void)_requestCompletedWithError:(id)a3;
- (void)_start;
@end

@implementation SKReceiptRefreshRequest

- (SKReceiptRefreshRequest)initWithReceiptProperties:(NSDictionary *)properties
{
  v4 = properties;
  v5 = [(SKRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [(NSDictionary *)v4 copy];
    v7 = v5->_properties;
    v5->_properties = (NSDictionary *)v6;
  }
  return v5;
}

- (void)_start
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SKReceiptRefreshRequest _wantsExpired](self, "_wantsExpired"));
  [v3 setValue:v4 forKey:@"expired"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SKReceiptRefreshRequest _wantsRevoked](self, "_wantsRevoked"));
  [v3 setValue:v5 forKey:@"revoked"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SKReceiptRefreshRequest _wantsVPP](self, "_wantsVPP"));
  [v3 setValue:v6 forKey:@"vpp"];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__SKReceiptRefreshRequest__start__block_invoke;
  aBlock[3] = &unk_1E5FAA460;
  objc_copyWeak(&v19, &location);
  v7 = _Block_copy(aBlock);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Starting receipt refresh request", buf, 0xCu);
  }
  v8 = +[SKServiceBroker defaultBroker];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__SKReceiptRefreshRequest__start__block_invoke_4;
  v16[3] = &unk_1E5FA9E30;
  id v9 = v7;
  id v17 = v9;
  v10 = [v8 storeKitServiceWithErrorHandler:v16];

  v11 = [(SKRequest *)self paymentQueueClient];
  v12 = [v11 plist];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__SKReceiptRefreshRequest__start__block_invoke_2_5;
  v14[3] = &unk_1E5FA9B90;
  id v13 = v9;
  id v15 = v13;
  [v10 renewReceiptWithOptions:v3 client:v12 replyBlock:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __33__SKReceiptRefreshRequest__start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SKReceiptRefreshRequest__start__block_invoke_2;
  v5[3] = &unk_1E5FAA438;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __33__SKReceiptRefreshRequest__start__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = (uint64_t *)(a1 + 32);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __33__SKReceiptRefreshRequest__start__block_invoke_2_cold_1((uint64_t)WeakRetained, v3);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Finished refreshing receipt", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained _requestCompletedWithError:*v3];
}

uint64_t __33__SKReceiptRefreshRequest__start__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __33__SKReceiptRefreshRequest__start__block_invoke_2_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestCompletedWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    int v5 = [v4 domain];
    if ([v5 isEqualToString:@"ASDErrorDomain"])
    {
      uint64_t v6 = [v14 code];

      if (v6 == 603)
      {

        goto LABEL_5;
      }
    }
    else
    {
    }
    v10 = [(SKRequest *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
LABEL_11:
      id v13 = v14;
      goto LABEL_13;
    }
    id v9 = [(SKRequest *)self delegate];
    v12 = _SKErrorFromNSError(v14);
    [v9 request:self didFailWithError:v12];

LABEL_10:
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v7 = [(SKRequest *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SKRequest *)self delegate];
    [v9 requestDidFinish:self];
    id v14 = 0;
    goto LABEL_10;
  }
  id v13 = 0;
LABEL_13:
}

- (BOOL)_wantsExpired
{
  v2 = [(NSDictionary *)self->_properties objectForKey:@"expired"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_wantsRevoked
{
  v2 = [(NSDictionary *)self->_properties objectForKey:@"revoked"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_wantsVPP
{
  v2 = [(NSDictionary *)self->_properties objectForKey:@"vpp"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSDictionary)receiptProperties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

void __33__SKReceiptRefreshRequest__start__block_invoke_2_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Finished refreshing receipt with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end