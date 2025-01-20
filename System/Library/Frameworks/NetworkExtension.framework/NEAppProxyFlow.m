@interface NEAppProxyFlow
+ (CFErrorRef)convertFlowErrorToCFError:(uint64_t)a1;
+ (NSObject)copyRemoteEndpointFromFlow:;
+ (id)errorForFlowError:(uint64_t)a1;
- (BOOL)isBound;
- (NEAppProxyFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NEFlowMetaData)metaData;
- (NSData)applicationData;
- (NSString)remoteHostname;
- (id)description;
- (nw_interface_t)networkInterface;
- (uint64_t)clearEventHandlers;
- (unint64_t)hash;
- (void)closeReadWithError:(NSError *)error;
- (void)closeWriteWithError:(NSError *)error;
- (void)dealloc;
- (void)openWithLocalEndpoint:(NWHostEndpoint *)localEndpoint completionHandler:(void *)completionHandler;
- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4;
- (void)setApplicationData:(id)a3;
- (void)setIsBound:(BOOL)a3;
- (void)setMetadata:(nw_parameters_t)parameters;
- (void)setNetworkInterface:(nw_interface_t)networkInterface;
@end

@implementation NEAppProxyFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__networkInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteHostname, 0);

  objc_storeStrong((id *)&self->_metaData, 0);
}

- (void)setIsBound:(BOOL)a3
{
  self->_isBound = a3;
}

- (BOOL)isBound
{
  return self->_isBound;
}

- (NSString)remoteHostname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NEFlowMetaData)metaData
{
  return (NEFlowMetaData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(nw_parameters_t)parameters
{
  v4 = (objc_class *)MEMORY[0x1E4F28DB0];
  v5 = parameters;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  v6 = [(NEAppProxyFlow *)self metaData];
  [v9 encodeObject:v6 forKey:@"MetaData"];

  [v9 finishEncoding];
  id v7 = [v9 encodedData];
  xpc_object_t v8 = xpc_data_create((const void *)[v7 bytes], objc_msgSend(v7, "length"));
  nw_parameters_set_metadata();
}

- (void)setNetworkInterface:(nw_interface_t)networkInterface
{
  if (networkInterface)
  {
    v4 = networkInterface;
    nw_interface_get_index(v4);
    v5 = (void *)nw_interface_create_with_index();
    id v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 48);

      Property = objc_getProperty(self, v8, 48, 1);
    }
    else
    {

      Property = 0;
    }
    id v10 = (id)[objc_alloc(NSNumber) initWithUnsignedInt:nw_interface_get_index(Property)];
    NEFlowSetProperty();
  }
}

- (nw_interface_t)networkInterface
{
  if (self)
  {
    self = (NEAppProxyFlow *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return (nw_interface_t)self;
}

- (void)setApplicationData:(id)a3
{
}

- (NSData)applicationData
{
  uint64_t v2 = (void *)NEFlowCopyProperty();

  return (NSData *)v2;
}

- (void)closeWriteWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = error;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    SEL v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "closing write on flow %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4) {
    CFErrorRef v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)NEAppProxyFlow, v4);
  }
  else {
    CFErrorRef v6 = 0;
  }
  NEFlowWriteClose();
  if (v6) {
    CFRelease(v6);
  }
}

+ (CFErrorRef)convertFlowErrorToCFError:(uint64_t)a1
{
  id v2 = a2;
  self;
  switch([v2 code])
  {
    case 1:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 1;
      break;
    case 2:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 2;
      break;
    case 3:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 3;
      break;
    case 4:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 4;
      break;
    case 5:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 5;
      break;
    case 6:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 6;
      break;
    case 7:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 7;
      break;
    case 9:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 100;
      break;
    case 10:
      CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v4 = @"NEAppProxyFlowErrorDomain";
      CFIndex v5 = 101;
      break;
    default:
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D160];
      CFIndex v5 = [v2 code];
      CFAllocatorRef v3 = v6;
      CFStringRef v4 = v7;
      break;
  }
  CFErrorRef v8 = CFErrorCreate(v3, v4, v5, 0);

  return v8;
}

- (void)closeReadWithError:(NSError *)error
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = error;
  CFIndex v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    CFErrorRef v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "closing read on flow %@ with error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4) {
    CFErrorRef v6 = +[NEAppProxyFlow convertFlowErrorToCFError:]((uint64_t)NEAppProxyFlow, v4);
  }
  else {
    CFErrorRef v6 = 0;
  }
  NEFlowReadClose();
  if (v6) {
    CFRelease(v6);
  }
}

- (void)openWithLocalEndpoint:(NWHostEndpoint *)localEndpoint completionHandler:(void *)completionHandler
{
  CFErrorRef v6 = completionHandler;
  id v7 = (id)[(NWHostEndpoint *)localEndpoint copyCEndpoint];
  [(NEAppProxyFlow *)self openWithLocalFlowEndpoint:v7 completionHandler:v6];
}

- (void)openWithLocalFlowEndpoint:(id)a3 completionHandler:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  CFErrorRef v6 = a3;
  id v7 = a4;
  CFErrorRef v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v47 = self;
    __int16 v48 = 2112;
    v49 = v6;
    _os_log_debug_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEBUG, "opening flow %@ with local %@", buf, 0x16u);
  }

  __int16 v9 = self;
  objc_sync_enter(v9);
  if (v6)
  {
    address = nw_endpoint_get_address(v6);
    if (address)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:address length:address->sa_len];
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (!NEFlowSetProperty())
    {

      goto LABEL_19;
    }
    v12 = (void *)NEFlowCopyProperty();
    if (isa_nsnumber(v12))
    {
      [v12 unsignedIntValue];
      v14 = (void *)nw_interface_create_with_index();
      if (v9) {
        objc_setProperty_atomic(v9, v13, v14, 48);
      }
    }
  }
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke;
  v43 = &unk_1E598EF48;
  id v15 = v7;
  v44 = v9;
  id v45 = v15;
  BOOL v16 = NEFlowSetEventHandler() == 0;

  if (v16) {
    goto LABEL_19;
  }
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2;
  v37 = &unk_1E598EF48;
  id v17 = v15;
  v38 = v9;
  id v39 = v17;
  BOOL v18 = NEFlowSetEventHandler() == 0;

  if (v18) {
    goto LABEL_19;
  }
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3;
  v31 = &unk_1E598EF48;
  v32 = v9;
  id v33 = v17;
  BOOL v19 = NEFlowSetEventHandler() == 0;

  if (v19 || !NEFlowOpen())
  {
LABEL_19:
    -[NEAppProxyFlow clearEventHandlers]((uint64_t)v9);
    v20 = (void *)NEFlowCopyError();
    v22 = v20;
    if (v20)
    {
      uint64_t v23 = [v20 code];
      if (v9)
      {
LABEL_21:
        Property = objc_getProperty(v9, v21, 40, 1);
LABEL_22:
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4;
        v25[3] = &unk_1E5992D18;
        id v26 = v7;
        uint64_t v27 = v23;
        dispatch_async(Property, v25);

        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v23 = 0;
      if (v9) {
        goto LABEL_21;
      }
    }
    Property = 0;
    goto LABEL_22;
  }
LABEL_23:
  objc_sync_exit(v9);
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);

  return -[NEAppProxyFlow clearEventHandlers](v2);
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  CFAllocatorRef v3 = +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 5);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  return -[NEAppProxyFlow clearEventHandlers](v4);
}

uint64_t __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  CFAllocatorRef v3 = +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 5);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  uint64_t v4 = *(void *)(a1 + 32);

  return -[NEAppProxyFlow clearEventHandlers](v4);
}

- (uint64_t)clearEventHandlers
{
  if (result)
  {
    NEFlowSetEventHandler();
    NEFlowSetEventHandler();
    return NEFlowSetEventHandler();
  }
  return result;
}

void __62__NEAppProxyFlow_openWithLocalFlowEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)errorForFlowError:(uint64_t)a1
{
  v34[1] = *MEMORY[0x1E4F143B8];
  self;
  switch(a2)
  {
    case 1:
      CFAllocatorRef v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34[0] = @"The operation could not be completed because the flow is not connected";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      CFIndex v5 = v3;
      uint64_t v6 = 1;
      goto LABEL_13;
    case 2:
      CFErrorRef v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = @"The peer closed the flow";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      CFIndex v5 = v8;
      uint64_t v6 = 2;
      goto LABEL_13;
    case 3:
      __int16 v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      uint64_t v28 = @"The destination could host could not be reached";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      CFIndex v5 = v9;
      uint64_t v6 = 3;
      goto LABEL_13;
    case 4:
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30 = @"An invalid argument was passed";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      CFIndex v5 = v10;
      uint64_t v6 = 4;
      goto LABEL_13;
    case 5:
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22 = @"The flow was aborted";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      CFIndex v5 = v11;
      uint64_t v6 = 5;
      goto LABEL_13;
    case 6:
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24 = @"The flow was refused";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      CFIndex v5 = v12;
      uint64_t v6 = 6;
      goto LABEL_13;
    case 7:
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v26 = @"The flow timed out";
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      CFIndex v5 = v13;
      uint64_t v6 = 7;
      goto LABEL_13;
    default:
      if (a2 == 100)
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F28568];
        v20 = @"The datagram was too large";
        uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        CFIndex v5 = v14;
        uint64_t v6 = 9;
        goto LABEL_13;
      }
      if (a2 == 101)
      {
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28568];
        BOOL v18 = @"A read operation is already pending";
        uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        CFIndex v5 = v7;
        uint64_t v6 = 10;
LABEL_13:
        id v15 = [v5 errorWithDomain:@"NEAppProxyFlowErrorDomain" code:v6 userInfo:v4];

        goto LABEL_14;
      }
      id v15 = 0;
LABEL_14:
      return v15;
  }
}

- (id)description
{
  id v2 = (__CFString *)CFCopyDescription(self->_flow);

  return v2;
}

- (unint64_t)hash
{
  if (self) {
    self = (NEAppProxyFlow *)self->_flow;
  }
  return CFHash(self);
}

- (void)dealloc
{
  id v2 = self;
  if (self) {
    self = (NEAppProxyFlow *)self->_flow;
  }
  CFRelease(self);
  v3.receiver = v2;
  v3.super_class = (Class)NEAppProxyFlow;
  [(NEAppProxyFlow *)&v3 dealloc];
}

- (NEAppProxyFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)NEAppProxyFlow;
  CFErrorRef v8 = [(NEAppProxyFlow *)&v39 init];
  if (!v8) {
    goto LABEL_23;
  }
  v8->_flow = (_NEFlow *)CFRetain(a3);
  objc_storeStrong((id *)&v8->_queue, a4);
  __int16 v9 = [(NEAppProxyFlow *)v8 applicationData];
  if (!isa_nsdata(v9)) {
    goto LABEL_6;
  }
  id v38 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:&v38];
  id v11 = v38;
  if (v11)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

LABEL_6:
      v13 = [NEFlowMetaData alloc];
      if (v13)
      {
        v40.receiver = v13;
        v40.super_class = (Class)NEFlowMetaData;
        v14 = [(NEAppProxyFlow *)&v40 init];
        if (v14)
        {
          uint64_t v15 = NEFlowCopyProperty();
          remoteHostname = v14->_remoteHostname;
          v14->_remoteHostname = (NSString *)v15;

          uint64_t v17 = NEFlowCopyProperty();
          metaData = v14->_metaData;
          v14->_metaData = (NEFlowMetaData *)v17;

          uint64_t v19 = NEFlowCopyProperty();
          flow = v14->_flow;
          v14->_flow = (_NEFlow *)v19;

          uint64_t v21 = (void *)NEFlowCopyProperty();
          if (isa_nsnumber(v21))
          {
            v14->_isBound = ([v21 unsignedIntValue] & 2) != 0;
            *(&v14->_isBound + 1) = ([v21 unsignedIntValue] & 4) != 0;
          }
          v22 = (void *)NEFlowCopyProperty();
          if (isa_nsdata(v22) && [v22 length] == 16)
          {
            uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v22, "bytes"));
            queue = v14->_queue;
            v14->_queue = (OS_dispatch_queue *)v23;
          }
        }
      }
      else
      {
        v14 = 0;
      }
      uint64_t v25 = 0;
      id v26 = v8->_metaData;
      v8->_metaData = (NEFlowMetaData *)v14;
      goto LABEL_15;
    }
    LODWORD(v40.receiver) = 138412290;
    *(id *)((char *)&v40.receiver + 4) = v11;
    uint64_t v35 = "Failed to decode the application data: %@";
    v36 = v12;
    uint32_t v37 = 12;
LABEL_29:
    _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v40, v37);
    goto LABEL_5;
  }
  uint64_t v33 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"MetaData"];
  if (!v33)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    LOWORD(v40.receiver) = 0;
    uint64_t v35 = "Failed to decode the meta data from the application data";
    v36 = v12;
    uint32_t v37 = 2;
    goto LABEL_29;
  }
  uint64_t v34 = (void *)v33;

  uint64_t v25 = v34;
  id v26 = v8->_metaData;
  v8->_metaData = v25;
LABEL_15:

  NEFlowSetDispatchQueue();
  uint64_t v27 = (void *)NEFlowCopyProperty();
  if (isa_nsnumber(v27) && ([v27 unsignedIntValue] & 8) != 0) {
    [(NEAppProxyFlow *)v8 setIsBound:1];
  }
  uint64_t v28 = (void *)NEFlowCopyProperty();
  if (isa_nsnumber(v28))
  {
    [v28 unsignedIntValue];
    uint64_t v29 = (void *)nw_interface_create_with_index();
    objc_setProperty_atomic(v8, v30, v29, 48);
  }
  uint64_t v31 = (void *)NEFlowCopyProperty();
  if (isa_nsstring(v31)) {
    objc_storeStrong((id *)&v8->_remoteHostname, v31);
  }

LABEL_23:
  return v8;
}

+ (NSObject)copyRemoteEndpointFromFlow:
{
  self;
  v0 = (void *)NEFlowCopyProperty();
  if (isa_nsdata(v0))
  {
    address = nw_endpoint_create_address((const sockaddr *)[v0 bytes]);
    id v2 = (sockaddr *)nw_endpoint_get_address(address);
    if (NEIsWildcardAddress(&v2->sa_len))
    {
      nw_endpoint_get_port(address);
    }
    else if (address)
    {
      goto LABEL_9;
    }
  }
  objc_super v3 = (void *)NEFlowCopyProperty();
  if (isa_nsstring(v3))
  {
    [v3 UTF8String];
    address = nw_endpoint_create_host_with_numeric_port();
  }
  else
  {
    address = 0;
  }

LABEL_9:
  return address;
}

@end