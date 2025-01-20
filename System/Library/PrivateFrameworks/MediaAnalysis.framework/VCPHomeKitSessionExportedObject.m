@interface VCPHomeKitSessionExportedObject
- (VCPHomeKitAnalysisSession)weakSession;
- (void)processResults:(id)a3 withReply:(id)a4;
- (void)setWeakSession:(id)a3;
@end

@implementation VCPHomeKitSessionExportedObject

- (void)processResults:(id)a3 withReply:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [(VCPHomeKitSessionExportedObject *)self weakSession];
  v9 = v8;
  if (v8)
  {
    [v8 processResults:v6 withReply:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"No VCPHomeKitAnalysisSession; cannot process message"];
    v15[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v13 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v12];
    v7[2](v7, v13);
  }
}

- (VCPHomeKitAnalysisSession)weakSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakSession);
  return (VCPHomeKitAnalysisSession *)WeakRetained;
}

- (void)setWeakSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end