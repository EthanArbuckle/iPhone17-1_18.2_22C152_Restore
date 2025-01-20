@interface AKPiggybackingRequestProvider
- (AKPiggybackingRequestProvider)initWithCircleContext:(id)a3;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (id)authKitBody;
@end

@implementation AKPiggybackingRequestProvider

- (AKPiggybackingRequestProvider)initWithCircleContext:(id)a3
{
  id v5 = a3;
  v6 = [(AKURLRequestProviderImpl *)self initWithUrlBagKey:AKURLBagKeyCircle];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_circleContext, a3);
  }

  return v7;
}

- (id)authKitBody
{
  id v3 = [&__NSDictionary0__struct mutableCopy];
  v4 = [(AKCircleRequestContext *)self->_circleContext payload];
  id v5 = [v4 clientInfo];
  v6 = [v5 base64EncodedStringWithOptions:0];

  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:AKPakeDataKey];
  }
  else
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Missing client info for circle request", v36, 2u);
    }
  }
  v8 = [(AKCircleRequestContext *)self->_circleContext payload];
  v9 = [v8 presenceSID];

  if (v9)
  {
    v10 = [v9 UUIDString];
    v11 = [v10 lowercaseString];
    [v3 setObject:v11 forKeyedSubscript:AKPresenceSIDKey];
  }
  v12 = [(AKCircleRequestContext *)self->_circleContext payload];
  v13 = [v12 presenceCheckPassed];
  v14 = objc_msgSend(v13, "ak_BOOLeanAsInteger");
  [v3 setObject:v14 forKeyedSubscript:AKPresenceApprovedKey];

  v15 = [(AKCircleRequestContext *)self->_circleContext payload];
  v16 = [v15 localPresenceFound];
  v17 = objc_msgSend(v16, "ak_BOOLeanAsInteger");
  [v3 setObject:v17 forKeyedSubscript:AKPresenceFoundKey];

  v18 = [(AKCircleRequestContext *)self->_circleContext pushToken];

  if (v18)
  {
    v19 = [(AKCircleRequestContext *)self->_circleContext pushToken];
    [v3 setObject:v19 forKeyedSubscript:@"ptkn"];
  }
  else
  {
    v19 = _AKLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10017B068(v19);
    }
  }

  v20 = [(AKCircleRequestContext *)self->_circleContext payload];
  v21 = [v20 serverInfo];

  if (v21) {
    [v3 setObject:v21 forKeyedSubscript:AKIdmsDataKey];
  }
  v22 = [(AKCircleRequestContext *)self->_circleContext payload];
  v23 = [v22 transactionId];

  if (v23)
  {
    v24 = [(AKCircleRequestContext *)self->_circleContext payload];
    v25 = [v24 transactionId];
    [v3 setObject:v25 forKeyedSubscript:AKTransactionId];
  }
  v26 = [(AKCircleRequestContext *)self->_circleContext payload];
  id v27 = [v26 clientErrorCode];

  if (v27)
  {
    v28 = [(AKCircleRequestContext *)self->_circleContext payload];
    v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v28 clientErrorCode]);
    [v3 setObject:v29 forKeyedSubscript:AKErrorStatusCodeKey];
  }
  v30 = [(AKCircleRequestContext *)self->_circleContext payload];
  v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 circleStep]);
  [v3 setObject:v31 forKeyedSubscript:AKCircleStepKey];

  v32 = [(AKCircleRequestContext *)self->_circleContext payload];
  v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 piggybackingContext]);
  [v3 setObject:v33 forKeyedSubscript:AKPiggybackingContextKey];

  id v34 = [v3 copy];

  return v34;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)AKAppleIDServerResourceLoadDelegate);
  v7 = [(AKCircleRequestContext *)self->_circleContext payload];
  v8 = [v7 altDSID];
  v9 = [(AKCircleRequestContext *)self->_circleContext identityTokenValue];
  id v10 = [v6 initWithAltDSID:v8 identityToken:v9];

  [v10 setBagUrlKey:AKURLBagKeyCircle];
  v11 = [(AKCircleRequestContext *)self->_circleContext heartbeatTokenValue];

  if (v11)
  {
    v12 = [(AKCircleRequestContext *)self->_circleContext heartbeatTokenValue];
    [v10 setHeartbeatToken:v12];

    v13 = +[NSXPCConnection currentConnection];
    if (v13)
    {
      v14 = [[AKClient alloc] initWithConnection:v13];
      v15 = [(AKClient *)v14 name];
      [v10 setClientAppName:v15];

      v16 = [(AKClient *)v14 bundleID];
      [v10 setClientBundleID:v16];
    }
  }
  v17 = +[AKAccountManager sharedInstance];
  v18 = [(AKCircleRequestContext *)self->_circleContext payload];
  v19 = [v18 altDSID];
  v20 = [v17 authKitAccountWithAltDSID:v19 error:0];

  v21 = +[AKAccountManager sharedInstance];
  LODWORD(v18) = [v21 accountAccessTelemetryOptInForAccount:v20];

  if (v18)
  {
    v22 = [(AKCircleRequestContext *)self->_circleContext authContext];
    v23 = [v22 telemetryFlowID];
    [v10 setTelemetryFlowID:v23];

    v24 = [(AKCircleRequestContext *)self->_circleContext authContext];
    v25 = [v24 telemetryDeviceSessionID];
    [v10 setTelemetryDeviceSessionID:v25];
  }
  [v10 decorateWithCircleRequestContext:self->_circleContext];
  [v10 signRequestWithCommonHeaders:v5];

  return 1;
}

- (void).cxx_destruct
{
}

@end