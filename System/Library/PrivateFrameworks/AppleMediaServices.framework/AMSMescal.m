@interface AMSMescal
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_matchSignSapURL:(id)a3 bagDictionary:(id)a4;
+ (BOOL)primeTheConnectionWithBag:(id)a3 error:(id *)a4;
+ (BOOL)primeTheConnectionWithContract:(id)a3 error:(id *)a4;
+ (BOOL)primeTheConnectionWithContract:(id)a3 logKey:(id)a4 error:(id *)a5;
+ (BOOL)shouldReprimeConnectionWithResult:(id)a3;
+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6 error:(id *)a7;
+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 error:(id *)a7;
+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7 error:(id *)a8;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_DAAPActionsForURLBagActions:(id)a3;
+ (id)_matchSignedActions:(id)a3 withURL:(id)a4;
+ (id)_signedActionDataFromRequest:(id)a3 policy:(id)a4;
+ (id)createBagForSubProfile;
+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6;
+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6;
+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7;
+ (id)signaturePromiseFromData:(id)a3 type:(int64_t)a4 bag:(id)a5;
+ (id)signaturePromiseFromRequest:(id)a3 type:(int64_t)a4 bag:(id)a5;
+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6;
+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6;
+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7;
+ (id)verificationPromiseForTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6;
@end

@implementation AMSMescal

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [a2 value];
  if (v3)
  {
    v4 = +[AMSMescalSession sessionWithType:*(void *)(a1 + 40)];
    v10 = v4;
    if (v4)
    {
      v11 = [v4 signData:v3 bag:*(void *)(a1 + 32)];
      [v11 thenWithBlock:&__block_literal_global_83];
    }
    else
    {
      v11 = AMSErrorWithFormat(2, @"Mescal Signature Failed", @"Failed to locate session for type: %d", v5, v6, v7, v8, v9, *(void *)(a1 + 40));
      +[AMSPromise promiseWithError:v11];
    v19 = };
  }
  else
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = AMSLogKey();
      v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        a1 = AMSLogKey();
        [v15 stringWithFormat:@"%@: [%@] ", v17, a1];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      v18 = };
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping mescal - unable to locate data to sign", buf, 0xCu);
      if (v14)
      {

        v18 = (void *)a1;
      }
    }
    v20 = +[AMSOptional optionalWithNil];
    v19 = +[AMSPromise promiseWithResult:v20];
  }
  return v19;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 value];

  if (v4)
  {
    uint64_t v5 = +[AMSPromise promiseWithResult:v3];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) dictionaryForKey:@"signed-actions"];
    uint64_t v7 = [v6 valuePromise];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_3;
    v11[3] = &unk_1E55A3D40;
    long long v10 = *(_OWORD *)(a1 + 40);
    id v8 = (id)v10;
    long long v12 = v10;
    uint64_t v5 = [v7 thenWithBlock:v11];
  }
  return v5;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = a2;
  uint64_t v6 = [v4 URL];
  LOBYTE(v3) = [v3 _matchSignSapURL:v6 bagDictionary:v5];

  if (v3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) HTTPBody];
    if (v7)
    {
      id v8 = [[AMSOptional alloc] initWithValue:v7];
    }
    else
    {
      id v8 = +[AMSOptional optionalWithNil];
    }
    long long v10 = v8;
    uint64_t v9 = +[AMSPromise promiseWithResult:v8];
  }
  else
  {
    uint64_t v7 = +[AMSOptional optionalWithNil];
    uint64_t v9 = +[AMSPromise promiseWithResult:v7];
  }

  return v9;
}

uint64_t __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = [*(id *)(a1 + 32) containsString:v4];
LABEL_6:

  return v5;
}

uint64_t __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = 0;
    goto LABEL_5;
  }
  id v4 = v3;

  if (!v4)
  {
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = [*(id *)(a1 + 32) containsString:v4];
LABEL_6:

  return v5;
}

+ (id)verificationPromiseForTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (v12)
  {
    if ((unint64_t)a5 <= 1) {
      int64_t v14 = 1;
    }
    else {
      int64_t v14 = a5;
    }
    v15 = [v12 dictionaryForKey:@"sign-sap-response"];
    uint64_t v16 = [v15 valuePromise];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke;
    v27[3] = &unk_1E55A3DD8;
    id v31 = a1;
    id v28 = v10;
    int64_t v32 = v14;
    id v29 = v11;
    id v30 = v13;
    uint64_t v17 = [v16 continueWithBlock:v27];
    v18 = [v17 binaryPromiseAdapter];
  }
  else
  {
    v19 = +[AMSLogConfig sharedConfig];
    if (!v19)
    {
      v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = AMSLogKey();
      v22 = NSString;
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
      v25 = };
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Mescal verification will be skipped as bag was not provided.", buf, 0xCu);
      if (v21)
      {

        v25 = a1;
      }
    }
    v18 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v18;
}

+ (id)signaturePromiseFromRequest:(id)a3 type:(int64_t)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4)
  {
    if (v9)
    {
      id v11 = [v8 HTTPMethod];
      int v12 = [v11 isEqualToString:@"POST"];

      if (v12)
      {
        v13 = [v10 dictionaryForKey:@"sign-sap-request"];
        int64_t v14 = [v13 valuePromise];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke;
        v30[3] = &unk_1E55A3D40;
        id v32 = a1;
        id v31 = v8;
        v15 = [v14 thenWithBlock:v30];
      }
      else
      {
        v13 = +[AMSOptional optionalWithNil];
        v15 = +[AMSPromise promiseWithResult:v13];
      }

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_2;
      v26[3] = &unk_1E55A3D68;
      id v19 = v10;
      id v27 = v19;
      id v29 = a1;
      id v28 = v8;
      v20 = [v15 thenWithBlock:v26];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_4;
      v22[3] = &unk_1E55A3DB0;
      int64_t v24 = a4;
      id v23 = v19;
      id v25 = a1;
      v18 = [v20 thenWithBlock:v22];

      goto LABEL_10;
    }
    uint64_t v16 = AMSError(2, @"Mescal Signature Failed", @"Bag not provided", 0);
    uint64_t v17 = +[AMSPromise promiseWithError:v16];
  }
  else
  {
    uint64_t v16 = +[AMSOptional optionalWithNil];
    uint64_t v17 = +[AMSPromise promiseWithResult:v16];
  }
  v18 = (void *)v17;

LABEL_10:
  return v18;
}

void __41__AMSMescal__matchSignedActions_withURL___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [*(id *)(a1 + 32) rangeOfString:v9 options:1] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [v7 objectForKey:*(void *)(a1 + 40)];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    }
    *a4 = 1;
  }
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

void __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke(uint64_t a1, void *a2, void *a3, char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [*(id *)(a1 + 32) rangeOfString:v7] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_2;
      v15[3] = &unk_1E559F720;
      id v16 = *(id *)(a1 + 40);
      id v9 = objc_msgSend(v8, "ams_firstObjectPassingTest:", v15);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9 != 0;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        char v10 = 1;
      }
      else
      {
        id v11 = [*(id *)(a1 + 56) _DAAPActionsForURLBagActions:v8];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke_3;
        v13[3] = &unk_1E559F720;
        id v14 = *(id *)(a1 + 40);
        int v12 = objc_msgSend(v11, "ams_firstObjectPassingTest:", v13);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12 != 0;

        char v10 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
      *a4 = v10;
    }
  }
}

+ (id)_DAAPActionsForURLBagActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "mutableCopy", (void)v16);
        uint64_t v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, objc_msgSend(v11, "length"));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          for (uint64_t j = v12;
                j != 0x7FFFFFFFFFFFFFFFLL;
                uint64_t j = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v5, 0, j + 2, objc_msgSend(v11, "length") - (j + 2)))
          {
            [v11 insertString:@"-" atIndex:j];
          }
        }
        id v14 = [v11 lowercaseString];
        [v4 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 URL];
  uint64_t v7 = [v3 _matchSignedActions:v5 withURL:v6];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) _signedActionDataFromRequest:*(void *)(a1 + 32) policy:v7];
    uint64_t v9 = [[AMSOptional alloc] initWithValue:v8];
    char v10 = +[AMSPromise promiseWithResult:v9];
  }
  else
  {
    uint64_t v8 = +[AMSOptional optionalWithNil];
    char v10 = +[AMSPromise promiseWithResult:v8];
  }

  return v10;
}

+ (id)_matchSignedActions:(id)a3 withURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 path];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__42;
    v22 = __Block_byref_object_dispose__42;
    id v23 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__AMSMescal__matchSignedActions_withURL___block_invoke;
    v14[3] = &unk_1E55A3E00;
    id v10 = v8;
    id v15 = v10;
    id v11 = v9;
    id v16 = v11;
    long long v17 = &v18;
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
    id v12 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "ams_isBagValueMissingError"))
    {
      uint64_t v8 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      id v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = AMSLogKey();
        id v16 = NSString;
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = v17;
        if (v15)
        {
          a1 = AMSLogKey();
          [v16 stringWithFormat:@"%@: [%@] ", v18, a1];
        }
        else
        {
          [v16 stringWithFormat:@"%@: ", v17];
        long long v19 = };
        id v27 = AMSLogableError(v7);
        *(_DWORD *)buf = 138543618;
        id v31 = v19;
        __int16 v32 = 2114;
        v33 = v27;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to load SAP response dictionary. Defaulting to failing verification as the requirement to verify couldn't be confirmed. Error = %{public}@", buf, 0x16u);
        if (v15)
        {

          long long v19 = (void *)a1;
        }
      }
      uint64_t v8 = +[AMSPromise promiseWithError:v7];
    }
    v26 = (void *)v8;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) currentRequest];
    id v10 = [v9 URL];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 32) originalRequest];
      id v12 = [v20 URL];
    }
    if ([*(id *)(a1 + 56) _matchSignSapURL:v12 bagDictionary:v5])
    {
      uint64_t v21 = [*(id *)(a1 + 32) response];
      v22 = objc_msgSend(v21, "ams_valueForHTTPHeaderField:", @"X-Apple-ActionSignature");

      if (v22)
      {
        id v23 = +[AMSMescalSession sessionWithType:*(void *)(a1 + 64)];
        int64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v22 options:0];
        id v25 = [v23 verifyData:*(void *)(a1 + 40) withSignature:v24 bag:*(void *)(a1 + 48)];
        v26 = [v25 promiseAdapter];

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke_29;
        v29[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v29[4] = *(void *)(a1 + 56);
        [v26 addErrorBlock:v29];
      }
      else
      {
        v26 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
      }
    }
    else
    {
      v26 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    }
  }
  return v26;
}

+ (BOOL)_matchSignSapURL:(id)a3 bagDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [v6 absoluteString];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__AMSMescal__matchSignSapURL_bagDictionary___block_invoke;
    v14[3] = &unk_1E55A3E28;
    id v10 = v8;
    id v15 = v10;
    uint64_t v17 = &v19;
    id v11 = v9;
    id v16 = v11;
    id v18 = a1;
    [v7 enumerateKeysAndObjectsUsingBlock:v14];
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6
{
  id v7 = [a1 signaturePromiseFromData:a3 type:a4 bag:a5];
  uint64_t v8 = [v7 resultWithError:a6];

  return v8;
}

+ (id)signaturePromiseFromData:(id)a3 type:(int64_t)a4 bag:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[AMSMescalSession sessionWithType:a4];
  id v16 = v10;
  if (!v8)
  {
    id v18 = @"Data not provided";
LABEL_7:
    uint64_t v19 = AMSError(2, @"Mescal Signature Failed", v18, 0);
    uint64_t v17 = +[AMSPromise promiseWithError:v19];

    goto LABEL_9;
  }
  if (!v9)
  {
    id v18 = @"Bag not provided";
    goto LABEL_7;
  }
  if (v10)
  {
    uint64_t v17 = [v10 signData:v8 bag:v9];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__AMSMescal_signaturePromiseFromData_type_bag___block_invoke;
    v22[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    void v22[4] = a1;
    [v17 addErrorBlock:v22];
  }
  else
  {
    uint64_t v20 = AMSErrorWithFormat(2, @"Mescal Signature Failed", @"Failed to locate session for type: %d", v11, v12, v13, v14, v15, a4);
    uint64_t v17 = +[AMSPromise promiseWithError:v20];
  }
LABEL_9:

  return v17;
}

void __47__AMSMescal_signaturePromiseFromData_type_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to mescal-sign data. Error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
}

id __50__AMSMescal_signaturePromiseFromRequest_type_bag___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[AMSOptional alloc] initWithValue:v2];

  id v4 = +[AMSPromise promiseWithResult:v3];

  return v4;
}

void __54__AMSMescal_verificationPromiseForTask_data_type_bag___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = AMSLogKey();
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    id v10 = };
    uint64_t v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to verify the task. Error = %{public}@", buf, 0x16u);
    if (v6)
    {

      id v10 = (void *)a1;
    }
  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_126 != -1) {
    dispatch_once(&_MergedGlobals_126, &__block_literal_global_33_1);
  }
  id v2 = (void *)qword_1EB38DD28;
  return (NSString *)v2;
}

void __26__AMSMescal_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38DD28;
  qword_1EB38DD28 = @"AMSCore";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DD30 != -1) {
    dispatch_once(&qword_1EB38DD30, &__block_literal_global_38_0);
  }
  id v2 = (void *)qword_1EB38DD38;
  return (NSString *)v2;
}

void __33__AMSMescal_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38DD38;
  qword_1EB38DD38 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (id)_signedActionDataFromRequest:(id)a3 policy:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
    id v35 = 0;
    goto LABEL_44;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"headers"];
  uint64_t v9 = v8;
  v38 = v8;
  if (v8
    && (long long v45 = 0u,
        long long v46 = 0u,
        long long v43 = 0u,
        long long v44 = 0u,
        (uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v48 count:16]) != 0))
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = [v5 valueForHTTPHeaderField:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 dataUsingEncoding:4];
          if (v16)
          {
            uint64_t v17 = (void *)v16;
            if (!v12) {
              id v12 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
            }
            [v12 appendData:v17];
          }
          uint64_t v9 = v38;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }
  id v18 = [v7 objectForKeyedSubscript:@"fields"];
  if (v18)
  {
    v37 = v7;
    uint64_t v19 = [v5 URL];
    uint64_t v20 = objc_msgSend(v19, "ams_parameters");

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v39 + 1) + 8 * j)];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [v26 dataUsingEncoding:4];
            if (v27)
            {
              id v28 = (void *)v27;
              if (!v12) {
                id v12 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
              }
              [v12 appendData:v28];
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v23);
    }

    id v7 = v37;
    uint64_t v9 = v38;
  }
  id v29 = [v7 objectForKeyedSubscript:@"path"];
  if (objc_opt_respondsToSelector())
  {
    id v30 = [v7 objectForKeyedSubscript:@"path"];
    int v31 = [v30 BOOLValue];

    if (!v31)
    {
      uint64_t v9 = v38;
      goto LABEL_43;
    }
    __int16 v32 = [v5 URL];
    id v29 = [v32 path];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [v29 dataUsingEncoding:4];
      if (v33)
      {
        uint64_t v34 = (void *)v33;
        if (!v12) {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        }
        [v12 appendData:v34];
      }
    }
    uint64_t v9 = v38;
  }

LABEL_43:
  id v35 = v12;

LABEL_44:
  return v35;
}

+ (BOOL)primeTheConnectionWithBag:(id)a3 error:(id *)a4
{
  if (a4)
  {
    AMSError(12, @"Deprecated API", @"This API has been deprecated.", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)primeTheConnectionWithContract:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = AMSGenerateLogCorrelationKey();
  LOBYTE(a4) = [a1 primeTheConnectionWithContract:v6 logKey:v7 error:a4];

  return (char)a4;
}

+ (BOOL)primeTheConnectionWithContract:(id)a3 logKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = AMSSetLogKey(a4);
  uint64_t v10 = [[AMSContractBagShim alloc] initWithBagContract:v8];

  LOBYTE(a5) = [a1 primeTheConnectionWithBag:v10 error:a5];
  return (char)a5;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = AMSGenerateLogCorrelationKey();
  uint64_t v13 = [a1 signatureFromData:v11 type:a4 bagContract:v10 logKey:v12 error:a6];

  return v13;
}

+ (id)signatureFromData:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a3;
  id v14 = AMSSetLogKey(a6);
  uint64_t v15 = [[AMSContractBagShim alloc] initWithBagContract:v12];

  uint64_t v16 = [a1 signatureFromData:v13 type:a4 bag:v15 error:a7];

  return v16;
}

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = AMSGenerateLogCorrelationKey();
  id v13 = [a1 signatureUsingRequest:v11 type:a4 bagContract:v10 logKey:v12 error:a6];

  return v13;
}

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bagContract:(id)a5 logKey:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a3;
  id v14 = AMSSetLogKey(a6);
  uint64_t v15 = [[AMSContractBagShim alloc] initWithBagContract:v12];

  uint64_t v16 = [a1 signatureUsingRequest:v13 type:a4 bag:v15 error:a7];

  return v16;
}

+ (BOOL)shouldReprimeConnectionWithResult:(id)a3
{
  return 0;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = AMSGenerateLogCorrelationKey();
  LOBYTE(a7) = [a1 verifyTask:v14 data:v13 type:a5 bagContract:v12 logKey:v15 error:a7];

  return (char)a7;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bagContract:(id)a6 logKey:(id)a7 error:(id *)a8
{
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = AMSSetLogKey(a7);
  id v18 = [[AMSContractBagShim alloc] initWithBagContract:v14];

  LOBYTE(a8) = [a1 verifyTask:v16 data:v15 type:a5 bag:v18 error:a8];
  return (char)a8;
}

+ (id)signatureUsingRequest:(id)a3 type:(int64_t)a4 bag:(id)a5 error:(id *)a6
{
  id v7 = [a1 signaturePromiseFromRequest:a3 type:a4 bag:a5];
  id v8 = [v7 resultWithError:a6];
  id v9 = [v8 value];

  return v9;
}

+ (BOOL)verifyTask:(id)a3 data:(id)a4 type:(int64_t)a5 bag:(id)a6 error:(id *)a7
{
  id v8 = [a1 verificationPromiseForTask:a3 data:a4 type:a5 bag:a6];
  LOBYTE(a7) = [v8 resultWithError:a7];

  return (char)a7;
}

@end