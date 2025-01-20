DYGTMTLDeviceProfile *newProfileWithMTLDevice(void *a1)
{
  id v1;
  DYGTMTLDeviceProfile *v2;
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  size_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  DYGTMTLDeviceProfile *v25;
  uint64_t vars8;

  v1 = a1;
  v2 = objc_alloc_init(DYGTMTLDeviceProfile);
  v3 = [v1 name];
  [(DYGTMTLDeviceProfile *)v2 setName:v3];

  v4 = [MEMORY[0x263EFF980] arrayWithCapacity:17];
  for (i = 0; i != 17; ++i)
  {
    v6 = newProfileWithMTLDevice_availableFeatures[i];
    if ([v1 supportsFeatureSet:v6])
    {
      v7 = [NSNumber numberWithUnsignedInteger:v6];
      [v4 addObject:v7];
    }
  }
  v8 = (void *)[v4 copy];
  v25 = v2;
  [(DYGTMTLDeviceProfile *)v2 setSupportedFeatureSets:v8];

  v9 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v1 areProgrammableSamplePositionsSupported]
    && [v1 maxCustomSamplePositions])
  {
    v10 = 1;
    do
    {
      if ([v1 supportsTextureSampleCount:v10])
      {
        v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
        [v1 getDefaultSamplePositions:v11 count:v10];
        v12 = objc_alloc_init(MEMORY[0x263EFF980]);
        v13 = 0;
        do
        {
          v14 = [MEMORY[0x263F08D40] valueWithPoint:vcvtq_f64_f32(*(float32x2_t *)&v11[8 * v13])];
          [v12 addObject:v14];

          ++v13;
        }
        while (v10 != v13);
        free(v11);
        v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v12];
        v16 = [NSNumber numberWithInt:v10];
        [v9 setObject:v15 forKey:v16];
      }
    }
    while ([v1 maxCustomSamplePositions] > v10++);
  }
  v18 = [NSDictionary dictionaryWithDictionary:v9];
  [(DYGTMTLDeviceProfile *)v25 setDefaultSamplePositions:v18];

  if (objc_opt_respondsToSelector())
  {
    v19 = [MEMORY[0x263EFF980] arrayWithCapacity:12];
    for (j = 0; j != 12; ++j)
    {
      v21 = newProfileWithMTLDevice_availableGPUFamilies[j];
      if ([v1 supportsFamily:v21])
      {
        v22 = [NSNumber numberWithInteger:v21];
        [v19 addObject:v22];
      }
    }
    v23 = (void *)[v19 copy];
    [(DYGTMTLDeviceProfile *)v25 setSupportedGPUFamilies:v23];
  }
  return v25;
}

id DaemonDeviceCapabilities(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = MTLCreateSystemDefaultDevice();
  v3 = newProfileWithMTLDevice(v2);

  v4 = (void *)MEMORY[0x263F086E0];
  v5 = [v1 stringByAppendingPathComponent:@"/System/Library/Frameworks/Metal.framework"];

  v6 = [v4 bundleWithPath:v5];

  if (v6)
  {
    v7 = (void *)*MEMORY[0x263EFFB70];
    v8 = [v6 objectForInfoDictionaryKey:*MEMORY[0x263EFFB70]];
  }
  else
  {
    v8 = &stru_26EFA73B8;
  }

  *(_OWORD *)values = xmmword_264E28808;
  long long v18 = *(_OWORD *)off_264E28818;
  v19 = @"main-screen-scale";
  CFArrayRef v9 = CFArrayCreate(0, (const void **)values, 5, MEMORY[0x263EFFF70]);
  v10 = (void *)MGCopyMultipleAnswers();
  CFRelease(v9);
  v14 = v3;
  v15[0] = @"gputools.contexts-info";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v16[0] = v11;
  v16[1] = v10;
  v15[1] = @"screen-dimensions";
  v15[2] = @"metal_version";
  v15[3] = @"nativePointerSize";
  v16[2] = v8;
  v16[3] = &unk_26EFB83F0;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v12;
}

void *GPUToolsVersionQuery()
{
  return &unk_26EFB8438;
}

id DaemonCreateGuestAppTransport(void *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_29;
  }
  v3 = [v1 objectForKeyedSubscript:@"environment"];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_28:

LABEL_29:
      v16 = 0;
      goto LABEL_30;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v45;
LABEL_6:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_27;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v6) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }
  id v4 = [v2 objectForKeyedSubscript:@"platformPrefix"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
  }
  v12 = [v2 objectForKeyedSubscript:@"shouldLoadCapture"];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
  }
  v13 = [v2 objectForKeyedSubscript:@"shouldLoadReplayer"];
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  v14 = [v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_25;
    }
  }

  v15 = [v2 objectForKeyedSubscript:@"environment"];
  v16 = v15;
  if (v15) {
    uint64_t v17 = [v15 mutableCopy];
  }
  else {
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  }
  v19 = (void *)v17;
  uint64_t v20 = [v16 objectForKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];
  v21 = [v20 componentsSeparatedByString:@":"];
  v22 = v21;
  if (v21) {
    uint64_t v23 = [v21 mutableCopy];
  }
  else {
    uint64_t v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  }
  v24 = (void *)v23;
  v25 = [v2 objectForKeyedSubscript:@"platformPrefix"];
  v26 = [v16 objectForKeyedSubscript:@"GPUTOOLS_EXTRA_PLUGIN_PATHS"];
  uint64_t v27 = [v2 objectForKeyedSubscript:@"shouldLoadReplayer"];
  if (!v27) {
    goto LABEL_39;
  }
  v28 = (void *)v27;
  [v2 objectForKeyedSubscript:@"shouldLoadCapture"];
  v43 = v24;
  v29 = v22;
  v30 = v19;
  v31 = v20;
  v32 = v26;
  v34 = v33 = v25;
  int v35 = [v34 BOOLValue];

  v25 = v33;
  v26 = v32;
  uint64_t v20 = v31;
  v19 = v30;
  v22 = v29;
  v24 = v43;

  if (v35)
  {
LABEL_39:
    v36 = [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsCapture.framework/GPUToolsCapture"];
    if (([v24 containsObject:v36] & 1) == 0) {
      [v24 addObject:v36];
    }
    [v19 setObject:v36 forKeyedSubscript:@"DYMTL_TOOLS_DYLIB_PATH"];
  }
  v37 = [v2 objectForKeyedSubscript:@"shouldLoadDiagnostics"];
  int v38 = [v37 BOOLValue];

  if (v38)
  {
    v39 = [@"/System/Library/PrivateFrameworks/" stringByAppendingPathComponent:@"GPUToolsDiagnostics.framework/GPUToolsDiagnostics"];
    if (([v24 containsObject:v39] & 1) == 0) {
      [v24 addObject:v39];
    }
  }
  uint64_t v40 = [v22 count];
  if (v40 != [v24 count])
  {
    v41 = [v24 componentsJoinedByString:@":"];
    [v19 setObject:v41 forKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];

    uint64_t v42 = [v19 copy];
    v16 = (void *)v42;
  }

LABEL_30:
  return v16;
}

void **GTTpacket_stream(void *a1)
{
  id v2 = (void **)malloc_type_calloc(1uLL, 0x28uLL, 0x1080040F9A837A9uLL);
  uint64_t v3 = objc_opt_new();
  id v4 = v2[2];
  v2[2] = (void *)v3;

  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a1];
  uint64_t v6 = *v2;
  *id v2 = (void *)v5;

  v2[1] = a1;
  return v2;
}

void GTTpacket_record(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [NSString stringWithUTF8String:a2];
    [v6 setSelector:v7];

    v9[0] = v5;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v6 setRequests:v8];

    objc_msgSend(v6, "setRequestID:", objc_msgSend(v5, "requestID"));
    [*(id *)a1 addObject:v6];
    if ((unint64_t)[*(id *)a1 count] > *(void *)(a1 + 8)) {
      [*(id *)a1 removeObjectAtIndex:0];
    }
  }
}

void GTTpacket_recordBatch(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    id v5 = a3;
    id v9 = (id)objc_opt_new();
    uint64_t v6 = [NSString stringWithUTF8String:a2];
    [v9 setSelector:v6];

    uint64_t v7 = [v5 requests];
    [v9 setRequests:v7];

    uint64_t v8 = [v5 requestID];
    [v9 setRequestID:v8];
    [*(id *)a1 addObject:v9];
    if ((unint64_t)[*(id *)a1 count] > *(void *)(a1 + 8)) {
      [*(id *)a1 removeObjectAtIndex:0];
    }
  }
}

dispatch_data_t GTTpacket_finish(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "setRequests:");
      [*(id *)(a1 + 16) addObject:*(void *)(a1 + 32)];
      id v2 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      uint64_t v3 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
    id v4 = (void *)MEMORY[0x263F08910];
    id v5 = (void *)[*(id *)a1 copy];
    id v16 = 0;
    uint64_t v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v16];
    id v7 = v16;

    if (v6)
    {
      id v8 = v6;
      id v9 = (const void *)[v8 bytes];
      size_t v10 = [v8 length];
      destructor[0] = MEMORY[0x263EF8330];
      destructor[1] = 3221225472;
      destructor[2] = __GTTpacket_finish_block_invoke;
      destructor[3] = &unk_264E28838;
      id v15 = v8;
      dispatch_data_t v11 = dispatch_data_create(v9, v10, 0, destructor);
      free((void *)a1);
      v12 = v15;
    }
    else
    {
      v12 = [v7 localizedDescription];
      NSLog(&cfstr_FailedToEncode.isa, v12);
      dispatch_data_t v11 = 0;
    }
  }
  else
  {
    dispatch_data_t v11 = 0;
  }
  return v11;
}

__CFString *GTTransportArchiveDirectory()
{
  v0 = [MEMORY[0x263F08AB0] processInfo];
  char v1 = [v0 isiOSAppOnMac];

  if (v1)
  {
    id v2 = @"/tmp/com.apple.GPUToolsAgent";
  }
  else
  {
    uint64_t v3 = [NSString stringWithUTF8String:getpwnam("mobile")->pw_dir];
    id v2 = [v3 stringByAppendingPathComponent:@"Library/GPUTools"];
  }
  return v2;
}

void GTPoint3DDecode(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = [v5 stringByAppendingString:@".x"];
  *a3 = [v6 decodeInt64ForKey:v7];

  id v8 = [v5 stringByAppendingString:@".y"];
  a3[1] = [v6 decodeInt64ForKey:v8];

  id v10 = [v5 stringByAppendingString:@".z"];

  uint64_t v9 = [v6 decodeInt64ForKey:v10];
  a3[2] = v9;
}

void GTPoint3DEncode(void *a1, uint64_t *a2, void *a3)
{
  uint64_t v5 = *a2;
  id v6 = a3;
  id v7 = a1;
  id v8 = [v6 stringByAppendingString:@".x"];
  [v7 encodeInt64:v5 forKey:v8];

  uint64_t v9 = a2[1];
  id v10 = [v6 stringByAppendingString:@".y"];
  [v7 encodeInt64:v9 forKey:v10];

  uint64_t v11 = a2[2];
  id v12 = [v6 stringByAppendingString:@".z"];

  [v7 encodeInt64:v11 forKey:v12];
}

uint64_t GTPoint2DDecode(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 stringByAppendingString:@".x"];
  uint64_t v6 = [v4 decodeInt64ForKey:v5];

  id v7 = [v3 stringByAppendingString:@".y"];

  [v4 decodeInt64ForKey:v7];
  return v6;
}

void GTPoint2DEncode(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v7 stringByAppendingString:@".x"];
  [v8 encodeInt64:a2 forKey:v9];

  id v10 = [v7 stringByAppendingString:@".y"];

  [v8 encodeInt64:a3 forKey:v10];
}

unint64_t GTDispatchUIDDecode(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 stringByAppendingString:@".dispatchIndex"];
  unsigned int v6 = [v4 decodeInt32ForKey:v5];

  id v7 = [v3 stringByAppendingString:@".dispatchICBIndex"];

  uint64_t v8 = [v4 decodeInt32ForKey:v7];
  return v6 | (unint64_t)(v8 << 32);
}

void GTDispatchUIDEncode(void *a1, unint64_t a2, void *a3)
{
  unint64_t v5 = HIDWORD(a2);
  id v6 = a3;
  id v7 = a1;
  uint64_t v8 = [v6 stringByAppendingString:@".dispatchIndex"];
  [v7 encodeInt32:a2 forKey:v8];

  id v9 = [v6 stringByAppendingString:@".dispatchICBIndex"];

  [v7 encodeInt32:v5 forKey:v9];
}

id GTBulkDataCompress(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = v5;
  switch(a2)
  {
    case 0:
      id v7 = v5;
      goto LABEL_8;
    case 1:
      uint64_t v8 = 0;
      goto LABEL_7;
    case 2:
      uint64_t v8 = 3;
      goto LABEL_7;
    case 3:
      uint64_t v8 = 1;
      goto LABEL_7;
    case 4:
      uint64_t v8 = 2;
LABEL_7:
      id v7 = [v5 compressedDataUsingAlgorithm:v8 error:a3];
LABEL_8:
      a3 = v7;
      break;
    default:
      break;
  }

  return a3;
}

id GTBulkDataDecompress(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = v5;
  switch(a2)
  {
    case 0:
      id v7 = v5;
      goto LABEL_8;
    case 1:
      uint64_t v8 = 0;
      goto LABEL_7;
    case 2:
      uint64_t v8 = 3;
      goto LABEL_7;
    case 3:
      uint64_t v8 = 1;
      goto LABEL_7;
    case 4:
      uint64_t v8 = 2;
LABEL_7:
      id v7 = [v5 decompressedDataUsingAlgorithm:v8 error:a3];
LABEL_8:
      a3 = v7;
      break;
    default:
      break;
  }

  return a3;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t GTTransportEnvironment_init()
{
  GT_TRANSPORT_ENV = GetEnvDefault("MTLTRANSPORT_REPLAY_MAX_RECORD_REQUEST", 64);
  qword_268A95A60 = qword_268A95A60 & 0xFFFFFFFFFFFFFFFELL | GetEnvDefault("MTLTRANSPORT_REPLAY_RECORD_REQUEST", 1) & 1;
  uint64_t result = GetEnvDefault("MTLTRANSPORT_LAUNCH_TIMEOUT", 30);
  qword_268A95A58 = result;
  return result;
}

uint64_t GetEnvDefault(const char *a1, uint64_t a2)
{
  id v3 = getenv(a1);
  if (!v3) {
    return a2;
  }
  return strtol(v3, 0, 0);
}

GTCaptureRequestToken *ProxyCaptureBatchRequest(void *a1, void *a2, void *a3, const char *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v28 = a1;
  id v7 = a2;
  id v8 = a3;
  uint64_t v27 = v7;
  uint64_t v9 = -[GTCaptureRequestToken initWithCaptureService:andTokenId:]([GTCaptureRequestToken alloc], "initWithCaptureService:andTokenId:", v7, [v7 nextRequestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  v26 = v9;
  xpc_dictionary_set_uint64(empty, "requestID", [(GTCaptureRequestToken *)v9 tokenId]);
  xpc_object_t v11 = xpc_array_create_empty();
  xpc_object_t v12 = xpc_array_create_empty();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v13 = [v8 requests];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        xpc_object_t v19 = xpc_uint64_create([v18 requestID]);
        xpc_array_append_value(v11, v19);

        xpc_object_t v20 = xpc_nsobject_create(v18);
        xpc_array_append_value(v12, v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v11);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v12);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = ___ZL24ProxyCaptureBatchRequestP19GTServiceConnectionPU30objcproto19GTMTLCaptureService11objc_objectP21GTCaptureRequestBatchPKc_block_invoke;
  v29[3] = &unk_264E289F8;
  id v30 = v8;
  v21 = v26;
  v31 = v21;
  id v22 = v8;
  [v28 sendMessage:empty replyHandler:v29];
  uint64_t v23 = v31;
  v24 = v21;

  return v24;
}

GTCaptureRequestBatch *DispatchCaptureBatchRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "requestID");
  id v6 = xpc_dictionary_get_array(v4, "_batch_requestIDs");
  id v7 = xpc_dictionary_get_array(v4, "_batch_requestObjs");
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:xpc_array_get_count(v6)];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke;
  applier[3] = &unk_264E28A20;
  id v21 = v7;
  id v22 = v8;
  id v9 = v8;
  id v10 = v7;
  xpc_array_apply(v6, applier);
  xpc_object_t v11 = [[GTCaptureRequestBatch alloc] initWithRequestID:uint64];
  xpc_object_t v12 = (void *)[v9 copy];
  [(GTCaptureRequestBatch *)v11 setRequests:v12];

  v13 = gt_xpc_dictionary_create_reply(v4);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
  v17[3] = &unk_264E28A48;
  id v18 = v13;
  id v19 = v3;
  id v14 = v3;
  id v15 = v13;
  [(GTCaptureRequestBatch *)v11 setCompletionHandler:v17];

  return v11;
}

void ___ZL24ProxyCaptureBatchRequestP19GTServiceConnectionPU30objcproto19GTMTLCaptureService11objc_objectP21GTCaptureRequestBatchPKc_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v13)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v13, "response", v9);
  }
  else
  {
    nsobject_classes = objc_opt_new();
    [nsobject_classes setError:v5];
  }
  xpc_object_t v11 = [*(id *)(a1 + 32) completionHandler];

  if (v11)
  {
    xpc_object_t v12 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, void *))v12)[2](v12, nsobject_classes);
  }
  [*(id *)(a1 + 40) completed];
}

uint64_t ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  xpc_object_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  nsobject_classes = (GTCaptureRequestUnknown *)xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v11);
  if (!nsobject_classes) {
    nsobject_classes = [[GTCaptureRequestUnknown alloc] initWithRequestID:xpc_uint64_get_value(v5)];
  }
  [*(id *)(a1 + 40) setObject:nsobject_classes atIndexedSubscript:a2];

  return 1;
}

uint64_t ___ZL27DispatchCaptureBatchRequestPU26objcproto15GTXPCConnection11objc_objectPU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

void DeleteAllArchives(void *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v22 = v1;
  uint64_t v3 = [NSURL fileURLWithPath:v1];
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v21 = (void *)v3;
  id v5 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 errorHandler:0];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        xpc_object_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        xpc_object_t v12 = [v11 pathExtension];
        uint64_t v13 = [v12 caseInsensitiveCompare:@"gputrace"];

        if (!v13) {
          [v2 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v2;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        xpc_object_t v20 = [MEMORY[0x263F08850] defaultManager];
        [v20 removeItemAtURL:v19 error:0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
}

id LocalArchiveURLFromRemoteURL(void *a1)
{
  id v1 = (objc_class *)NSURL;
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = GTTransportArchiveDirectory();
  id v5 = (void *)[v3 initFileURLWithPath:v4 isDirectory:1];

  id v6 = NSURL;
  uint64_t v7 = [v5 path];
  uint64_t v8 = [v2 path];

  uint64_t v9 = [v7 stringByAppendingPathComponent:v8];
  uint64_t v10 = [v6 fileURLWithPath:v9 isDirectory:1];

  return v10;
}

id FindRemoteGTFileWriterService(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = allServicesForDeviceUDID(a1, a2);
  uint64_t v7 = filteredArrayByService(v6, (Protocol *)&unk_26EFBDE18);
  if ([v7 count] == 1)
  {
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v9 = filteredArrayByPID(v7, [v5 currentRemoteRelayPid]);
    uint64_t v8 = [v9 firstObject];
  }
  return v8;
}

uint64_t GTFileTransferCompressionAlgorithmToNSDataCompressionAlgorithm(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 3) {
    return 0;
  }
  else {
    return qword_23C081120[a1 - 2];
  }
}

uint64_t ProcessCompressionStream(compression_stream *a1, const uint8_t *a2, size_t a3, uint8_t *a4, size_t a5, uint64_t a6, void *a7)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v13 = a7;
  a1->src_ptr = a2;
  a1->src_size = a3;
  if (a3)
  {
    while (compression_stream_process(a1, 0) != COMPRESSION_STATUS_ERROR)
    {
      if (!a1->dst_size)
      {
        if (!v13[2](v13, a4, a5, a6)) {
          goto LABEL_10;
        }
        a1->dst_ptr = a4;
        a1->dst_size = a5;
      }
      if (!a1->src_size) {
        goto LABEL_7;
      }
    }
    if (!a6) {
      goto LABEL_11;
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = [NSString stringWithFormat:@"Compression failed: %@", @"Failed to process compression stream", *MEMORY[0x263F08320]];
    v19[0] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *(void *)a6 = [v14 errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v16];

LABEL_10:
    a6 = 0;
  }
  else
  {
LABEL_7:
    a6 = 1;
  }
LABEL_11:

  return a6;
}

uint64_t FinalizeCompressionStream(compression_stream *a1, uint8_t *a2, size_t a3, uint64_t a4, void *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = a5;
  compression_status v10 = compression_stream_process(a1, 1);
  if (v10 == COMPRESSION_STATUS_OK)
  {
    while (v9[2](v9, a2, a3, a4))
    {
      a1->dst_ptr = a2;
      a1->dst_size = a3;
      compression_status v10 = compression_stream_process(a1, 1);
      if (v10) {
        goto LABEL_4;
      }
    }
    goto LABEL_9;
  }
LABEL_4:
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    if (a4)
    {
      xpc_object_t v11 = (void *)MEMORY[0x263F087E8];
      xpc_object_t v12 = [NSString stringWithFormat:@"Compression failed: %@", @"Failed to finalize compression stream", *MEMORY[0x263F08320]];
      v16[0] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *(void *)a4 = [v11 errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v13];

LABEL_9:
      a4 = 0;
    }
  }
  else
  {
    if (!v9[2](v9, a2, a3 - a1->dst_size, a4)) {
      goto LABEL_9;
    }
    a1->dst_ptr = a2;
    a1->dst_size = a3;
    a4 = 1;
  }

  return a4;
}

uint64_t GTFileWriterTransferFileEntries(void *a1, void *a2, void *a3, id *a4, void *a5)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  v98 = (uint8_t *)malloc_type_malloc([v10 chunkSize], 0x73AD97B3uLL);
  id v84 = v9;
  id v85 = v8;
  id v83 = v10;
  v78 = v11;
  if ([v10 compressionAlgorithm])
  {
    id v12 = v8;
    id v94 = v9;
    id v13 = v10;
    id v92 = v11;
    id v79 = v12;
    if ([v12 count])
    {
      memset(&stream, 0, sizeof(stream));
      unint64_t v14 = [v13 compressionAlgorithm] - 1;
      if (v14 > 4) {
        compression_algorithm v15 = 0;
      }
      else {
        compression_algorithm v15 = dword_23C081140[v14];
      }
      v100 = v13;
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, v15) == COMPRESSION_STATUS_OK)
      {
        contexta = (uint8_t *)malloc_type_malloc([v13 chunkSize], 0xB778C515uLL);
        stream.src_size = 0;
        stream.dst_ptr = v98;
        stream.dst_size = [v13 chunkSize];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v77 = v12;
        uint64_t v91 = [v77 countByEnumeratingWithState:&v107 objects:v106 count:16];
        if (v91)
        {
          uint64_t v89 = *(void *)v108;
          id obja = (id)*MEMORY[0x263F08438];
          v82 = (__CFString *)*MEMORY[0x263F08320];
          while (2)
          {
            uint64_t v46 = 0;
            do
            {
              if (*(void *)v108 != v89) {
                objc_enumerationMutation(v77);
              }
              long long v47 = *(void **)(*((void *)&v107 + 1) + 8 * v46);
              v48 = (void *)MEMORY[0x23ECD9F60]();
              id v49 = objc_alloc(NSURL);
              v50 = [v47 path];
              v51 = (void *)[v49 initFileURLWithPath:v50 isDirectory:0 relativeToURL:v94];

              id v52 = v51;
              int v53 = open((const char *)[v52 fileSystemRepresentation], 0);
              if (v53 < 0)
              {
                v71 = (void *)MEMORY[0x263F087E8];
                uint64_t v72 = *__error();
                v104 = v82;
                v105 = @"Failed to open file for reading";
                v73 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                id v44 = [v71 errorWithDomain:obja code:v72 userInfo:v73];

                id v9 = v84;
                id v8 = v85;
                id v10 = v83;
                if (!v44) {
                  goto LABEL_77;
                }
                goto LABEL_79;
              }
              int v54 = v53;
              v55 = 0;
              unint64_t v56 = 0;
              while (2)
              {
                if (v56 >= [v47 fileSize])
                {
                  id v44 = v55;
                }
                else
                {
                  size_t v57 = [v47 fileSize] - v56;
                  if (v57 >= [v100 chunkSize]) {
                    size_t v57 = [v100 chunkSize];
                  }
                  v58 = contexta;
                  v59 = &contexta[v57];
                  while (v58 < v59)
                  {
                    ssize_t v60 = read(v54, v58, v59 - v58);
                    v58 += v60;
                    if (v60 < 0) {
                      goto LABEL_57;
                    }
                  }
                  if ((v57 & 0x8000000000000000) != 0)
                  {
LABEL_57:
                    v63 = (void *)MEMORY[0x263F087E8];
                    uint64_t v64 = *__error();
                    v102 = v82;
                    v103 = @"Failed to read from file";
                    v65 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
                    id v44 = [v63 errorWithDomain:obja code:v64 userInfo:v65];

                    break;
                  }
                  v56 += v57;
                  size_t v61 = [v100 chunkSize];
                  id v101 = v55;
                  char v62 = ProcessCompressionStream(&stream, contexta, v57, v98, v61, (uint64_t)&v101, v92);
                  id v44 = v101;

                  v55 = v44;
                  if (v62) {
                    continue;
                  }
                }
                break;
              }
              close(v54);

              if (v44)
              {

                id v9 = v84;
                id v8 = v85;
                id v10 = v83;
LABEL_79:
                if (a4)
                {
                  id v44 = v44;
                  uint64_t v42 = 0;
                  *a4 = v44;
                }
                else
                {
                  uint64_t v42 = 0;
                }
                goto LABEL_82;
              }
              ++v46;
              id v9 = v84;
              id v8 = v85;
              id v10 = v83;
            }
            while (v46 != v91);
            uint64_t v66 = [v77 countByEnumeratingWithState:&v107 objects:v106 count:16];
            uint64_t v91 = v66;
            if (v66) {
              continue;
            }
            break;
          }
        }

LABEL_77:
        uint64_t v42 = FinalizeCompressionStream(&stream, v98, [v100 chunkSize], (uint64_t)a4, v92);
        id v44 = 0;
LABEL_82:
        free(contexta);
        compression_stream_destroy(&stream);
        goto LABEL_83;
      }
      if (a4)
      {
        v43 = (void *)MEMORY[0x263F087E8];
        *(void *)&long long v107 = *MEMORY[0x263F08320];
        id v44 = [NSString stringWithFormat:@"Compression failed: %@", @"Failed to initialize compression stream"];
        v106[0] = v44;
        long long v45 = [NSDictionary dictionaryWithObjects:v106 forKeys:&v107 count:1];
        *a4 = [v43 errorWithDomain:@"com.apple.gputools.filestreamer" code:0 userInfo:v45];

        uint64_t v42 = 0;
LABEL_83:

        id v13 = v100;
        goto LABEL_84;
      }
      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v42 = 1;
    }
LABEL_84:

    v70 = v79;
    goto LABEL_85;
  }
  uint64_t v16 = v11;
  id v17 = v8;
  id v93 = v9;
  id v95 = v10;
  uint64_t v18 = v16;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v17;
  v76 = v18;
  uint64_t v90 = [obj countByEnumeratingWithState:&v107 objects:v106 count:16];
  if (v90)
  {
    uint64_t v99 = 0;
    uint64_t v88 = *(void *)v108;
    uint64_t v81 = *MEMORY[0x263F08438];
    v80 = (__CFString *)*MEMORY[0x263F08320];
LABEL_7:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v108 != v88) {
        objc_enumerationMutation(obj);
      }
      xpc_object_t v20 = *(void **)(*((void *)&v107 + 1) + 8 * v19);
      id v21 = (void *)MEMORY[0x23ECD9F60]();
      id v22 = objc_alloc(NSURL);
      long long v23 = [v20 path];
      long long v24 = (void *)[v22 initFileURLWithPath:v23 isDirectory:0 relativeToURL:v93];

      id v25 = v24;
      int v26 = open((const char *)[v25 fileSystemRepresentation], 0);
      if (v26 < 0)
      {
        v67 = (void *)MEMORY[0x263F087E8];
        uint64_t v68 = *__error();
        v105 = v80;
        stream.dst_ptr = (uint8_t *)@"Failed to open file for reading";
        v69 = [NSDictionary dictionaryWithObjects:&stream forKeys:&v105 count:1];
        uint64_t v37 = [v67 errorWithDomain:v81 code:v68 userInfo:v69];

        id v9 = v84;
        id v8 = v85;
        id v10 = v83;
        if (!v37) {
          goto LABEL_67;
        }
        goto LABEL_70;
      }
      int v27 = v26;
      context = v21;
      if (![v20 fileSize])
      {
        uint64_t v37 = 0;
        goto LABEL_29;
      }
      long long v28 = 0;
      unint64_t v29 = 0;
      while (2)
      {
        unint64_t v30 = [v20 fileSize] - v29;
        uint64_t v31 = [v95 chunkSize];
        if (v30 >= v31 - v99) {
          unint64_t v32 = v31 - v99;
        }
        else {
          unint64_t v32 = v30;
        }
        uint64_t v33 = &v98[v99];
        long long v34 = &v98[v99 + v32];
        while (v33 < v34)
        {
          ssize_t v35 = read(v27, v33, v34 - v33);
          v33 += v35;
          if (v35 < 0) {
            goto LABEL_27;
          }
        }
        if ((v32 & 0x8000000000000000) != 0)
        {
LABEL_27:
          int v38 = (void *)MEMORY[0x263F087E8];
          uint64_t v39 = *__error();
          v103 = v80;
          v104 = @"Failed to read from file";
          uint64_t v40 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
          uint64_t v37 = [v38 errorWithDomain:v81 code:v39 userInfo:v40];

          break;
        }
        if (v32 + v99 == [v95 chunkSize])
        {
          v102 = v28;
          int v36 = v76[2](v76, v98, v32 + v99, (id *)&v102);
          uint64_t v37 = v102;

          if (!v36)
          {
            v99 += v32;
            break;
          }
          uint64_t v99 = 0;
          long long v28 = v37;
        }
        else
        {
          v99 += v32;
          uint64_t v37 = v28;
        }
        v29 += v32;
        if (v29 < [v20 fileSize]) {
          continue;
        }
        break;
      }
LABEL_29:
      close(v27);

      if (v37)
      {

        id v9 = v84;
        id v8 = v85;
        id v10 = v83;
LABEL_70:
        if (a4)
        {
          uint64_t v37 = v37;
          uint64_t v42 = 0;
          *a4 = v37;
        }
        else
        {
          uint64_t v42 = 0;
        }
        goto LABEL_75;
      }
      if (++v19 == v90)
      {
        uint64_t v41 = [obj countByEnumeratingWithState:&v107 objects:v106 count:16];
        id v9 = v84;
        id v8 = v85;
        id v10 = v83;
        uint64_t v90 = v41;
        if (v41) {
          goto LABEL_7;
        }
        goto LABEL_65;
      }
    }
  }
  uint64_t v99 = 0;
LABEL_65:

LABEL_67:
  if (v99)
  {
    uint64_t v42 = v76[2](v76, v98, v99, a4);
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v42 = 1;
  }
LABEL_75:

  v70 = obj;
LABEL_85:

  free(v98);
  return v42;
}

BOOL GTFileTransferOptionsValidate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  BOOL v3 = v1 && [v1 chunkSize] && (unint64_t)objc_msgSend(v2, "compressionAlgorithm") < 6;

  return v3;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __NewFileEntriesForURL_block_invoke()
{
  return 1;
}

id GetPathRelativeToBase(void *a1, void *a2)
{
  id v12 = 0;
  uint64_t v3 = *MEMORY[0x263EFF5E0];
  id v4 = a2;
  [a1 getResourceValue:&v12 forKey:v3 error:0];
  id v5 = v12;
  id v6 = [v5 pathComponents];
  id v11 = 0;
  [v4 getResourceValue:&v11 forKey:v3 error:0];

  uint64_t v7 = [v11 pathComponents];
  id v8 = objc_msgSend(v6, "subarrayWithRange:", objc_msgSend(v7, "count"), objc_msgSend(v6, "count") - objc_msgSend(v7, "count"));

  id v9 = [NSString pathWithComponents:v8];

  return v9;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

BOOL IsServicePort(unint64_t a1)
{
  return a1 >> 30 == 0;
}

id MessagePathMerge(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  xpc_object_t empty = 0;
  if (v3 && v4)
  {
    xpc_object_t empty = xpc_array_create_empty();
    size_t count = xpc_array_get_count(v3);
    size_t v8 = xpc_array_get_count(v5);
    size_t v9 = count >= v8 ? v8 : count;
    if (v9)
    {
      for (size_t i = 0; i != v9; ++i)
      {
        uint64_t uint64 = xpc_array_get_uint64(v3, i);
        if (uint64 != xpc_array_get_uint64(v5, i)) {
          break;
        }
        xpc_object_t v12 = xpc_uint64_create(uint64);
        xpc_array_append_value(empty, v12);
      }
    }
  }

  return empty;
}

uint64_t MessagePathEndsWith(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v4 || !xpc_array_get_count(v4))
  {
LABEL_12:
    uint64_t v7 = 1;
    goto LABEL_13;
  }
  if (v3)
  {
    size_t count = xpc_array_get_count(v5);
    if (count <= xpc_array_get_count(v3))
    {
      if (xpc_array_get_count(v3))
      {
        size_t v8 = 0;
        uint64_t v9 = -1;
        while (v8 < xpc_array_get_count(v5))
        {
          size_t v10 = xpc_array_get_count(v3) + v9;
          size_t v11 = xpc_array_get_count(v5) + v9;
          uint64_t uint64 = xpc_array_get_uint64(v3, v10);
          if (uint64 != xpc_array_get_uint64(v5, v11)) {
            goto LABEL_5;
          }
          ++v8;
          --v9;
          uint64_t v7 = 1;
          if (v8 >= xpc_array_get_count(v3)) {
            goto LABEL_13;
          }
        }
      }
      goto LABEL_12;
    }
  }
LABEL_5:
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

BOOL MessageHasReply(void *a1)
{
  id v1 = a1;
  BOOL v2 = (xpc_dictionary_get_flag(v1, "_flags", 0) & 1) != 0 || xpc_dictionary_get_BOOL(v1, "_reply");

  return v2;
}

void MessageSetHasReply(void *a1)
{
  xpc_object_t xdict = a1;
  xpc_dictionary_set_flag(xdict, "_flags", 0);
  xpc_dictionary_set_BOOL(xdict, "_reply", 1);
}

BOOL MessageIsValid(void *a1, void *a2)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      id v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      id v6 = [NSString stringWithFormat:@"Encountered an XPC error: %@", @"Message is nil"];
      v25[0] = v6;
      uint64_t v7 = NSDictionary;
      size_t v8 = (void **)v25;
      uint64_t v9 = &v24;
      goto LABEL_8;
    }
LABEL_11:
    BOOL v16 = 0;
    goto LABEL_12;
  }
  if (MEMORY[0x23ECDA660](v3) == MEMORY[0x263EF8720])
  {
    if (a2)
    {
      size_t v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      xpc_object_t v12 = NSString;
      id v13 = [NSString stringWithUTF8String:xpc_error_string(v4)];
      unint64_t v14 = [v12 stringWithFormat:@"Encountered an XPC error: %@", v13];
      long long v23 = v14;
      compression_algorithm v15 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      *a2 = [v11 errorWithDomain:@"com.apple.gputools.transport" code:7 userInfo:v15];
    }
    goto LABEL_11;
  }
  if (MEMORY[0x23ECDA660](v4) != MEMORY[0x263EF8708])
  {
    if (a2)
    {
      id v5 = (void *)MEMORY[0x263F087E8];
      id v6 = [NSString stringWithFormat:@"Encountered an XPC error: %@", @"Unexpected XPC object type", *MEMORY[0x263F08320]];
      id v21 = v6;
      uint64_t v7 = NSDictionary;
      size_t v8 = &v21;
      uint64_t v9 = &v20;
LABEL_8:
      size_t v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
      *a2 = [v5 errorWithDomain:@"com.apple.gputools.transport" code:7 userInfo:v10];

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  nserror = (void *)xpc_dictionary_get_nserror(v4, "_error");
  uint64_t v19 = nserror;
  BOOL v16 = nserror == 0;
  if (a2 && nserror) {
    *a2 = nserror;
  }

LABEL_12:
  return v16;
}

BOOL MessageVisit(void *a1, const char *a2)
{
  id v3 = a1;
  BOOL v4 = xpc_dictionary_string_array_contains(v3, "_visited", (uint64_t)a2);
  if (!v4)
  {
    xpc_object_t v5 = xpc_string_create(a2);
    xpc_dictionary_array_push(v3, "_visited", v5);
  }
  return !v4;
}

GTTelemetryRequestToken *ProxyTelemetryBatchRequest(void *a1, void *a2, void *a3, const char *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v28 = a1;
  id v7 = a2;
  id v8 = a3;
  int v27 = v7;
  uint64_t v9 = -[GTTelemetryRequestToken initWithService:andTokenId:]([GTTelemetryRequestToken alloc], "initWithService:andTokenId:", v7, [v8 requestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  int v26 = v9;
  xpc_dictionary_set_uint64(empty, "requestID", [(GTTelemetryRequestToken *)v9 tokenId]);
  xpc_object_t v11 = xpc_array_create_empty();
  xpc_object_t v12 = xpc_array_create_empty();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = [v8 requests];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        xpc_object_t v19 = xpc_uint64_create([v18 requestID]);
        xpc_array_append_value(v11, v19);

        xpc_object_t v20 = xpc_nsobject_create(v18);
        xpc_array_append_value(v12, v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v11);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v12);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __ProxyTelemetryBatchRequest_block_invoke;
  v29[3] = &unk_264E28D70;
  id v30 = v8;
  id v21 = v26;
  uint64_t v31 = v21;
  id v22 = v8;
  [v28 sendMessage:empty replyHandler:v29];
  long long v23 = v31;
  uint64_t v24 = v21;

  return v24;
}

id DispatchTelemetryBatchRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "requestID");
  id v6 = xpc_dictionary_get_array(v4, "_batch_requestIDs");
  id v7 = xpc_dictionary_get_array(v4, "_batch_requestObjs");
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:xpc_array_get_count(v6)];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __DispatchTelemetryBatchRequest_block_invoke;
  applier[3] = &unk_264E28D98;
  id v21 = v7;
  id v22 = v8;
  id v9 = v8;
  id v10 = v7;
  xpc_array_apply(v6, applier);
  id v11 = [[GTTelemetryRequestBatch alloc] initNoRequestID];
  [v11 setRequestID:uint64];
  xpc_object_t v12 = (void *)[v9 copy];
  [v11 setRequests:v12];

  id v13 = gt_xpc_dictionary_create_reply(v4);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __DispatchTelemetryBatchRequest_block_invoke_2;
  v17[3] = &unk_264E28DC0;
  id v18 = v13;
  id v19 = v3;
  id v14 = v3;
  id v15 = v13;
  [v11 setCompletionHandler:v17];

  return v11;
}

void __ProxyTelemetryBatchRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v13)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v13, "response", v9);
  }
  else
  {
    nsobject_classes = objc_opt_new();
    [nsobject_classes setError:v5];
  }
  id v11 = [*(id *)(a1 + 32) completionHandler];

  if (v11)
  {
    xpc_object_t v12 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, void *))v12)[2](v12, nsobject_classes);
  }
  [*(id *)(a1 + 40) completed];
}

uint64_t __DispatchTelemetryBatchRequest_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  id nsobject_classes = (id)xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v10);
  if (!nsobject_classes)
  {
    id nsobject_classes = [[GTTelemetryRequestUnknown alloc] initNoRequestID];
    [nsobject_classes setRequestID:xpc_uint64_get_value(v5)];
  }
  [*(id *)(a1 + 40) setObject:nsobject_classes atIndexedSubscript:a2];

  return 1;
}

uint64_t __DispatchTelemetryBatchRequest_block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

uint64_t GTMTLDeviceCapabilitiesSize()
{
  return 0x20000;
}

void *GTMTLDeviceCapabilitiesQuery()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __GTMTLDeviceCapabilitiesQuery_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = &storage;
  if (GTMTLDeviceCapabilitiesQuery_onceToken != -1) {
    dispatch_once(&GTMTLDeviceCapabilitiesQuery_onceToken, block);
  }
  return &storage;
}

void __GTMTLDeviceCapabilitiesQuery_block_invoke(uint64_t a1)
{
  id v2 = MTLCreateSystemDefaultDevice();
  uint64_t v3 = *(void *)(a1 + 32);
  ++*(void *)(v3 + 1168);
  *(void *)(v3 + 520) = 4096;
  *(_OWORD *)(v3 + 528) = xmmword_23C081160;
  *(_OWORD *)(v3 + 544) = xmmword_23C081170;
  *(_OWORD *)(v3 + 560) = xmmword_23C081180;
  *(void *)(v3 + 576) = 0x8000;
  id v4 = [v2 name];
  strncpy((char *)v3, (const char *)[v4 UTF8String], 0x80uLL);

  id v5 = (char *)(*(void *)(a1 + 32) + 128);
  id v6 = [v2 familyName];
  strncpy(v5, (const char *)[v6 UTF8String], 0x80uLL);

  uint64_t v7 = (char *)(*(void *)(a1 + 32) + 256);
  id v8 = [v2 vendorName];
  strncpy(v7, (const char *)[v8 UTF8String], 0x80uLL);

  uint64_t v9 = (char *)(*(void *)(a1 + 32) + 384);
  id v10 = [v2 productName];
  strncpy(v9, (const char *)[v10 UTF8String], 0x80uLL);

  *(void *)(*(void *)(a1 + 32) + 512) = [v2 registryID];
  id v11 = [v2 targetDeviceArchitecture];
  int v12 = [v11 version];

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(v13 + 520);
  uint64_t v15 = v13 + 520 + v14;
  *(void *)&v47[0] = 0;
  mach_timebase_info((mach_timebase_info_t)v47);
  *(void *)uint64_t v15 = *(void *)&v47[0];
  uint64_t v16 = [v2 targetDeviceArchitecture];
  *(_DWORD *)(v15 + 40) = [v16 cpuType];

  id v17 = [v2 targetDeviceArchitecture];
  *(_DWORD *)(v15 + 44) = [v17 subType];

  *(unsigned char *)(v15 + 617) = [v2 requiresRaytracingEmulation];
  for (uint64_t i = 1001; i != 1017; ++i)
  {
    if ([v2 supportsFamily:i]) {
      *(void *)(v15 + 64) |= (1 << (i + 24));
    }
  }
  for (uint64_t j = 2002; j != 2018; ++j)
  {
    if ([v2 supportsFamily:j]) {
      *(void *)(v15 + 48) |= (1 << (j + 48));
    }
  }
  for (uint64_t k = 3001; k != 3017; ++k)
  {
    if ([v2 supportsFamily:k]) {
      *(void *)(v15 + 72) |= (1 << (k + 72));
    }
  }
  for (uint64_t m = 0; m != 16; ++m)
  {
    if ([v2 supportsFamily:m + 5001]) {
      *(void *)(v15 + 56) |= (1 << (m + 1));
    }
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty([v2 acceleratorPort], @"GPUConfigurationVariable", 0, 0);
  long long v23 = [CFProperty objectForKeyedSubscript:@"num_cores"];
  *(_DWORD *)(v15 + 80) = [v23 unsignedIntValue];

  uint64_t v24 = [CFProperty objectForKeyedSubscript:@"num_mgpus"];
  *(_DWORD *)(v15 + 84) = [v24 unsignedIntValue];

  id v25 = [CFProperty objectForKeyedSubscript:@"num_gps"];
  *(_DWORD *)(v15 + 88) = [v25 unsignedIntValue];

  int v26 = [CFProperty objectForKeyedSubscript:@"num_frags"];
  *(_DWORD *)(v15 + 92) = [v26 unsignedIntValue];

  int v27 = [CFProperty objectForKeyedSubscript:@"omu_eval_window"];

  if (v27)
  {
    id v28 = [CFProperty objectForKeyedSubscript:@"omu_eval_window"];
    *(_DWORD *)(v15 + 96) = [v28 unsignedIntValue];
  }
  else
  {
    *(_DWORD *)(v15 + 96) = 2048;
  }
  unint64_t v29 = [CFProperty objectForKeyedSubscript:@"core_mask_list"];
  unint64_t v30 = 0;
  uint64_t v31 = v14 + v13 + 624;
  do
  {
    if ([v29 count] <= v30)
    {
      *(void *)(v31 + 8 * v30) = 0;
    }
    else
    {
      long long v32 = [v29 objectAtIndexedSubscript:v30];
      *(void *)(v31 + 8 * v30) = [v32 unsignedLongLongValue];
    }
    ++v30;
  }
  while (v30 != 64);
  long long v33 = [v2 targetDeviceArchitecture];
  *(_DWORD *)(v15 + 12) = [v33 versionCombined];

  long long v34 = [v2 targetDeviceArchitecture];
  *(void *)(v15 + 16) = [v34 driverVersion];

  *(void *)(v15 + 24) = [v2 sharedMemorySize];
  *(void *)(v15 + 32) = [v2 dedicatedMemorySize];
  *(_DWORD *)(v15 + 8) = v12;

  uint64_t v35 = 0;
  uint64_t v36 = *(void *)(a1 + 32) + 536 + *(void *)(*(void *)(a1 + 32) + 536);
  do
  {
    uint64_t v48 = 0;
    memset(v47, 0, sizeof(v47));
    MTLPixelFormatGetInfoForDevice();
    if (BYTE8(v47[0])) {
      *(unsigned char *)(v36 + v35) = 1;
    }
    ++v35;
  }
  while (v35 != 4096);
  uint64_t v37 = *(void *)(a1 + 32) + 544 + *(void *)(*(void *)(a1 + 32) + 544);
  *(unsigned char *)(v37 + 4) = [v2 isFloat32FilteringSupported];
  *(unsigned char *)(v37 + 5) = [v2 isMsaa32bSupported];
  *(_DWORD *)uint64_t v37 = [v2 readWriteTextureSupport];
  int v38 = (unsigned char *)(*(void *)(a1 + 32) + 552 + *(void *)(*(void *)(a1 + 32) + 552));
  v38[4] = [v2 isAnisoSampleFixSupported];
  v38[5] = [v2 isClampToHalfBorderSupported];
  v38[6] = [v2 isCustomBorderColorSupported];
  if ([v2 areProgrammableSamplePositionsSupported])
  {
    if ([v2 supportsTextureSampleCount:1])
    {
      uint64_t v39 = v38 + 8;
      uint64_t v40 = v2;
      uint64_t v41 = 1;
    }
    else if ([v2 supportsTextureSampleCount:2])
    {
      uint64_t v39 = v38 + 16;
      uint64_t v40 = v2;
      uint64_t v41 = 2;
    }
    else if ([v2 supportsTextureSampleCount:4])
    {
      uint64_t v39 = v38 + 32;
      uint64_t v40 = v2;
      uint64_t v41 = 4;
    }
    else if ([v2 supportsTextureSampleCount:8])
    {
      uint64_t v39 = v38 + 64;
      uint64_t v40 = v2;
      uint64_t v41 = 8;
    }
    else if ([v2 supportsTextureSampleCount:16])
    {
      uint64_t v39 = v38 + 128;
      uint64_t v40 = v2;
      uint64_t v41 = 16;
    }
    else
    {
      if (![v2 supportsTextureSampleCount:32]) {
        goto LABEL_43;
      }
      uint64_t v39 = v38 + 256;
      uint64_t v40 = v2;
      uint64_t v41 = 32;
    }
    [v40 getDefaultSamplePositions:v39 count:v41];
    ++v38[7];
  }
LABEL_43:
  uint64_t v42 = *(void *)(a1 + 32) + 560 + *(void *)(*(void *)(a1 + 32) + 560);
  *(unsigned char *)(v42 + 12) = [v2 isRTZRoundingSupported];
  *(_DWORD *)uint64_t v42 = [v2 doubleFPConfig];
  *(_DWORD *)(v42 + 4) = [v2 halfFPConfig];
  *(_DWORD *)(v42 + 8) = [v2 singleFPConfig];
  v43 = (void *)(*(void *)(a1 + 32) + 568 + *(void *)(*(void *)(a1 + 32) + 568));
  void *v43 = [v2 maxFramebufferStorageBits];
  v43[1] = [v2 linearTextureArrayAlignmentBytes];
  v43[2] = [v2 linearTextureArrayAlignmentSlice];
  v43[3] = [v2 maxTileBuffers];
  v43[4] = [v2 maxTileTextures];
  v43[5] = [v2 maxTileSamplers];
  v43[6] = [v2 maxTileInlineDataSize];
  v43[7] = [v2 minTilePixels];
  v43[8] = [v2 maxColorAttachments];
  v43[9] = [v2 maxVertexAttributes];
  v43[10] = [v2 maxVertexBuffers];
  v43[11] = [v2 maxVertexTextures];
  v43[12] = [v2 maxVertexSamplers];
  v43[13] = [v2 maxVertexInlineDataSize];
  v43[14] = [v2 maxInterpolants];
  v43[15] = [v2 maxFragmentBuffers];
  v43[16] = [v2 maxFragmentTextures];
  v43[17] = [v2 maxFragmentSamplers];
  v43[18] = [v2 maxFragmentInlineDataSize];
  v43[19] = [v2 maxComputeBuffers];
  v43[20] = [v2 maxComputeTextures];
  v43[21] = [v2 maxComputeSamplers];
  v43[22] = [v2 maxComputeInlineDataSize];
  v43[23] = [v2 maxComputeLocalMemorySizes];
  v43[24] = [v2 maxTotalComputeThreadsPerThreadgroup];
  v43[25] = [v2 maxComputeThreadgroupMemory];
  [v2 maxLineWidth];
  v43[26] = (unint64_t)v44;
  [v2 maxPointSize];
  v43[27] = (unint64_t)v45;
  v43[28] = [v2 maxVisibilityQueryOffset];
  v43[29] = [v2 maxBufferLength];
  v43[30] = [v2 minConstantBufferAlignmentBytes];
  v43[31] = [v2 minBufferNoCopyAlignmentBytes];
  v43[32] = [v2 maxTextureWidth1D];
  v43[33] = [v2 maxTextureWidth2D];
  v43[34] = [v2 maxTextureHeight2D];
  v43[35] = [v2 maxTextureWidth3D];
  v43[36] = [v2 maxTextureHeight3D];
  v43[37] = [v2 maxTextureDepth3D];
  v43[38] = [v2 maxTextureDimensionCube];
  v43[39] = [v2 maxTextureLayers];
  v43[40] = [v2 linearTextureAlignmentBytes];
  v43[41] = [v2 iosurfaceTextureAlignmentBytes];
  v43[42] = [v2 iosurfaceReadOnlyTextureAlignmentBytes];
  v43[43] = [v2 deviceLinearTextureAlignmentBytes];
  v43[44] = [v2 deviceLinearReadOnlyTextureAlignmentBytes];
  v43[45] = [v2 maxFunctionConstantIndices];
  v43[46] = [v2 maxComputeThreadgroupMemoryAlignmentBytes];
  v43[47] = [v2 maxInterpolatedComponents];
  v43[48] = [v2 maxTessellationFactor];
  v43[49] = [v2 maxIndirectBuffers];
  v43[50] = [v2 maxIndirectTextures];
  v43[51] = [v2 maxIndirectSamplers];
  v43[52] = [v2 maxIndirectSamplersPerDevice];
  v43[53] = [v2 maxFenceInstances];
  v43[54] = [v2 maxViewportCount];
  v43[55] = [v2 maxCustomSamplePositions];
  v43[56] = [v2 maxVertexAmplificationFactor];
  v43[57] = [v2 maxVertexAmplificationCount];
  v43[58] = [v2 maxTextureBufferWidth];
  v43[59] = [v2 maxComputeAttributes];
  v43[60] = [v2 maxIOCommandsInFlight];
  v43[61] = [v2 maxPredicatedNestingDepth];
  v43[62] = [v2 maxConstantBufferArguments];
  v43[63] = [v2 maximumComputeSubstreams];
  if (objc_opt_respondsToSelector()) {
    v43[64] = [v2 maxAccelerationStructureLevels];
  }
  uint64_t v46 = *(void *)(a1 + 32) + 576 + *(void *)(*(void *)(a1 + 32) + 576);
  *(_DWORD *)uint64_t v46 = [v2 argumentBuffersSupport];
  *(unsigned char *)(v46 + 4) = [v2 supportsTLS];
  *(unsigned char *)(v46 + 5) = [v2 supportsGlobalVariableRelocation];
  *(unsigned char *)(v46 + 6) = [v2 supportsGlobalVariableRelocationCompute];
  *(unsigned char *)(v46 + 7) = [v2 supportsGlobalVariableRelocationRender];
  *(unsigned char *)(v46 + 8) = [v2 supportsDynamicLibraries];
  *(unsigned char *)(v46 + 9) = [v2 supportsRenderDynamicLibraries];
  *(unsigned char *)(v46 + 10) = [v2 supportsFunctionPointers];
  *(unsigned char *)(v46 + 11) = [v2 supportsFunctionPointersFromRender];
  *(unsigned char *)(v46 + 12) = [v2 areProgrammableSamplePositionsSupported];
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(v46 + 13) = [v2 supportsGlobalVariableBindings];
  }
}

const char *GTDeviceCapabilities_fromDevice(void *a1)
{
  id v1 = a1;
  GTMTLDeviceCapabilitiesQuery();
  if (qword_268A95F10)
  {
    unint64_t v2 = 0;
    uint64_t v3 = (const char *)&storage;
    while (1)
    {
      id v4 = [v1 name];
      int v5 = strncmp(v3, (const char *)[v4 UTF8String], 0x80uLL);

      if (!v5) {
        break;
      }
      ++v2;
      v3 += 584;
      if (qword_268A95F10 <= v2) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL GTDeviceCapabilities_isAGX(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 520 + *(void *)(a1 + 520) + 40) - 16777235;
  return (v1 & 7) == 0 && v1 < 3;
}

BOOL GTDeviceCapabilities_isAGX1(uint64_t a1)
{
  uint64_t v1 = a1 + 520 + *(void *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 1;
}

BOOL GTDeviceCapabilities_isAGX2(uint64_t a1)
{
  uint64_t v1 = a1 + 520 + *(void *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 2;
}

BOOL GTDeviceCapabilities_isAGX3(uint64_t a1)
{
  uint64_t v1 = a1 + 520 + *(void *)(a1 + 520);
  return *(_DWORD *)(v1 + 40) == 16777235 && (*(_DWORD *)(v1 + 44) & 0xF) == 3;
}

GTReplayRequestToken *ProxyReplayerBatchRequest(void *a1, void *a2, void *a3, const char *a4, void *a5, uint64_t a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v34 = a1;
  id v10 = a2;
  id v11 = a3;
  id v31 = a5;
  long long v33 = v10;
  int v12 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", v10, [v11 requestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", a4);
  xpc_dictionary_set_flag(empty, "_flags", 2);
  unint64_t v30 = v12;
  xpc_dictionary_set_uint64(empty, "requestID", [(GTReplayRequestToken *)v12 tokenId]);
  xpc_dictionary_set_flag(empty, "flags", 0);
  xpc_object_t v14 = xpc_array_create_empty();
  xpc_object_t v15 = xpc_array_create_empty();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v16 = [v11 requests];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        xpc_object_t v22 = xpc_uint64_create([v21 requestID]);
        xpc_array_append_value(v14, v22);

        xpc_object_t v23 = xpc_nsobject_create(v21);
        xpc_array_append_value(v15, v23);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v18);
  }

  xpc_dictionary_set_value(empty, "_batch_requestIDs", v14);
  xpc_dictionary_set_value(empty, "_batch_requestObjs", v15);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __ProxyReplayerBatchRequest_block_invoke;
  v35[3] = &unk_264E29080;
  id v36 = v11;
  uint64_t v24 = v30;
  uint64_t v37 = v24;
  id v38 = v31;
  uint64_t v39 = a6;
  id v25 = v31;
  id v26 = v11;
  [v34 sendMessage:empty replyHandler:v35];
  int v27 = v38;
  id v28 = v24;

  return v28;
}

id DispatchReplayerBatchRequest(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  id v10 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v10, "requestID");
  char flag = xpc_dictionary_get_flag(v10, "flags", 0);
  uint64_t v13 = xpc_dictionary_get_array(v10, "_batch_requestIDs");
  xpc_object_t v14 = xpc_dictionary_get_array(v10, "_batch_requestObjs");
  xpc_object_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:xpc_array_get_count(v13)];
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __DispatchReplayerBatchRequest_block_invoke;
  applier[3] = &unk_264E290A8;
  id v33 = v15;
  id v34 = v9;
  id v32 = v14;
  id v16 = v15;
  id v17 = v9;
  id v18 = v14;
  xpc_array_apply(v13, applier);
  id v19 = [[GTReplayRequestBatch alloc] initNoRequestID];
  [v19 setRequestID:uint64];
  xpc_object_t v20 = (void *)[v16 copy];
  [v19 setRequests:v20];

  id v21 = gt_xpc_dictionary_create_reply(v10);

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __DispatchReplayerBatchRequest_block_invoke_2;
  v26[3] = &unk_264E290D0;
  char v30 = flag;
  id v27 = v8;
  id v28 = v21;
  id v29 = v7;
  id v22 = v7;
  id v23 = v21;
  id v24 = v8;
  [v19 setCompletionHandler:v26];

  return v19;
}

void __ProxyReplayerBatchRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
    id nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v5, "response", v10);
    int v12 = [nsobject_classes error];

    if (v12 || (uint64_t uint64 = xpc_dictionary_get_uint64(v5, "bulkDataHandle")) == 0)
    {
      uint64_t v13 = [*(id *)(a1 + 32) completionHandler];

      if (v13)
      {
        xpc_object_t v14 = [*(id *)(a1 + 32) completionHandler];
        ((void (**)(void, void *))v14)[2](v14, nsobject_classes);
      }
      [*(id *)(a1 + 40) completed];
    }
    else
    {
      uint64_t v18 = uint64;
      id v19 = [*(id *)(a1 + 48) transferOptions];
      [v19 setCompressionAlgorithm:*(void *)(a1 + 56)];
      xpc_object_t v20 = *(void **)(a1 + 48);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __ProxyReplayerBatchRequest_block_invoke_2;
      v21[3] = &unk_264E29058;
      id v22 = nsobject_classes;
      id v23 = *(id *)(a1 + 32);
      id v24 = *(id *)(a1 + 40);
      [v20 downloadData:v18 usingTransferOptions:v19 completionHandler:v21];
    }
  }
  else
  {
    id v10 = objc_opt_new();
    [v10 setError:v6];
    xpc_object_t v15 = [*(id *)(a1 + 32) completionHandler];

    if (v15)
    {
      id v16 = [*(id *)(a1 + 32) completionHandler];
      ((void (**)(void, void *))v16)[2](v16, v10);
    }
    [*(id *)(a1 + 40) completed];
  }
}

void __ProxyReplayerBatchRequest_block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [a1[4] setData:a2];
  if (!a2) {
    [a1[4] setError:v7];
  }
  id v5 = [a1[5] completionHandler];

  if (v5)
  {
    id v6 = [a1[5] completionHandler];
    ((void (**)(void, id))v6)[2](v6, a1[4]);
  }
  [a1[6] completed];
}

uint64_t __DispatchReplayerBatchRequest_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  xpc_object_t xuint = a3;
  id v33 = (void *)MEMORY[0x263EFFA08];
  uint64_t v32 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v32, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v3, v4, v5, v6, v7, v8,
    v9,
    v10,
    v11,
    v12,
    objc_opt_class(),
  uint64_t v13 = 0);
  uint64_t nsobject_classes = xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v13);
  if (nsobject_classes)
  {
    id v15 = (id)nsobject_classes;
    id v16 = xuint;
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
    }
  }
  else
  {
    id v15 = [[GTReplayRequestUnknown alloc] initNoRequestID];
    id v16 = xuint;
    [v15 setRequestID:xpc_uint64_get_value(xuint)];
  }
  [*(id *)(a1 + 40) setObject:v15 atIndexedSubscript:a2];

  return 1;
}

void __DispatchReplayerBatchRequest_block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v6 data];
    uint64_t v5 = [v3 handoverDataForDownload:v4];

    [v6 setData:0];
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "bulkDataHandle", v5);
  }
  xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "response", (uint64_t)v6);
  [*(id *)(a1 + 48) sendMessage:*(void *)(a1 + 40)];
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id allServices(void *a1)
{
  return allServicesForDevice(a1, 0);
}

id allServicesForDevice(void *a1, void *a2)
{
  id v3 = a1;
  if (a2)
  {
    a2 = [a2 uniqueDeviceID];
  }
  uint64_t v4 = allServicesForDeviceUDID(v3, a2);

  return v4;
}

id allServicesForDeviceUDID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", "allServices");
  if (v4) {
    xpc_dictionary_set_string(empty, "_device_dest", (const char *)[v4 UTF8String]);
  }
  MessageSetHasReply(empty);
  uint64_t v10 = 0;
  id v6 = [v3 sendMessageWithReplySync:empty error:&v10];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    [v3 setError:0];
    nsarray = 0;
  }

  return nsarray;
}

id filteredArrayByService(void *a1, Protocol *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = NSStringFromProtocol(a2);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "serviceProperties", (void)v17);
        uint64_t v13 = [v12 protocolName];
        int v14 = [v13 isEqualToString:v4];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = (void *)[v5 copy];
  return v15;
}

id filteredArrayByPID(void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "processInfo", (void)v14);
        if ([v11 processIdentifier] == a2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

id filteredArrayByPort(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "serviceProperties", (void)v14);
        if ([v11 servicePort] == a2) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

id newSetWithArrayMinusArray(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF9C0];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = (void *)[[v3 alloc] initWithArray:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
  [v6 minusSet:v7];

  uint64_t v8 = (void *)[v6 copy];
  return v8;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x263F08910];
    uint64_t v8 = 0;
    id v6 = a1;
    id v7 = [v5 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
    xpc_dictionary_set_data(v6, a2, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  if (a3)
  {
    id v5 = a3;
    xpc_object_t xdict = a1;
    id v6 = (const void *)[v5 bytes];
    size_t v7 = [v5 length];

    xpc_dictionary_set_data(xdict, a2, v6, v7);
  }
}

const void *xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  size_t length = 0;
  uint64_t result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytes:v3 length:length];
  }
  return result;
}

const void *xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  size_t length = 0;
  uint64_t result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytesNoCopy:v3 length:length freeWhenDone:0];
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy) {
    goto LABEL_5;
  }
  uint64_t v7 = 0;
  id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:nsdata_nocopy error:&v7];
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    id v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsobject_any(void *a1, const char *a2)
{
  unint64_t v2 = (objc_class *)MEMORY[0x263EFFA08];
  id v3 = a1;
  id v4 = [v2 alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t nsobject_classes = xpc_dictionary_get_nsobject_classes(v3, a2, v13);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v7 = 0;
    uint64_t v5 = [MEMORY[0x263F08928] unarchivedArrayOfObjectsOfClass:a3 fromData:nsdata_nocopy error:&v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedDictionaryWithKeysOfClass:a3 objectsOfClass:a4 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = nsobject_any;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

const char *xpc_error_string(void *a1)
{
  uint64_t result = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  if (!result) {
    return "Unknown";
  }
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  xpc_object_t xdict = a1;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));
}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  xpc_object_t value = a3;
  id v5 = a1;
  xpc_object_t empty = xpc_dictionary_get_array(v5, a2);
  if (!empty) {
    xpc_object_t empty = xpc_array_create_empty();
  }
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = xpc_dictionary_get_array(a1, a2);
  id v5 = (void *)v4;
  if (v4 && MEMORY[0x23ECDA660](v4) == MEMORY[0x263EF86D8])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __xpc_dictionary_string_array_contains_block_invoke;
    v8[3] = &unk_264E29178;
    v8[4] = &v9;
    v8[5] = a3;
    xpc_array_apply(v5, v8);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __xpc_dictionary_string_array_contains_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1;
  }
  int v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  uint64_t result = 1;
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

const void *xpc_array_get_nsdata_nocopy(void *a1, size_t a2)
{
  size_t length = 0;
  uint64_t result = xpc_array_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytesNoCopy:v3 length:length freeWhenDone:0];
  }
  return result;
}

uint64_t xpc_array_get_nsobject_classes(void *a1, size_t a2, void *a3)
{
  id v5 = a3;
  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

xpc_object_t xpc_nsobject_create(void *a1)
{
  if (a1)
  {
    uint64_t v4 = 0;
    a1 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v4];
  }
  id v1 = a1;
  xpc_object_t v2 = xpc_data_create((const void *)[v1 bytes], objc_msgSend(v1, "length"));

  return v2;
}

id gt_xpc_dictionary_create_reply(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  return reply;
}

void *GTUnarchivedObjectOfClassesExpectingClass(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  BOOL v6 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:a1 fromData:a3 error:a4];
  if (!v6)
  {
LABEL_7:
    uint64_t v4 = 0;
    goto LABEL_8;
  }
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v6;
    goto LABEL_8;
  }
  if (v4)
  {
    if (!*v4)
    {
      uint64_t v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08320];
      uint64_t v8 = NSString;
      uint64_t v9 = NSStringFromClass(a2);
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      char v12 = [v8 stringWithFormat:@"Unexpected type when unarchiving response. Expected %@ Received %@", v9, v11];
      v16[0] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      void *v4 = [v7 errorWithDomain:@"com.apple.gputools.transport" code:9 userInfo:v13];
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

uint64_t registerService(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    BOOL v6 = a1;
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_string(empty, "_cmd", "registerService:forProcess:");
    MessageSetHasReply(empty);
    xpc_dictionary_set_nsobject(empty, "serviceProperties", (uint64_t)v4);
    uint64_t v8 = objc_alloc_init(GTProcessInfo);
    xpc_dictionary_set_nsobject(empty, "processInfo", (uint64_t)v8);

    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v6, empty);
    if (MEMORY[0x23ECDA660](v9) != MEMORY[0x263EF8720] && MEMORY[0x23ECDA660](v9) == MEMORY[0x263EF8708])
    {
      objc_msgSend(v4, "setServicePort:", xpc_dictionary_get_uint64(v9, "servicePort"));
      uint64_t v10 = NSString;
      string = xpc_dictionary_get_string(v9, "deviceUDID");
      if (string) {
        char v12 = string;
      }
      else {
        char v12 = "";
      }
      uint64_t v13 = [v10 stringWithUTF8String:v12];
      [v4 setDeviceUDID:v13];

      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

GTLocalXPCConnection *GTTransportServiceDaemonConnectionNew(void *a1)
{
  dispatch_queue_t v1 = a1;
  os_log_t v2 = os_log_create("com.apple.gputools.transport", "ServiceDaemonConnection");
  if (!v1) {
    dispatch_queue_t v1 = dispatch_queue_create("com.apple.gputools.defaultMessageProcessing", 0);
  }
  id v3 = dispatch_queue_create("com.apple.gputools.localConnection", 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.gputools.service", v3, 0);

  uint64_t v5 = [[GTLocalXPCConnection alloc] initWithXPCConnection:mach_service messageQueue:v1];
  objc_initWeak(&location, v5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __GTTransportServiceDaemonConnectionNew_block_invoke;
  v11[3] = &unk_264E29268;
  objc_copyWeak(&v12, &location);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __GTTransportServiceDaemonConnectionNew_block_invoke_2;
  v8[3] = &unk_264E29290;
  os_log_t v9 = v2;
  BOOL v6 = v2;
  objc_copyWeak(&v10, &location);
  [(GTLocalXPCConnection *)v5 activateWithMessageHandler:v11 andErrorHandler:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v5;
}

void __GTTransportServiceDaemonConnectionNew_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained dispatchMessage:v5 replyConnection:WeakRetained];
  }
}

void __GTTransportServiceDaemonConnectionNew_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x23ECDA560](a2);
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = v3;
    _os_log_impl(&dword_23C048000, v4, OS_LOG_TYPE_INFO, "Connection: Error:%s", (uint8_t *)&v10, 0xCu);
  }
  free(v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained connection];
    uint64_t v8 = (void *)MEMORY[0x23ECDA560]();

    os_log_t v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = v8;
      _os_log_impl(&dword_23C048000, v9, OS_LOG_TYPE_INFO, "Connection: Disconnect:%s", (uint8_t *)&v10, 0xCu);
    }
    free(v8);
  }
}

id GTTransportServiceDaemonConnectIfVersionNotOlderThan(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = os_log_create("com.apple.gputools.transport", "ConnectionVersioning");
  id v5 = GTTransportServiceDaemonConnectionNew(v3);

  if (v5)
  {
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__2;
    id v52 = __Block_byref_object_dispose__2;
    id v53 = 0;
    BOOL v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __GTTransportServiceDaemonConnectIfVersionNotOlderThan_block_invoke;
    block[3] = &unk_264E288B8;
    long long v47 = &v48;
    id v8 = v5;
    id v45 = v8;
    os_log_t v9 = v6;
    uint64_t v46 = v9;
    dispatch_async(v7, block);

    int v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v11 = [v10 objectForKey:@"GPUToolsTransportServiceDaemonConnectionTimeout"];

    if (v11)
    {
      [v10 doubleForKey:@"GPUToolsTransportServiceDaemonConnectionTimeout"];
      double v13 = v12;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_6(v4, v13);
      }
    }
    else
    {
      double v13 = 2.0;
    }
    dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    if (dispatch_group_wait(v9, v22))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_5(v4, v13);
      }
    }
    else
    {
      uint64_t v23 = (void *)v49[5];
      if (v23)
      {
        uint64_t v24 = filteredArrayByService(v23, (Protocol *)&unk_26EFBED88);
        uint64_t v25 = [v24 firstObject];

        uint64_t v26 = [v25 serviceProperties];
        unint64_t v27 = [v26 version];

        if (v27 >= a2)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
            GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_4(v4, v36, v37, v38, v39, v40, v41, v42);
          }
          id v21 = v8;
        }
        else
        {
          uint64_t v28 = v4;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_3(v25, a2, v28);
          }

          id v21 = 0;
        }

        goto LABEL_24;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_2(v4, v29, v30, v31, v32, v33, v34, v35);
      }
    }
    id v21 = 0;
LABEL_24:

    _Block_object_dispose(&v48, 8);
    goto LABEL_25;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_1(v4, v14, v15, v16, v17, v18, v19, v20);
  }
  id v21 = 0;
LABEL_25:

  return v21;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __GTTransportServiceDaemonConnectIfVersionNotOlderThan_block_invoke(uint64_t a1)
{
  uint64_t v2 = allServices(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [a1 serviceProperties];
  int v6 = 134218240;
  uint64_t v7 = [v5 version];
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23C048000, a3, OS_LOG_TYPE_DEBUG, "gputoolsserviced is too old (%llu < %llu)", (uint8_t *)&v6, 0x16u);
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_5(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "Timed out after waiting %gs for gputoolsserviced to respond", (uint8_t *)&v2, 0xCu);
}

void GTTransportServiceDaemonConnectIfVersionNotOlderThan_cold_6(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "GPUToolsTransportServiceDaemonConnectionTimeout is %gs [overridden]", (uint8_t *)&v2, 0xCu);
}

id GTCapabilitiesRuntime_serialize(const uint8_t *a1)
{
  uint64_t v10 = 2049;
  uint64_t v9 = 49680;
  int v2 = (uint8_t *)malloc_type_calloc(1uLL, 0xC210uLL, 0x2CC67910uLL);
  size_t v3 = compression_encode_buffer(v2, 0xC210uLL, a1, 0xC210uLL, 0, COMPRESSION_LZFSE);
  int v7 = 1;
  int v8 = 1;
  id v4 = objc_alloc_init(MEMORY[0x263EFF990]);
  [v4 appendBytes:&v8 length:4];
  [v4 appendBytes:&v7 length:4];
  [v4 appendBytes:&v10 length:8];
  [v4 appendBytes:&v9 length:8];
  [v4 appendBytes:v2 length:v3];
  free(v2);
  id v5 = (void *)[v4 copy];

  return v5;
}

uint8_t *decodeBuffer(const uint8_t *a1, size_t a2, uint64_t a3, size_t a4, size_t a5, apr_pool_t *p)
{
  if (a4 <= a5) {
    apr_size_t v10 = a5;
  }
  else {
    apr_size_t v10 = a4;
  }
  uint64_t result = (uint8_t *)apr_palloc(p, v10);
  if (result)
  {
    double v12 = result;
    bzero(result, v10);
    if (a3)
    {
      size_t v13 = compression_decode_buffer(v12, a4, a1, a2, 0, (compression_algorithm)a3);
      uint64_t result = 0;
      if (v13 != a4) {
        return result;
      }
    }
    else
    {
      if (a2 < a4) {
        return 0;
      }
      memcpy(v12, a1, a4);
    }
    return v12;
  }
  return result;
}

uint64_t GTCapabilitiesHeapAccelerationStructureInfo_deserialize(void *a1, apr_pool_t *a2, unsigned char *a3)
{
  v14[0] = 0;
  v14[1] = 0;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = [v5 length];
  id v7 = v5;
  uint64_t v8 = [v7 bytes];

  if (v6 <= 3
    || (int v9 = *(_DWORD *)v8, *(_DWORD *)v8 >= 2u)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || (v6 & 0xFFFFFFFFFFFFFFF0) == 0x10)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  uint64_t v11 = *(void *)(v8 + 16);
  if (v11)
  {
    unint64_t v12 = *(void *)(v8 + 24);
    size_t v13 = (char *)decodeBuffer((const uint8_t *)(v8 + 32), v6 - 32, *(void *)(v8 + 8), v12 * v11, v12 * v11, a2);
    if (v13)
    {
      GTCapabilitiesHeapAccelerationStructureInfo_deserializeFromBuffer(v13, (uint64_t)v14, v12, v11, v9, a3, a2);
      return v14[0];
    }
    goto LABEL_8;
  }
  return 0;
}

char *GTCapabilitiesHeapAccelerationStructureInfo_deserializeFromBuffer(char *result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, unsigned char *a6, apr_pool_t *p)
{
  if (a5 == 1 && (uint64_t v11 = result, v12 = 24 * a4, (result = (char *)apr_palloc(p, 24 * a4)) != 0))
  {
    size_t v13 = result;
    bzero(result, v12);
    if (a3 >= 0x18) {
      size_t v14 = 24;
    }
    else {
      size_t v14 = a3;
    }
    uint64_t v15 = v13;
    uint64_t v16 = a4;
    do
    {
      uint64_t result = (char *)memcpy(v15, v11, v14);
      v15 += 24;
      v11 += a3;
      --v16;
    }
    while (v16);
    *(void *)a2 = v13;
    *(_DWORD *)(a2 + 8) = a4;
  }
  else if (a6)
  {
    *a6 = 1;
  }
  return result;
}

uint64_t GTCapabilitiesHeapTextureInfo_deserialize(void *a1, apr_pool_t *a2, unsigned char *a3)
{
  v15[0] = 0;
  v15[1] = 0;
  if (a3) {
    *a3 = 0;
  }
  id v5 = a1;
  unint64_t v6 = [v5 length];
  id v7 = v5;
  uint64_t v8 = (unsigned int *)[v7 bytes];

  if (v6 <= 3
    || (uint64_t v9 = *v8, v9 >= 2)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || v6 - 16 <= 0x17)
  {
LABEL_8:
    if (a3)
    {
      uint64_t result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  unint64_t v11 = *((void *)v8 + 2);
  if (v11)
  {
    unint64_t v12 = *((void *)v8 + 3);
    uint64_t v13 = *((void *)v8 + 4);
    size_t v14 = (char *)decodeBuffer((const uint8_t *)v8 + 40, v6 - 40, *((void *)v8 + 1), (v13 + v12) * v11, (v13 + v12) * v11, a2);
    if (v14)
    {
      GTCapabilitiesHeapTextureInfo_deserializeFromBuffer(v14, (uint64_t)v15, v12, v13, v11, v9, a3, a2);
      return v15[0];
    }
    goto LABEL_8;
  }
  return 0;
}

void GTCapabilitiesHeapTextureInfo_deserializeFromBuffer(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unsigned char *a7, apr_pool_t *p)
{
  if (a6 != 1 || (v14 = 24 * a5, (uint64_t v15 = apr_palloc(p, 24 * a5)) == 0))
  {
    BOOL v21 = 0;
    if (!a7) {
      return;
    }
    goto LABEL_35;
  }
  uint64_t v16 = v15;
  uint64_t v38 = a2;
  uint64_t v39 = a7;
  bzero(v15, v14);
  if (a3 >= 0x10) {
    size_t v17 = 16;
  }
  else {
    size_t v17 = a3;
  }
  uint64_t v18 = 1;
  uint64_t v19 = a1;
  unint64_t v20 = a5;
  do
  {
    memcpy(&v16[v18], v19, v17);
    v18 += 3;
    v19 += a3;
    --v20;
  }
  while (v20);
  BOOL v21 = 0;
  unint64_t v22 = 0;
  uint64_t v40 = &a1[a5 * a3];
  while (1)
  {
    uint64_t v23 = 0;
    apr_size_t v24 = 0;
    uint64_t v56 = 0;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v43 = 0;
    long long v45 = 0u;
    memset(v42, 0, sizeof(v42));
    uint64_t v44 = 56;
    do
    {
      v24 += (*(void *)((char *)v42 + v23) + 7) & 0xFFFFFFFFFFFFFFF8;
      v23 += 8;
    }
    while (v23 != 424);
    uint64_t v25 = (char *)apr_palloc(p, v24);
    if (!v25) {
      break;
    }
    uint64_t v26 = v25;
    unint64_t v27 = &v40[v22 * a4];
    bzero(v25, v24);
    uint64_t v28 = 0;
    uint64_t v29 = v26;
    do
    {
      if (((*(void *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8) != 0) {
        uint64_t v30 = v29;
      }
      else {
        uint64_t v30 = 0;
      }
      v29 += (*(void *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8;
      *(void *)((char *)v42 + v28) = v30;
      v28 += 8;
    }
    while (v28 != 424);
    uint64_t v31 = v44;
    v44 += 56;
    *(void *)(v31 + 48) = 512;
    *(_OWORD *)uint64_t v31 = GTMTLTextureDescriptorDefaults;
    *(_OWORD *)(v31 + 16) = unk_23C081230;
    *(_OWORD *)(v31 + 32) = xmmword_23C081240;
    unsigned int v32 = *(_DWORD *)v27;
    *(unsigned char *)(v31 + 49) = *((void *)v27 + 1);
    *(_WORD *)(v31 + 34) = *((void *)v27 + 2);
    *(_DWORD *)(v31 + 24) = *((void *)v27 + 3);
    *(_WORD *)(v31 + 32) = *((void *)v27 + 4);
    *(_WORD *)(v31 + 30) = *((void *)v27 + 5);
    *(unsigned char *)(v31 + 45) = *((void *)v27 + 6);
    *(unsigned char *)(v31 + 47) = *((void *)v27 + 7);
    *(_WORD *)(v31 + 28) = *((void *)v27 + 8);
    uint64_t v33 = 72;
    if (v32 < 3) {
      uint64_t v33 = 80;
    }
    uint64_t v34 = &v27[v33];
    *(unsigned char *)(v31 + 43) = *(void *)v34;
    *(unsigned char *)(v31 + 44) = *((void *)v34 + 1);
    if (v32)
    {
      *(_DWORD *)(v31 + 20) = *((void *)v34 + 2);
      if (v32 <= 3)
      {
        if (v32 == 3) {
          *(_WORD *)(v31 + 36) = *((_WORD *)v34 + 16) | (16 * *((_WORD *)v34 + 12));
        }
      }
      else
      {
        int v35 = v34[24];
        *(unsigned char *)(v31 + 46) = v35;
        int v36 = *((_DWORD *)v34 + 10);
        int v37 = v36 | (16 * *((_DWORD *)v34 + 8));
        *(_WORD *)(v31 + 36) = v36 | (16 * *((_WORD *)v34 + 16));
        if (v32 >= 0x15)
        {
          *(unsigned char *)(v31 + 38) = *((void *)v34 + 6);
          *(unsigned char *)(v31 + 40) = *((void *)v34 + 7);
          if (v32 != 21)
          {
            *(void *)(v31 + 8) = *((void *)v34 + 8);
            *(unsigned char *)(v31 + 42) = *((void *)v34 + 9);
            if (v32 >= 0x23)
            {
              *(_DWORD *)(v31 + 16) = v34[80] | (unsigned __int16)(*((_DWORD *)v34 + 22) << 8) | (*((_DWORD *)v34 + 24) << 16) | (*((_DWORD *)v34 + 26) << 24);
              if (v32 >= 0x27)
              {
                *(_DWORD *)(v31 + 16) = *((void *)v34 + 14);
                if (v32 >= 0x2A)
                {
                  *(_WORD *)(v31 + 36) = v37 | (*((_WORD *)v34 + 60) << 8);
                  *(void *)uint64_t v31 = *((void *)v34 + 16);
                  *(unsigned char *)(v31 + 48) = *((void *)v34 + 17);
                  *(unsigned char *)(v31 + 50) = *((void *)v34 + 18);
                  if (v32 >= 0x31)
                  {
                    *(unsigned char *)(v31 + 41) = *((void *)v34 + 19);
                    *(unsigned char *)(v31 + 39) = *((void *)v34 + 20);
                  }
                }
              }
            }
          }
        }
        if (v35 == 255) {
          *(unsigned char *)(v31 + 46) = 0;
        }
      }
    }
    v16[3 * v22++] = v26;
    BOOL v21 = v22 >= a5;
    if (v22 == a5)
    {
      *(void *)uint64_t v38 = v16;
      *(_DWORD *)(v38 + 8) = a5;
      return;
    }
  }
  a7 = v39;
  if (v39)
  {
LABEL_35:
    if (!v21) {
      *a7 = 1;
    }
  }
}

char *GTCapabilitiesRuntime_fromDeviceSafe(void *a1, apr_pool_t *a2)
{
  kern_return_t v14;
  BOOL v15;
  kern_return_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  __int16 v121;
  char *v122;
  char *v123;
  long long outputStruct;
  long long v126;
  long long v127;
  uint64_t v128;
  size_t outputStructCnt;
  io_connect_t connect;

  id v3 = a1;
  id v4 = (char *)apr_palloc(a2, 0xC210uLL);
  id v5 = v4;
  unint64_t v6 = v4 + 49408;
  if (v4) {
    bzero(v4, 0xC210uLL);
  }
  id v7 = v3;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 name];
    snprintf(v5 + 49152, 0x100uLL, "%s", (const char *)[v9 UTF8String]);

    apr_size_t v10 = [v8 targetDeviceArchitecture];
    *(_DWORD *)unint64_t v6 = [v10 cpuType];
    *((_DWORD *)v6 + 1) = [v10 subType];
    *((_WORD *)v6 + 4) = [v10 version];
    v6[10] = [v10 version] >> 16;
    v6[11] = [v10 version] >> 24;
    *((_DWORD *)v6 + 3) = [v10 versionCombined];
    *((void *)v6 + 2) = [v10 driverVersion];

    if (*(_DWORD *)v6 == 16777235)
    {
      *((_OWORD *)v5 + 3090) = 0u;
      mach_port_t v11 = *MEMORY[0x263F0EC88];
      CFDictionaryRef v12 = IOServiceMatching("AGXAccelerator");
      io_service_t MatchingService = IOServiceGetMatchingService(v11, v12);
      if (MatchingService)
      {
        connect = 0;
        size_t v14 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 1u, &connect);
        uint64_t v15 = 0;
        if (!v14)
        {
          outputStruct = 0uLL;
          outputStructCnt = 16;
          uint64_t v16 = IOConnectCallStructMethod(connect, 0x10Au, 0, 0, &outputStruct, &outputStructCnt);
          uint64_t v15 = v16 == 0;
          if (!v16) {
            *((_OWORD *)v5 + 3090) = outputStruct;
          }
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      v6[268] = v15;
    }
    if (objc_opt_respondsToSelector())
    {
      for (uint64_t i = 0; i != 9; ++i)
        v5[i + 49497] = [v8 supportsFamily:i + 1001];
      v6[98] = [v8 supportsFamily:2002];
      uint64_t v18 = 0;
      v6[99] = [v8 supportsFamily:2003];
      do
      {
        v5[v18 + 49508] = [v8 supportsFamily:v18 + 3001];
        ++v18;
      }
      while (v18 != 3);
      v6[103] = [v8 supportsFamily:5001];
    }
    *((void *)v6 + 3) = -1;
    if (objc_opt_respondsToSelector()) {
      *((void *)v6 + 6) = [v8 maxThreadgroupMemoryLength];
    }
    if (objc_opt_respondsToSelector())
    {
      outputStruct = 0uLL;
      *(void *)&v126 = 0;
      [v8 maxThreadsPerThreadgroup];
      uint64_t v19 = v126;
      *(_OWORD *)(v6 + 56) = outputStruct;
      *((void *)v6 + 9) = v19;
    }
    if (objc_opt_respondsToSelector()) {
      *((void *)v6 + 10) = [v8 maxBufferLength];
    }
    if (objc_opt_respondsToSelector()) {
      unint64_t v20 = [v8 supportsLateEvalEvent];
    }
    else {
      unint64_t v20 = 0;
    }
    v6[213] = v20;
    if (objc_opt_respondsToSelector()) {
      BOOL v21 = [v8 supportsRaytracing];
    }
    else {
      BOOL v21 = 0;
    }
    v6[215] = v21;
    if (objc_opt_respondsToSelector()) {
      unint64_t v22 = [v8 supportsTileShaders];
    }
    else {
      unint64_t v22 = 0;
    }
    v6[214] = v22;
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = [v8 supportsMeshShaders];
    }
    else {
      uint64_t v23 = 0;
    }
    v6[216] = v23;
    if (objc_opt_respondsToSelector()) {
      apr_size_t v24 = [v8 isMsaa32bSupported];
    }
    else {
      apr_size_t v24 = 0;
    }
    v6[142] = v24;
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = [v8 supportsBufferWithIOSurface];
    }
    else {
      uint64_t v25 = 0;
    }
    v6[219] = v25;
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = [v8 supportsBGR10A2];
    }
    else {
      uint64_t v26 = 0;
    }
    v6[155] = v26;
    if (objc_opt_respondsToSelector()) {
      unint64_t v27 = [v8 supportsSparseHeaps];
    }
    else {
      unint64_t v27 = 0;
    }
    v6[223] = v27;
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = [v8 supportsSparseTextures];
    }
    else {
      uint64_t v28 = 0;
    }
    v6[224] = v28;
    if (objc_opt_respondsToSelector()) {
      uint64_t v29 = [v8 supportsPlacementHeaps];
    }
    else {
      uint64_t v29 = 0;
    }
    v6[222] = v29;
    if (objc_opt_respondsToSelector()) {
      uint64_t v30 = [v8 supportsComputeMemoryBarrier];
    }
    else {
      uint64_t v30 = 0;
    }
    v6[206] = v30;
    if (objc_opt_respondsToSelector()) {
      uint64_t v31 = [v8 supportsRenderMemoryBarrier];
    }
    else {
      uint64_t v31 = 0;
    }
    v6[207] = v31;
    if (objc_opt_respondsToSelector()) {
      unsigned int v32 = [v8 supportsPartialRenderMemoryBarrier];
    }
    else {
      unsigned int v32 = 0;
    }
    v6[208] = v32;
    if (objc_opt_respondsToSelector())
    {
      for (uint64_t j = 0; j != 16; ++j)
        v5[j + 49593] = [v8 supportsVertexAmplificationCount:j];
    }
    if (objc_opt_respondsToSelector())
    {
      for (uint64_t k = 0; k != 32; ++k)
        v5[k + 49512] = [v8 supportsTextureSampleCount:k];
    }
    if (objc_opt_respondsToSelector())
    {
      for (uint64_t m = 0; m != 16; ++m)
        v5[m + 49577] = [v8 supportsRasterizationRateMapWithLayerCount:m];
    }
    if (objc_opt_respondsToSelector()) {
      int v36 = [v8 supportsProgrammableSamplePositions];
    }
    else {
      int v36 = 0;
    }
    v6[168] = v36;
    if (objc_opt_respondsToSelector()) {
      int v37 = [v8 supportsGFXIndirectCommandBuffers];
    }
    else {
      int v37 = 0;
    }
    v6[209] = v37;
    if (objc_opt_respondsToSelector()) {
      uint64_t v38 = [v8 supportsCMPIndirectCommandBuffers];
    }
    else {
      uint64_t v38 = 0;
    }
    v6[210] = v38;
    if (objc_opt_respondsToSelector()) {
      uint64_t v39 = [v8 supportsIndirectDrawAndDispatch];
    }
    else {
      uint64_t v39 = 0;
    }
    v6[212] = v39;
    if (objc_opt_respondsToSelector()) {
      uint64_t v40 = [v8 supportsMeshShadersInICB];
    }
    else {
      uint64_t v40 = 0;
    }
    v6[211] = v40;
    if (objc_opt_respondsToSelector()) {
      uint64_t v41 = [v8 supportsMemorylessRenderTargets];
    }
    else {
      uint64_t v41 = 0;
    }
    v6[137] = v41;
    if (objc_opt_respondsToSelector()) {
      uint64_t v42 = [v8 supportsRenderTargetTextureRotation];
    }
    else {
      uint64_t v42 = 0;
    }
    v6[140] = v42;
    if (objc_opt_respondsToSelector()) {
      uint64_t v43 = [v8 supportsNonUniformThreadgroupSize];
    }
    else {
      uint64_t v43 = 0;
    }
    v6[217] = v43;
    if (objc_opt_respondsToSelector()) {
      uint64_t v44 = [v8 supportsArgumentBuffersTier2];
    }
    else {
      uint64_t v44 = 0;
    }
    v6[136] = v44;
    if (objc_opt_respondsToSelector()) {
      long long v45 = [v8 supportsConcurrentComputeDispatch];
    }
    else {
      long long v45 = 0;
    }
    v6[218] = v45;
    if (objc_opt_respondsToSelector()) {
      long long v46 = [v8 supportsSharedStorageHeapResources];
    }
    else {
      long long v46 = 0;
    }
    v6[221] = v46;
    if (objc_opt_respondsToSelector()) {
      long long v47 = [v8 supportsSharedStorageTextures];
    }
    else {
      long long v47 = 0;
    }
    v6[138] = v47;
    if (objc_opt_respondsToSelector()) {
      long long v48 = [v8 supportsSharedTextureHandles];
    }
    else {
      long long v48 = 0;
    }
    v6[139] = v48;
    if (objc_opt_respondsToSelector()) {
      long long v49 = [v8 supportsDynamicAttributeStride];
    }
    else {
      long long v49 = 0;
    }
    v6[227] = v49;
    if (objc_opt_respondsToSelector()) {
      long long v50 = [v8 supportsNonSquareTileShaders];
    }
    else {
      long long v50 = 0;
    }
    v6[228] = v50;
    if (objc_opt_respondsToSelector()) {
      long long v51 = [v8 supportsLayeredRendering];
    }
    else {
      long long v51 = 0;
    }
    v6[229] = v51;
    if (objc_opt_respondsToSelector()) {
      long long v52 = [v8 supportsViewportAndScissorArray];
    }
    else {
      long long v52 = 0;
    }
    v6[230] = v52;
    if (objc_opt_respondsToSelector()) {
      long long v53 = [v8 supportsLinearTextureFromSharedBuffer];
    }
    else {
      long long v53 = 0;
    }
    v6[143] = v53;
    if (objc_opt_respondsToSelector()) {
      long long v54 = [v8 supportsNonPrivateDepthStencilTextures];
    }
    else {
      long long v54 = 0;
    }
    v6[144] = v54;
    if (objc_opt_respondsToSelector()) {
      long long v55 = [v8 supportsRenderToLinearTextures];
    }
    else {
      long long v55 = 0;
    }
    v6[145] = v55;
    if (objc_opt_respondsToSelector()) {
      uint64_t v56 = [v8 supportsSeparateDepthStencil];
    }
    else {
      uint64_t v56 = 0;
    }
    v6[147] = v56;
    if (objc_opt_respondsToSelector()) {
      size_t v57 = [v8 supportsRelaxedTextureViewRequirements];
    }
    else {
      size_t v57 = 0;
    }
    v6[148] = v57;
    if (objc_opt_respondsToSelector()) {
      v58 = [v8 supportsVariableRateRasterization];
    }
    else {
      v58 = 0;
    }
    v6[238] = v58;
    if (objc_opt_respondsToSelector()) {
      v59 = [v8 supportsExtendedVertexFormats];
    }
    else {
      v59 = 0;
    }
    v6[231] = v59;
    if (objc_opt_respondsToSelector()) {
      ssize_t v60 = [v8 supportsFunctionPointers];
    }
    else {
      ssize_t v60 = 0;
    }
    v6[203] = v60;
    if (objc_opt_respondsToSelector()) {
      size_t v61 = [v8 supportsFunctionPointersFromRender];
    }
    else {
      size_t v61 = 0;
    }
    v6[204] = v61;
    if (objc_opt_respondsToSelector()) {
      char v62 = [v8 supportsFunctionPointersFromMesh];
    }
    else {
      char v62 = 0;
    }
    v6[205] = v62;
    if (objc_opt_respondsToSelector()) {
      v63 = [v8 supportsDynamicLibraries];
    }
    else {
      v63 = 0;
    }
    v6[201] = v63;
    if (objc_opt_respondsToSelector()) {
      uint64_t v64 = [v8 supportsRenderDynamicLibraries];
    }
    else {
      uint64_t v64 = 0;
    }
    v6[202] = v64;
    if (objc_opt_respondsToSelector()) {
      v65 = [v8 supportsDepthClipMode];
    }
    else {
      v65 = 0;
    }
    v6[239] = v65;
    if (objc_opt_respondsToSelector()) {
      uint64_t v66 = [v8 supportsDepthClipModeClampExtended];
    }
    else {
      uint64_t v66 = 0;
    }
    v6[240] = v66;
    if (objc_opt_respondsToSelector()) {
      v67 = [v8 supportsSparseDepthAttachments];
    }
    else {
      v67 = 0;
    }
    v6[225] = v67;
    if (objc_opt_respondsToSelector()) {
      uint64_t v68 = [v8 supportsLossyCompression];
    }
    else {
      uint64_t v68 = 0;
    }
    v6[146] = v68;
    if (objc_opt_respondsToSelector()) {
      v69 = [v8 supportsTextureSwizzle];
    }
    else {
      v69 = 0;
    }
    v6[149] = v69;
    if (objc_opt_respondsToSelector()) {
      v70 = [v8 supportsTextureCubeArray];
    }
    else {
      v70 = 0;
    }
    v6[150] = v70;
    if (objc_opt_respondsToSelector()) {
      v71 = [v8 supportsTexture2DMultisampleArray];
    }
    else {
      v71 = 0;
    }
    v6[151] = v71;
    if (objc_opt_respondsToSelector()) {
      uint64_t v72 = [v8 supportsLinearTexture2DArray];
    }
    else {
      uint64_t v72 = 0;
    }
    v6[152] = v72;
    if (objc_opt_respondsToSelector()) {
      v73 = [v8 supports2DLinearTexArraySPI];
    }
    else {
      v73 = 0;
    }
    v6[153] = v73;
    if (objc_opt_respondsToSelector()) {
      v74 = [v8 supportsRGBA10A2Gamma];
    }
    else {
      v74 = 0;
    }
    v6[154] = v74;
    if (objc_opt_respondsToSelector()) {
      v75 = [v8 supportsBGR10A2];
    }
    else {
      v75 = 0;
    }
    v6[155] = v75;
    if (objc_opt_respondsToSelector()) {
      v76 = [v8 supportsSRGBwrites];
    }
    else {
      v76 = 0;
    }
    v6[156] = v76;
    if (objc_opt_respondsToSelector()) {
      id v77 = [v8 supportsBfloat16Format];
    }
    else {
      id v77 = 0;
    }
    v6[157] = v77;
    if (objc_opt_respondsToSelector()) {
      v78 = [v8 supportsSamplerAddressModeClampToHalfBorder];
    }
    else {
      v78 = 0;
    }
    v6[233] = v78;
    if (objc_opt_respondsToSelector()) {
      id v79 = [v8 supportsCustomBorderColor];
    }
    else {
      id v79 = 0;
    }
    v6[234] = v79;
    if (objc_opt_respondsToSelector()) {
      v80 = [v8 supportsSamplerCompareFunction];
    }
    else {
      v80 = 0;
    }
    v6[235] = v80;
    if (objc_opt_respondsToSelector()) {
      uint64_t v81 = [v8 supportsBlackOrWhiteSamplerBorderColors];
    }
    else {
      uint64_t v81 = 0;
    }
    v6[236] = v81;
    if (objc_opt_respondsToSelector()) {
      v82 = [v8 supportsMirrorClampToEdgeSamplerMode];
    }
    else {
      v82 = 0;
    }
    v6[237] = v82;
    if (objc_opt_respondsToSelector()) {
      id v83 = [v8 supportsPrimitiveMotionBlur];
    }
    else {
      id v83 = 0;
    }
    v6[158] = v83;
    if (objc_opt_respondsToSelector()) {
      id v84 = [v8 supportsRayTracingICBs];
    }
    else {
      id v84 = 0;
    }
    v6[159] = v84;
    if (objc_opt_respondsToSelector()) {
      id v85 = [v8 supportsRayTracingExtendedVertexFormats];
    }
    else {
      id v85 = 0;
    }
    v6[160] = v85;
    if (objc_opt_respondsToSelector()) {
      v86 = [v8 supportsHeapAccelerationStructureAllocation];
    }
    else {
      v86 = 0;
    }
    v6[226] = v86;
    if (objc_opt_respondsToSelector()) {
      v87 = [v8 supportsRayTracingPerPrimitiveData];
    }
    else {
      v87 = 0;
    }
    v6[161] = v87;
    if (objc_opt_respondsToSelector()) {
      uint64_t v88 = [v8 supportsRayTracingBuffersFromTables];
    }
    else {
      uint64_t v88 = 0;
    }
    v6[162] = v88;
    if (objc_opt_respondsToSelector()) {
      uint64_t v89 = [v8 supportsRayTracingAccelerationStructureCPUDeserialization];
    }
    else {
      uint64_t v89 = 0;
    }
    v6[163] = v89;
    if (objc_opt_respondsToSelector()) {
      uint64_t v90 = [v8 supportsRayTracingMultiLevelInstancing];
    }
    else {
      uint64_t v90 = 0;
    }
    v6[164] = v90;
    if (objc_opt_respondsToSelector()) {
      uint64_t v91 = [v8 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
    }
    else {
      uint64_t v91 = 0;
    }
    v6[165] = v91;
    if (objc_opt_respondsToSelector()) {
      id v92 = [v8 supportsRayTracingGPUTableUpdateBuffers];
    }
    else {
      id v92 = 0;
    }
    v6[166] = v92;
    if (objc_opt_respondsToSelector()) {
      id v93 = [v8 supportsRayTracingCurves];
    }
    else {
      id v93 = 0;
    }
    v6[167] = v93;
    if (objc_opt_respondsToSelector()) {
      id v94 = [v8 supportsBCTextureCompression];
    }
    else {
      id v94 = 0;
    }
    v6[241] = v94;
    if (objc_opt_respondsToSelector()) {
      id v95 = [v8 supports3DBCTextures];
    }
    else {
      id v95 = 0;
    }
    v6[242] = v95;
    if (objc_opt_respondsToSelector()) {
      v96 = [v8 supportsMSAADepthResolve];
    }
    else {
      v96 = 0;
    }
    v6[243] = v96;
    if (objc_opt_respondsToSelector()) {
      v97 = [v8 supportsMSAAStencilResolve];
    }
    else {
      v97 = 0;
    }
    v6[244] = v97;
    if (objc_opt_respondsToSelector()) {
      v98 = [v8 supportsMSAADepthResolveFilter];
    }
    else {
      v98 = 0;
    }
    v6[245] = v98;
    if (objc_opt_respondsToSelector()) {
      uint64_t v99 = [v8 supports32bpcMSAATextures];
    }
    else {
      uint64_t v99 = 0;
    }
    v6[246] = v99;
    if (objc_opt_respondsToSelector()) {
      v100 = [v8 supports32BitMSAA];
    }
    else {
      v100 = 0;
    }
    v6[247] = v100;
    if (objc_opt_respondsToSelector()) {
      id v101 = [v8 supportsNonPrivateMSAATextures];
    }
    else {
      id v101 = 0;
    }
    v6[248] = v101;
    if (objc_opt_respondsToSelector()) {
      v102 = [v8 supportsCombinedMSAAStoreAndResolveAction];
    }
    else {
      v102 = 0;
    }
    v6[249] = v102;
    if (objc_opt_respondsToSelector()) {
      v103 = [v8 supportsMSAAStencilResolveFilter];
    }
    else {
      v103 = 0;
    }
    v6[250] = v103;
    if (objc_opt_respondsToSelector()) {
      v104 = [v8 supportsASTCTextureCompression];
    }
    else {
      v104 = 0;
    }
    v6[251] = v104;
    if (objc_opt_respondsToSelector()) {
      v105 = [v8 supports3DASTCTextures];
    }
    else {
      v105 = 0;
    }
    v6[252] = v105;
    if (objc_opt_respondsToSelector()) {
      v106 = [v8 supportsASTCHDRTextureCompression];
    }
    else {
      v106 = 0;
    }
    v6[253] = v106;
    if (objc_opt_respondsToSelector()) {
      long long v107 = [v8 supportsLimitedYUVFormats];
    }
    else {
      long long v107 = 0;
    }
    v6[254] = v107;
    if (objc_opt_respondsToSelector()) {
      long long v108 = [v8 supportsExtendedYUVFormats];
    }
    else {
      long long v108 = 0;
    }
    v6[255] = v108;
    if (objc_opt_respondsToSelector()) {
      long long v109 = [v8 supportsAlphaYUVFormats];
    }
    else {
      long long v109 = 0;
    }
    v6[256] = v109;
    if (objc_opt_respondsToSelector()) {
      long long v110 = [v8 supportsYCBCRFormats];
    }
    else {
      long long v110 = 0;
    }
    v6[257] = v110;
    if (objc_opt_respondsToSelector()) {
      v111 = [v8 supportsYCBCRFormatsPQ];
    }
    else {
      v111 = 0;
    }
    v6[258] = v111;
    if (objc_opt_respondsToSelector()) {
      uint64_t v112 = [v8 supportsYCBCRFormats12];
    }
    else {
      uint64_t v112 = 0;
    }
    v6[259] = v112;
    if (objc_opt_respondsToSelector()) {
      v113 = [v8 supportsYCBCRFormatsXR];
    }
    else {
      v113 = 0;
    }
    v6[260] = v113;
    if (objc_opt_respondsToSelector()) {
      v114 = [v8 supportsYCBCRPackedFormatsPQ];
    }
    else {
      v114 = 0;
    }
    v6[261] = v114;
    if (objc_opt_respondsToSelector()) {
      v115 = [v8 supportsYCBCRPackedFormats12];
    }
    else {
      v115 = 0;
    }
    v6[262] = v115;
    if (objc_opt_respondsToSelector()) {
      v116 = [v8 supportsYCBCRPackedFormatsXR];
    }
    else {
      v116 = 0;
    }
    v6[263] = v116;
    if (objc_opt_respondsToSelector()) {
      v117 = [v8 supportsPublicXR10Formats];
    }
    else {
      v117 = 0;
    }
    v6[264] = v117;
    if (objc_opt_respondsToSelector()) {
      v118 = [v8 supportsExtendedXR10Formats];
    }
    else {
      v118 = 0;
    }
    v119 = 0;
    v6[265] = v118;
    do
    {
      v120 = (unsigned __int16)word_23C081258[v119];
      v128 = 0;
      v126 = 0u;
      v127 = 0u;
      outputStruct = 0u;
      MTLPixelFormatGetInfoForDevice();
      v121 = WORD4(outputStruct);
      v122 = &v5[12 * v120];
      *(_DWORD *)v122 = DWORD2(outputStruct);
      *((_WORD *)v122 + 2) = v120;
      if ((v121 & 0x400) == 0) {
        *(_WORD *)&v5[12 * v120 + 6] = BYTE1(v127);
      }
      if ((v121 & 0x461) == 1)
      {
        v123 = &v5[12 * v120];
        *((_WORD *)v123 + 4) = [v8 minimumLinearTextureAlignmentForPixelFormat:v120];
        *((_WORD *)v123 + 5) = [v8 minimumTextureBufferAlignmentForPixelFormat:v120];
      }
      ++v119;
    }
    while (v119 != 275);
    v6[267] = [MEMORY[0x263F12D20] supportsDevice:v8];
    v6[266] = [MEMORY[0x263F12D28] supportsDevice:v8];
  }
  else
  {
    v6[88] = 1;
  }

  return v5;
}

uint64_t GTCapabilitiesRuntime_heapTextureInfoCompatible(uint64_t *a1, uint64_t a2, void *a3)
{
  id v23 = a3;
  unint64_t v5 = *((unsigned int *)a1 + 2);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    char v8 = 1;
    do
    {
      uint64_t v9 = *a1;
      uint64_t v10 = *(void *)(*a1 + v6);
      if (*(unsigned char *)(a2 + 12 * *(unsigned __int16 *)(v10 + 34)))
      {
        mach_port_t v11 = (objc_class *)MEMORY[0x263F12A50];
        id v12 = v23;
        id v13 = objc_alloc_init(v11);
        [v13 setTextureType:*(unsigned __int8 *)(v10 + 49)];
        [v13 setPixelFormat:*(unsigned __int16 *)(v10 + 34)];
        [v13 setWidth:*(unsigned int *)(v10 + 24)];
        [v13 setHeight:*(unsigned __int16 *)(v10 + 32)];
        [v13 setDepth:*(unsigned __int16 *)(v10 + 30)];
        [v13 setMipmapLevelCount:*(unsigned __int8 *)(v10 + 45)];
        [v13 setSampleCount:*(unsigned __int8 *)(v10 + 47)];
        [v13 setArrayLength:*(unsigned __int16 *)(v10 + 28)];
        [v13 setUsage:*(unsigned int *)(v10 + 20)];
        [v13 setResourceOptions:*(unsigned __int16 *)(v10 + 36)];
        if (objc_opt_respondsToSelector()) {
          [v13 setSwizzleKey:*(unsigned int *)(v10 + 16)];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setRotation:*(unsigned __int8 *)(v10 + 46)];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setAllowGPUOptimizedContents:*(unsigned char *)(v10 + 38) != 0];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setSparseSurfaceDefaultValue:*(unsigned __int8 *)(v10 + 48)];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setWriteSwizzleEnabled:*(unsigned char *)(v10 + 50) != 0];
        }
        if (objc_opt_respondsToSelector())
        {
          [v13 setCompressionType:*(unsigned __int8 *)(v10 + 41)];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v13 setLossyCompressionMode:*(unsigned __int8 *)(v10 + 41)];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setCompressionFootprint:*(unsigned __int8 *)(v10 + 39)];
        }
        if (objc_opt_respondsToSelector()) {
          [v13 setCompressionMode:*(unsigned __int8 *)(v10 + 40)];
        }
        [v13 setAllowGPUOptimizedContents:*(unsigned char *)(v10 + 38) != 0];
        [v13 setFramebufferOnly:*(unsigned char *)(v10 + 43) != 0];
        [v13 setIsDrawable:*(unsigned char *)(v10 + 44) != 0];
        unint64_t v14 = [v12 heapTextureSizeAndAlignWithDescriptor:v13];
        unint64_t v16 = v15;

        uint64_t v17 = v9 + v6;
        unint64_t v18 = *(void *)(v9 + v6 + 8);
        unint64_t v19 = *(void *)(v17 + 16);

        BOOL v21 = v18 >= v16 && v19 <= v14;
        v8 &= v21;
        unint64_t v5 = *((unsigned int *)a1 + 2);
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < v5);
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

uint64_t GTCapabilitiesRuntime_heapAccelerationStructureInfoCompatible(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a2 + 49623) && *(_DWORD *)(a1 + 8))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 1;
    do
    {
      uint64_t v9 = (void *)(*(void *)a1 + v6);
      if (v9[2] > (unint64_t)[v5 heapAccelerationStructureSizeAndAlignWithSize:*v9]) {
        int v11 = 0;
      }
      else {
        int v11 = v8;
      }
      if (v9[1] >= v10) {
        int v8 = v11;
      }
      else {
        int v8 = 0;
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < *(unsigned int *)(a1 + 8));
    uint64_t v12 = v8 & 1;
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

vm_address_t GTCoreAlloc(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v4;
  char *v5;
  NSObject *v6;
  const char *v7;
  kern_return_t v8;
  mach_error_t v9;
  char *v11;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  unint64_t v19 = *MEMORY[0x263EF8340];
  address = 0;
  object_handle = 0;
  size = a1;
  int v2 = (vm_map_t *)MEMORY[0x263EF8960];
  memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x263EF8960], &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    id v4 = memory_entry_64;
    gt_default_log();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      id v5 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      unint64_t v16 = v4;
      uint64_t v17 = 2080;
      unint64_t v18 = v5;
      uint64_t v6 = MEMORY[0x263EF8438];
      unint64_t v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl(&dword_23C048000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
    }
  }
  else
  {
    int v8 = vm_map(*v2, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v8)
    {
      mach_port_deallocate(*v2, object_handle);
      return address;
    }
    uint64_t v9 = v8;
    gt_default_log();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      int v11 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      unint64_t v16 = v9;
      uint64_t v17 = 2080;
      unint64_t v18 = v11;
      uint64_t v6 = MEMORY[0x263EF8438];
      unint64_t v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1) {
    hash_mutex = 0;
  }
  return 0;
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    id v5 = (apr_pool_t *)*((void *)p + 1);
    if (!v5) {
      break;
    }
    apr_pool_destroy(v5);
  }
  while (1)
  {
    uint64_t v6 = *((void *)p + 4);
    if (!v6) {
      break;
    }
    *((void *)p + 4) = *(void *)v6;
    (*(void (**)(void))(v6 + 16))(*(void *)(v6 + 8));
  }
  unint64_t v7 = (unsigned int *)*((void *)p + 7);
  if (!v7) {
    goto LABEL_42;
  }
  uint64_t v8 = *((void *)p + 7);
  do
  {
    if (apr_proc_wait(*(apr_proc_t **)v8, (int *)1, v1, v2) != 70006) {
      *(_DWORD *)(v8 + 8) = 0;
    }
    uint64_t v8 = *(void *)(v8 + 16);
  }
  while (v8);
  uint64_t v9 = v7;
  do
  {
    unsigned int v10 = v9[2];
    if (v10 == 1)
    {
      apr_proc_kill((apr_proc_t *)**(unsigned int **)v9, 9);
    }
    else
    {
      BOOL v11 = v10 == 4 || v10 == 2;
      if (v11 && !apr_proc_kill((apr_proc_t *)**(unsigned int **)v9, 15)) {
        LODWORD(v8) = 1;
      }
    }
    uint64_t v9 = (unsigned int *)*((void *)v9 + 2);
  }
  while (v9);
  uint64_t v12 = v7;
  if (!v8) {
    goto LABEL_36;
  }
  long long v35 = xmmword_23C0811C0;
  select(0, 0, 0, 0, (timeval *)&v35);
  unint64_t v13 = 46875;
  while (2)
  {
    uint64_t v14 = 0;
    unint64_t v15 = v7;
    do
    {
      uint64_t v16 = v14;
      if (v15[2] == 2)
      {
        uint64_t v14 = 1;
        if (apr_proc_wait(*(apr_proc_t **)v15, (int *)1, v1, v2) == 70006) {
          goto LABEL_31;
        }
        void v15[2] = 0;
      }
      uint64_t v14 = v16;
LABEL_31:
      unint64_t v15 = (unsigned int *)*((void *)v15 + 2);
    }
    while (v15);
    if (v14 && v13 <= 0x2DC6BF)
    {
      *(void *)&long long v35 = v13 / 0xF4240;
      *((void *)&v35 + 1) = v13 % 0xF4240;
      select(0, 0, 0, 0, (timeval *)&v35);
      v13 *= 2;
      continue;
    }
    break;
  }
  uint64_t v12 = v7;
  do
  {
LABEL_36:
    if (v12[2] == 2) {
      apr_proc_kill((apr_proc_t *)**(unsigned int **)v12, 9);
    }
    uint64_t v12 = (unsigned int *)*((void *)v12 + 2);
  }
  while (v12);
  do
  {
    if (v7[2]) {
      apr_proc_wait(*(apr_proc_t **)v7, 0, v1, v2);
    }
    unint64_t v7 = (unsigned int *)*((void *)v7 + 2);
  }
  while (v7);
LABEL_42:
  if (*(void *)p)
  {
    uint64_t v17 = *(void *)(*(void *)(*(void *)p + 48) + 24);
    if (v17) {
      pthread_mutex_lock((pthread_mutex_t *)(v17 + 8));
    }
    uint64_t v18 = *((void *)p + 2);
    **((void **)p + 3) = v18;
    if (v18) {
      *(void *)(*((void *)p + 2) + 24) = *((void *)p + 3);
    }
    if (v17) {
      pthread_mutex_unlock((pthread_mutex_t *)(v17 + 8));
    }
  }
  unint64_t v19 = (unint64_t *)*((void *)p + 6);
  unint64_t v20 = (uint64_t **)*((void *)p + 12);
  *v20[1] = 0;
  if ((apr_pool_t *)v19[4] == p)
  {
    v19[3] = 0;
  }
  else
  {
    unint64_t v21 = v19[3];
    if (v21) {
      pthread_mutex_lock((pthread_mutex_t *)(v21 + 8));
    }
  }
  unint64_t v22 = 0;
  unint64_t v23 = *v19;
  unint64_t v24 = v19[1];
  unint64_t v25 = v19[2];
  do
  {
    while (1)
    {
      while (1)
      {
        uint64_t v26 = (uint64_t *)v20;
        unint64_t v20 = (uint64_t **)*v20;
        unint64_t v27 = *((unsigned int *)v26 + 4);
        if (!v24 || v25 > v27) {
          break;
        }
        uint64_t *v26 = (uint64_t)v22;
        unint64_t v22 = v26;
        if (!v20) {
          goto LABEL_72;
        }
      }
      if (v27 > 0x13) {
        break;
      }
      uint64_t v28 = (uint64_t *)&v19[v27];
      uint64_t v29 = v28[5];
      uint64_t *v26 = v29;
      if (v23 < v27 && v29 == 0) {
        unint64_t v23 = v27;
      }
      v28[5] = (uint64_t)v26;
      if (v25 <= v27)
      {
        unint64_t v25 = 0;
        if (!v20) {
          goto LABEL_72;
        }
      }
      else
      {
        v25 += ~v27;
        if (!v20) {
          goto LABEL_72;
        }
      }
    }
    uint64_t *v26 = v19[5];
    v19[5] = (unint64_t)v26;
    BOOL v31 = v25 > v27;
    v25 += ~v27;
    if (!v31) {
      unint64_t v25 = 0;
    }
  }
  while (v20);
LABEL_72:
  unint64_t *v19 = v23;
  void v19[2] = v25;
  unint64_t v32 = v19[3];
  if (v32) {
    pthread_mutex_unlock((pthread_mutex_t *)(v32 + 8));
  }
  if (v22)
  {
    uint64_t v33 = (unsigned int *)MEMORY[0x263EF8960];
    do
    {
      uint64_t v34 = (uint64_t *)*v22;
      MEMORY[0x23ECDA430](*v33, v22, ((*((_DWORD *)v22 + 4) << 12) + 4096));
      unint64_t v22 = v34;
    }
    while (v34);
  }
  if ((apr_pool_t *)v19[4] == p) {
    apr_allocator_destroy((apr_allocator_t *)v19);
  }
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  uint64_t v2 = 0;
  id v3 = (unsigned int *)MEMORY[0x263EF8960];
  while (1)
  {
    id v4 = (char *)allocator + 8 * v2;
    unint64_t v7 = (void *)*((void *)v4 + 5);
    uint64_t v6 = v4 + 40;
    id v5 = v7;
    if (v7)
    {
      do
      {
        void *v6 = *v5;
        MEMORY[0x23ECDA430](*v3);
        id v5 = (void *)*v6;
      }
      while (*v6);
    }
    if (++v2 == 20)
    {
      JUMPOUT(0x23ECDA430);
    }
  }
}

void *allocator_alloc(unint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v4 = 0x2000;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0;
    }
    unint64_t v9 = *a1;
    if (v7 <= *a1)
    {
      unint64_t v14 = a1[3];
      if (v14)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *a1;
      }
      unint64_t v15 = &a1[v7];
      uint64_t v17 = (void *)v15[5];
      uint64_t v16 = v15 + 5;
      uint64_t v2 = v17;
      BOOL v18 = v17 == 0;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          unint64_t v21 = (void *)v16[1];
          ++v16;
          uint64_t v2 = v21;
          BOOL v18 = v21 == 0;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        uint64_t v25 = *v2;
        void *v16 = *v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          uint64_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }
          while (!v28);
          *a1 = v9;
        }
        uint64_t v13 = (*((_DWORD *)v2 + 4) + 1);
LABEL_43:
        unint64_t v29 = a1[2] + v13;
        if (v29 >= a1[1]) {
          unint64_t v29 = a1[1];
        }
        a1[2] = v29;
        unint64_t v30 = a1[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v2 = a1 + 5;
      if (!a1[5])
      {
LABEL_30:
        vm_address_t v24 = GTCoreAlloc(v5);
        uint64_t v2 = (void *)v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *uint64_t v2 = 0;
        v2[3] = v2 + 5;
        return v2;
      }
      unint64_t v10 = a1[3];
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        BOOL v11 = v2;
        uint64_t v2 = (void *)*v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *((unsigned int *)v2 + 4);
        if (v7 <= v12)
        {
          void *v11 = *v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    unint64_t v23 = a1[3];
    if (v23) {
      pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  unint64_t v4 = (unint64_t *)allocator;
  apr_abortfunc_t v5 = abort_fn;
  *newpool = 0;
  if (parent) {
    unint64_t v7 = parent;
  }
  else {
    unint64_t v7 = (apr_pool_t *)global_pool;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    unint64_t v4 = (unint64_t *)*((void *)v7 + 6);
  }
  uint64_t v8 = (apr_pool_t *)allocator_alloc(v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)uint64_t v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = (apr_pool_t *)v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *unint64_t v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      BOOL v11 = v13;
      void v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      unsigned int *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }
    else
    {
      void v9[2] = 0;
      v9[3] = 0;
    }
    apr_status_t v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12);
    }
  }
  return v14;
}

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < size)
  {
LABEL_2:
    unint64_t v4 = (void (*)(uint64_t))*((void *)p + 8);
    if (v4) {
      v4(12);
    }
    return 0;
  }
  unint64_t v6 = (void *)*((void *)p + 11);
  uint64_t result = (void *)v6[3];
  if (v3 <= v6[4] - (void)result)
  {
    v6[3] = (char *)result + v3;
    return result;
  }
  unint64_t v7 = (void *)*v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    *(void *)v7[1] = *v7;
    *(void *)(*v7 + 8) = v7[1];
  }
  else
  {
    unint64_t v7 = allocator_alloc(*((unint64_t **)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7) {
      goto LABEL_2;
    }
  }
  *((_DWORD *)v7 + 5) = 0;
  uint64_t result = (void *)v7[3];
  v7[3] = (char *)result + v3;
  uint64_t v8 = (void *)v6[1];
  v7[1] = v8;
  void *v8 = v7;
  void *v7 = v6;
  v6[1] = v7;
  *((void *)p + 11) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    uint64_t v10 = (uint64_t *)*v6;
    do
      uint64_t v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    void *v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    BOOL v11 = (void *)v10[1];
    v6[1] = v11;
    void *v11 = v6;
    void *v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

void apr_pool_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v8 = (void *)*((void *)p + 5);
    if (v8) {
      *((void *)p + 5) = *v8;
    }
    else {
      uint64_t v8 = apr_palloc(p, 0x20uLL);
    }
    v8[2] = plain_cleanup;
    v8[3] = child_cleanup;
    void *v8 = *((void *)p + 4);
    v8[1] = data;
    *((void *)p + 4) = v8;
  }
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  int v8 = 0;
  if (exitcode) {
    int v5 = 3;
  }
  else {
    int v5 = 2;
  }
  while (1)
  {
    pid_t v6 = waitpid(proc->pid, &v8, v5);
    if ((v6 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }
  if (!v6) {
    return 70006;
  }
  proc->pid = v6;
  if ((~v8 & 0x7F) != 0) {
    return 70005;
  }
  else {
    return 20014;
  }
}

apr_status_t apr_initialize(void)
{
  if (initialized++) {
    return 0;
  }
  if (!apr_pools_initialized++)
  {
    global_allocator = 0;
    vm_address_t v4 = GTCoreAlloc(0xC8uLL);
    if (!v4)
    {
      apr_pools_initialized = 0;
      return 12;
    }
    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(void *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    global_allocator = v4;
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x8000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&global_pool, 0, 0, (apr_allocator_t *)v4);
    if (v5)
    {
      apr_status_t v1 = v5;
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
      global_allocator = 0;
      apr_pools_initialized = 0;
      return v1;
    }
    unint64_t v7 = (apr_pool_t *)global_pool;
    *(void *)(global_pool + 80) = "apr_global_pool";
    if (hash_mutex)
    {
LABEL_20:
      newpool = 0;
      apr_status_t v11 = apr_thread_mutex_create(&newpool, v7, v6);
      if (!v11)
      {
        uint64_t v12 = global_allocator;
        uint64_t v13 = global_pool;
        *(void *)(global_allocator + 24) = newpool;
        *(void *)(v12 + 32) = v13;
        goto LABEL_5;
      }
    }
    else
    {
      int v8 = apr_palloc(v7, 0x38uLL);
      hash_mutex = (uint64_t)v8;
      unint64_t v9 = (void *)*((void *)v7 + 5);
      if (v9) {
        *((void *)v7 + 5) = *v9;
      }
      else {
        unint64_t v9 = apr_palloc(v7, 0x20uLL);
      }
      uint64_t v10 = 0;
      v9[1] = v8;
      void v9[2] = atomic_cleanup;
      v9[3] = apr_pool_cleanup_null;
      *unint64_t v9 = *((void *)v7 + 4);
      *((void *)v7 + 4) = v9;
      while (1)
      {
        apr_status_t v11 = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v10), v7, v6);
        if (v11) {
          break;
        }
        v10 += 8;
        if (v10 == 56)
        {
          LODWORD(v7) = global_pool;
          goto LABEL_20;
        }
      }
    }
    return v11;
  }
LABEL_5:
  newpool = 0;
  if (apr_pool_create_ex(&newpool, 0, 0, 0)) {
    return 20002;
  }
  apr_status_t v1 = 0;
  *((void *)newpool + 10) = "apr_initialize";
  return v1;
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill((pid_t)proc, sig) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  uint64_t v3 = *(void *)&flags;
  apr_status_t v5 = (char *)apr_palloc(*(apr_pool_t **)&flags, 0x48uLL);
  pid_t v6 = (apr_pool_t **)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
  }
  *(void *)apr_status_t v5 = v3;
  apr_status_t result = pthread_mutex_init((pthread_mutex_t *)(v5 + 8), 0);
  if (!result)
  {
    apr_pool_cleanup_register(*v6, v6, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup, apr_pool_cleanup_null);
    apr_status_t result = 0;
    *mutex = (apr_thread_mutex_t *)v6;
  }
  return result;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

id gt_default_log()
{
  if (gt_default_log_onceToken != -1) {
    dispatch_once(&gt_default_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)MEMORY[0x263EF8438];
  return v0;
}

void __gt_default_log_block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_23C048000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v0, 2u);
  }
}

uint64_t GTCorePlatformGet()
{
  return 1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    pid_t v6 = v5;
    if ([v5 hasPrefix:@"kDYFE"])
    {
      uint64_t v7 = [v6 substringFromIndex:5];

      pid_t v6 = (void *)v7;
    }
    uint64_t v8 = [v6 rangeOfString:@"_"];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"_", @" ", 0, v8, v9);

      pid_t v6 = (void *)v10;
    }
    apr_status_t v11 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@":"];

    uint64_t v12 = @"-";
    if (a2) {
      uint64_t v12 = @"+";
    }
    uint64_t v13 = &stru_26EFA73B8;
    if (a3) {
      uint64_t v13 = @":";
    }
    apr_status_t v14 = [NSString stringWithFormat:@"%@[%@%@]", v12, v11, v13];
  }
  else
  {
    apr_status_t v14 = 0;
  }
  return v14;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x270F95FB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x270EE5718]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x270ED8058]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x270ED9C60](a1, a2);
}

pid_t getppid(void)
{
  return MEMORY[0x270ED9CF0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDA180](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDBA98](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x270EDBD48](xarray, index, length);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD78](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}