@interface CATIDSServiceTransportSendMessageOperation
@end

@implementation CATIDSServiceTransportSendMessageOperation

void __53___CATIDSServiceTransportSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExecuting])
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 endOperationWithError:v3];
  }
}

uint64_t __51___CATIDSServiceTransportSendMessageOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendData];
}

void __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  v5 = v7;
  v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSendDataWithError:*(void *)(a1 + 32)];
}

@end