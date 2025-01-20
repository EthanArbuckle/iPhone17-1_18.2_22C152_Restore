@interface KMLanguageModelBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KMLanguageModelBridge)initWithLanguageCode:(id)a3;
- (id)_getItemWithTokenID:(unsigned int)a3 dynamicToken:(id)a4 error:(id *)a5;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation KMLanguageModelBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (id)_getItemWithTokenID:(unsigned int)a3 dynamicToken:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  builder = self->_builder;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v6);
  id v11 = (id)[(KVItemBuilder *)builder setItemType:10 itemId:v10 error:a5];

  id v12 = (id)[(KVItemBuilder *)self->_builder addFieldWithType:400 value:v8 error:a5];
  v13 = [(KVItemBuilder *)self->_builder buildItemWithError:a5];

  return v13;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  v39[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = AFKeyboardLMLocaleOverride();
  uint64_t v7 = *MEMORY[0x263F51248];
  v38[0] = *MEMORY[0x263F512A8];
  v38[1] = v7;
  v39[0] = v6;
  v39[1] = MEMORY[0x263EFFA88];
  v38[2] = *MEMORY[0x263F51260];
  id v8 = AFKeyboardResourcesDirectoryPath();
  v39[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

  if (LMLanguageModelCreate())
  {
    uint64_t v27 = 0;
    if (LMLanguageModelGetDynamicTokenIDRange())
    {
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__855;
      v34 = __Block_byref_object_dispose__856;
      id v35 = 0;
      id v22 = v5;
      LMLanguageModelEnumerateDynamicTokensWithBlock();
      LMLanguageModelRelease();
      BOOL v10 = *((unsigned char *)v24 + 24) == 0;
      if (*((unsigned char *)v24 + 24))
      {
        id v11 = KMLogContextCore;
        if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
        {
          languageCode = self->_languageCode;
          *(_DWORD *)v28 = 136315394;
          v29 = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
          __int16 v30 = 2112;
          v31 = languageCode;
          _os_log_error_impl(&dword_22475B000, v11, OS_LOG_TYPE_ERROR, "%s Enumeration failed while fetching dynamic tokens for Keyboard from LanguageModel for language=%@", v28, 0x16u);
        }
        KVSetError();
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v17 = KMLogContextCore;
      BOOL v10 = 1;
      if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
      {
        v18 = self->_languageCode;
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_22475B000, v17, OS_LOG_TYPE_INFO, "%s No dynamic tokens for language=%@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_languageCode;
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[KMLanguageModelBridge enumerateItemsWithError:usingBlock:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_error_impl(&dword_22475B000, v12, OS_LOG_TYPE_ERROR, "%s Could not get dynamic vocabulary for Keyboard from LanguageModel for language=%@", buf, 0x16u);
    }
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F07F80];
    v14 = [NSString stringWithFormat:@"Could not get dynamic vocabulary for Keyboard from LanguageModel for language=%@", self->_languageCode];
    v37 = v14;
    v15 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v16 = [v13 errorWithDomain:@"com.apple.siri.vocabulary.donate.keyboard" code:2 userInfo:v15];
    KVSetError();

    BOOL v10 = 0;
  }

  return v10;
}

void __60__KMLanguageModelBridge_enumerateItemsWithError_usingBlock___block_invoke(uint64_t a1, unsigned int a2, unsigned char *a3)
{
  uint64_t StringForTokenID = LMLanguageModelCreateStringForTokenID();
  if (StringForTokenID)
  {
    uint64_t v6 = (void *)StringForTokenID;
    uint64_t v7 = (void *)MEMORY[0x22A6168F0]();
    LMLanguageModelGetUsageCount();
    if (v8 <= 0.0)
    {
      CFRelease(v6);
    }
    else
    {
      id v9 = v6;
      BOOL v10 = v9;
      if (a2 >= *(_DWORD *)(a1 + 72) && a2 <= *(_DWORD *)(a1 + 76))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v11 + 40);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "_getItemWithTokenID:dynamicToken:error:");
        objc_storeStrong((id *)(v11 + 40), obj);
        if (!v12 || ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0)
        {
          *a3 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        CFRelease(v10);
      }
      else
      {
        CFRelease(v9);
      }
    }
  }
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51080];
}

- (unsigned)cascadeItemType
{
  return *MEMORY[0x263F316D0];
}

- (KMLanguageModelBridge)initWithLanguageCode:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KMLanguageModelBridge;
  uint64_t v6 = [(KMLanguageModelBridge *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_languageCode, a3);
    float v8 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x263F510C0]);
    builder = v7->_builder;
    v7->_builder = v8;
  }
  BOOL v10 = v7;
LABEL_6:

  return v10;
}

@end