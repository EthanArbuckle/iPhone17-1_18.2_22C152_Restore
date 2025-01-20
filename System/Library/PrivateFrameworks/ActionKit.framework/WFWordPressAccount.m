@interface WFWordPressAccount
+ (BOOL)allowsMultipleAccounts;
+ (id)accountWithUsername:(id)a3 password:(id)a4 endpointURL:(id)a5;
+ (id)localizedServiceName;
+ (id)serviceID;
+ (id)serviceName;
+ (unint64_t)modelVersion;
+ (void)loginWithUsername:(id)a3 password:(id)a4 blogURL:(id)a5 completionHandler:(id)a6;
- (BOOL)isValid;
- (NSURL)endpointURL;
- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5;
- (id)localizedName;
- (void)refreshWithCompletionHandler:(id)a3;
- (void)setEndpointURL:(id)a3;
@end

@implementation WFWordPressAccount

- (void).cxx_destruct
{
}

- (void)setEndpointURL:(id)a3
{
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WFWordPressSessionManager);
  v6 = [(WFPasswordAccount *)self username];
  [(WFWordPressSessionManager *)v5 setUsername:v6];

  v7 = [(WFPasswordAccount *)self password];
  [(WFWordPressSessionManager *)v5 setPassword:v7];

  v8 = [(WFWordPressAccount *)self endpointURL];
  [(WFWordPressSessionManager *)v5 setEndpointURL:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__WFWordPressAccount_refreshWithCompletionHandler___block_invoke;
  v10[3] = &unk_264E5CE88;
  id v11 = v4;
  id v9 = v4;
  [(WFWordPressSessionManager *)v5 getBlogsWithCompletionHandler:v10];
}

uint64_t __51__WFWordPressAccount_refreshWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (id)localizedName
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"%1$@ (%2$@)");
  v5 = [(WFPasswordAccount *)self username];
  v6 = [(WFWordPressAccount *)self endpointURL];
  v7 = [v6 host];
  v8 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5, v7);

  return v8;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)WFWordPressAccount;
  if (![(WFPasswordAccount *)&v6 isValid]) {
    return 0;
  }
  v3 = [(WFWordPressAccount *)self endpointURL];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)decodeValueForKey:(id)a3 withCoder:(id)a4 modelVersion:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 || ![v8 isEqualToString:@"endpointURL"])
  {
    v13.receiver = self;
    v13.super_class = (Class)WFWordPressAccount;
    id v11 = [(MTLModel *)&v13 decodeValueForKey:v8 withCoder:v9 modelVersion:a5];
  }
  else
  {
    v10 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"blog"];
    id v11 = [v10 endpointURL];
  }
  return v11;
}

+ (void)loginWithUsername:(id)a3 password:(id)a4 blogURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__42371;
  v36[4] = __Block_byref_object_dispose__42372;
  id v37 = [v11 URLByAppendingPathComponent:@"xmlrpc.php"];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke;
  aBlock[3] = &unk_264E5B9A0;
  id v13 = v9;
  id v32 = v13;
  id v14 = v10;
  id v33 = v14;
  v35 = v36;
  id v15 = v12;
  id v34 = v15;
  v16 = _Block_copy(aBlock);
  v17 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 200, 100);
  v18 = [MEMORY[0x263EFC640] sharedSession];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_3;
  v26 = &unk_264E5B9C8;
  id v19 = v17;
  id v27 = v19;
  id v20 = v16;
  id v29 = v20;
  id v21 = v11;
  id v28 = v21;
  v30 = v36;
  v22 = [v18 dataTaskWithURL:v21 completionHandler:&v23];
  objc_msgSend(v22, "resume", v23, v24, v25, v26);

  _Block_object_dispose(v36, 8);
}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(WFWordPressSessionManager);
  [(WFWordPressSessionManager *)v2 setUsername:*(void *)(a1 + 32)];
  [(WFWordPressSessionManager *)v2 setPassword:*(void *)(a1 + 40)];
  [(WFWordPressSessionManager *)v2 setEndpointURL:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_2;
  v5[3] = &unk_264E5E4B8;
  id v3 = *(id *)(a1 + 48);
  objc_super v6 = v2;
  id v7 = v3;
  BOOL v4 = v2;
  [(WFWordPressSessionManager *)v4 getBlogsWithCompletionHandler:v5];
}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 length]
    && (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
  {
    id v10 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"rsd.xml"];
    id v29 = v9;
    id v11 = +[ONOXMLDocument HTMLDocumentWithData:v7 error:&v29];
    id v12 = v29;

    memset(v28, 0, sizeof(v28));
    id v13 = [v11 XPath:@"//head/link[@rel=\"EditURI\"]"];
    if ([v13 countByEnumeratingWithState:v28 objects:v30 count:16])
    {
      id v14 = NSURL;
      id v15 = [**((id **)&v28[0] + 1) valueForAttribute:@"href"];
      uint64_t v16 = [v14 URLWithString:v15];
      v17 = (void *)v16;
      if (v16) {
        v18 = (void *)v16;
      }
      else {
        v18 = v10;
      }
      id v19 = v18;

      id v10 = v19;
    }

    id v20 = [MEMORY[0x263EFC640] sharedSession];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_4;
    v24[3] = &unk_264E5E7F0;
    id v25 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 56);
    id v26 = v21;
    uint64_t v27 = v22;
    uint64_t v23 = [v20 dataTaskWithURL:v10 completionHandler:v24];
    [v23 resume];

    id v9 = v12;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 length]
    && (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v8, "statusCode")) & 1) != 0)
  {
    id v31 = v7;
    id v44 = v9;
    id v10 = +[ONOXMLDocument XMLDocumentWithData:v7 error:&v44];
    id v29 = v44;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v30 = v10;
    id v11 = [v10 rootElement];
    id v12 = [v11 childrenWithTag:@"service"];

    id obj = v12;
    uint64_t v34 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v41;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v13;
          id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v15 = objc_msgSend(v14, "firstChildWithTag:", @"apis", v29);
          uint64_t v16 = [v15 childrenWithTag:@"api"];

          uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v37 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v22 = [v21 valueForAttribute:@"name"];
                int v23 = [v22 isEqualToString:@"WordPress"];

                if (v23)
                {
                  uint64_t v24 = NSURL;
                  id v25 = [v21 valueForAttribute:@"apiLink"];
                  id v26 = [v24 URLWithString:v25];
                  uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
                  id v28 = v26;
                  if (!v26) {
                    id v28 = *(void **)(v27 + 40);
                  }
                  objc_storeStrong((id *)(v27 + 40), v28);
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v18);
          }

          uint64_t v13 = v35 + 1;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v34);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = v29;
    id v7 = v31;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__WFWordPressAccount_loginWithUsername_password_blogURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = a3;
    id v11 = [v5 username];
    id v7 = [*(id *)(a1 + 32) password];
    id v8 = [*(id *)(a1 + 32) endpointURL];
    id v9 = +[WFWordPressAccount accountWithUsername:v11 password:v7 endpointURL:v8];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v9, v6);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void))(v3 + 16);
    id v11 = a3;
    v10(v3, 0);
  }
}

+ (id)accountWithUsername:(id)a3 password:(id)a4 endpointURL:(id)a5
{
  id v8 = a5;
  id v9 = [a1 accountWithUsername:a3 password:a4];
  [v9 setEndpointURL:v8];

  return v9;
}

+ (unint64_t)modelVersion
{
  return 1;
}

+ (BOOL)allowsMultipleAccounts
{
  return 1;
}

+ (id)localizedServiceName
{
  return WFLocalizedString(@"WordPress");
}

+ (id)serviceName
{
  return @"WordPress";
}

+ (id)serviceID
{
  return @"is.workflow.my.app.wordpress";
}

@end