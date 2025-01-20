@interface WFSetVPNAction
- (id)disabledOnPlatforms;
- (id)missingVPNError;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)saveToPreferencesWithVPNManager:(id)a3;
@end

@implementation WFSetVPNAction

- (id)missingVPNError
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F870B8];
  v9[0] = *MEMORY[0x263F08338];
  v4 = WFLocalizedString(@"VPN not found");
  v10[0] = v4;
  v9[1] = *MEMORY[0x263F08320];
  v5 = WFLocalizedString(@"The VPN you selected is not available on this device.");
  v10[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:6 userInfo:v6];

  return v7;
}

- (void)saveToPreferencesWithVPNManager:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__WFSetVPNAction_saveToPreferencesWithVPNManager___block_invoke;
  v3[3] = &unk_264E5EBC8;
  v3[4] = self;
  [a3 saveToPreferencesWithCompletionHandler:v3];
}

void __50__WFSetVPNAction_saveToPreferencesWithVPNManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      v6 = "-[WFSetVPNAction saveToPreferencesWithVPNManager:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_23C364000, v4, OS_LOG_TYPE_ERROR, "%s Failed to save VPN configuration with error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  [*(id *)(a1 + 32) finishRunningWithError:v3];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(WFSetVPNAction *)self parameterValueForKey:@"WFVPNOperation" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"Set On Demand"])
  {
    v6 = [(WFSetVPNAction *)self parameterValueForKey:@"WFOnDemandValue" ofClass:objc_opt_class()];
    int v7 = [v6 BOOLValue];

    id v8 = @"Disable On Demand";
    if (v7) {
      id v8 = @"Enable On Demand";
    }
    uint64_t v9 = v8;

    int v5 = v9;
  }
  v10 = [(WFSetVPNAction *)self parameterValueForKey:@"WFVPN" ofClass:objc_opt_class()];
  if (v10)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v11 = (void *)getNEVPNManagerClass_softClass_55483;
    uint64_t v23 = getNEVPNManagerClass_softClass_55483;
    if (!getNEVPNManagerClass_softClass_55483)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __getNEVPNManagerClass_block_invoke_55484;
      v19[3] = &unk_264E5EC88;
      v19[4] = &v20;
      __getNEVPNManagerClass_block_invoke_55484((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v20, 8);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__WFSetVPNAction_runAsynchronouslyWithInput___block_invoke;
    v16[3] = &unk_264E5EBA0;
    v16[4] = self;
    id v17 = v10;
    id v18 = v5;
    [v12 loadAllFromPreferencesWithCompletionHandler:v16];
  }
  else
  {
    uint64_t v24 = *MEMORY[0x263F08338];
    v13 = WFLocalizedString(@"Please provide a VPN to the “Set VPN” action.");
    v25[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

    v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v14];
    [(WFSetVPNAction *)self finishRunningWithError:v15];
  }
}

void __45__WFSetVPNAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = [a1[5] identifier];
    uint64_t v9 = objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v8, @"identifier");

    if (v9
      || ([a1[5] title],
          v10 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v10, @"localizedDescription"),
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      if ([a1[6] isEqualToString:@"Connect"])
      {
        v11 = getWFActionsLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [v9 connection];
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          __int16 v42 = 2112;
          id v43 = v12;
          _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_DEBUG, "%s Starting VPN: %@", buf, 0x16u);
        }
        if (([v9 isEnabled] & 1) == 0)
        {
          v13 = getWFActionsLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
            __int16 v42 = 2112;
            id v43 = v9;
            _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it.", buf, 0x16u);
          }

          [v9 setEnabled:1];
          [a1[4] saveToPreferencesWithVPNManager:v9];
        }
        v14 = getWFActionsLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          __int16 v42 = 2112;
          id v43 = v9;
          _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_DEBUG, "%s About to start VPN %@", buf, 0x16u);
        }

        v15 = [v9 connection];
        id v39 = 0;
        [v15 startVPNTunnelAndReturnError:&v39];
        id v16 = v39;

        id v17 = getWFActionsLogObject();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_39;
        }
        goto LABEL_17;
      }
      if (![a1[6] isEqualToString:@"Disconnect"])
      {
        if (![a1[6] isEqualToString:@"Toggle"])
        {
          if ([a1[6] isEqualToString:@"Enable On Demand"])
          {
            if (([v9 isEnabled] & 1) == 0)
            {
              v28 = getWFActionsLogObject();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                __int16 v42 = 2112;
                id v43 = v9;
                _os_log_impl(&dword_23C364000, v28, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it before enabling on-demand.", buf, 0x16u);
              }

              [v9 setEnabled:1];
              [a1[4] saveToPreferencesWithVPNManager:v9];
            }
            v29 = v9;
            uint64_t v30 = 1;
          }
          else if ([a1[6] isEqualToString:@"Disable On Demand"])
          {
            v29 = v9;
            uint64_t v30 = 0;
          }
          else
          {
            if (![a1[6] isEqualToString:@"Toggle On Demand"]) {
              goto LABEL_40;
            }
            if (([v9 isEnabled] & 1) == 0)
            {
              v37 = getWFActionsLogObject();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                __int16 v42 = 2112;
                id v43 = v9;
                _os_log_impl(&dword_23C364000, v37, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it before toggling on-demand.", buf, 0x16u);
              }

              [v9 setEnabled:1];
              [a1[4] saveToPreferencesWithVPNManager:v9];
            }
            uint64_t v30 = [v9 isOnDemandEnabled] ^ 1;
            v29 = v9;
          }
          [v29 setOnDemandEnabled:v30];
          [a1[4] saveToPreferencesWithVPNManager:v9];
          goto LABEL_40;
        }
        uint64_t v23 = getWFActionsLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = [v9 connection];
          *(_DWORD *)buf = 136315394;
          v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
          __int16 v42 = 2112;
          id v43 = v24;
          _os_log_impl(&dword_23C364000, v23, OS_LOG_TYPE_DEBUG, "%s Toggling VPN state: %@", buf, 0x16u);
        }
        v25 = [v9 connection];
        if ([v25 status] == 3)
        {
        }
        else
        {
          v31 = [v9 connection];
          uint64_t v32 = [v31 status];

          if (v32 != 2)
          {
            if (([v9 isEnabled] & 1) == 0)
            {
              v33 = getWFActionsLogObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                __int16 v42 = 2112;
                id v43 = v9;
                _os_log_impl(&dword_23C364000, v33, OS_LOG_TYPE_DEBUG, "%s VPN %@ was not enabled, enabling it.", buf, 0x16u);
              }

              [v9 setEnabled:1];
              [a1[4] saveToPreferencesWithVPNManager:v9];
              v34 = getWFActionsLogObject();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
                __int16 v42 = 2112;
                id v43 = v9;
                _os_log_impl(&dword_23C364000, v34, OS_LOG_TYPE_DEBUG, "%s After enabling VPN, its status is %@", buf, 0x16u);
              }
            }
            v35 = getWFActionsLogObject();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
              __int16 v42 = 2112;
              id v43 = v9;
              _os_log_impl(&dword_23C364000, v35, OS_LOG_TYPE_DEBUG, "%s About to start VPN %@", buf, 0x16u);
            }

            v36 = [v9 connection];
            id v38 = 0;
            [v36 startVPNTunnelAndReturnError:&v38];
            id v16 = v38;

            id v17 = getWFActionsLogObject();
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
LABEL_17:
            *(_DWORD *)buf = 136315394;
            v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
            __int16 v42 = 2112;
            id v43 = v9;
            _os_log_impl(&dword_23C364000, v17, OS_LOG_TYPE_DEBUG, "%s Started VPN %@", buf, 0x16u);
LABEL_39:

            [a1[4] finishRunningWithError:v16];
            goto LABEL_40;
          }
        }
        id v17 = [v9 connection];
        [v17 stopVPNTunnel];
        id v16 = 0;
        goto LABEL_39;
      }
      id v18 = getWFActionsLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = [v9 connection];
        *(_DWORD *)buf = 136315394;
        v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
        __int16 v42 = 2112;
        id v43 = v19;
        _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_DEBUG, "%s Stopping VPN: %@", buf, 0x16u);
      }
      uint64_t v20 = [v9 connection];
      [v20 stopVPNTunnel];

      id v21 = a1[4];
      uint64_t v22 = 0;
    }
    else
    {
      v26 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
        _os_log_impl(&dword_23C364000, v26, OS_LOG_TYPE_ERROR, "%s Couldn't find a NEVPNManager matching the configuration identifier.", buf, 0xCu);
      }

      id v27 = a1[4];
      uint64_t v9 = [v27 missingVPNError];
      id v21 = v27;
      uint64_t v22 = v9;
    }
    [v21 finishRunningWithError:v22];
LABEL_40:

    goto LABEL_41;
  }
  int v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[WFSetVPNAction runAsynchronouslyWithInput:]_block_invoke";
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Error loading available VPNs: %@", buf, 0x16u);
  }

  [a1[4] finishRunningWithError:v6];
LABEL_41:
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFSetVPNAction;
  v2 = [(WFSetVPNAction *)&v5 disabledOnPlatforms];
  id v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end