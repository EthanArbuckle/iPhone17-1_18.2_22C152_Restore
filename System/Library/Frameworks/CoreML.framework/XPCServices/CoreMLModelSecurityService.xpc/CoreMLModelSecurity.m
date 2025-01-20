@interface CoreMLModelSecurity
+ (id)codeSigningIdentifierFor:(id *)a3 processIdentifier:(int)a4;
+ (id)codeSigningIdentifierFromXPCConnection;
+ (id)teamIdentifierFor:(id *)a3 processIdentifier:(int)a4;
+ (id)teamIdentifierFromXPCConnection;
- (CoreMLModelSecurity)init;
- (CoreMLModelSecurityServiceToClientProtocol)clientProxy;
- (MLFairPlayDecryptSessionManager)decryptSessionManager;
- (MLModel)decryptedModel;
- (OS_os_transaction)txn;
- (void)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 completionBlock:(id)a5;
- (void)dealloc;
- (void)extractTeamIdentifierWithReply:(id)a3;
- (void)secureModelMLDictionaryFeatureProvider:(id)a3 withReply:(id)a4;
- (void)secureModelMLFeatureDescription:(id)a3 withReply:(id)a4;
- (void)secureModelMLFeatureValue:(id)a3 withReply:(id)a4;
- (void)secureModelMLModelDescription:(id)a3 withReply:(id)a4;
- (void)secureModelWithContentsOfURL:(id)a3 sandboxExtensionToken:(id)a4 configuration:(id)a5 decryptCredential:(id)a6 withReply:(id)a7;
- (void)secureParameterValueForKey:(id)a3 withReply:(id)a4;
- (void)securePredictionFromLazyBatch:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)securePredictionFromLazyFeatures:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)setClientProxy:(id)a3;
- (void)setDecryptSessionManager:(id)a3;
- (void)setDecryptedModel:(id)a3;
- (void)setTxn:(id)a3;
- (void)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 usesCodeSigningIdentityForEncryption:(BOOL)a5 completionBlock:(id)a6;
- (void)stopDecryptionOfModelAtPath:(id)a3 completionBlock:(id)a4;
@end

@implementation CoreMLModelSecurity

- (void)secureModelWithContentsOfURL:(id)a3 sandboxExtensionToken:(id)a4 configuration:(id)a5 decryptCredential:(id)a6 withReply:(id)a7
{
  id v28 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, id))a7;
  id v15 = v11;
  [v15 UTF8String];
  uint64_t v16 = sandbox_extension_consume();
  if (v16 < 0)
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = *__error();
      *(_DWORD *)buf = 138412546;
      id v31 = v15;
      __int16 v32 = 1024;
      LODWORD(v33) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Sandbox extension(%@) consume failed (%d)", buf, 0x12u);
    }
  }
  else
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10000B1E4((uint64_t)v15, v17);
    }
  }

  id v29 = 0;
  v19 = +[MLModel modelWithContentsOfURL:v28 configuration:v12 error:&v29];
  id v20 = v29;
  [(CoreMLModelSecurity *)self setDecryptedModel:v19];
  if (!v19 || v20)
  {
    v25 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v28;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error loading model from %@ (%@): %@", buf, 0x20u);
    }

    v13[2](v13, 0, v20);
  }
  else
  {
    id v21 = objc_alloc((Class)MLSecureModel);
    v22 = [v19 modelDescription];
    v23 = [v19 configuration];
    id v24 = [v21 initWithDescription:v22 configuration:v23];

    ((void (**)(id, id, id))v13)[2](v13, v24, 0);
  }
  if ((v16 & 0x8000000000000000) == 0 && sandbox_extension_release() == -1)
  {
    v26 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      sub_10000B194((uint64_t)v15, v27, (uint64_t)buf, v26);
    }
  }
}

- (void)securePredictionFromLazyFeatures:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  id v12 = [CoreMLModelSecurityXPCFeatureProvider alloc];
  v13 = [(CoreMLModelSecurity *)self clientProxy];
  v14 = [(CoreMLModelSecurityXPCFeatureProvider *)v12 initWithRemoteProvider:v8 clientProxy:v13];

  id v15 = [(CoreMLModelSecurity *)self decryptedModel];
  id v19 = 0;
  uint64_t v16 = [v15 predictionFromFeatures:v14 options:v9 error:&v19];
  id v17 = v19;

  if (v16)
  {
    id v18 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithFeatureProvider:v16];
    v10[2](v10, v18, v17);
  }
  else
  {
    v10[2](v10, 0, v17);
    id v18 = 0;
  }
}

- (void)securePredictionFromLazyBatch:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = (void (**)(id, id, id))a5;
  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  for (unint64_t i = 0; i < (unint64_t)[v8 count]; ++i)
  {
    id v11 = [CoreMLModelSecurityXPCFeatureProvider alloc];
    id v12 = [v8 objectAtIndexedSubscript:i];
    v13 = [(CoreMLModelSecurity *)self clientProxy];
    v14 = [(CoreMLModelSecurityXPCFeatureProvider *)v11 initWithRemoteProvider:v12 clientProxy:v13];
    [v9 setObject:v14 atIndexedSubscript:i];
  }
  id v28 = [objc_alloc((Class)MLArrayBatchProvider) initWithFeatureProviderArray:v9];
  id v15 = [(CoreMLModelSecurity *)self decryptedModel];
  id v31 = 0;
  uint64_t v16 = [v15 predictionsFromBatch:v28 options:v30 error:&v31];
  id v17 = v31;

  if (v16)
  {
    id v18 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v16 count]);
    unint64_t v19 = 0;
    *(void *)&long long v20 = 134217984;
    long long v26 = v20;
    while (v19 < (unint64_t)objc_msgSend(v16, "count", v26))
    {
      id v21 = [v16 featuresAtIndex:v19];
      v22 = [v21 featureNames];
      BOOL v23 = v22 == 0;

      if (v23)
      {
        id v24 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          unint64_t v33 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "NULL outputBatchProvider at index %lu.", buf, 0xCu);
        }
      }
      else
      {
        id v24 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithFeatureProvider:v21];
        [v18 setObject:v24 atIndexedSubscript:v19];
      }

      ++v19;
    }
    id v25 = [objc_alloc((Class)MLArrayDictionaryFeatureProvider) initWithDictionaryFeatureProviderArray:v18];
    v29[2](v29, v25, v17);
  }
  else
  {
    v29[2](v29, 0, v17);
  }
}

- (void)secureParameterValueForKey:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  id v9 = v6;
  v10 = [(CoreMLModelSecurity *)self decryptedModel];
  id v13 = 0;
  id v11 = [v10 parameterValueForKey:v9 error:&v13];
  id v12 = v13;

  v7[2](v7, v11, v12);
}

- (CoreMLModelSecurity)init
{
  v6.receiver = self;
  v6.super_class = (Class)CoreMLModelSecurity;
  v2 = [(CoreMLModelSecurity *)&v6 init];
  if (v2)
  {
    v3 = (MLFairPlayDecryptSessionManager *)objc_alloc_init((Class)MLFairPlayDecryptSessionManager);
    decryptSessionManager = v2->_decryptSessionManager;
    v2->_decryptSessionManager = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(CoreMLModelSecurity *)self setTxn:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreMLModelSecurity;
  [(CoreMLModelSecurity *)&v3 dealloc];
}

- (void)secureModelMLFeatureValue:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, id, void *))a4;
  objc_super v6 = [v7 description];
  v5[2](v5, v7, v6);
}

- (void)secureModelMLDictionaryFeatureProvider:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, id, void *))a4;
  objc_super v6 = [v7 description];
  v5[2](v5, v7, v6);
}

- (void)secureModelMLFeatureDescription:(id)a3 withReply:(id)a4
{
}

- (void)secureModelMLModelDescription:(id)a3 withReply:(id)a4
{
}

- (void)createPersistentKeyBlobForKeyID:(id)a3 usesCodeSigningIdentityForEncryption:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a5;
  id v9 = objc_alloc_init((Class)MLFairPlayKeyLoadingSession);
  id v25 = 0;
  v10 = sub_10000A24C(v6, &v25);
  id v11 = v25;
  id v12 = v11;
  if (v10)
  {
    id v24 = v11;
    id v13 = [v9 generateKeyRequestForKeyIdentifier:v7 teamIdentifier:v10 error:&v24];
    id v14 = v24;

    if (v13)
    {
      id v15 = [[MLCloudSession alloc] initWithTeamIdentifier:v10];
      id v23 = v14;
      uint64_t v16 = [(MLCloudSession *)v15 fetchKeyResponseFromServerForKeyID:v7 signedKeyRequest:v13 error:&v23];
      id v17 = v23;

      if (v16)
      {
        id v22 = v17;
        id v18 = [v9 generatePersistentKeyBlobFromKeyResponse:v16 error:&v22];
        id v14 = v22;

        if (v18)
        {
          v8[2](v8, v18, 0);
        }
        else
        {
          id v21 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10000B32C();
          }

          ((void (**)(id, void *, id))v8)[2](v8, 0, v14);
        }
      }
      else
      {
        long long v20 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10000B2C4();
        }

        ((void (**)(id, void *, id))v8)[2](v8, 0, v17);
        id v14 = v17;
      }
    }
    else
    {
      unint64_t v19 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000B25C();
      }

      ((void (**)(id, void *, id))v8)[2](v8, 0, v14);
    }

    id v12 = v14;
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)startDecryptionOfModelAtPath:(id)a3 usingKeyBlob:(id)a4 usesCodeSigningIdentityForEncryption:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, id))a6;
  id v20 = 0;
  id v13 = sub_10000A24C(v7, &v20);
  id v14 = v20;
  id v15 = v14;
  if (v13)
  {
    uint64_t v16 = [(CoreMLModelSecurity *)self decryptSessionManager];
    id v19 = v15;
    unsigned __int8 v17 = [v16 startDecryptionOfModelAtPath:v10 usingKeyBlob:v11 teamIdentifier:v13 error:&v19];
    id v18 = v19;

    if ((v17 & 1) == 0) {
      v12[2](v12, v18);
    }
    v12[2](v12, 0);
  }
  else
  {
    id v18 = v14;
    v12[2](v12, v14);
  }
}

- (void)stopDecryptionOfModelAtPath:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v8 = [(CoreMLModelSecurity *)self decryptSessionManager];
  id v11 = 0;
  unsigned __int8 v9 = [v8 stopDecryptionOfModelAtPath:v6 error:&v11];
  id v10 = v11;

  if ((v9 & 1) == 0) {
    v7[2](v7, v10);
  }
  v7[2](v7, 0);
}

- (void)extractTeamIdentifierWithReply:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  objc_super v3 = +[CoreMLModelSecurity teamIdentifierFromXPCConnection];
  v4[2](v4, v3, 0);
}

+ (id)teamIdentifierFor:(id *)a3 processIdentifier:(int)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v6)
  {
    BOOL v7 = (void *)SecTaskCopyTeamIdentifier();
    CFRelease(v6);
    unsigned __int8 v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: SecTaskCopyTeamIdentifier() returned teamIdentity=\"%@\"", buf, 0x16u);
    }
  }
  else
  {
    id v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10000B41C();
    }

    BOOL v7 = 0;
  }

  return v7;
}

+ (id)codeSigningIdentifierFor:(id *)a3 processIdentifier:(int)a4
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  BOOL v7 = v6;
  if (v6)
  {
    CFErrorRef error = 0;
    id v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, &error);
    if (v8)
    {
      unsigned __int8 v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v17 = v10;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: SecTaskCopySigningIdentifier() returned signingIdentifier=\"%@\"", buf, 0x16u);
      }
    }
    else
    {
      id v12 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_10000B4A4();
      }

      CFRelease(error);
    }
    CFRelease(v7);
  }
  else
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10000B41C();
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)teamIdentifierFromXPCConnection
{
  v4 = +[NSXPCConnection currentConnection];
  long long v5 = v4;
  if (v4)
  {
    id v6 = [v4 processIdentifier];
    *(_OWORD *)id v19 = 0u;
    long long v20 = 0u;
    [v5 auditToken];
    BOOL v7 = objc_opt_class();
    v14[0] = *(_OWORD *)v19;
    v14[1] = v20;
    id v8 = [v7 teamIdentifierFor:v14 processIdentifier:v6];
    if (!v8)
    {
      unsigned __int8 v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v10;
        __int16 v17 = 1024;
        int v18 = (int)v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: client(%d) : missing teamIdentifier", buf, 0x12u);
      }
    }
  }
  else
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      sub_10000B4E8(v12, v19, v11);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)codeSigningIdentifierFromXPCConnection
{
  v4 = +[NSXPCConnection currentConnection];
  long long v5 = v4;
  if (v4)
  {
    id v6 = [v4 processIdentifier];
    *(_OWORD *)id v19 = 0u;
    long long v20 = 0u;
    [v5 auditToken];
    BOOL v7 = objc_opt_class();
    v14[0] = *(_OWORD *)v19;
    v14[1] = v20;
    id v8 = [v7 codeSigningIdentifierFor:v14 processIdentifier:v6];
    if (!v8)
    {
      unsigned __int8 v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v10;
        __int16 v17 = 1024;
        int v18 = (int)v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: client(%d) : missing signingIdentifier", buf, 0x12u);
      }
    }
  }
  else
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      sub_10000B4E8(v12, v19, v11);
    }

    id v8 = 0;
  }

  return v8;
}

- (MLFairPlayDecryptSessionManager)decryptSessionManager
{
  return (MLFairPlayDecryptSessionManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDecryptSessionManager:(id)a3
{
}

- (MLModel)decryptedModel
{
  return self->_decryptedModel;
}

- (void)setDecryptedModel:(id)a3
{
}

- (CoreMLModelSecurityServiceToClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (OS_os_transaction)txn
{
  return self->_txn;
}

- (void)setTxn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_decryptedModel, 0);

  objc_storeStrong((id *)&self->_decryptSessionManager, 0);
}

@end