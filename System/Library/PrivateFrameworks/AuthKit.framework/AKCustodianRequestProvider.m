@interface AKCustodianRequestProvider
- (AKCustodianContext)custodianContext;
- (AKCustodianRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (BOOL)authenticatedRequest;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)signWithIdentityToken;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (id)_bodyForAddAndRevokeCustodianRequest;
- (id)_bodyForCustodianUpdateRecoveryKeyRequest;
- (id)_bodyForEmbargoEndFeedback;
- (id)_bodyForFinalizeCustodianRequest;
- (id)_bodyForRecoveryCircle;
- (id)_bodyForTrustedContactsDataSync;
- (id)authKitBody;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
- (void)setAuthenticatedRequest:(BOOL)a3;
- (void)setCustodianContext:(id)a3;
- (void)setSignWithIdentityToken:(BOOL)a3;
@end

@implementation AKCustodianRequestProvider

- (AKCustodianRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKCustodianRequestProvider;
  v8 = [(AKURLRequestProviderImpl *)&v11 initWithContext:v7 urlBagKey:a4 shouldCacheResource:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_custodianContext, a3);
  }

  return v9;
}

- (unint64_t)expectedResponseType
{
  return 1;
}

- (unint64_t)requestBodyType
{
  return 1;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [AKDServerUIController alloc];
  v8 = [(AKURLRequestProviderImpl *)self client];
  v9 = [(AKDServerUIController *)v7 initWithClient:v8];

  id v10 = objc_alloc((Class)AKAppleIDAuthenticationContext);
  objc_super v11 = [(AKCustodianRequestProvider *)self custodianContext];
  id v12 = [v10 initWithAuthenticatedServerRequestContext:v11];

  objc_msgSend(v12, "set_shouldSendIdentityTokenForRemoteUI:", -[AKCustodianRequestProvider signWithIdentityToken](self, "signWithIdentityToken"));
  objc_msgSend(v12, "set_shouldSendGrandSlamTokensForRemoteUI:", 1);
  v13 = [(AKDServerUIController *)v9 resourceLoadDelegateWithContext:v12];
  v14 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v13 setInitialURLRequestKey:v14];

  v15 = [(AKURLRequestProviderImpl *)self urlBagKey];
  [v13 setBagUrlKey:v15];

  v16 = [(AKURLRequestProviderImpl *)self dataCenterIdentifier];
  [v13 setDataCenterIdentifier:v16];

  v17 = [(AKCustodianRequestProvider *)self custodianContext];
  objc_msgSend(v13, "setCliMode:", objc_msgSend(v17, "cliMode"));

  if (![(AKCustodianRequestProvider *)self authenticatedRequest])
  {
    [v13 signRequestWithBasicHeaders:v6];
    goto LABEL_9;
  }
  v18 = [(AKCustodianRequestProvider *)self custodianContext];
  v19 = [v18 custodianSetupToken];
  [v13 setServiceToken:v19];

  v20 = [(AKCustodianRequestProvider *)self custodianContext];
  v21 = [v20 custodianRecoveryToken];
  [v13 setCustodianRecoveryToken:v21];

  v22 = [(AKCustodianRequestProvider *)self custodianContext];
  LODWORD(v21) = [v22 isCustodianSyncAction];

  if (v21)
  {
    v23 = _AKLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100180164();
    }

    objc_msgSend(v6, "ak_addCustodianSyncActionHeader");
  }
  v24 = [v13 heartbeatToken];

  if (v24)
  {
    [v13 signRequestWithCommonHeaders:v6];
LABEL_9:
    BOOL v25 = 1;
    goto LABEL_10;
  }
  v27 = _AKLogSystem();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_1001800C4(self);
  }

  if (a4)
  {
    +[NSError ak_errorWithCode:-7042];
    BOOL v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_10:

  return v25;
}

- (id)authKitBody
{
  v3 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if (v3 == (void *)AKURLBagKeyCustodianRecoveryCircle) {
    goto LABEL_9;
  }
  v4 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if (v4 == (void *)AKURLBagKeyCustodianPostCircle)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v5 = [(AKURLRequestProviderImpl *)self urlBagKey];
  id v6 = v5;
  if (v5 == (void *)AKURLBagKeyCustodianRecoveryWrappingKey)
  {

    goto LABEL_8;
  }
  id v7 = [(AKURLRequestProviderImpl *)self urlBagKey];
  v8 = (void *)AKURLBagKeyCustodianRecoveryRequest;

  if (v7 == v8)
  {
LABEL_10:
    id v10 = [(AKCustodianRequestProvider *)self _bodyForRecoveryCircle];
    goto LABEL_11;
  }
  v9 = [(AKURLRequestProviderImpl *)self urlBagKey];
  if ([v9 isEqualToString:AKURLBagKeyCustodianInitiation])
  {

LABEL_15:
    id v10 = [(AKCustodianRequestProvider *)self _bodyForAddAndRevokeCustodianRequest];
    goto LABEL_11;
  }
  id v12 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned int v13 = [v12 isEqualToString:AKURLBagKeyCustodianDeletion];

  if (v13) {
    goto LABEL_15;
  }
  v14 = [(AKURLRequestProviderImpl *)self urlBagKey];
  unsigned int v15 = [v14 isEqualToString:AKURLBagKeyCustodianApproval];

  if (v15)
  {
    id v10 = [(AKCustodianRequestProvider *)self _bodyForFinalizeCustodianRequest];
  }
  else
  {
    v16 = [(AKURLRequestProviderImpl *)self urlBagKey];
    unsigned int v17 = [v16 isEqualToString:AKURLBagKeyCustodianUpdateRecoveryKey];

    if (v17)
    {
      id v10 = [(AKCustodianRequestProvider *)self _bodyForCustodianUpdateRecoveryKeyRequest];
    }
    else
    {
      v18 = [(AKURLRequestProviderImpl *)self urlBagKey];
      unsigned int v19 = [v18 isEqualToString:AKURLBagKeyCustodianRecoveryFeedback];

      if (v19)
      {
        id v10 = [(AKCustodianRequestProvider *)self _bodyForEmbargoEndFeedback];
      }
      else
      {
        v20 = [(AKURLRequestProviderImpl *)self urlBagKey];
        unsigned int v21 = [v20 isEqualToString:AKURLBagKeyTrustedContactsDataSync];

        if (v21)
        {
          id v10 = [(AKCustodianRequestProvider *)self _bodyForTrustedContactsDataSync];
        }
        else
        {
          id v10 = 0;
        }
      }
    }
  }
LABEL_11:

  return v10;
}

- (id)_bodyForRecoveryCircle
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 pushToken];

  if (v5)
  {
    id v6 = [(AKCustodianRequestProvider *)self custodianContext];
    id v7 = [v6 pushToken];
    [v3 setObject:v7 forKeyedSubscript:@"ptkn"];
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10018021C();
    }
  }

  v8 = [(AKCustodianRequestProvider *)self custodianContext];
  v9 = [v8 recoverySessionID];

  if (v9)
  {
    id v10 = [(AKCustodianRequestProvider *)self custodianContext];
    objc_super v11 = [v10 recoverySessionID];
    [v3 setObject:v11 forKeyedSubscript:@"recoverySessionId"];
  }
  else
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v59 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There was no custodian recovery session ID. This should only happen on Start CLI", v59, 2u);
    }
  }

  id v12 = [(AKCustodianRequestProvider *)self custodianContext];
  unsigned int v13 = [v12 recoveryStep];

  if (v13)
  {
    v14 = [(AKCustodianRequestProvider *)self custodianContext];
    unsigned int v15 = [v14 recoveryStep];
    [v3 setObject:v15 forKeyedSubscript:@"nextStep"];
  }
  v16 = [(AKCustodianRequestProvider *)self custodianContext];
  unsigned int v17 = [v16 recoverySessionID];

  if (v17)
  {
    v18 = [(AKCustodianRequestProvider *)self custodianContext];
    unsigned int v19 = [v18 recoverySessionID];
    [v3 setObject:v19 forKeyedSubscript:@"recoverySessionId"];
  }
  v20 = [(AKCustodianRequestProvider *)self custodianContext];
  unsigned int v21 = [v20 ownerAppleID];

  if (v21)
  {
    v22 = [(AKCustodianRequestProvider *)self custodianContext];
    v23 = [v22 ownerAppleID];
    [v3 setObject:v23 forKeyedSubscript:@"ownerAppleId"];
  }
  v24 = [(AKCustodianRequestProvider *)self custodianContext];
  BOOL v25 = [v24 ownerCustodianAltDSID];

  if (v25)
  {
    v26 = [(AKCustodianRequestProvider *)self custodianContext];
    v27 = [v26 ownerCustodianAltDSID];
    [v3 setObject:v27 forKeyedSubscript:@"ownerCustodianAltDSID"];
  }
  v28 = [(AKCustodianRequestProvider *)self custodianContext];
  v29 = [v28 custodianUUID];

  if (v29)
  {
    v30 = [(AKCustodianRequestProvider *)self custodianContext];
    v31 = [v30 custodianUUID];
    v32 = [v31 UUIDString];
    [v3 setObject:v32 forKeyedSubscript:@"custodianUUID"];
  }
  v33 = [(AKCustodianRequestProvider *)self custodianContext];
  v34 = [v33 idmsData];

  if (v34)
  {
    v35 = [(AKCustodianRequestProvider *)self custodianContext];
    v36 = [v35 idmsData];
    v37 = [v36 base64EncodedStringWithOptions:0];

    [v3 setObject:v37 forKeyedSubscript:@"idmsdata"];
  }
  v38 = [(AKCustodianRequestProvider *)self custodianContext];
  v39 = [v38 aaData];

  if (v39)
  {
    v40 = [(AKCustodianRequestProvider *)self custodianContext];
    v41 = [v40 aaData];
    v42 = [v41 base64EncodedStringWithOptions:0];

    [v3 setObject:v42 forKeyedSubscript:@"aadata"];
  }
  v43 = [(AKCustodianRequestProvider *)self custodianContext];
  v44 = [v43 encryptedPRKC];

  if (v44)
  {
    v45 = [(AKCustodianRequestProvider *)self custodianContext];
    v46 = [v45 encryptedPRKC];
    v47 = [v46 base64EncodedStringWithOptions:0];

    [v3 setObject:v47 forKeyedSubscript:@"encryptedPRKC"];
  }
  v48 = [(AKCustodianRequestProvider *)self custodianContext];
  id v49 = [v48 clientErrorCode];

  if (v49)
  {
    v50 = [(AKCustodianRequestProvider *)self custodianContext];
    v51 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v50 clientErrorCode]);
    [v3 setObject:v51 forKeyedSubscript:@"ec"];
  }
  v52 = [(AKCustodianRequestProvider *)self custodianContext];
  v53 = [v52 recordBuildVersion];

  if (v53)
  {
    v54 = [(AKCustodianRequestProvider *)self custodianContext];
    v55 = [v54 recordBuildVersion];
    [v3 setObject:v55 forKeyedSubscript:@"recordBuildVersion"];
  }
  v56 = _AKLogSystem();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    sub_1001801A4((uint64_t)v3, v56);
  }

  id v57 = [v3 copy];

  return v57;
}

- (id)_bodyForAddAndRevokeCustodianRequest
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 custodianUUID];

  if (v5)
  {
    id v6 = [(AKCustodianRequestProvider *)self custodianContext];
    id v7 = [v6 custodianUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKeyedSubscript:@"custodianUUID"];
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100180250();
    }
  }

  id v9 = [v3 copy];

  return v9;
}

- (id)_bodyForFinalizeCustodianRequest
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 custodianUUID];

  if (v5)
  {
    id v6 = [(AKCustodianRequestProvider *)self custodianContext];
    id v7 = [v6 custodianUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKeyedSubscript:@"custodianUUID"];
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100180284();
    }
  }

  id v9 = [(AKCustodianRequestProvider *)self custodianContext];
  id v10 = [v9 wrappingKeyRKC];

  if (v10)
  {
    objc_super v11 = [(AKCustodianRequestProvider *)self custodianContext];
    id v12 = [v11 wrappingKeyRKC];
    unsigned int v13 = [v12 base64EncodedStringWithOptions:0];

    [v3 setObject:v13 forKeyedSubscript:@"wrappingKeyRKC"];
  }
  id v14 = [v3 copy];

  return v14;
}

- (id)_bodyForCustodianUpdateRecoveryKeyRequest
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 custodianUUID];

  if (v5)
  {
    id v6 = [(AKCustodianRequestProvider *)self custodianContext];
    id v7 = [v6 custodianUUID];
    v8 = [v7 UUIDString];
    [v3 setObject:v8 forKeyedSubscript:@"custodianUUID"];
  }
  else
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001802EC();
    }
  }

  id v9 = [(AKCustodianRequestProvider *)self custodianContext];
  id v10 = [v9 wrappingKeyRKC];

  if (v10)
  {
    objc_super v11 = [(AKCustodianRequestProvider *)self custodianContext];
    id v12 = [v11 wrappingKeyRKC];
    unsigned int v13 = [v12 base64EncodedStringWithOptions:0];

    [v3 setObject:v13 forKeyedSubscript:@"wrappingKeyRKC"];
  }
  else
  {
    unsigned int v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001802B8();
    }
  }

  id v14 = [v3 copy];

  return v14;
}

- (id)_bodyForEmbargoEndFeedback
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 transactionID];

  if (v5)
  {
    id v6 = [(AKCustodianRequestProvider *)self custodianContext];
    id v7 = [v6 transactionID];
    [v3 setObject:v7 forKeyedSubscript:@"txnid"];
  }
  v8 = [(AKCustodianRequestProvider *)self custodianContext];
  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 notificationAction]);
  [v3 setObject:v9 forKeyedSubscript:@"action"];

  id v10 = [(AKCustodianRequestProvider *)self custodianContext];
  objc_super v11 = [v10 recoverySessionID];

  if (v11)
  {
    id v12 = [(AKCustodianRequestProvider *)self custodianContext];
    unsigned int v13 = [v12 recoverySessionID];
    [v3 setObject:v13 forKeyedSubscript:@"recoverySessionId"];
  }
  else
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100180354();
    }
  }

  id v14 = [(AKCustodianRequestProvider *)self custodianContext];
  unsigned int v15 = [v14 altDSID];

  if (v15)
  {
    v16 = [(AKCustodianRequestProvider *)self custodianContext];
    unsigned int v17 = [v16 altDSID];
    [v3 setObject:v17 forKeyedSubscript:@"recoveryAlternateDsId"];
  }
  else
  {
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100180320();
    }
  }

  id v18 = [v3 copy];

  return v18;
}

- (id)_bodyForTrustedContactsDataSync
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AKCustodianRequestProvider *)self custodianContext];
  v5 = [v4 custodianContacts];
  id v6 = objc_msgSend(v5, "aaf_map:", &stru_100227F00);
  [v3 setObject:v6 forKeyedSubscript:@"custodianUUIDs"];

  id v7 = [(AKCustodianRequestProvider *)self custodianContext];
  v8 = [v7 beneficiaryContacts];
  id v9 = objc_msgSend(v8, "aaf_map:", &stru_100227F00);
  [v3 setObject:v9 forKeyedSubscript:@"beneficiaryUUIDs"];

  id v10 = [(AKCustodianRequestProvider *)self custodianContext];
  objc_super v11 = [v10 lastDataSyncTimestamp];

  if (v11)
  {
    id v12 = [(AKCustodianRequestProvider *)self custodianContext];
    unsigned int v13 = [v12 lastDataSyncTimestamp];
    [v13 timeIntervalSince1970];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"timestampOnCK"];
  }
  else
  {
    unsigned int v15 = _AKLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100180388(self);
    }
  }
  id v16 = [v3 copy];

  return v16;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKCustodianRequestProvider;
  if ([(AKURLRequestProviderImpl *)&v17 validateResponseData:v6 error:a4])
  {
    id v7 = +[AAFSerialization dictionaryFromObject:v6 ofType:@"application/json"];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = AKErrorStatusCodeKey;
      id v10 = [v7 objectForKeyedSubscript:AKErrorStatusCodeKey];
      objc_super v11 = v10;
      if (v10 && [v10 integerValue])
      {
        id v12 = _AKLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10017D588(v11, v12);
        }

        v18[0] = NSLocalizedDescriptionKey;
        unsigned int v13 = [v8 objectForKeyedSubscript:AKErrorMessageKey];
        v18[1] = v9;
        v19[0] = v13;
        v19[1] = v11;
        id v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

        *a4 = +[NSError ak_errorWithCode:-7010 userInfo:v14];

        BOOL v15 = 0;
      }
      else
      {
        BOOL v15 = 1;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)authenticatedRequest
{
  return self->_authenticatedRequest;
}

- (void)setAuthenticatedRequest:(BOOL)a3
{
  self->_authenticatedRequest = a3;
}

- (BOOL)signWithIdentityToken
{
  return self->_signWithIdentityToken;
}

- (void)setSignWithIdentityToken:(BOOL)a3
{
  self->_signWithIdentityToken = a3;
}

- (AKCustodianContext)custodianContext
{
  return self->_custodianContext;
}

- (void)setCustodianContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end