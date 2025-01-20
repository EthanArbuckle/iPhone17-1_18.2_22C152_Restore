@interface ARTechniqueService
+ (id)serviceName;
- (ARRemoteTechniqueClient)clientProxy;
- (ARTechnique)technique;
- (ARTechniqueService)initWithConnection:(id)a3;
- (ARTechniqueService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5;
- (id)processData:(id)a3;
- (void)_initCommon:(id)a3;
- (void)captureBehaviorWithReply:(id)a3;
- (void)interruptionHandler;
- (void)invalidationHandler;
- (void)isActiveWithReply:(id)a3;
- (void)numberOfActiveConnectionsWithReply:(id)a3;
- (void)prepare:(BOOL)a3;
- (void)processData:(id)a3 reply:(id)a4;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)requiredSensorDataTypesWithReply:(id)a3;
- (void)requiredTimeIntervalWithReply:(id)a3;
- (void)resultDataClassesWithReply:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setTechnique:(id)a3;
- (void)technique:(id)a3 didFailWithError:(id)a4;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
@end

@implementation ARTechniqueService

- (ARTechniqueService)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = ARRemoteTechniqueServiceInterfaceWithProtocol();
  v6 = ARRemoteTechniqueClientInterfaceWithProtocol();
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueService;
  v7 = [(ARDaemonService *)&v9 initWithConnection:v4 exportedInterface:v5 remoteObjectInterface:v6];

  if (v7) {
    [(ARTechniqueService *)v7 _initCommon:v4];
  }

  return v7;
}

- (ARTechniqueService)initWithConnection:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARTechniqueService;
  objc_super v9 = [(ARDaemonService *)&v12 initWithConnection:v8 exportedInterface:a4 remoteObjectInterface:a5];
  v10 = v9;
  if (v9) {
    [(ARTechniqueService *)v9 _initCommon:v8];
  }

  return v10;
}

- (void)_initCommon:(id)a3
{
  id v4 = [a3 remoteObjectProxy];
  clientProxy = self->_clientProxy;
  self->_clientProxy = v4;

  [(ARDaemonService *)self setActive:0];
}

- (void)invalidationHandler
{
  v2.receiver = self;
  v2.super_class = (Class)ARTechniqueService;
  [(ARDaemonService *)&v2 invalidationHandler];
}

- (void)interruptionHandler
{
  v2.receiver = self;
  v2.super_class = (Class)ARTechniqueService;
  [(ARDaemonService *)&v2 interruptionHandler];
}

- (void)isActiveWithReply:(id)a3
{
  id v5 = a3;
  (*((void (**)(id, BOOL, void))a3 + 2))(v5, [(ARDaemonService *)self isActive], 0);
}

- (void)captureBehaviorWithReply:(id)a3
{
  technique = self->_technique;
  id v4 = (void (**)(id, uint64_t, void))a3;
  v4[2](v4, [(ARTechnique *)technique captureBehavior], 0);
}

- (void)numberOfActiveConnectionsWithReply:(id)a3
{
  v6 = (void (**)(id, uint64_t, void))a3;
  id v4 = [(ARDaemonService *)self dataSource];
  uint64_t v5 = [v4 numberOfActiveConnectionsForService:self];

  v6[2](v6, v5, 0);
}

- (void)prepare:(BOOL)a3
{
}

- (id)processData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(ARDaemonService *)self isActive])
  {
    id v5 = [(ARTechnique *)self->_technique processData:v4];
  }
  else
  {
    v6 = _ARLogDaemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v11 = 138543874;
      objc_super v12 = v8;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_24719A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of data: %@",
        (uint8_t *)&v11,
        0x20u);
    }
    id v5 = v4;
  }
  objc_super v9 = v5;

  return v9;
}

- (void)processData:(id)a3 reply:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  id v7 = [(ARTechniqueService *)self processData:a3];
  v6[2](v6, v7, 0);
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(ARDaemonService *)self isActive])
  {
    [(ARTechnique *)self->_technique requestResultDataAtTimestamp:v6 context:a3];
  }
  else
  {
    id v7 = _ARLogDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      int v10 = 138543874;
      int v11 = v9;
      __int16 v12 = 2048;
      __int16 v13 = self;
      __int16 v14 = 2048;
      double v15 = a3;
      _os_log_impl(&dword_24719A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping request for result data at timestamp: %f",
        (uint8_t *)&v10,
        0x20u);
    }
    [(ARRemoteTechniqueClient *)self->_clientProxy techniqueDidOutputResultData:MEMORY[0x263EFFA68] timestamp:v6 context:a3];
  }
}

- (void)requiredSensorDataTypesWithReply:(id)a3
{
  technique = self->_technique;
  id v4 = (void (**)(id, uint64_t, void))a3;
  v4[2](v4, [(ARTechnique *)technique requiredSensorDataTypes], 0);
}

- (void)requiredTimeIntervalWithReply:(id)a3
{
  technique = self->_technique;
  id v4 = (void (**)(id, void))a3;
  [(ARTechnique *)technique requiredTimeInterval];
  v4[2](v4, 0);
}

- (void)resultDataClassesWithReply:(id)a3
{
  technique = self->_technique;
  id v4 = (void (**)(id, void *, void))a3;
  id v6 = [(ARTechnique *)technique resultDataClasses];
  id v5 = objc_msgSend(v6, "ar_map:", &__block_literal_global);
  v4[2](v4, v5, 0);
}

NSString *__49__ARTechniqueService_resultDataClassesWithReply___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

+ (id)serviceName
{
  return &stru_26FB5B738;
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
}

- (ARRemoteTechniqueClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (ARTechnique)technique
{
  return self->_technique;
}

- (void)setTechnique:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_technique, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end