@interface BLSHBacklightService
+ (id)serviceWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7;
- (BLSHBacklightService)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7;
@end

@implementation BLSHBacklightService

+ (id)serviceWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithPlatformProvider:v15 osInterfaceProvider:v14 inactiveBudgetPolicy:v13 localAssertionService:v12 localOnly:v7];

  return v16;
}

- (BLSHBacklightService)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7
{
  v47[12] = *(id *)MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v45.receiver = self;
  v45.super_class = (Class)BLSHBacklightService;
  v16 = [(BLSHBacklightService *)&v45 init];
  if (v16)
  {
    v17 = [[BLSHBacklightTransitionStateMachine alloc] initWithPlatformProvider:v12 osInterfaceProvider:v13 inactiveBudgetPolicy:v14];
    transitionStateMachine = v16->_transitionStateMachine;
    v16->_transitionStateMachine = v17;

    v19 = [[BLSHBacklightStateMachine alloc] initWithPlatformProvider:v12 eventPerformer:v16->_transitionStateMachine osInterfaceProvider:v13];
    stateMachine = v16->_stateMachine;
    v16->_stateMachine = v19;

    +[BLSHBacklightHost registerSharedBacklightHost:v16->_stateMachine];
    [MEMORY[0x263F29970] setDefaultBacklightProxy:v16->_stateMachine];
    [(BLSHBacklightStateMachine *)v16->_stateMachine registerHandlersForService:v15];
    [(BLSHBacklightTransitionStateMachine *)v16->_transitionStateMachine registerHandlersForService:v15];
    if (!a7)
    {
      uint64_t v21 = +[BLSHXPCBacklightProxyHostServer serverWithLocalBacklightProxy:v16->_stateMachine];
      backlightXPCServer = v16->_backlightXPCServer;
      v16->_backlightXPCServer = (BLSHXPCBacklightProxyHostServer *)v21;

      if (os_variant_has_internal_diagnostics())
      {
        uint64_t v23 = +[BLSHDiagnosticsServer serverWithFlipbookDiagnosticsProvider:v16->_transitionStateMachine];
        diagnosticsServer = v16->_diagnosticsServer;
        v16->_diagnosticsServer = (BLSHDiagnosticsServer *)v23;

        v39 = [BLSHWatchdogTester alloc];
        v47[0] = v16->_transitionStateMachine;
        v46[0] = @"com.apple.BacklightServices.BLSHBacklightTransitionStateMachine.watchdogtest";
        v46[1] = @"com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest";
        v44 = [v47[0] displayStateMachine];
        v47[1] = v44;
        v43 = [@"com.apple.BacklightServices.BLSHBacklightTransitionStateMachine.watchdogtest" stringByAppendingString:0x26D17B4F0];
        v46[2] = v43;
        v47[2] = v16->_transitionStateMachine;
        v42 = [@"com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest" stringByAppendingString:0x26D17B4F0];
        v46[3] = v42;
        v41 = [(BLSHBacklightTransitionStateMachine *)v16->_transitionStateMachine displayStateMachine];
        v47[3] = v41;
        v40 = [@"com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest" stringByAppendingString:0x26D17B4D0];
        v46[4] = v40;
        v38 = [(BLSHBacklightTransitionStateMachine *)v16->_transitionStateMachine displayStateMachine];
        v46[5] = @"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest";
        v47[4] = v38;
        v47[5] = v13;
        v37 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B4F0];
        v46[6] = v37;
        v47[6] = v13;
        v36 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B510];
        v46[7] = v36;
        v47[7] = v13;
        v35 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B530];
        v46[8] = v35;
        v47[8] = v13;
        v25 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B4D0];
        v46[9] = v25;
        v26 = [(BLSHBacklightTransitionStateMachine *)v16->_transitionStateMachine displayStateMachine];
        v47[9] = v26;
        v27 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B550];
        v46[10] = v27;
        v47[10] = v13;
        v28 = [@"com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest" stringByAppendingString:0x26D17B570];
        v46[11] = v28;
        v47[11] = v13;
        v29 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:12];
        uint64_t v30 = [(BLSHWatchdogTester *)v39 initWithWatchdogProviderDelegate:v13 testables:v29];
        watchdogTester = v16->_watchdogTester;
        v16->_watchdogTester = (BLSHWatchdogTester *)v30;

        v32 = [[BLSHCriticalAssertTester alloc] initWithNotificationName:@"com.apple.BacklightServices.criticalasserttest"];
        criticalAssertTester = v16->_criticalAssertTester;
        v16->_criticalAssertTester = v32;
      }
    }
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAssertTester, 0);
  objc_storeStrong((id *)&self->_watchdogTester, 0);
  objc_storeStrong((id *)&self->_diagnosticsServer, 0);
  objc_storeStrong((id *)&self->_backlightXPCServer, 0);
  objc_storeStrong((id *)&self->_transitionStateMachine, 0);

  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end