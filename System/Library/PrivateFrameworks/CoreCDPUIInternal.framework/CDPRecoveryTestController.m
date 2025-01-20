@interface CDPRecoveryTestController
- (CDPRecoveryTestController)initWithDevices:(id)a3 andNavigationController:(id)a4;
- (id)dummyRecoveryInfo;
- (void)setUp;
@end

@implementation CDPRecoveryTestController

- (CDPRecoveryTestController)initWithDevices:(id)a3 andNavigationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPRecoveryTestController;
  v9 = [(CDPRecoveryTestController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mockDevices, a3);
    objc_storeStrong((id *)&v10->_navController, a4);
  }

  return v10;
}

- (void)setUp
{
  [(NSArray *)self->_mockDevices enumerateObjectsUsingBlock:&__block_literal_global];
  id v10 = [MEMORY[0x263F34350] contextForPrimaryAccount];
  [v10 setIdmsRecovery:1];
  id v3 = objc_alloc_init(MEMORY[0x263F343E0]);
  [v3 setContext:v10];
  v4 = (void *)[objc_alloc(MEMORY[0x263F34A08]) initWithPresentingViewController:self->_navController];
  v5 = (void *)[objc_alloc(MEMORY[0x263F343F8]) initWithUIProvider:v4];
  id v6 = objc_alloc(MEMORY[0x263F349B0]);
  id v7 = (void *)[objc_alloc(MEMORY[0x263F349C8]) initWithContext:v10 uiProvider:v5 delegate:0];
  id v8 = (CDPDBackupInfoRecoveryFlowController *)[v6 initWithContext:v3 uiProvider:v5 secureBackupController:v7 circleProxy:0 octagonProxy:0];
  recoveryController = self->_recoveryController;
  self->_recoveryController = v8;
}

uint64_t __34__CDPRecoveryTestController_setUp__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRemainingAttempts:10];
}

- (id)dummyRecoveryInfo
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F34288];
  v9[0] = *MEMORY[0x263F34290];
  v9[1] = v2;
  v10[0] = @"mockMID";
  v10[1] = @"mockPRK";
  id v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = *MEMORY[0x263F32A58];
  v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  id v8 = v4;
  v5 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_mockDevices, 0);

  objc_storeStrong((id *)&self->_recoveryController, 0);
}

@end