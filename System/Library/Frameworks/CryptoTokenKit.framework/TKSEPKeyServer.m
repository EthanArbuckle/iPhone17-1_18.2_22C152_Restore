@interface TKSEPKeyServer
- (id)keyForObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (id)serverAttributesOfKey:(id)a3 error:(id *)a4;
- (void)attestWithKey:(id)a3 keyToAttest:(id)a4 nonce:(id)a5 authContext:(id)a6 forceSystemSessionAttestingKey:(BOOL)a7 forceSystemSessionKeyToAttest:(BOOL)a8 reply:(id)a9;
- (void)computeSharedSecretWithKey:(id)a3 publicKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)decapsulateWithKey:(id)a3 encapsulatedKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)deleteKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6;
- (void)generateKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(id)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 reply:(id)a9;
- (void)getAttributesOfKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6;
- (void)lifetimeControlKey:(id)a3 type:(int64_t)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
- (void)recryptWithKey:(id)a3 data:(id)a4 attributes:(id)a5 authContext:(id)a6 forceSystemSession:(BOOL)a7 reply:(id)a8;
- (void)signWithKey:(id)a3 digest:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7;
@end

@implementation TKSEPKeyServer

- (id)serverAttributesOfKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 publicKeyWithError:a4];
    if (v7)
    {
      v15[0] = @"keyType";
      v8 = [v6 keyType];
      v16[0] = v8;
      v15[1] = @"keySize";
      v9 = [v6 keySize];
      v16[1] = v9;
      v15[2] = @"systemKey";
      v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 systemKey]);
      v16[2] = v10;
      v15[3] = @"systemSessionKey";
      v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 systemSessionKey]);
      v16[3] = v11;
      v16[4] = v7;
      v15[4] = @"publicKey";
      v15[5] = @"accessControl";
      [v6 accessControl];
      v12 = (void *)SecAccessControlCopyData();
      v16[5] = v12;
      v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)generateKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(id)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 reply:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v17 = (void (**)(id, void *, void *, void))a9;
  id location = 0;
  v18 = (void *)SecAccessControlCreateFromData();
  if (v18)
  {
    id v19 = objc_alloc((Class)TKSEPKey);
    v20 = +[NSXPCConnection currentConnection];
    id obj = location;
    LOBYTE(v28) = a8;
    id v21 = [v19 initLocalWithKeyType:v14 keySize:a4 accessControl:v18 options:v15 authContext:v16 caller:v20 forceSystemSession:v28 error:&obj];
    objc_storeStrong(&location, obj);

    if (v21
      && (id v29 = location,
          [(TKSEPKeyServer *)self serverAttributesOfKey:v21 error:&v29],
          v22 = objc_claimAutoreleasedReturnValue(),
          objc_storeStrong(&location, v29),
          v22))
    {
      v23 = self;
      objc_sync_enter(v23);
      objc_storeStrong((id *)&v23->_cachedKey, v21);
      objc_sync_exit(v23);

      id v24 = objc_alloc((Class)TKBERTLVRecord);
      v25 = [v21 objectID];
      id v26 = [v24 initWithPropertyList:v25];
      v27 = [v26 data];
      v17[2](v17, v27, v22, 0);
    }
    else
    {
      ((void (**)(id, void *, void *, id))v17)[2](v17, 0, 0, location);
    }
  }
  else
  {
    ((void (**)(id, void *, void *, id))v17)[2](v17, 0, 0, location);
  }
}

- (id)keyForObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = +[TKBERTLVRecord recordFromData:v9];
  v12 = [v11 propertyList];

  v13 = self;
  objc_sync_enter(v13);
  id v14 = [(TKSEPKey *)v13->_cachedKey objectID];
  if ([v14 isEqual:v12])
  {
    id v15 = [(TKSEPKey *)v13->_cachedKey authContext];
    unsigned __int8 v16 = [v15 isEqual:v10];

    p_cachedKey = (id *)&v13->_cachedKey;
    if (v16) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  p_cachedKey = (id *)&v13->_cachedSystemKey;
  v18 = [(TKSEPKey *)v13->_cachedSystemKey objectID];
  if ([v18 isEqual:v12])
  {
    id v19 = [*p_cachedKey authContext];
    unsigned int v20 = [v19 isEqual:v10];

    if (v20)
    {
LABEL_7:
      id v21 = *p_cachedKey;
      goto LABEL_14;
    }
  }
  else
  {
  }
  objc_sync_exit(v13);

  id v22 = objc_alloc((Class)TKSEPKey);
  v23 = +[NSXPCConnection currentConnection];
  id v21 = [v22 initLocalWithObjectID:v12 authContext:v10 caller:v23 forceSystemSession:v6 error:a6];

  if (!v21) {
    goto LABEL_15;
  }
  objc_sync_enter(v13);
  if ([v21 systemKey]) {
    p_cachedSystemKey = (id *)&v13->_cachedSystemKey;
  }
  else {
    p_cachedSystemKey = (id *)&v13->_cachedKey;
  }
  objc_storeStrong(p_cachedSystemKey, v21);
LABEL_14:
  objc_sync_exit(v13);

LABEL_15:

  return v21;
}

- (void)getAttributesOfKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v16 = 0;
  id v10 = (void (**)(id, void *, id))a6;
  v11 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a4 forceSystemSession:v6 error:&v16];
  id v12 = v16;
  id v15 = v12;
  v13 = [(TKSEPKeyServer *)self serverAttributesOfKey:v11 error:&v15];
  id v14 = v15;

  v10[2](v10, v13, v14);
}

- (void)deleteKey:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 reply:(id)a6
{
  BOOL v6 = a5;
  id v10 = (void (**)(id, id, void *))a6;
  id v17 = 0;
  v11 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a4 forceSystemSession:v6 error:&v17];
  id v12 = v17;
  v13 = v12;
  if (v11)
  {
    id v16 = v12;
    id v14 = [v11 deleteWithError:&v16];
    id v15 = v16;

    v13 = v15;
  }
  else
  {
    id v14 = 0;
  }
  v10[2](v10, v14, v13);
}

- (void)signWithKey:(id)a3 digest:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0;
  id v14 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a5 forceSystemSession:v8 error:&v20];
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = [v14 signDigest:v12 error:&v19];
    id v18 = v19;

    id v16 = v18;
  }
  else
  {
    id v17 = 0;
  }
  v13[2](v13, v17, v16);
}

- (void)computeSharedSecretWithKey:(id)a3 publicKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0;
  id v14 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a5 forceSystemSession:v8 error:&v20];
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = [v14 computeSharedSecret:v12 error:&v19];
    id v18 = v19;

    id v16 = v18;
  }
  else
  {
    id v17 = 0;
  }
  v13[2](v13, v17, v16);
}

- (void)recryptWithKey:(id)a3 data:(id)a4 attributes:(id)a5 authContext:(id)a6 forceSystemSession:(BOOL)a7 reply:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void (**)(id, void *, void *))a8;
  id v23 = 0;
  id v17 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a6 forceSystemSession:v9 error:&v23];
  id v18 = v23;
  id v19 = v18;
  if (v17)
  {
    id v22 = v18;
    id v20 = [v17 recryptData:v14 attributes:v15 error:&v22];
    id v21 = v22;

    id v19 = v21;
  }
  else
  {
    id v20 = 0;
  }
  v16[2](v16, v20, v19);
}

- (void)decapsulateWithKey:(id)a3 encapsulatedKey:(id)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  v13 = (void (**)(id, void *, void *))a7;
  id v20 = 0;
  id v14 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a5 forceSystemSession:v8 error:&v20];
  id v15 = v20;
  id v16 = v15;
  if (v14)
  {
    id v19 = v15;
    id v17 = [v14 decapsulateKey:v12 error:&v19];
    id v18 = v19;

    id v16 = v18;
  }
  else
  {
    id v17 = 0;
  }
  v13[2](v13, v17, v16);
}

- (void)attestWithKey:(id)a3 keyToAttest:(id)a4 nonce:(id)a5 authContext:(id)a6 forceSystemSessionAttestingKey:(BOOL)a7 forceSystemSessionKeyToAttest:(BOOL)a8 reply:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *, void *))a9;
  id v28 = 0;
  id v19 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:v17 forceSystemSession:v10 error:&v28];
  id v20 = v28;
  id v21 = v20;
  if (v19)
  {
    id v27 = v20;
    id v22 = [(TKSEPKeyServer *)self keyForObjectID:v15 authContext:v17 forceSystemSession:v9 error:&v27];
    id v23 = v27;

    if (v22)
    {
      id v26 = v23;
      id v24 = [v19 attestKey:v22 nonce:v16 error:&v26];
      id v25 = v26;

      id v23 = v25;
    }
    else
    {
      id v24 = 0;
    }

    id v21 = v23;
  }
  else
  {
    id v24 = 0;
  }
  v18[2](v18, v24, v21);
}

- (void)lifetimeControlKey:(id)a3 type:(int64_t)a4 authContext:(id)a5 forceSystemSession:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  id v12 = (void (**)(id, id, void *))a7;
  id v19 = 0;
  v13 = [(TKSEPKeyServer *)self keyForObjectID:a3 authContext:a5 forceSystemSession:v7 error:&v19];
  id v14 = v19;
  id v15 = v14;
  if (v13)
  {
    id v18 = v14;
    id v16 = [v13 lifetimeControlWithType:a4 error:&v18];
    id v17 = v18;

    id v15 = v17;
  }
  else
  {
    id v16 = 0;
  }
  v12[2](v12, v16, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSystemKey, 0);

  objc_storeStrong((id *)&self->_cachedKey, 0);
}

@end