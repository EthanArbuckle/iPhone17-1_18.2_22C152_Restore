@interface OTControl
+ (id)controlObject:(BOOL)a3 error:(id *)a4;
+ (id)controlObject:(id *)a3;
- (BOOL)sync;
- (BOOL)synchronous;
- (NSXPCConnection)connection;
- (OTControl)initWithConnection:(id)a3 sync:(BOOL)a4;
- (id)getAsyncConnection:(id)a3;
- (id)getConnection:(id)a3;
- (void)appleAccountSignedIn:(id)a3 reply:(id)a4;
- (void)appleAccountSignedOut:(id)a3 reply:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4;
- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)establish:(id)a3 reply:(id)a4;
- (void)fetchAccountSettings:(id)a3 reply:(id)a4;
- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchEgoPeerID:(id)a3 reply:(id)a4;
- (void)fetchEscrowContents:(id)a3 reply:(id)a4;
- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatusAsync:(id)a3 reply:(id)a4;
- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getAccountMetadata:(id)a3 reply:(id)a4;
- (void)getCDPStatus:(id)a3 reply:(id)a4;
- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6;
- (void)invalidateEscrowCache:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)launchBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)leaveClique:(id)a3 reply:(id)a4;
- (void)listOfEligibleBottledPeerRecords:(id)a3;
- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4;
- (void)octagonEncryptionPublicKey:(id)a3;
- (void)octagonSigningPublicKey:(id)a3;
- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6;
- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7;
- (void)preflightBottledPeer:(id)a3 dsid:(id)a4 reply:(id)a5;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4;
- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)reroll:(id)a3 reply:(id)a4;
- (void)reset:(id)a3;
- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10;
- (void)restore:(id)a3 dsid:(id)a4 secret:(id)a5 escrowRecordID:(id)a6 reply:(id)a7;
- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6;
- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7;
- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11;
- (void)scrubBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)setCDPEnabled:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5;
- (void)setSync:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5;
- (void)simulateReceivePush:(id)a3 reply:(id)a4;
- (void)startOctagonStateMachine:(id)a3 reply:(id)a4;
- (void)status:(id)a3 context:(id)a4 reply:(id)a5;
- (void)status:(id)a3 reply:(id)a4;
- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6;
- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6;
- (void)totalTrustedPeers:(id)a3 reply:(id)a4;
- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4;
- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4;
@end

@implementation OTControl

- (void).cxx_destruct
{
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __26__OTControl_reroll_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(OTControl *)self getConnection:v10];
  [v9 reroll:v8 reply:v7];
}

uint64_t __26__OTControl_reroll_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(OTControl *)self getConnection:v10];
  [v9 areRecoveryKeysDistrusted:v8 reply:v7];
}

uint64_t __45__OTControl_areRecoveryKeysDistrusted_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_totalTrustedPeers_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(OTControl *)self getConnection:v10];
  [v9 totalTrustedPeers:v8 reply:v7];
}

uint64_t __37__OTControl_totalTrustedPeers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__OTControl_performCKServerUnreadableDataRemoval_isGuitarfish_altDSID_reply___block_invoke;
  v15[3] = &unk_1E547F618;
  id v16 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a3;
  v14 = [(OTControl *)self getConnection:v15];
  [v14 performCKServerUnreadableDataRemoval:v13 isGuitarfish:v7 altDSID:v12 reply:v11];
}

uint64_t __77__OTControl_performCKServerUnreadableDataRemoval_isGuitarfish_altDSID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__OTControl_clearCliqueFromAccount_resetReason_isGuitarfish_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v15 = v10;
  id v11 = v10;
  id v12 = a3;
  id v13 = [(OTControl *)self getConnection:v14];
  [v13 clearCliqueFromAccount:v12 resetReason:a4 isGuitarfish:v6 reply:v11];
}

uint64_t __67__OTControl_clearCliqueFromAccount_resetReason_isGuitarfish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__OTControl_getAccountMetadata_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = [(OTControl *)self getConnection:v10];
  [v9 getAccountMetadata:v8 reply:v7];
}

uint64_t __38__OTControl_getAccountMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 preflightRecoverOctagonUsingRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

uint64_t __71__OTControl_preflightRecoverOctagonUsingRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_removeRecoveryKey_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 removeRecoveryKey:v8 reply:v7];
}

uint64_t __37__OTControl_removeRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 recoverWithRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

uint64_t __54__OTControl_recoverWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__OTControl_isRecoveryKeySet_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 isRecoveryKeySet:v8 reply:v7];
}

uint64_t __36__OTControl_isRecoveryKeySet_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 setMachineIDOverride:v11 machineID:v10 reply:v9];
}

uint64_t __50__OTControl_setMachineIDOverride_machineID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke;
  v15[3] = &unk_1E547F618;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(OTControl *)self getConnection:v15];
  [v14 tlkRecoverabilityForEscrowRecordData:v13 recordData:v12 source:a5 reply:v11];
}

uint64_t __74__OTControl_tlkRecoverabilityForEscrowRecordData_recordData_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 waitForPriorityViewKeychainDataRecovery:v8 reply:v7];
}

uint64_t __59__OTControl_waitForPriorityViewKeychainDataRecovery_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke;
  v12[3] = &unk_1E547F618;
  id v13 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = [(OTControl *)self getConnection:v12];
  [v11 fetchAccountWideSettingsWithForceFetch:v6 arguments:v10 reply:v9];
}

uint64_t __68__OTControl_fetchAccountWideSettingsWithForceFetch_arguments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__OTControl_fetchAccountSettings_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 fetchAccountSettings:v8 reply:v7];
}

uint64_t __40__OTControl_fetchAccountSettings_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_setAccountSetting_setting_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 setAccountSetting:v11 setting:v10 reply:v9];
}

uint64_t __45__OTControl_setAccountSetting_setting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 fetchTrustedSecureElementIdentities:v8 reply:v7];
}

uint64_t __55__OTControl_fetchTrustedSecureElementIdentities_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 removeLocalSecureElementIdentityPeerID:v11 secureElementIdentityPeerID:v10 reply:v9];
}

uint64_t __86__OTControl_removeLocalSecureElementIdentityPeerID_secureElementIdentityPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 setLocalSecureElementIdentity:v11 secureElementIdentity:v10 reply:v9];
}

uint64_t __71__OTControl_setLocalSecureElementIdentity_secureElementIdentity_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke;
  v18[3] = &unk_1E547F618;
  id v19 = v12;
  id v13 = v12;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(OTControl *)self getConnection:v18];
  [v17 resetAccountCDPContents:v16 idmsTargetContext:v15 idmsCuttlefishPassword:v14 notifyIdMS:v7 reply:v13];
}

uint64_t __95__OTControl_resetAccountCDPContents_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__OTControl_invalidateEscrowCache_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 invalidateEscrowCache:v8 reply:v7];
}

uint64_t __41__OTControl_invalidateEscrowCache_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUserControllableViewsSyncStatusAsync:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getAsyncConnection:v10];
  [v9 fetchUserControllableViewsSyncStatus:v8 reply:v7];
}

uint64_t __61__OTControl_fetchUserControllableViewsSyncStatusAsync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 fetchUserControllableViewsSyncStatus:v8 reply:v7];
}

uint64_t __56__OTControl_fetchUserControllableViewsSyncStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke;
  v12[3] = &unk_1E547F618;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(OTControl *)self getConnection:v12];
  [v11 setUserControllableViewsSyncStatus:v10 enabled:v5 reply:v9];
}

uint64_t __62__OTControl_setUserControllableViewsSyncStatus_enabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__OTControl_fetchEscrowRecords_source_reply___block_invoke;
  v12[3] = &unk_1E547F618;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(OTControl *)self getConnection:v12];
  [v11 fetchEscrowRecords:v10 source:a4 reply:v9];
}

uint64_t __45__OTControl_fetchEscrowRecords_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__OTControl_getCDPStatus_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 getCDPStatus:v8 reply:v7];
}

uint64_t __32__OTControl_getCDPStatus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__OTControl_setCDPEnabled_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 setCDPEnabled:v8 reply:v7];
}

uint64_t __33__OTControl_setCDPEnabled_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__OTControl_refetchCKKSPolicy_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 refetchCKKSPolicy:v8 reply:v7];
}

uint64_t __37__OTControl_refetchCKKSPolicy_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__OTControl_tapToRadar_description_radar_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(OTControl *)self getConnection:v16];
  [v15 tapToRadar:v14 description:v13 radar:v12 reply:v11];
}

uint64_t __48__OTControl_tapToRadar_description_radar_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke;
  v19[3] = &unk_1E547F618;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = [(OTControl *)self getConnection:v19];
  v18 = +[SecXPCHelper cleanseErrorForXPC:v14];

  [v17 postCDPFollowupResult:v16 success:v9 type:v15 error:v18 reply:v13];
}

uint64_t __60__OTControl_postCDPFollowupResult_success_type_error_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__OTControl_waitForOctagonUpgrade_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = [(OTControl *)self getConnection:v10];
  [v9 waitForOctagonUpgrade:v8 reply:v7];
}

uint64_t __41__OTControl_waitForOctagonUpgrade_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__OTControl_simulateReceivePush_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  BOOL v9 = [(OTControl *)self getConnection:v10];
  [v9 simulateReceivePush:v8 reply:v7];
}

uint64_t __39__OTControl_simulateReceivePush_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke;
  v14[3] = &unk_1E547F618;
  id v15 = v10;
  id v11 = v10;
  id v12 = a3;
  id v13 = [(OTControl *)self getConnection:v14];
  [v13 healthCheck:v12 skipRateLimitingCheck:v7 repair:v6 reply:v11];
}

uint64_t __60__OTControl_healthCheck_skipRateLimitingCheck_repair_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
  v19[3] = &unk_1E547F618;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(OTControl *)self getConnection:v19];
  [v18 createInheritanceKey:v17 uuid:v16 claimTokenData:v15 wrappingKeyData:v14 reply:v13];
}

uint64_t __76__OTControl_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(OTControl *)self getConnection:v16];
  [v15 recreateInheritanceKey:v14 uuid:v13 oldIK:v12 reply:v11];
}

uint64_t __53__OTControl_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 checkInheritanceKey:v11 uuid:v10 reply:v9];
}

uint64_t __44__OTControl_checkInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 removeInheritanceKey:v11 uuid:v10 reply:v9];
}

uint64_t __45__OTControl_removeInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 preflightJoinWithInheritanceKey:v11 inheritanceKey:v10 reply:v9];
}

uint64_t __66__OTControl_preflightJoinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 joinWithInheritanceKey:v11 inheritanceKey:v10 reply:v9];
}

uint64_t __57__OTControl_joinWithInheritanceKey_inheritanceKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__OTControl_storeInheritanceKey_ik_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 storeInheritanceKey:v11 ik:v10 reply:v9];
}

uint64_t __42__OTControl_storeInheritanceKey_ik_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 generateInheritanceKey:v11 uuid:v10 reply:v9];
}

uint64_t __47__OTControl_generateInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__OTControl_createInheritanceKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 createInheritanceKey:v11 uuid:v10 reply:v9];
}

uint64_t __45__OTControl_createInheritanceKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 checkCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

uint64_t __50__OTControl_checkCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 removeCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

uint64_t __51__OTControl_removeCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 preflightJoinWithCustodianRecoveryKey:v11 custodianRecoveryKey:v10 reply:v9];
}

uint64_t __78__OTControl_preflightJoinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 joinWithCustodianRecoveryKey:v11 custodianRecoveryKey:v10 reply:v9];
}

uint64_t __69__OTControl_joinWithCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 createCustodianRecoveryKey:v11 uuid:v10 reply:v9];
}

uint64_t __51__OTControl_createCustodianRecoveryKey_uuid_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 joinWithRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

uint64_t __51__OTControl_joinWithRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 createRecoveryKey:v11 recoveryKey:v10 reply:v9];
}

uint64_t __49__OTControl_createRecoveryKey_recoveryKey_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__OTControl_fetchEscrowContents_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 fetchEscrowContents:v8 reply:v7];
}

uint64_t __39__OTControl_fetchEscrowContents_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(OTControl *)self getConnection:v16];
  [v15 restoreFromBottle:v14 entropy:v13 bottleID:v12 reply:v11];
}

uint64_t __54__OTControl_restoreFromBottle_entropy_bottleID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__OTControl_fetchAllViableBottles_source_reply___block_invoke;
  v12[3] = &unk_1E547F618;
  id v13 = v8;
  id v9 = v8;
  id v10 = a3;
  id v11 = [(OTControl *)self getConnection:v12];
  [v11 fetchAllViableBottles:v10 source:a4 reply:v9];
}

uint64_t __48__OTControl_fetchAllViableBottles_source_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 peerDeviceNamesByPeerID:v8 reply:v7];
}

uint64_t __43__OTControl_peerDeviceNamesByPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 removeFriendsInClique:v11 peerIDs:v10 reply:v9];
}

uint64_t __49__OTControl_removeFriendsInClique_peerIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__OTControl_leaveClique_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 leaveClique:v8 reply:v7];
}

uint64_t __31__OTControl_leaveClique_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__OTControl_establish_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 establish:v8 reply:v7];
}

uint64_t __29__OTControl_establish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __130__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply___block_invoke;
  v25[3] = &unk_1E547F618;
  id v26 = v17;
  id v18 = v17;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = [(OTControl *)self getConnection:v25];
  LOBYTE(v24) = a9;
  [v23 resetAndEstablish:v22 resetReason:a4 idmsTargetContext:v21 idmsCuttlefishPassword:v20 notifyIdMS:v11 accountSettings:v19 isGuitarfish:v24 reply:v18];
}

uint64_t __130__OTControl_resetAndEstablish_resetReason_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__OTControl_startOctagonStateMachine_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 startOctagonStateMachine:v8 reply:v7];
}

uint64_t __44__OTControl_startOctagonStateMachine_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 fetchTrustStatus:v11 configuration:v10 reply:v9];
}

uint64_t __50__OTControl_fetchTrustStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v14 = v8;
  id v9 = v8;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v13];
  [v12 fetchCliqueStatus:v11 configuration:v10 reply:v9];
}

uint64_t __51__OTControl_fetchCliqueStatus_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__OTControl_fetchEgoPeerID_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 fetchEgoPeerID:v8 reply:v7];
}

uint64_t __34__OTControl_fetchEgoPeerID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __26__OTControl_status_reply___block_invoke;
  v10[3] = &unk_1E547F618;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v10];
  [v9 status:v8 reply:v7];
}

uint64_t __26__OTControl_status_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)status:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[OTControlArguments alloc] initWithContainerName:v10 contextID:v9 altDSID:0];

  [(OTControl *)self status:v11 reply:v8];
}

- (void)scrubBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28760];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:-4 userInfo:0];
  (*((void (**)(id, id))a5 + 2))(v8, v9);
}

- (void)launchBottledPeer:(id)a3 bottleID:(id)a4 reply:(id)a5
{
  BOOL v5 = (void (**)(id, void *))a5;
  id v6 = secLogObjForScope("octagon");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "launchBottledPeer", v8, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
  v5[2](v5, v7);
}

- (void)preflightBottledPeer:(id)a3 dsid:(id)a4 reply:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28760];
  id v8 = a5;
  id v9 = [v6 errorWithDomain:v7 code:-4 userInfo:0];
  (*((void (**)(id, void, void, void, id))a5 + 2))(v8, 0, 0, 0, v9);
}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke;
  v22[3] = &unk_1E547F618;
  id v13 = v12;
  id v23 = v13;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(OTControl *)self getConnection:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2;
  v20[3] = &unk_1E547F618;
  id v21 = v13;
  id v19 = v13;
  [v18 rpcJoinWithArguments:v17 configuration:v16 vouchData:v15 vouchSig:v14 reply:v20];
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__OTControl_rpcJoinWithArguments_configuration_vouchData_vouchSig_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v18 = a11;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke;
  v32[3] = &unk_1E547F618;
  id v19 = v18;
  id v33 = v19;
  id v29 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [(OTControl *)self getConnection:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2;
  v30[3] = &unk_1E5475E10;
  id v31 = v19;
  id v28 = v19;
  [v27 rpcVoucherWithArguments:v26 configuration:v25 peerID:v24 permanentInfo:v23 permanentInfoSig:v22 stableInfo:v21 stableInfoSig:v20 maxCapability:v29 reply:v30];
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __134__OTControl_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2;
  v14[3] = &unk_1E5475DE8;
  id v15 = v9;
  id v13 = v9;
  [v12 rpcPrepareIdentityAsApplicantWithArguments:v11 configuration:v10 reply:v14];
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__OTControl_rpcPrepareIdentityAsApplicantWithArguments_configuration_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke;
  v16[3] = &unk_1E547F618;
  id v9 = v8;
  id v17 = v9;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(OTControl *)self getConnection:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2;
  v14[3] = &unk_1E5475DC0;
  id v15 = v9;
  id v13 = v9;
  [v12 rpcEpochWithArguments:v11 configuration:v10 reply:v14];
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__OTControl_rpcEpochWithArguments_configuration_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2;
  v11[3] = &unk_1E547F618;
  id v12 = v7;
  id v10 = v7;
  [v9 notifyIDMSTrustLevelChangeForAltDSID:v8 reply:v11];
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__OTControl_notifyIDMSTrustLevelChangeForAltDSID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__OTControl_appleAccountSignedOut_reply___block_invoke_2;
  v11[3] = &unk_1E547F618;
  id v12 = v7;
  id v10 = v7;
  [v9 appleAccountSignedOut:v8 reply:v11];
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__OTControl_appleAccountSignedOut_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke;
  v13[3] = &unk_1E547F618;
  id v7 = v6;
  id v14 = v7;
  id v8 = a3;
  id v9 = [(OTControl *)self getConnection:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__OTControl_appleAccountSignedIn_reply___block_invoke_2;
  v11[3] = &unk_1E547F618;
  id v12 = v7;
  id v10 = v7;
  [v9 appleAccountSignedIn:v8 reply:v11];
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__OTControl_appleAccountSignedIn_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listOfEligibleBottledPeerRecords:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:-4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v6, MEMORY[0x1E4F1CBF0], v7);
}

- (void)octagonEncryptionPublicKey:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:-4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v6, 0, v7);
}

- (void)octagonSigningPublicKey:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:-4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v6, 0, v7);
}

- (void)reset:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28760];
  id v6 = a3;
  id v7 = [v4 errorWithDomain:v5 code:-4 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v6, 0, v7);
}

- (void)restore:(id)a3 dsid:(id)a4 secret:(id)a5 escrowRecordID:(id)a6 reply:(id)a7
{
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28760];
  id v10 = a7;
  id v11 = [v8 errorWithDomain:v9 code:-4 userInfo:0];
  (*((void (**)(id, void, void, id))a7 + 2))(v10, 0, 0, v11);
}

- (id)getAsyncConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OTControl *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)getConnection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(OTControl *)self sync];
  id v6 = [(OTControl *)self connection];
  id v7 = v6;
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v4];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(OTControl *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)OTControl;
  [(OTControl *)&v4 dealloc];
}

- (OTControl)initWithConnection:(id)a3 sync:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OTControl;
  id v8 = [(OTControl *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_sync = a4;
  }

  return v9;
}

+ (id)controlObject:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.security.octagon" options:0];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED87A5D0];
    OTSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    a4 = [[OTControl alloc] initWithConnection:v6 sync:v5];
  }
  else if (a4)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28760];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Couldn't create connection (no reason given)";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v8 errorWithDomain:v9 code:-67671 userInfo:v10];

    a4 = 0;
  }

  return a4;
}

+ (id)controlObject:(id *)a3
{
  return +[OTControl controlObject:0 error:a3];
}

@end