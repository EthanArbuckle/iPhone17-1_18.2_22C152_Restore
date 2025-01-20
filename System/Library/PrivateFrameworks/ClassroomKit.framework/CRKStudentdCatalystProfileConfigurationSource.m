@interface CRKStudentdCatalystProfileConfigurationSource
- (CRKRequestPerformingProtocol)studentDaemonProxy;
- (CRKStudentdCatalystProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4;
- (void)fetchConfiguration:(id)a3;
- (void)fetchConfigurationOperationDidFinish:(id)a3 completion:(id)a4;
- (void)setConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CRKStudentdCatalystProfileConfigurationSource

- (CRKStudentdCatalystProfileConfigurationSource)initWithStudentDaemonProxy:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKStudentdCatalystProfileConfigurationSource;
  v7 = [(CRKStudentdCatalystProfileConfigurationSource *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_studentDaemonProxy, a3);
  }

  return v8;
}

- (void)fetchConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(CRKStudentdCatalystProfileConfigurationSource *)self studentDaemonProxy];
  id v6 = objc_opt_new();
  id v9 = [v5 operationForRequest:v6];

  v7 = (void *)MEMORY[0x22A620AF0](v4);
  [v9 addTarget:self selector:sel_fetchConfigurationOperationDidFinish_completion_ forOperationEvents:6 userInfo:v7];

  v8 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v8 addOperation:v9];
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"CRKStudentdCatalystProfileConfigurationSource.m" lineNumber:44 description:@"setConfiguration is not supported"];
}

- (void)fetchConfigurationOperationDidFinish:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v5 = (void (**)(id, void, void *))a4;
  id v6 = [v10 error];
  if (v6)
  {
    v5[2](v5, 0, v6);
  }
  else
  {
    v7 = [v10 resultObject];
    v8 = [v7 configurationsByType];
    id v9 = [v8 objectForKeyedSubscript:&unk_26D81A0F0];

    ((void (**)(id, void *, void *))v5)[2](v5, v9, 0);
  }
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
}

@end