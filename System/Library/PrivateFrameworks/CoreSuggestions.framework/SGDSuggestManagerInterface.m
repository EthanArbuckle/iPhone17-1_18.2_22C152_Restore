@interface SGDSuggestManagerInterface
+ (id)xpcInterface;
+ (id)xpcInterfaceForProtocol:(id)a3;
+ (void)_addSGXPCResponseToReplyWhitelistForMethods:(objc_method_description *)a3 count:(unsigned int)a4 interface:(id)a5;
+ (void)_addSGXPCResponseToReplyWhitelistForProtocol:(id)a3 interface:(id)a4;
+ (void)_initialize;
+ (void)_registerWhitelistBlock:(id)a3 forProtocol:(id)a4;
+ (void)_whitelistXPCInterface:(id)a3 forProtocol:(id)a4 alreadyWhitelisted:(id)a5;
+ (void)interface:(id)a3 returns:(Class)a4 forSelector:(SEL)a5;
+ (void)interface:(id)a3 returnsArrayOf:(Class)a4 forSelector:(SEL)a5;
@end

@implementation SGDSuggestManagerInterface

void __54__SGDSuggestManagerInterface_xpcInterfaceForProtocol___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 objectForKeyedSubscript:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:a1[5]];
    uint64_t v7 = *(void *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v9 = (void *)a1[7];
    uint64_t v10 = a1[5];
    uint64_t v11 = *(void *)(*(void *)(a1[6] + 8) + 40);
    v12 = objc_opt_new();
    [v9 _whitelistXPCInterface:v11 forProtocol:v10 alreadyWhitelisted:v12];

    [v13 setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[4]];
  }
}

+ (void)_whitelistXPCInterface:(id)a3 forProtocol:(id)a4 alreadyWhitelisted:(id)a5
{
  id v8 = a3;
  v9 = (Protocol *)a4;
  id v10 = a5;
  uint64_t v11 = [NSString stringWithUTF8String:protocol_getName(v9)];
  if (([v10 containsObject:v11] & 1) == 0)
  {
    [v10 addObject:v11];
    unsigned int outCount = 0;
    v12 = protocol_copyProtocolList(v9, &outCount);
    if (outCount)
    {
      for (unint64_t i = 0;
            i < outCount;
    }
    v14 = [(id)_whitelistBlocks objectForKeyedSubscript:v11];

    if (v14)
    {
      v15 = [(id)_whitelistBlocks objectForKeyedSubscript:v11];
      ((void (**)(void, id))v15)[2](v15, v8);
    }
    free(v12);
    [a1 _addSGXPCResponseToReplyWhitelistForProtocol:v9 interface:v8];
  }
}

+ (void)_addSGXPCResponseToReplyWhitelistForProtocol:(id)a3 interface:(id)a4
{
  unsigned int outCount = 0;
  id v6 = a4;
  uint64_t v7 = (Protocol *)a3;
  id v8 = protocol_copyMethodDescriptionList(v7, 1, 1, &outCount);
  [a1 _addSGXPCResponseToReplyWhitelistForMethods:v8 count:outCount interface:v6];
  free(v8);
  v9 = protocol_copyMethodDescriptionList(v7, 0, 1, &outCount);

  [a1 _addSGXPCResponseToReplyWhitelistForMethods:v9 count:outCount interface:v6];
  free(v9);
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_recentURLsWithLimit_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_limit_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_urlsFoundBetweenStartDate_endDate_excludingBundleIdentifiers_containingSubstring_flagFilter_limit_withCompletion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v29 = a2;
  [v3 interface:v29 returns:objc_opt_class() forSelector:sel_contactFromRecordId_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_cnContactMatchesForRecordId_withCompletion_];
  id v4 = (void *)_classSetPool;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 intern:v7];
  [v29 setClasses:v8 forSelector:sel_cnContactMatchesForRecordIds_withCompletion_ argumentIndex:0 ofReply:0];

  v9 = (void *)_classSetPool;
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  id v13 = [v9 intern:v12];
  [v29 setClasses:v13 forSelector:sel_cnContactMatchesForRecordIds_withCompletion_ argumentIndex:0 ofReply:1];

  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesWithContact_limitTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesWithContactIdentifier_limitTo_withCompletion_];
  v14 = (void *)_classSetPool;
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  v18 = [v14 intern:v17];
  [v29 setClasses:v18 forSelector:sel_contactMatchesWithContactIdentifiers_limitTo_withCompletion_ argumentIndex:0 ofReply:0];

  v19 = (void *)_classSetPool;
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  v23 = [v19 intern:v22];
  [v29 setClasses:v23 forSelector:sel_contactMatchesWithContactIdentifiers_limitTo_withCompletion_ argumentIndex:0 ofReply:1];

  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesWithFullTextSearch_limitTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesWithMessagingPrefix_limitTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesByPhoneNumber_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesByEmailAddress_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_contactMatchesBySocialProfile_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_birthdayExtractionsForInterval_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_celebrationExtractionsForInterval_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returns:objc_opt_class() forSelector:sel_interactionStoreLookupForDetail_withCompletion_];
  v24 = (void *)_classSetPool;
  id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  v28 = [v24 intern:v27];
  [v29 setClasses:v28 forSelector:sel_namesForDetailCacheSnapshotsWithCompletion_ argumentIndex:0 ofReply:1];

  [*(id *)(a1 + 32) interface:v29 returnsArrayOf:objc_opt_class() forSelector:sel_allContactsWithSnippets_limitTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v29 returns:objc_opt_class() forSelector:sel_originFromRecordId_completion_];
}

+ (void)interface:(id)a3 returnsArrayOf:(Class)a4 forSelector:(SEL)a5
{
  uint64_t v7 = (void *)_classSetPool;
  id v8 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  id v10 = [v8 alloc];
  uint64_t v11 = objc_opt_class();
  id v13 = (id)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), a4, 0);
  v12 = [v7 intern:v13];
  [v9 setClasses:v12 forSelector:a5 argumentIndex:0 ofReply:1];
}

+ (void)_addSGXPCResponseToReplyWhitelistForMethods:(objc_method_description *)a3 count:(unsigned int)a4 interface:(id)a5
{
  id v37 = a5;
  if (a4)
  {
    uint64_t v7 = a4;
    p_types = &a3->types;
    unint64_t v9 = 0x1E4F1C000uLL;
    do
    {
      id v10 = (void *)MEMORY[0x1A6265250]();
      uint64_t v11 = (uint64_t)*(p_types - 1);
      v12 = *p_types;
      if (v11)
      {
        if (!v12) {
          goto LABEL_15;
        }
      }
      else
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2, a1, @"SGDSuggestManagerInterface.m", 400, @"Invalid parameter not satisfying: %@", @"selector" object file lineNumber description];

        if (!v12)
        {
LABEL_15:
          v28 = [MEMORY[0x1E4F28B00] currentHandler];
          [v28 handleFailureInMethod:a2, a1, @"SGDSuggestManagerInterface.m", 401, @"Invalid parameter not satisfying: %@", @"types" object file lineNumber description];
        }
      }
      id v13 = [*(id *)(v9 + 2616) signatureWithObjCTypes:v12];
      if (!strcmp((const char *)objc_msgSend(v13, "getArgumentTypeAtIndex:", objc_msgSend(v13, "numberOfArguments") - 1), "@?"))
      {
        v36 = v10;
        v14 = [v37 classesForSelector:v11 argumentIndex:0 ofReply:1];
        if (![v14 count]
          || [v14 count] == 1
          && ([v14 anyObject],
              id v15 = objc_claimAutoreleasedReturnValue(),
              uint64_t v16 = (void *)[v15 alloc],
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v16,
              v15,
              (isKindOfClass & 1) != 0))
        {
          uint64_t v35 = _classSetPool;
          id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v33 = objc_opt_class();
          uint64_t v32 = objc_opt_class();
          uint64_t v18 = objc_opt_class();
          unint64_t v19 = v9;
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = objc_opt_class();
          uint64_t v29 = v20;
          unint64_t v9 = v19;
          v23 = objc_msgSend(v34, "initWithObjects:", v33, v32, v18, v29, v21, v22, objc_opt_class(), 0);
          v24 = (void *)v35;
        }
        else
        {
          uint64_t v25 = _classSetPool;
          v23 = [v14 setByAddingObject:objc_opt_class()];
          v24 = (void *)v25;
        }
        uint64_t v26 = [v24 intern:v23];
        id v10 = v36;

        [v37 setClasses:v26 forSelector:v11 argumentIndex:0 ofReply:1];
      }

      p_types += 2;
      --v7;
    }
    while (v7);
  }
}

+ (void)interface:(id)a3 returns:(Class)a4 forSelector:(SEL)a5
{
  uint64_t v7 = (void *)_classSetPool;
  id v8 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  id v11 = (id)objc_msgSend([v8 alloc], "initWithObjects:", a4, objc_opt_class(), 0);
  id v10 = [v7 intern:v11];
  [v9 setClasses:v10 forSelector:a5 argumentIndex:0 ofReply:1];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_whitelistBlocks;
  _whitelistBlocks = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93B38]) initWithBehavior:1 copyWithZone:0];
  id v5 = (void *)_classSetPool;
  _classSetPool = v4;

  uint64_t v6 = (void *)_classSetPool;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  uint64_t v16 = [v6 intern:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [v17 initWithGuardedData:v18];
  uint64_t v20 = (void *)_interfaces;
  _interfaces = v19;

  uint64_t v21 = *(void **)(a1 + 32);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_2;
  v48[3] = &unk_1E5B8FD88;
  id v22 = v16;
  uint64_t v23 = *(void *)(a1 + 32);
  id v49 = v22;
  uint64_t v50 = v23;
  [v21 _registerWhitelistBlock:v48 forProtocol:&unk_1EF935AA0];
  v24 = *(void **)(a1 + 32);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_3;
  v47[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v47[4] = v24;
  [v24 _registerWhitelistBlock:v47 forProtocol:&unk_1EF935F38];
  uint64_t v25 = *(void **)(a1 + 32);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_4;
  v46[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v46[4] = v25;
  [v25 _registerWhitelistBlock:v46 forProtocol:&unk_1EF9360C0];
  uint64_t v26 = *(void **)(a1 + 32);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_5;
  v43[3] = &unk_1E5B8FD88;
  v45 = v26;
  id v27 = v22;
  id v44 = v27;
  [v26 _registerWhitelistBlock:v43 forProtocol:&unk_1EF936D68];
  v28 = *(void **)(a1 + 32);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_6;
  v42[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v42[4] = v28;
  [v28 _registerWhitelistBlock:v42 forProtocol:&unk_1EF9365F0];
  uint64_t v29 = *(void **)(a1 + 32);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_7;
  v41[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v41[4] = v29;
  [v29 _registerWhitelistBlock:v41 forProtocol:&unk_1EF9362F0];
  v30 = *(void **)(a1 + 32);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_8;
  v40[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v40[4] = v30;
  [v30 _registerWhitelistBlock:v40 forProtocol:&unk_1EF9364A0];
  v31 = *(void **)(a1 + 32);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_9;
  v39[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v39[4] = v31;
  [v31 _registerWhitelistBlock:v39 forProtocol:&unk_1EF936528];
  uint64_t v32 = *(void **)(a1 + 32);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_10;
  v38[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v38[4] = v32;
  [v32 _registerWhitelistBlock:v38 forProtocol:&unk_1EF9351C0];
  uint64_t v33 = *(void **)(a1 + 32);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke_11;
  v35[3] = &unk_1E5B8FD88;
  id v36 = v27;
  id v37 = v33;
  id v34 = v27;
  [v33 _registerWhitelistBlock:v35 forProtocol:&unk_1EF936EF0];
  [*(id *)(a1 + 32) _registerWhitelistBlock:&__block_literal_global_5394 forProtocol:&unk_1EF937038];
  [*(id *)(a1 + 32) _registerWhitelistBlock:&__block_literal_global_370 forProtocol:&unk_1EF936FA8];
}

+ (void)_registerWhitelistBlock:(id)a3 forProtocol:(id)a4
{
  id v5 = (Protocol *)a4;
  id v11 = (id)[a3 copy];
  uint64_t v6 = (void *)MEMORY[0x1A62654A0]();
  id v7 = (void *)_whitelistBlocks;
  uint64_t v8 = NSString;
  Name = protocol_getName(v5);

  uint64_t v10 = [v8 stringWithUTF8String:Name];
  [v7 setObject:v6 forKeyedSubscript:v10];
}

+ (id)xpcInterfaceForProtocol:(id)a3
{
  uint64_t v4 = (Protocol *)a3;
  [a1 _initialize];
  id v5 = [NSString stringWithUTF8String:protocol_getName(v4)];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__5390;
  uint64_t v20 = __Block_byref_object_dispose__5391;
  id v21 = 0;
  uint64_t v6 = (void *)_interfaces;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SGDSuggestManagerInterface_xpcInterfaceForProtocol___block_invoke;
  v11[3] = &unk_1E5B8FE10;
  uint64_t v14 = &v16;
  id v7 = v5;
  id v12 = v7;
  uint64_t v8 = v4;
  uint64_t v13 = v8;
  id v15 = a1;
  [v6 runWithLockAcquired:v11];
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (void)_initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SGDSuggestManagerInterface__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_initialize_onceToken != -1) {
    dispatch_once(&_initialize_onceToken, block);
  }
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v75 = a2;
  [v75 setClasses:v3 forSelector:sel_suggestionsFromSearchableItem_options_withCompletion_ argumentIndex:0 ofReply:1];
  [v75 setClasses:*(void *)(a1 + 32) forSelector:sel_suggestionsFromSearchableItem_options_processingType_withCompletion_ argumentIndex:0 ofReply:1];
  [v75 setClasses:*(void *)(a1 + 32) forSelector:sel_harvestedSuggestionsFromSearchableItem_options_withCompletion_ argumentIndex:0 ofReply:1];
  uint64_t v4 = (void *)_classSetPool;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 intern:v7];
  [v75 setClasses:v8 forSelector:sel_reportMessagesFound_lost_withCompletion_ argumentIndex:0 ofReply:0];

  id v9 = (void *)_classSetPool;
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v9 intern:v12];
  [v75 setClasses:v13 forSelector:sel_reportMessagesFound_lost_withCompletion_ argumentIndex:1 ofReply:0];

  uint64_t v14 = (void *)_classSetPool;
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  id v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  uint64_t v18 = [v14 intern:v17];
  [v75 setClasses:v18 forSelector:sel_updateMessages_state_completion_ argumentIndex:0 ofReply:0];

  uint64_t v19 = (void *)_classSetPool;
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v21 = objc_opt_class();
  id v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
  uint64_t v23 = [v19 intern:v22];
  [v75 setClasses:v23 forSelector:sel_messagesToRefreshWithCompletion_ argumentIndex:0 ofReply:1];

  v24 = (void *)_classSetPool;
  id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v26 = objc_opt_class();
  id v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  v28 = [v24 intern:v27];
  [v75 setClasses:v28 forSelector:sel_fullDownloadRequestBatch_withCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v29 = (void *)_classSetPool;
  id v30 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_msgSend(v30, "initWithObjects:", v31, objc_opt_class(), 0);
  uint64_t v33 = [v29 intern:v32];
  [v75 setClasses:v33 forSelector:sel_resolveFullDownloadRequests_withCompletion_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_saliencyFromRFC822Data_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returnsArrayOf:objc_opt_class() forSelector:sel_topSalienciesForMailboxId_limit_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returnsArrayOf:objc_opt_class() forSelector:sel_sortedSaliencyResultsRestrictedToMailboxTypes_mailboxIds_receivedOnOrAfter_ascending_limit_withCompletion_];
  id v34 = (void *)_classSetPool;
  id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v36 = objc_opt_class();
  id v37 = objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
  v38 = [v34 intern:v37];
  [v75 setClasses:v38 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:3 ofReply:0];

  v39 = (void *)_classSetPool;
  id v40 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v40, "initWithObjects:", v41, objc_opt_class(), 0);
  v43 = [v39 intern:v42];
  [v75 setClasses:v43 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:4 ofReply:0];

  id v44 = (void *)_classSetPool;
  id v45 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v45, "initWithObjects:", v46, objc_opt_class(), 0);
  v48 = [v44 intern:v47];
  [v75 setClasses:v48 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:5 ofReply:0];

  id v49 = (void *)_classSetPool;
  id v50 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v50, "initWithObjects:", v51, objc_opt_class(), 0);
  v53 = [v49 intern:v52];
  [v75 setClasses:v53 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:6 ofReply:0];

  v54 = (void *)_classSetPool;
  id v55 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v56 = objc_opt_class();
  v57 = objc_msgSend(v55, "initWithObjects:", v56, objc_opt_class(), 0);
  v58 = [v54 intern:v57];
  [v75 setClasses:v58 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:7 ofReply:0];

  v59 = (void *)_classSetPool;
  id v60 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v61 = objc_opt_class();
  v62 = objc_msgSend(v60, "initWithObjects:", v61, objc_opt_class(), 0);
  v63 = [v59 intern:v62];
  [v75 setClasses:v63 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:8 ofReply:0];

  v64 = (void *)_classSetPool;
  id v65 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  uint64_t v69 = objc_opt_class();
  v70 = objc_msgSend(v65, "initWithObjects:", v66, v67, v68, v69, objc_opt_class(), 0);
  v71 = [v64 intern:v70];
  [v75 setClasses:v71 forSelector:sel_identifyComposeWarningsFromSubject_content_attributes_toRecipients_ccRecipients_bccRecipients_originalToRecipients_originalCcRecipients_attachments_withCompletion_ argumentIndex:0 ofReply:1];

  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_reportUserEngagement_forWarning_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_reportValue_forFeatureSetting_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_reportMailIntelligenceFollowUpUserEngagement_forStringFromFollowUpWarning_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returnsArrayOf:objc_opt_class() forSelector:sel_sortedUnsubscriptionOpportunitiesForField_minCount_minScore_limit_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returnsArrayOf:objc_opt_class() forSelector:sel_sortedUnsubscriptionOpportunitiesForField_limit_withCompletion_];
  v72 = (void *)_classSetPool;
  v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  v74 = [v72 intern:v73];
  [v75 setClasses:v74 forSelector:sel_saliencyFromEmailHeaders_withCompletion_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_identifyFollowUpWarningFromSubject_body_date_withCompletion_];
  [*(id *)(a1 + 40) interface:v75 returns:objc_opt_class() forSelector:sel_saliencyFromEmailHeaders_withCompletion_];
  [v75 setClasses:*(void *)(a1 + 32) forSelector:sel_dissectAttachmentsFromSearchableItem_options_withCompletion_ argumentIndex:0 ofReply:1];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  [v3 interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_eventsStartingAt_endingAt_limitTo_options_withCompletion_];
  [*(id *)(a1 + 40) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_eventsStartingAt_endingAt_prefix_limitTo_options_withCompletion_];
  [*(id *)(a1 + 40) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_eventsInFutureLimitTo_options_withCompletion_];
  [*(id *)(a1 + 40) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion_];
  [v4 setClasses:*(void *)(a1 + 32) forSelector:sel_suggestionsFromRFC822Data_source_options_withCompletion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:*(void *)(a1 + 32) forSelector:sel_suggestionsFromEmailContent_headers_source_options_withCompletion_ argumentIndex:0 ofReply:1];
  [v4 setClasses:*(void *)(a1 + 32) forSelector:sel_suggestionsFromSimpleMailMessage_headers_options_withCompletion_ argumentIndex:0 ofReply:1];
  id v5 = (void *)_classSetPool;
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  id v9 = (id)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v8 = [v5 intern:v9];
  [v4 setClasses:v8 forSelector:sel_addInteractions_bundleId_completion_ argumentIndex:0 ofReply:0];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_ipsosMessagesFromSearchableItems_withCompletion_];
  id v5 = (void *)_classSetPool;
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v5 intern:v8];
  [v4 setClasses:v9 forSelector:sel_ipsosMessagesFromSearchableItems_withCompletion_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 32) interface:v4 returns:objc_opt_class() forSelector:sel_titleSuggestionForMessage_withCompletion_];
  id v10 = (void *)_classSetPool;
  id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  uint64_t v11 = [v10 intern:v12];
  [v4 setClasses:v11 forSelector:sel_titleSuggestionForMessage_withCompletion_ argumentIndex:0 ofReply:0];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_schemaOrgToEvents_completion_];
  [*(id *)(a1 + 32) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_allEventsLimitedTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returns:objc_opt_class() forSelector:sel_isEventCandidateForURL_title_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_suggestionsFromURL_title_HTMLPayload_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returns:objc_opt_class() forSelector:sel_eventFromUniqueId_completion_];
  [*(id *)(a1 + 32) interface:v4 returns:objc_opt_class() forSelector:sel_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 interface:v4 returnsArrayOf:objc_opt_class() forSelector:sel_allRemindersLimitedTo_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returns:objc_opt_class() forSelector:sel_reminderTitleForContent_withCompletion_];
  [*(id *)(a1 + 32) interface:v4 returns:0 forSelector:sel_logUserCreatedReminderTitle_withCompletion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 interface:v3 returnsArrayOf:objc_opt_class() forSelector:sel_allDeliveriesWithLimit_withCompletion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 interface:v3 returns:objc_opt_class() forSelector:sel_foundInStringForRecordId_style_withCompletion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_11(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  id v9 = a2;
  v10[0] = sel_suggestionsFromMessage_options_completionHandler_;
  v10[1] = sel_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler_;
  v10[2] = sel_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler_;
  do
    [v9 setClasses:*(void *)(a1 + 32) forSelector:v10[v3++] argumentIndex:0 ofReply:1];
  while (v3 != 3);
  id v4 = (void *)_classSetPool;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v4 intern:v7];
  [v9 setClasses:v8 forSelector:sel_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler_ argumentIndex:0 ofReply:0];

  [*(id *)(a1 + 40) interface:v9 returns:objc_opt_class() forSelector:sel_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion_];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)_classSetPool;
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = objc_opt_class();
  id v8 = (id)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v7 = [v2 intern:v8];
  [v4 setClasses:v7 forSelector:sel_evaluateRecipe_attachments_completion_ argumentIndex:1 ofReply:0];
}

void __41__SGDSuggestManagerInterface__initialize__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)_classSetPool;
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = objc_opt_class();
  id v8 = (id)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v7 = [v2 intern:v8];
  [v4 setClasses:v7 forSelector:sel_extractAttributesAndDonate_withCompletion_ argumentIndex:0 ofReply:1];
}

+ (id)xpcInterface
{
  return (id)[a1 xpcInterfaceForProtocol:&unk_1EF937098];
}

@end