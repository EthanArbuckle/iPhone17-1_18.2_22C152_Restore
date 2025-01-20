@interface ESSelfPreheatWithPowerContainer
- (ASRSchemaASRPreheatContext)preheatContext;
- (ESSelfPreheatWithPowerContainer)initWithPreheatContext:(id)a3 powerSnapshot:(id)a4 powerEventContext:(id)a5;
- (SPIEventContext)powerEventContext;
- (SPIPowerLoggerSnapshot)powerSnapshot;
@end

@implementation ESSelfPreheatWithPowerContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerEventContext, 0);
  objc_storeStrong((id *)&self->_powerSnapshot, 0);

  objc_storeStrong((id *)&self->_preheatContext, 0);
}

- (SPIEventContext)powerEventContext
{
  return self->_powerEventContext;
}

- (SPIPowerLoggerSnapshot)powerSnapshot
{
  return self->_powerSnapshot;
}

- (ASRSchemaASRPreheatContext)preheatContext
{
  return self->_preheatContext;
}

- (ESSelfPreheatWithPowerContainer)initWithPreheatContext:(id)a3 powerSnapshot:(id)a4 powerEventContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ESSelfPreheatWithPowerContainer;
  v12 = [(ESSelfPreheatWithPowerContainer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preheatContext, a3);
    objc_storeStrong((id *)&v13->_powerSnapshot, a4);
    objc_storeStrong((id *)&v13->_powerEventContext, a5);
  }

  return v13;
}

@end