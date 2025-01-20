@interface IOUSBHostStream
- (BOOL)abortWithError:(NSError *)error;
- (BOOL)abortWithOption:(IOUSBHostAbortOption)option error:(NSError *)error;
- (BOOL)enqueueIORequestWithData:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler;
- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error;
- (IOUSBHostPipe)hostPipe;
- (IOUSBHostStream)initWithHostPipe:(id)a3 streamID:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6;
- (NSUInteger)streamID;
- (void)setHostPipe:(id)a3;
- (void)setStreamID:(unint64_t)a3;
@end

@implementation IOUSBHostStream

- (IOUSBHostStream)initWithHostPipe:(id)a3 streamID:(unint64_t)a4 ioConnection:(unsigned int)a5 ioNotificationPortRef:(IONotificationPort *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  v11 = [v10 hostInterface];
  v12 = -[IOUSBHostIOSource initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:](self, "initWithHostInterface:endpointAddress:ioConnection:ioNotificationPortRef:deviceAddress:", v11, [v10 endpointAddress], v7, a6, objc_msgSend(v10, "deviceAddress"));

  if (v12)
  {
    [(IOUSBHostStream *)v12 setStreamID:a4];
    [(IOUSBHostStream *)v12 setHostPipe:v10];
  }

  return v12;
}

- (BOOL)abortWithError:(NSError *)error
{
  return [(IOUSBHostStream *)self abortWithOption:1 error:error];
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
  uint64_t v16[3];
  void v17[3];
  void v18[4];

  v18[3] = *MEMORY[0x263EF8340];
  v16[1] = [(IOUSBHostIOSource *)self endpointAddress];
  v16[2] = option;
  uint64_t v7 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x18u, v16, 3u, 0, 0);
  if (v7 && error)
  {
    v17[0] = *MEMORY[0x263F08320];
    v8 = [MEMORY[0x263F086E0] mainBundle];
    v9 = [v8 localizedStringForKey:@"Unable to abort stream." value:&stru_26DBD82D0 table:0];
    v18[0] = v9;
    v17[1] = *MEMORY[0x263F08338];
    id v10 = [MEMORY[0x263F086E0] mainBundle];
    v11 = [v10 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[1] = v11;
    v17[2] = *MEMORY[0x263F08348];
    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v18[2] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v7 userInfo:v14];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostStream abortWithOption:error:]();
    }
  }
  return v7 == 0;
}

- (BOOL)sendIORequestWithData:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  kern_return_t v13;
  kern_return_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input[4];
  void v26[3];
  void v27[4];

  v27[3] = *MEMORY[0x263EF8340];
  v8 = data;
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = [(NSMutableData *)v10 mutableBytes];
    uint64_t v12 = [(NSMutableData *)v10 length];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = [(IOUSBHostStream *)self streamID];
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0;
  v13 = IOConnectCallScalarMethod([(IOUSBHostIOSource *)self ioConnection], 0x19u, input, 4u, &output, &outputCnt);
  v14 = v13;
  if (bytesTransferred) {
    *bytesTransferred = output;
  }
  if (v13 && error)
  {
    v26[0] = *MEMORY[0x263F08320];
    v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:@"Unable to send IO with stream." value:&stru_26DBD82D0 table:0];
    v27[0] = v16;
    v26[1] = *MEMORY[0x263F08338];
    v17 = [MEMORY[0x263F086E0] mainBundle];
    v18 = [v17 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v27[1] = v18;
    v26[2] = *MEMORY[0x263F08348];
    v19 = [MEMORY[0x263F086E0] mainBundle];
    v20 = [v19 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v27[2] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v14 userInfo:v21];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostStream sendIORequestWithData:bytesTransferred:error:]();
    }
  }
  return v14 == 0;
}

- (BOOL)enqueueIORequestWithData:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  kern_return_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSError **v27;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  long long v31;
  long long v32;
  long long v33;
  uint64_t input[4];
  void v35[3];
  void v36[5];

  v36[3] = *MEMORY[0x263EF8340];
  v8 = data;
  IOUSBHostCompletionHandler v9 = completionHandler;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = [(NSMutableData *)v10 mutableBytes];
    uint64_t v12 = [(NSMutableData *)v10 length];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  input[0] = [(IOUSBHostIOSource *)self endpointAddress];
  input[1] = [(IOUSBHostStream *)self streamID];
  input[2] = v12;
  input[3] = v11;
  outputCnt = 1;
  output = 0;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32 = v13;
  v33 = v13;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v31 = v13;
  reference[1] = (uint64_t)_ioCompletionCallback;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x22A681190](v9);
  }
  else
  {
    uint64_t v14 = 0;
  }
  *(void *)&v31 = v14;
  mach_port_t v15 = [(IOUSBHostIOSource *)self ioConnection];
  mach_port_t MachPort = IONotificationPortGetMachPort([(IOUSBHostIOSource *)self ioNotificationPortRef]);
  v17 = IOConnectCallAsyncScalarMethod(v15, 0x19u, MachPort, reference, 3u, input, 4u, &output, &outputCnt);
  if (v17)
  {
    v18 = (void *)v31;
    if (error)
    {
      v35[0] = *MEMORY[0x263F08320];
      v19 = [MEMORY[0x263F086E0] mainBundle];
      v20 = [v19 localizedStringForKey:@"Unable to enqueue IO with stream." value:&stru_26DBD82D0 table:0];
      v36[0] = v20;
      v35[1] = *MEMORY[0x263F08338];
      [MEMORY[0x263F086E0] mainBundle];
      v21 = v27 = error;
      v22 = [v21 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v36[1] = v22;
      v35[2] = *MEMORY[0x263F08348];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v36[2] = v24;
      v25 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

      *v27 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:v17 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostStream enqueueIORequestWithData:error:completionHandler:]();
      }
    }
  }

  return v17 == 0;
}

- (IOUSBHostPipe)hostPipe
{
  return (IOUSBHostPipe *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHostPipe:(id)a3
{
}

- (NSUInteger)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
}

- (void)abortWithOption:error:.cold.1()
{
  [@"Unable to abort stream." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)sendIORequestWithData:bytesTransferred:error:.cold.1()
{
  [@"Unable to send IO with stream." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueIORequestWithData:error:completionHandler:.cold.1()
{
  [@"Unable to enqueue IO with stream." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end