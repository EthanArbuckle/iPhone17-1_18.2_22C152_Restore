@interface NFCFeliCaTag
- (id)copyWithZone:(_NSZone *)a3;
- (void)pollingWithSystemCode:(id)a3 requestCode:(int64_t)a4 timeSlot:(int64_t)a5 completionHandler:(id)a6;
- (void)readWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 completionHandler:(id)a5;
- (void)requestResponseWithCompletionHandler:(id)a3;
- (void)requestServiceV2WithNodeCodeList:(id)a3 completionHandler:(id)a4;
- (void)requestServiceWithNodeCodeList:(id)a3 completionHandler:(id)a4;
- (void)requestSpecificationVersionWithCompletionHandler:(id)a3;
- (void)requestSystemCodeWithCompletionHandler:(id)a3;
- (void)resetModeWithCompletionHandler:(id)a3;
- (void)sendFeliCaCommandPacket:(id)a3 completionHandler:(id)a4;
- (void)writeWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 blockData:(id)a5 completionHandler:(id)a6;
@end

@implementation NFCFeliCaTag

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NFCFeliCaTag;
  return [(NFCTag *)&v4 copyWithZone:a3];
}

- (void)pollingWithSystemCode:(id)a3 requestCode:(int64_t)a4 timeSlot:(int64_t)a5 completionHandler:(id)a6
{
  char v7 = a5;
  char v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v13 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag pollingWithSystemCode:requestCode:timeSlot:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  if ([v11 length] == 2)
  {
    v14 = (unsigned char *)[v11 bytes];
    LOBYTE(state.opaque[0]) = 0;
    BYTE1(state.opaque[0]) = *v14;
    int v15 = v14[1];
    BYTE2(state.opaque[0]) = v14[1];
    BYTE3(state.opaque[0]) = v8;
    BYTE4(state.opaque[0]) = v7;
    if (BYTE1(state.opaque[0]) == 255 || v15 == 255)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_13;
      v19[3] = &unk_2645B42B8;
      v19[4] = self;
      id v20 = v12;
      SEL v21 = a2;
      [(NFCTag *)self dispatchOnDelegateQueueAsync:v19];
      v16 = v20;
    }
    else
    {
      v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&state length:5];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_15;
      v17[3] = &unk_2645B42E0;
      id v18 = v12;
      [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v16 completionHandler:v17];
    }
  }
  else
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke;
    v22[3] = &unk_2645B42B8;
    v22[4] = self;
    id v23 = v12;
    SEL v24 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v22];
  }
}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  objc_super v4 = objc_opt_new();
  v5 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v11, ClassName, Name, 50);
  }
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    int v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v19 = v14;
    __int16 v20 = 2082;
    SEL v21 = v15;
    __int16 v22 = 2082;
    id v23 = v16;
    __int16 v24 = 1024;
    int v25 = 50;
    _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }
}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  objc_super v4 = objc_opt_new();
  v5 = +[NFCError errorWithCode:3];
  (*(void (**)(uint64_t, void *, void *, void *))(v2 + 16))(v2, v3, v4, v5);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    char v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i System code must not contain the 0xFF wildcard value", v11, ClassName, Name, 61);
  }
  id v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    int v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v19 = v14;
    __int16 v20 = 2082;
    SEL v21 = v15;
    __int16 v22 = 2082;
    id v23 = v16;
    __int16 v24 = 1024;
    int v25 = 61;
    _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System code must not contain the 0xFF wildcard value", buf, 0x22u);
  }
}

void __77__NFCFeliCaTag_pollingWithSystemCode_requestCode_timeSlot_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    char v8 = objc_opt_new();
    v9 = objc_opt_new();
    (*(void (**)(uint64_t, void *, void *, id))(v7 + 16))(v7, v8, v9, v6);
  }
  else
  {
    if ([v5 length] == 18 || objc_msgSend(v5, "length") == 20)
    {
      v10 = objc_msgSend(v5, "subdataWithRange:", 10, 8);
      uint64_t v11 = [v5 length];
      uint64_t v12 = *(void *)(a1 + 32);
      if (v11 == 20)
      {
        uint64_t v13 = objc_msgSend(v5, "subdataWithRange:", 18, 2);
      }
      else
      {
        uint64_t v13 = objc_opt_new();
      }
      int v14 = (void *)v13;
      (*(void (**)(uint64_t, void *, uint64_t, void))(v12 + 16))(v12, v10, v13, 0);
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 32);
      v10 = objc_opt_new();
      int v14 = objc_opt_new();
      id v18 = @"TagResponseInvalidLength";
      v19[0] = MEMORY[0x263EFFA88];
      v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v17 = +[NFCError errorWithCode:102 userInfo:v16];
      (*(void (**)(uint64_t, void *, void *, void *))(v15 + 16))(v15, v10, v14, v17);
    }
  }
}

- (void)requestServiceWithNodeCodeList:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag requestServiceWithNodeCodeList:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  if ([v7 count] && (unint64_t)objc_msgSend(v7, "count") < 0x21)
  {
    SEL v20 = a2;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v18 length] != 2)
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_21;
            v23[3] = &unk_2645B42B8;
            v23[4] = self;
            id v24 = v8;
            SEL v25 = v20;
            [(NFCTag *)self dispatchOnDelegateQueueAsync:v23];

            goto LABEL_5;
          }
          [v11 appendData:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 2;
    [v10 appendBytes:&state length:1];
    int v19 = [(NFCTag *)self identifier];
    [v10 appendData:v19];

    LOBYTE(state.opaque[0]) = [v13 count];
    [v10 appendBytes:&state length:1];
    [v10 appendData:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_22;
    v21[3] = &unk_2645B42E0;
    id v22 = v8;
    [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v10 completionHandler:v21];
    uint64_t v12 = v22;
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke;
    v30[3] = &unk_2645B42B8;
    v30[4] = self;
    id v31 = v8;
    SEL v32 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v30];
    uint64_t v12 = v31;
  }

LABEL_5:
}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  objc_super v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", v10, ClassName, Name, 99);
  }
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    id v22 = v15;
    __int16 v23 = 1024;
    int v24 = 99;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", buf, 0x22u);
  }
}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  objc_super v4 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v10, ClassName, Name, 108);
  }
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    id v22 = v15;
    __int16 v23 = 1024;
    int v24 = 108;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }
}

void __65__NFCFeliCaTag_requestServiceWithNodeCodeList_completionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)[v5 length] <= 0xC)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    __int16 v23 = @"TagResponseInvalidLength";
    v24[0] = MEMORY[0x263EFFA88];
    uint64_t v10 = NSDictionary;
    uint64_t v11 = v24;
    uint64_t v12 = &v23;
LABEL_7:
    uint64_t v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    uint64_t v16 = +[NFCError errorWithCode:102 userInfo:v15];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v16);

    goto LABEL_8;
  }
  id v13 = v5;
  uint64_t v14 = *(unsigned __int8 *)([v13 bytes] + 10);
  if ([v13 length] - 11 < (unint64_t)(2 * v14))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    __int16 v21 = @"TagResponseInvalidLength";
    uint64_t v22 = MEMORY[0x263EFFA88];
    uint64_t v10 = NSDictionary;
    uint64_t v11 = &v22;
    uint64_t v12 = &v21;
    goto LABEL_7;
  }
  v17 = objc_opt_new();
  if (v14)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 2 * v14;
    do
    {
      SEL v20 = objc_msgSend(v13, "subdataWithRange:", v18 + 11, 2);
      [v17 addObject:v20];

      v18 += 2;
    }
    while (v19 != v18);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_9:
}

- (void)requestResponseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag requestResponseWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = 4;
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:1];
  uint64_t v7 = [(NFCTag *)self identifier];
  [v6 appendData:v7];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__NFCFeliCaTag_requestResponseWithCompletionHandler___block_invoke;
  v9[3] = &unk_2645B42E0;
  id v10 = v4;
  id v8 = v4;
  [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v6 completionHandler:v9];
}

void __53__NFCFeliCaTag_requestResponseWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v5 length] == 11)
  {
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)([v6 bytes] + 10), 0);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = @"TagResponseInvalidLength";
    v11[0] = MEMORY[0x263EFFA88];
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = +[NFCError errorWithCode:102 userInfo:v8];
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, -1, v9);
  }
}

- (void)readWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 completionHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag readWithoutEncryptionWithServiceCodeList:blockList:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  if ([v9 count] && (unint64_t)objc_msgSend(v9, "count") < 0x11)
  {
    SEL v31 = a2;
    id v13 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v19 length] != 2)
          {
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_25;
            v41[3] = &unk_2645B42B8;
            v41[4] = self;
            id v42 = v11;
            SEL v43 = v31;
            [(NFCTag *)self dispatchOnDelegateQueueAsync:v41];

            SEL v20 = v14;
            goto LABEL_25;
          }
          [v13 appendData:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    long long v29 = v11;

    SEL v20 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v30 = v10;
    id v21 = v10;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      while (2)
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          if ([v26 length] != 2 && objc_msgSend(v26, "length") != 3)
          {
            v34[0] = MEMORY[0x263EF8330];
            v34[1] = 3221225472;
            v34[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_26;
            v34[3] = &unk_2645B42B8;
            id v11 = v29;
            v34[4] = self;
            id v35 = v29;
            SEL v36 = v31;
            [(NFCTag *)self dispatchOnDelegateQueueAsync:v34];

            goto LABEL_24;
          }
          [v20 appendData:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v52 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 6;
    long long v27 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:1];
    long long v28 = [(NFCTag *)self identifier];
    [v27 appendData:v28];

    LOBYTE(state.opaque[0]) = [v14 count];
    [v27 appendBytes:&state length:1];
    [v27 appendData:v13];
    LOBYTE(state.opaque[0]) = [v21 count];
    [v27 appendBytes:&state length:1];
    [v27 appendData:v20];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_28;
    v32[3] = &unk_2645B42E0;
    id v11 = v29;
    id v33 = v29;
    [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v27 completionHandler:v32];

LABEL_24:
    id v10 = v30;
LABEL_25:
  }
  else
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke;
    v48[3] = &unk_2645B42B8;
    v48[4] = self;
    id v49 = v11;
    SEL v50 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v48];
    id v13 = v49;
  }
}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", v10, ClassName, Name, 189);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 189;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", buf, 0x22u);
  }
}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v10, ClassName, Name, 199);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 199;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }
}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v2 + 16))(v2, -1, -1, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", v10, ClassName, Name, 211);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    SEL v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 211;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", buf, 0x22u);
  }
}

void __85__NFCFeliCaTag_readWithoutEncryptionWithServiceCodeList_blockList_completionHandler___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v9 = v5;
    uint64_t v10 = [v9 bytes];
    if ((unint64_t)[v9 length] <= 0xB)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v8 = objc_opt_new();
      uint64_t v25 = @"TagResponseInvalidLength";
      v26[0] = MEMORY[0x263EFFA88];
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      int v13 = +[NFCError errorWithCode:102 userInfo:v12];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v11 + 16))(v11, -1, -1, v8, v13);

      goto LABEL_5;
    }
    id v14 = objc_opt_new();
    if (!*(unsigned char *)(v10 + 10))
    {
      uint64_t v15 = *(unsigned __int8 *)(v10 + 12);
      if ([v9 length] - 13 < (unint64_t)(16 * v15))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = objc_opt_new();
        __int16 v23 = @"TagResponseInvalidLength";
        uint64_t v24 = MEMORY[0x263EFFA88];
        int v18 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        __int16 v19 = +[NFCError errorWithCode:102 userInfo:v18];
        (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *))(v16 + 16))(v16, -1, -1, v17, v19);

        goto LABEL_9;
      }
      if (v15)
      {
        uint64_t v20 = 0;
        uint64_t v21 = 16 * v15;
        do
        {
          uint64_t v22 = objc_msgSend(v9, "subdataWithRange:", v20 + 13, 16);
          [v14 addObject:v22];

          v20 += 16;
        }
        while (v21 != v20);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:

    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_opt_new();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *, id))(v7 + 16))(v7, -1, -1, v8, v6);
LABEL_5:

LABEL_6:
}

- (void)writeWithoutEncryptionWithServiceCodeList:(id)a3 blockList:(id)a4 blockData:(id)a5 completionHandler:(id)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag writeWithoutEncryptionWithServiceCodeList:blockList:blockData:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[1] = 0;
  state.opaque[0] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  if ([v11 count] && (unint64_t)objc_msgSend(v11, "count") < 0x11)
  {
    uint64_t v17 = [v12 count];
    if (v17 == [v13 count])
    {
      if ((unint64_t)[v12 count] < 0x100)
      {
        long long v40 = v13;
        uint64_t v16 = objc_opt_new();
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        obuint64_t j = v11;
        uint64_t v18 = [obj countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v63;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v63 != v20) {
                objc_enumerationMutation(obj);
              }
              uint64_t v22 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if ([v22 length] != 2)
              {
                v59[0] = MEMORY[0x263EF8330];
                v59[1] = 3221225472;
                v59[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_33;
                v59[3] = &unk_2645B42B8;
                v59[4] = self;
                id v60 = v14;
                SEL v61 = a2;
                [(NFCTag *)self dispatchOnDelegateQueueAsync:v59];
                SEL v36 = v60;
                __int16 v23 = obj;
                goto LABEL_39;
              }
              [v16 appendData:v22];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v62 objects:v78 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        __int16 v23 = objc_opt_new();
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v38 = v12;
        id v41 = v12;
        uint64_t v24 = [v41 countByEnumeratingWithState:&v55 objects:v77 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v56;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v56 != v26) {
                objc_enumerationMutation(v41);
              }
              long long v28 = *(void **)(*((void *)&v55 + 1) + 8 * j);
              if ([v28 length] != 2 && objc_msgSend(v28, "length") != 3)
              {
                v52[0] = MEMORY[0x263EF8330];
                v52[1] = 3221225472;
                v52[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_34;
                v52[3] = &unk_2645B42B8;
                v52[4] = self;
                id v53 = v14;
                SEL v54 = a2;
                [(NFCTag *)self dispatchOnDelegateQueueAsync:v52];

                SEL v36 = v41;
                goto LABEL_37;
              }
              [v23 appendData:v28];
            }
            uint64_t v25 = [v41 countByEnumeratingWithState:&v55 objects:v77 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        uint64_t v37 = objc_opt_new();
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v39 = v40;
        uint64_t v29 = [v39 countByEnumeratingWithState:&v48 objects:v76 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v49;
          while (2)
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v39);
              }
              id v33 = *(void **)(*((void *)&v48 + 1) + 8 * k);
              if (objc_msgSend(v33, "length", v37) != 16)
              {
                v45[0] = MEMORY[0x263EF8330];
                v45[1] = 3221225472;
                v45[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_35;
                v45[3] = &unk_2645B42B8;
                v45[4] = self;
                id v46 = v14;
                SEL v47 = a2;
                [(NFCTag *)self dispatchOnDelegateQueueAsync:v45];

                SEL v36 = (void *)v37;
                id v12 = v38;
                goto LABEL_39;
              }
              [v23 appendData:v33];
            }
            uint64_t v30 = [v39 countByEnumeratingWithState:&v48 objects:v76 count:16];
            if (v30) {
              continue;
            }
            break;
          }
        }

        LOBYTE(state.opaque[0]) = 8;
        v34 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:1];
        id v35 = [(NFCTag *)self identifier];
        [v34 appendData:v35];

        LOBYTE(state.opaque[0]) = [obj count];
        [v34 appendBytes:&state length:1];
        [v34 appendData:v16];
        LOBYTE(state.opaque[0]) = [v41 count];
        [v34 appendBytes:&state length:1];
        [v34 appendData:v23];
        SEL v36 = (void *)v37;
        [v34 appendData:v37];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_37;
        v43[3] = &unk_2645B42E0;
        id v44 = v14;
        [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v34 completionHandler:v43];

LABEL_37:
        id v12 = v38;
LABEL_39:

        id v13 = v40;
      }
      else
      {
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_31;
        v66[3] = &unk_2645B42B8;
        v66[4] = self;
        id v67 = v14;
        SEL v68 = a2;
        [(NFCTag *)self dispatchOnDelegateQueueAsync:v66];
        uint64_t v16 = v67;
      }
    }
    else
    {
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_29;
      v69[3] = &unk_2645B42B8;
      id v70 = v14;
      v69[4] = self;
      SEL v71 = a2;
      [(NFCTag *)self dispatchOnDelegateQueueAsync:v69];
      uint64_t v16 = v70;
    }
  }
  else
  {
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke;
    v72[3] = &unk_2645B42B8;
    id v73 = v14;
    v72[4] = self;
    SEL v74 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v72];
    uint64_t v16 = v73;
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", v9, ClassName, Name, 277);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 277;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of service codes must be between 1 to 16 inclusively", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Number of elements in the block list and the block data list does not match", v9, ClassName, Name, 283);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 283;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of elements in the block list and the block data list does not match", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block list size exceeds the maximum limit", v9, ClassName, Name, 289);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 289;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list size exceeds the maximum limit", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_33(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v9, ClassName, Name, 299);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 299;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", v9, ClassName, Name, 311);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 311;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block list element must be 2 or 3 bytes long", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v2 + 16))(v2, -1, -1, v3);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(3, "%c[%{public}s %{public}s]:%i Block data length must be 16 bytes long", v9, ClassName, Name, 323);
  }
  uint64_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    id v13 = object_getClassName(*(id *)(a1 + 32));
    id v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v17 = v12;
    __int16 v18 = 2082;
    uint64_t v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 1024;
    int v23 = 323;
    _os_log_impl(&dword_2214B8000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Block data length must be 16 bytes long", buf, 0x22u);
  }
}

void __96__NFCFeliCaTag_writeWithoutEncryptionWithServiceCodeList_blockList_blockData_completionHandler___block_invoke_37(uint64_t a1, void *a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v5 length] == 12)
  {
    uint64_t v7 = [v6 bytes];
    (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(v7 + 10), *(unsigned __int8 *)(v7 + 11), 0);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = @"TagResponseInvalidLength";
    v12[0] = MEMORY[0x263EFFA88];
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v10 = +[NFCError errorWithCode:102 userInfo:v9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, -1, -1, v10);
  }
}

- (void)requestSystemCodeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag requestSystemCodeWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  LOBYTE(state.opaque[0]) = 12;
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:1];
  uint64_t v7 = [(NFCTag *)self identifier];
  [v6 appendData:v7];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__NFCFeliCaTag_requestSystemCodeWithCompletionHandler___block_invoke;
  v9[3] = &unk_2645B42E0;
  id v10 = v4;
  id v8 = v4;
  [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v6 completionHandler:v9];
}

void __55__NFCFeliCaTag_requestSystemCodeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)[v5 length] <= 0xA)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    int v23 = @"TagResponseInvalidLength";
    v24[0] = MEMORY[0x263EFFA88];
    id v10 = NSDictionary;
    id v11 = v24;
    int v12 = &v23;
LABEL_7:
    uint64_t v15 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    uint64_t v16 = +[NFCError errorWithCode:102 userInfo:v15];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v16);

    goto LABEL_8;
  }
  id v13 = v5;
  uint64_t v14 = *(unsigned __int8 *)([v13 bytes] + 10);
  if ([v13 length] - 11 < (unint64_t)(2 * v14))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    uint64_t v21 = @"TagResponseInvalidLength";
    uint64_t v22 = MEMORY[0x263EFFA88];
    id v10 = NSDictionary;
    id v11 = &v22;
    int v12 = &v21;
    goto LABEL_7;
  }
  int v17 = objc_opt_new();
  if (v14)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 2 * v14;
    do
    {
      __int16 v20 = objc_msgSend(v13, "subdataWithRange:", v18 + 11, 2);
      [v17 addObject:v20];

      v18 += 2;
    }
    while (v19 != v18);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_9:
}

- (void)requestServiceV2WithNodeCodeList:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag requestServiceV2WithNodeCodeList:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  id v10 = objc_opt_new();
  id v11 = objc_opt_new();
  if ([v7 count] && (unint64_t)objc_msgSend(v7, "count") < 0x21)
  {
    SEL v20 = a2;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v18 length] != 2)
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_38;
            v23[3] = &unk_2645B42B8;
            v23[4] = self;
            id v24 = v8;
            SEL v25 = v20;
            [(NFCTag *)self dispatchOnDelegateQueueAsync:v23];

            goto LABEL_5;
          }
          [v11 appendData:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    LOBYTE(state.opaque[0]) = 50;
    [v10 appendBytes:&state length:1];
    uint64_t v19 = [(NFCTag *)self identifier];
    [v10 appendData:v19];

    LOBYTE(state.opaque[0]) = [v13 count];
    [v10 appendBytes:&state length:1];
    [v10 appendData:v11];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_39;
    v21[3] = &unk_2645B42E0;
    id v22 = v8;
    [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v10 completionHandler:v21];
    int v12 = v22;
  }
  else
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke;
    v30[3] = &unk_2645B42B8;
    v30[4] = self;
    id v31 = v8;
    SEL v32 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v30];
    int v12 = v31;
  }

LABEL_5:
}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = +[NFCError errorWithCode:5];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v2 + 16))(v2, -1, -1, 79, v3, v4, v5);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", v11, ClassName, Name, 412);
  }
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v19 = v14;
    __int16 v20 = 2082;
    uint64_t v21 = v15;
    __int16 v22 = 2082;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = 412;
    _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Number of nodes must be between 1 to 32 inclusively", buf, 0x22u);
  }
}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_38(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v2 + 16))(v2, -1, -1, 79, v3, v4, v5);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", v11, ClassName, Name, 421);
  }
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    uint64_t v15 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v16 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v19 = v14;
    __int16 v20 = 2082;
    uint64_t v21 = v15;
    __int16 v22 = 2082;
    int v23 = v16;
    __int16 v24 = 1024;
    int v25 = 421;
    _os_log_impl(&dword_2214B8000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Node size must be 2 bytes long", buf, 0x22u);
  }
}

void __67__NFCFeliCaTag_requestServiceV2WithNodeCodeList_completionHandler___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, id))(v7 + 16))(v7, -1, -1, -1, v8, v9, v6);

    goto LABEL_8;
  }
  if ((unint64_t)[v5 length] <= 0xB)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_opt_new();
    int v12 = objc_opt_new();
    id v41 = @"TagResponseInvalidLength";
    v42[0] = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = v42;
    uint64_t v15 = &v41;
LABEL_5:
    uint64_t v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    int v17 = +[NFCError errorWithCode:102 userInfo:v16];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void *))(v10 + 16))(v10, -1, -1, -1, v11, v12, v17);

    goto LABEL_8;
  }
  id v18 = v5;
  uint64_t v19 = [v18 bytes];
  uint64_t v20 = v19;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 10);
  if (*(unsigned char *)(v19 + 10))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(unsigned __int8 *)(v19 + 11);
    __int16 v24 = objc_opt_new();
    int v25 = objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *, void))(v22 + 16))(v22, v21, v23, -1, v24, v25, 0);

    goto LABEL_8;
  }
  if ((unint64_t)[v18 length] <= 0xC)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_opt_new();
    int v12 = objc_opt_new();
    id v39 = @"TagResponseInvalidLength";
    uint64_t v40 = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = &v40;
    uint64_t v15 = &v39;
    goto LABEL_5;
  }
  uint64_t v26 = *(unsigned __int8 *)(v20 + 12);
  uint64_t v27 = *(unsigned __int8 *)(v20 + 13);
  char v28 = 1;
  if (v26 == 65) {
    char v28 = 2;
  }
  if ([v18 length] - 14 < (unint64_t)(v27 << v28))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = objc_opt_new();
    int v12 = objc_opt_new();
    uint64_t v37 = @"TagResponseInvalidLength";
    uint64_t v38 = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = &v38;
    uint64_t v15 = &v37;
    goto LABEL_5;
  }
  uint64_t v36 = v26;
  long long v29 = objc_opt_new();
  uint64_t v30 = objc_opt_new();
  if (v27)
  {
    uint64_t v31 = 0;
    uint64_t v32 = 2 * v27;
    do
    {
      id v33 = objc_msgSend(v18, "subdataWithRange:", v31 + 14, 2, v36);
      [v29 addObject:v33];

      v31 += 2;
    }
    while (v32 != v31);
    if (v36 == 65)
    {
      uint64_t v34 = 0;
      do
      {
        uint64_t v35 = objc_msgSend(v18, "subdataWithRange:", v32 + v34 + 14, 2);
        [v30 addObject:v35];

        v34 += 2;
      }
      while (v32 != v34);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_8:
}

- (void)requestSpecificationVersionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag requestSpecificationVersionWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_opt_new();
  char v11 = 60;
  [v6 appendBytes:&v11 length:1];
  uint64_t v7 = [(NFCTag *)self identifier];
  [v6 appendData:v7];

  LOWORD(state.opaque[0]) = 0;
  [v6 appendBytes:&state length:2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__NFCFeliCaTag_requestSpecificationVersionWithCompletionHandler___block_invoke;
  v9[3] = &unk_2645B42E0;
  id v10 = v4;
  id v8 = v4;
  [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v6 completionHandler:v9];
}

void __65__NFCFeliCaTag_requestSpecificationVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_opt_new();
    uint64_t v9 = objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, id))(v7 + 16))(v7, -1, -1, v8, v9, v6);

    goto LABEL_8;
  }
  if ((unint64_t)[v5 length] <= 0xB)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = objc_opt_new();
    int v12 = objc_opt_new();
    uint64_t v34 = @"TagResponseInvalidLength";
    v35[0] = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = v35;
    uint64_t v15 = &v34;
LABEL_5:
    uint64_t v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    int v17 = +[NFCError errorWithCode:102 userInfo:v16];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, void *))(v10 + 16))(v10, -1, -1, v11, v12, v17);

    goto LABEL_8;
  }
  id v18 = v5;
  uint64_t v19 = [v18 bytes];
  uint64_t v20 = v19;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 10);
  if (*(unsigned char *)(v19 + 10))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(unsigned __int8 *)(v19 + 11);
    __int16 v24 = objc_opt_new();
    int v25 = objc_opt_new();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, void))(v22 + 16))(v22, v21, v23, v24, v25, 0);

    goto LABEL_8;
  }
  if ((unint64_t)[v18 length] <= 0xE)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = objc_opt_new();
    int v12 = objc_opt_new();
    uint64_t v32 = @"TagResponseInvalidLength";
    uint64_t v33 = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = &v33;
    uint64_t v15 = &v32;
    goto LABEL_5;
  }
  uint64_t v26 = *(unsigned __int8 *)(v20 + 15);
  if ([v18 length] != 2 * v26 + 16)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = objc_opt_new();
    int v12 = objc_opt_new();
    uint64_t v30 = @"TagResponseInvalidLength";
    uint64_t v31 = MEMORY[0x263EFFA88];
    id v13 = NSDictionary;
    int v14 = &v31;
    uint64_t v15 = &v30;
    goto LABEL_5;
  }
  uint64_t v27 = objc_msgSend(v18, "subdataWithRange:", 13, 2);
  char v28 = objc_opt_new();
  if (v26)
  {
    long long v29 = objc_msgSend(v18, "subdataWithRange:", 16, (2 * v26));
    [v28 appendData:v29];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_8:
}

- (void)resetModeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag resetModeWithCompletionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  id v6 = objc_opt_new();
  char v11 = 62;
  [v6 appendBytes:&v11 length:1];
  uint64_t v7 = [(NFCTag *)self identifier];
  [v6 appendData:v7];

  LOWORD(state.opaque[0]) = 0;
  [v6 appendBytes:&state length:2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__NFCFeliCaTag_resetModeWithCompletionHandler___block_invoke;
  v9[3] = &unk_2645B42E0;
  id v10 = v4;
  id v8 = v4;
  [(NFCFeliCaTag *)self sendFeliCaCommandPacket:v6 completionHandler:v9];
}

void __47__NFCFeliCaTag_resetModeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v5 length] == 12)
  {
    uint64_t v7 = [v6 bytes];
    (*(void (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(v7 + 10), *(unsigned __int8 *)(v7 + 11), 0);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    char v11 = @"TagResponseInvalidLength";
    v12[0] = MEMORY[0x263EFFA88];
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = +[NFCError errorWithCode:102 userInfo:v9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16))(v8, -1, -1, v10);
  }
}

- (void)sendFeliCaCommandPacket:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_2214B8000, "NFCFeliCaTag sendFeliCaCommandPacket:completionHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  if ([v7 length] && (unint64_t)objc_msgSend(v7, "length") < 0xFF)
  {
    id v11 = v7;
    if (*(unsigned char *)[v11 bytes] || objc_msgSend(v11, "length") == 5)
    {
      LOBYTE(state.opaque[0]) = [v11 length] + 1;
      int v12 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:&state length:1];
      [v12 appendData:v11];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_2;
      v13[3] = &unk_2645B42E0;
      id v14 = v8;
      [(NFCTag *)self _transceiveWithData:v12 completionHandler:v13];

      goto LABEL_8;
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_41;
    v15[3] = &unk_2645B4308;
    id v16 = v8;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v15];
    id v10 = v16;
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke;
    v17[3] = &unk_2645B42B8;
    void v17[4] = self;
    id v18 = v8;
    SEL v19 = a2;
    [(NFCTag *)self dispatchOnDelegateQueueAsync:v17];
    id v10 = v18;
  }

LABEL_8:
}

void __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = objc_opt_new();
  id v4 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);

  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(3, "%c[%{public}s %{public}s]:%i Command packet length must be between 1 to 254 inclusively", v10, ClassName, Name, 595);
  }
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    id v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    uint64_t v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 595;
    _os_log_impl(&dword_2214B8000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command packet length must be between 1 to 254 inclusively", buf, 0x22u);
  }
}

void __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = (id)objc_opt_new();
  uint64_t v2 = +[NFCError errorWithCode:4];
  (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v3, v2);
}

uint64_t __58__NFCFeliCaTag_sendFeliCaCommandPacket_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end