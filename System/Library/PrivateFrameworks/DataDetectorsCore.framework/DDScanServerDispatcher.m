@interface DDScanServerDispatcher
- (DDScanServerDispatcher)init;
- (id)reportQueue;
- (uint64_t)scannerConf:(int)a3 sync:(void *)a4 string:(void *)a5 runTask:;
- (void)dealloc;
- (void)recycleScanner:(void *)a3 fromList:(int)a4 sameQueue:;
@end

@implementation DDScanServerDispatcher

- (uint64_t)scannerConf:(int)a3 sync:(void *)a4 string:(void *)a5 runTask:
{
  v9 = a2;
  v10 = a4;
  id v11 = a5;
  if (a1)
  {
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    v63 = __Block_byref_object_copy_;
    v64 = __Block_byref_object_dispose_;
    id v65 = 0;
    if (v9) {
      v12 = (DDScannerServiceConfiguration *)[v9 copy];
    }
    else {
      v12 = [[DDScannerServiceConfiguration alloc] initWithScannerType:0 passiveIntent:a3 ^ 1u];
    }
    v13 = (void *)v61[5];
    v61[5] = (uint64_t)v12;

    v14 = [(id)v61[5] language];
    if (v14 || ![(__CFString *)v10 length])
    {
      if ([v14 isEqualToString:@"inconclusive"])
      {
        [(id)v61[5] setLanguage:0];
      }
      else if ([v14 length])
      {
        [(id)v61[5] setLanguageHighConfidence:1];
        id v15 = v14;
        if (_scriptForEmbeddingFromLanguage__onceToken != -1) {
          dispatch_once(&_scriptForEmbeddingFromLanguage__onceToken, &__block_literal_global);
        }
        int v16 = [(id)_scriptForEmbeddingFromLanguage__latinLanguages containsObject:v15];

        if (v16) {
          uint64_t v17 = 30;
        }
        else {
          uint64_t v17 = 31;
        }
        [(id)v61[5] setScript:v17];
      }
    }
    else if (([0 isEqualToString:@"inconclusive"] & 1) == 0)
    {
      uint64_t v18 = DDComputeDominantScriptOrLanguage(v10);
      [(id)v61[5] setScript:v18];
      v19 = 0;
      uint64_t v20 = 0;
      switch((int)v18)
      {
        case 1:
          v19 = @"ar";
          goto LABEL_28;
        case 2:
          v19 = @"he";
          goto LABEL_28;
        case 3:
          v19 = @"el";
          goto LABEL_28;
        case 4:
          v19 = @"th";
          goto LABEL_28;
        case 5:
          v19 = @"ko";
          goto LABEL_28;
        case 6:
          v19 = @"ja";
LABEL_28:
          uint64_t v20 = 1;
          break;
        case 7:
          uint64_t v20 = 0;
          v19 = @"tr";
          break;
        case 8:
        case 14:
          uint64_t v20 = 0;
          v19 = @"ru";
          break;
        case 9:
        case 10:
          uint64_t v20 = 0;
          v19 = @"en";
          break;
        case 11:
        case 13:
          uint64_t v20 = 0;
          v19 = @"zh-Hans";
          break;
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 26:
        case 29:
          uint64_t v20 = 0;
          v19 = @"hi";
          break;
        case 25:
          uint64_t v20 = 0;
          v19 = @"th";
          break;
        case 28:
          uint64_t v20 = 0;
          v19 = @"my";
          break;
        default:
          break;
      }
      [(id)v61[5] setLanguage:v19];
      [(id)v61[5] setLanguageHighConfidence:v20];
    }
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy_;
    v58 = __Block_byref_object_dispose_;
    id v59 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy_;
    v52 = __Block_byref_object_dispose_;
    id v53 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    v21 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke;
    block[3] = &unk_1E5984BF0;
    v38 = sel_scannerConf_sync_string_runTask_;
    block[4] = a1;
    v33 = &v44;
    v34 = &v48;
    v35 = &v60;
    char v39 = a3;
    id v22 = v11;
    id v32 = v22;
    v36 = &v40;
    v37 = &v54;
    dispatch_sync(v21, block);
    if (*((unsigned char *)v41 + 24)) {
      goto LABEL_39;
    }
    if (a3)
    {
      if (v9)
      {
        v23 = (void *)v9[3];
        if (v23)
        {
          void *v23 = v45[3];
          v9[3] = 0;
        }
      }
    }
    else if (!v10 || (unint64_t)[(__CFString *)v10 length] >= 0xA0)
    {
      v24 = *(NSObject **)(a1 + 16);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_3;
      v26[3] = &unk_1E5984C18;
      v28 = &v54;
      v29 = &v60;
      v26[4] = a1;
      id v27 = v22;
      v30 = &v48;
      dispatch_async(v24, v26);

      goto LABEL_39;
    }
    (*((void (**)(id, uint64_t, uint64_t))v22 + 2))(v22, v55[5], v61[5]);
    -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](a1, (void *)v55[5], (void *)v49[5], 0);
LABEL_39:
    a1 = v45[3];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);
  }
  return a1;
}

void __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke(uint64_t a1)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 56))
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 32) file:@"DDScannerServer.m" lineNumber:881 description:@"Scan operation requested after tear down"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v3 = *(void *)(v2 + 64) + 1;
  *(void *)(v2 + 64) = v3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (__CFString *)*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v6 = v5;
  if (v4)
  {
    v7 = -[DDScannerServiceConfiguration recyclingIdentifier](v5);
    v8 = *(void **)(v4 + 48);
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = *(void **)(v4 + 48);
      *(void *)(v4 + 48) = v9;

      v8 = *(void **)(v4 + 48);
    }
    id v11 = [v8 objectForKeyedSubscript:v7];
    if (!v11)
    {
      id v11 = [DDScannerList alloc];
      v12 = v6;
      if (v11)
      {
        v82.receiver = v11;
        v82.super_class = (Class)DDScannerList;
        id v11 = (DDScannerList *)objc_msgSendSuper2(&v82, sel_init);
        if (v11)
        {
          uint64_t v13 = -[DDScannerServiceConfiguration recyclingIdentifier](v12);
          hash = v11->_hash;
          v11->_hash = (NSString *)v13;

          v11->_type = [(__CFString *)v12 scannerType];
          v11->_spotlightSuggestionsEnabled = [(__CFString *)v12 spotlightSuggestionsEnabled];
          uint64_t v15 = [(__CFString *)v12 language];
          language = v11->_language;
          v11->_language = (NSString *)v15;

          uint64_t v17 = [(__CFString *)v12 country];
          country = v11->_country;
          v11->_country = (NSString *)v17;

          v11->_languageHighConfidence = [(__CFString *)v12 languageHighConfidence];
        }
      }

      [*(id *)(v4 + 48) setObject:v11 forKeyedSubscript:v7];
    }
  }
  else
  {
    id v11 = 0;
  }

  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v11;

  if (*(unsigned char *)(a1 + 96)) {
    goto LABEL_13;
  }
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v23 || ![*(id *)(v23 + 64) count]) {
    goto LABEL_13;
  }
  uint64_t v24 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v24 + 40))
  {
LABEL_22:
    v26 = [MEMORY[0x1E4F28F80] processInfo];
    unint64_t v27 = [v26 activeProcessorCount];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v28 = [*(id *)(v24 + 48) allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v78 objects:&v82 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      unint64_t v31 = 0;
      uint64_t v32 = *(void *)v79;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v79 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v78 + 1) + 8 * v33);
          if (v34) {
            uint64_t v35 = [*(id *)(v34 + 64) count];
          }
          else {
            uint64_t v35 = 0;
          }
          v31 += v35;
          if (v31 >= v27)
          {

            goto LABEL_48;
          }
          ++v33;
        }
        while (v30 != v33);
        uint64_t v36 = [v28 countByEnumeratingWithState:&v78 objects:&v82 count:16];
        uint64_t v30 = v36;
      }
      while (v36);
    }

LABEL_13:
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v21 && [*(id *)(v21 + 56) count])
    {
      id v22 = [*(id *)(v21 + 56) lastObject];
      if (v22)
      {
        -[DDScannerList activateScanner:](v21, v22);
        [*(id *)(v21 + 56) removeLastObject];
      }
    }
    else
    {
      id v22 = 0;
    }
    uint64_t v37 = *(void *)(*(void *)(a1 + 80) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v22;

    uint64_t v39 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v40 = *(void *)(v39 + 40);
    if (v40)
    {
LABEL_67:
      *(void *)(v40 + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      return;
    }
    uint64_t v41 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v41)
    {
      v71 = 0;
      uint64_t v42 = 0;
LABEL_66:
      *(void *)(v39 + 40) = v42;

      uint64_t v40 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      if (!v40) {
        return;
      }
      goto LABEL_67;
    }
    uint64_t v42 = [DDScannerObject alloc];
    unsigned int v43 = *(_DWORD *)(v41 + 12);
    int v44 = *(unsigned __int8 *)(v41 + 8);
    int v45 = *(unsigned __int8 *)(v41 + 40);
    uint64_t v46 = *(void **)(v41 + 32);
    id v47 = *(id *)(v41 + 24);
    id v48 = v46;
    if (!v42
      || (v82.receiver = v42,
          v82.super_class = (Class)DDScannerObject,
          (uint64_t v42 = (DDScannerObject *)objc_msgSendSuper2(&v82, sel_init)) == 0))
    {
LABEL_65:

      -[DDScannerList activateScanner:](v41, v42);
      uint64_t v39 = *(void *)(*(void *)(a1 + 80) + 8);
      v71 = *(void **)(v39 + 40);
      goto LABEL_66;
    }
    if (v47)
    {
      int v73 = v45;
      int v74 = v44;
      v49 = (void *)MEMORY[0x1E4F1CA20];
      uint64_t v50 = [MEMORY[0x1E4F1CA20] currentLocale];
      v51 = [v50 localeIdentifier];
      v52 = [v49 componentsFromLocaleIdentifier:v51];
      id v53 = (void *)[v52 mutableCopy];

      [v53 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F1C438]];
      if (v48) {
        [v53 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F1C400]];
      }
      uint64_t v54 = (void *)MEMORY[0x1E4F1CA20];
      v55 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v53];
      CFLocaleRef v56 = [v54 localeWithLocaleIdentifier:v55];

      if (v56)
      {
        int v44 = v74;
        if (!v73)
        {
          uint64_t v57 = DDScannerCreateWithLocaleHint(v43, 0, v56, 0);
LABEL_59:
          v42->_scanner = (__DDScanner *)v57;
          if (v57)
          {
            v42->_type = v43;
            v42->_hasBasicType = v43 < 2;
            if (v44)
            {
              v42->_hasBasicType = 0;
              uint64_t v70 = *(void *)(v57 + 200);
              if ((v70 | 2) != v70)
              {
                *(void *)(v57 + 200) = v70 | 2;
                *(void *)(v57 + 136) = 0;
              }
            }
          }
          else
          {

            CFLocaleRef v56 = (const __CFLocale *)v42;
            uint64_t v42 = 0;
          }

          goto LABEL_65;
        }
      }
      else
      {
        int v44 = v74;
      }
    }
    else
    {
      CFLocaleRef v56 = 0;
    }
    uint64_t v57 = DDScannerCreateWithLocale(v43, 0, v56, 0);
    goto LABEL_59;
  }
  qos_class_t v25 = qos_class_self();
  if (v25 == qos_class_main())
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v24 + 40)) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_48:
  uint64_t v58 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_2;
  v75[3] = &unk_1E5984BC8;
  id v59 = *(id *)(a1 + 40);
  uint64_t v60 = *(void *)(a1 + 64);
  id v76 = v59;
  uint64_t v77 = v60;
  if (v58)
  {
    int64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v62 = v75;
    v63 = [DDScanStepBlockContainer alloc];
    v64 = v62;
    if (v63)
    {
      v82.receiver = v63;
      v82.super_class = (Class)DDScanStepBlockContainer;
      v63 = (DDScanStepBlockContainer *)objc_msgSendSuper2(&v82, sel_init);
      if (v63)
      {
        id v65 = _Block_copy(v64);
        id block = v63->_block;
        v63->_id block = v65;

        v63->_identifier = v61;
      }
    }

    v67 = *(void **)(v58 + 48);
    if (v67)
    {
      [v67 insertObject:v63 atIndex:0];
    }
    else
    {
      uint64_t v68 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v63, 0);
      v69 = *(void **)(v58 + 48);
      *(void *)(v58 + 48) = v68;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
}

void __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke(void *a1)
{
  v1 = a1;
  if (!*(unsigned char *)(a1[4] + 40)
    || (uint64_t v2 = a1[5]) != 0 && (a1 = (void *)[*(id *)(v2 + 64) count], a1 == (void *)1))
  {
    uint64_t v3 = v1[5];
    if (v3)
    {
      uint64_t v4 = [*(id *)(v3 + 48) lastObject];
      if (v4) {
        [*(id *)(v3 + 48) removeLastObject];
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(v1[7] + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = *(void *)(*(void *)(v1[7] + 8) + 40);
    if (v7)
    {
      uint64_t v8 = v1[6];
      if (v8) {
        *(void *)(v8 + 24) = *(void *)(v7 + 16);
      }
    }
  }
  if (!*(void *)(*(void *)(v1[7] + 8) + 40))
  {
    uint64_t v9 = v1[6];
    if (v9)
    {
      *(void *)(v9 + 24) = 0;
      uint64_t v10 = v1[5];
      a1 = (id)v1[6];
      id v11 = a1;
      if (v10 && a1)
      {
        id v22 = a1;
        uint64_t v12 = [*(id *)(v10 + 56) count];
        if (!v12) {
          goto LABEL_22;
        }
        if (*((unsigned char *)v22 + 20))
        {
          unint64_t v13 = v12;
          v14 = [MEMORY[0x1E4F28F80] processInfo];
          unint64_t v15 = [v14 activeProcessorCount];

          int v16 = [MEMORY[0x1E4F28F80] processInfo];
          unint64_t v17 = (unint64_t)[v16 physicalMemory] >> 30;

          if (v15 >= v17) {
            unint64_t v18 = v17;
          }
          else {
            unint64_t v18 = v15;
          }
          if (v18 <= 1) {
            unint64_t v18 = 1;
          }
          if (v13 < v18)
          {
LABEL_22:
            uint64_t v19 = *(void **)(v10 + 56);
            if (v19)
            {
              [v19 addObject:v22];
            }
            else
            {
              uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v22, 0);
              uint64_t v21 = *(void **)(v10 + 56);
              *(void *)(v10 + 56) = v20;
            }
          }
        }
        a1 = (void *)[*(id *)(v10 + 64) removeObject:v22];
        id v11 = v22;
      }
    }
    else
    {
      id v11 = 0;
    }
    MEMORY[0x1F41817F8](a1, v11);
  }
}

- (void)recycleScanner:(void *)a3 fromList:(int)a4 sameQueue:
{
  id v6 = a2;
  id v16 = a3;
  if (a1 && v6)
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    while (1)
    {
      uint64_t v26 = 0;
      unint64_t v27 = &v26;
      uint64_t v28 = 0x3032000000;
      uint64_t v29 = __Block_byref_object_copy_;
      uint64_t v30 = __Block_byref_object_dispose_;
      id v31 = 0;
      uint64_t v8 = *(NSObject **)(a1 + 8);
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke;
      block[3] = &unk_1E5984C68;
      block[4] = a1;
      id v9 = v16;
      id v23 = v9;
      qos_class_t v25 = &v26;
      id v10 = v6;
      id v11 = v6;
      id v24 = v11;
      dispatch_sync(v8, block);
      uint64_t v12 = v27[5];
      if (!v12) {
        break;
      }
      if (!a4)
      {
        v14 = *(NSObject **)(a1 + 16);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke_2;
        v17[3] = &unk_1E5984C68;
        uint64_t v21 = &v26;
        id v18 = v11;
        uint64_t v19 = a1;
        id v20 = v9;
        dispatch_async(v14, v17);

        break;
      }
      unint64_t v13 = (void (**)(id, id))*(id *)(v12 + 8);
      v13[2](v13, v11);

      _Block_object_dispose(&v26, 8);
      id v6 = v10;
    }

    _Block_object_dispose(&v26, 8);
    id v6 = v10;
  }
}

- (DDScanServerDispatcher)init
{
  v19.receiver = self;
  v19.super_class = (Class)DDScanServerDispatcher;
  id v2 = [(DDScanServerDispatcher *)&v19 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.datadetectors.scanner.server", v3);
    uint64_t v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    id v6 = MEMORY[0x1E4F14430];
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.datadetectors.scanner.work", v7);
    id v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v8;

    id v10 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.datadetectors.scanner.server", v10);
    uint64_t v12 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v11;

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 3uLL, *((dispatch_queue_t *)v2 + 1));
    v14 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v13;

    unint64_t v15 = *((void *)v2 + 4);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__DDScanServerDispatcher_init__block_invoke;
    handler[3] = &unk_1E5985760;
    id v18 = v2;
    dispatch_source_set_event_handler(v15, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 4));
  }
  return (DDScanServerDispatcher *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanners, 0);
  objc_storeStrong((id *)&self->_memoryWarningSource, 0);
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_scannerQueue, 0);
}

- (void)dealloc
{
  scannerQueue = self->_scannerQueue;
  if (scannerQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__DDScanServerDispatcher_dealloc__block_invoke;
    block[3] = &unk_1E5985760;
    block[4] = self;
    dispatch_sync(scannerQueue, block);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDScanServerDispatcher;
  [(DDScanServerDispatcher *)&v4 dealloc];
}

void __33__DDScanServerDispatcher_dealloc__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

uintptr_t __30__DDScanServerDispatcher_init__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uintptr_t result = dispatch_source_get_data(*(dispatch_source_t *)(v1 + 32));
  int v3 = result != 1;
  if (*(unsigned __int8 *)(v1 + 40) != v3) {
    *(unsigned char *)(v1 + 40) = v3;
  }
  return result;
}

void __36__DDScanServerDispatcher_cancelJob___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v23 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (v7)
        {
          uint64_t v8 = *(void *)(a1 + 40);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v9 = *(id *)(v7 + 64);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v29;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v29 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
                if (v14)
                {
                  if (*(void *)(v14 + 24) == v8)
                  {
                    *(unsigned char *)(*(void *)(v14 + 8) + 232) |= 1u;
LABEL_31:

                    goto LABEL_32;
                  }
                }
                else if (!v8)
                {
                  goto LABEL_31;
                }
                ++v13;
              }
              while (v11 != v13);
              uint64_t v15 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
              uint64_t v11 = v15;
            }
            while (v15);
          }

          uint64_t v16 = [*(id *)(v7 + 48) count];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = 0;
            while (1)
            {
              objc_super v19 = [*(id *)(v7 + 48) objectAtIndexedSubscript:v18];
              uint64_t v20 = v19 ? v19[2] : 0;

              if (v20 == v8) {
                break;
              }
              if (v17 == ++v18) {
                goto LABEL_27;
              }
            }
            uint64_t v21 = [*(id *)(v7 + 48) objectAtIndexedSubscript:v18];
            id v22 = (void *)v21;
            if (v21) {
              uint64_t v21 = *(void *)(v21 + 8);
            }
            (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);

            [*(id *)(v7 + 48) removeObjectAtIndex:v18];
            goto LABEL_32;
          }
        }
LABEL_27:
        uint64_t v5 = v23;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_32:
}

- (id)reportQueue
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

void __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v4 = *(void **)(*(void *)(a1[8] + 8) + 40);

  -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](v2, v3, v4, 1);
}

uint64_t __60__DDScanServerDispatcher_recycleScanner_fromList_sameQueue___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  (*(void (**)(uint64_t, void))(v3 + 16))(v3, a1[4]);
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];

  return -[DDScanServerDispatcher recycleScanner:fromList:sameQueue:](v4, v5, v6, 1);
}

uint64_t __58__DDScanServerDispatcher_scannerConf_sync_string_runTask___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __58__DDScanServerDispatcher__scriptForEmbeddingFromLanguage___block_invoke()
{
  v0 = (void *)_scriptForEmbeddingFromLanguage__latinLanguages;
  _scriptForEmbeddingFromLanguage__latinLanguages = (uint64_t)&unk_1EF03BE00;
}

uint64_t __41__DDScanServerDispatcher_emptyIdentifier__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 64) + 1;
  *(void *)(v1 + 64) = v2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

@end