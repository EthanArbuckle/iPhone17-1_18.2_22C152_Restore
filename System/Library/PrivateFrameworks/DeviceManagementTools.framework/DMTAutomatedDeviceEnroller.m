@interface DMTAutomatedDeviceEnroller
- (BOOL)isFinalized;
- (CATOperationQueue)operationQueue;
- (DMTActivationPrimitives)activationPrimitives;
- (DMTAutomatedDeviceEnroller)initWithEnrollmentPrimitives:(id)a3 enrollmentInformationPrimitives:(id)a4 reachabilityPrimitives:(id)a5 activationPrimitives:(id)a6 wifiPrimitives:(id)a7 profileInstallationPrimitives:(id)a8 destructiveErasePrimitives:(id)a9 nonDestructiveErasePrimitives:(id)a10 powerOffPrimitives:(id)a11;
- (DMTAutomatedDeviceEnrollmentPrimitives)enrollmentPrimitives;
- (DMTEnrollmentInformationPrimitives)enrollmentInformationPrimitives;
- (DMTErasePrimitives)destructiveErasePrimitives;
- (DMTErasePrimitives)nonDestructiveErasePrimitives;
- (DMTInternetReachabilityPrimitives)reachabilityPrimitives;
- (DMTNetworkCredential)networkCredential;
- (DMTPowerOffPrimitives)powerOffPrimitives;
- (DMTProfileInstallationPrimitives)profileInstallationPrimitives;
- (DMTWiFiPrimitives)wifiPrimitives;
- (NSData)networkPayload;
- (NSError)enrollmentError;
- (NSString)enrollmentNonce;
- (NSString)installedNetworkPayloadIdentifier;
- (NSString)mdmServerName;
- (NSString)networkName;
- (NSString)organizationName;
- (int64_t)enrollmentState;
- (int64_t)networkConfiguration;
- (int64_t)organizationType;
- (int64_t)postEnrollmentBehavior;
- (void)activateDevice;
- (void)activationCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)activationStatusFetchComplete:(BOOL)a3 error:(id)a4;
- (void)beginAutomatedDeviceEnrollment;
- (void)checkActivationStatus;
- (void)checkIfAlreadyEnrolled;
- (void)didDisassociateFromNetworkWithSuccess:(BOOL)a3 error:(id)a4;
- (void)didJoinNetworkWithSuccess:(BOOL)a3 error:(id)a4;
- (void)disassociateWiFi;
- (void)enrollDevice;
- (void)enrollmentCompleteWithResponse:(id)a3 error:(id)a4;
- (void)eraseAllContentAndSettingsDidFinishWithError:(id)a3;
- (void)eraseAllContentAndSettingsWithExternalError:(id)a3;
- (void)eraseAndRestartWithExternalError:(id)a3;
- (void)eraseAndShutDownWithExternalError:(id)a3;
- (void)eraseCurrentNetworkIfNeeded;
- (void)installProfile;
- (void)joinNetwork;
- (void)joinNetworkUsingCredentials;
- (void)profileInstallationDidFinish:(id)a3;
- (void)profileUninstallDidFinish:(id)a3;
- (void)setEnrollmentError:(id)a3;
- (void)setEnrollmentNonce:(id)a3;
- (void)setEnrollmentState:(int64_t)a3;
- (void)setFinalized:(BOOL)a3;
- (void)setInstalledNetworkPayloadIdentifier:(id)a3;
- (void)setMdmServerName:(id)a3;
- (void)setNetworkConfiguration:(int64_t)a3;
- (void)setNetworkCredential:(id)a3;
- (void)setNetworkCredential:(id)a3 networkPayload:(id)a4 enrollmentNonce:(id)a5 postEnrollmentBehavior:(int64_t)a6 organizationName:(id)a7 organizationType:(int64_t)a8 mdmServerName:(id)a9 networkConfiguration:(int64_t)a10;
- (void)setNetworkName:(id)a3;
- (void)setNetworkPayload:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setOrganizationType:(int64_t)a3;
- (void)setPostEnrollmentBehavior:(int64_t)a3;
- (void)tearDownWithFatalError:(id)a3;
- (void)timeoutOperationDidFinish:(id)a3;
- (void)uninstallProfile;
- (void)verifyProfile;
- (void)waitForReachabilityWithTimeout:(double)a3;
@end

@implementation DMTAutomatedDeviceEnroller

- (DMTAutomatedDeviceEnroller)initWithEnrollmentPrimitives:(id)a3 enrollmentInformationPrimitives:(id)a4 reachabilityPrimitives:(id)a5 activationPrimitives:(id)a6 wifiPrimitives:(id)a7 profileInstallationPrimitives:(id)a8 destructiveErasePrimitives:(id)a9 nonDestructiveErasePrimitives:(id)a10 powerOffPrimitives:(id)a11
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v26 = a8;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  v32.receiver = self;
  v32.super_class = (Class)DMTAutomatedDeviceEnroller;
  v18 = [(DMTAutomatedDeviceEnroller *)&v32 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_enrollmentPrimitives, a3);
    objc_storeStrong((id *)&v19->_enrollmentInformationPrimitives, a4);
    objc_storeStrong((id *)&v19->_reachabilityPrimitives, a5);
    objc_storeStrong((id *)&v19->_activationPrimitives, a6);
    objc_storeStrong((id *)&v19->_wifiPrimitives, a7);
    objc_storeStrong((id *)&v19->_profileInstallationPrimitives, a8);
    objc_storeStrong((id *)&v19->_destructiveErasePrimitives, a9);
    objc_storeStrong((id *)&v19->_nonDestructiveErasePrimitives, a10);
    objc_storeStrong((id *)&v19->_powerOffPrimitives, a11);
    uint64_t v20 = objc_opt_new();
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = (CATOperationQueue *)v20;

    v19->_enrollmentState = 0;
  }

  return v19;
}

- (void)setNetworkCredential:(id)a3 networkPayload:(id)a4 enrollmentNonce:(id)a5 postEnrollmentBehavior:(int64_t)a6 organizationName:(id)a7 organizationType:(int64_t)a8 mdmServerName:(id)a9 networkConfiguration:(int64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a9;
  if ([(DMTAutomatedDeviceEnroller *)self isFinalized])
  {
    v22 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:](a2);
    }
  }
  else
  {
    id v23 = _DMTLogEnrollment();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v25 = 0;
      _os_log_impl(&dword_22D3D6000, v23, OS_LOG_TYPE_DEFAULT, "Receiving enrollment prerequisites...", v25, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:5];
    [(DMTAutomatedDeviceEnroller *)self setOrganizationName:v20];
    [(DMTAutomatedDeviceEnroller *)self setOrganizationType:a8];
    [(DMTAutomatedDeviceEnroller *)self setMdmServerName:v21];
    [(DMTAutomatedDeviceEnroller *)self setNetworkCredential:v17];
    id v24 = [v17 networkName];
    [(DMTAutomatedDeviceEnroller *)self setNetworkName:v24];

    [(DMTAutomatedDeviceEnroller *)self setNetworkPayload:v18];
    [(DMTAutomatedDeviceEnroller *)self setEnrollmentNonce:v19];
    [(DMTAutomatedDeviceEnroller *)self setPostEnrollmentBehavior:a6];
    [(DMTAutomatedDeviceEnroller *)self setNetworkConfiguration:a10];
  }
}

- (void)beginAutomatedDeviceEnrollment
{
  if ([(DMTAutomatedDeviceEnroller *)self isFinalized])
  {
    v4 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:](a2);
    }
LABEL_9:

    return;
  }
  v5 = _DMTLogEnrollment();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D3D6000, v5, OS_LOG_TYPE_DEFAULT, "Beginning automated device enrollment...", buf, 2u);
  }

  if ([(DMTAutomatedDeviceEnroller *)self enrollmentState] >= 6)
  {
    v4 = _DMTLogEnrollment();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22D3D6000, v4, OS_LOG_TYPE_DEFAULT, "Enrollment already in-progress, ignoring call to begin enrollment", v12, 2u);
    }
    goto LABEL_9;
  }
  [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:6];
  v6 = [(DMTAutomatedDeviceEnroller *)self reachabilityPrimitives];
  int v7 = [v6 reachable];

  v8 = _DMTLogEnrollment();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D3D6000, v8, OS_LOG_TYPE_DEFAULT, "Already reachable, skipping to enrollment", v11, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self checkActivationStatus];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22D3D6000, v8, OS_LOG_TYPE_DEFAULT, "Not yet reachable, joining network...", v10, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self joinNetwork];
  }
}

- (void)eraseAndRestartWithExternalError:(id)a3
{
  id v5 = a3;
  if ([(DMTAutomatedDeviceEnroller *)self isFinalized])
  {
    v6 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:](a2);
    }
  }
  else
  {
    [(DMTAutomatedDeviceEnroller *)self setFinalized:1];
    [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:11];
    [(DMTAutomatedDeviceEnroller *)self eraseAllContentAndSettingsWithExternalError:v5];
  }
}

- (void)eraseAndShutDownWithExternalError:(id)a3
{
  id v5 = a3;
  if ([(DMTAutomatedDeviceEnroller *)self isFinalized])
  {
    v6 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:](a2);
    }
  }
  else
  {
    [(DMTAutomatedDeviceEnroller *)self setFinalized:1];
    [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:12];
    [(DMTAutomatedDeviceEnroller *)self eraseAllContentAndSettingsWithExternalError:v5];
  }
}

- (void)eraseCurrentNetworkIfNeeded
{
  v3 = [(DMTAutomatedDeviceEnroller *)self installedNetworkPayloadIdentifier];

  if (v3)
  {
    [(DMTAutomatedDeviceEnroller *)self uninstallProfile];
  }
  else
  {
    uint64_t v4 = [(DMTAutomatedDeviceEnroller *)self networkCredential];
    if (v4
      && (id v5 = (void *)v4,
          [(DMTAutomatedDeviceEnroller *)self networkName],
          v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 length],
          v6,
          v5,
          v7))
    {
      [(DMTAutomatedDeviceEnroller *)self disassociateWiFi];
    }
    else
    {
      v8 = _DMTLogGeneral_2();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl(&dword_22D3D6000, v8, OS_LOG_TYPE_INFO, "No network configuration needs to be erased", v9, 2u);
      }
    }
  }
}

- (DMTErasePrimitives)nonDestructiveErasePrimitives
{
  nonDestructiveErasePrimitives = self->_nonDestructiveErasePrimitives;
  if (!nonDestructiveErasePrimitives)
  {
    uint64_t v4 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22D3D6000, v4, OS_LOG_TYPE_INFO, "non-destructive erase primitives not found, substituting destructive primtives", v7, 2u);
    }

    nonDestructiveErasePrimitives = self->_destructiveErasePrimitives;
  }
  id v5 = nonDestructiveErasePrimitives;
  return v5;
}

- (void)tearDownWithFatalError:(id)a3
{
  [(DMTAutomatedDeviceEnroller *)self setEnrollmentError:a3];
  [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:14];
}

- (void)waitForReachabilityWithTimeout:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [DMTWaitForKVOChangeOperation alloc];
  v6 = [(DMTAutomatedDeviceEnroller *)self reachabilityPrimitives];
  uint64_t v7 = [(DMTWaitForKVOChangeOperation *)v5 initWithObservedObject:v6 keyPath:@"reachable" expectedValue:MEMORY[0x263EFFA88] requireExpectedValue:0];

  v8 = [[DMTTimeoutOperation alloc] initWithOperation:v7 timeout:1 cancelsOnTimeout:a3];
  [(DMTTimeoutOperation *)v8 addTarget:self selector:sel_timeoutOperationDidFinish_ forOperationEvents:6];
  BOOL v9 = _DMTLogEnrollment();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [NSNumber numberWithDouble:a3];
    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl(&dword_22D3D6000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for reachability for %{public}@ seconds", buf, 0xCu);
  }
  v11 = [(DMTAutomatedDeviceEnroller *)self operationQueue];
  v13[0] = v7;
  v13[1] = v8;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v11 addOperations:v12 waitUntilFinished:0];
}

- (void)timeoutOperationDidFinish:(id)a3
{
  uint64_t v4 = [(DMTAutomatedDeviceEnroller *)self reachabilityPrimitives];
  char v5 = [v4 reachable];

  if (v5)
  {
    v6 = _DMTLogEnrollment();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_DEFAULT, "Internet connection acquired...", v16, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self checkActivationStatus];
  }
  else
  {
    uint64_t v7 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller timeoutOperationDidFinish:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    v15 = DMTEnrollmentTimeoutErrorForNetworkConfiguration([(DMTAutomatedDeviceEnroller *)self networkConfiguration]);
    [(DMTAutomatedDeviceEnroller *)self tearDownWithFatalError:v15];
  }
}

- (void)joinNetwork
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "networkConfiguration"));
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_DEBUG, "Unknown network configuration: %{public}@", v4, 0xCu);
}

- (void)verifyProfile
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Validating Profile...", buf, 2u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke;
  v6[3] = &unk_2649A9730;
  v6[4] = self;
  uint64_t v4 = [MEMORY[0x263F086D0] blockOperationWithBlock:v6];
  uint64_t v5 = [(DMTAutomatedDeviceEnroller *)self operationQueue];
  [v5 addOperation:v4];
}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) networkPayload];
  id v16 = 0;
  v3 = +[DMTConfigurationProfile configurationProfileWithData:v2 error:&v16];
  id v4 = v16;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v5 = +[DMTConfigurationProfileValidatorBundles macBuddyNetworkProfileValidators];
  id v14 = v4;
  int v6 = [v3 validateWithValidators:v5 error:&v14];
  id v7 = v14;

  if (!v6)
  {
    id v4 = v7;
LABEL_5:
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_3;
    v9[3] = &unk_2649A9BB8;
    uint64_t v8 = &v11;
    objc_copyWeak(&v11, &location);
    id v7 = v4;
    id v10 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);

    goto LABEL_6;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_2;
  block[3] = &unk_2649A9C30;
  uint64_t v8 = &v13;
  objc_copyWeak(&v13, &location);
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_6:
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained installProfile];
}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained tearDownWithFatalError:*(void *)(a1 + 32)];
}

- (void)installProfile
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Installing Profile...", v9, 2u);
  }

  id v4 = [DMTInstallProfileOperation alloc];
  uint64_t v5 = [(DMTAutomatedDeviceEnroller *)self profileInstallationPrimitives];
  int v6 = [(DMTAutomatedDeviceEnroller *)self networkPayload];
  id v7 = [(DMTInstallProfileOperation *)v4 initWithProfileInstallationPrimitives:v5 profileData:v6];

  [(DMTInstallProfileOperation *)v7 addTarget:self selector:sel_profileInstallationDidFinish_ forOperationEvents:6];
  uint64_t v8 = [(DMTAutomatedDeviceEnroller *)self operationQueue];
  [v8 addOperation:v7];
}

- (void)profileInstallationDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 error];

  if (v5)
  {
    id v9 = [v4 error];

    [(DMTAutomatedDeviceEnroller *)self tearDownWithFatalError:v9];
  }
  else
  {
    int v6 = [v4 resultObject];

    [(DMTAutomatedDeviceEnroller *)self setInstalledNetworkPayloadIdentifier:v6];
    id v7 = [(DMTAutomatedDeviceEnroller *)self reachabilityPrimitives];
    LODWORD(v6) = [v7 reachable];

    if (v6)
    {
      uint64_t v8 = _DMTLogGeneral_2();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D3D6000, v8, OS_LOG_TYPE_INFO, "Already reachable, skipping to enrollment", buf, 2u);
      }

      [(DMTAutomatedDeviceEnroller *)self enrollDevice];
    }
    else
    {
      [(DMTAutomatedDeviceEnroller *)self waitForReachabilityWithTimeout:30.0];
    }
  }
}

- (void)uninstallProfile
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling Profile...", v9, 2u);
  }

  id v4 = [DMTUninstallProfileOperation alloc];
  uint64_t v5 = [(DMTAutomatedDeviceEnroller *)self profileInstallationPrimitives];
  int v6 = [(DMTAutomatedDeviceEnroller *)self installedNetworkPayloadIdentifier];
  id v7 = [(DMTUninstallProfileOperation *)v4 initWithProfileInstallationPrimitives:v5 profileIdentifier:v6];

  [(DMTUninstallProfileOperation *)v7 addTarget:self selector:sel_profileUninstallDidFinish_ forOperationEvents:6];
  uint64_t v8 = [(DMTAutomatedDeviceEnroller *)self operationQueue];
  [v8 addOperation:v7];
}

- (void)profileUninstallDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 error];

  if (v5)
  {
    int v6 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller profileUninstallDidFinish:](self, v4);
    }
  }
  else
  {
    [(DMTAutomatedDeviceEnroller *)self setInstalledNetworkPayloadIdentifier:0];
    int v6 = _DMTLogEnrollment();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_DEFAULT, "Profile uninstalled successfully", v7, 2u);
    }
  }
}

- (void)joinNetworkUsingCredentials
{
  objc_initWeak(&location, self);
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Joining network using provided credentials...", buf, 2u);
  }

  id v4 = [(DMTAutomatedDeviceEnroller *)self wifiPrimitives];
  uint64_t v5 = [(DMTAutomatedDeviceEnroller *)self networkCredential];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke;
  v6[3] = &unk_2649A9E00;
  objc_copyWeak(&v7, &location);
  [v4 joinWiFiNetworkWithCredential:v5 timeout:v6 completion:60.0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke_2;
  block[3] = &unk_2649A9DD8;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didJoinNetworkWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)didJoinNetworkWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    [(DMTAutomatedDeviceEnroller *)self waitForReachabilityWithTimeout:30.0];
  }
  else
  {
    id v7 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller didJoinNetworkWithSuccess:error:](self);
    }

    [(DMTAutomatedDeviceEnroller *)self tearDownWithFatalError:v6];
  }
}

- (void)disassociateWiFi
{
  v3 = _DMTLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_INFO, "Disassociating current WiFi network...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(DMTAutomatedDeviceEnroller *)self wifiPrimitives];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke;
  v5[3] = &unk_2649A9E00;
  objc_copyWeak(&v6, buf);
  [v4 disassociateWiFiNetworkWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke_2;
  block[3] = &unk_2649A9DD8;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didDisassociateFromNetworkWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)didDisassociateFromNetworkWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = _DMTLogEnrollment();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_22D3D6000, v7, OS_LOG_TYPE_DEFAULT, "Disassociated current WiFi network successfully", v8, 2u);
    }
  }
  else
  {
    id v7 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller didDisassociateFromNetworkWithSuccess:error:](self);
    }
  }
}

- (void)checkActivationStatus
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Checking activation status...", (uint8_t *)buf, 2u);
  }

  [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:8];
  objc_initWeak(buf, self);
  id v4 = [(DMTAutomatedDeviceEnroller *)self activationPrimitives];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke;
  v5[3] = &unk_2649A9E00;
  objc_copyWeak(&v6, buf);
  [v4 fetchActivationStateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke_2;
  block[3] = &unk_2649A9DD8;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained activationStatusFetchComplete:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)activationStatusFetchComplete:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _DMTLogEnrollment();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:v4];
    id v9 = [v6 verboseDescription];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v9;
    _os_log_impl(&dword_22D3D6000, v7, OS_LOG_TYPE_DEFAULT, "Activation status fetched: %{public}@, error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (v4)
  {
    char v10 = _DMTLogEnrollment();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22D3D6000, v10, OS_LOG_TYPE_DEFAULT, "Device is already activated...", (uint8_t *)&v11, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self checkIfAlreadyEnrolled];
  }
  else
  {
    [(DMTAutomatedDeviceEnroller *)self activateDevice];
  }
}

- (void)activateDevice
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Activating device...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  BOOL v4 = [(DMTAutomatedDeviceEnroller *)self activationPrimitives];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke;
  v5[3] = &unk_2649A9E00;
  objc_copyWeak(&v6, buf);
  [v4 activateWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke_2;
  block[3] = &unk_2649A9DD8;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained activationCompleteWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)activationCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = _DMTLogEnrollment();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22D3D6000, v7, OS_LOG_TYPE_DEFAULT, "Device activation successful...", v9, 2u);
    }

    [(DMTAutomatedDeviceEnroller *)self checkIfAlreadyEnrolled];
  }
  else
  {
    id v8 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller activationCompleteWithSuccess:error:]();
    }

    [(DMTAutomatedDeviceEnroller *)self tearDownWithFatalError:v6];
  }
}

- (void)checkIfAlreadyEnrolled
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D3D6000, log, OS_LOG_TYPE_ERROR, "Device is already enrolled according to enrollmentInformationPrimitives...", v1, 2u);
}

- (void)enrollDevice
{
  v3 = _DMTLogEnrollment();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_DEFAULT, "Starting enrollment...", (uint8_t *)buf, 2u);
  }

  [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:9];
  objc_initWeak(buf, self);
  BOOL v4 = [(DMTAutomatedDeviceEnroller *)self enrollmentPrimitives];
  id v5 = [(DMTAutomatedDeviceEnroller *)self enrollmentNonce];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke;
  v6[3] = &unk_2649A9E50;
  void v6[4] = self;
  objc_copyWeak(&v7, buf);
  [v4 enrollWithNonce:v5 completionBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) enrollmentInformationPrimitives];
  char v10 = [v9 isEnrolled];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke_2;
  v13[3] = &unk_2649A9E28;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  char v17 = a2;
  char v18 = v10;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v16);
}

void __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56) || !*(unsigned char *)(a1 + 57))
    {
      [WeakRetained enrollmentCompleteWithResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v7 = *MEMORY[0x263F08608];
      v8[0] = v4;
      id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
      id v6 = DMTErrorWithCodeAndUserInfo(100, v5);

      [v3 enrollmentCompleteWithResponse:*(void *)(a1 + 40) error:v6];
    }
  }
}

- (void)enrollmentCompleteWithResponse:(id)a3 error:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _DMTLogEnrollment();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (!v5) {
      uint64_t v7 = @"YES";
    }
    int v9 = 138543362;
    char v10 = v7;
    _os_log_impl(&dword_22D3D6000, v6, OS_LOG_TYPE_DEFAULT, "Enrollment complete: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(DMTAutomatedDeviceEnroller *)self setEnrollmentError:v5];
  if (v5) {
    uint64_t v8 = 14;
  }
  else {
    uint64_t v8 = 10;
  }
  [(DMTAutomatedDeviceEnroller *)self setEnrollmentState:v8];
}

- (void)eraseAllContentAndSettingsWithExternalError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(DMTAutomatedDeviceEnroller *)self enrollmentError];
    if (!v6)
    {
      uint64_t v7 = [(DMTAutomatedDeviceEnroller *)self nonDestructiveErasePrimitives];
      goto LABEL_5;
    }
  }
  uint64_t v7 = [(DMTAutomatedDeviceEnroller *)self destructiveErasePrimitives];
LABEL_5:
  uint64_t v8 = (void *)v7;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__DMTAutomatedDeviceEnroller_eraseAllContentAndSettingsWithExternalError___block_invoke;
  v9[3] = &unk_2649A9BE0;
  objc_copyWeak(&v10, &location);
  [v8 performEraseWithCompletion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __74__DMTAutomatedDeviceEnroller_eraseAllContentAndSettingsWithExternalError___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained performSelectorOnMainThread:sel_eraseAllContentAndSettingsDidFinishWithError_ withObject:v5 waitUntilDone:0];
  }
}

- (void)eraseAllContentAndSettingsDidFinishWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _DMTLogGeneral_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[DMTAutomatedDeviceEnroller eraseAllContentAndSettingsDidFinishWithError:]();
    }
  }
  int64_t v6 = [(DMTAutomatedDeviceEnroller *)self enrollmentState];
  uint64_t v7 = [(DMTAutomatedDeviceEnroller *)self powerOffPrimitives];
  uint64_t v8 = v7;
  if (v6 == 11) {
    [v7 reboot];
  }
  else {
    [v7 shutDown];
  }
}

- (DMTAutomatedDeviceEnrollmentPrimitives)enrollmentPrimitives
{
  return self->_enrollmentPrimitives;
}

- (DMTEnrollmentInformationPrimitives)enrollmentInformationPrimitives
{
  return self->_enrollmentInformationPrimitives;
}

- (DMTInternetReachabilityPrimitives)reachabilityPrimitives
{
  return self->_reachabilityPrimitives;
}

- (DMTActivationPrimitives)activationPrimitives
{
  return self->_activationPrimitives;
}

- (DMTWiFiPrimitives)wifiPrimitives
{
  return self->_wifiPrimitives;
}

- (DMTProfileInstallationPrimitives)profileInstallationPrimitives
{
  return self->_profileInstallationPrimitives;
}

- (DMTErasePrimitives)destructiveErasePrimitives
{
  return self->_destructiveErasePrimitives;
}

- (DMTPowerOffPrimitives)powerOffPrimitives
{
  return self->_powerOffPrimitives;
}

- (NSString)organizationName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOrganizationName:(id)a3
{
}

- (int64_t)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(int64_t)a3
{
  self->_organizationType = a3;
}

- (NSString)mdmServerName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMdmServerName:(id)a3
{
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNetworkName:(id)a3
{
}

- (int64_t)enrollmentState
{
  return self->_enrollmentState;
}

- (void)setEnrollmentState:(int64_t)a3
{
  self->_enrollmentState = a3;
}

- (NSError)enrollmentError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEnrollmentError:(id)a3
{
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)installedNetworkPayloadIdentifier
{
  return self->_installedNetworkPayloadIdentifier;
}

- (void)setInstalledNetworkPayloadIdentifier:(id)a3
{
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (DMTNetworkCredential)networkCredential
{
  return self->_networkCredential;
}

- (void)setNetworkCredential:(id)a3
{
}

- (NSData)networkPayload
{
  return self->_networkPayload;
}

- (void)setNetworkPayload:(id)a3
{
}

- (NSString)enrollmentNonce
{
  return self->_enrollmentNonce;
}

- (void)setEnrollmentNonce:(id)a3
{
}

- (int64_t)postEnrollmentBehavior
{
  return self->_postEnrollmentBehavior;
}

- (void)setPostEnrollmentBehavior:(int64_t)a3
{
  self->_postEnrollmentBehavior = a3;
}

- (int64_t)networkConfiguration
{
  return self->_networkConfiguration;
}

- (void)setNetworkConfiguration:(int64_t)a3
{
  self->_networkConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentNonce, 0);
  objc_storeStrong((id *)&self->_networkPayload, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_installedNetworkPayloadIdentifier, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentError, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_mdmServerName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_powerOffPrimitives, 0);
  objc_storeStrong((id *)&self->_destructiveErasePrimitives, 0);
  objc_storeStrong((id *)&self->_profileInstallationPrimitives, 0);
  objc_storeStrong((id *)&self->_wifiPrimitives, 0);
  objc_storeStrong((id *)&self->_activationPrimitives, 0);
  objc_storeStrong((id *)&self->_reachabilityPrimitives, 0);
  objc_storeStrong((id *)&self->_enrollmentInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_enrollmentPrimitives, 0);
  objc_storeStrong((id *)&self->_nonDestructiveErasePrimitives, 0);
}

- (void)setNetworkCredential:(const char *)a1 networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_22D3D6000, v2, v3, "Already finalized, refusing to call %{public}@", v4, v5, v6, v7, v8);
}

- (void)timeoutOperationDidFinish:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)profileUninstallDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v3 = [a1 installedNetworkPayloadIdentifier];
  id v10 = [a2 error];
  OUTLINED_FUNCTION_1_0(&dword_22D3D6000, v4, v5, "Failed to uninstall profile %{public}@ with error: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)didJoinNetworkWithSuccess:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 networkCredential];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_22D3D6000, v3, v4, "Failed to join %{private}@ with error: %{public}@", v5, v6, v7, v8, v9);
}

- (void)didDisassociateFromNetworkWithSuccess:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 networkCredential];
  uint64_t v2 = [v1 networkName];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_22D3D6000, v3, v4, "Failed to disassociate network %{private}@ with error: %{public}@", v5, v6, v7, v8, v9);
}

- (void)activationCompleteWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_22D3D6000, v0, v1, "Device activation failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)eraseAllContentAndSettingsDidFinishWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_22D3D6000, v0, v1, "Erase All Content And Settings failed: %{public}@", v2, v3, v4, v5, v6);
}

@end