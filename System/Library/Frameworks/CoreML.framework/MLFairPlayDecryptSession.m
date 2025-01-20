@interface MLFairPlayDecryptSession
+ (id)decryptSessionForModelAtPath:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 keyBlob:(id)a5 error:(id *)a6;
- (CoreMLModelSecurityProtocol)xpcProxy;
- (NSString)modelPath;
- (NSXPCConnection)xpcConnection;
- (void)dealloc;
- (void)setModelPath:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcProxy:(id)a3;
@end

@implementation MLFairPlayDecryptSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_modelPath, 0);
}

- (void)setXpcProxy:(id)a3
{
}

- (CoreMLModelSecurityProtocol)xpcProxy
{
  return self->_xpcProxy;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setModelPath:(id)a3
{
}

- (NSString)modelPath
{
  return self->_modelPath;
}

- (void)dealloc
{
  v3 = (void *)[(NSString *)self->_modelPath copy];
  [(CoreMLModelSecurityProtocol *)self->_xpcProxy stopDecryptionOfModelAtPath:v3 completionBlock:&__block_literal_global_91];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  modelPath = self->_modelPath;
  self->_modelPath = 0;

  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  xpcProxy = self->_xpcProxy;
  self->_xpcProxy = 0;

  v7.receiver = self;
  v7.super_class = (Class)MLFairPlayDecryptSession;
  [(MLFairPlayDecryptSession *)&v7 dealloc];
}

+ (id)decryptSessionForModelAtPath:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 keyBlob:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v9 = (__CFString *)a3;
  id v10 = a5;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CoreMLModelSecurityService"];
  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF14E7D0];
  [v11 setRemoteObjectInterface:v12];

  [v11 setInterruptionHandler:&__block_literal_global_14754];
  [v11 setInvalidationHandler:&__block_literal_global_85];
  [v11 resume];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14755;
  v28 = __Block_byref_object_dispose__14756;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_86;
  v23[3] = &unk_1E59A5008;
  v23[4] = &v24;
  v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v23];
  v14 = (void *)v25[5];
  if (v14)
  {
    if (a6) {
      *a6 = v14;
    }
    v15 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v16 = v25[5];
    *(_DWORD *)buf = 138412546;
    v31 = @"com.apple.CoreMLModelSecurityService";
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    v17 = "Could not create connection to %@ : error=%@";
LABEL_16:
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
LABEL_10:

    [v11 invalidate];
    v19 = 0;
    goto LABEL_11;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_88;
  v22[3] = &unk_1E59A5008;
  v22[4] = &v24;
  [v13 startDecryptionOfModelAtPath:v9 usingKeyBlob:v10 usesCodeSigningIdentityForEncryption:v8 completionBlock:v22];
  v18 = (void *)v25[5];
  if (v18)
  {
    if (a6) {
      *a6 = v18;
    }
    v15 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v21 = v25[5];
    *(_DWORD *)buf = 138412546;
    v31 = v9;
    __int16 v32 = 2112;
    uint64_t v33 = v21;
    v17 = "Could not create decrypt session for %@ : error=%@";
    goto LABEL_16;
  }
  v19 = objc_alloc_init(MLFairPlayDecryptSession);
  [(MLFairPlayDecryptSession *)v19 setModelPath:v9];
  [(MLFairPlayDecryptSession *)v19 setXpcConnection:v11];
  [(MLFairPlayDecryptSession *)v19 setXpcProxy:v13];
LABEL_11:

  _Block_object_dispose(&v24, 8);

  return v19;
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_86(uint64_t a1, void *a2)
{
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_88(uint64_t a1, void *a2)
{
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke_83()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered invalidationHandler!", v1, 2u);
  }
}

void __108__MLFairPlayDecryptSession_decryptSessionForModelAtPath_usesCodeSigningIdentityForEncryption_keyBlob_error___block_invoke()
{
  v0 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_19E58B000, v0, OS_LOG_TYPE_DEBUG, "Entered interruptionHandler!", v1, 2u);
  }
}

@end