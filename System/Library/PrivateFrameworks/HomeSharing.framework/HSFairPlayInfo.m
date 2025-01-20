@interface HSFairPlayInfo
- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3;
- (HSFairPlayInfo)init;
- (NSString)deviceGUID;
- (id)_hexStringForData:(id)a3;
- (id)beginNegotiationWithSAPVersion:(unsigned int)a3;
- (id)continueNegotationWithSAPVersion:(unsigned int)a3 data:(id)a4 isComplete:(BOOL *)a5;
- (id)securityInfoForURL:(id)a3;
- (void)dealloc;
- (void)endSecuritySession;
@end

@implementation HSFairPlayInfo

- (void).cxx_destruct
{
}

- (id)_hexStringForData:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", 2 * objc_msgSend(v3, "length"));
  uint64_t v5 = [v3 length];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];
  if (v5)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v4, "appendFormat:", @"%02X", v9);
      --v5;
    }
    while (v5);
  }

  return v4;
}

- (BOOL)_getHardwareInfo:(FairPlayHWInfo_ *)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MGCopyAnswer();
  int HardwareInfoFromDeviceUDID = ICFairPlayGetHardwareInfoFromDeviceUDID();

  return HardwareInfoFromDeviceUDID == 0;
}

- (id)securityInfoForURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 absoluteString];
  id v6 = [v4 path];
  uint64_t v7 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "rangeOfString:", v6));

  v8 = [v7 dataUsingEncoding:4];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  v34 = 0;
  v34 = malloc_type_malloc(0x10uLL, 0x2DC8B3A9uLL);
  id v9 = v8;
  v10 = (const void *)[v9 bytes];
  CC_LONG v11 = [v9 length];
  CC_MD5(v10, v11, (unsigned __int8 *)v32[3]);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HSFairPlayInfo_securityInfoForURL___block_invoke;
  block[3] = &unk_264239F08;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v31;
  block[7] = &v27;
  block[8] = &v23;
  dispatch_sync(sapQueue, block);
  free((void *)v32[3]);
  if (*((_DWORD *)v20 + 6))
  {
    v13 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *((int *)v20 + 6);
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = v14;
      _os_log_impl(&dword_2152C7000, v13, OS_LOG_TYPE_ERROR, "FairPlaySAPEncrypt returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    [(HSFairPlayInfo *)self endSecuritySession];
    v15 = 0;
  }
  else
  {
    v16 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v28[3] length:*((unsigned int *)v24 + 6)];
    v15 = [(HSFairPlayInfo *)self _hexStringForData:v16];
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __37__HSFairPlayInfo_securityInfoForURL___block_invoke(void *a1)
{
  U4HBs(*(void *)(a1[4] + 24), *(void *)(*(void *)(a1[6] + 8) + 24), 16, *(void *)(a1[7] + 8) + 24, *(void *)(a1[8] + 8) + 24);
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v2;
}

- (void)endSecuritySession
{
  if (self->_session)
  {
    sapQueue = self->_sapQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__HSFairPlayInfo_endSecuritySession__block_invoke;
    block[3] = &unk_26423A410;
    block[4] = self;
    dispatch_sync(sapQueue, block);
  }
}

void __36__HSFairPlayInfo_endSecuritySession__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
}

- (id)continueNegotationWithSAPVersion:(unsigned int)a3 data:(id)a4 isComplete:(BOOL *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = -1;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HSFairPlayInfo_continueNegotationWithSAPVersion_data_isComplete___block_invoke;
  block[3] = &unk_264239EE0;
  unsigned int v22 = a3;
  v18 = &v23;
  block[4] = self;
  id v10 = v8;
  id v17 = v10;
  uint64_t v19 = &v35;
  v20 = &v31;
  uint64_t v21 = &v27;
  dispatch_sync(sapQueue, block);
  if (*((_DWORD *)v24 + 6))
  {
    CC_LONG v11 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *((int *)v24 + 6);
      *(_DWORD *)buf = 134217984;
      uint64_t v40 = v12;
      _os_log_impl(&dword_2152C7000, v11, OS_LOG_TYPE_ERROR, "FairPlaySAPExchange returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    [(HSFairPlayInfo *)self endSecuritySession];
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  if (*((unsigned char *)v28 + 24) != 1)
  {
    if (a5 && !*((unsigned char *)v28 + 24)) {
      *a5 = 1;
    }
    v15 = (void *)v36[3];
    if (v15) {
      free(v15);
    }
    goto LABEL_5;
  }
  v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v36[3] length:*((unsigned int *)v32 + 6)];
LABEL_6:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v13;
}

void __67__HSFairPlayInfo_continueNegotationWithSAPVersion_data_isComplete___block_invoke(uint64_t a1)
{
  Mib5yocT(*(unsigned int *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 24), [*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), *(void *)(*(void *)(a1 + 56) + 8) + 24, *(void *)(*(void *)(a1 + 64) + 8) + 24, *(void *)(*(void *)(a1 + 72) + 8) + 24);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2;
}

- (id)beginNegotiationWithSAPVersion:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = -1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  sapQueue = self->_sapQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HSFairPlayInfo_beginNegotiationWithSAPVersion___block_invoke;
  v9[3] = &unk_264239EB8;
  v9[4] = self;
  v9[5] = &v11;
  unsigned int v10 = a3;
  v9[6] = &v23;
  v9[7] = &v19;
  v9[8] = &v15;
  dispatch_sync(sapQueue, v9);
  if (*((_DWORD *)v12 + 6))
  {
    uint64_t v5 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *((int *)v12 + 6);
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v6;
      _os_log_impl(&dword_2152C7000, v5, OS_LOG_TYPE_ERROR, "FairPlaySAPExchange returned %ld, bailing on SAP setup", buf, 0xCu);
    }

    [(HSFairPlayInfo *)self endSecuritySession];
  }
  else if (*((unsigned char *)v16 + 24) == 1)
  {
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v24[3] length:*((unsigned int *)v20 + 6)];
    goto LABEL_8;
  }
  uint64_t v7 = 0;
LABEL_8:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v7;
}

void __49__HSFairPlayInfo_beginNegotiationWithSAPVersion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  cp2g1b9ro(*(void *)(a1 + 32) + 24, *(void *)(*(void *)(a1 + 32) + 16));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v3 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_2152C7000, v3, OS_LOG_TYPE_ERROR, "Error: Unable to create security session: %li", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    Mib5yocT(*(unsigned int *)(a1 + 72), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 24), 0, 0, *(void *)(*(void *)(a1 + 48) + 8) + 24, *(void *)(*(void *)(a1 + 56) + 8) + 24, *(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (NSString)deviceGUID
{
  int v2 = (void *)MGCopyAnswer();
  return (NSString *)v2;
}

- (void)dealloc
{
  sapQueue = self->_sapQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__HSFairPlayInfo_dealloc__block_invoke;
  block[3] = &unk_26423A410;
  block[4] = self;
  dispatch_sync(sapQueue, block);
  hwInfo = self->_hwInfo;
  if (hwInfo) {
    free(hwInfo);
  }
  v5.receiver = self;
  v5.super_class = (Class)HSFairPlayInfo;
  [(HSFairPlayInfo *)&v5 dealloc];
}

void __25__HSFairPlayInfo_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v1) {
    IPaI1oem5iL(v1);
  }
}

- (HSFairPlayInfo)init
{
  v10.receiver = self;
  v10.super_class = (Class)HSFairPlayInfo;
  int v2 = [(HSFairPlayInfo *)&v10 init];
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.fpsap", 0),
        sapQueue = v2->_sapQueue,
        v2->_sapQueue = (OS_dispatch_queue *)v3,
        sapQueue,
        objc_super v5 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL),
        v2->_hwInfo = v5,
        ![(HSFairPlayInfo *)v2 _getHardwareInfo:v5]))
  {
    uint64_t v7 = os_log_create("com.apple.amp.HomeSharing", "Connections");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_2152C7000, v7, OS_LOG_TYPE_ERROR, "Error: Unable to determine hardware identifier.", v9, 2u);
    }

    int v6 = 0;
  }
  else
  {
    int v6 = v2;
  }

  return v6;
}

@end