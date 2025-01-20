@interface CRJSContext
+ (id)sharedContext;
- (CRJSContext)initWithVirtualMachine:(id)a3;
- (id)_cardWithTitle:(id)a3 cardSections:(id)a4 interaction:(id)a5 error:(id *)a6;
- (void)_createCard:(id)a3 completionHandler:(id)a4;
- (void)evaluateScript:(id)a3 completionHandler:(id)a4;
@end

@implementation CRJSContext

- (CRJSContext)initWithVirtualMachine:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CRJSContext;
  v5 = [(CRJSContext *)&v26 initWithVirtualMachine:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [(CRJSContext *)v5 setObject:v6 forKeyedSubscript:v8];

    v9 = NSString;
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 pathForResource:@"Base" ofType:@"js"];
    v12 = [v9 stringWithContentsOfFile:v11 encoding:4 error:0];

    id v13 = (id)[(CRJSContext *)v5 evaluateScript:v12];
    objc_initWeak(&location, v5);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __38__CRJSContext_initWithVirtualMachine___block_invoke;
    v23 = &unk_2647EEFF8;
    objc_copyWeak(&v24, &location);
    v14 = (void *)MEMORY[0x22A66D240](&v20);
    v15 = [(CRJSContext *)v5 objectForKeyedSubscript:@"System", v20, v21, v22, v23];
    [v15 setObject:v14 forKeyedSubscript:@"Data"];

    id v16 = (id)[(CRJSContext *)v5 evaluateScript:@"var console = {}"];
    v17 = [(CRJSContext *)v5 objectForKeyedSubscript:@"console"];
    [v17 setObject:&__block_literal_global_2 forKeyedSubscript:@"log"];

    v18 = [(CRJSContext *)v5 objectForKeyedSubscript:@"console"];
    [v18 setObject:&__block_literal_global_62 forKeyedSubscript:@"error"];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __38__CRJSContext_initWithVirtualMachine___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v6 = [v3 toString];

  v7 = [v5 dataWithContentsOfFile:v6];

  if (v7) {
    [MEMORY[0x263F10390] valueWithObject:v7 inContext:WeakRetained];
  }
  else {
  v8 = [MEMORY[0x263F10390] valueWithNullInContext:WeakRetained];
  }

  return v8;
}

void __38__CRJSContext_initWithVirtualMachine___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

void __38__CRJSContext_initWithVirtualMachine___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)sharedContext_sharedContext;
  return v2;
}

void __28__CRJSContext_sharedContext__block_invoke()
{
  v0 = [CRJSContext alloc];
  id v3 = objc_alloc_init(MEMORY[0x263F10398]);
  uint64_t v1 = [(CRJSContext *)v0 initWithVirtualMachine:v3];
  v2 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = v1;
}

- (void)evaluateScript:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __48__CRJSContext_evaluateScript_completionHandler___block_invoke;
    v20[3] = &unk_2647EF040;
    id v9 = v7;
    id v21 = v9;
    [(CRJSContext *)self setExceptionHandler:v20];
    objc_initWeak(&location, self);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __48__CRJSContext_evaluateScript_completionHandler___block_invoke_2;
    id v16 = &unk_2647EF068;
    objc_copyWeak(&v18, &location);
    id v17 = v9;
    v10 = (void *)MEMORY[0x22A66D240](&v13);
    [(CRJSContext *)self setObject:v10 forKeyedSubscript:@"createCard"];

    objc_msgSend(NSString, "stringWithFormat:", @"createCard(function() { %@ }());",
      v6,
      v13,
      v14,
      v15,
    v11 = v16);
    id v12 = (id)[(CRJSContext *)self evaluateScript:v11];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __48__CRJSContext_evaluateScript_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08320];
  v5 = [a3 toString];
  v9[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [v4 errorWithDomain:@"CRJSContextErrorDomain" code:0 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__CRJSContext_evaluateScript_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _createCard:v4 completionHandler:*(void *)(a1 + 32)];
}

- (void)_createCard:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 valueForProperty:@"sash"];
  id v9 = [v8 valueForProperty:@"applicationBundleIdentifier"];
  v10 = [v8 valueForProperty:@"title"];
  v11 = [v6 valueForProperty:@"cardSections"];
  id v12 = [v11 toArray];

  if ([v9 isUndefined])
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v9 toString];
  }
  if ([v10 isUndefined])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [v10 toString];
  }
  v23 = v6;
  v15 = [v6 valueForProperty:@"interaction"];
  id v16 = [v15 toDictionary];

  id v24 = 0;
  id v17 = [(CRJSContext *)self _cardWithTitle:v14 cardSections:v12 interaction:v16 error:&v24];
  id v18 = v24;
  if (v18)
  {
    (*((void (**)(id, void, void, void, id))v7 + 2))(v7, 0, 0, 0, v18);
  }
  else
  {
    [v17 data];
    uint64_t v22 = v8;
    v19 = v10;
    v21 = uint64_t v20 = v9;
    (*((void (**)(id, void *, void *, void *, void))v7 + 2))(v7, v13, v14, v21, 0);

    id v9 = v20;
    v10 = v19;
    uint64_t v8 = v22;
  }
}

- (id)_cardWithTitle:(id)a3 cardSections:(id)a4 interaction:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 count])
  {
    id v26 = 0;
    goto LABEL_29;
  }
  v45 = a6;
  v41 = [v10 objectForKeyedSubscript:@"intent"];
  id v38 = v10;
  v40 = [v10 objectForKeyedSubscript:@"intentResponse"];
  v46 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v39 = v9;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v43 = *(void *)v49;
LABEL_4:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v49 != v43) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
      v15 = [v14 objectForKeyedSubscript:@"_backingObject"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v16 = [v14 objectForKeyedSubscript:@"_type"];
      uint64_t v17 = [v16 integerValue];

      id v18 = [v14 objectForKeyedSubscript:@"_value"];
      v19 = [v14 objectForKeyedSubscript:@"nextCard"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v20 = [v19 objectForKeyedSubscript:@"cardSections"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = 0;
      }
      else
      {
        id v21 = [v19 objectForKeyedSubscript:@"interaction"];
      }
      id v22 = objc_alloc_init(MEMORY[0x263F67B30]);
      NSSelectorFromString(v18);
      if (objc_opt_respondsToSelector())
      {
        v23 = [v15 backingObject];
        [v22 setValue:v23 forKey:v18];
      }
      id v24 = objc_alloc_init(MEMORY[0x263F67B28]);
      [v24 setType:v17];
      [v24 setValue:v22];
      v25 = [(CRJSContext *)self _cardWithTitle:v47 cardSections:v20 interaction:v21 error:v45];
      [v24 setNextCard:v25];

      [v46 addObject:v24];
      if (v12 == ++v13)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v12) {
          goto LABEL_4;
        }
        goto LABEL_18;
      }
    }
    if (v45)
    {
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v52 = *MEMORY[0x263F08320];
      v53 = @"Unable to create card";
      v34 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      [v36 errorWithDomain:@"CRJSContextErrorDomain" code:1 userInfo:v34];
      id v26 = 0;
      id *v45 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    id v26 = 0;
    id v10 = v38;
    id v9 = v39;
  }
  else
  {
LABEL_18:

    id v26 = objc_alloc_init(MEMORY[0x263F67B20]);
    [v26 setTitle:v47];
    [v26 setCardSections:v46];
    v27 = v41;
    if (v41)
    {
      v28 = [v41 objectForKeyedSubscript:@"_backingObject"];
      v29 = [v41 objectForKeyedSubscript:@"_type"];
      v30 = [v28 backingObject];
      [v26 setIntentMessageName:v29];
      v31 = [v30 data];
      [v26 setIntentMessageData:v31];
    }
    v32 = v40;
    if (!v40)
    {
      id v10 = v38;
      id v9 = v39;
      goto LABEL_28;
    }
    v33 = [v40 objectForKeyedSubscript:@"_backingObject"];
    v15 = [v40 objectForKeyedSubscript:@"_type"];
    id obj = v33;
    v34 = [v33 backingObject];
    [v26 setIntentResponseMessageName:v15];
    v35 = [v34 data];
    [v26 setIntentResponseMessageData:v35];

LABEL_24:
    id v10 = v38;
    id v9 = v39;
  }
  v32 = v40;
  v27 = v41;
LABEL_28:

LABEL_29:
  return v26;
}

@end