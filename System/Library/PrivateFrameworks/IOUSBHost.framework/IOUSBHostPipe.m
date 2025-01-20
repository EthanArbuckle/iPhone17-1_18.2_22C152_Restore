@interface IOUSBHostPipe
- (BOOL)abortWithError:(NSError *)error;
- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)adjustPipeWithDescriptors:(const IOUSBHostIOSourceDescriptors *)descriptors error:(NSError *)error;
- (BOOL)clearStallWithError:(NSError *)error;
- (BOOL)disableStreamsWithError:(NSError *)error;
- (BOOL)enableStreamsWithError:(NSError *)error;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error completionHandler:(IOUSBHostIsochronousCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error completionHandler:(IOUSBHostIsochronousTransactionCompletionHandler)completionHandler;
- (BOOL)enqueueIORequestWithData:(id)a3 frameList:(IOUSBHostIsochronousFrame *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 completionHandler:(id)a9 version:(unint64_t)a10;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error;
- (BOOL)sendIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error;
- (BOOL)sendIORequestWithData:(id)a3 frameList:(void *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 version:(unint64_t)a9;
- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error;
- (BOOL)streamsEnabled;
- (IOUSBHostPipe)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7;
- (IOUSBHostStream)copyStreamWithStreamID:(NSUInteger)streamID error:(NSError *)error;
- (NSData)currentDescriptorsCache;
- (NSData)originalDescriptorsCache;
- (NSMutableSet)invalidDescriptorCache;
- (NSTimeInterval)idleTimeout;
- (const)descriptors;
- (const)ioSourceDescriptorsWithOption:(unint64_t)a3;
- (const)originalDescriptors;
- (void)setCurrentDescriptorsCache:(id)a3;
- (void)setInvalidDescriptorCache:(id)a3;
- (void)setOriginalDescriptorsCache:(id)a3;
- (void)setStreamsEnabled:(BOOL)a3;
@end

@implementation IOUSBHostPipe

- (IOUSBHostPipe)initWithHostInterface:(id)a3 endpointAddress:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6 deviceAddress:(unint64_t)a7
{
  v12.receiver = self;
  v12.super_class = (Class)IOUSBHostPipe;
  v7 = [(IOUSBHostIOSource *)&v12 initWithHostInterface:a3 endpointAddress:a4 ioConnection:*(void *)&a5 ioNotificationPortRef:a6 deviceAddress:a7];
  v8 = v7;
  if (v7)
  {
    [(IOUSBHostPipe *)v7 setStreamsEnabled:0];
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:1];
    [(IOUSBHostPipe *)v8 setInvalidDescriptorCache:v9];

    v10 = [(IOUSBHostPipe *)v8 invalidDescriptorCache];

    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (const)originalDescriptors
{
  return [(IOUSBHostPipe *)self ioSourceDescriptorsWithOption:0];
}

- (const)descriptors
{
  return [(IOUSBHostPipe *)self ioSourceDescriptorsWithOption:1];
}

- (const)ioSourceDescriptorsWithOption:(unint64_t)a3
{
  kern_return_t v9;
  const IOUSBHostIOSourceDescriptors *v10;
  id v11;
  const IOUSBHostIOSourceDescriptors *v12;
  id v14;
  void *v15;
  size_t v16;
  uint64_t input[3];

  input[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = [(IOUSBHostPipe *)self currentDescriptorsCache];
  }
  else
  {
    v5 = [(IOUSBHostPipe *)self originalDescriptorsCache];

    if (v5)
    {
      v11 = [(IOUSBHostPipe *)self originalDescriptorsCache];
      objc_super v12 = (const IOUSBHostIOSourceDescriptors *)[v11 bytes];

      return v12;
    }
  }
  v16 = 24;
  v6 = [MEMORY[0x263EFF990] dataWithLength:24];
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = a3;
  mach_port_t v7 = [(IOUSBHostIOSource *)self ioConnection];
  id v8 = v6;
  v9 = IOConnectCallMethod(v7, 0x11u, input, 2u, 0, 0, 0, 0, (void *)[v8 mutableBytes], &v16);
  v10 = 0;
  if (!v9)
  {
    if ([v8 isEqualToData:v5])
    {
      v10 = (const IOUSBHostIOSourceDescriptors *)[v5 bytes];
    }
    else
    {
      v14 = v8;
      v10 = (const IOUSBHostIOSourceDescriptors *)[v14 bytes];
      if (v5)
      {
        v15 = [(IOUSBHostPipe *)self invalidDescriptorCache];
        [v15 addObject:v5];
      }
      if (a3) {
        [(IOUSBHostPipe *)self setCurrentDescriptorsCache:v14];
      }
      else {
        [(IOUSBHostPipe *)self setOriginalDescriptorsCache:v14];
      }
    }
  }

  return v10;
}

- (BOOL)adjustPipeWithDescriptors:(const IOUSBHostIOSourceDescriptors *)descriptors error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t input;
  void v17[3];
  void v18[4];

  v18[3] = *MEMORY[0x263EF8340];
  input = [(IOUSBHostIOSource *)self endpointAddress];
  mach_port_t v7 = IOConnectCallMethod([(IOUSBHostIOSource *)self ioConnection], 0xDu, &input, 1u, descriptors, 0x18uLL, 0, 0, 0, 0);
  if (v7 && error)
  {
    v17[0] = *MEMORY[0x263F08320];
    id v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 localizedStringForKey:@"Unable to adjust pipe." value:&stru_26DBD82D0 table:0];
    v18[0] = v9;
    v17[1] = *MEMORY[0x263F08338];
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[1] = v11;
    v17[2] = *MEMORY[0x263F08348];
    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[2] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe adjustPipeWithDescriptors:error:]();
    }
  }
  return v7 == 0;
}

- (NSTimeInterval)idleTimeout
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t output = 0;
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  uint32_t outputCnt = 1;
  uint64_t v3 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0xFu, input, 1u, &output, &outputCnt);
  if (v3)
  {
    uint64_t v4 = v3;
    double v5 = 0.0;
    if ([(IOUSBHostIOSource *)self debugLoggingMask]) {
      NSLog(&cfstr_LineDOfSSconne.isa, 183, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostPipe.m", "-[IOUSBHostPipe idleTimeout]", v4);
    }
  }
  else
  {
    double v5 = (double)output;
  }
  return v5 / 1000.0;
}

- (BOOL)setIdleTimeout:(NSTimeInterval)idleTimeout error:(NSError *)error
{
  kern_return_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t input[2];
  void v19[3];
  void v20[4];

  v20[3] = *MEMORY[0x263EF8340];
  NSUInteger v7 = [(IOUSBHostIOSource *)self endpointAddress];
  id v8 = &off_2279B3000;
  LODWORD(v8) = vcvtad_u64_f64(idleTimeout * 1000.0);
  input[0] = v7;
  input[1] = (uint64_t)v8;
  v9 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0xEu, input, 2u, 0, 0);
  if (v9 && error)
  {
    v19[0] = *MEMORY[0x263F08320];
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:@"Unable to set an idle timeout." value:&stru_26DBD82D0 table:0];
    v20[0] = v11;
    v19[1] = *MEMORY[0x263F08338];
    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v20[1] = v13;
    v19[2] = *MEMORY[0x263F08348];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v20[2] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v9 userInfo:v16];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe setIdleTimeout:error:]();
    }
  }
  return v9 == 0;
}

- (BOOL)clearStallWithError:(NSError *)error
{
  kern_return_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void v14[3];
  void v15[4];

  v15[3] = *MEMORY[0x263EF8340];
  uint64_t v4 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x10u, &v13, 1u, 0, 0);
  if (v4 && error)
  {
    v14[0] = *MEMORY[0x263F08320];
    double v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 localizedStringForKey:@"Unable to clear stall." value:&stru_26DBD82D0 table:0];
    v15[0] = v6;
    v14[1] = *MEMORY[0x263F08338];
    NSUInteger v7 = [MEMORY[0x263F086E0] mainBundle];
    id v8 = [v7 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v15[1] = v8;
    v14[2] = *MEMORY[0x263F08348];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v15[2] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v4 userInfo:v11];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe clearStallWithError:]();
    }
  }
  return v4 == 0;
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return [(IOUSBHostPipe *)self sendControlRequest:request data:0 bytesTransferred:0 completionTimeout:error error:5.0];
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return [(IOUSBHostPipe *)self sendControlRequest:request data:data bytesTransferred:bytesTransferred completionTimeout:error error:5.0];
}

- (BOOL)sendControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v16;
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint32_t outputCnt;
  uint64_t input[8];
  void v29[3];
  void v30[5];

  v30[3] = *MEMORY[0x263EF8340];
  uint64_t wLength = request.wLength;
  v13 = data;
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = request.bmRequestType;
  uint64_t input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  v14 = &off_2279B3000;
  LODWORD(v14) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v14;
  if (v13) {
    uint64_t v15 = [(NSMutableData *)v13 mutableBytes];
  }
  else {
    uint64_t v15 = 0;
  }
  input[7] = v15;
  uint32_t outputCnt = 1;
  v16 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x12u, input, 8u, &v26, &outputCnt);
  v17 = v16;
  if (bytesTransferred) {
    *bytesTransferred = v26;
  }
  if (v16 && error)
  {
    v29[0] = *MEMORY[0x263F08320];
    v18 = [MEMORY[0x263F086E0] mainBundle];
    v19 = [v18 localizedStringForKey:@"Unable to send control request." value:&stru_26DBD82D0 table:0];
    v30[0] = v19;
    v29[1] = *MEMORY[0x263F08338];
    v20 = [MEMORY[0x263F086E0] mainBundle];
    v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v30[1] = v21;
    v29[2] = *MEMORY[0x263F08348];
    v22 = [MEMORY[0x263F086E0] mainBundle];
    v23 = [v22 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v30[2] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v17 userInfo:v24];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe sendControlRequest:data:bytesTransferred:completionTimeout:error:]();
    }
  }
  return v17 == 0;
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return [(IOUSBHostPipe *)self enqueueControlRequest:request data:0 completionTimeout:error error:completionHandler completionHandler:5.0];
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return [(IOUSBHostPipe *)self enqueueControlRequest:request data:data completionTimeout:error error:completionHandler completionHandler:5.0];
}

- (BOOL)enqueueControlRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSError **v31;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  long long v35;
  long long v36;
  long long v37;
  uint64_t input[8];
  void v39[3];
  void v40[5];

  v40[3] = *MEMORY[0x263EF8340];
  uint64_t wLength = request.wLength;
  v13 = data;
  IOUSBHostCompletionHandler v14 = completionHandler;
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = request.bmRequestType;
  uint64_t input[2] = request.bRequest;
  input[3] = request.wValue;
  input[4] = request.wIndex;
  input[5] = wLength;
  uint64_t v15 = &off_2279B3000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[6] = (uint64_t)v15;
  if (v13) {
    uint64_t v16 = [(NSMutableData *)v13 mutableBytes];
  }
  else {
    uint64_t v16 = 0;
  }
  input[7] = v16;
  uint32_t outputCnt = 1;
  uint64_t output = 0;
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36 = v17;
  v37 = v17;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v35 = v17;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v14)
  {
    uint64_t v18 = MEMORY[0x22A681190](v14);
  }
  else
  {
    uint64_t v18 = 0;
  }
  *(void *)&v35 = v18;
  mach_port_t v19 = [(IOUSBHostIOSource *)self ioConnection];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostIOSource *)self ioNotificationPortRef]);
  v21 = IOConnectCallAsyncScalarMethod(v19, 0x12u, MachPort, reference, 3u, input, 8u, &output, &outputCnt);
  if (v21)
  {
    v22 = (void *)v35;
    if (error)
    {
      v39[0] = *MEMORY[0x263F08320];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v31 = error;
      v24 = [v23 localizedStringForKey:@"Unable to enqueue control request." value:&stru_26DBD82D0 table:0];
      v40[0] = v24;
      v39[1] = *MEMORY[0x263F08338];
      v25 = [MEMORY[0x263F086E0] mainBundle];
      v26 = [v25 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v40[1] = v26;
      v39[2] = *MEMORY[0x263F08348];
      v27 = [MEMORY[0x263F086E0] mainBundle];
      v28 = [v27 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v40[2] = v28;
      v29 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];

      *v31 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v21 userInfo:v29];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe enqueueControlRequest:data:completionTimeout:error:completionHandler:]();
      }
    }
  }

  return v21 == 0;
}

- (BOOL)abortWithError:(NSError *)error
{
  return [(IOUSBHostPipe *)self abortWithOption:1 error:error];
}

- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
{
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t input[2];
  void v17[3];
  void v18[4];

  v18[3] = *MEMORY[0x263EF8340];
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = option;
  NSUInteger v7 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x13u, input, 2u, 0, 0);
  if (v7 && error)
  {
    v17[0] = *MEMORY[0x263F08320];
    id v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 localizedStringForKey:@"Unable to abort IO." value:&stru_26DBD82D0 table:0];
    v18[0] = v9;
    v17[1] = *MEMORY[0x263F08338];
    v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[1] = v11;
    v17[2] = *MEMORY[0x263F08348];
    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[2] = v13;
    IOUSBHostCompletionHandler v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe abortWithOption:error:]();
    }
  }
  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  void v30[3];
  void v31[4];

  v31[3] = *MEMORY[0x263EF8340];
  v10 = data;
  v11 = v10;
  if (v10)
  {
    objc_super v12 = v10;
    uint64_t v13 = [(NSMutableData *)v12 mutableBytes];
    uint64_t v14 = [(NSMutableData *)v12 length];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(IOUSBHostIOSource *)self endpointAddress];
  uint64_t v16 = &off_2279B3000;
  LODWORD(v16) = vcvtad_u64_f64(completionTimeout * 1000.0);
  input[0] = v15;
  input[1] = v14;
  uint64_t input[2] = (uint64_t)v16;
  input[3] = v13;
  uint32_t outputCnt = 1;
  uint64_t output = 0;
  long long v17 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x14u, input, 4u, &output, &outputCnt);
  uint64_t v18 = v17;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  if (v17 && error)
  {
    v30[0] = *MEMORY[0x263F08320];
    mach_port_t v19 = [MEMORY[0x263F086E0] mainBundle];
    v20 = [v19 localizedStringForKey:@"Unable to send IO." value:&stru_26DBD82D0 table:0];
    v31[0] = v20;
    v30[1] = *MEMORY[0x263F08338];
    v21 = [MEMORY[0x263F086E0] mainBundle];
    v22 = [v21 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v31[1] = v22;
    v30[2] = *MEMORY[0x263F08348];
    v23 = [MEMORY[0x263F086E0] mainBundle];
    v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v31[2] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v18 userInfo:v25];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:]();
    }
  }
  return v18 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSError **v30;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  long long v34;
  long long v35;
  long long v36;
  uint64_t input[4];
  void v38[3];
  void v39[5];

  v39[3] = *MEMORY[0x263EF8340];
  v10 = data;
  IOUSBHostCompletionHandler v11 = completionHandler;
  if (v10)
  {
    objc_super v12 = v10;
    uint64_t v13 = [(NSMutableData *)v12 mutableBytes];
    uint64_t v14 = [(NSMutableData *)v12 length];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = v14;
  NSUInteger v15 = &off_2279B3000;
  LODWORD(v15) = vcvtad_u64_f64(completionTimeout * 1000.0);
  uint64_t input[2] = (uint64_t)v15;
  input[3] = v13;
  uint32_t outputCnt = 1;
  uint64_t output = 0;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35 = v16;
  v36 = v16;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v34 = v16;
  reference[1] = (uint64_t)_ioCompletionCallback_0;
  if (v11)
  {
    uint64_t v17 = MEMORY[0x22A681190](v11);
  }
  else
  {
    uint64_t v17 = 0;
  }
  *(void *)&v34 = v17;
  mach_port_t v18 = [(IOUSBHostIOSource *)self ioConnection];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostIOSource *)self ioNotificationPortRef]);
  v20 = IOConnectCallAsyncScalarMethod(v18, 0x14u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v20)
  {
    v21 = (void *)v34;
    if (error)
    {
      v38[0] = *MEMORY[0x263F08320];
      v22 = [MEMORY[0x263F086E0] mainBundle];
      v23 = [v22 localizedStringForKey:@"Unable to enqueue IO." value:&stru_26DBD82D0 table:0];
      v39[0] = v23;
      v38[1] = *MEMORY[0x263F08338];
      [MEMORY[0x263F086E0] mainBundle];
      v24 = v30 = error;
      v25 = [v24 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v39[1] = v25;
      v38[2] = *MEMORY[0x263F08348];
      v26 = [MEMORY[0x263F086E0] mainBundle];
      v27 = [v26 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v39[2] = v27;
      v28 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

      *v30 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v20 userInfo:v28];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:]();
      }
    }
  }

  return v20 == 0;
}

- (BOOL)sendIORequestWithData:(id)a3 frameList:(void *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 version:(unint64_t)a9
{
  kern_return_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t input[8];
  void v32[3];
  void v33[4];

  v33[3] = *MEMORY[0x263EF8340];
  id v15 = a3;
  long long v16 = v15;
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = [v17 mutableBytes];
    uint64_t v19 = [v17 length];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = (uint64_t)a4;
  uint64_t input[2] = a5;
  input[3] = v18;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a9;
  if (a9 == 1)
  {
    uint32_t v20 = 21;
  }
  else
  {
    if (a9 != 2)
    {
      v21 = -536870199;
      goto LABEL_11;
    }
    uint32_t v20 = 26;
  }
  v21 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], v20, input, 8u, 0, 0);
  if (!v21)
  {
    v22 = 1;
    goto LABEL_16;
  }
LABEL_11:
  if (a8)
  {
    v32[0] = *MEMORY[0x263F08320];
    v23 = [MEMORY[0x263F086E0] mainBundle];
    v24 = [v23 localizedStringForKey:@"Unable to send IO." value:&stru_26DBD82D0 table:0];
    v33[0] = v24;
    v32[1] = *MEMORY[0x263F08338];
    v25 = [MEMORY[0x263F086E0] mainBundle];
    v26 = [v25 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v33[1] = v26;
    v32[2] = *MEMORY[0x263F08348];
    v27 = [MEMORY[0x263F086E0] mainBundle];
    v28 = [v27 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v33[2] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

    *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v21 userInfo:v29];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe sendIORequestWithData:bytesTransferred:completionTimeout:error:]();
    }
  }
  v22 = 0;
LABEL_16:

  return v22;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error
{
  return [(IOUSBHostPipe *)self sendIORequestWithData:data frameList:frameList frameListCount:frameListCount firstFrameNumber:firstFrameNumber options:0 error:error version:1];
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error
{
  return [(IOUSBHostPipe *)self sendIORequestWithData:data frameList:transactionList frameListCount:transactionListCount firstFrameNumber:firstFrameNumber options:*(void *)&options error:error version:2];
}

- (BOOL)enqueueIORequestWithData:(id)a3 frameList:(IOUSBHostIsochronousFrame *)a4 frameListCount:(unint64_t)a5 firstFrameNumber:(unint64_t)a6 options:(unsigned int)a7 error:(id *)a8 completionHandler:(id)a9 version:(unint64_t)a10
{
  kern_return_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v39;
  uint64_t reference[2];
  long long v41;
  long long v42;
  long long v43;
  uint64_t input[8];
  void v45[3];
  void v46[5];

  v46[3] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a9;
  id v17 = v15;
  if (v15)
  {
    id v18 = v15;
    id v15 = (id)[v18 mutableBytes];
    uint64_t v19 = [v18 length];
  }
  else
  {
    uint64_t v19 = 0;
  }
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = (uint64_t)a4;
  uint64_t input[2] = a5;
  input[3] = (uint64_t)v15;
  input[4] = v19;
  input[5] = a6;
  input[6] = a7;
  input[7] = a10;
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42 = v20;
  v43 = v20;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v41 = v20;
  reference[1] = (uint64_t)_isochCompletionCallback;
  if (v16)
  {
    v21 = (void *)MEMORY[0x22A681190](v16);
  }
  else
  {
    v21 = 0;
  }
  v22 = v17;
  *(void *)&v41 = v21;
  if (a10 == 1)
  {
    uint32_t v23 = 21;
  }
  else
  {
    if (a10 != 2)
    {
      v28 = -536870199;
      v24 = a8;
      if (!a8) {
        goto LABEL_18;
      }
LABEL_15:
      v39 = v22;
      v45[0] = *MEMORY[0x263F08320];
      v29 = [MEMORY[0x263F086E0] mainBundle];
      v30 = [v29 localizedStringForKey:@"Unable to enqueue IO." value:&stru_26DBD82D0 table:0];
      v46[0] = v30;
      v45[1] = *MEMORY[0x263F08338];
      v31 = [MEMORY[0x263F086E0] mainBundle];
      v32 = [v31 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v46[1] = v32;
      v45[2] = *MEMORY[0x263F08348];
      v33 = [MEMORY[0x263F086E0] mainBundle];
      v34 = [v33 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v46[2] = v34;
      v35 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];

      id *v24 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v28 userInfo:v35];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe enqueueIORequestWithData:completionTimeout:error:completionHandler:]();
      }

      v22 = v39;
      goto LABEL_18;
    }
    uint32_t v23 = 26;
  }
  v24 = a8;
  mach_port_t v25 = [(IOUSBHostIOSource *)self ioConnection];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostIOSource *)self ioNotificationPortRef]);
  v27 = IOConnectCallAsyncMethod(v25, v23, MachPort, reference, 3u, input, 8u, 0, 0, 0, 0, 0, 0);
  if (!v27)
  {
    v36 = 1;
    goto LABEL_20;
  }
  v21 = (void *)v41;
  v28 = v27;
  if (a8) {
    goto LABEL_15;
  }
LABEL_18:

  v36 = 0;
LABEL_20:

  return v36;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data frameList:(IOUSBHostIsochronousFrame *)frameList frameListCount:(NSUInteger)frameListCount firstFrameNumber:(uint64_t)firstFrameNumber error:(NSError *)error completionHandler:(IOUSBHostIsochronousCompletionHandler)completionHandler
{
  return [(IOUSBHostPipe *)self enqueueIORequestWithData:data frameList:frameList frameListCount:frameListCount firstFrameNumber:firstFrameNumber options:0 error:error completionHandler:completionHandler version:1];
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data transactionList:(IOUSBHostIsochronousTransaction *)transactionList transactionListCount:(NSUInteger)transactionListCount firstFrameNumber:(uint64_t)firstFrameNumber options:(IOUSBHostIsochronousTransferOptions)options error:(NSError *)error completionHandler:(IOUSBHostIsochronousTransactionCompletionHandler)completionHandler
{
  return [(IOUSBHostPipe *)self enqueueIORequestWithData:data frameList:transactionList frameListCount:transactionListCount firstFrameNumber:firstFrameNumber options:*(void *)&options error:error completionHandler:completionHandler version:2];
}

- (BOOL)enableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void v15[3];
  void v16[4];

  v16[3] = *MEMORY[0x263EF8340];
  double v5 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x16u, &v14, 1u, 0, 0);
  if (v5)
  {
    if (error)
    {
      v15[0] = *MEMORY[0x263F08320];
      v6 = [MEMORY[0x263F086E0] mainBundle];
      NSUInteger v7 = [v6 localizedStringForKey:@"Unable to enable streams." value:&stru_26DBD82D0 table:0];
      v16[0] = v7;
      v15[1] = *MEMORY[0x263F08338];
      id v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = [v8 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v16[1] = v9;
      v15[2] = *MEMORY[0x263F08348];
      v10 = [MEMORY[0x263F086E0] mainBundle];
      IOUSBHostCompletionHandler v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v16[2] = v11;
      objc_super v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v5 userInfo:v12];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe enableStreamsWithError:]();
      }
    }
  }
  else
  {
    [(IOUSBHostPipe *)self setStreamsEnabled:1];
  }
  return v5 == 0;
}

- (BOOL)disableStreamsWithError:(NSError *)error
{
  kern_return_t v5;
  BOOL v6;
  kern_return_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x263EF8340];
  if ([(IOUSBHostPipe *)self streamsEnabled])
  {
    double v5 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x17u, &v23, 1u, 0, 0);
    v6 = v5 == 0;
    if (v5)
    {
      if (error)
      {
        NSUInteger v7 = v5;
        v24 = *MEMORY[0x263F08320];
        id v8 = [MEMORY[0x263F086E0] mainBundle];
        v9 = [v8 localizedStringForKey:@"Unable to disable streams." value:&stru_26DBD82D0 table:0];
        v27 = v9;
        mach_port_t v25 = *MEMORY[0x263F08338];
        v10 = [MEMORY[0x263F086E0] mainBundle];
        IOUSBHostCompletionHandler v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v28 = v11;
        v26 = *MEMORY[0x263F08348];
        objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v29 = v13;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v24 count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostPipe disableStreamsWithError:]();
        }
      }
    }
    else
    {
      [(IOUSBHostPipe *)self setStreamsEnabled:0];
    }
  }
  else
  {
    if (error)
    {
      v24 = *MEMORY[0x263F08320];
      id v15 = [MEMORY[0x263F086E0] mainBundle];
      id v16 = [v15 localizedStringForKey:@"Unable to disable streams." value:&stru_26DBD82D0 table:0];
      v27 = v16;
      mach_port_t v25 = *MEMORY[0x263F08338];
      id v17 = [MEMORY[0x263F086E0] mainBundle];
      id v18 = [v17 localizedStringForKey:@"Streams were never enabled." value:&stru_26DBD82D0 table:0];
      v28 = v18;
      v26 = *MEMORY[0x263F08348];
      uint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
      long long v20 = [v19 localizedStringForKey:@"Enable streams before disabling streams." value:&stru_26DBD82D0 table:0];
      v29 = v20;
      v21 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v24 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v21];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe disableStreamsWithError:]();
      }
    }
    return 0;
  }
  return v6;
}

- (IOUSBHostStream)copyStreamWithStreamID:(NSUInteger)streamID error:(NSError *)error
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (![(IOUSBHostPipe *)self streamsEnabled])
  {
    if (error)
    {
      uint64_t v40 = *MEMORY[0x263F08320];
      uint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
      long long v20 = [v19 localizedStringForKey:@"Unable to copy stream." value:&stru_26DBD82D0 table:0];
      v43 = v20;
      uint64_t v41 = *MEMORY[0x263F08338];
      v21 = [MEMORY[0x263F086E0] mainBundle];
      v22 = [v21 localizedStringForKey:@"Streams were never enabled." value:&stru_26DBD82D0 table:0];
      v44 = v22;
      uint64_t v42 = *MEMORY[0x263F08348];
      uint32_t v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:@"Enable streams before copying a stream." value:&stru_26DBD82D0 table:0];
      v45 = v24;
      mach_port_t v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v40 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870911 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:].cold.4();
      }
      goto LABEL_20;
    }
    return 0;
  }
  unsigned __int8 valuePtr = 0;
  NSUInteger v7 = [(IOUSBHostIOSource *)self hostInterface];
  io_registry_entry_t v8 = [v7 ioService];
  CFTypeRef v9 = IORegistryEntrySearchCFProperty(v8, "IOService", @"USBSpeed", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);

  if (!v9)
  {
    if (error)
    {
      uint64_t v40 = *MEMORY[0x263F08320];
      v26 = [MEMORY[0x263F086E0] mainBundle];
      v27 = [v26 localizedStringForKey:@"Unable to copy stream." value:&stru_26DBD82D0 table:0];
      v43 = v27;
      uint64_t v41 = *MEMORY[0x263F08338];
      v28 = [MEMORY[0x263F086E0] mainBundle];
      v29 = [v28 localizedStringForKey:@"Unable to get device speed." value:&stru_26DBD82D0 table:0];
      v44 = v29;
      uint64_t v42 = *MEMORY[0x263F08348];
      v30 = [MEMORY[0x263F086E0] mainBundle];
      v31 = [v30 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v45 = v31;
      mach_port_t v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v40 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:]();
      }
      goto LABEL_20;
    }
    return 0;
  }
  CFTypeID v10 = CFGetTypeID(v9);
  if (v10 == CFNumberGetTypeID()) {
    CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt8Type, &valuePtr);
  }
  CFRelease(v9);
  if (streamID - 1 >= IOUSBGetEndpointMaxStreams(valuePtr, (const IOUSBEndpointDescriptor *)([(IOUSBHostPipe *)self descriptors] + 2), (const IOUSBSuperSpeedEndpointCompanionDescriptor *)([(IOUSBHostPipe *)self descriptors]+ 9)))
  {
    if (error)
    {
      uint64_t v40 = *MEMORY[0x263F08320];
      v32 = [MEMORY[0x263F086E0] mainBundle];
      v33 = [v32 localizedStringForKey:@"Unable to copy stream." value:&stru_26DBD82D0 table:0];
      v43 = v33;
      uint64_t v41 = *MEMORY[0x263F08338];
      v34 = [MEMORY[0x263F086E0] mainBundle];
      v35 = [v34 localizedStringForKey:@"StreamID out of bounds." value:&stru_26DBD82D0 table:0];
      v44 = v35;
      uint64_t v42 = *MEMORY[0x263F08348];
      v36 = [MEMORY[0x263F086E0] mainBundle];
      v37 = [v36 localizedStringForKey:@"Select a valid streamID." value:&stru_26DBD82D0 table:0];
      v45 = v37;
      mach_port_t v25 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v40 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostPipe copyStreamWithStreamID:error:]();
      }
LABEL_20:

      return 0;
    }
    return 0;
  }
  IOUSBHostCompletionHandler v11 = [[IOUSBHostStream alloc] initWithHostPipe:self streamID:streamID ioConnection:[(IOUSBHostIOSource *)self ioConnection] ioNotificationPortRef:[(IOUSBHostIOSource *)self ioNotificationPortRef]];
  if (!v11 && error)
  {
    uint64_t v40 = *MEMORY[0x263F08320];
    objc_super v12 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"Unable to copy stream." value:&stru_26DBD82D0 table:0];
    v43 = v13;
    uint64_t v41 = *MEMORY[0x263F08338];
    uint64_t v14 = [MEMORY[0x263F086E0] mainBundle];
    id v15 = [v14 localizedStringForKey:@"IOUSBHostStream init failed." value:&stru_26DBD82D0 table:0];
    v44 = v15;
    uint64_t v42 = *MEMORY[0x263F08348];
    id v16 = [MEMORY[0x263F086E0] mainBundle];
    id v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v45 = v17;
    id v18 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v40 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v18];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostPipe copyStreamWithStreamID:error:]();
    }
  }
  return v11;
}

- (NSData)originalDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOriginalDescriptorsCache:(id)a3
{
}

- (NSData)currentDescriptorsCache
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentDescriptorsCache:(id)a3
{
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
}

- (BOOL)streamsEnabled
{
  return self->_streamsEnabled;
}

- (void)setStreamsEnabled:(BOOL)a3
{
  self->_streamsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidDescriptorCache, 0);
  objc_storeStrong((id *)&self->_currentDescriptorsCache, 0);
  objc_storeStrong((id *)&self->_originalDescriptorsCache, 0);
}

- (void)adjustPipeWithDescriptors:error:.cold.1()
{
  [@"Unable to adjust pipe." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)setIdleTimeout:error:.cold.1()
{
  [@"Unable to set an idle timeout." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)clearStallWithError:.cold.1()
{
  [@"Unable to clear stall." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)sendControlRequest:data:bytesTransferred:completionTimeout:error:.cold.1()
{
  [@"Unable to send control request." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueControlRequest:data:completionTimeout:error:completionHandler:.cold.1()
{
  [@"Unable to enqueue control request." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)abortWithOption:error:.cold.1()
{
  [@"Unable to abort IO." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)sendIORequestWithData:bytesTransferred:completionTimeout:error:.cold.1()
{
  [@"Unable to send IO." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueIORequestWithData:completionTimeout:error:completionHandler:.cold.1()
{
  [@"Unable to enqueue IO." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enableStreamsWithError:.cold.1()
{
  [@"Unable to enable streams." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)disableStreamsWithError:.cold.1()
{
  [@"Unable to disable streams." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)disableStreamsWithError:.cold.2()
{
  [@"Unable to disable streams." cStringUsingEncoding:4];
  [@"Streams were never enabled." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyStreamWithStreamID:error:.cold.1()
{
  [@"Unable to copy stream." cStringUsingEncoding:4];
  [@"Unable to get device speed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyStreamWithStreamID:error:.cold.2()
{
  [@"Unable to copy stream." cStringUsingEncoding:4];
  [@"IOUSBHostStream init failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyStreamWithStreamID:error:.cold.3()
{
  [@"Unable to copy stream." cStringUsingEncoding:4];
  [@"StreamID out of bounds." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)copyStreamWithStreamID:error:.cold.4()
{
  [@"Unable to copy stream." cStringUsingEncoding:4];
  [@"Streams were never enabled." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end