@interface VCPRealTimeAnalysisService
+ (id)analysisService;
+ (id)errorWithStatus:(int)a3 andDescription:(id)a4;
- (VCPRealTimeAnalysisService)init;
- (id)connection;
- (void)dealloc;
- (void)invalidate;
- (void)requestAnalysis:(unint64_t)a3 ofPixelBuffer:(__CVBuffer *)a4 withProperties:(id)a5 withCompletionHandler:(id)a6;
@end

@implementation VCPRealTimeAnalysisService

- (VCPRealTimeAnalysisService)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCPRealTimeAnalysisService;
  v2 = [(VCPRealTimeAnalysisService *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v3;

    connection = v2->_connection;
    v2->_connection = 0;
  }
  return v2;
}

+ (id)analysisService
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)dealloc
{
  [(VCPRealTimeAnalysisService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VCPRealTimeAnalysisService;
  [(VCPRealTimeAnalysisService *)&v3 dealloc];
}

+ (id)errorWithStatus:(int)a3 andDescription:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v5;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:v7];

  return v8;
}

- (id)connection
{
  [(NSLock *)self->_connectionLock lock];
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.mediaanalysisd.realtime" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v6 = self->_connection;
    objc_super v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1640898];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    v8 = self->_connection;
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1601758];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_30];
    objc_initWeak(&location, self);
    uint64_t v10 = self->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __40__VCPRealTimeAnalysisService_connection__block_invoke_10;
    v16 = &unk_1E62981D8;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v11 = connection;
  [(NSLock *)self->_connectionLock unlock];
  return v11;
}

void __40__VCPRealTimeAnalysisService_connection__block_invoke()
{
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_DEBUG, "Real-time analysis client XPC connection interrupted", v1, 2u);
    }
  }
}

void __40__VCPRealTimeAnalysisService_connection__block_invoke_10(uint64_t a1)
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Real-time analysis client XPC connection invalidated", (uint8_t *)v6, 2u);
    }
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] lock];
    id v5 = v4[2];
    v4[2] = 0;

    [v4[1] unlock];
  }
}

- (void)requestAnalysis:(unint64_t)a3 ofPixelBuffer:(__CVBuffer *)a4 withProperties:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = CVPixelBufferGetIOSurface(a4);
  if (v12)
  {
    uint64_t v13 = [(VCPRealTimeAnalysisService *)self connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke;
    v20[3] = &unk_1E6297C10;
    id v14 = v11;
    id v21 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke_13;
    v18[3] = &unk_1E6297A60;
    id v19 = v14;
    [v15 requestAnalysis:a3 ofIOSurface:v12 withProperties:v10 withReply:v18];

    v16 = v21;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "Pixel buffer not IOSurface-backed; dropping analysis request",
          buf,
          2u);
      }
    }
    v16 = [(id)objc_opt_class() errorWithStatus:4294967246 andDescription:@"CVPixelbuffer not IOSurface backed"];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v16);
  }
}

void __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "Real-time analysis client XPC connection error", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __97__VCPRealTimeAnalysisService_requestAnalysis_ofPixelBuffer_withProperties_withCompletionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end