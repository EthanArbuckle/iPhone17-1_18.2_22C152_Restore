@interface IXPromisedAppReference
+ (BOOL)supportsSecureCoding;
+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 ifMatchingPredicate:(id)a6 error:(id *)a7;
+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 matchingAppInRecord:(id)a6 error:(id *)a7;
- (Class)seedClass;
- (IXApplicationIdentity)identity;
- (IXPromisedAppReference)initWithCoder:(id)a3;
- (IXPromisedAppReference)initWithName:(id)a3 client:(unint64_t)a4 forAppWithIdentity:(id)a5 inDomain:(unint64_t)a6 ifMatchingPredicate:(id)a7 error:(id *)a8;
- (IXPromisedAppReference)initWithSeed:(id)a3;
- (id)placeholderPromiseForInstallType:(unint64_t)a3 withError:(id *)a4;
- (unint64_t)installationDomain;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithCompletion:(id)a3;
@end

@implementation IXPromisedAppReference

- (IXPromisedAppReference)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedAppReference;
  return [(IXOwnedDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXPromisedAppReference;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 ifMatchingPredicate:(id)a6 error:(id *)a7
{
  v11 = NSString;
  id v12 = a6;
  id v13 = a3;
  v14 = [v11 stringWithFormat:@"%@/%lu", v13, a4];
  v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v14 client:a5 forAppWithIdentity:v13 inDomain:a4 ifMatchingPredicate:v12 error:a7];

  return v15;
}

+ (id)acquireReferenceToAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 forClient:(unint64_t)a5 matchingAppInRecord:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = [a6 uniqueInstallIdentifier];
  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uniqueInstallIdentifier = %@", v13];
  v15 = [a1 acquireReferenceToAppWithIdentity:v12 inDomain:a4 forClient:a5 ifMatchingPredicate:v14 error:a7];

  return v15;
}

- (IXPromisedAppReference)initWithName:(id)a3 client:(unint64_t)a4 forAppWithIdentity:(id)a5 inDomain:(unint64_t)a6 ifMatchingPredicate:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  v37.receiver = self;
  v37.super_class = (Class)IXPromisedAppReference;
  v17 = [(IXOwnedDataPromise *)&v37 initWithName:v14 client:a4 diskSpaceNeeded:0];
  v18 = v17;
  if (!v17) {
    goto LABEL_7;
  }
  v19 = [(IXDataPromise *)v17 seed];
  [v19 setInstallationDomain:a6];

  v20 = [(IXDataPromise *)v18 seed];
  [v20 setIdentity:v15];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  id v36 = 0;
  v21 = +[IXServerConnection sharedConnection];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke;
  v30[3] = &unk_1E5D172A8;
  v30[4] = &v31;
  v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v30];
  v23 = [(IXDataPromise *)v18 seed];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke_11;
  v27[3] = &unk_1E5D17C78;
  v29 = &v31;
  v28 = v18;
  objc_msgSend(v22, "_remote_createAppReferenceDataPromiseWithSeed:ifMatchingPredicate:completion:", v23, v16, v27);

  v24 = (void *)v32[5];
  if (!v24)
  {

    _Block_object_dispose(&v31, 8);
LABEL_7:
    v25 = v18;
    goto LABEL_8;
  }
  if (a8) {
    *a8 = v24;
  }

  _Block_object_dispose(&v31, 8);
  v25 = 0;
LABEL_8:

  return v25;
}

void __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_super v4 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[IXPromisedAppReference initWithName:client:forAppWithIdentity:inDomain:ifMatchingPredicate:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1A7B2D000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __100__IXPromisedAppReference_initWithName_client_forAppWithIdentity_inDomain_ifMatchingPredicate_error___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else {
    [*(id *)(a1 + 32) _updateInitWithSeed:a2 notifyDaemon:0];
  }
}

- (id)placeholderPromiseForInstallType:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = [(IXDataPromise *)self seed];
  int v7 = [v6 identity];
  uint64_t v8 = [v6 creatorIdentifier];
  id v20 = 0;
  __int16 v9 = IXApplicationRecordForIdentityInDomain(v7, [v6 installationDomain], &v20);
  id v10 = v20;
  if (v9)
  {
    uint64_t v11 = [v9 URL];
    id v19 = v10;
    id v12 = +[IXPlaceholder placeholderForInstallable:v11 client:v8 installType:a3 metadata:0 error:&v19];
    id v13 = v19;
    id v14 = v10;
    id v10 = (id)v11;
  }
  else
  {
    id v15 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = MIStringForInstallationDomain();
      *(_DWORD *)buf = 136315906;
      v22 = "-[IXPromisedAppReference placeholderPromiseForInstallType:withError:]";
      __int16 v23 = 2112;
      v24 = v7;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl(&dword_1A7B2D000, v15, OS_LOG_TYPE_ERROR, "%s: Could not get LSApplicationRecord for app with identity %@ in domain %@ : %@", buf, 0x2Au);
    }
    id v14 = MIStringForInstallationDomain();
    _CreateError((uint64_t)"-[IXPromisedAppReference placeholderPromiseForInstallType:withError:]", 124, @"IXErrorDomain", 0x32uLL, v10, 0, @"Could not get LSApplicationRecord for app with identity %@ in domain %@", v16, (uint64_t)v7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = 0;
  }

  if (a4 && !v12) {
    *a4 = v13;
  }

  return v12;
}

- (void)resetWithCompletion:(id)a3
{
  id v3 = kIXLoggingSubsystem;
  objc_super v4 = (void (**)(id, void *))a3;
  uint64_t v5 = IXGetLoggingHandle((uint64_t)v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[IXPromisedAppReference resetWithCompletion:](v5);
  }

  int v7 = _CreateError((uint64_t)"-[IXPromisedAppReference resetWithCompletion:]", 140, @"IXErrorDomain", 4uLL, 0, 0, @"Resetting a promised app referece doesn't make sense.", v6, v8);
  v4[2](v4, v7);
}

- (IXApplicationIdentity)identity
{
  v2 = [(IXDataPromise *)self seed];
  id v3 = [v2 identity];

  return (IXApplicationIdentity *)v3;
}

- (unint64_t)installationDomain
{
  v2 = [(IXDataPromise *)self seed];
  unint64_t v3 = [v2 installationDomain];

  return v3;
}

- (IXPromisedAppReference)initWithSeed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXPromisedAppReference;
  return [(IXOwnedDataPromise *)&v4 initWithSeed:a3];
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (void)resetWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[IXPromisedAppReference resetWithCompletion:]";
  __int16 v3 = 2112;
  uint64_t v4 = 0;
  _os_log_error_impl(&dword_1A7B2D000, log, OS_LOG_TYPE_ERROR, "%s: Resetting a promised app referece doesn't make sense. : %@", (uint8_t *)&v1, 0x16u);
}

@end