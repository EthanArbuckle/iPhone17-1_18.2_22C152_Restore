@interface WFRunSSHScriptAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)authenticateAndRunAsynchronouslyWithInput:(id)a3 session:(id)a4;
- (void)finishRunningSSHScriptWithError:(id)a3;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)session:(id)a3 didDisconnectWithError:(id)a4;
@end

@implementation WFRunSSHScriptAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in an SSH script on %3$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to run an SSH script on %2$@?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHHost" ofClass:objc_opt_class()];
  if (v5)
  {
    v6 = NSURL;
    id v7 = [NSString stringWithFormat:@"ssh://%@", v5, 0];
    v8 = [v6 URLWithString:v7];

    id v11 = 0;
    id v9 = [MEMORY[0x263F339D0] locationWithURL:v8 error:&v11];
    id v10 = v11;
    v4[2](v4, v9, v10);
  }
  else
  {
    v4[2](v4, 0, 0);
  }
}

- (void)session:(id)a3 didDisconnectWithError:(id)a4
{
}

- (void)finishRunningSSHScriptWithError:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 domain];
  if ([v5 isEqualToString:@"libssh2"])
  {
    uint64_t v6 = [v4 code];

    if (!v6)
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      v27[0] = *MEMORY[0x263F08320];
      v8 = WFLocalizedString(@"Run Script Over SSH could not connect to the SSH server.");
      v28[0] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:1];
      id v10 = [v7 errorWithDomain:@"libssh2" code:0 userInfo:v9];

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v11 = [v4 domain];
  char v12 = [v11 isEqualToString:@"NMSSH"];

  if (v12)
  {
    v27[0] = &unk_26F074B98;
    v13 = WFLocalizedString(@"Connection timed out");
    v27[1] = &unk_26F074BB0;
    v28[0] = v13;
    uint64_t v14 = WFLocalizedString(@"Channel allocation error");
    v28[1] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    uint64_t v16 = [v4 code];
    v17 = [NSNumber numberWithUnsignedInteger:v16];
    v18 = [v15 objectForKey:v17];

    if (v18)
    {
      v19 = (void *)MEMORY[0x263F087E8];
      v20 = [v4 domain];
      uint64_t v21 = [v4 code];
      uint64_t v25 = *MEMORY[0x263F08320];
      v22 = [NSNumber numberWithUnsignedInteger:v16];
      v23 = [v15 objectForKey:v22];
      v26 = v23;
      v24 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v10 = [v19 errorWithDomain:v20 code:v21 userInfo:v24];
    }
    else
    {
      id v10 = v4;
    }
  }
  else
  {
    id v10 = v4;
  }
LABEL_11:

  [(WFRunSSHScriptAction *)self finishRunningWithError:v10];
}

- (void)authenticateAndRunAsynchronouslyWithInput:(id)a3 session:(id)a4
{
  v60[2] = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v6 = a4;
  id v7 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHAuthenticationType" ofClass:objc_opt_class()];
  v8 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHPassword" ofClass:objc_opt_class()];
  id v9 = +[WFSSHKeyPair sharedKeyPair];
  uint64_t v10 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHScript" ofClass:objc_opt_class()];
  id v11 = (void *)v10;
  char v12 = &stru_26F008428;
  if (v10) {
    char v12 = (__CFString *)v10;
  }
  v13 = v12;

  if ([v7 isEqualToString:@"Password"])
  {
    if (([v6 authenticateByPassword:v8] & 1) == 0)
    {
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke;
      v53[3] = &unk_264E56E00;
      id v54 = v8;
      [v6 authenticateByKeyboardInteractiveUsingBlock:v53];
    }
    if (([v6 isAuthorized] & 1) == 0)
    {
      uint64_t v14 = [v6 lastError];
      v45 = (void *)MEMORY[0x263F087E8];
      v15 = [v14 domain];
      uint64_t v16 = [v14 code];
      v59[0] = *MEMORY[0x263F08338];
      v43 = WFLocalizedString(@"SSH Password Authentication Failed");
      v60[0] = v43;
      v59[1] = *MEMORY[0x263F08320];
      v17 = WFLocalizedString(@"Please check your credentials in the Run SSH Script action and try again.");
      v60[1] = v17;
      [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
      v42 = self;
      v18 = v6;
      v19 = v13;
      v20 = v7;
      uint64_t v21 = v9;
      v23 = v22 = v8;
      v24 = [v45 errorWithDomain:v15 code:v16 userInfo:v23];

      v8 = v22;
      id v9 = v21;
      id v7 = v20;
      v13 = v19;
      id v6 = v18;

      [v18 disconnect];
      uint64_t v25 = v42;
LABEL_14:
      -[WFRunSSHScriptAction finishRunningSSHScriptWithError:](v25, "finishRunningSSHScriptWithError:", v24, v42);

      goto LABEL_15;
    }
  }
  else if ([v7 isEqualToString:@"SSH Key"])
  {
    if (!v9)
    {
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F870B8];
      v57[0] = *MEMORY[0x263F08338];
      v30 = WFLocalizedString(@"SSH Key Authentication Failed");
      v58[0] = v30;
      v57[1] = *MEMORY[0x263F08320];
      WFLocalizedString(@"No SSH key was found on this device.");
      v32 = v31 = v8;
      v58[1] = v32;
      [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
      v34 = v33 = v13;
      uint64_t v14 = [v29 errorWithDomain:v46 code:1 userInfo:v34];

      v13 = v33;
      v8 = v31;

      [v6 disconnect];
      [(WFRunSSHScriptAction *)self finishRunningWithError:v14];
      goto LABEL_15;
    }
    v26 = [v9 publicKey];
    v27 = [v9 privateKeyPEM];
    char v28 = [v6 authenticateByInMemoryPublicKey:v26 privateKey:v27 andPassword:0];

    if ((v28 & 1) == 0)
    {
      uint64_t v14 = [v6 lastError];
      v44 = (void *)MEMORY[0x263F087E8];
      v35 = [v14 domain];
      uint64_t v36 = [v14 code];
      v55[0] = *MEMORY[0x263F08338];
      WFLocalizedString(@"SSH Key Authentication Failed");
      v42 = (WFRunSSHScriptAction *)objc_claimAutoreleasedReturnValue();
      v56[0] = v42;
      v55[1] = *MEMORY[0x263F08320];
      WFLocalizedString(@"Make sure the SSH server has this device's public key in its list of authorized keys.");
      v47 = v13;
      v38 = v37 = v8;
      v56[1] = v38;
      [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
      v39 = v7;
      v41 = v40 = v9;
      v24 = [v44 errorWithDomain:v35 code:v36 userInfo:v41];

      id v9 = v40;
      id v7 = v39;

      v8 = v37;
      v13 = v47;

      [v6 disconnect];
      uint64_t v25 = self;
      goto LABEL_14;
    }
  }
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_2;
  v49[3] = &unk_264E56E50;
  id v50 = v6;
  v51 = v13;
  v52 = self;
  [v48 getFileRepresentation:v49 forType:0];

  uint64_t v14 = v50;
LABEL_15:
}

id __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) channel];
  v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_3;
  block[3] = &unk_264E56E28;
  id v11 = v3;
  id v12 = v4;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 32);
  id v8 = v4;
  id v9 = v3;
  dispatch_async(v5, block);
}

void __74__WFRunSSHScriptAction_authenticateAndRunAsynchronouslyWithInput_session___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) data];

  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v2)
  {
    [v3 executeCommandAsynchronously:v4];
    v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) data];
    id v19 = 0;
    char v7 = [v5 writeData:v6 error:&v19 timeout:&unk_26F074B80];
    id v8 = v19;

    if (v7)
    {
      if ([*(id *)(a1 + 40) sendEOF]) {
        [*(id *)(a1 + 40) waitEOF];
      }
      id v9 = *(void **)(a1 + 40);
      id v18 = v8;
      uint64_t v10 = [v9 readResponseWithError:&v18 timeout:&unk_26F074B80 userInfo:0];
      id v11 = v18;

      if (!v10)
      {
        [*(id *)(a1 + 64) disconnect];
        [*(id *)(a1 + 56) finishRunningSSHScriptWithError:v11];
        id v8 = v11;
        goto LABEL_15;
      }
      id v8 = v11;
      goto LABEL_11;
    }
LABEL_9:
    [*(id *)(a1 + 56) finishRunningSSHScriptWithError:v8];
    goto LABEL_15;
  }
  id v17 = 0;
  id v12 = (id)[v3 execute:v4 error:&v17];
  id v8 = v17;
  if (v8)
  {
    [*(id *)(a1 + 64) disconnect];
    goto LABEL_9;
  }
  uint64_t v10 = [*(id *)(a1 + 40) lastResponse];
LABEL_11:
  [*(id *)(a1 + 64) disconnect];
  uint64_t v13 = [v10 length];
  uint64_t v14 = *(void **)(a1 + 56);
  if (v13)
  {
    id v15 = [v14 output];
    uint64_t v16 = [MEMORY[0x263F33870] fileWithData:v10 ofType:0 proposedFilename:0];
    [v15 addFile:v16];

    uint64_t v14 = *(void **)(a1 + 56);
  }
  [v14 finishRunningSSHScriptWithError:0];

LABEL_15:
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v82[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (WFRunOpenSSLCpuidSetupIfNeeded_onceToken != -1) {
    dispatch_once(&WFRunOpenSSLCpuidSetupIfNeeded_onceToken, &__block_literal_global_9154);
  }
  v5 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHHost" ofClass:objc_opt_class()];
  id v6 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHPort" ofClass:objc_opt_class()];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [(WFRunSSHScriptAction *)self parameterValueForKey:@"WFSSHUser" ofClass:objc_opt_class()];
  id v9 = (void *)v8;
  uint64_t v10 = &stru_26F008428;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  id v11 = v10;

  id v12 = +[NMSSHSession connectToHost:v5 port:v7 withUsername:v11];
  [v12 setDelegate:self];
  if ([v12 isConnected])
  {
    uint64_t v13 = +[WFSSHKeyPair knownHostFileURL];
    uint64_t v14 = [v13 path];

    v82[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:1];
    uint64_t v16 = [v12 knownHostStatusInFiles:v15];

    if (v16)
    {
      if (v16 == 1)
      {
        v58 = v14;
        id v17 = [(WFRunSSHScriptAction *)self workflow];
        uint64_t v18 = [v17 environment];

        if (v18 == 1)
        {
          id v19 = (void *)MEMORY[0x263F087E8];
          uint64_t v20 = *MEMORY[0x263F870B8];
          v80[0] = *MEMORY[0x263F08338];
          uint64_t v21 = WFLocalizedString(@"SSH Authentication Failed");
          v81[0] = v21;
          v80[1] = *MEMORY[0x263F08320];
          v22 = WFLocalizedString(@"The SSH server has a fingerprint that is different from the fingerprint that was saved when the SSH action was last run.");
          v81[1] = v22;
          v23 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
          v24 = [v19 errorWithDomain:v20 code:1 userInfo:v23];

          [v12 disconnect];
          [(WFRunSSHScriptAction *)self finishRunningWithError:v24];

          uint64_t v14 = v58;
LABEL_17:

          goto LABEL_18;
        }
        uint64_t v54 = [v12 fingerprint:0];
        v56 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
        char v28 = WFLocalizedString(@"Remote Host Identification Has Changed");
        [v56 setTitle:v28];

        v29 = NSString;
        v30 = WFLocalizedString(@"IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!\n\nThis could indicate a man-in-the-middle attack, or it is possible that the host has changed.\n\nThe host key's fingerprint is %@.\n\nAre you sure you want to continue connecting?");
        v31 = objc_msgSend(v29, "stringWithFormat:", v30, v54);
        [v56 setMessage:v31];

        v32 = (void *)MEMORY[0x263F336F0];
        v77[0] = MEMORY[0x263EF8330];
        v77[1] = 3221225472;
        v77[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke;
        v77[3] = &unk_264E5DED8;
        id v33 = v12;
        id v78 = v33;
        v79 = self;
        v34 = [v32 cancelButtonWithHandler:v77];
        [v56 addButton:v34];

        v35 = (void *)MEMORY[0x263F336F0];
        uint64_t v36 = WFLocalizedString(@"Continue Anyway");
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_2;
        v70[3] = &unk_264E56DD8;
        id v71 = v33;
        id v72 = v5;
        uint64_t v76 = v7;
        id v73 = v58;
        v74 = self;
        id v75 = v4;
        v37 = [v35 buttonWithTitle:v36 style:2 handler:v70];
        [v56 addButton:v37];

        uint64_t v14 = v58;
        v38 = [(WFRunSSHScriptAction *)self userInterface];
        [v38 presentAlert:v56];

        v39 = (void *)v54;
LABEL_16:

        goto LABEL_17;
      }
      v26 = [(WFRunSSHScriptAction *)self workflow];
      uint64_t v27 = [v26 environment];

      if (v27 != 1)
      {
        uint64_t v57 = [v12 fingerprint:0];
        v40 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
        WFLocalizedString(@"Unknown Host");
        v41 = v59 = v14;
        v55 = v4;
        v42 = v40;
        [v40 setTitle:v41];

        v43 = NSString;
        v44 = WFLocalizedString(@"The authenticity of host '%@' can't be established because it has not been seen before by this device.\n\nThe host's key fingerprint is %@.\n\nAre you sure you want to continue connecting?");
        v45 = objc_msgSend(v43, "stringWithFormat:", v44, v5, v57);
        uint64_t v46 = v42;
        [v42 setMessage:v45];

        v47 = (void *)MEMORY[0x263F336F0];
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        v67[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_3;
        v67[3] = &unk_264E5DED8;
        id v48 = v12;
        id v68 = v48;
        v69 = self;
        v49 = [v47 cancelButtonWithHandler:v67];
        [v42 addButton:v49];

        id v50 = (void *)MEMORY[0x263F336F0];
        id v4 = v55;
        v51 = WFLocalizedString(@"Connect");
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_4;
        v60[3] = &unk_264E56DD8;
        id v61 = v48;
        id v62 = v5;
        uint64_t v66 = v7;
        id v63 = v59;
        v64 = self;
        id v65 = v55;
        v52 = [v50 buttonWithTitle:v51 style:0 preferred:1 handler:v60];
        [v46 addButton:v52];

        uint64_t v14 = v59;
        v53 = [(WFRunSSHScriptAction *)self userInterface];
        [v53 presentAlert:v46];

        v39 = (void *)v57;
        goto LABEL_16;
      }
      [v12 addKnownHostName:v5 port:v7 toFile:v14 withSalt:0];
    }
    [(WFRunSSHScriptAction *)self authenticateAndRunAsynchronouslyWithInput:v4 session:v12];
    goto LABEL_17;
  }
  uint64_t v25 = [v12 lastError];
  [(WFRunSSHScriptAction *)self finishRunningSSHScriptWithError:v25];

LABEL_18:
}

void __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) disconnect];
  v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishRunningWithError:v3];
}

uint64_t __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addKnownHostName:*(void *)(a1 + 40) port:*(void *)(a1 + 72) toFile:*(void *)(a1 + 48) withSalt:0];
  v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  return [v2 authenticateAndRunAsynchronouslyWithInput:v3 session:v4];
}

void __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) disconnect];
  v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x263F087E8] userCancelledError];
  [v2 finishRunningWithError:v3];
}

uint64_t __51__WFRunSSHScriptAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) addKnownHostName:*(void *)(a1 + 40) port:*(void *)(a1 + 72) toFile:*(void *)(a1 + 48) withSalt:0];
  v2 = *(void **)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  return [v2 authenticateAndRunAsynchronouslyWithInput:v3 session:v4];
}

@end