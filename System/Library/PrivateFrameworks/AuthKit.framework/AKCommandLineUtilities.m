@interface AKCommandLineUtilities
- (BOOL)_isURLString:(id)a3;
- (NSDateFormatter)dateFormatter;
- (id)_hostURL;
- (id)errorFromServerResponseBody:(id)a3;
- (id)jsonDictionaryForData:(id)a3 error:(id)a4;
- (id)mutableJSONRequestForPath:(id)a3;
- (id)mutableJSONRequestForURL:(id)a3;
- (void)beginDataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)createAndExecuteRequestForPath:(id)a3 requestBody:(id)a4 httpMethod:(id)a5 configuration:(id)a6 completion:(id)a7;
- (void)signXMLRequest:(id)a3;
- (void)signXMLRequest:(id)a3 withPostbackDictionary:(id)a4;
- (void)updateConfiguration:(id)a3 fromXMLAttributes:(id)a4 response:(id)a5;
@end

@implementation AKCommandLineUtilities

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
    [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyy-MM-dd"];
    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (void)createAndExecuteRequestForPath:(id)a3 requestBody:(id)a4 httpMethod:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(AKCommandLineUtilities *)self mutableJSONRequestForPath:v12];
  objc_msgSend(v17, "ak_setJSONBodyWithParameters:", v13);
  [v17 setHTTPMethod:v14];
  v18 = [v15 resourceLoadDelegate];
  [v18 signRequest:v17];

  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__AKCommandLineUtilities_createAndExecuteRequestForPath_requestBody_httpMethod_configuration_completion___block_invoke;
  v20[3] = &unk_1E5761570;
  objc_copyWeak(&v22, &location);
  id v19 = v16;
  id v21 = v19;
  [(AKCommandLineUtilities *)self beginDataTaskWithRequest:v17 completionHandler:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __105__AKCommandLineUtilities_createAndExecuteRequestForPath_requestBody_httpMethod_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v14 && WeakRetained)
  {
    v10 = [WeakRetained jsonDictionaryForData:v14 error:0];
    v11 = [WeakRetained errorFromServerResponseBody:v10];

    objc_opt_class();
    id v12 = v7;
    id v13 = 0;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v11 = v8;
  }
}

- (id)_hostURL
{
  if (_hostURL_onceToken != -1) {
    dispatch_once(&_hostURL_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)_hostURL_hostURL;

  return v2;
}

void __34__AKCommandLineUtilities__hostURL__block_invoke()
{
  v0 = +[AKURLBag bagForAltDSID:0];
  unint64_t v1 = [v0 lastKnownIDMSEnvironment];

  if (v1 <= 3)
  {
    v2 = *off_1E5761590[v1];
    objc_storeStrong((id *)&_hostURL_hostURL, v2);
  }
}

- (id)mutableJSONRequestForPath:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  v6 = [(AKCommandLineUtilities *)self _hostURL];
  id v7 = [v4 componentsWithString:v6];

  [v7 setPath:v5];
  id v8 = [v7 URL];
  v9 = [(AKCommandLineUtilities *)self mutableJSONRequestForURL:v8];

  return v9;
}

- (id)mutableJSONRequestForURL:(id)a3
{
  id v3 = a3;
  v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[AKCommandLineUtilities mutableJSONRequestForURL:]((uint64_t)v3, v4);
  }

  id v5 = [MEMORY[0x1E4F18D50] requestWithURL:v3];
  [v5 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [v5 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  return v5;
}

- (id)errorFromServerResponseBody:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"hasError"];
  id v5 = [v3 objectForKeyedSubscript:@"serviceErrors"];

  if (([v4 BOOLValue] & 1) == 0 && !objc_msgSend(v5, "count"))
  {
    id v13 = 0;
    goto LABEL_18;
  }
  v6 = [v5 firstObject];
  if (v6)
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AKCommandLineUtilities errorFromServerResponseBody:]((uint64_t)v6, v7);
    }

    id v8 = [v6 objectForKeyedSubscript:@"title"];

    if (v8)
    {
      v9 = [v6 objectForKeyedSubscript:@"message"];

      if (v9)
      {
        v15[0] = *MEMORY[0x1E4F28568];
        v10 = [v6 objectForKeyedSubscript:@"title"];
        v16[0] = v10;
        v15[1] = *MEMORY[0x1E4F28588];
        v11 = [v6 objectForKeyedSubscript:@"message"];
        v16[1] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

LABEL_16:
        goto LABEL_17;
      }
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AKCommandLineUtilities errorFromServerResponseBody:](v10);
      }
    }
    else
    {
      v10 = _AKLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[AKCommandLineUtilities errorFromServerResponseBody:](v10);
      }
    }
    id v12 = 0;
    goto LABEL_16;
  }
  id v12 = 0;
LABEL_17:
  id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:userInfo:", -7029, v12);

LABEL_18:

  return v13;
}

- (id)jsonDictionaryForData:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v18 = v6;
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v18];
    id v8 = v18;

    if (v8)
    {
      v17 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
      AKPrintLine(@"Error deserializing data %@ for data %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

      id v6 = v8;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)beginDataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[AKCommandLineURLSession sharedServerUIURLSession];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__AKCommandLineUtilities_beginDataTaskWithRequest_completionHandler___block_invoke;
  v10[3] = &unk_1E575F4C0;
  id v11 = v6;
  id v8 = v6;
  id v9 = (id)[v7 beginDataTaskWithRequest:v5 completionHandler:v10];
}

void __69__AKCommandLineUtilities_beginDataTaskWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__AKCommandLineUtilities_beginDataTaskWithRequest_completionHandler___block_invoke_2;
    v13[3] = &unk_1E575F3D8;
    id v17 = *(id *)(a1 + 32);
    id v14 = v7;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v9)
    {
      if (v11) {
        (*(void (**)(uint64_t, void, void, id))(v11 + 16))(v11, 0, 0, v9);
      }
    }
    else if (v11)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7027);
      (*(void (**)(uint64_t, void, void, void *))(v11 + 16))(v11, 0, 0, v12);
    }
  }
}

uint64_t __69__AKCommandLineUtilities_beginDataTaskWithRequest_completionHandler___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)updateConfiguration:(id)a3 fromXMLAttributes:(id)a4 response:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKey:@"httpMethod"];
  v32 = v9;
  uint64_t v12 = [v9 objectForKey:@"url"];
  v33 = v8;
  uint64_t v13 = [v8 request];
  id v14 = (void *)[v13 mutableCopy];

  if ([(AKCommandLineUtilities *)self _isURLString:v12])
  {
    id v15 = (void *)MEMORY[0x1E4F18D50];
    id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
    [v15 requestWithURL:v16];
    id v14 = v17 = v14;
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4F29088]);
    id v19 = [v14 URL];
    v20 = [v19 absoluteString];
    id v16 = (void *)[v18 initWithString:v20];

    [v16 setPath:v12];
    id v17 = [v16 URL];
    [v14 setURL:v17];
  }

  if (v11 && [(__CFString *)v11 length])
  {
    id v21 = v14;
    id v22 = v11;
  }
  else
  {
    id v22 = @"GET";
    id v21 = v14;
  }
  [v21 setHTTPMethod:v22];
  v31 = v10;
  v23 = [v10 allHeaderFields];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v24 = [v23 allKeys];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v30 = [v23 objectForKey:v29];
        [v14 setValue:v30 forHTTPHeaderField:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v26);
  }

  [v33 setRequest:v14];
}

- (void)signXMLRequest:(id)a3 withPostbackDictionary:(id)a4
{
  id v6 = a3;
  objc_msgSend(v6, "ak_setBodyWithParameters:", a4);
  [v6 setHTTPMethod:@"POST"];
  [(AKCommandLineUtilities *)self signXMLRequest:v6];
}

- (void)signXMLRequest:(id)a3
{
  id v3 = a3;
  [v3 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
  [v3 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
}

- (BOOL)_isURLString:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 scheme];
    if (v5)
    {
      id v6 = [v4 host];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)mutableJSONRequestForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "_mutableJSONRequestForURL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)errorFromServerResponseBody:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Server error returned with no title!", v1, 2u);
}

- (void)errorFromServerResponseBody:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Server error returned with no description!!", v1, 2u);
}

- (void)errorFromServerResponseBody:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "Server response contained error: %@", (uint8_t *)&v2, 0xCu);
}

@end