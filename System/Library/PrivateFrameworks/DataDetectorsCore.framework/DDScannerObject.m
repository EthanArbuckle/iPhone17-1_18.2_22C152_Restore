@interface DDScannerObject
- (id)scanString:(uint64_t)a3 range:(uint64_t)a4 query:(void *)a5 configuration:(void *)a6 completionBlock:(void *)a7;
- (void)dealloc;
@end

@implementation DDScannerObject

- (id)scanString:(uint64_t)a3 range:(uint64_t)a4 query:(void *)a5 configuration:(void *)a6 completionBlock:(void *)a7
{
  v13 = a2;
  id v14 = a6;
  id v15 = a7;
  if (!a1)
  {
    id v38 = 0;
    goto LABEL_26;
  }
  int v16 = [v14 remoteScannerEnabled];
  if (!a5 && v16)
  {
    uint64_t v42 = a4;
    v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF03F7B8];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    [v17 setClasses:v20 forSelector:sel_scanString_range_configuration_withReply_ argumentIndex:0 ofReply:1];

    v21 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.internal.DataDetectorsRemoteScanner"];
    objc_storeStrong((id *)(a1 + 32), v21);
    [*(id *)(a1 + 32) setRemoteObjectInterface:v17];
    [*(id *)(a1 + 32) resume];
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    id v57 = (id)MEMORY[0x1E4F1CBF0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke;
    aBlock[3] = &unk_1E5984B78;
    BOOL v51 = v15 != 0;
    id v22 = v15;
    id v50 = v22;
    id v23 = v21;
    id v49 = v23;
    v24 = _Block_copy(aBlock);
    v25 = *(void **)(a1 + 32);
    if (v15) {
      [v25 remoteObjectProxyWithErrorHandler:v24];
    }
    else {
    v36 = [v25 synchronousRemoteObjectProxyWithErrorHandler:v24];
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke_2;
    v43[3] = &unk_1E5984BA0;
    BOOL v47 = v15 != 0;
    id v45 = v22;
    v46 = &v52;
    id v37 = v23;
    id v44 = v37;
    objc_msgSend(v36, "scanString:range:configuration:withReply:", v13, a3, v42, v14, v43);
    id v38 = (id)v53[5];

    _Block_object_dispose(&v52, 8);
    goto LABEL_26;
  }
  DDScannerSetOptions(*(void *)(a1 + 8), [v14 scannerOptions]);
  uint64_t v26 = *(void *)(a1 + 8);
  [v14 timeout];
  *(void *)(v26 + 224) = v27;
  uint64_t v28 = *(void *)(a1 + 8);
  CFArrayRef v29 = [v14 mockMLResults];
  DDScannerSetMockMLResults(v28, v29);

  v30 = *(void **)(a1 + 8);
  v31 = [v14 supportedMLResults];
  DDScannerSetMLSupportedTypes(v30, v31);

  uint64_t v32 = *(void *)(a1 + 8);
  int v33 = [v14 qos];
  if (DDScannerSetQOS_onceToken != -1) {
    dispatch_once(&DDScannerSetQOS_onceToken, &__block_literal_global_315);
  }
  if (!DDScannerSetQOS_inWebProcess) {
    *(_DWORD *)(v32 + 248) = v33;
  }
  uint64_t v34 = *(void *)(a1 + 8);
  *(_DWORD *)(v34 + 252) = [v14 script];
  uint64_t v35 = *(void *)(a1 + 8);
  if (v13)
  {
    if (!DDScannerScanStringWithRangeAndContextOffset(v35, v13, a3, a4, 0))
    {
LABEL_20:
      id v38 = (id)MEMORY[0x1E4F1CBF0];
      if (v15) {
        (*((void (**)(id, void))v15 + 2))(v15, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_26;
    }
  }
  else if (!DDScannerScanQuery(v35, a5))
  {
    goto LABEL_20;
  }
  CFArrayRef v39 = DDScannerCopyResultsWithOptions(*(void *)(a1 + 8), [v14 resultsOptions]);
  if (!v39) {
    goto LABEL_20;
  }
  id v38 = v39;
  if ([v14 noObjC])
  {
    if (v15) {
      (*((void (**)(id, id))v15 + 2))(v15, v38);
    }
  }
  else
  {
    uint64_t v40 = +[DDScannerResult resultsFromCoreResults:v38];
    CFRelease(v38);
    if (v15) {
      (*((void (**)(id, uint64_t))v15 + 2))(v15, v40);
    }
    id v38 = (id)v40;
  }
LABEL_26:

  return v38;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  scanner = self->_scanner;
  if (scanner) {
    CFRelease(scanner);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDScannerObject;
  [(DDScannerObject *)&v4 dealloc];
}

uint64_t __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  DDError(@"error getting remote handler: %@", a2);
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 invalidate];
}

void __72__DDScannerObject_scanString_range_query_configuration_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  [*(id *)(a1 + 32) invalidate];
}

@end