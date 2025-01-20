@interface IDSTransparentEndpointViewer
- (id)_cloudKitContainer;
- (id)_keyTransparencyEntriesForEndpoints:(id)a3;
- (id)_peerIDManager;
- (id)_registrationKeyManager;
- (id)_verifier;
- (void)internal_fetchCurrentDeviceKVSKey:(id)a3;
- (void)internal_fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)internal_fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7;
- (void)internal_fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3;
- (void)internal_kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6;
- (void)internal_nukeTransparencyState:(id)a3;
- (void)internal_removeAllKVSTrustedDevices:(id)a3;
- (void)internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3;
- (void)internal_updateCurrentDeviceInKVS:(id)a3;
@end

@implementation IDSTransparentEndpointViewer

- (id)_verifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance];
}

- (id)_cloudKitContainer
{
  v2 = [(IDSTransparentEndpointViewer *)self _verifier];
  v3 = [v2 keyTransparencyStore];

  return v3;
}

- (id)_registrationKeyManager
{
  return +[IDSRegistrationKeyManager sharedInstance];
}

- (id)_peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (id)_keyTransparencyEntriesForEndpoints:(id)a3
{
  return objc_msgSend(a3, "__imArrayByApplyingBlock:", &stru_10098C5F8);
}

- (void)internal_fetchEndpointCacheStateForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  v10 = (void (**)(id, void *, void *, void))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v19 = [[IDSPeerIDKey alloc] initWithService:v13 fromURI:v12 toURI:v11];

  v14 = [(IDSTransparentEndpointViewer *)self _peerIDManager];
  v15 = [v14 pleaseDontCopyCacheDictionaryRepresentation];
  v16 = [v15 objectForKeyedSubscript:v19];

  v17 = [v16 keyTransparencyContext];
  v18 = [v16 endpoints];
  v10[2](v10, v17, v18, 0);
}

- (void)internal_fetchTransparentEndpointsForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 verifyAgainstTrustCircle:(BOOL)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[IDSPeerIDKey alloc] initWithService:v14 fromURI:v13 toURI:v12];

  v16 = [(IDSTransparentEndpointViewer *)self _peerIDManager];
  v17 = [v16 pleaseDontCopyCacheDictionaryRepresentation];
  v18 = [v17 objectForKeyedSubscript:v15];

  v19 = [v18 keyTransparencyContext];
  v20 = [v19 ticket];

  v21 = [IDSKeyTransparencyIndex alloc];
  v22 = [v18 keyTransparencyContext];
  v23 = [v22 accountKey];
  v24 = [(IDSKeyTransparencyIndex *)v21 initWithServiceIdentifier:v14 accountKey:v23 URI:v12];

  v25 = [(IDSTransparentEndpointViewer *)self _verifier];
  v26 = [v25 currentPeerVerificationResultsForQueriedIndex:v24 ticket:v20];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1003ED230;
  v28[3] = &unk_100980C70;
  id v29 = v11;
  id v27 = v11;
  [v26 registerResultBlock:v28];
}

- (void)internal_kickVerificationForServiceIdentifier:(id)a3 localURI:(id)a4 remoteURI:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IDSDAccountController sharedInstance];
  v15 = +[IDSDServiceController sharedInstance];
  v16 = [v15 serviceWithIdentifier:v10];
  v17 = [v14 appleIDAccountOnService:v16];

  v26 = [[IDSPeerIDQueryContext alloc] initWithSending:0 refresh:1 messaging:0 resultExpected:0 preventNewQuery:0];
  v18 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Performing query for forced verification.", buf, 2u);
  }

  v19 = +[IDSPeerIDManager sharedInstance];
  id v34 = v12;
  v20 = +[NSArray arrayWithObjects:&v34 count:1];
  v21 = [v17 _registrationCert];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1003ED57C;
  v27[3] = &unk_10098C620;
  id v28 = v10;
  id v29 = v11;
  id v30 = v12;
  v31 = self;
  id v32 = v13;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  [v19 startQueryForURIs:v20 fromIdentity:v21 fromURI:v24 fromService:v25 context:v26 reason:@"KTKickVerification" completionBlock:v27];
}

- (void)internal_fetchVerifierKVSTrustedDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(IDSTransparentEndpointViewer *)self _verifier];
  v6 = [v5 forceSyncKVS];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003ED8A0;
  v8[3] = &unk_100982E78;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 registerResultBlock:v8];
}

- (void)internal_removeAllKVSTrustedDevices:(id)a3
{
  id v4 = a3;
  v5 = [(IDSTransparentEndpointViewer *)self _verifier];
  [v5 removeAllKVSEntries];

  v6 = [(IDSTransparentEndpointViewer *)self _verifier];
  id v7 = [v6 forceSyncKVS];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003EDA2C;
  v9[3] = &unk_100980C70;
  id v10 = v4;
  id v8 = v4;
  [v7 registerResultBlock:v9];
}

- (void)internal_fetchCurrentDeviceKVSKey:(id)a3
{
  id v4 = a3;
  v5 = [(IDSTransparentEndpointViewer *)self _verifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003EDB64;
  v7[3] = &unk_100981F10;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentDeviceKVSKey:v7];
}

- (void)internal_updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  v5 = [(IDSTransparentEndpointViewer *)self _verifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003EDD8C;
  v7[3] = &unk_100981F38;
  id v8 = v4;
  id v6 = v4;
  [v5 updateCurrentDeviceInKVS:v7];
}

- (void)internal_nukeTransparencyState:(id)a3
{
  id v4 = a3;
  v5 = [(IDSTransparentEndpointViewer *)self _verifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003EE02C;
  v7[3] = &unk_100981C88;
  id v8 = v4;
  id v6 = v4;
  [v5 nukeKeyTransparencyStateWithCompletion:v7];
}

- (void)internal_triggerKTCDPAccountStatusNotificationWithAccountStatus:(int64_t)a3
{
  id v5 = objc_alloc((Class)NSNotification);
  CFStringRef v10 = @"accountStatus";
  id v6 = +[NSNumber numberWithInteger:a3];
  id v11 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithName:@"TransparencyAccountStatusChanged" object:0 userInfo:v7];

  id v9 = [(IDSTransparentEndpointViewer *)self _verifier];
  [v9 _handleKTCDPStatusUpdate:v8];
}

@end