@interface IDSDXPCInternalTesting
- (BOOL)hasEntitlementForPushReplay;
- (IDSDXPCInternalTesting)initWithQueue:(id)a3 connection:(id)a4 offGridStateManager:(id)a5;
- (IDSDXPCOffGridStateManager)offGridStateManager;
- (IDSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_registeredIdentityTimestamps;
- (id)transparentEndpointViewer;
- (void)assertTransportThreadRealTimeMode:(BOOL)a3 completionHandler:(id)a4;
- (void)autoBugCaptureWithCompletion:(id)a3;
- (void)checkServerStorageForService:(id)a3 withCompletion:(id)a4;
- (void)clearAllSenderKeysWithCompletion:(id)a3;
- (void)clearCacheAndUpdatePeersForService:(id)a3;
- (void)clearCacheWithCompletion:(id)a3;
- (void)currentECVersionWithBlock:(id)a3;
- (void)deviceChangedForDeviceID:(id)a3 isNearby:(BOOL)a4 isConnected:(BOOL)a5 isCloudConnected:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchCurrentDeviceKVSKey:(id)a3;
- (void)fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)fetchPrivateClientDataDescriptionForService:(id)a3 completion:(id)a4;
- (void)fetchPrivateDeviceDataDescription:(id)a3;
- (void)fetchStewieStateWithCompletion:(id)a3;
- (void)fetchStoredUserDescriptions:(id)a3;
- (void)fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7;
- (void)fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3;
- (void)fetchXPCStateDescriptionForProcesses:(id)a3 withCompletion:(id)a4;
- (void)forceAccountRenewalOnService:(id)a3;
- (void)idsProtocolVersion:(id)a3;
- (void)kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)listDonatedHandlesWithCompletion:(id)a3;
- (void)listRegistrationHistoryWithBAADigests:(BOOL)a3 completion:(id)a4;
- (void)listSenderKeysForURIs:(id)a3 completion:(id)a4;
- (void)nukeTransparencyStateWithCompletion:(id)a3;
- (void)oneToOneECCQuicktestEncryptionWithData:(id)a3 completion:(id)a4;
- (void)popupPromptWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 defaultUrl:(id)a6 alternateButton:(id)a7 alternatrUrl:(id)a8 completion:(id)a9;
- (void)postNewDeviceNotification:(id)a3 iCloudSignIn:(BOOL)a4 iMessageSignIn:(BOOL)a5 facetimeSignIn:(BOOL)a6 forAppleID:(id)a7;
- (void)registeredIdentityTimestampsWithBlock:(id)a3;
- (void)removeAllKVSTrustedDevices:(id)a3;
- (void)removeConnectionWithConnectionName:(id)a3 completionHandler:(id)a4;
- (void)resetStewieStateWithCompletion:(id)a3;
- (void)sendFakePushFromFile:(id)a3 completion:(id)a4;
- (void)sendSenderKeyToURI:(id)a3 completion:(id)a4;
- (void)setECVersion:(unsigned int)a3 withCompletion:(id)a4;
- (void)setForceKeyRoll:(BOOL)a3 withCompletion:(id)a4;
- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5;
- (void)tapToRadarWithTitle:(id)a3 message:(id)a4 context:(id)a5 completion:(id)a6;
- (void)triggerAllFirewallNotificationsWithHandle:(id)a3 delay:(double)a4 service:(id)a5;
- (void)triggerAllTemporaryPhoneNotificationsWithHandle:(id)a3 delay:(double)a4;
- (void)triggerFirewallDBCleanupWithInterval:(double)a3;
- (void)triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3;
- (void)triggerKeyRollWithCompletion:(id)a3;
- (void)triggerRestrictedMessageCleanup;
- (void)updateCurrentDeviceInKVS:(id)a3;
@end

@implementation IDSDXPCInternalTesting

- (IDSDXPCInternalTesting)initWithQueue:(id)a3 connection:(id)a4 offGridStateManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (CUTIsInternalInstall())
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSDXPCInternalTesting;
    v12 = [(IDSDXPCInternalTesting *)&v16 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)oneToOneECCQuicktestEncryptionWithData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v78 = 0;
  v59 = (void (**)(id, __CFDictionary *, id))a4;
  v6 = +[IDSNGMFullDeviceIdentity identityWithAccess:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly usageIdentifier:@"com.apple.idstool" error:&v78];
  id v7 = v78;
  id v77 = v7;
  v8 = [v6 publicDeviceIdentityWithError:&v77];
  id v9 = v77;

  id v76 = v9;
  id v10 = +[IDSNGMFullDeviceIdentity identityWithAccess:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly usageIdentifier:@"com.apple.idstool" error:&v76];
  id v11 = v76;

  id v75 = v11;
  v12 = [v10 publicDeviceIdentityWithError:&v75];
  id v13 = v75;

  id v14 = v5;
  v15 = +[NSMutableDictionary dictionary];
  objc_super v16 = +[NSData data];
  v17 = +[NSData data];
  v18 = +[NSData data];
  id v74 = v15;
  v64 = v6;
  LOWORD(v48) = 0;
  v61 = v12;
  uint64_t v19 = objc_msgSend(v12, "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:", v14, v16, 0, &stru_10099BE78, &stru_10099BE78, v17, &stru_10099BE78, v18, v48, 0, v6, &v74);
  id v51 = v74;

  id v73 = v13;
  v62 = v10;
  v63 = v8;
  uint64_t v20 = [v10 unsealMessage:v19 signedByPublicIdentity:v8 error:&v73];
  id v21 = v73;

  v22 = +[IDSFoundationLog utilities];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v80 = v14;
    __int16 v81 = 2112;
    uint64_t v82 = v19;
    __int16 v83 = 2112;
    uint64_t v84 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "plain: %@, encrypted: %@, decrypted: %@", buf, 0x20u);
  }
  value = (void *)v19;
  v60 = (void *)v20;

  id v72 = v21;
  uint64_t v23 = [v6 dataRepresentationWithError:&v72];
  id v24 = v72;

  uint64_t v25 = [v8 identityData];
  uint64_t v26 = [v8 prekeyData];
  id v71 = v24;
  uint64_t v27 = [v10 dataRepresentationWithError:&v71];
  id v28 = v71;

  uint64_t v29 = [v61 identityData];
  v30 = [v61 prekeyData];
  id v70 = v28;
  v58 = (void *)v23;
  v31 = +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:v23 error:&v70];
  id v32 = v70;

  id v69 = v32;
  v56 = (void *)v26;
  v57 = (void *)v25;
  +[IDSNGMPublicDeviceIdentity identityWithIdentityData:v25 prekeyData:v26 error:&v69];
  v33 = v52 = v14;
  id v34 = v69;

  id v68 = v34;
  v55 = (void *)v27;
  v35 = +[IDSNGMFullDeviceIdentity identityWithDataRepresentation:v27 error:&v68];
  id v36 = v68;

  id v67 = v36;
  v54 = (void *)v29;
  v37 = +[IDSNGMPublicDeviceIdentity identityWithIdentityData:v29 prekeyData:v30 error:&v67];
  id v38 = v67;

  v39 = +[NSData data];
  v40 = +[NSData data];
  v41 = +[NSData data];
  id v66 = v51;
  LOWORD(v49) = 0;
  v42 = objc_msgSend(v37, "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:", v52, v39, 0, &stru_10099BE78, &stru_10099BE78, v40, &stru_10099BE78, v41, v49, 0, v31, &v66);
  id v50 = v66;

  id v65 = v38;
  v43 = [v35 unsealMessage:v42 signedByPublicIdentity:v33 error:&v65];
  id v44 = v65;

  v45 = +[IDSFoundationLog utilities];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v80 = v52;
    __int16 v81 = 2112;
    uint64_t v82 = (uint64_t)v42;
    __int16 v83 = 2112;
    uint64_t v84 = (uint64_t)v43;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "plain: %@, encryptedAgain: %@, decryptedAgain: %@", buf, 0x20u);
  }

  v46 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v47 = v46;
  if (v52) {
    CFDictionarySetValue(v46, @"plain", v52);
  }
  if (value) {
    CFDictionarySetValue(v47, @"encrypted", value);
  }
  if (v60) {
    CFDictionarySetValue(v47, @"decrypted", v60);
  }
  if (v42) {
    CFDictionarySetValue(v47, @"encryptedAgain", v42);
  }
  if (v43) {
    CFDictionarySetValue(v47, @"decryptedAgain", v43);
  }
  v59[2](v59, v47, v44);
}

- (void)clearCacheWithCompletion:(id)a3
{
  v3 = (void (**)(void))a3;
  v4 = +[IDSFoundationLog utilities];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Asked by idstool to clear caches!", v6, 2u);
  }

  pid_t v5 = getpid();
  kill(v5, 30);
  v3[2](v3);
}

- (void)registeredIdentityTimestampsWithBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(IDSDXPCInternalTesting *)self _registeredIdentityTimestamps];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)triggerKeyRollWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSRegistrationKeyManager sharedInstance];
  unsigned __int8 v6 = [v5 forceRoll];

  id v7 = +[IDSRegistrationKeyManager sharedInstance];
  [v7 setForceRoll:1];

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1000ED1EC;
  v31 = sub_1000ED1FC;
  id v32 = 0;
  v8 = +[IDSDRegistrationListener sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000ED204;
  v23[3] = &unk_100981E30;
  id v9 = v4;
  v23[4] = self;
  id v24 = v9;
  uint64_t v25 = &v27;
  unsigned __int8 v26 = v6;
  uint64_t v10 = [v8 addBlockForRegistrationCompletion:v23];
  id v11 = (void *)v28[5];
  v28[5] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = +[IDSDAccountController sharedInstance];
  id v13 = +[IDSDServiceController sharedInstance];
  id v14 = [v13 serviceWithIdentifier:@"com.apple.madrid"];
  v15 = [v12 accountsOnService:v14];

  id v16 = [v15 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v18) registerAccount];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v15 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(&v27, 8);
}

- (void)setForceKeyRoll:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  unsigned __int8 v6 = (void (**)(void))a4;
  id v5 = +[IDSRegistrationKeyManager sharedInstance];
  [v5 setForceRoll:v4];

  v6[2]();
}

- (void)currentECVersionWithBlock:(id)a3
{
  id v4 = a3;
  id v6 = +[IDSRegistrationKeyManager sharedInstance];
  id v5 = [v6 identityDataSource];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 ngmVersion]);
}

- (void)setECVersion:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void (**)(void))a4;
  id v5 = +[NSNumber numberWithUnsignedInt:v4];
  IMSetAppValueForKey();

  v6[2]();
}

- (void)checkServerStorageForService:(id)a3 withCompletion:(id)a4
{
  id v7 = (void (**)(void))a4;
  id v5 = a3;
  id v6 = +[IDSServerStorageStateMachine sharedInstance];
  [v6 incomingStorageRequestForTopic:v5 primary:0 messageContext:0];

  v7[2]();
}

- (void)tapToRadarWithTitle:(id)a3 message:(id)a4 context:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = [objc_alloc((Class)IDSTapToRadarRequest) initWithTitle:v12 message:v11];

  id v13 = [objc_alloc((Class)IDSTapToRadarContext) initWithDictionary:v10];
  +[IDSTapToRadar launchWithRequest:v14 context:v13];
  v9[2](v9);
}

- (void)popupPromptWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 defaultUrl:(id)a6 alternateButton:(id)a7 alternatrUrl:(id)a8 completion:(id)a9
{
  v15 = (void (**)(void))a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [objc_alloc((Class)IDSPopupPrompt) initWithTitle:v21 promptMessage:v20];

  [v22 launchPromptWithButton:v19 defaultUrl:v18 alternateButton:v17 alternateUrl:v16];
  v15[2](v15);
}

- (void)autoBugCaptureWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000ED768;
  v4[3] = &unk_100981E58;
  id v5 = a3;
  id v3 = v5;
  +[IDSAutoBugCapture triggerCaptureWithEvent:0 context:@"IDSToolTrigger" completion:v4];
}

- (void)forceAccountRenewalOnService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[IDSDServiceController sharedInstance];
  id v5 = [v4 serviceWithPushTopic:v3];

  id v6 = +[IDSDAccountController sharedInstance];
  id v7 = [v6 appleIDAccountOnService:v5];

  v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 uniqueID];
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Told to force renew account %@ on service %@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = +[IDSAppleIDRegistrationCenter sharedInstance];
  id v11 = [v7 registration];
  [v10 authenticateRegistration:v11 forceRenewal:1 requireSilentAuth:0];
}

- (BOOL)hasEntitlementForPushReplay
{
  v2 = [(IDSXPCConnection *)self->_connection valueForEntitlement:@"com.apple.private.ids.allow-push-replay"];
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v2 BOOLValue] & 1) != 0)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = +[IDSFoundationLog utilities];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connection is missing entitlement for replaying pushes", v6, 2u);
    }

    BOOL v3 = 0;
  }

  return v3;
}

- (void)sendFakePushFromFile:(id)a3 completion:(id)a4
{
  id v48 = a3;
  id v6 = (void (**)(id, id))a4;
  if (CUTIsInternalInstall()
    && [(IDSDXPCInternalTesting *)self hasEntitlementForPushReplay])
  {
    v45 = v6;
    id v7 = objc_alloc_init(IDSDaemon);
    id v8 = [(IDSDaemon *)v7 pushHandlerForAPSDelegatePort];

    if (!v8) {
      id v8 = objc_alloc_init((Class)IDSPushHandler);
    }
    char v51 = 0;
    id v47 = objc_alloc_init((Class)NSMutableArray);
    [v47 addObject:@"File(s) executed:"];
    id v9 = +[NSFileManager defaultManager];
    [v9 fileExistsAtPath:v48 isDirectory:&v51];

    if (v51)
    {
      id v10 = +[NSFileManager defaultManager];
      id v11 = [v10 enumeratorAtPath:v48];

      uint64_t v12 = [v11 nextObject];
      if (v12)
      {
        id v13 = (void *)v12;
        id v44 = v8;
        id v46 = v11;
        do
        {
          if ([v13 hasSuffix:@".data"])
          {
            __int16 v14 = [v48 stringByAppendingPathComponent:v13];
            id v49 = 0;
            id v15 = +[NSData dataWithContentsOfFile:v14 options:0 error:&v49];
            id v16 = v49;
            if (v15)
            {
              id v17 = +[NSPropertyListSerialization propertyListWithData:v15 options:0 format:0 error:0];
              if (v17)
              {
                uint64_t v18 = objc_opt_class();
                uint64_t v19 = sub_1000EDEAC(v18, v17, @"t");
                if (v19)
                {
                  id v20 = (void *)v19;
                  uint64_t v21 = objc_opt_class();
                  id v22 = sub_1000EDEAC(v21, v17, @"p");

                  if (v22)
                  {
                    id v23 = objc_alloc((Class)APSIncomingMessage);
                    uint64_t v24 = objc_opt_class();
                    uint64_t v25 = sub_1000EDEAC(v24, v17, @"t");
                    uint64_t v26 = objc_opt_class();
                    uint64_t v27 = sub_1000EDEAC(v26, v17, @"p");
                    id v28 = [v23 initWithTopic:v25 userInfo:v27];

                    [v44 connection:0 didReceiveIncomingMessage:v28];
                    [v47 addObject:v14];
                  }
                  id v11 = v46;
                }
                else
                {
                  id v11 = v46;
                }
              }
            }
            else
            {
              id v17 = +[NSString stringWithFormat:@"%@ read error %@", v48, v16];
              [v47 addObject:v17];
            }
          }
          uint64_t v29 = [v11 nextObject];

          id v13 = (void *)v29;
        }
        while (v29);
        id v8 = v44;
        id v6 = v45;
      }
    }
    else
    {
      id v50 = 0;
      v30 = +[NSData dataWithContentsOfFile:v48 options:0 error:&v50];
      id v11 = v50;
      if (v30)
      {
        v31 = +[NSPropertyListSerialization propertyListWithData:v30 options:0 format:0 error:0];
        if (v31)
        {
          uint64_t v32 = objc_opt_class();
          uint64_t v33 = sub_1000EDEAC(v32, v31, @"t");
          if (v33)
          {
            id v34 = (void *)v33;
            id v35 = v11;
            uint64_t v36 = objc_opt_class();
            v37 = sub_1000EDEAC(v36, v31, @"p");

            if (v37)
            {
              id v38 = objc_alloc((Class)APSIncomingMessage);
              uint64_t v39 = objc_opt_class();
              v40 = sub_1000EDEAC(v39, v31, @"t");
              uint64_t v41 = objc_opt_class();
              v42 = sub_1000EDEAC(v41, v31, @"p");
              id v43 = [v38 initWithTopic:v40 userInfo:v42];

              [v8 connection:0 didReceiveIncomingMessage:v43];
              [v47 addObject:v48];
            }
            id v11 = v35;
          }
        }
      }
      else
      {
        v31 = +[NSString stringWithFormat:@"%@ read error %@", v48, v11];
        [v47 addObject:v31];
      }
    }
    v6[2](v6, v47);
  }
}

- (void)postNewDeviceNotification:(id)a3 iCloudSignIn:(BOOL)a4 iMessageSignIn:(BOOL)a5 facetimeSignIn:(BOOL)a6 forAppleID:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a7;
  id v16 = v11;
  if (v10)
  {
    __int16 v14 = +[IDSAppleIDNotificationCenter sharedInstance];
    [v14 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeMultiplex1];

    if (!v9)
    {
LABEL_3:
      if (!v8) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v9)
  {
    goto LABEL_3;
  }
  id v15 = +[IDSAppleIDNotificationCenter sharedInstance];
  [v15 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeiMessage];

  if (v8)
  {
LABEL_4:
    id v13 = +[IDSAppleIDNotificationCenter sharedInstance];
    [v13 addUsageNotificationForSession:@"Session Guid" appleID:v12 alias:@"foo2@apple.com" deviceName:@"Foo's New Device" hardwareVersion:v16 deviceCapabilities:0 serviceType:IDSRegistrationServiceTypeFaceTime];
  }
LABEL_5:
}

- (id)transparentEndpointViewer
{
  v2 = +[IDSDaemon sharedInstance];
  BOOL v3 = [v2 transparentEndpointViewer];

  return v3;
}

- (void)fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  __int16 v14 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EE230;
  v16[3] = &unk_100981EC0;
  id v17 = v10;
  id v15 = v10;
  objc_msgSend(v14, "internal_fetchEndpointCacheStateForServiceIdentifier:localURI:remoteURI:completion:", v13, v12, v11, v16);
}

- (void)fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000EE7C8;
  v18[3] = &unk_100981EE8;
  id v19 = v12;
  id v17 = v12;
  objc_msgSend(v16, "internal_fetchTransparentEndpointsForServiceIdentifier:localURI:remoteURI:verifyAgainstTrustCircle:completion:", v15, v14, v13, v7, v18);
}

- (void)kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EEAC4;
  v16[3] = &unk_100981C88;
  id v17 = v10;
  id v15 = v10;
  objc_msgSend(v14, "internal_kickVerificationForServiceIdentifier:localURI:remoteURI:completion:", v13, v12, v11, v16);
}

- (void)fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EEBD0;
  v7[3] = &unk_100981DC8;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_fetchVerifierKVSTrustedDevicesWithCompletion:", v7);
}

- (void)removeAllKVSTrustedDevices:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EEC8C;
  v7[3] = &unk_100980658;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_removeAllKVSTrustedDevices:", v7);
}

- (void)fetchCurrentDeviceKVSKey:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EED48;
  v7[3] = &unk_100981F10;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_fetchCurrentDeviceKVSKey:", v7);
}

- (void)updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EEE04;
  v7[3] = &unk_100981F38;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_updateCurrentDeviceInKVS:", v7);
}

- (void)triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3
{
  if ((unint64_t)a3 < 5)
  {
    id v6 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
    objc_msgSend(v6, "internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:", a3);
  }
  else
  {
    id v4 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inputed account status not valid, doing nothing. { accountStatus: %@ }", buf, 0xCu);
    }
  }
}

- (void)nukeTransparencyStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDXPCInternalTesting *)self transparentEndpointViewer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EEFE0;
  v7[3] = &unk_100981C88;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "internal_nukeTransparencyState:", v7);
}

- (void)fetchStoredUserDescriptions:(id)a3
{
  id v35 = (void (**)(id, id))a3;
  BOOL v3 = +[IDSDaemon sharedInstance];
  id v4 = [v3 registrationConductor];
  id v5 = [v4 userStore];

  id v6 = objc_alloc_init((Class)NSMutableString);
  [v6 appendString:@"Stored Users:\n"];
  [v6 appendString:@"   DS Realm:\n"];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  BOOL v7 = [v5 usersWithRealm:1];
  id v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v13 = [v5 propertiesForUser:v12];
        id v14 = [v12 description];
        [v6 appendFormat:@"      %@\n", v14];

        id v15 = [v13 description];
        [v6 appendFormat:@"         %@\n", v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v9);
  }

  [v6 appendString:@"   Phone Realm:\n"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v16 = [v5 usersWithRealm:0];
  id v17 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v41;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        id v22 = [v5 propertiesForUser:v21];
        id v23 = [v21 description];
        [v6 appendFormat:@"      %@\n", v23];

        uint64_t v24 = [v22 description];
        [v6 appendFormat:@"         %@\n", v24];
      }
      id v18 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v18);
  }

  [v6 appendString:@"   Transient Phone Realm:\n"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v25 = [v5 usersWithRealm:2];
  id v26 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v37;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v36 + 1) + 8 * (void)k);
        v31 = [v5 propertiesForUser:v30];
        uint64_t v32 = [v30 description];
        [v6 appendFormat:@"      %@\n", v32];

        uint64_t v33 = [v31 description];
        [v6 appendFormat:@"         %@\n", v33];
      }
      id v27 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v27);
  }

  id v34 = [v6 copy];
  v35[2](v35, v34);
}

- (void)fetchPrivateClientDataDescriptionForService:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[IDSRegistrationController sharedInstance];
  id v8 = [v7 activeRegistrationsToRegister];
  id v9 = [v8 _copyForEnumerating];

  uint64_t v10 = +[IDSRegistrationKeyManager sharedInstance];
  id v11 = +[IDSKeyTransparencyVerifier sharedInstance];
  id v12 = +[IDSClientDataGenerator clientDatasForRegistrations:v9 keyStore:v10 keyTransparencyVerifier:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EF5BC;
  v15[3] = &unk_100981F88;
  id v16 = v5;
  id v17 = v6;
  id v13 = v5;
  id v14 = v6;
  [v12 registerResultBlock:v15];
}

- (void)fetchPrivateDeviceDataDescription:(id)a3
{
  BOOL v3 = (void (**)(id, void *))a3;
  id v4 = +[IDSRegistrationCenter sharedInstance];
  id v6 = [v4 privateDeviceDataForKVSSuccess:0];

  id v5 = [v6 debugDescription];
  v3[2](v3, v5);
}

- (void)clearCacheAndUpdatePeersForService:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSKeyTransparencyVerifier sharedInstance];
  [v4 clearCacheAndUpdatePeersForService:v3];
}

- (void)removeConnectionWithConnectionName:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v6 = a3;
  BOOL v7 = +[IDSPairingManager sharedInstance];
  id v8 = [v7 pairedDeviceUniqueID];

  v11[0] = IDSOpenSocketOptionCBUUIDKey;
  v11[1] = IDSOpenSocketOptionDeviceUniqueIDKey;
  v11[2] = @"account";
  v11[3] = @"service";
  v12[2] = @"idstest";
  v12[3] = @"localdelivery";
  v12[0] = @"12345678-7654-DADA-DADA-DADADADADADA";
  v12[1] = v8;
  v11[4] = IDSOpenSocketOptionStreamNameKey;
  v12[4] = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  uint64_t v10 = +[IDSUTunController sharedInstance];

  [v10 closeSocketWithOptions:v9];
  v5[2](v5, 0);
}

- (void)deviceChangedForDeviceID:(id)a3 isNearby:(BOOL)a4 isConnected:(BOOL)a5 isCloudConnected:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v10 = a3;
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    int v26 = 138412546;
    CFStringRef v27 = v12;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received nearby change to %@ for device with uniqueID %@", (uint8_t *)&v26, 0x16u);
  }

  id v13 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  id v14 = v13;
  if (v9) {
    uint64_t v15 = kIDSDeviceStatePropertiesIsNearby;
  }
  else {
    uint64_t v15 = 0;
  }
  [v13 setState:v15 forProperty:kIDSDeviceStatePropertiesIsNearby deviceUniqueID:v10];

  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    int v26 = 138412546;
    CFStringRef v27 = v17;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received connected change to %@ for device with uniqueID %@", (uint8_t *)&v26, 0x16u);
  }

  id v18 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  uint64_t v19 = v18;
  if (v8) {
    uint64_t v20 = kIDSDeviceStatePropertiesIsConnected;
  }
  else {
    uint64_t v20 = 0;
  }
  [v18 setState:v20 forProperty:kIDSDeviceStatePropertiesIsConnected deviceUniqueID:v10];

  uint64_t v21 = +[IMRGLog registration];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    int v26 = 138412546;
    CFStringRef v27 = v22;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received cloud connected change to %@ for device with uniqueID %@", (uint8_t *)&v26, 0x16u);
  }

  id v23 = +[IDSDevicePropertiesStateNotifier sharedInstance];
  uint64_t v24 = v23;
  if (v7) {
    uint64_t v25 = kIDSDeviceStatePropertiesIsCloudConnected;
  }
  else {
    uint64_t v25 = 0;
  }
  [v23 setState:v25 forProperty:kIDSDeviceStatePropertiesIsCloudConnected deviceUniqueID:v10];
}

- (void)assertTransportThreadRealTimeMode:(BOOL)a3 completionHandler:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  IDSTransportThreadAddBlock();
  v4[2](v4, 0);
}

- (id)_registeredIdentityTimestamps
{
  v2 = +[IDSRegistrationKeyManager sharedInstance];
  id v3 = [v2 config];
  id v4 = [v3 registeredIdentityContainer];
  id v5 = [v4 ngmFullDeviceIdentity];
  id v6 = [v5 valueForKeyPath:@"devicePrekeys.publicPrekey.timestamp"];
  BOOL v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &stru_100981FC8);

  return v7;
}

- (void)triggerFirewallDBCleanupWithInterval:(double)a3
{
  id v4 = +[IDSFirewallStore sharedInstance];
  [v4 runCleanupWithExpirationInterval:a3];
}

- (void)triggerAllFirewallNotificationsWithHandle:(id)a3 delay:(double)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = +[IDSDServiceController sharedInstance];
  id v10 = v9;
  if (v8)
  {
    id v11 = [v9 serviceWithIdentifier:v8];

    if (v11)
    {
      id v29 = v11;
      CFStringRef v12 = +[NSArray arrayWithObjects:&v29 count:1];
    }
    else
    {
      CFStringRef v12 = 0;
    }
  }
  else
  {
    CFStringRef v12 = [v9 allServices];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    double v17 = 0.0;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v18), "isFirewallEnabled", v19, v20, v21, v22))
        {
          uint64_t v19 = _NSConcreteStackBlock;
          uint64_t v20 = 3221225472;
          uint64_t v21 = sub_1000F01BC;
          CFStringRef v22 = &unk_10097E440;
          id v23 = v7;
          im_dispatch_after_primary_queue();
          double v17 = v17 + a4;
        }
        id v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

- (void)triggerAllTemporaryPhoneNotificationsWithHandle:(id)a3 delay:(double)a4
{
  id v4 = a3;
  id v5 = [[IDSPhoneUser alloc] initWithLabelID:@"AAA" phoneBookNumber:v4];

  id v6 = [[IDSTemporaryPhoneUser alloc] initWithPhoneUser:v5];
  id v7 = [(IDSTemporaryPhoneUser *)v6 temporaryPhoneUserWithFinishedRegistration];

  id v10 = v7;
  im_dispatch_after_primary_queue();
  id v9 = v10;
  im_dispatch_after_primary_queue();
  id v8 = v9;
  im_dispatch_after_primary_queue();
}

- (void)triggerRestrictedMessageCleanup
{
  id v2 = +[IDSDaemon sharedInstance];
  [v2 _restrictedMessageCleanupTimerFired];
}

- (void)resetStewieStateWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = +[IDSDaemon sharedInstance];
  id v6 = [v4 registrationConductor];

  id v5 = [v6 stewieCoordinator];
  [v5 clearAllState];
  v3[2](v3);
}

- (void)fetchStewieStateWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = +[IDSDaemon sharedInstance];
  id v7 = [v4 registrationConductor];

  id v5 = [v7 stewieCoordinator];
  id v6 = [v5 fetchCurrentState];
  v3[2](v3, v6);
}

- (void)sendSenderKeyToURI:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IDSDAccountController sharedInstance];
  id v8 = +[IDSDServiceController sharedInstance];
  id v9 = [v8 serviceWithIdentifier:IDSServiceNameiMessage];
  id v10 = [v7 registeredAccountsOnService:v9];

  id v23 = v6;
  id v11 = +[NSArray arrayWithObjects:&v23 count:1];
  CFStringRef v12 = +[IDSQueryUtilities accountToQueryFrom:v10 fromURI:0 destinationURIs:v11 allowLocalAccount:0];

  id v13 = +[IDSDaemon sharedInstance];
  id v14 = [v13 senderKeyDistributionManager];

  id v22 = v6;
  id v15 = +[NSArray arrayWithObjects:&v22 count:1];
  uint64_t v16 = [v12 loginID];
  double v17 = +[IDSURI URIWithUnprefixedURI:v16];
  id v18 = +[IDSSenderKeySendContext idstool];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000F0820;
  v20[3] = &unk_100981FF0;
  id v21 = v5;
  id v19 = v5;
  [v14 generateAndSendKeyIfNeededToURIs:v15 fromURI:v17 context:v18 completion:v20];
}

- (void)listSenderKeysForURIs:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = +[IDSDaemon sharedInstance];
  id v9 = [v7 senderKeyDistributionManager];

  id v8 = [v9 formattedSenderKeyListFor:v6];

  v5[2](v5, v8);
}

- (void)clearAllSenderKeysWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSDaemon sharedInstance];
  id v5 = [v4 persistenceManager];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F09A4;
  v7[3] = &unk_100981FF0;
  id v8 = v3;
  id v6 = v3;
  [v5 deleteAllSenderKeysWithCompletion:v7];
}

- (void)listDonatedHandlesWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = +[IDSDaemon sharedInstance];
  id v6 = [v4 senderKeyDistributionManager];

  id v5 = [v6 formattedDonatedHandleList];
  v3[2](v3, v5);
}

- (void)setOffGridMode:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(IDSDXPCInternalTesting *)self offGridStateManager];
  [v10 setOffGridMode:a3 allowOnlineEnablement:1 options:v9 completion:v8];
}

- (void)listRegistrationHistoryWithBAADigests:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  id v6 = a4;
  id v8 = +[IDSRegistrationRequestTracker sharedInstance];
  id v7 = [v8 eventHistoryStringWithWantsBAADigests:v5];
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

- (void)idsProtocolVersion:(id)a3
{
  id v3 = (void (**)(id, id, id))a3;
  _IDSIDProtocolVersionNumber();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[IDSDAccountController sharedInstance];
  id v5 = [v4 forceReregValue];

  v3[2](v3, v6, v5);
}

- (void)fetchXPCStateDescriptionForProcesses:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = +[IDSDaemon sharedInstance];
  CFStringRef v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1000F0D0C;
  id v15 = &unk_100982018;
  id v16 = v5;
  id v17 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 _iterateOverConnectedListeners:&v12];

  id v11 = objc_msgSend(v9, "componentsJoinedByString:", @"\n", v12, v13, v14, v15);
  v6[2](v6, v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (IDSDXPCOffGridStateManager)offGridStateManager
{
  return self->_offGridStateManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offGridStateManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end