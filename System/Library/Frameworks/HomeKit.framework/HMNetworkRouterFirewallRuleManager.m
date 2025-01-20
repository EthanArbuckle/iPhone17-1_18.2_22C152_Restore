@interface HMNetworkRouterFirewallRuleManager
- (HMFMessageDestination)messageDestination;
- (HMHomeManager)homeManager;
- (HMNetworkRouterFirewallRuleManager)initWithHomeManager:(id)a3;
- (void)__sendMessage:(id)a3;
- (void)_addOverrides:(id)a3 replace:(BOOL)a4 completion:(id)a5;
- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8;
- (void)_dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8;
- (void)_dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8;
- (void)_fetchCloudChangesWithForceChangesFound:(BOOL)a3 completion:(id)a4;
- (void)_removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5;
- (void)addOverrides:(id)a3 completion:(id)a4;
- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5;
- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7;
- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6;
- (void)fetchCloudChangesAndForceChangesFoundWithCompletion:(id)a3;
- (void)fetchCloudChangesWithCompletion:(id)a3;
- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5;
- (void)removeAllLocalRulesWithCompletion:(id)a3;
- (void)removeAllOverridesWithCompletion:(id)a3;
- (void)setOverrides:(id)a3 completion:(id)a4;
@end

@implementation HMNetworkRouterFirewallRuleManager

- (HMNetworkRouterFirewallRuleManager)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMNetworkRouterFirewallRuleManager;
  v5 = [(HMNetworkRouterFirewallRuleManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeManager, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    v8 = [v4 messageTargetUUID];
    uint64_t v9 = [v7 initWithTarget:v8];
    messageDestination = v6->_messageDestination;
    v6->_messageDestination = (HMFMessageDestination *)v9;

    v11 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDestination, 0);

  objc_destroyWeak((id *)&self->_homeManager);
}

- (HMFMessageDestination)messageDestination
{
  return self->_messageDestination;
}

- (HMHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  return (HMHomeManager *)WeakRetained;
}

- (void)fetchCloudChangesAndForceChangesFoundWithCompletion:(id)a3
{
}

- (void)fetchCloudChangesWithCompletion:(id)a3
{
}

- (void)_fetchCloudChangesWithForceChangesFound:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = v7;
  if (v4) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerFetchCloudChangesForceChangeNotificationsKey"];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F654B0];
  v10 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  v11 = (void *)[v8 copy];
  v12 = [v9 messageWithName:@"HMNetworkRouterFirewallRuleManagerFetchCloudChangesMessageKey" destination:v10 payload:v11];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __89__HMNetworkRouterFirewallRuleManager__fetchCloudChangesWithForceChangesFound_completion___block_invoke;
  v17 = &unk_1E5944EF0;
  v18 = self;
  id v19 = v6;
  id v13 = v6;
  [v12 setResponseHandler:&v14];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v12, v14, v15, v16, v17, v18);
}

void __89__HMNetworkRouterFirewallRuleManager__fetchCloudChangesWithForceChangesFound_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 homeManager];
  v5 = [v7 context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)removeAllOverridesWithCompletion:(id)a3
{
}

- (void)_removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v12 = v11;
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductGroupKey"];
  }
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductNumberKey"];
  }
  id v13 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v14 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  uint64_t v15 = (void *)[v12 copy];
  v16 = [v13 messageWithName:@"HMNetworkRouterFirewallRuleManagerRemoveOverridesMessageKey" destination:v14 payload:v15];

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __95__HMNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke;
  v21 = &unk_1E5944EF0;
  v22 = self;
  id v23 = v10;
  id v17 = v10;
  [v16 setResponseHandler:&v18];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v16, v18, v19, v20, v21, v22);
}

void __95__HMNetworkRouterFirewallRuleManager__removeOverridesForProductGroup_productNumber_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 homeManager];
  v5 = [v7 context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)addOverrides:(id)a3 completion:(id)a4
{
}

- (void)setOverrides:(id)a3 completion:(id)a4
{
}

- (void)_addOverrides:(id)a3 replace:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v19[0] = @"HMNetworkRouterFirewallRuleManagerAddOverridesDataKey";
  v19[1] = @"HMNetworkRouterFirewallRuleManagerAddOverridesReplaceKey";
  v20[0] = a3;
  id v9 = NSNumber;
  id v10 = a3;
  v11 = [v9 numberWithBool:v5];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  id v13 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v14 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  uint64_t v15 = [v13 messageWithName:@"HMNetworkRouterFirewallRuleManagerAddOverridesMessageKey" destination:v14 payload:v12];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__HMNetworkRouterFirewallRuleManager__addOverrides_replace_completion___block_invoke;
  v17[3] = &unk_1E5944EF0;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v15 setResponseHandler:v17];
  [(HMNetworkRouterFirewallRuleManager *)self __sendMessage:v15];
}

void __71__HMNetworkRouterFirewallRuleManager__addOverrides_replace_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 homeManager];
  BOOL v5 = [v7 context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)removeAllLocalRulesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F654B0];
  id v6 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  id v7 = [v5 messageWithName:@"HMNetworkRouterFirewallRuleManagerRemoveLocalRulesMessageKey" destination:v6 payload:MEMORY[0x1E4F1CC08]];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __72__HMNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke;
  v12 = &unk_1E5944EF0;
  id v13 = self;
  id v14 = v4;
  id v8 = v4;
  [v7 setResponseHandler:&v9];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v7, v9, v10, v11, v12, v13);
}

void __72__HMNetworkRouterFirewallRuleManager_removeAllLocalRulesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 homeManager];
  BOOL v5 = [v7 context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = v18;
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductGroupKey"];
  }
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductNumberKey"];
  }
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpPairedMetadataFirmwareVersionKey"];
  }
  if (v10) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpPairedMetadataIgnoreOverridesKey"];
  }
  if (v9) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"];
  }
  v20 = (void *)MEMORY[0x1E4F654B0];
  v21 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  v22 = (void *)[v19 copy];
  id v23 = [v20 messageWithName:@"HMNetworkRouterFirewallRuleManagerDumpPairedMetadataMessageKey" destination:v21 payload:v22];

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __140__HMNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
  v28 = &unk_1E5944EF0;
  v29 = self;
  id v30 = v17;
  id v24 = v17;
  [v23 setResponseHandler:&v25];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v23, v25, v26, v27, v28, v29);
}

void __140__HMNetworkRouterFirewallRuleManager__dumpPairedMetadataForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    a3 = [a3 objectForKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpResponseKey"];
  }
  BOOL v5 = [*(id *)(a1 + 32) homeManager];
  id v6 = [v5 context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v8 obj:a3];
}

- (void)dumpLocalRulesForProductGroup:(id)a3 ignoreOverrides:(BOOL)a4 rawOutput:(BOOL)a5 completion:(id)a6
{
}

- (void)dumpAllLocalRulesIgnoringOverrides:(BOOL)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
}

- (void)_dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v19 = v18;
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductGroupKey"];
  }
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductNumberKey"];
  }
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpLocalRulesFirmwareVersionKey"];
  }
  if (v10) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpLocalRulesIgnoreOverridesKey"];
  }
  if (v9) {
    [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"];
  }
  v20 = (void *)MEMORY[0x1E4F654B0];
  v21 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  v22 = (void *)[v19 copy];
  id v23 = [v20 messageWithName:@"HMNetworkRouterFirewallRuleManagerDumpLocalRulesMessageKey" destination:v21 payload:v22];

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __136__HMNetworkRouterFirewallRuleManager__dumpLocalRulesForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke;
  v28 = &unk_1E5944EF0;
  v29 = self;
  id v30 = v17;
  id v24 = v17;
  [v23 setResponseHandler:&v25];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v23, v25, v26, v27, v28, v29);
}

void __136__HMNetworkRouterFirewallRuleManager__dumpLocalRulesForProductGroup_productNumber_firmwareVersion_ignoreOverrides_rawOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    a3 = [a3 objectForKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpResponseKey"];
  }
  BOOL v5 = [*(id *)(a1 + 32) homeManager];
  id v6 = [v5 context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v8 obj:a3];
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
}

- (void)listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
}

- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  id v18 = v17;
  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductGroupKey"];
  }
  if (v15) {
    [v18 setObject:v15 forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerProductNumberKey"];
  }
  if (!v11)
  {
    if (!v10) {
      goto LABEL_7;
    }
LABEL_11:
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpCloudRecordsListOnlyKey"];
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpRawOutputKey"];
  if (v10) {
    goto LABEL_11;
  }
LABEL_7:
  if (v9) {
LABEL_8:
  }
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpCloudRecordsVerifySignaturesKey"];
LABEL_9:
  uint64_t v19 = (void *)MEMORY[0x1E4F654B0];
  v20 = [(HMNetworkRouterFirewallRuleManager *)self messageDestination];
  v21 = (void *)[v18 copy];
  v22 = [v19 messageWithName:@"HMNetworkRouterFirewallRuleManagerDumpCloudRecordsMessageKey" destination:v20 payload:v21];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __132__HMNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
  v27 = &unk_1E5944EF0;
  v28 = self;
  id v29 = v16;
  id v23 = v16;
  [v22 setResponseHandler:&v24];
  -[HMNetworkRouterFirewallRuleManager __sendMessage:](self, "__sendMessage:", v22, v24, v25, v26, v27, v28);
}

void __132__HMNetworkRouterFirewallRuleManager__dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    a3 = [a3 objectForKeyedSubscript:@"HMNetworkRouterFirewallRuleManagerDumpResponseKey"];
  }
  BOOL v5 = [*(id *)(a1 + 32) homeManager];
  id v6 = [v5 context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v8 obj:a3];
}

- (void)__sendMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMNetworkRouterFirewallRuleManager *)self homeManager];
  id v6 = [v5 context];
  id v7 = [v6 queue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke;
  v10[3] = &unk_1E5945628;
  id v11 = v4;
  id v12 = v5;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, v10);
}

void __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) responseHandler];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_2;
  BOOL v10 = &unk_1E5944EF0;
  id v11 = *(id *)(a1 + 40);
  id v12 = v2;
  v3 = *(void **)(a1 + 32);
  id v4 = v2;
  [v3 setResponseHandler:&v7];
  BOOL v5 = objc_msgSend(*(id *)(a1 + 40), "context", v7, v8, v9, v10);
  id v6 = [v5 messageDispatcher];
  [v6 sendMessage:*(void *)(a1 + 32) completionHandler:0];
}

void __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) context];
  uint64_t v8 = [v7 queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_3;
  v12[3] = &unk_1E5944360;
  id v13 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v9;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, v12);
}

uint64_t __52__HMNetworkRouterFirewallRuleManager___sendMessage___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[7] + 16))(a1[7], a1[5], a1[6]);
}

@end