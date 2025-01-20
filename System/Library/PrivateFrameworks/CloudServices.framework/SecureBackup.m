@interface SecureBackup
+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)_ClassCreateSecureBackupConcurrentConnection;
+ (id)_getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4;
+ (id)getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4;
+ (id)getAllAcceptedTermsWithError:(id *)a3;
+ (id)knownICDPFederations:(id *)a3;
+ (unsigned)daemonPasscodeRequestOpinion:(id *)a3;
+ (unsigned)needPasscodeForHSA2EscrowRecordUpdate:(id *)a3;
+ (void)asyncRequestEscrowRecordUpdate;
+ (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4;
+ (void)saveTermsAcceptance:(id)a3 reply:(id)a4;
- (AppleIDPasswordMetadata)appleIDPasswordMetadata;
- (BOOL)changeSMSTargetWithError:(id *)a3;
- (BOOL)deleteAll;
- (BOOL)deleteDoubleOnly;
- (BOOL)disableWithError:(id *)a3;
- (BOOL)emcsMode;
- (BOOL)enableWithError:(id *)a3;
- (BOOL)excludeiCDPRecords;
- (BOOL)fmipRecovery;
- (BOOL)guitarfish;
- (BOOL)guitarfishToken;
- (BOOL)icdp;
- (BOOL)idmsRecovery;
- (BOOL)isRecoveryKeySet:(id *)a3;
- (BOOL)nonViableRepair;
- (BOOL)recoveryResult;
- (BOOL)removeRecoveryKeyFromBackup:(id *)a3;
- (BOOL)requiresDoubleEnrollment;
- (BOOL)restoreKeychainWithBackupPassword:(id)a3 error:(id *)a4;
- (BOOL)silent;
- (BOOL)silentDoubleRecovery;
- (BOOL)sosCompatibleEscrowSorting;
- (BOOL)stingray;
- (BOOL)suppressServerFiltering;
- (BOOL)synchronize;
- (BOOL)updateMetadataWithError:(id *)a3;
- (BOOL)useCachedPassphrase;
- (BOOL)useRecoveryPET;
- (BOOL)usesMultipleiCSC;
- (BOOL)usesRandomPassphrase;
- (BOOL)usesRecoveryKey;
- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4;
- (CSSESWrapper)ses;
- (EscrowPrerecord)prerecord;
- (NSData)certData;
- (NSData)iCloudIdentityData;
- (NSData)idmsData;
- (NSDate)backOffDate;
- (NSDictionary)emcsDict;
- (NSDictionary)escrowRecord;
- (NSDictionary)metadata;
- (NSDictionary)metadataHash;
- (NSError)error;
- (NSNumber)specifiedFederation;
- (NSString)activityLabel;
- (NSString)appleID;
- (NSString)authToken;
- (NSString)countryCode;
- (NSString)countryDialCode;
- (NSString)deviceSessionID;
- (NSString)doubleRecoveryUUID;
- (NSString)dsid;
- (NSString)duplicateEncodedMetadata;
- (NSString)emcsCred;
- (NSString)encodedMetadata;
- (NSString)escrowProxyURL;
- (NSString)flowID;
- (NSString)fmipUUID;
- (NSString)hsa2CachedPrerecordUUID;
- (NSString)iCloudEnv;
- (NSString)iCloudPassword;
- (NSString)oldEMCSCred;
- (NSString)passphrase;
- (NSString)rawPassword;
- (NSString)recordID;
- (NSString)recoveryKey;
- (NSString)recoveryUUID;
- (NSString)smsTarget;
- (NSString)verificationToken;
- (NSUUID)activityUUID;
- (OS_dispatch_queue)queue;
- (SecureBackup)backupWithInfo:(id)a3;
- (SecureBackup)backupWithInfo:(id)a3 completionBlock:(id)a4;
- (SecureBackup)init;
- (SecureBackup)initWithCoder:(id)a3;
- (SecureBackup)initWithUserActivityLabel:(id)a3;
- (id)_CreateSecureBackupConnection;
- (id)backupForRecoveryKeyWithInfo:(id)a3;
- (id)beginHSA2PasscodeRequest:(BOOL)a3 error:(id *)a4;
- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 error:(id *)a5;
- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 reason:(id)a5 error:(id *)a6;
- (id)cachePassphraseWithInfo:(id)a3;
- (id)changeSMSTargetWithInfo:(id)a3;
- (id)disableWithInfo:(id)a3;
- (id)enableWithInfo:(id)a3;
- (id)getAccountInfoWithError:(id *)a3;
- (id)getAccountInfoWithInfo:(id)a3 results:(id *)a4;
- (id)recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 error:(id *)a5;
- (id)recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 error:(id *)a5;
- (id)recoverWithError:(id *)a3;
- (id)recoverWithInfo:(id)a3 results:(id *)a4;
- (id)srpInitNonce;
- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3;
- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3 error:(id *)a4;
- (id)startSMSChallengeWithError:(id *)a3;
- (id)startSMSChallengeWithInfo:(id)a3 results:(id *)a4;
- (id)uncachePassphraseWithInfo:(id)a3;
- (id)updateMetadataWithInfo:(id)a3;
- (void)backOffDateWithCompletionBlock:(id)a3;
- (void)backOffDateWithInfo:(id)a3 completionBlock:(id)a4;
- (void)cachePassphrase;
- (void)cachePassphraseWithCompletionBlock:(id)a3;
- (void)cachePassphraseWithInfo:(id)a3 completionBlock:(id)a4;
- (void)cacheRecoveryKeyWithCompletionBlock:(id)a3;
- (void)changeSMSTargetWithCompletionBlock:(id)a3;
- (void)changeSMSTargetWithInfo:(id)a3 completionBlock:(id)a4;
- (void)createICDPRecordWithContents:(id)a3 reply:(id)a4;
- (void)disableWithCompletionBlock:(id)a3;
- (void)disableWithInfo:(id)a3 completionBlock:(id)a4;
- (void)enableWithCompletionBlock:(id)a3;
- (void)enableWithInfo:(id)a3 completionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fetchStingrayAccountStatus:(id)a3;
- (void)getAccountInfoWithInfo:(id)a3 completionBlock:(id)a4;
- (void)getAccountInfoWithInfo:(id)a3 completionBlockWithResults:(id)a4;
- (void)getAccountInfoWithResults:(id)a3;
- (void)getCertificates:(id)a3;
- (void)getCountrySMSCodesWithInfo:(id)a3 completionBlockWithResults:(id)a4;
- (void)getCountrySMSCodesWithResults:(id)a3;
- (void)notificationInfo:(id)a3;
- (void)populateWithInfo:(id)a3;
- (void)prepareHSA2EscrowRecordContents:(BOOL)a3 reply:(id)a4;
- (void)recoverRecordContents:(id)a3;
- (void)recoverWithInfo:(id)a3 completionBlock:(id)a4;
- (void)recoverWithInfo:(id)a3 completionBlockWithResults:(id)a4;
- (void)recoverWithResults:(id)a3;
- (void)restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 error:(id *)a7;
- (void)setAppleID:(id)a3;
- (void)setAppleIDPasswordMetadata:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setBackOffDate:(id)a3;
- (void)setBackOffDateWithCompletionBlock:(id)a3;
- (void)setBackOffDateWithInfo:(id)a3 completionBlock:(id)a4;
- (void)setCertData:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCountryDialCode:(id)a3;
- (void)setDeleteAll:(BOOL)a3;
- (void)setDeleteDoubleOnly:(BOOL)a3;
- (void)setDeviceSessionID:(id)a3;
- (void)setDoubleRecoveryUUID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setDuplicateEncodedMetadata:(id)a3;
- (void)setEmcsCred:(id)a3;
- (void)setEmcsDict:(id)a3;
- (void)setEmcsMode:(BOOL)a3;
- (void)setEncodedMetadata:(id)a3;
- (void)setError:(id)a3;
- (void)setEscrowProxyURL:(id)a3;
- (void)setEscrowRecord:(id)a3;
- (void)setExcludeiCDPRecords:(BOOL)a3;
- (void)setFlowID:(id)a3;
- (void)setFmipRecovery:(BOOL)a3;
- (void)setFmipUUID:(id)a3;
- (void)setGuitarfish:(BOOL)a3;
- (void)setGuitarfishToken:(BOOL)a3;
- (void)setHsa2CachedPrerecordUUID:(id)a3;
- (void)setICloudEnv:(id)a3;
- (void)setICloudIdentityData:(id)a3;
- (void)setICloudPassword:(id)a3;
- (void)setIcdp:(BOOL)a3;
- (void)setIdmsData:(id)a3;
- (void)setIdmsRecovery:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataHash:(id)a3;
- (void)setNonViableRepair:(BOOL)a3;
- (void)setOldEMCSCred:(id)a3;
- (void)setPassphrase:(id)a3;
- (void)setPrerecord:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRecoveryResult:(BOOL)a3;
- (void)setRecoveryUUID:(id)a3;
- (void)setSes:(id)a3;
- (void)setSilent:(BOOL)a3;
- (void)setSilentDoubleRecovery:(BOOL)a3;
- (void)setSmsTarget:(id)a3;
- (void)setSosCompatibleEscrowSorting:(BOOL)a3;
- (void)setSpecifiedFederation:(id)a3;
- (void)setStingray:(BOOL)a3;
- (void)setSuppressServerFiltering:(BOOL)a3;
- (void)setSynchronize:(BOOL)a3;
- (void)setUseCachedPassphrase:(BOOL)a3;
- (void)setUseRecoveryPET:(BOOL)a3;
- (void)setUsesMultipleiCSC:(BOOL)a3;
- (void)setUsesRandomPassphrase:(BOOL)a3;
- (void)setUsesRecoveryKey:(BOOL)a3;
- (void)setVerificationToken:(id)a3;
- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4;
- (void)startSMSChallengeWithInfo:(id)a3 completionBlock:(id)a4;
- (void)startSMSChallengeWithInfo:(id)a3 completionBlockWithResults:(id)a4;
- (void)startSMSChallengeWithResults:(id)a3;
- (void)stashRecoveryDataWithCompletionBlock:(id)a3;
- (void)stashRecoveryDataWithInfo:(id)a3 completionBlock:(id)a4;
- (void)stateCaptureWithCompletionBlock:(id)a3;
- (void)uncachePassphrase;
- (void)uncachePassphraseWithCompletionBlock:(id)a3;
- (void)uncachePassphraseWithInfo:(id)a3 completionBlock:(id)a4;
- (void)uncacheRecoveryKeyWithCompletionBlock:(id)a3;
- (void)updateMetadataWithCompletionBlock:(id)a3;
- (void)updateMetadataWithInfo:(id)a3 completionBlock:(id)a4;
@end

@implementation SecureBackup

+ (unsigned)needPasscodeForHSA2EscrowRecordUpdate:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (qword_26AC125A8 != -1) {
    dispatch_once(&qword_26AC125A8, &unk_26C91F148);
  }
  if ((byte_26AC125B9 & 1) == 0)
  {
    v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "unable to fetch passcode_request token";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_9;
    }
LABEL_10:

    return 0;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(dword_26AC125B4, &state64);
  if (state)
  {
    uint32_t v6 = state;
    v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v6;
      v8 = "unable to fetch state of passcode_request token (%d)";
      v9 = v7;
      uint32_t v10 = 8;
LABEL_9:
      _os_log_impl(&dword_218118000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!state64)
  {
    v24 = CloudServicesLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218118000, v24, OS_LOG_TYPE_DEFAULT, "do initial state fetch in the background", buf, 2u);
    }

    objc_msgSend_asyncRequestEscrowRecordUpdate(a1, v25, v26);
    return 0;
  }
  if ((state64 & 4) == 0)
  {
    id v33 = 0;
    int v13 = objc_msgSend_daemonPasscodeRequestOpinion_(a1, v5, (uint64_t)&v33);
    id v14 = v33;
    v17 = v14;
    if (v14)
    {
      v18 = objc_msgSend_domain(v14, v15, v16);
      if (objc_msgSend_isEqualToString_(v18, v19, *MEMORY[0x263F08410]))
      {
        uint64_t v22 = objc_msgSend_code(v17, v20, v21);

        if (v22 == -25308)
        {
          v23 = CloudServicesLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218118000, v23, OS_LOG_TYPE_DEFAULT, "daemon unable to determine passcode status due to keybag lock; relying on dispatch state",
              buf,
              2u);
          }

          goto LABEL_28;
        }
      }
      else
      {
      }
      v30 = CloudServicesLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v17;
        _os_log_impl(&dword_218118000, v30, OS_LOG_TYPE_DEFAULT, "unable to ask daemon for confirmation of passcode request: %@", buf, 0xCu);
      }
      unsigned int v11 = 0;
      goto LABEL_49;
    }
    if ((v13 & 0xFFFFFFFE) != 2)
    {
      v30 = CloudServicesLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218118000, v30, OS_LOG_TYPE_DEFAULT, "daemon believes there's no need for a passcode", buf, 2u);
      }
      goto LABEL_39;
    }
LABEL_28:
    uint64_t v28 = state64;
    if ((state64 & 2) != 0)
    {
      v30 = CloudServicesLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218118000, v30, OS_LOG_TYPE_DEFAULT, "Need password on next unlock", buf, 2u);
      }
      unsigned int v11 = 3;
      goto LABEL_49;
    }
    if (state64)
    {
      v30 = CloudServicesLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Desire password when available";
LABEL_47:
        unsigned int v11 = 2;
        _os_log_impl(&dword_218118000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 2u);
        goto LABEL_49;
      }
    }
    else
    {
      v29 = CloudServicesLog();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_21813E894((uint64_t *)&state64, v30, v31);
        }
LABEL_39:
        unsigned int v11 = 1;
LABEL_49:

        return v11;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "Dispatch doesn't have a state for us yet, opportunistically asking for the password";
        goto LABEL_47;
      }
    }
    unsigned int v11 = 2;
    goto LABEL_49;
  }
  v27 = CloudServicesLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v27, OS_LOG_TYPE_DEFAULT, "No need for passcode", buf, 2u);
  }

  return 1;
}

+ (void)asyncRequestEscrowRecordUpdate
{
  if ((atomic_exchange((atomic_uchar *volatile)byte_26AC125C0, 1u) & 1) == 0)
  {
    v3 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_218119AFC;
    block[3] = &unk_264303380;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

+ (unsigned)daemonPasscodeRequestOpinion:(id *)a3
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_2181211BC;
  v29 = sub_218119820;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v4 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2181268C0;
  v20[3] = &unk_2643031D0;
  v20[4] = &v25;
  uint32_t v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)v20);
  if (pthread_main_np())
  {
    v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21813E908(v7, v8, v9);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218126930;
  activity_block[3] = &unk_2643032E8;
  v18 = &v25;
  v19 = &v21;
  id v16 = v6;
  id v17 = v4;
  id v10 = v4;
  id v11 = v6;
  _os_activity_initiate(&dword_218118000, "calling daemonPasscodeRequestOpinion in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
  {
    v12 = (void *)v26[5];
    if (v12) {
      *a3 = v12;
    }
  }
  unsigned int v13 = *((_DWORD *)v22 + 6);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

- (id)_CreateSecureBackupConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = getuid();
    __int16 v15 = 2080;
    id v16 = getprogname();
    _os_log_impl(&dword_218118000, v2, OS_LOG_TYPE_DEFAULT, "creating connection to sbd: uid %d, progname %s", (uint8_t *)v14, 0x12u);
  }

  v4 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v3, (uint64_t)&unk_26C92B998);
  v5 = SecureBackupSetupProtocol(v4);

  id v6 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, @"com.apple.SecureBackupDaemon", 0);
  objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v5);
  objc_msgSend_resume(v8, v10, v11);
  v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_218118000, v12, OS_LOG_TYPE_DEFAULT, "sbd connection created", (uint8_t *)v14, 2u);
  }

  return v8;
}

+ (id)_ClassCreateSecureBackupConcurrentConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = CloudServicesLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = getuid();
    __int16 v15 = 2080;
    id v16 = getprogname();
    _os_log_impl(&dword_218118000, v2, OS_LOG_TYPE_DEFAULT, "creating connection to sbd: uid %d, progname %s", (uint8_t *)v14, 0x12u);
  }

  v4 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v3, (uint64_t)&unk_26C92B9F8);
  v5 = SecureBackupSetupConcurrentProtocol(v4);

  id v6 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v8 = objc_msgSend_initWithMachServiceName_options_(v6, v7, @"com.apple.SecureBackupDaemon.concurrent", 0);
  objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v5);
  objc_msgSend_resume(v8, v10, v11);
  v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_218118000, v12, OS_LOG_TYPE_DEFAULT, "sbd connection created", (uint8_t *)v14, 2u);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SecureBackup)initWithUserActivityLabel:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SecureBackup;
  v5 = [(SecureBackup *)&v21 init];
  if (v5)
  {
    id v6 = [NSString alloc];
    if (qword_26AC125D8 != -1) {
      dispatch_once(&qword_26AC125D8, &unk_26C91F1E8);
    }
    id v7 = (id)qword_26AC125D0;
    uint64_t v9 = objc_msgSend_initWithFormat_(v6, v8, @"%@: %@", v7, v4);
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v9;

    uint64_t v13 = objc_msgSend_UUID(MEMORY[0x263F08C38], v11, v12);
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSUUID *)v13;

    __int16 v15 = CloudServicesLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend_UUIDString(v5->_activityUUID, v16, v17);
      v19 = v5->_activityLabel;
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      _os_log_impl(&dword_218118000, v15, OS_LOG_TYPE_INFO, "New SecureBackup object: %@ %@", buf, 0x16u);
    }
  }

  return v5;
}

- (SecureBackup)init
{
  return (SecureBackup *)objc_msgSend_initWithUserActivityLabel_(self, a2, @"unknown activity");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_appleID(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"SecureBackupAuthenticationAppleID");

  uint64_t v11 = objc_msgSend_authToken(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"SecureBackupAuthenticationAuthToken");

  __int16 v15 = objc_msgSend_backOffDate(self, v13, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"SecureBackupBackOffDate");

  v19 = objc_msgSend_countryDialCode(self, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"countryDialCode");

  uint64_t v23 = objc_msgSend_countryCode(self, v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, @"countryISOCode");

  uint64_t v27 = objc_msgSend_deleteAll(self, v25, v26);
  objc_msgSend_encodeBool_forKey_(v4, v28, v27, @"SecureBackupiCloudDataProtectionDeleteAllRecords");
  uint64_t v31 = objc_msgSend_dsid(self, v29, v30);
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, @"SecureBackupAuthenticationDSID");

  v35 = objc_msgSend_emcsCred(self, v33, v34);
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v35, @"SecureBackupEMCSManagedCredential");

  v39 = objc_msgSend_emcsDict(self, v37, v38);
  objc_msgSend_encodeObject_forKey_(v4, v40, (uint64_t)v39, @"SecureBackupEMCSIDMSDict");

  uint64_t v43 = objc_msgSend_emcsMode(self, v41, v42);
  objc_msgSend_encodeBool_forKey_(v4, v44, v43, @"SecureBackupContainsEMCSData");
  v47 = objc_msgSend_escrowProxyURL(self, v45, v46);
  objc_msgSend_encodeObject_forKey_(v4, v48, (uint64_t)v47, @"SecureBackupAuthenticationEscrowProxyURL");

  uint64_t v51 = objc_msgSend_excludeiCDPRecords(self, v49, v50);
  objc_msgSend_encodeBool_forKey_(v4, v52, v51, @"SecureBackupExcludeiCDPRecords");
  uint64_t v55 = objc_msgSend_fmipRecovery(self, v53, v54);
  objc_msgSend_encodeBool_forKey_(v4, v56, v55, @"SecureBackupFMiPRecoveryKey");
  v59 = objc_msgSend_fmipUUID(self, v57, v58);
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, @"SecureBackupFMiPUUIDKey");

  uint64_t v63 = objc_msgSend_icdp(self, v61, v62);
  objc_msgSend_encodeBool_forKey_(v4, v64, v63, @"SecureBackupContainsiCDPData");
  v67 = objc_msgSend_iCloudEnv(self, v65, v66);
  objc_msgSend_encodeObject_forKey_(v4, v68, (uint64_t)v67, @"SecureBackupAuthenticationiCloudEnvironment");

  v71 = objc_msgSend_iCloudIdentityData(self, v69, v70);
  objc_msgSend_encodeObject_forKey_(v4, v72, (uint64_t)v71, @"SecureBackupiCloudIdentityData");

  v75 = objc_msgSend_iCloudPassword(self, v73, v74);
  objc_msgSend_encodeObject_forKey_(v4, v76, (uint64_t)v75, @"SecureBackupAuthenticationPassword");

  v79 = objc_msgSend_rawPassword(self, v77, v78);
  objc_msgSend_encodeObject_forKey_(v4, v80, (uint64_t)v79, @"SecureBackupAuthenticationRawPassword");

  v83 = objc_msgSend_idmsData(self, v81, v82);
  objc_msgSend_encodeObject_forKey_(v4, v84, (uint64_t)v83, @"SecureBackupIDMSData");

  uint64_t v87 = objc_msgSend_idmsRecovery(self, v85, v86);
  objc_msgSend_encodeBool_forKey_(v4, v88, v87, @"SecureBackupIDMSRecovery");
  v91 = objc_msgSend_metadata(self, v89, v90);
  objc_msgSend_encodeObject_forKey_(v4, v92, (uint64_t)v91, @"SecureBackupMetadata");

  v95 = objc_msgSend_metadataHash(self, v93, v94);
  objc_msgSend_encodeObject_forKey_(v4, v96, (uint64_t)v95, @"SecureBackupStingrayMetadataHash");

  v99 = objc_msgSend_oldEMCSCred(self, v97, v98);
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, @"SecureBackupEMCSOldManagedCredential");

  v103 = objc_msgSend_passphrase(self, v101, v102);
  objc_msgSend_encodeObject_forKey_(v4, v104, (uint64_t)v103, @"SecureBackupPassphrase");

  v107 = objc_msgSend_recordID(self, v105, v106);
  objc_msgSend_encodeObject_forKey_(v4, v108, (uint64_t)v107, @"recordID");

  v111 = objc_msgSend_recoveryKey(self, v109, v110);
  objc_msgSend_encodeObject_forKey_(v4, v112, (uint64_t)v111, @"SecureBackupRecoveryKey");

  v115 = objc_msgSend_smsTarget(self, v113, v114);
  objc_msgSend_encodeObject_forKey_(v4, v116, (uint64_t)v115, @"phoneNumber");

  uint64_t v119 = objc_msgSend_silent(self, v117, v118);
  objc_msgSend_encodeBool_forKey_(v4, v120, v119, @"SecureBackupSilentRecoveryAttempt");
  v123 = objc_msgSend_specifiedFederation(self, v121, v122);
  objc_msgSend_encodeObject_forKey_(v4, v124, (uint64_t)v123, @"SecureBackupSpecifiedFederation");

  uint64_t v127 = objc_msgSend_stingray(self, v125, v126);
  objc_msgSend_encodeBool_forKey_(v4, v128, v127, @"SecureBackupContainsiCloudIdentity");
  uint64_t v131 = objc_msgSend_synchronize(self, v129, v130);
  objc_msgSend_encodeBool_forKey_(v4, v132, v131, @"SecureBackupSynchronize");
  uint64_t v135 = objc_msgSend_useCachedPassphrase(self, v133, v134);
  objc_msgSend_encodeBool_forKey_(v4, v136, v135, @"SecureBackupUseCachedPassphrase");
  v139 = objc_msgSend_hsa2CachedPrerecordUUID(self, v137, v138);
  objc_msgSend_encodeObject_forKey_(v4, v140, (uint64_t)v139, @"SecureBackupHSA2CachedPrerecordUUID");

  uint64_t v143 = objc_msgSend_useRecoveryPET(self, v141, v142);
  objc_msgSend_encodeBool_forKey_(v4, v144, v143, @"SecureBackupIDMSRecovery");
  uint64_t v147 = objc_msgSend_usesMultipleiCSC(self, v145, v146);
  objc_msgSend_encodeBool_forKey_(v4, v148, v147, @"SecureBackupUsesMultipleiCSCs");
  uint64_t v151 = objc_msgSend_usesRandomPassphrase(self, v149, v150);
  objc_msgSend_encodeBool_forKey_(v4, v152, v151, @"SecureBackupUsesRandomPassphrase");
  uint64_t v155 = objc_msgSend_usesRecoveryKey(self, v153, v154);
  objc_msgSend_encodeBool_forKey_(v4, v156, v155, @"SecureBackupUsesRecoveryKey");
  v159 = objc_msgSend_verificationToken(self, v157, v158);
  objc_msgSend_encodeObject_forKey_(v4, v160, (uint64_t)v159, @"SecureBackupVerifcationToken");

  v163 = objc_msgSend_activityLabel(self, v161, v162);
  objc_msgSend_encodeObject_forKey_(v4, v164, (uint64_t)v163, @"activityLabel");

  v167 = objc_msgSend_activityUUID(self, v165, v166);
  objc_msgSend_encodeObject_forKey_(v4, v168, (uint64_t)v167, @"activityUUID");

  uint64_t v171 = objc_msgSend_suppressServerFiltering(self, v169, v170);
  objc_msgSend_encodeBool_forKey_(v4, v172, v171, @"SecureBackupSuppressServerFiltering");
  uint64_t v175 = objc_msgSend_silentDoubleRecovery(self, v173, v174);
  objc_msgSend_encodeBool_forKey_(v4, v176, v175, @"SecureBackupSilentDoubleRecovery");
  uint64_t v179 = objc_msgSend_deleteDoubleOnly(self, v177, v178);
  objc_msgSend_encodeBool_forKey_(v4, v180, v179, @"SecureBackupDeleteDoubleOnly");
  uint64_t v183 = objc_msgSend_nonViableRepair(self, v181, v182);
  objc_msgSend_encodeBool_forKey_(v4, v184, v183, @"SecureBackupNonViableRepairKey");
  uint64_t v187 = objc_msgSend_sosCompatibleEscrowSorting(self, v185, v186);
  objc_msgSend_encodeBool_forKey_(v4, v188, v187, @"SecureBackupSOSCompatibleEscrowSorting");
  v191 = objc_msgSend_deviceSessionID(self, v189, v190);
  objc_msgSend_encodeObject_forKey_(v4, v192, (uint64_t)v191, @"SecureBackupDeviceSessionIDKey");

  v195 = objc_msgSend_flowID(self, v193, v194);
  objc_msgSend_encodeObject_forKey_(v4, v196, (uint64_t)v195, @"SecureBackupFlowIDKey");

  uint64_t v199 = objc_msgSend_guitarfish(self, v197, v198);
  objc_msgSend_encodeBool_forKey_(v4, v200, v199, @"SecureBackupGuitarfishKey");
  uint64_t v203 = objc_msgSend_guitarfishToken(self, v201, v202);
  objc_msgSend_encodeBool_forKey_(v4, v204, v203, @"SecureBackupGuitarfishTokenKey");
  objc_msgSend_appleIDPasswordMetadata(self, v205, v206);
  id v208 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v207, (uint64_t)v208, @"SecureBackupAppleIDPasswordMetadataKey");
}

- (SecureBackup)initWithCoder:(id)a3
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v150.receiver = self;
  v150.super_class = (Class)SecureBackup;
  v5 = [(SecureBackup *)&v150 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"SecureBackupAuthenticationAppleID");
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"SecureBackupAuthenticationAuthToken");
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"SecureBackupBackOffDate");
    backOffDate = v5->_backOffDate;
    v5->_backOffDate = (NSDate *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"countryDialCode");
    countryDialCode = v5->_countryDialCode;
    v5->_countryDialCode = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"countryISOCode");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v24;

    v5->_deleteAll = objc_msgSend_decodeBoolForKey_(v4, v26, @"SecureBackupiCloudDataProtectionDeleteAllRecords");
    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"SecureBackupAuthenticationDSID");
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"SecureBackupEMCSManagedCredential");
    emcsCred = v5->_emcsCred;
    v5->_emcsCred = (NSString *)v33;

    uint64_t v36 = objc_msgSend_decodePropertyListForKey_(v4, v35, @"SecureBackupEMCSIDMSDict");
    emcsDict = v5->_emcsDict;
    v5->_emcsDict = (NSDictionary *)v36;

    v5->_emcsMode = objc_msgSend_decodeBoolForKey_(v4, v38, @"SecureBackupContainsEMCSData");
    uint64_t v39 = objc_opt_class();
    uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"SecureBackupAuthenticationEscrowProxyURL");
    escrowProxyURL = v5->_escrowProxyURL;
    v5->_escrowProxyURL = (NSString *)v41;

    v5->_excludeiCDPRecords = objc_msgSend_decodeBoolForKey_(v4, v43, @"SecureBackupExcludeiCDPRecords");
    v5->_fmipRecovery = objc_msgSend_decodeBoolForKey_(v4, v44, @"SecureBackupFMiPRecoveryKey");
    uint64_t v45 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, @"SecureBackupFMiPUUIDKey");
    fmipUUID = v5->_fmipUUID;
    v5->_fmipUUID = (NSString *)v47;

    v5->_icdp = objc_msgSend_decodeBoolForKey_(v4, v49, @"SecureBackupContainsiCDPData");
    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"SecureBackupAuthenticationiCloudEnvironment");
    iCloudEnv = v5->_iCloudEnv;
    v5->_iCloudEnv = (NSString *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"SecureBackupiCloudIdentityData");
    iCloudIdentityData = v5->_iCloudIdentityData;
    v5->_iCloudIdentityData = (NSData *)v56;

    uint64_t v58 = objc_opt_class();
    v60 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, @"SecureBackupAuthenticationPassword");
    objc_msgSend_setICloudPassword_(v5, v61, (uint64_t)v60);

    uint64_t v62 = objc_opt_class();
    v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"SecureBackupAuthenticationRawPassword");
    objc_msgSend_setRawPassword_(v5, v65, (uint64_t)v64);

    uint64_t v66 = objc_opt_class();
    uint64_t v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"SecureBackupIDMSData");
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSData *)v68;

    v5->_idmsRecovery = objc_msgSend_decodeBoolForKey_(v4, v70, @"SecureBackupIDMSRecovery");
    uint64_t v72 = objc_msgSend_decodePropertyListForKey_(v4, v71, @"SecureBackupMetadata");
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v72;

    uint64_t v75 = objc_msgSend_decodePropertyListForKey_(v4, v74, @"SecureBackupStingrayMetadataHash");
    metadataHash = v5->_metadataHash;
    v5->_metadataHash = (NSDictionary *)v75;

    uint64_t v77 = objc_opt_class();
    uint64_t v79 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v78, v77, @"SecureBackupEMCSOldManagedCredential");
    oldEMCSCred = v5->_oldEMCSCred;
    v5->_oldEMCSCred = (NSString *)v79;

    uint64_t v81 = objc_opt_class();
    uint64_t v83 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, @"SecureBackupPassphrase");
    passphrase = v5->_passphrase;
    v5->_passphrase = (NSString *)v83;

    uint64_t v85 = objc_opt_class();
    uint64_t v87 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, @"recordID");
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v87;

    uint64_t v89 = objc_opt_class();
    uint64_t v91 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, @"SecureBackupRecoveryKey");
    recoveryKey = v5->_recoveryKey;
    v5->_recoveryKey = (NSString *)v91;

    uint64_t v93 = objc_opt_class();
    uint64_t v95 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v94, v93, @"phoneNumber");
    smsTarget = v5->_smsTarget;
    v5->_smsTarget = (NSString *)v95;

    v5->_silent = objc_msgSend_decodeBoolForKey_(v4, v97, @"SecureBackupSilentRecoveryAttempt");
    uint64_t v98 = objc_opt_class();
    uint64_t v100 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v99, v98, @"SecureBackupSpecifiedFederation");
    specifiedFederation = v5->_specifiedFederation;
    v5->_specifiedFederation = (NSNumber *)v100;

    v5->_stingray = objc_msgSend_decodeBoolForKey_(v4, v102, @"SecureBackupContainsiCloudIdentity");
    v5->_synchronize = objc_msgSend_decodeBoolForKey_(v4, v103, @"SecureBackupSynchronize");
    v5->_useCachedPassphrase = objc_msgSend_decodeBoolForKey_(v4, v104, @"SecureBackupUseCachedPassphrase");
    uint64_t v105 = objc_opt_class();
    uint64_t v107 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v106, v105, @"SecureBackupHSA2CachedPrerecordUUID");
    hsa2CachedPrerecordUUID = v5->_hsa2CachedPrerecordUUID;
    v5->_hsa2CachedPrerecordUUID = (NSString *)v107;

    v5->_useRecoveryPET = objc_msgSend_decodeBoolForKey_(v4, v109, @"SecureBackupIDMSRecovery");
    v5->_usesMultipleiCSC = objc_msgSend_decodeBoolForKey_(v4, v110, @"SecureBackupUsesMultipleiCSCs");
    v5->_usesRandomPassphrase = objc_msgSend_decodeBoolForKey_(v4, v111, @"SecureBackupUsesRandomPassphrase");
    v5->_usesRecoveryKey = objc_msgSend_decodeBoolForKey_(v4, v112, @"SecureBackupUsesRecoveryKey");
    uint64_t v113 = objc_opt_class();
    uint64_t v115 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v114, v113, @"SecureBackupVerifcationToken");
    verificationToken = v5->_verificationToken;
    v5->_verificationToken = (NSString *)v115;

    uint64_t v117 = objc_opt_class();
    uint64_t v119 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v118, v117, @"activityLabel");
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v119;

    uint64_t v121 = objc_opt_class();
    uint64_t v123 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v122, v121, @"activityUUID");
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSUUID *)v123;

    v5->_suppressServerFiltering = objc_msgSend_decodeBoolForKey_(v4, v125, @"SecureBackupSuppressServerFiltering");
    v5->_silentDoubleRecovery = objc_msgSend_decodeBoolForKey_(v4, v126, @"SecureBackupSilentDoubleRecovery");
    v5->_deleteDoubleOnly = objc_msgSend_decodeBoolForKey_(v4, v127, @"SecureBackupDeleteDoubleOnly");
    v5->_nonViableRepair = objc_msgSend_decodeBoolForKey_(v4, v128, @"SecureBackupNonViableRepairKey");
    v5->_sosCompatibleEscrowSorting = objc_msgSend_decodeBoolForKey_(v4, v129, @"SecureBackupSOSCompatibleEscrowSorting");
    uint64_t v130 = objc_opt_class();
    uint64_t v132 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v131, v130, @"SecureBackupDeviceSessionIDKey");
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v132;

    uint64_t v134 = objc_opt_class();
    uint64_t v136 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v135, v134, @"SecureBackupFlowIDKey");
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v136;

    v5->_guitarfish = objc_msgSend_decodeBoolForKey_(v4, v138, @"SecureBackupGuitarfishKey");
    v5->_guitarfishToken = objc_msgSend_decodeBoolForKey_(v4, v139, @"SecureBackupGuitarfishTokenKey");
    uint64_t v140 = objc_opt_class();
    uint64_t v142 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v141, v140, @"SecureBackupAppleIDPasswordMetadataKey");
    appleIDPasswordMetadata = v5->_appleIDPasswordMetadata;
    v5->_appleIDPasswordMetadata = (AppleIDPasswordMetadata *)v142;

    v144 = CloudServicesLog();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
    {
      uint64_t v147 = objc_msgSend_UUIDString(v5->_activityUUID, v145, v146);
      v148 = v5->_activityLabel;
      *(_DWORD *)buf = 138412546;
      v152 = v147;
      __int16 v153 = 2112;
      uint64_t v154 = v148;
      _os_log_impl(&dword_218118000, v144, OS_LOG_TYPE_INFO, "Deserialized SecureBackup object: %@ %@", buf, 0x16u);
    }
  }

  return v5;
}

- (void)populateWithInfo:(id)a3
{
  id v200 = a3;
  v5 = objc_msgSend_objectForKeyedSubscript_(v200, v4, @"SecureBackupAuthenticationAppleID");
  objc_msgSend_setAppleID_(self, v6, (uint64_t)v5);

  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v200, v7, @"SecureBackupAuthenticationAuthToken");
  objc_msgSend_setAuthToken_(self, v9, (uint64_t)v8);

  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v200, v10, @"SecureBackupBackOffDate");
  objc_msgSend_setBackOffDate_(self, v12, (uint64_t)v11);

  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v200, v13, @"countryDialCode");
  objc_msgSend_setCountryDialCode_(self, v15, (uint64_t)v14);

  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v200, v16, @"countryISOCode");
  objc_msgSend_setCountryCode_(self, v18, (uint64_t)v17);

  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v200, v19, @"SecureBackupiCloudDataProtectionDeleteAllRecords");
  uint64_t v21 = MEMORY[0x263EFFA88];
  uint64_t isEqualToNumber = objc_msgSend_isEqualToNumber_(v20, v22, MEMORY[0x263EFFA88]);
  objc_msgSend_setDeleteAll_(self, v24, isEqualToNumber);

  uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v200, v25, @"SecureBackupAuthenticationDSID");
  objc_msgSend_setDsid_(self, v27, (uint64_t)v26);

  uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v200, v28, @"SecureBackupEMCSManagedCredential");
  objc_msgSend_setEmcsCred_(self, v30, (uint64_t)v29);

  v32 = objc_msgSend_objectForKeyedSubscript_(v200, v31, @"SecureBackupEMCSIDMSDict");
  objc_msgSend_setEmcsDict_(self, v33, (uint64_t)v32);

  v35 = objc_msgSend_objectForKeyedSubscript_(v200, v34, @"SecureBackupContainsEMCSData");
  uint64_t v37 = objc_msgSend_isEqualToNumber_(v35, v36, v21);
  objc_msgSend_setEmcsMode_(self, v38, v37);

  v40 = objc_msgSend_objectForKeyedSubscript_(v200, v39, @"SecureBackupAuthenticationEscrowProxyURL");
  objc_msgSend_setEscrowProxyURL_(self, v41, (uint64_t)v40);

  uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v200, v42, @"SecureBackupExcludeiCDPRecords");
  uint64_t v45 = objc_msgSend_isEqualToNumber_(v43, v44, v21);
  objc_msgSend_setExcludeiCDPRecords_(self, v46, v45);

  v48 = objc_msgSend_objectForKeyedSubscript_(v200, v47, @"SecureBackupFMiPRecoveryKey");
  uint64_t v50 = objc_msgSend_isEqualToNumber_(v48, v49, v21);
  objc_msgSend_setFmipRecovery_(self, v51, v50);

  v53 = objc_msgSend_objectForKeyedSubscript_(v200, v52, @"SecureBackupFMiPUUIDKey");
  objc_msgSend_setFmipUUID_(self, v54, (uint64_t)v53);

  uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v200, v55, @"SecureBackupContainsiCDPData");
  uint64_t v58 = objc_msgSend_isEqualToNumber_(v56, v57, v21);
  objc_msgSend_setIcdp_(self, v59, v58);

  v61 = objc_msgSend_objectForKeyedSubscript_(v200, v60, @"SecureBackupAuthenticationiCloudEnvironment");
  objc_msgSend_setICloudEnv_(self, v62, (uint64_t)v61);

  v64 = objc_msgSend_objectForKeyedSubscript_(v200, v63, @"SecureBackupiCloudIdentityData");
  objc_msgSend_setICloudIdentityData_(self, v65, (uint64_t)v64);

  v67 = objc_msgSend_objectForKeyedSubscript_(v200, v66, @"SecureBackupAuthenticationPassword");
  objc_msgSend_setICloudPassword_(self, v68, (uint64_t)v67);

  uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v200, v69, @"SecureBackupAuthenticationRawPassword");
  objc_msgSend_setRawPassword_(self, v71, (uint64_t)v70);

  v73 = objc_msgSend_objectForKeyedSubscript_(v200, v72, @"SecureBackupIDMSData");
  objc_msgSend_setIdmsData_(self, v74, (uint64_t)v73);

  v76 = objc_msgSend_objectForKeyedSubscript_(v200, v75, @"SecureBackupIDMSRecovery");
  uint64_t v78 = objc_msgSend_isEqualToNumber_(v76, v77, v21);
  objc_msgSend_setIdmsRecovery_(self, v79, v78);

  uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v200, v80, @"SecureBackupMetadata");
  objc_msgSend_setMetadata_(self, v82, (uint64_t)v81);

  v84 = objc_msgSend_objectForKeyedSubscript_(v200, v83, @"SecureBackupStingrayMetadataHash");
  objc_msgSend_setMetadataHash_(self, v85, (uint64_t)v84);

  uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v200, v86, @"SecureBackupEMCSOldManagedCredential");
  objc_msgSend_setOldEMCSCred_(self, v88, (uint64_t)v87);

  uint64_t v90 = objc_msgSend_objectForKeyedSubscript_(v200, v89, @"SecureBackupPassphrase");
  objc_msgSend_setPassphrase_(self, v91, (uint64_t)v90);

  uint64_t v93 = objc_msgSend_objectForKeyedSubscript_(v200, v92, @"recordID");
  objc_msgSend_setRecordID_(self, v94, (uint64_t)v93);

  v96 = objc_msgSend_objectForKeyedSubscript_(v200, v95, @"SecureBackupRecoveryKey");
  objc_msgSend_setRecoveryKey_(self, v97, (uint64_t)v96);

  v99 = objc_msgSend_objectForKeyedSubscript_(v200, v98, @"phoneNumber");
  objc_msgSend_setSmsTarget_(self, v100, (uint64_t)v99);

  v103 = objc_msgSend_smsTarget(self, v101, v102);

  if (!v103)
  {
    uint64_t v105 = objc_msgSend_objectForKeyedSubscript_(v200, v104, @"SecureBackupSMSTarget");
    objc_msgSend_setSmsTarget_(self, v106, (uint64_t)v105);
  }
  uint64_t v107 = objc_msgSend_objectForKeyedSubscript_(v200, v104, @"SecureBackupSilentRecoveryAttempt");
  uint64_t v108 = MEMORY[0x263EFFA88];
  uint64_t v110 = objc_msgSend_isEqualToNumber_(v107, v109, MEMORY[0x263EFFA88]);
  objc_msgSend_setSilent_(self, v111, v110);

  uint64_t v113 = objc_msgSend_objectForKeyedSubscript_(v200, v112, @"SecureBackupSpecifiedFederation");
  objc_msgSend_setSpecifiedFederation_(self, v114, (uint64_t)v113);

  v116 = objc_msgSend_objectForKeyedSubscript_(v200, v115, @"SecureBackupContainsiCloudIdentity");
  uint64_t v118 = objc_msgSend_isEqualToNumber_(v116, v117, v108);
  objc_msgSend_setStingray_(self, v119, v118);

  uint64_t v121 = objc_msgSend_objectForKeyedSubscript_(v200, v120, @"SecureBackupSynchronize");
  uint64_t v123 = objc_msgSend_isEqualToNumber_(v121, v122, v108);
  objc_msgSend_setSynchronize_(self, v124, v123);

  uint64_t v126 = objc_msgSend_objectForKeyedSubscript_(v200, v125, @"SecureBackupUseCachedPassphrase");
  uint64_t v128 = objc_msgSend_isEqualToNumber_(v126, v127, v108);
  objc_msgSend_setUseCachedPassphrase_(self, v129, v128);

  uint64_t v131 = objc_msgSend_objectForKeyedSubscript_(v200, v130, @"SecureBackupHSA2CachedPrerecordUUID");
  objc_msgSend_setHsa2CachedPrerecordUUID_(self, v132, (uint64_t)v131);

  uint64_t v134 = objc_msgSend_objectForKeyedSubscript_(v200, v133, @"SecureBackupIDMSRecovery");
  uint64_t v136 = objc_msgSend_isEqualToNumber_(v134, v135, v108);
  objc_msgSend_setUseRecoveryPET_(self, v137, v136);

  v139 = objc_msgSend_objectForKeyedSubscript_(v200, v138, @"SecureBackupUsesMultipleiCSCs");
  uint64_t v141 = objc_msgSend_isEqualToNumber_(v139, v140, v108);
  objc_msgSend_setUsesMultipleiCSC_(self, v142, v141);

  v144 = objc_msgSend_objectForKeyedSubscript_(v200, v143, @"SecureBackupUsesRandomPassphrase");
  uint64_t v146 = objc_msgSend_isEqualToNumber_(v144, v145, v108);
  objc_msgSend_setUsesRandomPassphrase_(self, v147, v146);

  v149 = objc_msgSend_objectForKeyedSubscript_(v200, v148, @"SecureBackupUsesRecoveryKey");
  uint64_t v151 = objc_msgSend_isEqualToNumber_(v149, v150, v108);
  objc_msgSend_setUsesRecoveryKey_(self, v152, v151);

  uint64_t v154 = objc_msgSend_objectForKeyedSubscript_(v200, v153, @"SecureBackupVerifcationToken");
  objc_msgSend_setVerificationToken_(self, v155, (uint64_t)v154);

  v157 = objc_msgSend_objectForKeyedSubscript_(v200, v156, @"SecureBackupSuppressServerFiltering");
  uint64_t v159 = objc_msgSend_isEqualToNumber_(v157, v158, v108);
  objc_msgSend_setSuppressServerFiltering_(self, v160, v159);

  uint64_t v162 = objc_msgSend_objectForKeyedSubscript_(v200, v161, @"SecureBackupSilentDoubleRecovery");
  uint64_t v164 = objc_msgSend_isEqualToNumber_(v162, v163, v108);
  objc_msgSend_setSilentDoubleRecovery_(self, v165, v164);

  v167 = objc_msgSend_objectForKeyedSubscript_(v200, v166, @"SecureBackupDeleteDoubleOnly");
  uint64_t v169 = objc_msgSend_isEqualToNumber_(v167, v168, v108);
  objc_msgSend_setDeleteDoubleOnly_(self, v170, v169);

  v172 = objc_msgSend_objectForKeyedSubscript_(v200, v171, @"SecureBackupNonViableRepairKey");
  uint64_t v174 = objc_msgSend_isEqualToNumber_(v172, v173, v108);
  objc_msgSend_setNonViableRepair_(self, v175, v174);

  v177 = objc_msgSend_objectForKeyedSubscript_(v200, v176, @"SecureBackupSOSCompatibleEscrowSorting");
  uint64_t v179 = objc_msgSend_isEqualToNumber_(v177, v178, v108);
  objc_msgSend_setSosCompatibleEscrowSorting_(self, v180, v179);

  uint64_t v182 = objc_msgSend_objectForKeyedSubscript_(v200, v181, @"SecureBackupDeviceSessionIDKey");
  objc_msgSend_setDeviceSessionID_(self, v183, (uint64_t)v182);

  v185 = objc_msgSend_objectForKeyedSubscript_(v200, v184, @"SecureBackupFlowIDKey");
  objc_msgSend_setFlowID_(self, v186, (uint64_t)v185);

  v188 = objc_msgSend_objectForKeyedSubscript_(v200, v187, @"SecureBackupGuitarfishKey");
  uint64_t v190 = objc_msgSend_isEqualToNumber_(v188, v189, v108);
  objc_msgSend_setGuitarfish_(self, v191, v190);

  v193 = objc_msgSend_objectForKeyedSubscript_(v200, v192, @"SecureBackupGuitarfishTokenKey");
  uint64_t v195 = objc_msgSend_isEqualToNumber_(v193, v194, v108);
  objc_msgSend_setGuitarfishToken_(self, v196, v195);

  uint64_t v198 = objc_msgSend_objectForKeyedSubscript_(v200, v197, @"SecureBackupAppleIDPasswordMetadataKey");
  objc_msgSend_setAppleIDPasswordMetadata_(self, v199, (uint64_t)v198);
}

- (void)setICloudPassword:(id)a3
{
  id v4 = (NSString *)a3;
  id v7 = v4;
  if (v4 && (objc_msgSend_isPasswordEquivalentToken(v4, v5, v6) & 1) == 0)
  {
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_21813D160(v8);
    }
  }
  iCloudPassword = self->_iCloudPassword;
  self->_iCloudPassword = v7;
}

- (void)setRawPassword:(id)a3
{
  id v4 = (NSString *)a3;
  id v7 = v4;
  if (v4 && objc_msgSend_isPasswordEquivalentToken(v4, v5, v6))
  {
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_21813D1A4(v8);
    }
  }
  rawPassword = self->_rawPassword;
  self->_rawPassword = v7;
}

- (void)getAccountInfoWithResults:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811C4BC;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811C534;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling getAccountInfoWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)fetchStingrayAccountStatus:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811C834;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811C8AC;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling fetchStingrayAccountStatus in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)enableWithCompletionBlock:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_21811CCB4;
  v28[3] = &unk_264303018;
  id v8 = v4;
  id v29 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v28);
  id v11 = _CloudServicesSignpostLogSystem();
  os_signpost_id_t v12 = _CloudServicesSignpostCreate(v11);
  uint64_t v14 = v13;

  id v15 = _CloudServicesSignpostLogSystem();
  uint64_t v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218118000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v12, "EnableWithRequest", " enableTelemetry=YES ", buf, 2u);
  }

  id v17 = _CloudServicesSignpostLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v31 = v12;
    _os_log_impl(&dword_218118000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: EnableWithRequest  enableTelemetry=YES ", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811CD28;
  activity_block[3] = &unk_2643030E0;
  id v22 = v10;
  uint64_t v23 = self;
  os_signpost_id_t v26 = v12;
  uint64_t v27 = v14;
  id v24 = v7;
  id v25 = v8;
  id v18 = v8;
  id v19 = v7;
  id v20 = v10;
  _os_activity_initiate(&dword_218118000, "calling enableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)recoverWithResults:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811D124;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811D19C;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling recoverWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)recoverRecordContents:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811D49C;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811D514;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling recoverRecordContents in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)createICDPRecordWithContents:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend__CreateSecureBackupConnection(self, v8, v9);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_21811D840;
  v24[3] = &unk_264303018;
  id v11 = v7;
  id v25 = v11;
  id v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v24);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21811D8B4;
  v18[3] = &unk_264303130;
  id v19 = v13;
  id v20 = self;
  id v21 = v6;
  id v22 = v10;
  id v23 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v6;
  id v17 = v13;
  _os_activity_initiate(&dword_218118000, "calling createICDPRecord in daemon", OS_ACTIVITY_FLAG_DEFAULT, v18);
}

- (void)disableWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811DBA4;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811DC18;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling disableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)stashRecoveryDataWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811DF04;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811DF78;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling stashRecoveryDataWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)updateMetadataWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811E264;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  uint64_t v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811E2D8;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling updateMetadata in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)cachePassphrase
{
  id v4 = objc_msgSend__CreateSecureBackupConnection(self, a2, v2);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21811E5A0;
  v15[3] = &unk_264303158;
  id v16 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x21D463430](v15);
  uint64_t v9 = objc_msgSend_remoteObjectProxy(v5, v7, v8);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811E614;
  activity_block[3] = &unk_264303180;
  id v13 = v9;
  id v14 = self;
  id v10 = v9;
  _os_activity_initiate(&dword_218118000, "calling cachePassphraseWithRequestAsync in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_msgSend_addBarrierBlock_(v5, v11, (uint64_t)v6);
}

- (void)cachePassphraseWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811E778;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811E7EC;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling cachePassphraseWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)uncachePassphraseWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811EA58;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811EACC;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling uncachePassphraseWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)cacheRecoveryKeyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811ED38;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811EDAC;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling cacheRecoveryKeyWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)uncacheRecoveryKeyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811F018;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811F08C;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling cacheRecoveryKeyWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)uncachePassphrase
{
  id v4 = objc_msgSend__CreateSecureBackupConnection(self, a2, v2);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21811F2D4;
  v15[3] = &unk_264303158;
  id v16 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x21D463430](v15);
  uint64_t v9 = objc_msgSend_remoteObjectProxy(v5, v7, v8);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811F348;
  activity_block[3] = &unk_264303180;
  id v13 = v9;
  id v14 = self;
  id v10 = v9;
  _os_activity_initiate(&dword_218118000, "calling uncachePassphraseWithRequestAsync in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_msgSend_addBarrierBlock_(v5, v11, (uint64_t)v6);
}

- (void)startSMSChallengeWithResults:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811F4AC;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811F524;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling startSMSChallengeWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)getCountrySMSCodesWithResults:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811F824;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811F89C;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling getCountrySMSCodesWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)changeSMSTargetWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21811FB9C;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811FC10;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling changeSMSTargetWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (SecureBackup)backupWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend__CreateSecureBackupConnection(self, v8, v9);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_21811FF1C;
  v24[3] = &unk_264303018;
  id v11 = v7;
  id v25 = v11;
  id v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v24);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21811FF90;
  activity_block[3] = &unk_264303068;
  id v20 = v13;
  id v21 = v6;
  id v22 = v10;
  id v23 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v6;
  id v17 = v13;
  _os_activity_initiate(&dword_218118000, "calling backupWithInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  return result;
}

- (void)backOffDateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21812027C;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181202F4;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling backOffDateWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)setBackOffDateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2181205F4;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218120668;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling setBackOffDateWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)notificationInfo:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v8, OS_LOG_TYPE_DEFAULT, "calling notificationInfo in daemon", buf, 2u);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_218120998;
  v19[3] = &unk_264303018;
  id v9 = v4;
  id v20 = v9;
  id v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_218120A10;
  v15[3] = &unk_2643031A8;
  id v16 = v11;
  id v17 = v7;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v11;
  _os_activity_initiate(&dword_218118000, "calling notificationInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);
}

- (void)stateCaptureWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v8, OS_LOG_TYPE_DEFAULT, "calling stateCapture in daemon", buf, 2u);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_218120D44;
  v19[3] = &unk_264303018;
  id v9 = v4;
  id v20 = v9;
  id v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v10, (uint64_t)v19);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_218120DBC;
  v15[3] = &unk_2643031A8;
  id v16 = v11;
  id v17 = v7;
  id v18 = v9;
  id v12 = v9;
  id v13 = v7;
  id v14 = v11;
  _os_activity_initiate(&dword_218118000, "calling stateCapture in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);
}

- (id)getAccountInfoWithError:(id *)a3
{
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = sub_2181211BC;
  uint64_t v32 = sub_218119820;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2181211BC;
  os_signpost_id_t v26 = sub_218119820;
  id v27 = 0;
  id v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2181211CC;
  v21[3] = &unk_2643031D0;
  v21[4] = &v28;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v21);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813DBB4(v8, v9, v10);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21812123C;
  v15[3] = &unk_264303220;
  id v16 = v7;
  id v17 = self;
  id v19 = &v28;
  id v20 = &v22;
  id v18 = v5;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling getAccountInfoWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);

  if (a3) {
    *a3 = (id) v29[5];
  }
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (id)getAccountInfoWithInfo:(id)a3 results:(id *)a4
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  id v7 = objc_msgSend_getAccountInfoWithError_(self, v6, (uint64_t)&v10);
  id v8 = v10;
  if (a4) {
    *a4 = v7;
  }

  return v8;
}

- (void)getAccountInfoWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_getAccountInfoWithResults_(self, v7, (uint64_t)v8);
}

- (void)getAccountInfoWithInfo:(id)a3 completionBlock:(id)a4
{
}

- (BOOL)updateMetadataWithError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2181211BC;
  id v25 = sub_218119820;
  id v26 = 0;
  id v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2181216DC;
  v20[3] = &unk_2643031D0;
  v20[4] = &v21;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813DC30(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21812174C;
  activity_block[3] = &unk_264303270;
  id v16 = v7;
  id v17 = self;
  id v18 = v5;
  id v19 = &v21;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling updateMetadataWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v22[5];
  }
  uint64_t v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  return v13 == 0;
}

- (id)updateMetadataWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  char updated = objc_msgSend_updateMetadataWithError_(self, v4, (uint64_t)&v10);
  id v6 = v10;
  id v7 = v6;
  id v8 = 0;
  if ((updated & 1) == 0) {
    id v8 = v6;
  }

  return v8;
}

- (void)updateMetadataWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_updateMetadataWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (BOOL)enableWithError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2181211BC;
  id v25 = sub_218119820;
  id v26 = 0;
  id v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_218121BAC;
  v20[3] = &unk_2643031D0;
  v20[4] = &v21;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813DD24(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218121C1C;
  activity_block[3] = &unk_264303270;
  id v16 = v7;
  id v17 = self;
  id v18 = v5;
  id v19 = &v21;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling enableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v22[5];
  }
  uint64_t v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  return v13 == 0;
}

- (id)enableWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  char v5 = objc_msgSend_enableWithError_(self, v4, (uint64_t)&v10);
  id v6 = v10;
  id v7 = v6;
  id v8 = 0;
  if ((v5 & 1) == 0) {
    id v8 = v6;
  }

  return v8;
}

- (void)enableWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_enableWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (id)recoverWithError:(id *)a3
{
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  os_signpost_id_t v31 = sub_2181211BC;
  uint64_t v32 = sub_218119820;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_2181211BC;
  id v26 = sub_218119820;
  id v27 = 0;
  char v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2181220E8;
  v21[3] = &unk_2643031D0;
  v21[4] = &v28;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v21);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813DDA0(v8, v9, v10);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_218122158;
  v15[3] = &unk_264303220;
  id v16 = v7;
  id v17 = self;
  id v19 = &v28;
  id v20 = &v22;
  id v18 = v5;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling recoverWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);

  if (a3) {
    *a3 = (id) v29[5];
  }
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (id)recoverWithCDPContext:(id)a3 escrowRecord:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_2181211BC;
  uint64_t v43 = sub_218119820;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_2181211BC;
  uint64_t v37 = sub_218119820;
  id v38 = 0;
  id v12 = objc_msgSend__CreateSecureBackupConnection(self, v10, v11);
  id v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v9;
    _os_log_impl(&dword_218118000, v13, OS_LOG_TYPE_DEFAULT, "recoverWithCDPContext: invoked escrow recovery with escrowRecord: %@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_218122660;
  v32[3] = &unk_2643031D0;
  v32[4] = &v39;
  id v15 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v32);
  if (pthread_main_np())
  {
    id v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21813DE1C(v16, v17, v18);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181226D0;
  activity_block[3] = &unk_264303298;
  id v26 = v15;
  id v19 = v8;
  id v27 = v19;
  id v20 = v9;
  uint64_t v30 = &v39;
  os_signpost_id_t v31 = &v33;
  id v28 = v20;
  id v29 = v12;
  id v21 = v12;
  id v22 = v15;
  _os_activity_initiate(&dword_218118000, "calling recoverWithCDPContextInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5) {
    *a5 = (id) v40[5];
  }
  id v23 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

- (id)recoverSilentWithCDPContext:(id)a3 allRecords:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_2181211BC;
  uint64_t v43 = sub_218119820;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_2181211BC;
  uint64_t v37 = sub_218119820;
  id v38 = 0;
  id v12 = objc_msgSend__CreateSecureBackupConnection(self, v10, v11);
  id v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v9;
    _os_log_impl(&dword_218118000, v13, OS_LOG_TYPE_DEFAULT, "recoverSilentWithCDPContext: invoked silent escrow recovery with records: %@", buf, 0xCu);
  }

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_218122BE8;
  v32[3] = &unk_2643031D0;
  v32[4] = &v39;
  id v15 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v32);
  if (pthread_main_np())
  {
    id v16 = CloudServicesLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21813DF10(v16, v17, v18);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218122C58;
  activity_block[3] = &unk_264303298;
  id v26 = v15;
  id v19 = v8;
  id v27 = v19;
  id v20 = v9;
  uint64_t v30 = &v39;
  os_signpost_id_t v31 = &v33;
  id v28 = v20;
  id v29 = v12;
  id v21 = v12;
  id v22 = v15;
  _os_activity_initiate(&dword_218118000, "calling recoverSilentWithCDPContextInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5) {
    *a5 = (id) v40[5];
  }
  id v23 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

- (BOOL)isRecoveryKeySet:(id *)a3
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_2181211BC;
  uint64_t v30 = sub_218119820;
  id v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v4 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  char v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySet: invoked", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_218123098;
  v20[3] = &unk_2643031D0;
  v20[4] = &v26;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813E004(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218123108;
  activity_block[3] = &unk_2643032E8;
  uint64_t v18 = &v26;
  id v19 = &v22;
  id v16 = v7;
  id v17 = v4;
  id v11 = v4;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling isRecoveryKeySetInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v27[5];
  }
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void)restoreKeychainAsyncWithPassword:(id)a3 keybagDigest:(id)a4 haveBottledPeer:(BOOL)a5 viewsNotToBeRestored:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_2181211BC;
  uint64_t v43 = sub_218119820;
  id v44 = 0;
  id v17 = objc_msgSend__CreateSecureBackupConnection(self, v15, v16);
  uint64_t v18 = CloudServicesLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v18, OS_LOG_TYPE_DEFAULT, "restoreKeychainAsyncWithPassword: invoked", buf, 2u);
  }

  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_218123570;
  v37[3] = &unk_2643031D0;
  v37[4] = &v39;
  id v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v19, (uint64_t)v37);
  if (pthread_main_np())
  {
    id v21 = CloudServicesLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21813E0F8(v21, v22, v23);
    }
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_2181235E0;
  v29[3] = &unk_264303310;
  id v24 = v20;
  id v30 = v24;
  id v25 = v12;
  id v31 = v25;
  id v26 = v13;
  id v32 = v26;
  BOOL v36 = a5;
  id v27 = v14;
  id v33 = v27;
  uint64_t v35 = &v39;
  id v28 = v17;
  id v34 = v28;
  _os_activity_initiate(&dword_218118000, "calling restoreKeychainAsyncWithPassword in daemon", OS_ACTIVITY_FLAG_DEFAULT, v29);

  if (a7) {
    *a7 = (id) v40[5];
  }

  _Block_object_dispose(&v39, 8);
}

- (BOOL)restoreKeychainWithBackupPassword:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  BOOL v36 = sub_2181211BC;
  uint64_t v37 = sub_218119820;
  id v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v9 = objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  uint64_t v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v10, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword: invoked", buf, 2u);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_218123A28;
  v27[3] = &unk_2643031D0;
  v27[4] = &v33;
  id v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v27);
  if (pthread_main_np())
  {
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21813E1EC(v13, v14, v15);
    }
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_218123A98;
  v21[3] = &unk_264303220;
  id v22 = v12;
  id v16 = v6;
  id v25 = &v33;
  id v26 = &v29;
  id v23 = v16;
  id v24 = v9;
  id v17 = v9;
  id v18 = v12;
  _os_activity_initiate(&dword_218118000, "calling restoreKeychainWithBackupPassword in daemon", OS_ACTIVITY_FLAG_DEFAULT, v21);

  if (a4) {
    *a4 = (id) v34[5];
  }
  char v19 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (BOOL)verifyRecoveryKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  BOOL v36 = sub_2181211BC;
  uint64_t v37 = sub_218119820;
  id v38 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v9 = objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  uint64_t v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v10, OS_LOG_TYPE_DEFAULT, "verifyRecoveryKey: invoked", buf, 2u);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_218123EE0;
  v27[3] = &unk_2643031D0;
  v27[4] = &v33;
  id v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v27);
  if (pthread_main_np())
  {
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21813E2E0(v13, v14, v15);
    }
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_218123F50;
  v21[3] = &unk_264303220;
  id v22 = v12;
  id v16 = v6;
  id v25 = &v33;
  id v26 = &v29;
  id v23 = v16;
  id v24 = v9;
  id v17 = v9;
  id v18 = v12;
  _os_activity_initiate(&dword_218118000, "calling verifyRecoveryKey in daemon", OS_ACTIVITY_FLAG_DEFAULT, v21);

  if (a4) {
    *a4 = (id) v34[5];
  }
  char v19 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (BOOL)removeRecoveryKeyFromBackup:(id *)a3
{
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_2181211BC;
  id v30 = sub_218119820;
  id v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v4 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  char v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218118000, v5, OS_LOG_TYPE_DEFAULT, "removeRecoveryKeyFromBackup: invoked", buf, 2u);
  }

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_218124370;
  v20[3] = &unk_2643031D0;
  v20[4] = &v26;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    uint64_t v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813E3D4(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181243E0;
  activity_block[3] = &unk_2643032E8;
  id v18 = &v26;
  char v19 = &v22;
  id v16 = v7;
  id v17 = v4;
  id v11 = v4;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling removeRecoveryKeyFromBackup in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v27[5];
  }
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)recoverWithInfo:(id)a3 results:(id *)a4
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  id v7 = objc_msgSend_recoverWithError_(self, v6, (uint64_t)&v10);
  id v8 = v10;
  if (a4) {
    *a4 = v7;
  }

  return v8;
}

- (void)recoverWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  objc_msgSend_populateWithInfo_(self, v8, (uint64_t)v7);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2181246E4;
  v11[3] = &unk_264303338;
  id v12 = v6;
  id v9 = v6;
  objc_msgSend_recoverWithResults_(self, v10, (uint64_t)v11);
}

- (void)recoverWithInfo:(id)a3 completionBlock:(id)a4
{
}

- (BOOL)disableWithError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2181211BC;
  char v25 = sub_218119820;
  id v26 = 0;
  char v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_218124974;
  v20[3] = &unk_2643031D0;
  v20[4] = &v21;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813E4C8(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181249E4;
  activity_block[3] = &unk_264303270;
  id v16 = v7;
  id v17 = self;
  id v18 = v5;
  char v19 = &v21;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling disableWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v22[5];
  }
  uint64_t v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  return v13 == 0;
}

- (id)disableWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  char v5 = objc_msgSend_disableWithError_(self, v4, (uint64_t)&v10);
  id v6 = v10;
  id v7 = v6;
  id v8 = 0;
  if ((v5 & 1) == 0) {
    id v8 = v6;
  }

  return v8;
}

- (void)disableWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_disableWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (void)stashRecoveryDataWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  kdebug_trace();
  objc_msgSend_populateWithInfo_(self, v8, (uint64_t)v7);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_218124D20;
  v11[3] = &unk_264303018;
  id v12 = v6;
  id v9 = v6;
  objc_msgSend_stashRecoveryDataWithCompletionBlock_(self, v10, (uint64_t)v11);
}

- (id)cachePassphraseWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  objc_msgSend_cachePassphrase(self, v4, v5);
  return 0;
}

- (void)cachePassphraseWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_cachePassphraseWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (id)uncachePassphraseWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  objc_msgSend_uncachePassphrase(self, v4, v5);
  return 0;
}

- (void)uncachePassphraseWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_uncachePassphraseWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (id)startSMSChallengeWithError:(id *)a3
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_2181211BC;
  char v32 = sub_218119820;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = sub_2181211BC;
  id v26 = sub_218119820;
  id v27 = 0;
  uint64_t v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_21812511C;
  v21[3] = &unk_2643031D0;
  void v21[4] = &v28;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v21);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813E544(v8, v9, v10);
    }
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_21812518C;
  v15[3] = &unk_264303220;
  id v16 = v7;
  id v17 = self;
  char v19 = &v28;
  id v20 = &v22;
  id v18 = v5;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling startSMSChallengeWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, v15);

  if (a3) {
    *a3 = (id) v29[5];
  }
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (id)startSMSChallengeWithInfo:(id)a3 results:(id *)a4
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  id v7 = objc_msgSend_startSMSChallengeWithError_(self, v6, (uint64_t)&v10);
  id v8 = v10;
  if (a4) {
    *a4 = v7;
  }

  return v8;
}

- (void)startSMSChallengeWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_startSMSChallengeWithResults_(self, v7, (uint64_t)v8);
}

- (void)startSMSChallengeWithInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2181254D0;
  v9[3] = &unk_264303338;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_startSMSChallengeWithInfo_completionBlockWithResults_(self, v8, (uint64_t)a3, v9);
}

- (void)getCountrySMSCodesWithInfo:(id)a3 completionBlockWithResults:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_getCountrySMSCodesWithResults_(self, v7, (uint64_t)v8);
}

- (BOOL)changeSMSTargetWithError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_2181211BC;
  char v25 = sub_218119820;
  id v26 = 0;
  uint64_t v5 = objc_msgSend__CreateSecureBackupConnection(self, a2, (uint64_t)a3);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_218125740;
  v20[3] = &unk_2643031D0;
  v20[4] = &v21;
  id v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v20);
  if (pthread_main_np())
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21813E5C0(v8, v9, v10);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181257B0;
  activity_block[3] = &unk_264303270;
  id v16 = v7;
  id v17 = self;
  id v18 = v5;
  char v19 = &v21;
  id v11 = v5;
  id v12 = v7;
  _os_activity_initiate(&dword_218118000, "calling changeSMSTargetWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3) {
    *a3 = (id) v22[5];
  }
  uint64_t v13 = v22[5];

  _Block_object_dispose(&v21, 8);
  return v13 == 0;
}

- (id)changeSMSTargetWithInfo:(id)a3
{
  objc_msgSend_populateWithInfo_(self, a2, (uint64_t)a3);
  id v10 = 0;
  char v5 = objc_msgSend_changeSMSTargetWithError_(self, v4, (uint64_t)&v10);
  id v6 = v10;
  id v7 = v6;
  id v8 = 0;
  if ((v5 & 1) == 0) {
    id v8 = v6;
  }

  return v8;
}

- (void)changeSMSTargetWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_changeSMSTargetWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (id)backupForRecoveryKeyWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_2181211BC;
  uint64_t v28 = sub_218119820;
  id v29 = 0;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_218125C20;
  v23[3] = &unk_2643031D0;
  v23[4] = &v24;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v23);
  if (pthread_main_np())
  {
    id v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21813E63C(v10, v11, v12);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218125C90;
  activity_block[3] = &unk_264303270;
  id v19 = v9;
  id v20 = v4;
  id v21 = v7;
  uint64_t v22 = &v24;
  id v13 = v7;
  id v14 = v4;
  id v15 = v9;
  _os_activity_initiate(&dword_218118000, "calling backupForRecoveryKeyWithInfoInDaemon in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  id v16 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (SecureBackup)backupWithInfo:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_2181211BC;
  uint64_t v28 = sub_218119820;
  id v29 = 0;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_218126024;
  v23[3] = &unk_2643031D0;
  v23[4] = &v24;
  uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v23);
  if (pthread_main_np())
  {
    id v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21813E724(v10, v11, v12);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218126094;
  activity_block[3] = &unk_264303270;
  id v19 = v9;
  id v20 = v4;
  id v21 = v7;
  uint64_t v22 = &v24;
  id v13 = v7;
  id v14 = v4;
  id v15 = v9;
  _os_activity_initiate(&dword_218118000, "calling backupWithInfo in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  id v16 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return (SecureBackup *)v16;
}

- (void)backOffDateWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_backOffDateWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (void)setBackOffDateWithInfo:(id)a3 completionBlock:(id)a4
{
  id v8 = a4;
  objc_msgSend_populateWithInfo_(self, v6, (uint64_t)a3);
  objc_msgSend_setBackOffDateWithCompletionBlock_(self, v7, (uint64_t)v8);
}

- (id)srpInitNonce
{
  v3 = [SRPInit alloc];
  char v5 = objc_msgSend_initWithSecureBackup_(v3, v4, (uint64_t)self);
  uint64_t v6 = [CSSESWrapper alloc];
  id v8 = objc_msgSend_initWithRequest_reqVersion_(v6, v7, (uint64_t)v5, 0);
  objc_msgSend_setSes_(self, v9, (uint64_t)v8);

  uint64_t v12 = objc_msgSend_ses(self, v10, v11);
  id v15 = objc_msgSend_srpInitBlob(v12, v13, v14);

  return v15;
}

- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_ses(self, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srpRecoveryUpdateDSID_recoveryPassphrase_(v11, v10, (uint64_t)v7, v6);
}

- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_ses(self, v7, v8);
  id v11 = objc_msgSend_srpRecoveryBlobFromData_error_(v9, v10, (uint64_t)v6, a4);

  objc_msgSend_setSes_(self, v12, 0);

  return v11;
}

- (id)srpRecoveryBlobFromSRPInitResponse:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_srpRecoveryBlobFromSRPInitResponse_error_, a3);
}

- (void)prepareHSA2EscrowRecordContents:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend__CreateSecureBackupConnection(self, v7, v8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_21812661C;
  v25[3] = &unk_264303018;
  id v10 = v6;
  id v26 = v10;
  uint64_t v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v25);
  if (pthread_main_np())
  {
    id v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21813E7A0(v13, v14, v15);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_218126690;
  v19[3] = &unk_264303360;
  id v20 = v12;
  id v21 = self;
  BOOL v24 = a3;
  id v22 = v9;
  id v23 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v12;
  _os_activity_initiate(&dword_218118000, "calling prepareHSA2EscrowRecordContents in daemon", OS_ACTIVITY_FLAG_DEFAULT, v19);
}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, a3);
  id v10 = objc_msgSend_UUIDString(v7, v8, v9);
  uint64_t v12 = objc_msgSend_beginHSA2PasscodeRequest_uuid_reason_error_(self, v11, v5, v10, 0, a4);

  return v12;
}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend_beginHSA2PasscodeRequest_uuid_reason_error_(self, a2, a3, a4, 0, a5);
}

- (id)beginHSA2PasscodeRequest:(BOOL)a3 uuid:(id)a4 reason:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = sub_2181211BC;
  uint64_t v47 = sub_218119820;
  id v48 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_2181211BC;
  uint64_t v41 = sub_218119820;
  id v42 = 0;
  uint64_t v14 = objc_msgSend__CreateSecureBackupConnection(self, v12, v13);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = sub_218126D38;
  v36[3] = &unk_2643031D0;
  v36[4] = &v43;
  id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v36);
  if (pthread_main_np())
  {
    id v17 = CloudServicesLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21813E9FC(v17, v18, v19);
    }
  }
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218126DA8;
  activity_block[3] = &unk_2643033F8;
  id v28 = v16;
  id v29 = self;
  BOOL v35 = a3;
  id v20 = v10;
  id v30 = v20;
  id v21 = v11;
  id v33 = &v43;
  id v34 = &v37;
  id v31 = v21;
  id v32 = v14;
  id v22 = v14;
  id v23 = v16;
  _os_activity_initiate(&dword_218118000, "calling beginHSA2PasscodeRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a6)
  {
    BOOL v24 = (void *)v44[5];
    if (v24) {
      *a6 = v24;
    }
  }
  id v25 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v25;
}

- (void)getCertificates:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend__CreateSecureBackupConnection(self, v5, v6);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2181270E4;
  v19[3] = &unk_264303018;
  id v8 = v4;
  id v20 = v8;
  id v10 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v19);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218127164;
  activity_block[3] = &unk_264303068;
  id v15 = v10;
  id v16 = self;
  id v17 = v7;
  id v18 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v10;
  _os_activity_initiate(&dword_218118000, "calling getCertificatesWithRequest in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (BOOL)requiresDoubleEnrollment
{
  if ((_os_feature_enabled_impl() & 1) != 0
    || (objc_msgSend_guitarfish(self, v3, v4) & 1) != 0
    || (objc_msgSend_guitarfishToken(self, v5, v6) & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v7 = _os_feature_enabled_impl();
    if (v7)
    {
      if (objc_msgSend_icdp(self, v8, v9))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        LOBYTE(v7) = objc_msgSend_stingray(self, v10, v11);
      }
    }
  }
  return v7;
}

+ (void)saveTermsAcceptance:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v8, v9);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2181274DC;
  v23[3] = &unk_264303018;
  id v11 = v7;
  id v24 = v11;
  id v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v23);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_218127550;
  activity_block[3] = &unk_264303068;
  id v19 = v13;
  id v20 = v6;
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v6;
  id v17 = v13;
  _os_activity_initiate(&dword_218118000, "calling saveTermsAcceptance in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

+ (void)getAcceptedTermsForAltDSID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v8, v9);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_21812785C;
  v23[3] = &unk_264303018;
  id v11 = v7;
  id v24 = v11;
  id v13 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v12, (uint64_t)v23);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181278D4;
  activity_block[3] = &unk_264303068;
  id v19 = v13;
  id v20 = v6;
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v6;
  id v17 = v13;
  _os_activity_initiate(&dword_218118000, "calling getAcceptedTermsForAltDSID in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

+ (id)_getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_2181211BC;
  BOOL v35 = sub_218119820;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_2181211BC;
  id v29 = sub_218119820;
  id v30 = 0;
  uint64_t v9 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v7, v8);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_218127D1C;
  v24[3] = &unk_2643031D0;
  void v24[4] = &v31;
  id v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v24);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_218127D8C;
  v18[3] = &unk_264303220;
  id v19 = v11;
  id v12 = v6;
  id v22 = &v31;
  id v23 = &v25;
  id v20 = v12;
  id v21 = v9;
  id v13 = v9;
  id v14 = v11;
  _os_activity_initiate(&dword_218118000, "calling getAcceptedTermsForAltDSID in daemon", OS_ACTIVITY_FLAG_DEFAULT, v18);

  if (a4)
  {
    id v15 = (void *)v32[5];
    if (v15) {
      *a4 = v15;
    }
  }
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

+ (id)getAllAcceptedTermsWithError:(id *)a3
{
  return (id)objc_msgSend__getAcceptedTermsForAltDSID_withError_(a1, a2, 0, a3);
}

+ (id)getAcceptedTermsForAltDSID:(id)a3 withError:(id *)a4
{
  uint64_t v4 = objc_msgSend__getAcceptedTermsForAltDSID_withError_(a1, a2, (uint64_t)a3, a4);
  if (objc_msgSend_count(v4, v5, v6))
  {
    uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(v4, v7, 0);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)moveToFederationAllowed:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v34 = 0;
  BOOL v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = sub_2181211BC;
  id v38 = sub_218119820;
  id v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id v12 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, v10, v11);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_2181281FC;
  v29[3] = &unk_2643031D0;
  void v29[4] = &v34;
  id v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v29);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_21812826C;
  activity_block[3] = &unk_264303298;
  id v23 = v14;
  id v15 = v8;
  id v24 = v15;
  id v16 = v9;
  uint64_t v27 = &v30;
  id v28 = &v34;
  id v25 = v16;
  id v26 = v12;
  id v17 = v12;
  id v18 = v14;
  _os_activity_initiate(&dword_218118000, "calling moveToFederationAllowed in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a5)
  {
    id v19 = (void *)v35[5];
    if (v19) {
      *a5 = v19;
    }
  }
  char v20 = *((unsigned char *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v20;
}

+ (id)knownICDPFederations:(id *)a3
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_2181211BC;
  id v28 = sub_218119820;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_2181211BC;
  id v22 = sub_218119820;
  id v23 = 0;
  uint64_t v4 = objc_msgSend__ClassCreateSecureBackupConcurrentConnection(a1, a2, (uint64_t)a3);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21812864C;
  v17[3] = &unk_2643031D0;
  v17[4] = &v24;
  uint64_t v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)v17);
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = sub_2181286BC;
  activity_block[3] = &unk_2643032E8;
  id v15 = &v18;
  id v16 = &v24;
  id v13 = v6;
  id v14 = v4;
  id v7 = v4;
  id v8 = v6;
  _os_activity_initiate(&dword_218118000, "calling knownICDPFederations in daemon", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if (a3)
  {
    id v9 = (void *)v25[5];
    if (v9) {
      *a3 = v9;
    }
  }
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (NSDate)backOffDate
{
  return self->_backOffDate;
}

- (void)setBackOffDate:(id)a3
{
}

- (NSData)certData
{
  return self->_certData;
}

- (void)setCertData:(id)a3
{
}

- (NSString)countryDialCode
{
  return self->_countryDialCode;
}

- (void)setCountryDialCode:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (BOOL)deleteAll
{
  return self->_deleteAll;
}

- (void)setDeleteAll:(BOOL)a3
{
  self->_deleteAll = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)emcsCred
{
  return self->_emcsCred;
}

- (void)setEmcsCred:(id)a3
{
}

- (NSDictionary)emcsDict
{
  return self->_emcsDict;
}

- (void)setEmcsDict:(id)a3
{
}

- (BOOL)emcsMode
{
  return self->_emcsMode;
}

- (void)setEmcsMode:(BOOL)a3
{
  self->_emcsMode = a3;
}

- (NSString)encodedMetadata
{
  return self->_encodedMetadata;
}

- (void)setEncodedMetadata:(id)a3
{
}

- (NSString)duplicateEncodedMetadata
{
  return self->_duplicateEncodedMetadata;
}

- (void)setDuplicateEncodedMetadata:(id)a3
{
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (void)setEscrowRecord:(id)a3
{
}

- (NSString)escrowProxyURL
{
  return self->_escrowProxyURL;
}

- (void)setEscrowProxyURL:(id)a3
{
}

- (BOOL)excludeiCDPRecords
{
  return self->_excludeiCDPRecords;
}

- (void)setExcludeiCDPRecords:(BOOL)a3
{
  self->_excludeiCDPRecords = a3;
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (void)setFmipRecovery:(BOOL)a3
{
  self->_fmipRecovery = a3;
}

- (NSString)fmipUUID
{
  return self->_fmipUUID;
}

- (void)setFmipUUID:(id)a3
{
}

- (BOOL)icdp
{
  return self->_icdp;
}

- (void)setIcdp:(BOOL)a3
{
  self->_icdp = a3;
}

- (NSString)iCloudEnv
{
  return self->_iCloudEnv;
}

- (void)setICloudEnv:(id)a3
{
}

- (NSData)iCloudIdentityData
{
  return self->_iCloudIdentityData;
}

- (void)setICloudIdentityData:(id)a3
{
}

- (NSString)iCloudPassword
{
  return self->_iCloudPassword;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (NSData)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
}

- (BOOL)idmsRecovery
{
  return self->_idmsRecovery;
}

- (void)setIdmsRecovery:(BOOL)a3
{
  self->_idmsRecovery = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadataHash
{
  return self->_metadataHash;
}

- (void)setMetadataHash:(id)a3
{
}

- (NSString)oldEMCSCred
{
  return self->_oldEMCSCred;
}

- (void)setOldEMCSCred:(id)a3
{
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (NSString)smsTarget
{
  return self->_smsTarget;
}

- (void)setSmsTarget:(id)a3
{
}

- (BOOL)silent
{
  return self->_silent;
}

- (void)setSilent:(BOOL)a3
{
  self->_silent = a3;
}

- (NSNumber)specifiedFederation
{
  return self->_specifiedFederation;
}

- (void)setSpecifiedFederation:(id)a3
{
}

- (BOOL)stingray
{
  return self->_stingray;
}

- (void)setStingray:(BOOL)a3
{
  self->_stingray = a3;
}

- (BOOL)synchronize
{
  return self->_synchronize;
}

- (void)setSynchronize:(BOOL)a3
{
  self->_synchronize = a3;
}

- (BOOL)useCachedPassphrase
{
  return self->_useCachedPassphrase;
}

- (void)setUseCachedPassphrase:(BOOL)a3
{
  self->_useCachedPassphrase = a3;
}

- (BOOL)useRecoveryPET
{
  return self->_useRecoveryPET;
}

- (void)setUseRecoveryPET:(BOOL)a3
{
  self->_useRecoveryPET = a3;
}

- (BOOL)usesMultipleiCSC
{
  return self->_usesMultipleiCSC;
}

- (void)setUsesMultipleiCSC:(BOOL)a3
{
  self->_usesMultipleiCSC = a3;
}

- (BOOL)usesRandomPassphrase
{
  return self->_usesRandomPassphrase;
}

- (void)setUsesRandomPassphrase:(BOOL)a3
{
  self->_usesRandomPassphrase = a3;
}

- (BOOL)usesRecoveryKey
{
  return self->_usesRecoveryKey;
}

- (void)setUsesRecoveryKey:(BOOL)a3
{
  self->_usesRecoveryKey = a3;
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (BOOL)suppressServerFiltering
{
  return self->_suppressServerFiltering;
}

- (void)setSuppressServerFiltering:(BOOL)a3
{
  self->_suppressServerFiltering = a3;
}

- (BOOL)deleteDoubleOnly
{
  return self->_deleteDoubleOnly;
}

- (void)setDeleteDoubleOnly:(BOOL)a3
{
  self->_deleteDoubleOnly = a3;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (void)setNonViableRepair:(BOOL)a3
{
  self->_nonViableRepair = a3;
}

- (BOOL)sosCompatibleEscrowSorting
{
  return self->_sosCompatibleEscrowSorting;
}

- (void)setSosCompatibleEscrowSorting:(BOOL)a3
{
  self->_sosCompatibleEscrowSorting = a3;
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (void)setDeviceSessionID:(id)a3
{
}

- (NSString)flowID
{
  return self->_flowID;
}

- (void)setFlowID:(id)a3
{
}

- (BOOL)guitarfish
{
  return self->_guitarfish;
}

- (void)setGuitarfish:(BOOL)a3
{
  self->_guitarfish = a3;
}

- (BOOL)guitarfishToken
{
  return self->_guitarfishToken;
}

- (void)setGuitarfishToken:(BOOL)a3
{
  self->_guitarfishToken = a3;
}

- (AppleIDPasswordMetadata)appleIDPasswordMetadata
{
  return self->_appleIDPasswordMetadata;
}

- (void)setAppleIDPasswordMetadata:(id)a3
{
}

- (NSString)recoveryUUID
{
  return self->_recoveryUUID;
}

- (void)setRecoveryUUID:(id)a3
{
}

- (NSString)doubleRecoveryUUID
{
  return self->_doubleRecoveryUUID;
}

- (void)setDoubleRecoveryUUID:(id)a3
{
}

- (BOOL)recoveryResult
{
  return self->_recoveryResult;
}

- (void)setRecoveryResult:(BOOL)a3
{
  self->_recoveryResult = a3;
}

- (BOOL)silentDoubleRecovery
{
  return self->_silentDoubleRecovery;
}

- (void)setSilentDoubleRecovery:(BOOL)a3
{
  self->_silentDoubleRecovery = a3;
}

- (NSString)hsa2CachedPrerecordUUID
{
  return self->_hsa2CachedPrerecordUUID;
}

- (void)setHsa2CachedPrerecordUUID:(id)a3
{
}

- (EscrowPrerecord)prerecord
{
  return self->_prerecord;
}

- (void)setPrerecord:(id)a3
{
}

- (CSSESWrapper)ses
{
  return self->_ses;
}

- (void)setSes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ses, 0);
  objc_storeStrong((id *)&self->_prerecord, 0);
  objc_storeStrong((id *)&self->_hsa2CachedPrerecordUUID, 0);
  objc_storeStrong((id *)&self->_doubleRecoveryUUID, 0);
  objc_storeStrong((id *)&self->_recoveryUUID, 0);
  objc_storeStrong((id *)&self->_appleIDPasswordMetadata, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_specifiedFederation, 0);
  objc_storeStrong((id *)&self->_smsTarget, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_oldEMCSCred, 0);
  objc_storeStrong((id *)&self->_metadataHash, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_iCloudPassword, 0);
  objc_storeStrong((id *)&self->_iCloudIdentityData, 0);
  objc_storeStrong((id *)&self->_iCloudEnv, 0);
  objc_storeStrong((id *)&self->_fmipUUID, 0);
  objc_storeStrong((id *)&self->_escrowProxyURL, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_duplicateEncodedMetadata, 0);
  objc_storeStrong((id *)&self->_encodedMetadata, 0);
  objc_storeStrong((id *)&self->_emcsDict, 0);
  objc_storeStrong((id *)&self->_emcsCred, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryDialCode, 0);
  objc_storeStrong((id *)&self->_certData, 0);
  objc_storeStrong((id *)&self->_backOffDate, 0);
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

@end