@interface JFXEffectsPreviewRequestHandler
- (JFXEffectsPreviewGenerationRequest)req;
- (JFXEffectsPreviewGeneratorJob)job;
- (JFXEffectsPreviewRequestHandler)initWithRequest:(id)a3;
- (id)buildCallbackMap:(id)a3;
- (id)buildPVRenderRequestWithOutputColorSpace:(id)a3;
- (void)setJob:(id)a3;
- (void)setReq:(id)a3;
@end

@implementation JFXEffectsPreviewRequestHandler

- (JFXEffectsPreviewRequestHandler)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXEffectsPreviewRequestHandler;
  v6 = [(JFXEffectsPreviewRequestHandler *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_req, a3);
    job = v7->_job;
    v7->_job = 0;
  }
  return v7;
}

- (id)buildPVRenderRequestWithOutputColorSpace:(id)a3
{
  id v4 = a3;
  id v5 = [JFXInstructionGraphBuilder alloc];
  [(JFXEffectsPreviewGenerationRequest *)self->_req outputSize];
  double v7 = v6;
  double v9 = v8;
  [(JFXEffectsPreviewGenerationRequest *)self->_req frameSize];
  v12 = -[JFXInstructionGraphBuilder initWithOutputSize:frameSize:outputColorSpace:](v5, "initWithOutputSize:frameSize:outputColorSpace:", v4, v7, v9, v10, v11);

  v13 = [(JFXEffectsPreviewGenerationRequest *)self->_req generatorJobWithGraphBuilder:v12];
  job = self->_job;
  self->_job = v13;

  id v15 = objc_alloc(MEMORY[0x263F612F0]);
  v16 = [(JFXEffectsPreviewGeneratorJob *)self->_job outputNodes];
  req = self->_req;
  if (req)
  {
    [(JFXEffectsPreviewGenerationRequest *)req renderTime];
    req = self->_req;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  [(JFXEffectsPreviewGenerationRequest *)req outputSize];
  v18 = objc_msgSend(v15, "initWithOutputs:atTime:outputSize:", v16, v20);

  objc_msgSend(v18, "setHighQuality:", -[JFXEffectsPreviewGenerationRequest highQuality](self->_req, "highQuality"));
  objc_msgSend(v18, "setPriority:", -[JFXEffectsPreviewGenerationRequest priority](self->_req, "priority"));
  if ([(JFXEffectsPreviewGenerationRequest *)self->_req parentCode] != -1) {
    objc_msgSend(v18, "setParentCode:", -[JFXEffectsPreviewGenerationRequest parentCode](self->_req, "parentCode"));
  }
  objc_msgSend(v18, "setChildCode:", -[JFXEffectsPreviewGenerationRequest childCode](self->_req, "childCode"));

  return v18;
}

- (id)buildCallbackMap:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08968];
  id v5 = a3;
  double v6 = objc_msgSend([v4 alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__JFXEffectsPreviewRequestHandler_buildCallbackMap___block_invoke;
  v11[3] = &unk_264C0D300;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  double v8 = v12;
  id v9 = v7;

  return v9;
}

void __52__JFXEffectsPreviewRequestHandler_buildCallbackMap___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) callbackKeys];
  double v6 = [v5 objectAtIndexedSubscript:a3];

  if (v7 && v6) {
    [*(id *)(a1 + 40) setObject:v7 forKey:v6];
  }
}

- (JFXEffectsPreviewGenerationRequest)req
{
  return self->_req;
}

- (void)setReq:(id)a3
{
}

- (JFXEffectsPreviewGeneratorJob)job
{
  return self->_job;
}

- (void)setJob:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job, 0);
  objc_storeStrong((id *)&self->_req, 0);
}

@end