@interface Client
- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9;
- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4;
- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4;
- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7;
- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5;
- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6;
- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5;
- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5;
- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5;
- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4;
- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7;
- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4;
- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)aBlock;
- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4;
- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4;
- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4;
- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7;
- (void)pingWithReply:(id)a3;
- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5;
- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5;
- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6;
- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)aBlock;
- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)aBlock;
- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)aBlock;
- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)aBlock;
- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12;
- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)aBlock;
- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5;
- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7;
- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5;
- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4;
- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4;
- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)aBlock;
- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8;
- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6;
- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)aBlock;
@end

@implementation Client

- (void)pingWithReply:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = (void (*)(void *))v3[2];
  swift_retain();
  v4(v3);
  _Block_release(v3);

  swift_release();
}

- (void)dumpWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)honorIDMSListChangesForSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)octagonPeerIDGivenBottleIDWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
}

- (void)trustedDeviceNamesByPeerIDWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)trustStatusWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchTrustStateWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)resetWithSpecificUser:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 internalAccount:(BOOL)a8 demoAccount:(BOOL)a9 isGuitarfish:(BOOL)a10 accountType:(int64_t)a11 reply:(id)a12
{
  v16 = _Block_copy(a12);
  if (a5)
  {
    uint64_t v17 = sub_100222270();
    a5 = v18;
    if (a6)
    {
LABEL_3:
      uint64_t v19 = sub_100222270();
      a6 = v20;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
LABEL_6:
  _Block_copy(v16);
  id v21 = a3;
  swift_retain();
  sub_1001C1EA0(a3, a4, v17, (uint64_t)a5, v19, (uint64_t)a6, a7, a8, a9, a10, a11, (uint64_t)self, (void (**)(void, void))v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)performCKServerUnreadableDataRemovalWithSpecificUser:(id)a3 isGuitarfish:(BOOL)a4 internalAccount:(BOOL)a5 demoAccount:(BOOL)a6 reply:(id)a7
{
  v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  swift_retain();
  sub_1001C24D4(a3, a4, a5, a6, (uint64_t)self, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_release();
}

- (void)localResetWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)setAllowedMachineIDsWithSpecificUser:(id)a3 allowedMachineIDs:(id)a4 userInitiatedRemovals:(id)a5 evictedRemovals:(id)a6 unknownReasonRemovals:(id)a7 honorIDMSListChanges:(BOOL)a8 version:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 altDSID:(id)a13 trustedDeviceHash:(id)a14 deletedDeviceHash:(id)a15 trustedDevicesUpdateTimestamp:(id)a16 reply:(id)aBlock
{
  v41 = _Block_copy(aBlock);
  uint64_t v49 = sub_100222440();
  if (a5)
  {
    uint64_t v52 = sub_100222440();
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v52 = 0;
    if (a6)
    {
LABEL_3:
      uint64_t v48 = sub_100222440();
      if (a7) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v47 = 0;
      if (a9) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v48 = 0;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v47 = sub_100222440();
  if (a9)
  {
LABEL_5:
    uint64_t v45 = sub_100222270();
    uint64_t v46 = v21;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v45 = 0;
  uint64_t v46 = 0;
LABEL_10:
  id v44 = a3;
  id v22 = a10;
  id v23 = a11;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v43 = a16;
  swift_retain();
  if (v22)
  {
    uint64_t v42 = sub_100222270();
    uint64_t v28 = v27;

    if (v23) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v28 = 0;
    if (v23)
    {
LABEL_12:
      uint64_t v40 = sub_100222270();
      uint64_t v30 = v29;

      if (v24) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  uint64_t v40 = 0;
  uint64_t v30 = 0;
  if (v24)
  {
LABEL_13:
    uint64_t v31 = sub_100222270();
    uint64_t v33 = v32;

    if (v25) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v34 = 0;
    uint64_t v36 = 0;
    if (v26) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v31 = 0;
  uint64_t v33 = 0;
  if (!v25) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v34 = sub_100222270();
  uint64_t v36 = v35;

  if (v26)
  {
LABEL_15:
    uint64_t v37 = sub_100222270();
    uint64_t v39 = v38;

    goto LABEL_21;
  }
LABEL_20:
  uint64_t v37 = 0;
  uint64_t v39 = 0;
LABEL_21:
  _Block_copy(v41);
  sub_1001C343C(v44, v49, v52, v48, v47, a8, v45, v46, v42, v28, v40, v30, v31, v33, v34, v36, v37, v39, (uint64_t)self,
    (void (**)(void, void, void))v41);
  _Block_release(v41);
  _Block_release(v41);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)markTrustedDeviceListFetchFailed:(id)a3 reply:(id)a4
{
}

- (void)fetchAllowedMachineIDsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchEgoEpochWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)prepareWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 setting:(id)a16 signingPrivKeyPersistentRef:(id)a17 encPrivKeyPersistentRef:(id)a18 reply:(id)aBlock
{
  uint64_t v37 = _Block_copy(aBlock);
  uint64_t v45 = (void *)sub_100222270();
  uint64_t v48 = v19;
  id v44 = (char *)sub_100222270();
  uint64_t v47 = v20;
  id v43 = (void *)sub_100222270();
  uint64_t v46 = v21;
  uint64_t v42 = (char *)sub_100222270();
  v54 = v22;
  if (a9)
  {
    uint64_t v41 = sub_100222270();
    uint64_t v52 = v23;
    if (a10)
    {
LABEL_3:
      uint64_t v40 = sub_100222270();
      v51 = v24;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v52 = 0;
    if (a10) {
      goto LABEL_3;
    }
  }
  uint64_t v40 = 0;
  v51 = 0;
LABEL_6:
  uint64_t v38 = sub_100222270();
  uint64_t v50 = v25;
  if (a13) {
    v53 = (void *)sub_1002221D0();
  }
  else {
    v53 = 0;
  }
  swift_retain();
  id v26 = a18;
  id v27 = a17;
  id v49 = a16;
  id v28 = a15;
  id v29 = a12;
  id v30 = a3;
  if (v27)
  {
    uint64_t v31 = sub_100221BF0();
    unint64_t v33 = v32;

    if (v26)
    {
LABEL_11:
      uint64_t v34 = sub_100221BF0();
      unint64_t v36 = v35;

      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v31 = 0;
    unint64_t v33 = 0xF000000000000000;
    if (v26) {
      goto LABEL_11;
    }
  }
  uint64_t v34 = 0;
  unint64_t v36 = 0xF000000000000000;
LABEL_14:
  _Block_copy(v37);
  sub_1001C4E84(v30, v45, v48, v44, v47, v43, v46, v42, v54, v41, v52, v40, v51, v38, v50, v29, v53, a14, v28,
    v49,
    v31,
    v33,
    v34,
    v36,
    (uint64_t)self,
    v37);
  _Block_release(v37);
  _Block_release(v37);
  sub_100039FCC(v34, v36);
  sub_100039FCC(v31, v33);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)prepareInheritancePeerWithSpecificUser:(id)a3 epoch:(unint64_t)a4 machineID:(id)a5 bottleSalt:(id)a6 bottleID:(id)a7 modelID:(id)a8 deviceName:(id)a9 serialNumber:(id)a10 osVersion:(id)a11 policyVersion:(id)a12 policySecrets:(id)a13 syncUserControllableViews:(int)a14 secureElementIdentity:(id)a15 signingPrivKeyPersistentRef:(id)a16 encPrivKeyPersistentRef:(id)a17 crk:(id)a18 reply:(id)aBlock
{
  uint64_t v19 = (uint64_t)a13;
  v20 = _Block_copy(aBlock);
  uint64_t v47 = sub_100222270();
  uint64_t v50 = v21;
  uint64_t v46 = sub_100222270();
  uint64_t v38 = v22;
  if (a9)
  {
    uint64_t v45 = sub_100222270();
    uint64_t v49 = v23;
    id v24 = a17;
    if (a10)
    {
LABEL_3:
      uint64_t v44 = sub_100222270();
      uint64_t v48 = v25;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v49 = 0;
    id v24 = a17;
    if (a10) {
      goto LABEL_3;
    }
  }
  uint64_t v44 = 0;
  uint64_t v48 = 0;
LABEL_6:
  uint64_t v43 = sub_100222270();
  uint64_t v27 = v26;
  if (a13) {
    uint64_t v19 = sub_1002221D0();
  }
  id v28 = a18;
  swift_retain();
  id v29 = v24;
  id v30 = a16;
  id v31 = a15;
  id v32 = a12;
  id v33 = a3;
  if (v30)
  {
    uint64_t v34 = sub_100221BF0();
    unint64_t v40 = v35;
    uint64_t v42 = v34;

    if (v29)
    {
LABEL_10:
      uint64_t v39 = sub_100221BF0();
      unint64_t v37 = v36;

      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v40 = 0xF000000000000000;
    uint64_t v42 = 0;
    if (v29) {
      goto LABEL_10;
    }
  }
  uint64_t v39 = 0;
  unint64_t v37 = 0xF000000000000000;
LABEL_13:
  _Block_copy(v20);
  sub_1001C5530(v33, v47, v50, v46, v38, v45, v49, v44, v48, v43, v27, v32, v19, a14, v31, v28, (uint64_t)self, (void (**)(void, void, void, void, void, void, void, void, void, void))v20);
  _Block_release(v20);
  _Block_release(v20);
  sub_100039FCC(v39, v37);
  sub_100039FCC(v42, v40);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)establishWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
}

- (void)vouchWithSpecificUser:(id)a3 peerID:(id)a4 permanentInfo:(id)a5 permanentInfoSig:(id)a6 stableInfo:(id)a7 stableInfoSig:(id)a8 ckksKeys:(id)a9 flowID:(id)a10 deviceSessionID:(id)a11 canSendMetrics:(BOOL)a12 reply:(id)aBlock
{
  uint64_t v50 = _Block_copy(aBlock);
  uint64_t v48 = sub_100222270();
  uint64_t v51 = v19;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  swift_retain();
  id v49 = a3;
  id v25 = a10;
  id v26 = a11;
  uint64_t v27 = sub_100221BF0();
  unint64_t v46 = v28;
  uint64_t v47 = v27;

  uint64_t v29 = sub_100221BF0();
  unint64_t v44 = v30;
  uint64_t v45 = v29;

  uint64_t v43 = sub_100221BF0();
  unint64_t v32 = v31;

  uint64_t v33 = sub_100221BF0();
  unint64_t v35 = v34;

  sub_1000047D8(0, &qword_10029EFC0);
  uint64_t v36 = sub_1002223C0();

  if (v25)
  {
    uint64_t v37 = sub_100222270();
    uint64_t v39 = v38;

    if (v26)
    {
LABEL_3:
      uint64_t v40 = sub_100222270();
      uint64_t v42 = v41;

      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
    if (v26) {
      goto LABEL_3;
    }
  }
  uint64_t v40 = 0;
  uint64_t v42 = 0;
LABEL_6:
  _Block_copy(v50);
  sub_1001C64E8(v49, v48, v51, v47, v46, v45, v44, v43, v32, v33, v35, v36, v37, v39, v40, v42, a12, (uint64_t)self, (void (**)(void, void, void, void))v50);
  _Block_release(v50);
  _Block_release(v50);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100005A40(v33, v35);
  sub_100005A40(v43, v32);
  sub_100005A40(v45, v44);
  sub_100005A40(v47, v46);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)preflightVouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 reply:(id)a5
{
}

- (void)vouchWithBottleWithSpecificUser:(id)a3 bottleID:(id)a4 entropy:(id)a5 bottleSalt:(id)a6 tlkShares:(id)a7 reply:(id)a8
{
  id v13 = _Block_copy(a8);
  uint64_t v26 = sub_100222270();
  uint64_t v15 = v14;
  id v27 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  swift_retain();
  uint64_t v19 = sub_100221BF0();
  unint64_t v21 = v20;

  uint64_t v22 = sub_100222270();
  uint64_t v24 = v23;

  sub_1000047D8(0, &qword_10029F410);
  uint64_t v25 = sub_1002223C0();

  _Block_copy(v13);
  sub_1001C7358(a3, v26, v15, v19, v21, v22, v24, v25, (uint64_t)self, (void (**)(void, void, void, void, void, void))v13);
  _Block_release(v13);
  _Block_release(v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100005A40(v19, v21);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)preflightVouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
}

- (void)preflightVouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_1001C8298(a3, v10, (uint64_t)self, (void (**)(void, void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)vouchWithRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
}

- (void)recoverTLKSharesForInheritorWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
}

- (void)vouchWithCustodianRecoveryKeyWithSpecificUser:(id)a3 crk:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
}

- (void)vouchWithRerollWithSpecificUser:(id)a3 oldPeerID:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_100222270();
  uint64_t v11 = v10;
  sub_1000047D8(0, &qword_10029F410);
  uint64_t v12 = sub_1002223C0();
  _Block_copy(v8);
  id v13 = a3;
  swift_retain();
  sub_1001CA0F4(a3, v9, v11, v12, (uint64_t)self, (void (**)(void, void, void, void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)joinWithSpecificUser:(id)a3 voucherData:(id)a4 voucherSig:(id)a5 ckksKeys:(id)a6 tlkShares:(id)a7 preapprovedKeys:(id)a8 flowID:(id)a9 deviceSessionID:(id)a10 canSendMetrics:(BOOL)a11 reply:(id)aBlock
{
  unint64_t v44 = _Block_copy(aBlock);
  id v38 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  swift_retain();
  id v43 = a3;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  uint64_t v24 = sub_100221BF0();
  unint64_t v40 = v25;
  uint64_t v42 = v24;

  uint64_t v26 = sub_100221BF0();
  unint64_t v37 = v27;
  uint64_t v39 = v26;

  sub_1000047D8(0, &qword_10029EFC0);
  uint64_t v36 = sub_1002223C0();

  sub_1000047D8(0, &qword_10029F410);
  uint64_t v35 = sub_1002223C0();

  if (v21)
  {
    uint64_t v34 = sub_1002223C0();

    if (v22) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v28 = 0;
    uint64_t v30 = 0;
    if (v23) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v34 = 0;
  if (!v22) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v28 = sub_100222270();
  uint64_t v30 = v29;

  if (v23)
  {
LABEL_4:
    uint64_t v31 = sub_100222270();
    uint64_t v33 = v32;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v31 = 0;
  uint64_t v33 = 0;
LABEL_8:
  _Block_copy(v44);
  sub_1001CA8CC(v43, v42, v40, v39, v37, v36, v35, v34, v28, v30, v31, v33, a11, (uint64_t)self, (void (**)(void, void, void, void, void))v44);
  _Block_release(v44);
  _Block_release(v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100005A40(v39, v37);
  sub_100005A40(v42, v40);

  swift_release();
}

- (void)preflightPreapprovedJoinWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4) {
    a4 = (id)sub_1002223C0();
  }
  _Block_copy(v8);
  id v9 = a3;
  swift_retain();
  sub_1001CAF28(a3, (uint64_t)a4, (uint64_t)self, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)attemptPreapprovedJoinWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 preapprovedKeys:(id)a6 reply:(id)a7
{
}

- (void)updateWithSpecificUser:(id)a3 forceRefetch:(BOOL)a4 deviceName:(id)a5 serialNumber:(id)a6 osVersion:(id)a7 policyVersion:(id)a8 policySecrets:(id)a9 syncUserControllableViews:(id)a10 secureElementIdentity:(id)a11 walrusSetting:(id)a12 webAccess:(id)a13 reply:(id)aBlock
{
  uint64_t v20 = (uint64_t)a9;
  id v21 = _Block_copy(aBlock);
  if (a5)
  {
    uint64_t v32 = sub_100222270();
    uint64_t v36 = v22;
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v36 = 0;
    if (a6)
    {
LABEL_3:
      uint64_t v31 = sub_100222270();
      uint64_t v35 = v23;
      if (a7) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  uint64_t v31 = 0;
  uint64_t v35 = 0;
  if (a7)
  {
LABEL_4:
    a7 = (id)sub_100222270();
    uint64_t v33 = v24;
    if (!a9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v33 = 0;
  if (a9) {
LABEL_5:
  }
    uint64_t v20 = sub_1002221D0();
LABEL_6:
  id v25 = a3;
  id v26 = a8;
  id v27 = a10;
  id v28 = a11;
  id v29 = a12;
  id v30 = a13;
  swift_retain();
  _Block_copy(v21);
  sub_1001CBCD0(v25, a4, v32, v36, v31, v35, (uint64_t)a7, v33, v26, v20, v27, v28, v29, v30, (uint64_t)self, (void (**)(void, void, void, void))v21);
  _Block_release(v21);
  _Block_release(v21);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)setPreapprovedKeysWithSpecificUser:(id)a3 preapprovedKeys:(id)a4 reply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1002223C0();
  _Block_copy(v7);
  id v9 = a3;
  swift_retain();
  sub_1001CC620(a3, v8, (uint64_t)self, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)updateTLKsWithSpecificUser:(id)a3 ckksKeys:(id)a4 tlkShares:(id)a5 reply:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  sub_1000047D8(0, &qword_10029EFC0);
  uint64_t v9 = sub_1002223C0();
  sub_1000047D8(0, &qword_10029F410);
  uint64_t v10 = sub_1002223C0();
  _Block_copy(v8);
  id v11 = a3;
  swift_retain();
  sub_1001CCDD0(a3, v9, v10, (uint64_t)self, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)departByDistrustingSelfWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)distrustPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
}

- (void)dropPeerIDsWithSpecificUser:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
}

- (void)fetchViableBottlesWithSpecificUser:(id)a3 source:(int64_t)a4 flowID:(id)a5 deviceSessionID:(id)a6 reply:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  if (a5)
  {
    uint64_t v13 = sub_100222270();
    a5 = v14;
    if (a6)
    {
LABEL_3:
      uint64_t v15 = sub_100222270();
      a6 = v16;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
LABEL_6:
  _Block_copy(v12);
  id v17 = a3;
  swift_retain();
  sub_1001CEBE0(a3, a4, v13, (uint64_t)a5, v15, (uint64_t)a6, (uint64_t)self, (void (**)(void, void, void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchViableEscrowRecordsWithSpecificUser:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain();
  sub_1001CF288(a3, a4, (uint64_t)self, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)fetchEscrowContentsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchCurrentPolicyWithSpecificUser:(id)a3 modelIDOverride:(id)a4 isInheritedAccount:(BOOL)a5 reply:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  if (a4)
  {
    uint64_t v11 = sub_100222270();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  _Block_copy(v10);
  id v13 = a3;
  swift_retain();
  sub_1001CFD2C(a3, v11, (uint64_t)a4, a5, (uint64_t)self, v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchPolicyDocumentsWithSpecificUser:(id)a3 versions:(id)a4 reply:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1000047D8(0, (unint64_t *)&qword_10029EDB0);
  sub_10004C55C();
  uint64_t v8 = sub_100222440();
  _Block_copy(v7);
  id v9 = a3;
  swift_retain();
  sub_1001D050C(a3, v8, (uint64_t)self, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)fetchRecoverableTLKSharesWithSpecificUser:(id)a3 peerID:(id)a4 reply:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_100222270();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  swift_retain();
  sub_1001D0BFC(a3, v9, (uint64_t)a4, (uint64_t)self, (void (**)(const void *, void, void *))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)setRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 reply:(id)a7
{
}

- (void)createCustodianRecoveryKeyWithSpecificUser:(id)a3 recoveryKey:(id)a4 salt:(id)a5 ckksKeys:(id)a6 uuid:(id)a7 kind:(int)a8 reply:(id)a9
{
  int v25 = a8;
  uint64_t v26 = sub_100221D00();
  uint64_t v11 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a9);
  uint64_t v24 = sub_100222270();
  uint64_t v17 = v16;
  uint64_t v18 = sub_100222270();
  uint64_t v20 = v19;
  sub_1000047D8(0, &qword_10029EFC0);
  uint64_t v21 = sub_1002223C0();
  sub_100221CF0();
  _Block_copy(v15);
  id v22 = a3;
  swift_retain();
  sub_1001D1B90(a3, v24, v17, v18, v20, v21, (uint64_t)v14, v25, (uint64_t)self, (void (**)(void, void, void, void))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v26);
}

- (void)removeCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
}

- (void)findCustodianRecoveryKeyWithSpecificUser:(id)a3 uuid:(id)a4 reply:(id)a5
{
}

- (void)requestHealthCheckWithSpecificUser:(id)a3 requiresEscrowCheck:(BOOL)a4 repair:(BOOL)a5 knownFederations:(id)a6 flowID:(id)a7 deviceSessionID:(id)a8 reply:(id)aBlock
{
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = sub_1002223C0();
  if (a7)
  {
    uint64_t v16 = sub_100222270();
    a7 = v17;
    if (a8)
    {
LABEL_3:
      uint64_t v18 = sub_100222270();
      a8 = v19;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (a8) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
LABEL_6:
  _Block_copy(v14);
  id v20 = a3;
  swift_retain();
  sub_1001D32DC(a3, a4, a5, v15, v16, (uint64_t)a7, v18, (uint64_t)a8, (uint64_t)self, (void (**)(void, void, void))v14);
  _Block_release(v14);
  _Block_release(v14);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)getSupportAppInfoWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)removeEscrowCacheWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)resetAccountCDPContentsWithSpecificUser:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 internalAccount:(BOOL)a7 demoAccount:(BOOL)a8 reply:(id)aBlock
{
  BOOL v21 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v15 = _Block_copy(aBlock);
  if (a4)
  {
    uint64_t v16 = (void *)sub_100222270();
    a4 = v17;
    if (a5)
    {
LABEL_3:
      uint64_t v18 = (void *)sub_100222270();
      a5 = v19;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
LABEL_6:
  _Block_copy(v15);
  id v20 = a3;
  swift_retain();
  sub_1001D4830(a3, v16, a4, v18, a5, v10, v9, v21, (uint64_t)self, (void (**)(const void *, void *))v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchAccountSettingsWithSpecificUser:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  int v7 = (int)self;
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  swift_retain();
  sub_1001D505C(a3, a4, v7, v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
}

- (void)performATOPRVActionsWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)testSemaphoreWithSpecificUser:(id)a3 arg:(id)a4 reply:(id)a5
{
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 salt:(id)a5 reply:(id)a6
{
}

- (void)fetchTrustedPeerCountWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)octagonContainsDistrustedRecoveryKeysWithSpecificUser:(id)a3 reply:(id)a4
{
}

- (void)fetchCurrentItemWithSpecificUser:(id)a3 items:(id)a4 reply:(id)a5
{
}

- (void)fetchPCSIdentityByPublicKeyWithSpecificUser:(id)a3 pcsservices:(id)a4 reply:(id)a5
{
}

@end