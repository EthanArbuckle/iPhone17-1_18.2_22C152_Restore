@interface BCSDetectedCode
+ (id)detectedCodeWithBarcodeObservation:(id)a3;
+ (id)detectedCodeWithMachineReadableObject:(id)a3;
- (AVMetadataMachineReadableCodeObject)mrcObject;
- (BOOL)isLikelyEqualToCode:(id)a3;
- (VNBarcodeObservation)observation;
- (void)parseCodeWithCompletion:(id)a3;
@end

@implementation BCSDetectedCode

+ (id)detectedCodeWithMachineReadableObject:(id)a3
{
  v3 = (AVMetadataMachineReadableCodeObject *)a3;
  v4 = objc_alloc_init(BCSDetectedCode);
  mrcObject = v4->_mrcObject;
  v4->_mrcObject = v3;

  return v4;
}

+ (id)detectedCodeWithBarcodeObservation:(id)a3
{
  v3 = (VNBarcodeObservation *)a3;
  v4 = objc_alloc_init(BCSDetectedCode);
  observation = v4->_observation;
  v4->_observation = v3;

  return v4;
}

- (void)parseCodeWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _os_activity_create(&dword_223007000, "parseCodeWithCompletion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __43__BCSDetectedCode_parseCodeWithCompletion___block_invoke;
  v24 = &unk_26468ACA0;
  objc_copyWeak(&v26, &location);
  id v6 = v4;
  id v25 = v6;
  v7 = (void *)MEMORY[0x223CAD0D0](&v21);
  if (self->_mrcObject)
  {
    v8 = +[BCSQRCodeParser sharedParser];
    [v8 parseCodeFromMetadataMachineReadableCodeObject:self->_mrcObject completionHandler:v7];
  }
  else if (self->_observation)
  {
    v9 = &_os_log_internal;
    id v10 = &_os_log_internal;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = [(VNBarcodeObservation *)self->_observation symbology];
      *(_DWORD *)buf = 138412547;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSDetectedCode: (%@) did receive VNObservation with symbology %{private}@", buf, 0x16u);
    }
    v12 = [(VNBarcodeObservation *)self->_observation symbology];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    v13 = (id *)getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr;
    uint64_t v32 = getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr;
    if (!getVNBarcodeSymbologyAppClipCodeSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke;
      v34 = &unk_26468ACC8;
      v35 = &v29;
      __getVNBarcodeSymbologyAppClipCodeSymbolLoc_block_invoke((uint64_t)buf);
      v13 = (id *)v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v13)
    {
      v19 = [MEMORY[0x263F08690] currentHandler];
      v20 = [NSString stringWithUTF8String:"VNBarcodeSymbology getVNBarcodeSymbologyAppClipCode(void)"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"BCSDetectedCode.m", 23, @"%s", dlerror(), v21, v22, v23, v24);

      __break(1u);
    }
    id v14 = *v13;
    int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      v8 = [(VNBarcodeObservation *)self->_observation payloadDataValue];
      uint64_t v16 = [(VNBarcodeObservation *)self->_observation appClipCodeMetadataValue];
      v17 = (void *)v16;
      if (v8 && v16)
      {
        v18 = +[BCSAppClipCodeURLDecoder sharedDecoder];
        objc_msgSend(v18, "parseEncodedURLData:version:completion:", v8, objc_msgSend(v17, "unsignedIntValue"), v7);
      }
      else
      {
        v18 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSDetectedCodeErrorDomain" code:1 userInfo:0];
        (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v18);
      }
    }
    else
    {
      v8 = +[BCSQRCodeParser sharedParser];
      v17 = [(VNBarcodeObservation *)self->_observation payloadStringValue];
      [v8 parseCodeFromString:v17 completionHandler:v7];
    }
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"BCSDetectedCodeErrorDomain" code:1 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v8);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

void __43__BCSDetectedCode_parseCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v8 || v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v7 = v8;
      [v7 setDetectedCode:WeakRetained];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (BOOL)isLikelyEqualToCode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mrcObject];

  if (v5)
  {
    id v6 = [v4 mrcObject];
    id v7 = [(BCSDetectedCode *)self mrcObject];
    id v8 = [v7 basicDescriptor];
    char v9 = objc_msgSend(v6, "_bcs_probablyContainsSameCodeInBasicDescriptor:", v8);
  }
  else
  {
    id v10 = [v4 observation];

    if (!v10)
    {
      char v9 = 0;
      goto LABEL_6;
    }
    id v6 = [v4 observation];
    id v7 = [v6 payloadStringValue];
    id v8 = [(BCSDetectedCode *)self observation];
    v11 = [v8 payloadStringValue];
    char v9 = [v7 isEqualToString:v11];
  }
LABEL_6:

  return v9;
}

- (AVMetadataMachineReadableCodeObject)mrcObject
{
  return self->_mrcObject;
}

- (VNBarcodeObservation)observation
{
  return self->_observation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_mrcObject, 0);
}

@end