@interface PHAsset(CloudSupport)
- (void)isAssetLocalWithCompletion:()CloudSupport requiresDerivative:;
@end

@implementation PHAsset(CloudSupport)

- (void)isAssetLocalWithCompletion:()CloudSupport requiresDerivative:
{
  id v6 = a3;
  v7 = [MEMORY[0x263F14E38] defaultManager];
  if ([a1 mediaType] == 1)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F14DD0]);
    [v8 setNetworkAccessAllowed:0];
    [v8 setCanHandleAdjustmentData:&__block_literal_global_24];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_2;
    v19[3] = &unk_264C0B228;
    id v20 = v6;
    id v9 = v6;
    [a1 requestContentEditingInputWithOptions:v8 completionHandler:v19];
    v10 = v20;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F14F68]);
    [v11 setNetworkAccessAllowed:0];
    if (a4) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [v11 setDeliveryMode:v12];
    [v11 setVersion:0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__PHAsset_CloudSupport__isAssetLocalWithCompletion_requiresDerivative___block_invoke_3;
    v14[3] = &unk_264C0B250;
    char v18 = a4;
    v14[4] = a1;
    id v15 = v11;
    id v16 = v7;
    id v17 = v6;
    id v13 = v6;
    id v8 = v11;
    [v16 requestAVAssetForVideo:a1 options:v8 resultHandler:v14];

    v10 = v15;
  }
}

@end