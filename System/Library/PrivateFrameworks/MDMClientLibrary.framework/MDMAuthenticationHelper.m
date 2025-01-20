@interface MDMAuthenticationHelper
+ (unint64_t)enrollmentMethodFromAuthenticateString:(id)a3 outParams:(id *)a4;
+ (void)performExchangeMAIDForBearerTokenAtURL:(id)a3 rmAccountIdentifier:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6;
@end

@implementation MDMAuthenticationHelper

+ (unint64_t)enrollmentMethodFromAuthenticateString:(id)a3 outParams:(id *)a4
{
  id v5 = a3;
  if (v5) {
    v6 = {;
  }
    v44[0] = 0;
    v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v6 options:1 error:v44];
    id v8 = v44[0];
    if (v8)
    {
      id v9 = v8;
      unint64_t v10 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v11 = objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    uint64_t v12 = [v11 rangeAtIndex:1];
    v39 = objc_msgSend(v5, "substringWithRange:", v12, v13);
    if (![v39 isEqualToString:@"Bearer"])
    {
      id v9 = 0;
      unint64_t v10 = 0;
      v25 = v39;
LABEL_26:

      goto LABEL_27;
    }
    v38 = v11;
    uint64_t v14 = [v11 rangeAtIndex:2];
    v16 = objc_msgSend(v5, "substringWithRange:", v14, v15);
    if (![v16 length])
    {
      id v9 = 0;
      unint64_t v10 = 0;
      v25 = v39;
LABEL_25:

      v11 = v38;
      goto LABEL_26;
    }
      @"[ \t]*");
    uint64_t v36 = v43 = 0;
    v17 = objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:");
    id v9 = v43;

    v18 = objc_opt_new();
    uint64_t v19 = [v16 length];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__MDMAuthenticationHelper_enrollmentMethodFromAuthenticateString_outParams___block_invoke;
    v40[3] = &unk_1E6CBC9F0;
    v37 = v16;
    id v41 = v16;
    id v20 = v18;
    id v42 = v20;
    v35 = v17;
    objc_msgSend(v17, "enumerateMatchesInString:options:range:usingBlock:", v41, 0, 0, v19, v40);
    v21 = [v20 objectForKeyedSubscript:@"method"];
    if (v21)
    {
      v22 = +[MDMBearerTokenAuthenticator authenticationMethod];
      if ([v21 isEqualToString:v22])
      {
        v23 = objc_opt_new();
        int v24 = [v23 validAuthParams:v20];

        if (v24)
        {
          *a4 = v20;
          unint64_t v10 = 2;
LABEL_23:
          v25 = v39;
          v31 = (void *)v36;
          v16 = v37;
          v32 = v35;
LABEL_24:

          v7 = v32;
          goto LABEL_25;
        }
      }
      else
      {
      }
      v26 = +[MDMMAIDBearerTokenAuthenticator authenticationMethod];
      if ([v21 isEqualToString:v26])
      {
        v27 = objc_opt_new();
        int v28 = [v27 validAuthParams:v20];

        if (v28)
        {
          *a4 = v20;
          unint64_t v10 = 1;
          goto LABEL_23;
        }
      }
      else
      {
      }
      v29 = +[MDMOAuth2Authenticator authenticationMethod];
      if ([v21 isEqualToString:v29])
      {
        v30 = objc_opt_new();
        int v34 = [v30 validAuthParams:v20];

        v25 = v39;
        v31 = (void *)v36;
        v16 = v37;
        v32 = v35;
        if (v34)
        {
          *a4 = v20;
          unint64_t v10 = 5;
        }
        else
        {
          unint64_t v10 = 0;
        }
        goto LABEL_24;
      }
    }
    unint64_t v10 = 0;
    goto LABEL_23;
  }
  unint64_t v10 = 0;
LABEL_28:

  return v10;
}

void __76__MDMAuthenticationHelper_enrollmentMethodFromAuthenticateString_outParams___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v10 rangeWithName:@"pname"];
  v6 = objc_msgSend(v3, "substringWithRange:", v4, v5);
  uint64_t v7 = [v10 rangeWithName:@"pvalue"];
  if (!v8) {
    uint64_t v7 = [v10 rangeWithName:@"pquoted"];
  }
  id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];
}

+ (void)performExchangeMAIDForBearerTokenAtURL:(id)a3 rmAccountIdentifier:(id)a4 anchorCertificateRefs:(id)a5 completionHandler:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v18[0] = @"method";
  uint64_t v12 = +[MDMMAIDBearerTokenAuthenticator authenticationMethod];
  v19[0] = v12;
  v18[1] = @"url";
  uint64_t v13 = [v10 absoluteString];

  v19[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __126__MDMAuthenticationHelper_performExchangeMAIDForBearerTokenAtURL_rmAccountIdentifier_anchorCertificateRefs_completionHandler___block_invoke;
  v16[3] = &unk_1E6CBCA18;
  id v17 = v8;
  id v15 = v8;
  [v11 refreshTokenWithAuthParams:v14 accountID:v9 completionHandler:v16];
}

void __126__MDMAuthenticationHelper_performExchangeMAIDForBearerTokenAtURL_rmAccountIdentifier_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = [a2 objectForKeyedSubscript:@"token"];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

@end