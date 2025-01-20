@interface AMSAuthKitUpdateResult
+ (BOOL)supportsSecureCoding;
+ (id)_createUpdatedAccount:(id)a3 usingAuthenticationResults:(id)a4 options:(id)a5;
- (ACAccount)account;
- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 credentialSource:(unint64_t)a5 options:(id)a6;
- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 options:(id)a5;
- (AMSAuthKitUpdateResult)initWithCoder:(id)a3;
- (NSDictionary)authenticationResults;
- (id)description;
- (unint64_t)credentialSource;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSAuthKitUpdateResult

- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSAuthKitUpdateResult;
  v11 = [(AMSAuthKitUpdateResult *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [(id)objc_opt_class() _createUpdatedAccount:v8 usingAuthenticationResults:v9 options:v10];
    account = v11->_account;
    v11->_account = (ACAccount *)v12;

    uint64_t v14 = [v9 copy];
    authenticationResults = v11->_authenticationResults;
    v11->_authenticationResults = (NSDictionary *)v14;
  }
  return v11;
}

- (unint64_t)credentialSource
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__AMSAuthKitUpdateResult_credentialSource__block_invoke;
  v4[3] = &unk_1E559F2A8;
  v4[4] = self;
  v4[5] = &v5;
  __42__AMSAuthKitUpdateResult_credentialSource__block_invoke((uint64_t)v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__AMSAuthKitUpdateResult_credentialSource__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) account];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "ams_lastAuthenticationCredentialSource");
}

+ (id)_createUpdatedAccount:(id)a3 usingAuthenticationResults:(id)a4 options:(id)a5
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
  uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  if (!v10
    || (objc_msgSend(v7, "ams_altDSID"),
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isEqualToString:v10],
        v13,
        (v14 & 1) != 0))
  {
    int v15 = 0;
    if (!v11) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  v16 = objc_msgSend(v7, "ams_altDSID");

  if (v16)
  {
    objc_super v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      objc_super v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v88 = v11;
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      objc_msgSend(v7, "ams_altDSID");
      v21 = v84 = v10;
      AMSHashIfNeeded(v21);
      v22 = id v80 = v9;
      v23 = AMSHashIfNeeded(v84);
      *(_DWORD *)buf = 138544130;
      uint64_t v92 = v19;
      v11 = v88;
      __int16 v93 = 2114;
      v94 = v20;
      __int16 v95 = 2114;
      v96 = v22;
      __int16 v97 = 2114;
      v98 = v23;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated altDSID. oldAltDSID = %{public}@ | newAltDSID = %{public}@", buf, 0x2Au);

      id v10 = v84;
      id v9 = v80;
    }
  }
  objc_msgSend(v7, "ams_setAltDSID:", v10);
  int v15 = 1;
  if (v11)
  {
LABEL_12:
    v24 = objc_msgSend(v7, "ams_DSID");
    char v25 = [v24 isEqualToNumber:v11];

    if ((v25 & 1) == 0)
    {
      v26 = objc_msgSend(v7, "ams_DSID");

      if (v26)
      {
        v27 = +[AMSLogConfig sharedAccountsConfig];
        if (!v27)
        {
          v27 = +[AMSLogConfig sharedConfig];
        }
        v28 = [v27 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = objc_opt_class();
          v29 = AMSLogKey();
          objc_msgSend(v7, "ams_DSID");
          v30 = v85 = v10;
          AMSHashIfNeeded(v30);
          v31 = id v81 = v9;
          v32 = AMSHashIfNeeded(v11);
          *(_DWORD *)buf = 138544130;
          uint64_t v92 = v78;
          __int16 v93 = 2114;
          v94 = v29;
          __int16 v95 = 2114;
          v96 = v31;
          __int16 v97 = 2114;
          v98 = v32;
          _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated DSID. oldDSID = %{public}@ | newDSID = %{public}@", buf, 0x2Au);

          id v10 = v85;
          id v9 = v81;
        }
      }
      objc_msgSend(v7, "ams_setDSID:", v11);
      int v15 = 1;
    }
  }
LABEL_20:
  if (v12)
  {
    v33 = [v7 username];
    char v34 = [v33 isEqualToString:v12];

    if ((v34 & 1) == 0)
    {
      v35 = [v7 username];

      if (v35)
      {
        v36 = +[AMSLogConfig sharedAccountsConfig];
        if (!v36)
        {
          v36 = +[AMSLogConfig sharedConfig];
        }
        v37 = [v36 OSLogObject];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v89 = v11;
          uint64_t v38 = objc_opt_class();
          v39 = AMSLogKey();
          [v7 username];
          v40 = v86 = v10;
          AMSHashIfNeeded(v40);
          v41 = id v82 = v9;
          v42 = AMSHashIfNeeded(v12);
          *(_DWORD *)buf = 138544130;
          uint64_t v92 = v38;
          v11 = v89;
          __int16 v93 = 2114;
          v94 = v39;
          __int16 v95 = 2114;
          v96 = v41;
          __int16 v97 = 2114;
          v98 = v42;
          _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us an updated username. oldUsername = %{public}@ | newUsername = %{public}@", buf, 0x2Au);

          id v10 = v86;
          id v9 = v82;
        }
      }
      [v7 setUsername:v12];
LABEL_31:
      v90 = v11;
      v43 = +[AMSLogConfig sharedAccountsConfig];
      if (!v43)
      {
        v43 = +[AMSLogConfig sharedConfig];
      }
      v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = objc_opt_class();
        v46 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v92 = v45;
        __int16 v93 = 2114;
        v94 = v46;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] AuthKit gave us updated identifiers. We'll attempt to find an existing account that matches the new identifiers.", buf, 0x16u);
      }
      v47 = (void *)MEMORY[0x1E4F179C8];
      v48 = [v9 clientInfo];
      v49 = [v48 accountMediaType];
      v50 = objc_msgSend(v47, "ams_sharedAccountStoreForMediaType:", v49);

      if (objc_msgSend(v7, "ams_isiCloudAccount"))
      {
        v87 = v10;
        v51 = objc_msgSend(v50, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v10, v90, v12, *MEMORY[0x1E4F17750]);
      }
      else
      {
        if (!objc_msgSend(v7, "ams_isiTunesAccount"))
        {
LABEL_55:

          v11 = v90;
          goto LABEL_56;
        }
        v87 = v10;
        v51 = objc_msgSend(v50, "ams_iTunesAccountWithAltDSID:DSID:username:", v10, v90, v12);
      }
      v52 = v51;
      if (v51)
      {
        v83 = v9;
        v53 = [v51 identifier];
        v54 = [v7 identifier];
        int v55 = [v53 isEqualToString:v54];

        uint64_t v56 = +[AMSLogConfig sharedAccountsConfig];
        v57 = (void *)v56;
        if (v55)
        {
          if (!v56)
          {
            v57 = +[AMSLogConfig sharedConfig];
          }
          v58 = [v57 OSLogObject];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v59 = objc_opt_class();
            v60 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v92 = v59;
            __int16 v93 = 2114;
            v94 = v60;
            _os_log_impl(&dword_18D554000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The new identifiers are for the account we're already working with.", buf, 0x16u);
          }
          id v61 = v7;
        }
        else
        {
          if (!v56)
          {
            v57 = +[AMSLogConfig sharedConfig];
          }
          v79 = v12;
          v62 = [v57 OSLogObject];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v63 = objc_opt_class();
            v64 = AMSLogKey();
            v65 = [v52 hashedDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v92 = v63;
            __int16 v93 = 2114;
            v94 = v64;
            __int16 v95 = 2114;
            v96 = v65;
            _os_log_impl(&dword_18D554000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The new identifiers are for a different existing account. existingAccount = %{public}@", buf, 0x20u);
          }
          v57 = objc_msgSend(v7, "ams_altDSID");
          v58 = objc_msgSend(v7, "ams_DSID");
          v66 = [v7 username];
          v67 = [v83 clientInfo];
          v68 = [v67 accountMediaType];
          int v69 = objc_msgSend(v7, "ams_isActiveForMediaType:", v68);

          id v61 = v52;
          objc_msgSend(v61, "ams_setAltDSID:", v57);
          objc_msgSend(v61, "ams_setDSID:", v58);
          [v61 setUsername:v66];
          if (v69)
          {
            v70 = [v83 clientInfo];
            v71 = [v70 accountMediaType];
            objc_msgSend(v61, "ams_setActive:forMediaType:", 1, v71);
          }
          uint64_t v12 = v79;
        }

        id v7 = v61;
        id v9 = v83;
      }
      id v10 = v87;
      goto LABEL_55;
    }
  }
  if (v15) {
    goto LABEL_31;
  }
LABEL_56:
  v72 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  if (v72) {
    objc_msgSend(v7, "ams_setPassword:", v72);
  }
  uint64_t v73 = *MEMORY[0x1E4F4EDF0];
  v74 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  if (v74) {
    objc_msgSend(v7, "ams_setRawPassword:", v74);
  }
  v75 = [v8 objectForKeyedSubscript:v73];
  if (v75) {
    uint64_t v76 = 2;
  }
  else {
    uint64_t v76 = 5;
  }
  objc_msgSend(v7, "ams_setLastAuthenticationCredentialSource:", v76);

  return v7;
}

- (AMSAuthKitUpdateResult)initWithAccount:(id)a3 authenticationResults:(id)a4 credentialSource:(unint64_t)a5 options:(id)a6
{
  return [(AMSAuthKitUpdateResult *)self initWithAccount:a3 authenticationResults:a4 options:a6];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(AMSAuthKitUpdateResult *)self account];

  if (v4)
  {
    uint64_t v5 = [(AMSAuthKitUpdateResult *)self account];
    [v8 encodeObject:v5 forKey:@"kCodingKeyAccount"];
  }
  v6 = [(AMSAuthKitUpdateResult *)self authenticationResults];

  if (v6)
  {
    id v7 = [(AMSAuthKitUpdateResult *)self authenticationResults];
    [v8 encodeObject:v7 forKey:@"kCodingKeyAuthenticationResults"];
  }
}

- (AMSAuthKitUpdateResult)initWithCoder:(id)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSAuthKitUpdateResult;
  uint64_t v5 = [(AMSAuthKitUpdateResult *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:6];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAccount"];
    account = v5->_account;
    v5->_account = (ACAccount *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"kCodingKeyAuthenticationResults"];
    authenticationResults = v5->_authenticationResults;
    v5->_authenticationResults = (NSDictionary *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSAuthKitUpdateResult *)self account];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, @"account");

  uint64_t v5 = [(AMSAuthKitUpdateResult *)self authenticationResults];
  v6 = objc_msgSend(v5, "ak_redactedCopy");
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, @"authenticationResults");

  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[AMSAuthKitUpdateResult credentialSource](self, "credentialSource"));
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"credentialSource");

  id v8 = (void *)[v3 copy];
  uint64_t v9 = [self ams_generateDescriptionWithSubObjects:v8];

  return v9;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end