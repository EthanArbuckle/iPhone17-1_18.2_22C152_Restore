@interface AMSAttestation
+ (id)_attestationPListWithStyle:(unint64_t)a3 primaryAttestation:(id)a4 extendedAttestation:(id)a5 error:(id *)a6;
+ (id)_generateCertificateChainStringsForOptions:(id)a3 error:(id *)a4;
+ (id)attestationHTTPBodyDataWithStyle:(unint64_t)a3 regenerateKeys:(BOOL)a4 error:(id *)a5;
+ (id)attestationWithOptions:(id)a3 error:(id *)a4;
@end

@implementation AMSAttestation

+ (id)attestationWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = AMSSetLogKeyIfNeeded();
  if ([v6 regenerateKeys])
  {
    unint64_t v9 = [v6 style];
    if (v9 <= 5)
    {
      if (((1 << v9) & 0x39) != 0)
      {
        uint64_t v48 = 0;
        v10 = (id *)&v48;
        +[AMSKeychain deleteCertificateChainWithOptions:v6 error:&v48];
      }
      else
      {
        uint64_t v47 = 0;
        v10 = (id *)&v47;
        +[AMSKeychain deleteKeyPairWithOptions:v6 error:&v47];
      }
      id v11 = *v10;
      if (v11)
      {
        v12 = v11;
        v13 = +[AMSLogConfig sharedAttestationConfig];
        if (!v13)
        {
          v13 = +[AMSLogConfig sharedConfig];
        }
        v14 = [v13 OSLogObject];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v50 = v15;
          __int16 v51 = 2114;
          v52 = v8;
          __int16 v53 = 2114;
          id v54 = v12;
          _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attestation did not delete keys: %{public}@", buf, 0x20u);
        }
      }
    }
  }
  unint64_t v16 = [v6 style];
  if (v16 > 5)
  {
    id v19 = 0;
    goto LABEL_51;
  }
  if (((1 << v16) & 0x31) != 0)
  {
    id v46 = 0;
    v17 = +[AMSKeychain certificateChainStringsForOptions:v6 error:&v46];
    id v18 = v46;
    if (v17 && [v17 count] == 2 && !v18)
    {
      id v19 = 0;
      v20 = v17;
    }
    else
    {
      v24 = +[AMSLogConfig sharedAttestationConfig];
      if (!v24)
      {
        v24 = +[AMSLogConfig sharedConfig];
      }
      v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = (uint64_t)v26;
        __int16 v51 = 2114;
        v52 = v8;
        __int16 v53 = 2114;
        id v54 = v18;
        v27 = a4;
        id v28 = v26;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find certificates in keychain, generating new certifcates: %{public}@", buf, 0x20u);

        a4 = v27;
      }

      id v45 = v18;
      v20 = [a1 _generateCertificateChainStringsForOptions:v6 error:&v45];
      id v19 = v45;

      if (v19)
      {
        v29 = +[AMSLogConfig sharedAttestationConfig];
        if (!v29)
        {
          v29 = +[AMSLogConfig sharedConfig];
        }
        v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v50 = (uint64_t)v31;
          __int16 v51 = 2114;
          v52 = v8;
          __int16 v53 = 2114;
          id v54 = v19;
          id v32 = v31;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Certificate chain lookup and/or generation failed with error: %{public}@", buf, 0x20u);
        }
      }
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __47__AMSAttestation_attestationWithOptions_error___block_invoke;
    v43[3] = &unk_1E559EE28;
    id v44 = v7;
    [v20 enumerateObjectsUsingBlock:v43];
    v33 = v44;
  }
  else
  {
    if (((1 << v16) & 6) != 0)
    {
      id v39 = 0;
      v20 = +[AMSKeychain legacyAttestationForOptions:v6 error:&v39];
      id v19 = v39;
      if (v19)
      {
        v21 = +[AMSLogConfig sharedAttestationConfig];
        if (!v21)
        {
          v21 = +[AMSLogConfig sharedConfig];
        }
        v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v50 = v23;
          __int16 v51 = 2114;
          v52 = v8;
          __int16 v53 = 2114;
          id v54 = v19;
          _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Legacy attestation failed with error: %{public}@", buf, 0x20u);
        }
      }
      if (v20) {
        [v7 addObject:v20];
      }
      goto LABEL_47;
    }
    id v42 = 0;
    v20 = [a1 _generateCertificateChainStringsForOptions:v6 error:&v42];
    id v19 = v42;
    if (v19)
    {
      v34 = +[AMSLogConfig sharedAttestationConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v50 = v36;
        __int16 v51 = 2114;
        v52 = v8;
        __int16 v53 = 2114;
        id v54 = v19;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Certificate chain attestation failed with error: %{public}@", buf, 0x20u);
      }
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __47__AMSAttestation_attestationWithOptions_error___block_invoke_3;
    v40[3] = &unk_1E559EE28;
    id v41 = v7;
    [v20 enumerateObjectsUsingBlock:v40];
    v33 = v41;
  }

LABEL_47:
  if (v19)
  {
    if (a4) {
      *a4 = v19;
    }
    [v7 removeAllObjects];
  }
LABEL_51:
  v37 = (void *)[v7 copy];

  return v37;
}

uint64_t __47__AMSAttestation_attestationWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __47__AMSAttestation_attestationWithOptions_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)attestationHTTPBodyDataWithStyle:(unint64_t)a3 regenerateKeys:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v9 setPurpose:0];
  [(AMSKeychainOptions *)v9 setRegenerateKeys:v6];
  [(AMSKeychainOptions *)v9 setStyle:a3];
  uint64_t v10 = AMSSetLogKeyIfNeeded();
  id v35 = 0;
  uint64_t v31 = +[AMSAttestation attestationWithOptions:v9 error:&v35];
  id v11 = v35;
  if (v11)
  {
    v12 = +[AMSLogConfig sharedAttestationConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = objc_msgSend(v12, "OSLogObject", v31);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v14;
      __int16 v38 = 2114;
      uint64_t v39 = v10;
      __int16 v40 = 2114;
      id v41 = v11;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate primary attestation with error: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v15 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v15 setPurpose:1];
  [(AMSKeychainOptions *)v15 setRegenerateKeys:v6];
  [(AMSKeychainOptions *)v15 setStyle:a3];
  id v34 = v11;
  unint64_t v16 = +[AMSAttestation attestationWithOptions:v15 error:&v34];
  id v17 = v34;

  id v18 = (void *)v10;
  id v19 = a1;
  if (v17)
  {
    v20 = +[AMSLogConfig sharedAttestationConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = objc_msgSend(v20, "OSLogObject", v31);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v22;
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v18;
      __int16 v40 = 2114;
      id v41 = v17;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Extended attestation failed with error: %{public}@", buf, 0x20u);
    }
  }
  id v33 = v17;
  uint64_t v23 = (void *)v31;
  v24 = objc_msgSend(v19, "_attestationPListWithStyle:primaryAttestation:extendedAttestation:error:", a3, v31, v16, &v33, v31);
  id v25 = v33;

  if (v24)
  {
    v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v24 format:100 options:0 error:0];
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v28 = +[AMSLogConfig sharedAttestationConfig];
  if (!v28)
  {
    id v28 = +[AMSLogConfig sharedConfig];
  }
  v29 = [v28 OSLogObject];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v30;
    __int16 v38 = 2114;
    uint64_t v39 = (uint64_t)v18;
    _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create attestation plist", buf, 0x16u);
  }

  v26 = 0;
  uint64_t v23 = v32;
  if (a5) {
LABEL_15:
  }
    *a5 = v25;
LABEL_16:

  return v26;
}

+ (id)_attestationPListWithStyle:(unint64_t)a3 primaryAttestation:(id)a4 extendedAttestation:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = AMSSetLogKeyIfNeeded();
  if (a3 > 5)
  {
LABEL_16:
    id v15 = 0;
    goto LABEL_41;
  }
  if (((1 << a3) & 0x39) != 0)
  {
    if ([v9 count] != 2)
    {
      unint64_t v16 = +[AMSLogConfig sharedAttestationConfig];
      if (!v16)
      {
        unint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        id v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v18;
        __int16 v39 = 2114;
        __int16 v40 = v12;
        __int16 v41 = 2114;
        uint64_t v42 = v19;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot create cert-based primary attestation with %{public}@ certs in chain.", buf, 0x20u);
      }
      v20 = NSString;
      v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      [v20 stringWithFormat:@"Incorrect number of attestation: %@", v21];
      goto LABEL_38;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0 || [v10 count] == 2)
    {
      if (v9) {
        [v11 setObject:v9 forKeyedSubscript:@"primaryX509Chain"];
      }
      if (v10) {
        [v11 setObject:v10 forKeyedSubscript:@"extendedX509Chain"];
      }
      goto LABEL_16;
    }
    v29 = +[AMSLogConfig sharedAttestationConfig];
    if (!v29)
    {
      v29 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v30 = [v29 OSLogObject];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    uint64_t v34 = objc_opt_class();
    id v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v34;
    __int16 v39 = 2114;
    __int16 v40 = v12;
    __int16 v41 = 2114;
    uint64_t v42 = v32;
    id v33 = "%{public}@: [%{public}@] Cannot create cert-based extended attestation with %{public}@ certs in chain.";
    goto LABEL_35;
  }
  if ([v9 count] != 1)
  {
    uint64_t v22 = +[AMSLogConfig sharedAttestationConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v24;
      __int16 v39 = 2114;
      __int16 v40 = v12;
      __int16 v41 = 2114;
      uint64_t v42 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Cannot create legacy-based primary attestation with %{public}@ elements in reponse.", buf, 0x20u);
    }
    v26 = NSString;
    v27 = (void *)MEMORY[0x1E4F28ED0];
    id v28 = v9;
    goto LABEL_37;
  }
  if ([v10 count] == 1)
  {
    if ([v9 count])
    {
      v13 = [v9 objectAtIndexedSubscript:0];
      [v11 setObject:v13 forKeyedSubscript:@"touchIdAttestation"];
    }
    if ([v10 count])
    {
      uint64_t v14 = [v10 objectAtIndexedSubscript:0];
      [v11 setObject:v14 forKeyedSubscript:@"extendedAttestation"];
    }
    goto LABEL_16;
  }
  v29 = +[AMSLogConfig sharedAttestationConfig];
  if (!v29)
  {
    v29 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v30 = [v29 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = objc_opt_class();
    id v32 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = v31;
    __int16 v39 = 2114;
    __int16 v40 = v12;
    __int16 v41 = 2114;
    uint64_t v42 = v32;
    id v33 = "%{public}@: [%{public}@] Cannot create legacy-based extended attestation with %{public}@ elements in reponse.";
LABEL_35:
    _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);
  }
LABEL_36:

  v26 = NSString;
  v27 = (void *)MEMORY[0x1E4F28ED0];
  id v28 = v10;
LABEL_37:
  v21 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
  [v26 stringWithFormat:@"Incorrect number of attestations: %@", v21];
  id v35 = LABEL_38:;
  AMSError(2, @"Attestation Error", v35, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (a6 && v15)
  {
    id v15 = v15;
    *a6 = v15;
  }
LABEL_41:

  return v11;
}

+ (id)_generateCertificateChainStringsForOptions:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [[AMSClientCertificateTask alloc] initWithOptions:v6];

  id v9 = [(AMSClientCertificateTask *)v8 performClientCertChainRequest];
  id v24 = 0;
  id v10 = [v9 resultWithError:&v24];
  id v11 = v24;
  if (v11)
  {
    v12 = +[AMSLogConfig sharedAttestationConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      id v15 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v15;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Create cert chain failed with error: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __67__AMSAttestation__generateCertificateChainStringsForOptions_error___block_invoke;
  uint64_t v22 = &unk_1E559EE50;
  id v16 = v7;
  id v23 = v16;
  [v10 enumerateObjectsUsingBlock:&v19];
  if (a4) {
    *a4 = v11;
  }
  id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

void __67__AMSAttestation__generateCertificateChainStringsForOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 base64EncodedStringWithOptions:0];
  [*(id *)(a1 + 32) addObject:v3];
}

@end