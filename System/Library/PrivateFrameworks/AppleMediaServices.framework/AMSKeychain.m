@interface AMSKeychain
+ (BOOL)_generateLegacyKeypairForOptions:(id)a3 error:(id *)a4;
+ (BOOL)deleteCertificateChainWithOptions:(id)a3 error:(id *)a4;
+ (BOOL)deleteKeyPairWithOptions:(id)a3 error:(id *)a4;
+ (BOOL)performForwardKeyMigrationForDSID:(id)a3 forceMigration:(BOOL)a4;
+ (BOOL)stashResumptionHeaders:(id)a3 error:(id *)a4;
+ (BOOL)storePrimaryCert:(__SecCertificate *)a3 intermediateCert:(__SecCertificate *)a4 privateKey:(__SecKey *)a5 options:(id)a6 error:(id *)a7;
+ (__SecAccessControl)copyAccessControlRefWithAccount:(id)a3 options:(id)a4 error:(id *)a5;
+ (__SecAccessControl)createAccessControlRefWithOptions:(id)a3 error:(id *)a4;
+ (__SecKey)_copyLegacyPrivateKeyForOptions:(id)a3 error:(id *)a4;
+ (__SecKey)_copyLegacyPublicKeyForOptions:(id)a3 error:(id *)a4;
+ (__SecKey)copyCertificatePrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6;
+ (__SecKey)copyPrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6;
+ (__SecKey)copyPrivateKeyWithContext:(id)a3 options:(id)a4 error:(id *)a5;
+ (__SecKey)copyPublicKeyForAccount:(id)a3 options:(id)a4 error:(id *)a5;
+ (__SecKey)copyPublicKeyForOptions:(id)a3 error:(id *)a4;
+ (id)_certificatePrivateKeyLabelForOptions:(id)a3;
+ (id)_extendedConstraintsWithOptions:(id)a3;
+ (id)_legacyAttestationForOptions:(id)a3 error:(id *)a4;
+ (id)_primaryConstraints;
+ (id)_primaryConstraintsForMac;
+ (id)_primaryConstraintsForOpticID;
+ (id)_primaryConstraintsForWatch;
+ (id)_primaryConstraintsWithOptions:(id)a3;
+ (id)_resumptionHeadersQuery;
+ (id)_ssCertificateKeychainLabelForAccount:(id)a3 options:(id)a4;
+ (id)_ssKeychainLabelForAccount:(id)a3 options:(id)a4;
+ (id)certificateChainStringsForOptions:(id)a3 error:(id *)a4;
+ (id)certificateKeychainLabelsForOptions:(id)a3;
+ (id)keychainLabelForOptions:(id)a3;
+ (id)legacyAttestationForOptions:(id)a3 error:(id *)a4;
+ (id)publicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5;
+ (id)resumptionHeaders;
+ (void)_deleteResumptionHeaders;
+ (void)secItemAddFunc;
+ (void)secItemCopyMatchingFunc;
+ (void)setSecItemAddFunc:(void *)a3;
+ (void)setSecItemCopyMatchingFunc:(void *)a3;
+ (void)stashResumptionHeaders:(id)a3;
@end

@implementation AMSKeychain

+ (id)certificateChainStringsForOptions:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = +[AMSKeychain certificateKeychainLabelsForOptions:v5];
  unint64_t v8 = 0x1E4F29000uLL;
  if ([v7 count] == 2
    || ([NSString stringWithFormat:@"Certificate Lookup: Invalid number of keychain labels: %@ options: %@", v7, v5], v9 = objc_claimAutoreleasedReturnValue(), AMSError(600, @"Keychain Error", v9, 0), v10 = objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v40 = v7;
      v41 = a4;
      id v42 = v5;
      uint64_t v13 = *(void *)v50;
      uint64_t v14 = *MEMORY[0x1E4F3B788];
      uint64_t v15 = *MEMORY[0x1E4F3BD08];
      uint64_t v16 = *MEMORY[0x1E4F3B550];
      uint64_t v47 = *MEMORY[0x1E4F3B978];
      uint64_t v48 = *MEMORY[0x1E4F3B980];
      uint64_t v46 = *MEMORY[0x1E4F3BC80];
      uint64_t v43 = *MEMORY[0x1E4F3B550];
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v19 = +[AMSLogConfig sharedKeychainConfig];
          if (!v19)
          {
            v19 = +[AMSLogConfig sharedConfig];
          }
          v20 = [v19 OSLogObject];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = v18;
            uint64_t v21 = v12;
            uint64_t v22 = v15;
            uint64_t v23 = v14;
            uint64_t v24 = v13;
            id v25 = v6;
            uint64_t v26 = objc_opt_class();
            v27 = AMSSetLogKeyIfNeeded();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v26;
            id v6 = v25;
            uint64_t v13 = v24;
            uint64_t v14 = v23;
            uint64_t v15 = v22;
            uint64_t v12 = v21;
            uint64_t v18 = v45;
            __int16 v54 = 2114;
            v55 = v27;
            __int16 v56 = 2114;
            uint64_t v57 = v45;
            _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Fetching cert for label: %{public}@", buf, 0x20u);

            uint64_t v16 = v43;
          }

          *(void *)buf = 0;
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v28 setObject:v18 forKeyedSubscript:v14];
          uint64_t v29 = MEMORY[0x1E4F1CC38];
          [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v15];
          [v28 setObject:@"apple" forKeyedSubscript:v16];
          [v28 setObject:v48 forKeyedSubscript:v47];
          [v28 setObject:v29 forKeyedSubscript:v46];
          uint64_t v30 = AMSSecItemCopyMatchingWithTimeFault(v28, (uint64_t)buf);
          if (v30)
          {
            int v33 = v30;
            unint64_t v8 = 0x1E4F29000uLL;
            v34 = NSString;
            v35 = [MEMORY[0x1E4F28ED0] numberWithInt:v30];
            id v5 = v42;
            v36 = [v34 stringWithFormat:@"Certificate Lookup: Failed to find cert. status: %@ options: %@", v35, v42];

            v10 = AMSKeychainError(v36, v33);

            v7 = v40;
            a4 = v41;
            goto LABEL_18;
          }
          CFDataRef v31 = SecCertificateCopyData(*(SecCertificateRef *)buf);
          v32 = [(__CFData *)v31 base64EncodedStringWithOptions:0];
          [v6 addObject:v32];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      v10 = 0;
      a4 = v41;
      id v5 = v42;
      v7 = v40;
      unint64_t v8 = 0x1E4F29000;
    }
    else
    {
      v10 = 0;
    }
LABEL_18:
  }
  if ([v6 count] != 2)
  {
    v37 = [*(id *)(v8 + 24) stringWithFormat:@"Certificate Lookup: Cert fetch finished without either an error or both certs. options: %@", v5];
    uint64_t v38 = AMSError(600, @"Keychain Error", v37, 0);

    v10 = (void *)v38;
  }
  if (v10)
  {

    id v6 = 0;
  }
  if (a4) {
    *a4 = v10;
  }

  return v6;
}

+ (__SecKey)copyPrivateKeyWithContext:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  CFTypeRef cf = 0;
  unint64_t v10 = [v9 style];
  if (v10 > 5) {
    goto LABEL_23;
  }
  if (((1 << v10) & 0x39) != 0) {
    [a1 _certificatePrivateKeyLabelForOptions:v9];
  }
  else {
  uint64_t v11 = [a1 keychainLabelForOptions:v9];
  }
  if (!v11)
  {
LABEL_23:
    uint64_t v12 = [NSString stringWithFormat:@"Private Key Lookup: Invalid private key label: %@. options: %@", 0, v9];
    uint64_t v13 = AMSError(600, @"Keychain Error", v12, 0);

    uint64_t v11 = 0;
    if (v13)
    {
LABEL_17:
      if (a5) {
        *a5 = (id) v13;
      }
      CFTypeRef cf = 0;

      CFTypeRef v21 = 0;
      goto LABEL_20;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
  [v14 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v14 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v14 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
  [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  [v14 setObject:*MEMORY[0x1E4F3B8A8] forKeyedSubscript:*MEMORY[0x1E4F3B890]];
  if (v8) {
    [v14 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3BCE8]];
  }
  uint64_t v16 = AMSSecItemCopyMatchingWithTimeFault(v14, (uint64_t)&cf);
  if (v16)
  {
    int v17 = v16;
    uint64_t v18 = NSString;
    v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
    v20 = [v18 stringWithFormat:@"Private Key Lookup: Failed to fetch privateKey. status: %@ options: %@", v19, v9];

    uint64_t v13 = AMSKeychainError(v20, v17);
  }
  else
  {
    uint64_t v13 = 0;
  }

  CFTypeRef v21 = cf;
  if (!(v13 | (unint64_t)cf))
  {
    uint64_t v22 = [NSString stringWithFormat:@"Private Key Lookup: Finished without a result or error. options: %@", v9];
    uint64_t v13 = AMSError(600, @"Keychain Error", v22, 0);

    CFTypeRef v21 = cf;
  }
  if (v13)
  {
    if (v21) {
      CFRelease(v21);
    }
    goto LABEL_17;
  }
LABEL_20:

  return (__SecKey *)v21;
}

+ (__SecKey)copyCertificatePrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v70 = 0;
  v69 = AMSSetLogKeyIfNeeded();
  if (![v13 style]
    || [v13 style] == 4
    || [v13 style] == 3
    || [v13 style] == 5)
  {
    id v66 = a1;
    id v68 = v13;
    uint64_t v14 = [a1 _ssKeychainLabelForAccount:v12 options:v13];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v16 = *MEMORY[0x1E4F3B6E8];
    uint64_t v17 = *MEMORY[0x1E4F3B6D8];
    [v15 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
    uint64_t v18 = *MEMORY[0x1E4F3B788];
    v67 = (void *)v14;
    [v15 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    uint64_t v64 = *MEMORY[0x1E4F3B550];
    objc_msgSend(v15, "setObject:forKeyedSubscript:", @"apple");
    uint64_t v62 = *MEMORY[0x1E4F3B978];
    uint64_t v63 = *MEMORY[0x1E4F3B9A0];
    objc_msgSend(v15, "setObject:forKeyedSubscript:");
    uint64_t v19 = *MEMORY[0x1E4F3BC80];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
    uint64_t v20 = *MEMORY[0x1E4F3BCE8];
    [v15 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3BCE8]];
    uint64_t v21 = AMSSecItemCopyMatchingWithTimeFault(v15, (uint64_t)&v70);
    if (v21 != -25300)
    {
      uint64_t v22 = v21;
      if (v21)
      {
        id v60 = v12;
        id v61 = v11;
        uint64_t v23 = +[AMSLogConfig sharedKeychainConfig];
        if (!v23)
        {
          uint64_t v23 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v24 = [v23 OSLogObject];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = objc_opt_class();
          v58 = (void *)MEMORY[0x1E4F28ED0];
          id v59 = v25;
          uint64_t v26 = [v58 numberWithInt:v22];
          *(_DWORD *)buf = 138543874;
          v72 = v25;
          __int16 v73 = 2114;
          v74 = v69;
          __int16 v75 = 2114;
          v76 = v26;
          _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Retrieving certificate key for legacy StoreServices returned status: %{public}@", buf, 0x20u);
        }
        id v12 = v60;
        id v11 = v61;
      }
    }
    v27 = v70;
    if (!v70)
    {
      id v28 = v12;
      uint64_t v29 = [v66 _certificatePrivateKeyLabelForOptions:v68];
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v31 = v16;
      v32 = (void *)v29;
      [v30 setObject:v31 forKeyedSubscript:v17];
      [v30 setObject:v29 forKeyedSubscript:v18];
      uint64_t v33 = MEMORY[0x1E4F1CC38];
      [v30 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
      [v30 setObject:@"apple" forKeyedSubscript:v64];
      [v30 setObject:v63 forKeyedSubscript:v62];
      [v30 setObject:v33 forKeyedSubscript:v19];
      [v30 setObject:v11 forKeyedSubscript:v20];
      uint64_t v34 = AMSSecItemCopyMatchingWithTimeFault(v30, (uint64_t)&v70);
      if (v34 != -25300)
      {
        uint64_t v35 = v34;
        if (v34)
        {
          v36 = +[AMSLogConfig sharedKeychainConfig];
          if (!v36)
          {
            v36 = +[AMSLogConfig sharedConfig];
          }
          v37 = objc_msgSend(v36, "OSLogObject", v58);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            uint64_t v38 = objc_opt_class();
            v39 = (void *)MEMORY[0x1E4F28ED0];
            v65 = v32;
            id v40 = v11;
            id v41 = v38;
            id v42 = [v39 numberWithInt:v35];
            *(_DWORD *)buf = 138543874;
            v72 = v38;
            __int16 v73 = 2114;
            v74 = v69;
            __int16 v75 = 2114;
            v76 = v42;
            _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Retrieving certificate key for AMS returned status: %{public}@", buf, 0x20u);

            id v11 = v40;
            v32 = v65;
          }
        }
      }

      v27 = v70;
      id v12 = v28;
      if (!v70)
      {
        uint64_t v43 = +[AMSLogConfig sharedKeychainConfig];
        if (!v43)
        {
          uint64_t v43 = +[AMSLogConfig sharedConfig];
        }
        v44 = objc_msgSend(v43, "OSLogObject", v58);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = objc_opt_class();
          id v46 = v45;
          uint64_t v47 = AMSHashIfNeeded(v28);
          *(_DWORD *)buf = 138543874;
          v72 = v45;
          __int16 v73 = 2114;
          v74 = v69;
          __int16 v75 = 2114;
          v76 = v47;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find certificate key either for AMS or StoreServices for account: %{public}@", buf, 0x20u);

          id v12 = v28;
        }

        v27 = v70;
      }
    }

    id v48 = 0;
    id v13 = v68;
  }
  else
  {
    long long v50 = +[AMSLogConfig sharedKeychainConfig];
    if (!v50)
    {
      long long v50 = +[AMSLogConfig sharedConfig];
    }
    long long v51 = [v50 OSLogObject];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      long long v52 = objc_opt_class();
      id v53 = v12;
      id v54 = v52;
      v55 = NSStringFromSelector(a2);
      __int16 v56 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "style"));
      *(_DWORD *)buf = 138544130;
      v72 = v52;
      __int16 v73 = 2114;
      v74 = v69;
      __int16 v75 = 2112;
      v76 = v55;
      __int16 v77 = 2112;
      v78 = v56;
      _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %@ was invoked with attestation style: %@", buf, 0x2Au);

      id v12 = v53;
    }

    uint64_t v57 = AMSError(600, @"Keychain Error", @"Incorrect Attestation Style", 0);
    id v48 = v57;
    if (a6)
    {
      id v48 = v57;
      v27 = 0;
      *a6 = v48;
    }
    else
    {
      v27 = 0;
    }
  }

  return v27;
}

+ (__SecKey)copyPrivateKeyWithContext:(id)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v36 = 0;
  uint64_t v14 = AMSSetLogKeyIfNeeded();
  if ([v13 style] == 1)
  {
    uint64_t v34 = a6;
    id v15 = [a1 _ssKeychainLabelForAccount:v12 options:v13];
    if (!v15)
    {
      uint64_t v21 = AMSError(600, @"Keychain Error", @"No Private Key Label", 0);
      if (v21) {
        goto LABEL_20;
      }
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    [v16 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v16 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    [v16 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
    [v16 setObject:*MEMORY[0x1E4F3B8A8] forKeyedSubscript:*MEMORY[0x1E4F3B890]];
    if (v11) {
      [v16 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3BCE8]];
    }
    if (AMSSecItemCopyMatchingWithTimeFault(v16, (uint64_t)&v36))
    {
      uint64_t v17 = +[AMSLogConfig sharedKeychainConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v19;
        __int16 v39 = 2114;
        id v40 = v14;
        id v20 = v19;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No legacy StoreServices private key found", buf, 0x16u);
      }
    }

    uint64_t v21 = 0;
    id v22 = 0;
    uint64_t v23 = v36;
    if (!v36)
    {
LABEL_20:
      uint64_t v23 = (__SecKey *)[a1 copyPrivateKeyWithContext:v11 options:v13 error:v34];
      id v22 = (id)v21;
    }
  }
  else
  {
    uint64_t v24 = +[AMSLogConfig sharedKeychainConfig];
    if (!v24)
    {
      uint64_t v24 = +[AMSLogConfig sharedConfig];
    }
    id v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = v14;
      id v27 = v12;
      id v28 = a6;
      uint64_t v29 = objc_opt_class();
      id v35 = v29;
      id v30 = NSStringFromSelector(a2);
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "style"));
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = v29;
      a6 = v28;
      id v12 = v27;
      uint64_t v14 = v26;
      __int16 v39 = 2114;
      id v40 = v26;
      __int16 v41 = 2112;
      id v42 = v30;
      __int16 v43 = 2112;
      v44 = v31;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %@ was invoked with attestation style: %@", buf, 0x2Au);
    }
    v32 = AMSError(600, @"Keychain Error", @"Incorrect Attestation Style", 0);
    id v22 = v32;
    if (a6)
    {
      id v22 = v32;
      uint64_t v23 = 0;
      *a6 = v22;
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

  return v23;
}

+ (__SecKey)copyPublicKeyForAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v44 = AMSSetLogKeyIfNeeded();
  if (![v8 style] || objc_msgSend(v8, "style") == 4 || objc_msgSend(v8, "style") == 5)
  {
    id v49 = 0;
    id v9 = +[AMSKeychain copyCertificatePrivateKeyWithContext:0 account:v7 options:v8 error:&v49];
    id v10 = v49;
    if (v9)
    {
      SecKeyRef v11 = SecKeyCopyPublicKey(v9);
      if (v11)
      {
        SecKeyRef v12 = v11;
        id v13 = a5;
        uint64_t v14 = +[AMSLogConfig sharedKeychainConfig];
        if (!v14)
        {
          uint64_t v14 = +[AMSLogConfig sharedConfig];
        }
        id v15 = [v14 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          id v51 = v16;
          __int16 v52 = 2114;
          uint64_t v17 = (void *)v44;
          uint64_t v53 = v44;
          __int16 v54 = 2114;
          id v55 = v8;
          id v18 = v16;
          _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found public key cert reference for options: %{public}@", buf, 0x20u);

          a5 = v13;
        }
        else
        {
          uint64_t v17 = (void *)v44;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    uint64_t v19 = [[AMSBiometricsTokenUpdateTask alloc] initWithAccount:v7];
    [(AMSBiometricsTokenUpdateTask *)v19 setShouldGenerateKeysOnly:1];
    id v20 = [(AMSBiometricsTokenUpdateTask *)v19 performUpdate];
    id v48 = v10;
    [v20 resultWithError:&v48];
    id v21 = v48;

    if (v21)
    {
      id v42 = v7;
      id v22 = a5;
      uint64_t v23 = +[AMSLogConfig sharedAttestationConfig];
      if (!v23)
      {
        uint64_t v23 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_opt_class();
        uint64_t v26 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        id v51 = v25;
        __int16 v52 = 2114;
        uint64_t v53 = (uint64_t)v26;
        __int16 v54 = 2114;
        id v55 = v21;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-create cert chain failed with error: %{public}@", buf, 0x20u);
      }
      a5 = v22;
      id v7 = v42;
    }
  }
  else
  {
    if ([v8 style] != 1)
    {
      v32 = a5;
      uint64_t v33 = +[AMSLogConfig sharedKeychainConfig];
      if (!v33)
      {
        uint64_t v33 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v51 = (id)objc_opt_class();
        __int16 v52 = 2114;
        uint64_t v53 = v44;
        __int16 v54 = 2114;
        id v55 = v8;
        id v35 = v51;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Legacy StoreServices public key lookup not supported for attestation style: %{public}@", buf, 0x20u);
      }
      id v27 = 0;
      id v10 = 0;
      a5 = v32;
      uint64_t v17 = (void *)v44;
      goto LABEL_22;
    }
    __int16 v43 = a5;
    id v47 = 0;
    id v9 = +[AMSKeychain copyPrivateKeyWithContext:0 account:v7 options:v8 error:&v47];
    id v10 = v47;
    if (v9)
    {
      SecKeyRef v29 = SecKeyCopyPublicKey(v9);
      if (v29)
      {
        SecKeyRef v12 = v29;
        uint64_t v14 = +[AMSLogConfig sharedKeychainConfig];
        if (!v14)
        {
          uint64_t v14 = +[AMSLogConfig sharedConfig];
        }
        id v15 = [v14 OSLogObject];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          id v51 = v30;
          __int16 v52 = 2114;
          uint64_t v17 = (void *)v44;
          uint64_t v53 = v44;
          __int16 v54 = 2114;
          id v55 = v8;
          id v31 = v30;
          _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found public key reference for options: %{public}@", buf, 0x20u);

          a5 = v43;
        }
        else
        {
          uint64_t v17 = (void *)v44;
        }
        goto LABEL_20;
      }
    }
    v36 = +[AMSLogConfig sharedKeychainConfig];
    if (!v36)
    {
      v36 = +[AMSLogConfig sharedConfig];
    }
    v37 = [v36 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = objc_opt_class();
      id v39 = v38;
      id v40 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138544130;
      id v51 = v38;
      __int16 v52 = 2114;
      uint64_t v53 = (uint64_t)v40;
      __int16 v54 = 2112;
      id v55 = v8;
      __int16 v56 = 2114;
      id v57 = v10;
      _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find public key reference for options: %@, error: %{public}@", buf, 0x2Au);
    }
    id v46 = v10;
    BOOL v41 = +[AMSKeychain _generateLegacyKeypairForOptions:v8 error:&v46];
    id v21 = v46;

    if (v41)
    {
      id v45 = v21;
      id v9 = (__SecKey *)[(id)objc_opt_class() copyPrivateKeyWithContext:0 options:v8 error:&v45];
      id v10 = v45;

      if (v9)
      {
        SecKeyRef v12 = SecKeyCopyPublicKey(v9);
        a5 = v43;
        uint64_t v17 = (void *)v44;
        goto LABEL_21;
      }
      id v27 = 0;
      a5 = v43;
      uint64_t v17 = (void *)v44;
      goto LABEL_22;
    }
    a5 = v43;
  }
  SecKeyRef v12 = 0;
  id v27 = 0;
  id v10 = v21;
  uint64_t v17 = (void *)v44;
  if (v9)
  {
LABEL_21:
    CFRelease(v9);
    id v27 = v12;
  }
LABEL_22:
  if (a5) {
    *a5 = v10;
  }

  return v27;
}

+ (__SecKey)copyPublicKeyForOptions:(id)a3 error:(id *)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  SecKeyRef v64 = 0;
  id v7 = 0;
  if ([v6 style] == 4)
  {
    id v8 = +[AMSKeychain certificateKeychainLabelsForOptions:v6];
    id v9 = NSString;
    id v10 = [v8 objectAtIndexedSubscript:0];
    SecKeyRef v11 = [v9 stringWithFormat:@"%@.publickey", v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    [v12 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    [v12 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
    int v14 = AMSSecItemCopyMatchingWithTimeFault(v12, (uint64_t)&v64);
    uint64_t v15 = +[AMSLogConfig sharedKeychainConfig];
    id v16 = (void *)v15;
    if (v14)
    {
      if (!v15)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = a4;
        uint64_t v19 = objc_opt_class();
        uint64_t v58 = v8;
        id v20 = a1;
        id v21 = v19;
        id v22 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        id v66 = v19;
        a4 = v18;
        __int16 v67 = 2114;
        id v68 = v22;
        __int16 v69 = 2114;
        id v70 = v11;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Did not lookup public key: %{public}@", buf, 0x20u);

        a1 = v20;
        id v8 = v58;
      }

      AMSError(600, @"Keychain Error", @"Public Key Not Found", 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v15)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v23 = [v16 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_opt_class();
        id v56 = v24;
        AMSLogKey();
        id v25 = v57 = a1;
        SecKeyRef v26 = v64;
        [MEMORY[0x1E4F28ED0] numberWithInt:0];
        v27 = id v59 = a4;
        *(_DWORD *)buf = 138544386;
        id v66 = v24;
        __int16 v67 = 2114;
        id v68 = v25;
        __int16 v69 = 2114;
        id v70 = v11;
        __int16 v71 = 2114;
        SecKeyRef v72 = v26;
        __int16 v73 = 2114;
        v74 = v27;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success for lookup of public key label: %{public}@, key: %{public}@, status: %{public}@", buf, 0x34u);

        a4 = v59;
        a1 = v57;
      }
      id v7 = 0;
    }
  }
  if ([v6 style] == 3 || !objc_msgSend(v6, "style"))
  {
    id v63 = v7;
    id v35 = [a1 certificateChainStringsForOptions:v6 error:&v63];
    id v36 = v63;

    v37 = [v35 firstObject];
    if ([v37 length])
    {
      CFDataRef v38 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v37 options:0];
      if (v38)
      {
        id v39 = SecCertificateCreateWithData(0, v38);
        if (v39)
        {
          id v40 = v39;
          SecKeyRef v64 = SecCertificateCopyKey(v39);
          CFRelease(v40);
        }
      }
    }
    id v7 = v36;
  }
  else if ([v6 style] == 1 || objc_msgSend(v6, "style") == 2)
  {
    id v28 = +[AMSLogConfig sharedKeychainConfig];
    if (!v28)
    {
      id v28 = +[AMSLogConfig sharedConfig];
    }
    SecKeyRef v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = objc_opt_class();
      id v31 = v30;
      v32 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      id v66 = v30;
      __int16 v67 = 2114;
      id v68 = v32;
      __int16 v69 = 2112;
      id v70 = v6;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to lookup public key for options: %@", buf, 0x20u);
    }
    id v62 = v7;
    uint64_t v33 = +[AMSKeychain _copyLegacyPublicKeyForOptions:v6 error:&v62];
    id v34 = v62;

    SecKeyRef v64 = v33;
    if (v33)
    {
      id v7 = v34;
    }
    else
    {
      BOOL v41 = +[AMSLogConfig sharedKeychainConfig];
      if (!v41)
      {
        BOOL v41 = +[AMSLogConfig sharedConfig];
      }
      id v42 = [v41 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v43 = objc_opt_class();
        id v44 = v43;
        id v45 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138544130;
        id v66 = v43;
        __int16 v67 = 2114;
        id v68 = v45;
        __int16 v69 = 2112;
        id v70 = v6;
        __int16 v71 = 2114;
        SecKeyRef v72 = (SecKeyRef)v34;
        _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find public key for options: %@, error: %{public}@", buf, 0x2Au);
      }
      id v61 = v34;
      BOOL v46 = +[AMSKeychain _generateLegacyKeypairForOptions:v6 error:&v61];
      id v7 = v61;

      if (v46)
      {
        id v47 = +[AMSLogConfig sharedKeychainConfig];
        if (!v47)
        {
          id v47 = +[AMSLogConfig sharedConfig];
        }
        id v48 = [v47 OSLogObject];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = objc_opt_class();
          id v50 = v49;
          id v51 = AMSSetLogKeyIfNeeded();
          *(_DWORD *)buf = 138543874;
          id v66 = v49;
          __int16 v67 = 2114;
          id v68 = v51;
          __int16 v69 = 2112;
          id v70 = v6;
          _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting second lookup for public key for options: %@", buf, 0x20u);
        }
        id v60 = v7;
        __int16 v52 = +[AMSKeychain _copyLegacyPublicKeyForOptions:v6 error:&v60];
        id v53 = v60;

        SecKeyRef v64 = v52;
        id v7 = v53;
      }
    }
  }
  if (a4) {
    *a4 = v7;
  }
  __int16 v54 = v64;

  return v54;
}

+ (BOOL)deleteCertificateChainWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v85 = AMSSetLogKeyIfNeeded();
  id v5 = +[AMSKeychain certificateKeychainLabelsForOptions:v4];
  if ([v5 count] == 2)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Delete Certificate: Invalid number of keychain labels: %@ options: %@", v5, v4];
    id v6 = AMSError(600, @"Keychain Error", v7, 0);
  }
  v84 = [a1 _certificatePrivateKeyLabelForOptions:v4];
  if (!v84)
  {
    id v8 = [NSString stringWithFormat:@"Delete Certificate: NULL privateKey label for options: %@", v4];
    uint64_t v9 = AMSError(600, @"Keychain Error", v8, 0);

    id v6 = (void *)v9;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v106 objects:v119 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v99 = *(void *)v107;
    id v97 = (id)*MEMORY[0x1E4F3B788];
    uint64_t v95 = *MEMORY[0x1E4F3B550];
    uint64_t v90 = *MEMORY[0x1E4F3B980];
    uint64_t v93 = *MEMORY[0x1E4F3BD08];
    uint64_t v12 = *MEMORY[0x1E4F3B978];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v107 != v99) {
          objc_enumerationMutation(obj);
        }
        if (v6)
        {
          id v26 = obj;
          uint64_t v24 = (uint64_t *)MEMORY[0x1E4F3B978];
          id v25 = (uint64_t *)MEMORY[0x1E4F3B980];
          goto LABEL_33;
        }
        int v14 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v15 setObject:v14 forKeyedSubscript:v97];
        [v15 setObject:@"apple" forKeyedSubscript:v95];
        [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v93];
        [v15 setObject:v90 forKeyedSubscript:v12];
        uint64_t v16 = SecItemDelete((CFDictionaryRef)v15);
        if (v16)
        {
          int v17 = v16;
          if (v16 == -25300)
          {
            id v18 = +[AMSLogConfig sharedConfig];
            if (!v18)
            {
              id v18 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v19 = [v18 OSLogObject];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = objc_opt_class();
              id v21 = AMSLogKey();
              *(_DWORD *)buf = 138543874;
              uint64_t v114 = v20;
              __int16 v115 = 2114;
              v116 = v21;
              __int16 v117 = 2114;
              v118 = v14;
              _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cert not found for label: %{public}@", buf, 0x20u);
            }
            id v6 = 0;
          }
          else
          {
            id v22 = NSString;
            uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
            id v18 = [v22 stringWithFormat:@"Delete Certificate: Failed to delete cert. label: %@ status: %@ options: %@", v14, v23, v4];

            id v6 = AMSKeychainError(v18, v17);
          }
        }
        else
        {
          id v6 = 0;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v106 objects:v119 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v24 = (uint64_t *)MEMORY[0x1E4F3B978];
  id v25 = (uint64_t *)MEMORY[0x1E4F3B980];
  if (!v6)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v26 setObject:v84 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    [v26 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v26 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    [v26 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*v24];
    [v26 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
    uint64_t v27 = SecItemDelete((CFDictionaryRef)v26);
    if (v27)
    {
      int v28 = v27;
      if (v27 == -25300)
      {
        SecKeyRef v29 = +[AMSLogConfig sharedConfig];
        if (!v29)
        {
          SecKeyRef v29 = +[AMSLogConfig sharedConfig];
        }
        id v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = objc_opt_class();
          v32 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v114 = v31;
          __int16 v115 = 2114;
          v116 = v32;
          __int16 v117 = 2114;
          v118 = v84;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Key (cert) not found for label: %{public}@", buf, 0x20u);
        }
        id v6 = 0;
      }
      else
      {
        uint64_t v79 = NSString;
        v80 = [MEMORY[0x1E4F28ED0] numberWithInt:v27];
        SecKeyRef v29 = [v79 stringWithFormat:@"Delete Certificate: Failed to delete cert key. label: %@ status: %@ options: %@", v84, v80, v4];

        id v6 = AMSKeychainError(v29, v28);
      }
    }
    else
    {
      id v6 = 0;
    }
LABEL_33:
  }
  id v98 = v6;
  unint64_t v33 = 0x1E4F17000uLL;
  v96 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v34 = objc_msgSend(v96, "ams_activeiTunesAccount");
  if (v34)
  {
    uint64_t v35 = [a1 _ssCertificateKeychainLabelForAccount:v34 options:v4];
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v37 = *MEMORY[0x1E4F3B788];
    v91 = (void *)v35;
    [v36 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    uint64_t v38 = *MEMORY[0x1E4F3B550];
    [v36 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    uint64_t v39 = *v24;
    uint64_t v94 = *v25;
    objc_msgSend(v36, "setObject:forKeyedSubscript:");
    uint64_t v40 = SecItemDelete((CFDictionaryRef)v36);
    uint64_t v100 = v38;
    if (v40)
    {
      uint64_t v41 = v40;
      id v42 = +[AMSLogConfig sharedConfig];
      if (!v42)
      {
        id v42 = +[AMSLogConfig sharedConfig];
      }
      __int16 v43 = [v42 OSLogObject];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = objc_opt_class();
        uint64_t v86 = v37;
        id v45 = (void *)MEMORY[0x1E4F28ED0];
        id v81 = v44;
        BOOL v46 = [v45 numberWithInt:v41];
        *(_DWORD *)buf = 138543874;
        uint64_t v114 = (uint64_t)v44;
        __int16 v115 = 2114;
        v116 = v85;
        __int16 v117 = 2114;
        v118 = v46;
        _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices laef cert with status: %{public}@", buf, 0x20u);

        uint64_t v37 = v86;
      }

      uint64_t v38 = v100;
    }
    id v47 = [a1 _ssKeychainLabelForAccount:v34 options:v4];
    [v36 setObject:v47 forKeyedSubscript:v37];
    [v36 setObject:@"apple" forKeyedSubscript:v38];
    [v36 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:v39];
    [v36 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
    uint64_t v48 = SecItemDelete((CFDictionaryRef)v36);
    if (v48)
    {
      uint64_t v49 = v48;
      id v50 = +[AMSLogConfig sharedConfig];
      if (!v50)
      {
        id v50 = +[AMSLogConfig sharedConfig];
      }
      id v51 = [v50 OSLogObject];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v87 = v37;
        __int16 v52 = objc_opt_class();
        id v53 = (void *)MEMORY[0x1E4F28ED0];
        id v82 = v52;
        __int16 v54 = v53;
        unint64_t v33 = 0x1E4F17000;
        id v55 = [v54 numberWithInt:v49];
        *(_DWORD *)buf = 138543874;
        uint64_t v114 = (uint64_t)v52;
        uint64_t v37 = v87;
        __int16 v115 = 2114;
        v116 = v85;
        __int16 v117 = 2114;
        v118 = v55;
        _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices key with status: %{public}@", buf, 0x20u);
      }
      uint64_t v38 = v100;
    }

    uint64_t v56 = v94;
  }
  else
  {
    uint64_t v37 = *MEMORY[0x1E4F3B788];
    uint64_t v38 = *MEMORY[0x1E4F3B550];
    uint64_t v56 = *v25;
    uint64_t v39 = *v24;
  }
  v101 = v4;
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v57 setObject:@"com.apple.itunesstored:intermediate-cert" forKeyedSubscript:v37];
  [v57 setObject:@"apple" forKeyedSubscript:v38];
  [v57 setObject:v56 forKeyedSubscript:v39];
  v92 = v57;
  uint64_t v58 = SecItemDelete((CFDictionaryRef)v57);
  if (v58)
  {
    uint64_t v59 = v58;
    id v60 = +[AMSLogConfig sharedConfig];
    if (!v60)
    {
      id v60 = +[AMSLogConfig sharedConfig];
    }
    id v61 = [v60 OSLogObject];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = objc_opt_class();
      id v63 = (void *)MEMORY[0x1E4F28ED0];
      id v64 = v62;
      v65 = [v63 numberWithInt:v59];
      *(_DWORD *)buf = 138543874;
      uint64_t v114 = (uint64_t)v62;
      __int16 v115 = 2114;
      v116 = v85;
      __int16 v117 = 2114;
      v118 = v65;
      _os_log_impl(&dword_18D554000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices intermediate cert with status: %{public}@", buf, 0x20u);
    }
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v66 = objc_msgSend(*(id *)(v33 + 2504), "ams_sharedAccountStore");
  __int16 v67 = objc_msgSend(v66, "ams_iTunesAccounts");

  uint64_t v68 = [v67 countByEnumeratingWithState:&v102 objects:v112 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v103;
    uint64_t v71 = *MEMORY[0x1E4F18C28];
    do
    {
      for (uint64_t j = 0; j != v69; ++j)
      {
        if (*(void *)v103 != v70) {
          objc_enumerationMutation(v67);
        }
        __int16 v73 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        v74 = NSString;
        uint64_t v75 = objc_msgSend(v73, "ams_DSID");
        v76 = [v74 stringWithFormat:@"mt-tid-%@", v75];

        uint64_t v110 = v71;
        v111 = v76;
        __int16 v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        objc_msgSend(v73, "ams_removeCookiesMatchingProperties:", v77);
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v102 objects:v112 count:16];
    }
    while (v69);
  }

  if (a4) {
    *a4 = v98;
  }

  return v98 == 0;
}

+ (BOOL)storePrimaryCert:(__SecCertificate *)a3 intermediateCert:(__SecCertificate *)a4 privateKey:(__SecKey *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v59 = a1;
  uint64_t v12 = [a1 _certificatePrivateKeyLabelForOptions:v11];
  uint64_t v13 = (void *)v12;
  if (a5 && v12)
  {
    int v14 = 0;
    if (a4) {
      goto LABEL_9;
    }
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"Store Certificate: Invalid private key OR label. label: %@ options: %@", v12, v11];
    int v14 = AMSError(2, @"Keychain Error", v15, 0);

    if (a4) {
      goto LABEL_9;
    }
  }
  if (!a3 && !v14)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Store Certificate: Invalid certs. options: %@", v11];
    int v14 = AMSError(2, @"Keychain Error", v16, 0);
  }
LABEL_9:
  int v17 = +[AMSKeychain certificateKeychainLabelsForOptions:v11];
  id v18 = v17;
  if (!v14)
  {
    if ([v17 count] == 2)
    {
      int v14 = 0;
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Store Certificate: Invalid number of keychain labels: %@ options: %@", v18, v11];
      int v14 = AMSError(2, @"Keychain Error", v19, 0);
    }
  }
  id v60 = 0;
  [v59 deleteCertificateChainWithOptions:v11 error:&v60];
  id v57 = v60;
  if (v57)
  {
    uint64_t v56 = a3;
    uint64_t v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      uint64_t v20 = +[AMSLogConfig sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = v18;
      uint64_t v23 = objc_opt_class();
      id v55 = v23;
      AMSLogKey();
      id v24 = v11;
      id v25 = a4;
      v27 = id v26 = a5;
      *(_DWORD *)buf = 138543874;
      id v62 = v23;
      id v18 = v22;
      __int16 v63 = 2114;
      id v64 = v27;
      __int16 v65 = 2114;
      id v66 = v14;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete certs. Error: %{public}@", buf, 0x20u);

      a5 = v26;
      a4 = v25;
      id v11 = v24;
    }
    a3 = v56;
  }
  if (a5 && !v14)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v28 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
    [v28 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v28 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    [v28 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    [v28 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    [v28 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];
    uint64_t v29 = ((uint64_t (*)(id, void))[v59 secItemAddFunc])(v28, 0);
    if (v29)
    {
      int v30 = v29;
      uint64_t v31 = a3;
      v32 = NSString;
      [MEMORY[0x1E4F28ED0] numberWithInt:v29];
      v34 = unint64_t v33 = v18;
      uint64_t v35 = [v32 stringWithFormat:@"Store Certificate: Failed to save privateKey for label: %@ status: %@ options: %@", v13, v34, v11];

      id v18 = v33;
      int v14 = AMSKeychainError(v35, v30);

      a3 = v31;
    }
    else
    {
      int v14 = 0;
    }
  }
  if (a3 && !v14)
  {
    id v36 = a4;
    uint64_t v37 = [v18 objectAtIndexedSubscript:0];
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v38 setObject:*MEMORY[0x1E4F3B980] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    [v38 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v38 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    [v38 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];
    [v38 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    uint64_t v39 = ((uint64_t (*)(id, void))[v59 secItemAddFunc])(v38, 0);
    if (v39)
    {
      int v40 = v39;
      uint64_t v41 = NSString;
      [MEMORY[0x1E4F28ED0] numberWithInt:v39];
      v43 = id v42 = v18;
      id v44 = [v41 stringWithFormat:@"Store Certificate: Failed to save client cert for label: %@ status: %@ options: %@", v37, v43, v11];

      id v18 = v42;
      int v14 = AMSKeychainError(v44, v40);
    }
    else
    {
      int v14 = 0;
    }

    a4 = v36;
  }
  if (a4 && !v14)
  {
    id v45 = v13;
    BOOL v46 = [v18 objectAtIndexedSubscript:1];
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v47 setObject:*MEMORY[0x1E4F3B980] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
    [v47 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v47 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    [v47 setObject:a4 forKeyedSubscript:*MEMORY[0x1E4F3BD48]];
    [v47 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F3B788]];
    uint64_t v48 = ((uint64_t (*)(id, void))[v59 secItemAddFunc])(v47, 0);
    if (v48)
    {
      int v49 = v48;
      id v50 = NSString;
      [MEMORY[0x1E4F28ED0] numberWithInt:v48];
      v52 = id v51 = v18;
      id v53 = [v50 stringWithFormat:@"Store Certificate: Failed to save intermediate cert for label: %@ status: %@ options: %@", v46, v52, v11];

      id v18 = v51;
      int v14 = AMSKeychainError(v53, v49);
    }
    else
    {
      int v14 = 0;
    }

    uint64_t v13 = v45;
  }
  if (a7) {
    *a7 = v14;
  }

  return v14 == 0;
}

+ (BOOL)performForwardKeyMigrationForDSID:(id)a3 forceMigration:(BOOL)a4
{
  return 0;
}

+ (id)resumptionHeaders
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  v3 = [a1 _resumptionHeadersQuery];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
  int v5 = AMSSecItemCopyMatchingWithTimeFault(v4, (uint64_t)&v18);
  id v6 = 0;
  if (!v5 && v18)
  {
    id v17 = 0;
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v18 options:0 error:&v17];
    id v7 = v17;
    if (v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v10;
        __int16 v21 = 2114;
        id v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = (uint64_t)v7;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to deserialize TID continue headers. %{public}@", buf, 0x20u);
      }
    }
  }
  uint64_t v12 = +[AMSLogConfig sharedKeychainConfig];
  if (!v12)
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = AMSLogKey();
    uint64_t v15 = [v6 count];
    *(_DWORD *)buf = 138544130;
    uint64_t v20 = (uint64_t)a1;
    __int16 v21 = 2114;
    id v22 = v14;
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    __int16 v25 = 2048;
    uint64_t v26 = v5;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %ld TID headers. %ld", buf, 0x2Au);
  }
  return v6;
}

+ (void)stashResumptionHeaders:(id)a3
{
}

+ (BOOL)stashResumptionHeaders:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = off_1E559C000;
  uint64_t v9 = +[AMSLogConfig sharedKeychainConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = AMSLogKey();
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = v13;
    if (v11)
    {
      uint64_t v4 = AMSLogKey();
      [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
    }
    else
    {
      [v12 stringWithFormat:@"%@: ", v13];
    uint64_t v15 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v67 = v15;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Stashing TID headers", buf, 0xCu);
    if (v11)
    {

      uint64_t v15 = (void *)v4;
    }
  }
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v7])
  {
    [a1 _deleteResumptionHeaders];
    id v65 = 0;
    uint64_t v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v65];
    id v17 = (__CFString *)v65;
    if (v17)
    {
      id v18 = +[AMSLogConfig sharedKeychainConfig];
      if (!v18)
      {
        id v18 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v16;
        __int16 v21 = AMSLogKey();
        id v22 = NSString;
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = v23;
        if (v21)
        {
          AMSLogKey();
          a1 = (id)objc_claimAutoreleasedReturnValue();
          [v22 stringWithFormat:@"%@: [%@] ", v24, a1];
        }
        else
        {
          [v22 stringWithFormat:@"%@: ", v23];
        __int16 v25 = };
        *(_DWORD *)buf = 138543618;
        uint64_t v67 = v25;
        __int16 v68 = 2114;
        CFStringRef v69 = v17;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error occurred serializing TID continue headers. error = %{public}@", buf, 0x16u);
        if (v21)
        {

          __int16 v25 = a1;
        }

        uint64_t v16 = v20;
      }

      if (a4)
      {
        AMSError(2, @"Serialization Error", @"Error serializing headers to data", v17);
        BOOL v42 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v42 = 0;
      }
    }
    else
    {
      unint64_t v33 = [a1 _resumptionHeadersQuery];
      id v34 = (void *)[v33 mutableCopy];

      id v64 = v34;
      [v34 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
      uint64_t v35 = +[AMSLogConfig sharedKeychainConfig];
      if (!v35)
      {
        uint64_t v35 = +[AMSLogConfig sharedConfig];
      }
      id v36 = [v35 OSLogObject];
      id v62 = a4;
      __int16 v63 = v16;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = AMSLogKey();
        id v38 = NSString;
        uint64_t v39 = objc_opt_class();
        uint64_t v40 = v39;
        if (v37)
        {
          uint64_t v16 = AMSLogKey();
          [v38 stringWithFormat:@"%@: [%@] ", v40, v16];
        }
        else
        {
          [v38 stringWithFormat:@"%@: ", v39];
        uint64_t v41 = };
        AMSHashIfNeeded(v64);
        __int16 v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v67 = v41;
        __int16 v68 = 2114;
        CFStringRef v69 = v43;
        _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Beginning keychain query: %{public}@", buf, 0x16u);
        if (v37)
        {

          uint64_t v41 = v16;
        }
      }
      OSStatus v44 = ((uint64_t (*)(void *, void))[a1 secItemAddFunc])(v64, 0);
      id v45 = +[AMSLogConfig sharedKeychainConfig];
      if (!v45)
      {
        id v45 = +[AMSLogConfig sharedConfig];
      }
      BOOL v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        id v47 = AMSLogKey();
        uint64_t v48 = NSString;
        uint64_t v49 = objc_opt_class();
        uint64_t v50 = v49;
        if (v47)
        {
          uint64_t v61 = AMSLogKey();
          [v48 stringWithFormat:@"%@: [%@] ", v50, v61];
        }
        else
        {
          [v48 stringWithFormat:@"%@: ", v49];
        id v51 = };
        *(_DWORD *)buf = 138543618;
        uint64_t v67 = v51;
        __int16 v68 = 1024;
        LODWORD(v69) = v44;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Keychain query complete. status = %d", buf, 0x12u);
        if (v47)
        {

          id v51 = (void *)v61;
        }
      }
      BOOL v42 = v44 == 0;
      if (v44)
      {
        __int16 v52 = +[AMSLogConfig sharedKeychainConfig];
        if (!v52)
        {
          __int16 v52 = +[AMSLogConfig sharedConfig];
        }
        id v53 = [v52 OSLogObject];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          __int16 v54 = AMSLogKey();
          id v55 = NSString;
          uint64_t v56 = objc_opt_class();
          uint64_t v57 = v56;
          if (v54)
          {
            AMSLogKey();
            id v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
            [v55 stringWithFormat:@"%@: [%@] ", v57, v8];
          }
          else
          {
            [v55 stringWithFormat:@"%@: ", v56];
          uint64_t v58 = };
          CFStringRef v59 = SecCopyErrorMessageString(v44, 0);
          *(_DWORD *)buf = 138543618;
          uint64_t v67 = v58;
          __int16 v68 = 2114;
          CFStringRef v69 = v59;
          _os_log_impl(&dword_18D554000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to stash TID continue headers. error: %{public}@", buf, 0x16u);
          if (v54)
          {

            uint64_t v58 = v8;
          }
        }
        if (v62)
        {
          AMSKeychainError(@"Failed to insert TID headers into keychain", v44);
          *id v62 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      uint64_t v16 = v63;
    }
  }
  else
  {
    uint64_t v26 = +[AMSLogConfig sharedKeychainConfig];
    if (!v26)
    {
      uint64_t v26 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = AMSLogKey();
      uint64_t v29 = NSString;
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = v30;
      if (v28)
      {
        AMSLogKey();
        a1 = (id)objc_claimAutoreleasedReturnValue();
        [v29 stringWithFormat:@"%@: [%@] ", v31, a1];
      }
      else
      {
        [v29 stringWithFormat:@"%@: ", v30];
      v32 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v67 = v32;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize TID continue headers", buf, 0xCu);
      if (v28)
      {

        v32 = a1;
      }
    }
    if (a4)
    {
      AMSError(2, @"Invalid Headers", @"Headers are not a valid JSON object.", 0);
      BOOL v42 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v42 = 0;
    }
  }

  return v42;
}

+ (BOOL)deleteKeyPairWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = AMSSetLogKeyIfNeeded();
  uint64_t v7 = +[AMSKeychain keychainLabelForOptions:v5];
  id v8 = (void *)MEMORY[0x1E4F3B6E8];
  uint64_t v9 = (void *)MEMORY[0x1E4F3B6D8];
  uint64_t v10 = (void *)MEMORY[0x1E4F3B550];
  id v11 = (void *)MEMORY[0x1E4F3B9A0];
  uint64_t v12 = (void *)MEMORY[0x1E4F3B978];
  uint64_t v13 = (void *)MEMORY[0x1E4F3B788];
  if (v7)
  {
    id obj = a1;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:v7 forKeyedSubscript:*v13];
    [v14 setObject:@"apple" forKeyedSubscript:*v10];
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    uint64_t v15 = v12;
    [v14 setObject:*v11 forKeyedSubscript:*v12];
    [v14 setObject:*v8 forKeyedSubscript:*v9];
    uint64_t v16 = SecItemDelete((CFDictionaryRef)v14);
    id v17 = v8;
    if (v16)
    {
      id v18 = (void *)v6;
      if (v16 == -25300)
      {
        uint64_t v19 = +[AMSLogConfig sharedConfig];
        if (!v19)
        {
          uint64_t v19 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v20 = [v19 OSLogObject];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v68 = (id)objc_opt_class();
          __int16 v69 = 2114;
          uint64_t v70 = v6;
          __int16 v71 = 2114;
          uint64_t v72 = v7;
          __int16 v21 = v17;
          id v22 = v68;
          _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Key (legacy) not found for label: %{public}@", buf, 0x20u);

          id v17 = v21;
          id v18 = (void *)v6;
        }

        id v53 = 0;
      }
      else
      {
        uint64_t v26 = NSString;
        uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithInt:v16];
        id v28 = [v26 stringWithFormat:@"Keypair Delete: Failed to delete legacy key. label: %@ status: %@ options: %@", v7, v27, v5];

        AMSError(600, @"Keychain Error", v28, 0);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F3B788];
      id v11 = (void *)MEMORY[0x1E4F3B9A0];
    }
    else
    {
      id v53 = 0;
      id v18 = (void *)v6;
    }

    a1 = obj;
    __int16 v25 = (void *)MEMORY[0x1E4F3B6D8];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F3B978];
    [NSString stringWithFormat:@"Keypair Delete: Invalid keychain label for options: %@", v5];
    v24 = uint64_t v23 = v11;
    AMSError(600, @"Keychain Error", v24, 0);
    id v53 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = v23;
    id v17 = v8;
    id v18 = (void *)v6;
    __int16 v25 = v9;
  }
  id v55 = (void *)v7;
  __int16 v54 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v57 = objc_msgSend(v54, "ams_activeiTunesAccount");
  if (v57)
  {
    uint64_t v29 = v15;
    uint64_t v30 = [a1 _ssKeychainLabelForAccount:v57 options:v5];
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v31 setObject:*v17 forKeyedSubscript:*v25];
    [v31 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
    [v31 setObject:*v11 forKeyedSubscript:*v29];
    [v31 setObject:v30 forKeyedSubscript:*v13];
    uint64_t v32 = SecItemDelete((CFDictionaryRef)v31);
    if (v32)
    {
      uint64_t v33 = v32;
      id v34 = +[AMSLogConfig sharedConfig];
      if (!v34)
      {
        id v34 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = objc_opt_class();
        uint64_t v37 = (void *)MEMORY[0x1E4F28ED0];
        id v38 = v36;
        uint64_t v39 = [v37 numberWithInt:v33];
        *(_DWORD *)buf = 138543874;
        id v68 = v36;
        __int16 v69 = 2114;
        uint64_t v70 = (uint64_t)v18;
        __int16 v71 = 2114;
        uint64_t v72 = (uint64_t)v39;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No deletion of legacy StoreServices keys with status: %{public}@", buf, 0x20u);
      }
    }
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v40 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v41 = objc_msgSend(v40, "ams_iTunesAccounts");

  id obja = v41;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v61;
    uint64_t v45 = *MEMORY[0x1E4F18C28];
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v61 != v44) {
          objc_enumerationMutation(obja);
        }
        id v47 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v48 = NSString;
        uint64_t v49 = objc_msgSend(v47, "ams_DSID");
        uint64_t v50 = [v48 stringWithFormat:@"mt-tid-%@", v49];

        uint64_t v64 = v45;
        id v65 = v50;
        id v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        objc_msgSend(v47, "ams_removeCookiesMatchingProperties:", v51);
      }
      uint64_t v43 = [obja countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v43);
  }

  if (a4) {
    *a4 = v53;
  }

  return v53 == 0;
}

+ (id)legacyAttestationForOptions:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 regenerateKeys])
  {
    uint64_t v6 = +[AMSLogConfig sharedKeychainConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      uint64_t v10 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v8;
      __int16 v41 = 2112;
      uint64_t v42 = v10;
      __int16 v43 = 2114;
      id v44 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] WARNING - Property options.generateKeys is ignored at this layer: %{public}@", buf, 0x20u);
    }
  }
  id v38 = 0;
  id v11 = +[AMSKeychain _legacyAttestationForOptions:v5 error:&v38];
  id v12 = v38;
  if (v12)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = v15;
      id v17 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v15;
      __int16 v41 = 2114;
      uint64_t v42 = v17;
      __int16 v43 = 2114;
      id v44 = v12;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attestation failed with error: %{public}@", buf, 0x20u);
    }
  }
  if (!objc_msgSend(v12, "ams_hasDomain:code:", *MEMORY[0x1E4F25268], -3))
  {
LABEL_30:
    if (!a4) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  id v18 = +[AMSLogConfig sharedKeychainConfig];
  if (!v18)
  {
    id v18 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    id v21 = v20;
    id v22 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v40 = v20;
    __int16 v41 = 2114;
    uint64_t v42 = v22;
    __int16 v43 = 2112;
    id v44 = v5;
    __int16 v45 = 2112;
    id v46 = v12;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attestation failed with options: %@, error: %@", buf, 0x2Au);
  }
  id v37 = 0;
  BOOL v23 = +[AMSKeychain _generateLegacyKeypairForOptions:v5 error:&v37];
  id v24 = v37;
  if (!v23)
  {
    uint64_t v27 = +[AMSLogConfig sharedKeychainConfig];
    if (!v27)
    {
      uint64_t v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = objc_opt_class();
      id v33 = v32;
      id v34 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v32;
      __int16 v41 = 2114;
      uint64_t v42 = v34;
      __int16 v43 = 2114;
      id v44 = v24;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-generation of keys failed with error: %{public}@", buf, 0x20u);
    }
    id v26 = v24;
    uint64_t v25 = (uint64_t)v11;
    goto LABEL_29;
  }
  id v36 = v24;
  uint64_t v25 = +[AMSKeychain _legacyAttestationForOptions:v5 error:&v36];
  id v26 = v36;

  if (v26)
  {
    uint64_t v27 = +[AMSLogConfig sharedKeychainConfig];
    if (!v27)
    {
      uint64_t v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_opt_class();
      id v30 = v29;
      id v31 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v29;
      __int16 v41 = 2114;
      uint64_t v42 = v31;
      __int16 v43 = 2114;
      id v44 = v26;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-attestation failed with error: %{public}@", buf, 0x20u);
    }
LABEL_29:

    id v11 = (void *)v25;
    goto LABEL_30;
  }
  id v11 = (void *)v25;
  if (a4) {
LABEL_31:
  }
    *a4 = v12;
LABEL_32:

  return v11;
}

+ (id)certificateKeychainLabelsForOptions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 clientCertLabel];
  uint64_t v6 = [v3 intermediateCertLabel];
  uint64_t v7 = (void *)v6;
  if (!v5 || !v6)
  {
    uint64_t v8 = [v3 purpose];
    if (v8 == 1)
    {
      unint64_t v11 = [v3 style];
      if (v11 > 5 || ((1 << v11) & 0x31) == 0) {
        goto LABEL_15;
      }
      uint64_t v10 = @"com.apple.AppleMediaServices.cert.X509.client.extended";
    }
    else
    {
      if (v8) {
        goto LABEL_15;
      }
      uint64_t v9 = [v3 style];
      if ((unint64_t)(v9 - 4) >= 2)
      {
        if (v9 == 3)
        {
          [v4 addObject:@"com.apple.AppleMediaServices.cert.watch.client.primary"];
          id v12 = @"com.apple.AppleMediaServices.cert.watch.intermediate.primary";
          goto LABEL_14;
        }
        if (v9) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = @"com.apple.AppleMediaServices.cert.X509.client.primary";
    }
    [v4 addObject:v10];
    id v12 = @"com.apple.AppleMediaServices.cert.X509.client.intermediate";
LABEL_14:
    [v4 addObject:v12];
    goto LABEL_20;
  }
  [v4 addObject:v5];
  [v4 addObject:v7];
LABEL_15:
  uint64_t v13 = +[AMSLogConfig sharedKeychainConfig];
  if (!v13)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  id v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = AMSSetLogKeyIfNeeded();
    id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
    id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
    int v21 = 138544130;
    uint64_t v22 = v15;
    __int16 v23 = 2114;
    id v24 = v16;
    __int16 v25 = 2114;
    id v26 = v17;
    __int16 v27 = 2114;
    id v28 = v18;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate certificate keychain labels for keychain options: %{public}@ %{public}@", (uint8_t *)&v21, 0x2Au);
  }
LABEL_20:
  uint64_t v19 = (void *)[v4 copy];

  return v19;
}

+ (id)keychainLabelForOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 style] != 1 && objc_msgSend(v3, "style") != 2) {
    goto LABEL_6;
  }
  uint64_t v4 = [v3 purpose];
  if (!v4)
  {
    id v5 = @"com.apple.AppleMediaServices.primaryKey";
    goto LABEL_12;
  }
  if (v4 == 1)
  {
    id v5 = @"com.apple.AppleMediaServices.extendedKey";
  }
  else
  {
LABEL_6:
    uint64_t v6 = +[AMSLogConfig sharedKeychainConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSSetLogKeyIfNeeded();
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
      int v13 = 138544130;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate legacy keychain label for keychain options: %{public}@ %{public}@", (uint8_t *)&v13, 0x2Au);
    }
    id v5 = 0;
  }
LABEL_12:

  return v5;
}

+ (__SecAccessControl)copyAccessControlRefWithAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = AMSSetLogKeyIfNeeded();
  if (![v8 style]
    || [v8 style] == 4
    || [v8 style] == 3
    || [v8 style] == 5)
  {
    uint64_t v35 = 0;
    uint64_t v10 = (id *)&v35;
    unint64_t v11 = +[AMSKeychain copyCertificatePrivateKeyWithContext:0 account:v7 options:v8 error:&v35];
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v10 = (id *)&v34;
    unint64_t v11 = +[AMSKeychain copyPrivateKeyWithContext:0 account:v7 options:v8 error:&v34];
  }
  id v12 = v11;
  id v13 = *v10;
  if (!v13 && v12)
  {
    CFDictionaryRef v14 = SecKeyCopyAttributes(v12);
    if (v14)
    {
      CFDictionaryRef v15 = v14;
      Value = CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F3B548]);
      if (Value && (__int16 v17 = Value, TypeID = SecAccessControlGetTypeID(), TypeID == CFGetTypeID(v17)))
      {
        __int16 v19 = (__SecAccessControl *)CFRetain(v17);
      }
      else
      {
        id v26 = +[AMSLogConfig sharedConfig];
        if (!v26)
        {
          id v26 = +[AMSLogConfig sharedConfig];
        }
        __int16 v27 = [v26 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          id v28 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v37 = v28;
          __int16 v38 = 2114;
          uint64_t v39 = v9;
          id v29 = v28;
          _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed for no ACL associated with key", buf, 0x16u);
        }
        __int16 v19 = 0;
      }
      CFRelease(v15);
    }
    else
    {
      id v30 = +[AMSLogConfig sharedConfig];
      if (!v30)
      {
        id v30 = +[AMSLogConfig sharedConfig];
      }
      id v31 = [v30 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v37 = v32;
        __int16 v38 = 2114;
        uint64_t v39 = v9;
        id v33 = v32;
        _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed to fetch key attributes", buf, 0x16u);
      }
      __int16 v19 = 0;
    }
    goto LABEL_31;
  }
  uint64_t v20 = +[AMSLogConfig sharedConfig];
  if (!v20)
  {
    uint64_t v20 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    id v37 = v22;
    __int16 v38 = 2114;
    uint64_t v39 = v9;
    __int16 v40 = 2114;
    id v41 = v13;
    id v23 = v22;
    _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL lookup failed for no private key: %{public}@", buf, 0x20u);
  }
  __int16 v19 = 0;
  id v24 = 0;
  if (v12)
  {
LABEL_31:
    CFRelease(v12);
    id v24 = v19;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (a5) {
LABEL_18:
  }
    *a5 = v13;
LABEL_19:

  return v24;
}

+ (__SecAccessControl)createAccessControlRefWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = AMSSetLogKeyIfNeeded();
  id v8 = +[AMSLogConfig sharedKeychainConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = [v6 description];
    AMSHashIfNeeded(v11);
    id v12 = (__CFError *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v10;
    __int16 v37 = 2114;
    __int16 v38 = v7;
    __int16 v39 = 2112;
    CFErrorRef v40 = v12;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating access control reference with options: %@", buf, 0x20u);
  }
  CFErrorRef error = 0;
  SecAccessControlRef v13 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B5B8], 0x40000000uLL, &error);
  CFDictionaryRef v14 = v13;
  if (error)
  {
    CFDictionaryRef v15 = +[AMSLogConfig sharedKeychainConfig];
    if (!v15)
    {
      CFDictionaryRef v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v17;
      __int16 v37 = 2114;
      __int16 v38 = v7;
      __int16 v39 = 2114;
      CFErrorRef v40 = error;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create access controll reference with error: %{public}@", buf, 0x20u);
    }

    CFErrorRef v18 = error;
    __int16 v19 = error;
    if (error) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v13)
  {
    id v23 = +[AMSLogConfig sharedKeychainConfig];
    if (!v23)
    {
      id v23 = +[AMSLogConfig sharedConfig];
    }
    id v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v25;
      __int16 v37 = 2114;
      __int16 v38 = v7;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create access control reference", buf, 0x16u);
    }

    id v26 = @"Create ACL: Failed to create ACL reference";
    goto LABEL_36;
  }
  uint64_t v21 = [v6 purpose];
  if (v21 == 1)
  {
    uint64_t v22 = [a1 _extendedConstraintsWithOptions:v6];
  }
  else
  {
    if (v21)
    {
LABEL_31:
      id v31 = +[AMSLogConfig sharedKeychainConfig];
      if (!v31)
      {
        id v31 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v33;
        __int16 v37 = 2114;
        __int16 v38 = v7;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create ACL constraints", buf, 0x16u);
      }

      id v26 = @"Create ACL: Failed to create ACL constraints";
LABEL_36:
      __int16 v19 = AMSError(600, @"Keychain Error", v26, 0);
      goto LABEL_37;
    }
    uint64_t v22 = [a1 _primaryConstraintsWithOptions:v6];
  }
  __int16 v27 = (void *)v22;
  if (!v22) {
    goto LABEL_31;
  }
  SecAccessControlSetConstraints();
  id v28 = +[AMSLogConfig sharedKeychainConfig];
  if (!v28)
  {
    id v28 = +[AMSLogConfig sharedConfig];
  }
  id v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = v30;
    __int16 v37 = 2114;
    __int16 v38 = v7;
    _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully configured ACL constraints", buf, 0x16u);
  }

  __int16 v19 = 0;
LABEL_37:
  CFErrorRef v18 = error;
  if (error) {
LABEL_11:
  }
    CFRelease(v18);
LABEL_12:
  if (a4) {
    *a4 = v19;
  }

  return v14;
}

+ (id)_extendedConstraintsWithOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = AMSSetLogKeyIfNeeded();
  uint64_t v5 = [v3 style];

  if (v5 == 3)
  {
    id v6 = +[AMSLogConfig sharedKeychainConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Extended ACL is not supported on watchOS", buf, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFErrorRef v18 = @"pbioc";
    uint64_t v9 = objc_opt_new();
    __int16 v19 = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v6 setObject:v10 forKeyedSubscript:@"cbio"];

    [v6 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmuc"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = @"pbioc";
    unint64_t v11 = objc_opt_new();
    uint64_t v17 = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v7 setObject:v12, @"cbio", v16 forKeyedSubscript];

    [v7 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmuc"];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"oa"];
    [v13 setObject:v6 forKeyedSubscript:@"ock"];
    [v13 setObject:v14 forKeyedSubscript:@"odel"];
    [v13 setObject:v7 forKeyedSubscript:@"osgn"];
    id v8 = (void *)[v13 copy];
  }
  return v8;
}

+ (id)_primaryConstraints
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:&unk_1EDD01378 forKeyedSubscript:@"pkofn"];
  [v2 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v24[0] = @"pbioc";
  id v3 = objc_opt_new();
  v24[1] = @"pbiot";
  v25[0] = v3;
  v25[1] = &unk_1EDD01378;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 setObject:v4 forKeyedSubscript:@"cbio"];

  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cbtn"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:");
  [v5 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v22[0] = @"pbioc";
  id v6 = objc_opt_new();
  v22[1] = @"pbiot";
  v23[0] = v6;
  v23[1] = &unk_1EDD01360;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v5 setObject:v7 forKeyedSubscript:@"cbio"];

  [v5 setObject:v2 forKeyedSubscript:@"ckon"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:&unk_1EDD01378 forKeyedSubscript:@"pkofn"];
  [v8 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v20[0] = @"pbioc";
  uint64_t v9 = objc_opt_new();
  v20[1] = @"pbiot";
  v21[0] = v9;
  v21[1] = &unk_1EDD01378;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v8 setObject:v10 forKeyedSubscript:@"cbio"];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cbtn"];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:&unk_1EDD01360 forKeyedSubscript:@"pkofn"];
  [v11 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmoc"];
  [v11 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v18[0] = @"pbioc";
  id v12 = objc_opt_new();
  v18[1] = @"pbiot";
  v19[0] = v12;
  v19[1] = &unk_1EDD01360;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v11 setObject:v13 forKeyedSubscript:@"cbio"];

  [v11 setObject:v8 forKeyedSubscript:@"ckon"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"oa"];
  [v14 setObject:v5 forKeyedSubscript:@"ock"];
  [v14 setObject:v15 forKeyedSubscript:@"odel"];
  [v14 setObject:v11 forKeyedSubscript:@"osgn"];
  id v16 = (void *)[v14 copy];

  return v16;
}

+ (id)_primaryConstraintsForMac
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:");
  objc_msgSend(v2, "setObject:forKeyedSubscript:");
  v24[0] = @"pbioc";
  id v3 = objc_opt_new();
  v24[1] = @"pbiot";
  v25[0] = v3;
  v25[1] = &unk_1EDD01378;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 setObject:v4 forKeyedSubscript:@"cbio"];

  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cbtn"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:&unk_1EDD01360 forKeyedSubscript:@"pkofn"];
  [v5 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmuc"];
  v22[0] = @"pbioc";
  id v6 = objc_opt_new();
  v22[1] = @"pbiot";
  v23[0] = v6;
  v23[1] = &unk_1EDD01360;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v5 setObject:v7 forKeyedSubscript:@"cbio"];

  [v5 setObject:v2 forKeyedSubscript:@"ckon"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:&unk_1EDD01378 forKeyedSubscript:@"pkofn"];
  [v8 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmuc"];
  v20[0] = @"pbioc";
  uint64_t v9 = objc_opt_new();
  v20[1] = @"pbiot";
  v21[0] = v9;
  v21[1] = &unk_1EDD01378;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v8 setObject:v10 forKeyedSubscript:@"cbio"];

  uint64_t v11 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cbtn"];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:&unk_1EDD01360 forKeyedSubscript:@"pkofn"];
  [v12 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmuc"];
  v18[0] = @"pbioc";
  id v13 = objc_opt_new();
  v18[1] = @"pbiot";
  v19[0] = v13;
  v19[1] = &unk_1EDD01360;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v12 setObject:v14 forKeyedSubscript:@"cbio"];

  [v12 setObject:v8 forKeyedSubscript:@"ckon"];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v15 setObject:v11 forKeyedSubscript:@"oa"];
  [v15 setObject:v5 forKeyedSubscript:@"ock"];
  [v15 setObject:v11 forKeyedSubscript:@"odel"];
  [v15 setObject:v12 forKeyedSubscript:@"osgn"];
  id v16 = (void *)[v15 copy];

  return v16;
}

+ (id)_primaryConstraintsForOpticID
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v14[0] = @"pbioc";
  id v3 = objc_opt_new();
  v14[1] = @"pbiot";
  v15[0] = v3;
  v15[1] = &unk_1EDD01390;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 setObject:v4 forKeyedSubscript:@"cbio"];

  uint64_t v5 = MEMORY[0x1E4F1CC38];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"cbtn"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v6 setObject:&unk_1EDD01360 forKeyedSubscript:@"pmoc"];
  [v6 setObject:&unk_1EDD01378 forKeyedSubscript:@"pmuc"];
  v12[0] = @"pbioc";
  id v7 = objc_opt_new();
  v12[1] = @"pbiot";
  v13[0] = v7;
  v13[1] = &unk_1EDD01390;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 setObject:v8 forKeyedSubscript:@"cbio"];

  [v6 setObject:v5 forKeyedSubscript:@"cbtn"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v5 forKeyedSubscript:@"oa"];
  [v9 setObject:v2 forKeyedSubscript:@"ock"];
  [v9 setObject:v5 forKeyedSubscript:@"odel"];
  [v9 setObject:v6 forKeyedSubscript:@"osgn"];
  uint64_t v10 = (void *)[v9 copy];

  return v10;
}

+ (id)_primaryConstraintsForWatch
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"oa"];
  [v4 setObject:v2 forKeyedSubscript:@"ock"];
  [v4 setObject:v5 forKeyedSubscript:@"odel"];
  [v4 setObject:v3 forKeyedSubscript:@"osgn"];
  id v6 = (void *)[v4 copy];

  return v6;
}

+ (id)_primaryConstraintsWithOptions:(id)a3
{
  id v4 = (void *)[a3 style];
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 1uLL:
      id v4 = [a1 _primaryConstraints];
      break;
    case 2uLL:
    case 4uLL:
      id v4 = [a1 _primaryConstraintsForMac];
      break;
    case 3uLL:
      id v4 = [a1 _primaryConstraintsForWatch];
      break;
    case 5uLL:
      id v4 = [a1 _primaryConstraintsForOpticID];
      break;
    default:
      break;
  }
  return v4;
}

+ (id)_ssCertificateKeychainLabelForAccount:(id)a3 options:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _ssKeychainLabelForAccount:a3 options:v6];
  if (v7)
  {
    id v8 = [NSString stringWithFormat:@"%@-cert", v7];
  }
  else
  {
    id v9 = +[AMSLogConfig sharedKeychainConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      id v13 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      id v16 = v11;
      __int16 v17 = 2114;
      CFErrorRef v18 = v13;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find legacy StoreServices certificate label for options: %{public}@", buf, 0x20u);
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)_ssKeychainLabelForAccount:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 purpose];
  if (v7 == 1)
  {
    uint64_t v10 = NSString;
    id v9 = objc_msgSend(v5, "ams_DSID");
    [v10 stringWithFormat:@"com.apple.itunesstored:%@-ext", v9];
    goto LABEL_5;
  }
  if (!v7)
  {
    id v8 = NSString;
    id v9 = objc_msgSend(v5, "ams_DSID");
    [v8 stringWithFormat:@"com.apple.itunesstored:%@", v9];
    uint64_t v11 = LABEL_5:;

    goto LABEL_11;
  }
  id v12 = +[AMSLogConfig sharedKeychainConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_opt_class();
    id v15 = v14;
    id v16 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543874;
    __int16 v19 = v14;
    __int16 v20 = 2114;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find legacy StoreServices keychain label for options: %{public}@", buf, 0x20u);
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_certificatePrivateKeyLabelForOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 style]
    && [v3 style] != 4
    && [v3 style] != 5
    && [v3 style] != 3)
  {
    goto LABEL_8;
  }
  uint64_t v4 = [v3 purpose];
  if (!v4)
  {
    id v5 = @"com.apple.AppleMediaServices.cert.X509.primary";
    goto LABEL_14;
  }
  if (v4 == 1)
  {
    id v5 = @"com.apple.AppleMediaServices.cert.X509.extended";
  }
  else
  {
LABEL_8:
    id v6 = +[AMSLogConfig sharedKeychainConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSSetLogKeyIfNeeded();
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "purpose"));
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "style"));
      int v13 = 138544130;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      id v16 = v9;
      __int16 v17 = 2114;
      CFErrorRef v18 = v10;
      __int16 v19 = 2114;
      __int16 v20 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate certificate privateKey keychain labels. options: %{public}@ %{public}@", (uint8_t *)&v13, 0x2Au);
    }
    id v5 = 0;
  }
LABEL_14:

  return v5;
}

+ (__SecKey)_copyLegacyPrivateKeyForOptions:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = 0;
  id v6 = +[AMSKeychain keychainLabelForOptions:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v7 setObject:*MEMORY[0x1E4F3B6E8] forKeyedSubscript:*MEMORY[0x1E4F3B6D8]];
  objc_msgSend(v7, "ams_setNullableObject:forKey:", v6, *MEMORY[0x1E4F3B788]);
  [v7 setObject:*MEMORY[0x1E4F3B9A0] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v7 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3BC80]];
  id v9 = [v5 prompt];
  objc_msgSend(v7, "ams_setNullableObject:forKey:", v9, *MEMORY[0x1E4F3BD18]);

  uint64_t v10 = AMSSecItemCopyMatchingWithTimeFault(v7, (uint64_t)&v26);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = AMSKeychainError(@"Private Key: Failed to lookup private key", (int)v10);
    int v13 = +[AMSLogConfig sharedKeychainConfig];
    if (!v13)
    {
      int v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = objc_opt_class();
      uint64_t v25 = v6;
      id v16 = a4;
      id v17 = v15;
      CFErrorRef v18 = AMSSetLogKeyIfNeeded();
      __int16 v19 = [MEMORY[0x1E4F28ED0] numberWithInt:v11];
      *(_DWORD *)buf = 138544130;
      id v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      id v32 = v5;
      __int16 v33 = 2114;
      uint64_t v34 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key with options: %@, status: %{public}@", buf, 0x2Au);

      a4 = v16;
      id v6 = v25;
    }
  }
  else
  {
    if (v26)
    {
      id v12 = 0;
      if (!a4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    id v12 = AMSError(600, @"Keychain Error", @"Private Key: Failed to lookup private key", 0);
    int v13 = +[AMSLogConfig sharedKeychainConfig];
    if (!v13)
    {
      int v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = objc_opt_class();
      id v23 = v22;
      uint64_t v24 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      id v28 = v22;
      __int16 v29 = 2114;
      uint64_t v30 = v24;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key with options: %@", buf, 0x20u);
    }
  }

  if (a4) {
LABEL_7:
  }
    *a4 = v12;
LABEL_8:
  __int16 v20 = v26;

  return v20;
}

+ (__SecKey)_copyLegacyPublicKeyForOptions:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v5 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:a3 error:&v18];
  id v6 = v18;
  if (!v5)
  {
    id v7 = 0;
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v7 = SecKeyCopyPublicKey(v5);
  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedKeychainConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v10;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully copied public key", buf, 0x16u);
    }
    uint64_t v13 = (uint64_t)v6;
  }
  else
  {
    uint64_t v13 = AMSError(600, @"Keychain Error", @"Public Key: Failed to copy public key", 0);

    uint64_t v8 = +[AMSLogConfig sharedKeychainConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      id v16 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v14;
      __int16 v21 = 2114;
      __int16 v22 = v16;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to copy public key representation", buf, 0x16u);
    }
  }

  CFRelease(v5);
  id v6 = (id)v13;
  if (a4) {
LABEL_15:
  }
    *a4 = v6;
LABEL_16:

  return v7;
}

+ (void)_deleteResumptionHeaders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = [a1 _resumptionHeadersQuery];
  uint64_t v3 = SecItemDelete(v2);
  if (v3 != -25303 && v3 != -25300 && v3 != 0)
  {
    uint64_t v6 = v3;
    id v7 = +[AMSLogConfig sharedMediaConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = AMSLogKey();
      id v12 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to delete resumption headers. %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
}

+ (BOOL)_generateLegacyKeypairForOptions:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  SecKeyRef publicKey = 0;
  SecKeyRef privateKey = 0;
  CFErrorRef error = 0;
  id v47 = 0;
  [(id)objc_opt_class() deleteKeyPairWithOptions:v5 error:&v47];
  uint64_t v6 = (__CFError *)v47;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = 0;
    goto LABEL_39;
  }
  SecAccessControlRef v9 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B5B8], 0x40000002uLL, &error);
  if (v9) {
    BOOL v10 = error == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v16 = [v5 purpose];
    if (v16 == 1)
    {
      uint64_t v17 = +[AMSKeychain _extendedConstraintsWithOptions:v5];
    }
    else
    {
      if (v16) {
        goto LABEL_26;
      }
      uint64_t v17 = +[AMSKeychain _primaryConstraintsWithOptions:v5];
    }
    if (v17)
    {
      id v46 = (void *)v17;
      SecAccessControlSetConstraints();
      id v18 = +[AMSLogConfig sharedKeychainConfig];
      if (!v18)
      {
        id v18 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = objc_opt_class();
        id v21 = v20;
        __int16 v22 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        __int16 v52 = v20;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v22;
        __int16 v55 = 2112;
        id v56 = v5;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Configured keypair ACL constraints for options: %@", buf, 0x20u);
      }
      uint64_t v23 = +[AMSKeychain keychainLabelForOptions:v5];
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B548]];
      [v24 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
      uint64_t v25 = MEMORY[0x1E4F1CC38];
      [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
      [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F3B6B0]];
      __int16 v45 = (void *)v23;
      objc_msgSend(v24, "ams_setNullableObject:forKey:", v23, *MEMORY[0x1E4F3B788]);
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v26 setObject:*MEMORY[0x1E4F3B8A8] forKeyedSubscript:*MEMORY[0x1E4F3B890]];
      [v26 setObject:*MEMORY[0x1E4F3B740] forKeyedSubscript:*MEMORY[0x1E4F3B718]];
      [v26 setObject:&unk_1EDD013A8 forKeyedSubscript:*MEMORY[0x1E4F3B708]];
      [v26 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F3BC18]];
      OSStatus v27 = SecKeyGeneratePair((CFDictionaryRef)v26, &publicKey, &privateKey);
      BOOL v8 = v27 == 0;
      if (v27)
      {
        id v28 = +[AMSLogConfig sharedConfig];
        __int16 v29 = [v28 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = objc_opt_class();
          id v43 = v30;
          uint64_t v31 = AMSSetLogKeyIfNeeded();
          *(_DWORD *)buf = 138543618;
          __int16 v52 = v30;
          __int16 v53 = 2114;
          uint64_t v54 = v31;
          id v32 = (void *)v31;
          _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@]: Failed to create keypair", buf, 0x16u);
        }
        AMSKeychainError(@"Generate Keypair: Failed to generate keypair", v27);
        id v7 = (__CFError *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v38 = +[AMSLogConfig sharedKeychainConfig];
        if (!v38)
        {
          __int16 v38 = +[AMSLogConfig sharedConfig];
        }
        __int16 v39 = [v38 OSLogObject];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          CFErrorRef v40 = objc_opt_class();
          id v44 = v40;
          uint64_t v41 = AMSSetLogKeyIfNeeded();
          *(_DWORD *)buf = 138543874;
          __int16 v52 = v40;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v41;
          __int16 v55 = 2112;
          id v56 = v5;
          _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Keypair generated for options: %@", buf, 0x20u);
        }
        id v7 = 0;
      }

      goto LABEL_37;
    }
LABEL_26:
    __int16 v33 = +[AMSLogConfig sharedKeychainConfig];
    if (!v33)
    {
      __int16 v33 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = objc_opt_class();
      id v36 = v35;
      __int16 v37 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      __int16 v52 = v35;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v37;
      __int16 v55 = 2112;
      id v56 = v5;
      _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to sepecify access control constraints for options: %@", buf, 0x20u);
    }
    AMSError(600, @"Keychain Error", @"Generate Keypair: Failed to generate ACL constraints", 0);
    id v7 = (__CFError *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = 0;
    goto LABEL_37;
  }
  id v7 = error;
  id v11 = +[AMSLogConfig sharedKeychainConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = objc_opt_class();
    id v14 = v13;
    __int16 v15 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    __int16 v52 = v13;
    __int16 v53 = 2114;
    uint64_t v54 = (uint64_t)v15;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate access control reference", buf, 0x16u);
  }
  BOOL v8 = 0;
  if (v9)
  {
LABEL_37:
    CFRelease(v9);
    if (privateKey) {
      CFRelease(privateKey);
    }
  }
LABEL_39:
  if (publicKey) {
    CFRelease(publicKey);
  }
  if (error) {
    CFRelease(error);
  }
  if (a4) {
    *a4 = v7;
  }

  return v8;
}

+ (id)_legacyAttestationForOptions:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFTypeRef cf = 0;
  if ([v5 style] == 1 || objc_msgSend(v5, "style") == 2)
  {
    uint64_t v6 = +[AMSKeychain keychainLabelForOptions:v5];
    if (!v6)
    {
      int v13 = [NSString stringWithFormat:@"Keychain Attestation: Invalid keychain label for options: %@", v5];
      AMSError(600, @"Keychain Error", v13, 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_29:
      id v12 = 0;
LABEL_45:
      if (a4) {
        *a4 = v11;
      }
      id v20 = v12;

      id v21 = v20;
      goto LABEL_48;
    }
    id v52 = 0;
    id v7 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:v5 error:&v52];
    id v8 = v52;
    if (!v7)
    {
      __int16 v22 = +[AMSLogConfig sharedKeychainConfig];
      if (!v22)
      {
        __int16 v22 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = objc_opt_class();
        id v48 = v24;
        uint64_t v25 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138544130;
        __int16 v55 = v24;
        __int16 v56 = 2114;
        uint64_t v57 = (uint64_t)v25;
        __int16 v58 = 2112;
        id v59 = v5;
        __int16 v60 = 2114;
        id v61 = v8;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find private key for options: %@, error: %{public}@", buf, 0x2Au);
      }
      id v51 = v8;
      BOOL v26 = +[AMSKeychain _generateLegacyKeypairForOptions:v5 error:&v51];
      id v11 = v51;

      if (!v26) {
        goto LABEL_24;
      }
      OSStatus v27 = +[AMSLogConfig sharedKeychainConfig];
      if (!v27)
      {
        OSStatus v27 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = objc_opt_class();
        id v47 = v29;
        uint64_t v30 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        __int16 v55 = v29;
        __int16 v56 = 2114;
        uint64_t v57 = (uint64_t)v30;
        __int16 v58 = 2112;
        id v59 = v5;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting second lookup for private key for options: %@", buf, 0x20u);
      }
      id v50 = v11;
      id v7 = +[AMSKeychain _copyLegacyPrivateKeyForOptions:v5 error:&v50];
      id v8 = v50;

      id v11 = v8;
      if (!v7)
      {
LABEL_24:
        uint64_t v31 = +[AMSLogConfig sharedKeychainConfig];
        if (!v31)
        {
          uint64_t v31 = +[AMSLogConfig sharedConfig];
        }
        id v32 = [v31 OSLogObject];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = objc_opt_class();
          id v34 = v33;
          uint64_t v35 = AMSSetLogKeyIfNeeded();
          *(_DWORD *)buf = 138543874;
          __int16 v55 = v33;
          __int16 v56 = 2114;
          uint64_t v57 = (uint64_t)v35;
          __int16 v58 = 2112;
          id v59 = v5;
          _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate private key for options: %@", buf, 0x20u);
        }
        goto LABEL_29;
      }
    }
    uint64_t v9 = SecKeyCopySystemKey();
    BOOL v10 = (const void *)v9;
    if (cf)
    {
      id v11 = (id)cf;

      id v12 = 0;
      if (!v10)
      {
LABEL_43:
        CFRelease(v7);
        if (cf) {
          CFRelease(cf);
        }
        goto LABEL_45;
      }
    }
    else
    {
      if (!v9)
      {
        __int16 v39 = [NSString stringWithFormat:@"Keychain Attestation: Attesting key lookup failed for options: %@", v5];
        AMSError(600, @"Keychain Error", v39, 0);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = 0;
        goto LABEL_43;
      }
      uint64_t Attestation = SecKeyCreateAttestation();
      __int16 v37 = (void *)Attestation;
      if (cf)
      {
        id v11 = (id)cf;

        uint64_t v38 = 0;
        id v12 = 0;
        if (!v37) {
          goto LABEL_42;
        }
      }
      else
      {
        if (!Attestation)
        {
          id v46 = [NSString stringWithFormat:@"Keychain Attestation: Failed to create attestation data for options: %@", v5];
          AMSError(600, @"Keychain Error", v46, 0);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          id v12 = 0;
          goto LABEL_42;
        }
        CFErrorRef v40 = +[AMSLogConfig sharedKeychainConfig];
        if (!v40)
        {
          CFErrorRef v40 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v41 = [v40 OSLogObject];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = objc_opt_class();
          id v49 = v42;
          uint64_t v43 = AMSSetLogKeyIfNeeded();
          *(_DWORD *)buf = 138543874;
          __int16 v55 = v42;
          __int16 v56 = 2114;
          uint64_t v57 = v43;
          id v44 = (void *)v43;
          __int16 v58 = 2112;
          id v59 = v5;
          _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Generating attestation for options: %@", buf, 0x20u);
        }
        uint64_t v38 = [v37 base64EncodedStringWithOptions:0];
        id v11 = v8;
      }
      CFRelease(v37);
      id v12 = (void *)v38;
    }
LABEL_42:
    CFRelease(v10);
    goto LABEL_43;
  }
  id v14 = +[AMSLogConfig sharedKeychainConfig];
  if (!v14)
  {
    id v14 = +[AMSLogConfig sharedConfig];
  }
  __int16 v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    id v18 = AMSSetLogKeyIfNeeded();
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "style"));
    *(_DWORD *)buf = 138543874;
    __int16 v55 = v16;
    __int16 v56 = 2114;
    uint64_t v57 = (uint64_t)v18;
    __int16 v58 = 2114;
    id v59 = v19;
    _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ** WARNING ** Failing attestation for incorrect attestation style: %{public}@", buf, 0x20u);
  }
  id v20 = [NSString stringWithFormat:@"Keychain Attestation: Invalid attestation style for options: %@", v5];
  AMSError(600, @"Keychain Error", v20, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = 0;
LABEL_48:

  return v21;
}

+ (id)_resumptionHeadersQuery
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *MEMORY[0x1E4F3BD08];
  [v2 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F3BD08]];
  uint64_t v4 = *MEMORY[0x1E4F3B550];
  [v2 setObject:@"apple" forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v3];
  [v2 setObject:@"com.apple.AppleMediaServices.resumptionHeaders" forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v2 setObject:*MEMORY[0x1E4F3B988] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  [v2 setObject:@"apple" forKeyedSubscript:v4];
  return v2;
}

+ (id)publicKeyHeaderWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__40;
  OSStatus v27 = __Block_byref_object_dispose__40;
  id v28 = objc_alloc_init(AMSDaemonConnection);
  BOOL v10 = [(id)v24[5] keychainServiceProxy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke;
  v18[3] = &unk_1E55A34F0;
  id v11 = v7;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  __int16 v22 = &v23;
  id v14 = [v10 thenWithBlock:v18];
  uint64_t v17 = 0;
  __int16 v15 = [v14 resultWithError:&v17];

  _Block_object_dispose(&v23, 8);
  return v15;
}

AMSMutablePromise *__66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke_2;
  v11[3] = &unk_1E55A34C8;
  id v8 = v4;
  uint64_t v9 = a1[7];
  id v12 = v8;
  uint64_t v13 = v9;
  [v3 getPublicKeyHeaderWithAccount:v5 options:v6 signatureResult:v7 completion:v11];

  return v8;
}

void __66__AMSKeychain_publicKeyHeaderWithAccount_options_signatureResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finishWithResult:a2];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

+ (void)secItemAddFunc
{
  return (void *)_secItemAddFunc;
}

+ (void)setSecItemAddFunc:(void *)a3
{
  if (+[AMSUnitTests isRunningUnitTests]) {
    _secItemAddFunc = (uint64_t)a3;
  }
}

+ (void)secItemCopyMatchingFunc
{
  return _secItemCopyMatchingFunc;
}

+ (void)setSecItemCopyMatchingFunc:(void *)a3
{
  if (+[AMSUnitTests isRunningUnitTests]) {
    _secItemCopyMatchingFunc = (uint64_t (*)(void, void))a3;
  }
}

@end