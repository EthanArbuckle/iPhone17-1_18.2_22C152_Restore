@interface CDPCAAccountInfoRepairEffectivenessReporter
- (CDPCAAccountInfoRepairEffectivenessReporter)init;
- (void)reportRepairAttemptFailedDueToAuthenticationError:(id)a3;
- (void)reportRepairAttemptFinishedWithSuccess:(BOOL)a3 authenticationError:(id)a4 accountInfoFetchErrorBeforeRepair:(id)a5 repairError:(id)a6 accountInfoFetchErrorAfterRepair:(id)a7 octagonStatusBefore:(unint64_t)a8 octagonStatusAfter:(unint64_t)a9 pcsStatusBefore:(unint64_t)a10 pcsStatusAfter:(unint64_t)a11 escrowKeysStatusBefore:(unint64_t)a12 escrowKeysStatusAfter:(unint64_t)a13;
@end

@implementation CDPCAAccountInfoRepairEffectivenessReporter

- (CDPCAAccountInfoRepairEffectivenessReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPCAAccountInfoRepairEffectivenessReporter;
  return [(CDPCAReporter *)&v3 initWithEvent:@"com.apple.cdp.accountInfoRepairEffectiveness"];
}

- (void)reportRepairAttemptFinishedWithSuccess:(BOOL)a3 authenticationError:(id)a4 accountInfoFetchErrorBeforeRepair:(id)a5 repairError:(id)a6 accountInfoFetchErrorAfterRepair:(id)a7 octagonStatusBefore:(unint64_t)a8 octagonStatusAfter:(unint64_t)a9 pcsStatusBefore:(unint64_t)a10 pcsStatusAfter:(unint64_t)a11 escrowKeysStatusBefore:(unint64_t)a12 escrowKeysStatusAfter:(unint64_t)a13
{
  BOOL v17 = a3;
  v38[13] = *MEMORY[0x263EF8340];
  id v36 = a4;
  id v37 = a5;
  id v19 = a6;
  id v20 = a7;
  v21 = (void *)MEMORY[0x263EFFA08];
  uint64_t v22 = *MEMORY[0x263F08410];
  v38[0] = *MEMORY[0x263F07F70];
  v38[1] = v22;
  uint64_t v23 = *MEMORY[0x263F342B0];
  v38[2] = *MEMORY[0x263F08570];
  v38[3] = v23;
  uint64_t v24 = *MEMORY[0x263F32A28];
  v38[4] = *MEMORY[0x263F28F30];
  v38[5] = v24;
  uint64_t v25 = *MEMORY[0x263F329A8];
  v38[6] = *MEMORY[0x263F329B0];
  v38[7] = v25;
  uint64_t v26 = *MEMORY[0x263EFD4C0];
  v38[8] = *MEMORY[0x263EFD498];
  v38[9] = v26;
  v38[10] = @"com.apple.protectedcloudstorage";
  v38[11] = @"com.apple.security.octagon";
  v38[12] = @"com.apple.accounts";
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:13];
  v28 = [v21 setWithArray:v27];

  v29 = [NSNumber numberWithBool:v17];
  [(CDPCAReporter *)self setObject:v29 forKeyedSubscript:@"wasSuccess"];

  v30 = [NSNumber numberWithUnsignedInteger:a8];
  [(CDPCAReporter *)self setObject:v30 forKeyedSubscript:@"otStatus_before"];

  v31 = [NSNumber numberWithUnsignedInteger:a9];
  [(CDPCAReporter *)self setObject:v31 forKeyedSubscript:@"otStatus_after"];

  v32 = [NSNumber numberWithUnsignedInteger:a10];
  [(CDPCAReporter *)self setObject:v32 forKeyedSubscript:@"pcsStatus_before"];

  v33 = [NSNumber numberWithUnsignedInteger:a11];
  [(CDPCAReporter *)self setObject:v33 forKeyedSubscript:@"pcsStatus_after"];

  v34 = [NSNumber numberWithUnsignedInteger:a12];
  [(CDPCAReporter *)self setObject:v34 forKeyedSubscript:@"escrowKeysStatus_before"];

  v35 = [NSNumber numberWithUnsignedInteger:a13];
  [(CDPCAReporter *)self setObject:v35 forKeyedSubscript:@"escrowKeysStatus_after"];

  if (v36) {
    [(CDPCAReporter *)self populateUnderlyingErrorsStartingWithRootError:v36 maxDepth:3 topLevelErrorCodeKey:@"authErrorCode" topLevelErrorDomainKey:@"authErrorDomain" errorCodePrefix:@"authUnderlyingErrorCode" errorDomainPrefix:@"authUnderlyingErrorDomain" domainAllowlist:v28];
  }
  if (v37) {
    [(CDPCAReporter *)self populateUnderlyingErrorsStartingWithRootError:v37 maxDepth:3 topLevelErrorCodeKey:@"accountInfoFetchBeforeRepairErrorCode" topLevelErrorDomainKey:@"accountInfoFetchBeforeRepairErrorDomain" errorCodePrefix:@"accountInfoFetchBeforeRepairUnderlyingErrorCode" errorDomainPrefix:@"accountInfoFetchBeforeRepairUnderlyingErrorDomain" domainAllowlist:v28];
  }
  if (v19) {
    [(CDPCAReporter *)self populateUnderlyingErrorsStartingWithRootError:v19 maxDepth:3 domainAllowlist:v28];
  }
  if (v20) {
    [(CDPCAReporter *)self populateUnderlyingErrorsStartingWithRootError:v20 maxDepth:3 topLevelErrorCodeKey:@"accountInfoFetchAfterRepairErrorCode" topLevelErrorDomainKey:@"accountInfoFetchAfterRepairErrorDomain" errorCodePrefix:@"accountInfoFetchAfterRepairUnderlyingErrorCode" errorDomainPrefix:@"accountInfoFetchAfterRepairUnderlyingErrorDomain" domainAllowlist:v28];
  }
  [(CDPCAReporter *)self sendReport];
}

- (void)reportRepairAttemptFailedDueToAuthenticationError:(id)a3
{
}

@end