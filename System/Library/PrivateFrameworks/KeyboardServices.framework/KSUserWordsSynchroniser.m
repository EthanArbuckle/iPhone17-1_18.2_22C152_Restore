@interface KSUserWordsSynchroniser
@end

@implementation KSUserWordsSynchroniser

void __42___KSUserWordsSynchroniser_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_synchroniser;
  sharedInstance_synchroniser = (uint64_t)v1;
}

void __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke(uint64_t a1)
{
  v2 = [_KSSystemTask alloc];
  v3 = _KSGetSetting(ksDefaultPushTime, &unk_26DE92A38);
  uint64_t v4 = (int)[v3 intValue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke_59;
  v9[3] = &unk_2648918A8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v5 = [(_KSSystemTask *)v2 initWithName:@"com.apple.keyboardServices.userWords.pusher" isPeriodic:1 period:v4 handler:v9];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  if (*(unsigned char *)(*(void *)(a1 + 32) + 40))
  {
    v8 = +[_KSTaskScheduler sharedInstance];
    [v8 registerTask:*(void *)(*(void *)(a1 + 32) + 32)];
  }
}

void __68___KSUserWordsSynchroniser_initForTestingWithManager_enablePushing___block_invoke_59(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  [v2 checkForDownload:0 uploads:0 allLanguages:0];
  v3[2]();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = KSCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_4(a1, v2);
    }

    [*(id *)(a1 + 32) disable];
  }
  if (*(void *)(a1 + 40) == 1)
  {
    if (*(unsigned char *)(a1 + 49))
    {
      if (*(unsigned char *)(a1 + 50))
      {
        [*(id *)(a1 + 32) checkConfiguration];
        *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
        if (*(void *)(*(void *)(a1 + 32) + 32))
        {
          if (*(unsigned char *)(a1 + 48))
          {
            v3 = +[_KSTaskScheduler sharedInstance];
            [v3 registerTask:*(void *)(*(void *)(a1 + 32) + 32)];
          }
        }
        return;
      }
      uint64_t v4 = KSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_2(v4, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      uint64_t v4 = KSCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_1(v4, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else
  {
    uint64_t v4 = KSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_3(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  if ([*(id *)(*(void *)(a1 + 32) + 24) checkIfExists]) {
    [*(id *)(a1 + 32) disable];
  }
}

void __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2;
  v7[3] = &unk_264890A70;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2(uint64_t a1)
{
  v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 1;
  [*(id *)(a1 + 32) checkConfiguration];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3;
  v6[3] = &unk_264891A48;
  id v7 = v3;
  id v5 = v3;
  [v4 modifyInformationWithOperations:v6];
}

uint64_t __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return 1;
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_4(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[5];
  if ([*((id *)a1[6] + 3) checkIfExists])
  {
    if (!v3)
    {
      uint64_t v4 = [a1[6] information];
      id v3 = [v4 objectForKey:@"Languages"];

      if (!v2)
      {
        id v3 = v3;
        id v2 = v3;
      }
    }
    [a1[6] checkProgress:0 withInfo:MEMORY[0x263EFFA88]];
    if ([a1[7] count])
    {
      uint64_t v5 = 0;
    }
    else
    {
      (*((void (**)(void))a1[8] + 2))();
      uint64_t v5 = 1;
    }
    uint64_t v6 = [(id)objc_opt_class() infoClass];
    id v7 = a1[6];
    id v8 = a1[7];
    id v9 = v2;
    id v10 = v8;
    uint64_t v11 = v10;
    uint64_t v12 = v10;
    if (v9 && (uint64_t v12 = v9, v10))
    {
      id v13 = [v9 arrayByAddingObjectsFromArray:v10];
    }
    else
    {
      id v13 = v12;
    }
    uint64_t v14 = v13;

    uint64_t v15 = [v7 generateRecordListForLanguages:v14];

    id v16 = a1[6];
    uint64_t v17 = [v15 allKeys];
    uint64_t v18 = +[_KSUserWordsInfo keyNamesExcludingData];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5;
    v22[3] = &unk_264891B38;
    id v19 = a1[6];
    id v20 = a1[7];
    id v23 = v15;
    id v24 = v19;
    uint64_t v29 = v6;
    id v25 = v20;
    id v2 = v9;
    id v26 = v2;
    uint64_t v30 = v5;
    id v28 = a1[8];
    id v3 = v3;
    id v27 = v3;
    id v21 = v15;
    [v16 readFilesWithRecordIDs:v17 forColumns:v18 priority:v5 withCompletionHandler:v22];
  }
  else
  {
    [a1[6] checkProgress:0 withInfo:MEMORY[0x263EFFA80]];
  }
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5_cold_1();
    }
  }
  id v8 = [MEMORY[0x263EFF980] array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v91 objects:v104 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v92 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v91 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v91 objects:v104 count:16];
    }
    while (v11);
  }

  uint64_t v15 = *(void **)(a1 + 40);
  v67 = v8;
  v68 = v6;
  if (v6)
  {
    v102[0] = @"Error";
    v102[1] = @"Languages";
    v103[0] = v6;
    v103[1] = v8;
    id v16 = NSDictionary;
    uint64_t v17 = (void **)v103;
    uint64_t v18 = (__CFString **)v102;
    uint64_t v19 = 2;
  }
  else
  {
    v100 = @"Languages";
    v101 = v8;
    id v16 = NSDictionary;
    uint64_t v17 = &v101;
    uint64_t v18 = &v100;
    uint64_t v19 = 1;
  }
  id v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
  [v15 checkProgress:1 withInfo:v20];

  id v21 = (void *)MEMORY[0x263EFF980];
  uint64_t v22 = [*(id *)(a1 + 32) allKeys];
  id v23 = [v21 arrayWithArray:v22];

  id v24 = [v9 allKeys];
  v70 = v23;
  [v23 removeObjectsInArray:v24];

  v72 = [MEMORY[0x263EFF980] array];
  v71 = [MEMORY[0x263EFF9A0] dictionary];
  v69 = [MEMORY[0x263EFF9A0] dictionary];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v25 = v9;
  uint64_t v75 = [v25 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v75)
  {
    id v73 = v25;
    uint64_t v74 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v75; ++j)
      {
        if (*(void *)v88 != v74) {
          objc_enumerationMutation(v25);
        }
        id v27 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        id v28 = *(void **)(a1 + 80);
        uint64_t v29 = [v25 objectForKeyedSubscript:v27];
        uint64_t v30 = [v28 infoWithRecord:v29];

        v31 = *(void **)(a1 + 80);
        v32 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
        v33 = [v31 filesForLanguage:v32];

        v34 = [*(id *)(a1 + 80) infoWithFiles:v33];
        v35 = v34;
        if (v33) {
          BOOL v36 = v34 == 0;
        }
        else {
          BOOL v36 = 1;
        }
        if (!v36)
        {
          if ([v34 isBetterThan:v30])
          {
            v44 = *(void **)(a1 + 56);
            v45 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
            LODWORD(v44) = [v44 containsObject:v45];

            if (v44)
            {
              [v70 addObject:v27];
              [v71 setObject:v35 forKey:v70];
              [v69 setObject:v33 forKey:v70];
              v46 = @"Ours is better";
LABEL_38:
              -[__CFString stringByAppendingFormat:](v46, "stringByAppendingFormat:", @" (ours = %@; theirs = %@)",
                v35,
              v51 = v30);

              v52 = *(void **)(a1 + 40);
              v95[0] = @"RecordID";
              v53 = [v27 recordName];
              v96[0] = v53;
              v95[1] = @"Language";
              uint64_t v54 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
              v55 = (void *)v54;
              v56 = @"LANGUAGE MISSING";
              if (v54) {
                v56 = (__CFString *)v54;
              }
              v95[2] = @"Disposition";
              v96[1] = v56;
              v96[2] = v51;
              v57 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:3];
              [v52 checkProgress:2 withInfo:v57];

              id v25 = v73;
              goto LABEL_41;
            }
            v49 = @"Ours is better";
            v50 = @" [upload disabled]";
          }
          else
          {
            v46 = @"Equal!";
            if (![v30 isBetterThan:v35]) {
              goto LABEL_38;
            }
            v47 = *(void **)(a1 + 48);
            v48 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
            LODWORD(v47) = [v47 containsObject:v48];

            if (v47)
            {
              [v72 addObject:v27];
              [v71 setObject:v35 forKey:v72];
              v46 = @"Server is better";
              goto LABEL_38;
            }
            v49 = @"Server is better";
            v50 = @" [download disabled]";
          }
          v46 = [(__CFString *)v49 stringByAppendingString:v50];
          goto LABEL_38;
        }
        v97[0] = @"Language";
        v37 = *(void **)(a1 + 40);
        uint64_t v38 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
        v39 = (void *)v38;
        v40 = @"LANGUAGE MISSING";
        if (v38) {
          v40 = (__CFString *)v38;
        }
        v97[1] = @"Disposition";
        v98[0] = v40;
        v98[1] = @"No local copy";
        v41 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
        [v37 checkProgress:2 withInfo:v41];

        v42 = *(void **)(a1 + 48);
        v43 = [*(id *)(a1 + 32) objectForKeyedSubscript:v27];
        LODWORD(v42) = [v42 containsObject:v43];

        if (v42) {
          [v72 addObject:v27];
        }
LABEL_41:
      }
      uint64_t v75 = [v25 countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v75);
  }

  v58 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_131;
  block[3] = &unk_264891B10;
  id v77 = v70;
  id v78 = v71;
  uint64_t v59 = *(void *)(a1 + 80);
  id v79 = v69;
  uint64_t v85 = v59;
  id v60 = *(id *)(a1 + 32);
  uint64_t v61 = *(void *)(a1 + 40);
  id v80 = v60;
  uint64_t v81 = v61;
  uint64_t v62 = *(void *)(a1 + 88);
  id v82 = v72;
  uint64_t v86 = v62;
  id v84 = *(id *)(a1 + 72);
  id v83 = *(id *)(a1 + 64);
  id v63 = v72;
  id v64 = v69;
  id v65 = v71;
  id v66 = v70;
  dispatch_async(v58, block);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_131(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  group = dispatch_group_create();
  v39 = [MEMORY[0x263EFF9A0] dictionary];
  v42 = [MEMORY[0x263EFF980] array];
  v41 = [MEMORY[0x263EFF980] array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v45 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (!v45) {
    goto LABEL_22;
  }
  unint64_t v2 = 0x263EFD000uLL;
  uint64_t v44 = *(void *)v62;
  do
  {
    uint64_t v3 = 0;
    do
    {
      if (*(void *)v62 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v4 = *(void *)(*((void *)&v61 + 1) + 8 * v3);
      uint64_t v5 = [objc_alloc(*(Class *)(v2 + 1992)) initWithRecordType:@"UserWordFile" recordID:v4];
      id v6 = [*(id *)(a1 + 40) objectForKey:v4];
      id v7 = [*(id *)(a1 + 48) objectForKey:v4];
      if (v7)
      {
        if (v6) {
          goto LABEL_8;
        }
      }
      else
      {
        id v20 = *(void **)(a1 + 96);
        [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
        v22 = uint64_t v21 = v5;
        id v7 = [v20 filesForLanguage:v22];

        uint64_t v5 = v21;
        if (v6) {
          goto LABEL_8;
        }
      }
      id v6 = [*(id *)(a1 + 96) infoWithFiles:v7];
LABEL_8:
      if (v7) {
        BOOL v8 = v6 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        v66[0] = @"Language";
        id v9 = (void *)v5;
        uint64_t v10 = *(void **)(a1 + 64);
        uint64_t v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
        uint64_t v14 = (void *)v11;
        if (v11) {
          uint64_t v12 = (__CFString *)v11;
        }
        else {
          uint64_t v12 = @"LANGUAGE MISSING";
        }
        v66[1] = @"Disposition";
        v67[0] = v12;
        v67[1] = @"No local copy for initial push";
        uint64_t v19 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
        id v13 = v10;
        uint64_t v18 = v9;
        [v13 checkProgress:2 withInfo:v19];
      }
      else
      {
        uint64_t v14 = [v7 serialiseToTemporaryFile];
        [v6 saveToRecord:v5];
        uint64_t v15 = (void *)v5;
        id v16 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:v14];
        uint64_t v17 = [*(id *)(a1 + 96) keyForData];
        [v15 setObject:v16 forKeyedSubscript:v17];

        unint64_t v2 = 0x263EFD000;
        uint64_t v18 = v15;
        [v42 addObject:v15];
        uint64_t v19 = [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
        [v41 addObject:v19];
      }

      ++v3;
    }
    while (v45 != v3);
    uint64_t v23 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    uint64_t v45 = v23;
  }
  while (v23);
LABEL_22:

  if ([v42 count])
  {
    id v24 = group;
    dispatch_group_enter(group);
    [*(id *)(a1 + 64) checkProgress:3 withInfo:v41];
    id v25 = *(void **)(a1 + 64);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_137;
    v58[3] = &unk_264891A98;
    id v26 = v39;
    id v59 = v39;
    id v60 = group;
    [v25 overwriteFilesWithRecords:v42 withCompletionHandler:v58];
  }
  else
  {
    id v26 = v39;
    [v39 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"push"];
    id v24 = group;
  }
  if ([*(id *)(a1 + 72) count])
  {
    dispatch_group_enter(v24);
    id v27 = *(void **)(a1 + 64);
    uint64_t v28 = *(void *)(a1 + 72);
    uint64_t v29 = [*(id *)(a1 + 96) keyForData];
    id v65 = v29;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
    uint64_t v31 = *(void *)(a1 + 104);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142;
    v48[3] = &unk_264891AE8;
    id v32 = *(id *)(a1 + 56);
    uint64_t v33 = *(void *)(a1 + 96);
    id v49 = v32;
    uint64_t v57 = v33;
    id v50 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 48);
    uint64_t v35 = *(void *)(a1 + 64);
    id v51 = v34;
    uint64_t v52 = v35;
    id v53 = v26;
    id v56 = *(id *)(a1 + 88);
    id v54 = *(id *)(a1 + 80);
    v55 = v24;
    [v27 readFilesWithRecordIDs:v28 forColumns:v30 priority:v31 withCompletionHandler:v48];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [v26 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"pull"];
  }
  uint64_t v36 = *(void *)(a1 + 64);
  v37 = *(NSObject **)(v36 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3_151;
  block[3] = &unk_264891550;
  void block[4] = v36;
  id v47 = v26;
  id v38 = v26;
  dispatch_group_notify(v24, v37, block);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_137(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA88];
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"push"];
  if (v4)
  {
    id v6 = KSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_137_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142(id *a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v32 = a3;
  if (v32)
  {
    id v6 = KSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142_cold_2();
    }
  }
  uint64_t v33 = [MEMORY[0x263EFF980] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v44;
    *(void *)&long long v8 = 136316162;
    long long v31 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(a1[4], "objectForKeyedSubscript:", v11, v31);
        BOOL v13 = v12 == 0;

        if (!v13)
        {
          uint64_t v14 = [obj objectForKeyedSubscript:v11];
          if (v14)
          {
            uint64_t v15 = [a1[12] keyForData];
            id v16 = [v14 objectForKeyedSubscript:v15];

            if (v16)
            {
              uint64_t v17 = [v16 fileURL];
              uint64_t v18 = +[_KSFileEntry entryWithSerialisedDataAtURL:v17];

              if (v18)
              {
                uint64_t v19 = [a1[5] objectForKey:v11];
                if (v19) {
                  goto LABEL_18;
                }
                id v20 = [a1[6] objectForKey:v11];
                if (!v20)
                {
                  id v21 = a1[12];
                  uint64_t v22 = [a1[4] objectForKeyedSubscript:v11];
                  id v20 = [v21 filesForLanguage:v22];
                }
                uint64_t v19 = [a1[12] infoWithFiles:v20];

                if (v19)
                {
LABEL_18:
                  uint64_t v23 = [a1[12] infoWithFiles:v18];
                  id v24 = v23;
                  if (!v23 || ([v23 isBetterThan:v19] & 1) != 0)
                  {

                    goto LABEL_21;
                  }
                  uint64_t v28 = KSCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                    __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142_cold_1(v47, &v48, v28);
                  }
                }
                else
                {
LABEL_21:
                  block[0] = MEMORY[0x263EF8330];
                  block[1] = 3221225472;
                  block[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_144;
                  block[3] = &unk_264891AC0;
                  void block[4] = a1[7];
                  id v40 = a1[4];
                  uint64_t v41 = v11;
                  id v42 = v18;
                  dispatch_async(MEMORY[0x263EF83A0], block);
                  id v25 = [a1[4] objectForKeyedSubscript:v11];
                  [v33 addObject:v25];
                }
              }
            }
            else
            {
              id v27 = KSCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = [a1[4] objectForKeyedSubscript:v11];
                *(_DWORD *)buf = 136315650;
                id v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
                __int16 v51 = 2112;
                uint64_t v52 = v11;
                __int16 v53 = 2112;
                id v54 = v29;
                _os_log_error_impl(&dword_22B2BC000, v27, OS_LOG_TYPE_ERROR, "%s  No CKAsset associated with record (%@/%@)", buf, 0x20u);
              }
            }
          }
          else
          {
            id v16 = KSCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v26 = [a1[4] objectForKeyedSubscript:v11];
              *(_DWORD *)buf = 136315650;
              id v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
              __int16 v51 = 2112;
              uint64_t v52 = v11;
              __int16 v53 = 2112;
              id v54 = v26;
              _os_log_error_impl(&dword_22B2BC000, v16, OS_LOG_TYPE_ERROR, "%s  Results inconsistency error - no record for %@ (%@)", buf, 0x20u);
            }
          }

          goto LABEL_34;
        }
        uint64_t v14 = KSCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v50 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
          __int16 v51 = 2112;
          uint64_t v52 = v11;
          _os_log_error_impl(&dword_22B2BC000, v14, OS_LOG_TYPE_ERROR, "%s  Unexpected result - record ID %@ not in request map", buf, 0x16u);
        }
LABEL_34:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v7);
  }

  [a1[7] checkProgress:4 withInfo:v33];
  [a1[8] setObject:v33 forKeyedSubscript:@"pull"];
  uint64_t v30 = *((void *)a1[7] + 1);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_148;
  v35[3] = &unk_2648908B8;
  id v38 = a1[11];
  id v36 = a1[9];
  id v37 = a1[10];
  dispatch_async(v30, v35);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_144(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  v6[0] = @"_KSUserWordsWereDownloadedLanguageKey";
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 48)];
  v6[1] = @"_KSUserWordsWereDownloadedFilesKey";
  v7[0] = v4;
  v7[1] = *(void *)(a1 + 56);
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v2 postNotificationName:@"_KSUserWordsWereDownloadedNotification" object:v3 userInfo:v5];
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_148(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  unint64_t v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

uint64_t __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_3_151(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkProgress:5 withInfo:*(void *)(a1 + 40)];
}

void __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 24) checkIfExists])
  {
    unint64_t v2 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__6;
    uint64_t v17 = __Block_byref_object_dispose__6;
    id v18 = 0;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke_154;
    uint64_t v10 = &unk_264891B88;
    id v4 = v2;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v3 modifyInformationWithOperations:&v7];
    if (v14[5])
    {
      id v5 = KSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = v14[5];
        *(_DWORD *)buf = 136315394;
        id v20 = "-[_KSUserWordsSynchroniser keyboardUsed]_block_invoke";
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  Re-setting languages for massive inactivity: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "checkForDownload:uploads:allLanguages:", v14[5], v14[5], v14[5], v7, v8, v9, v10);
    }

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __40___KSUserWordsSynchroniser_keyboardUsed__block_invoke_154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"LastUsed"];
  if (v5)
  {
    [*(id *)(a1 + 32) timeIntervalSinceDate:v5];
    double v7 = v6;
    uint64_t v8 = _KSGetSetting(ksDefaultPullTime, &unk_26DE92A50);
    [v8 floatValue];
    double v10 = v9;

    if (v7 > v10)
    {
      uint64_t v11 = [v4 objectForKey:@"Languages"];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      [v4 removeObjectForKey:@"Languages"];
    }
  }
  [v4 setObject:*(void *)(a1 + 32) forKey:@"LastUsed"];

  return 1;
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264890B60;
  void block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

uint64_t __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2(void *a1)
{
  *(unsigned char *)(a1[4] + 56) = 0;
  *(unsigned char *)(a1[4] + 58) = 0;
  return (*(uint64_t (**)(void, void))(a1[6] + 16))(a1[6], a1[5]);
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = KSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_cold_1(a2, (uint64_t)v5, v6);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_158;
  v9[3] = &unk_264890A70;
  void v9[4] = v7;
  id v10 = *(id *)(a1 + 40);
  dispatch_async(v8, v9);
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_158(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 58)) {
    int64_t v2 = 10000000000;
  }
  else {
    int64_t v2 = 3600000000000;
  }
  dispatch_time_t v3 = dispatch_time(0, v2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2_159;
  v6[3] = &unk_264890A70;
  void v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  dispatch_after(v3, v5, v6);
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
}

uint64_t __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_2_159(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 57))
  {
    *(unsigned char *)(v1 + 57) = 0;
    return [*(id *)(result + 32) generateKeyWithCompletionHandler:*(void *)(result + 40)];
  }
  return result;
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_161(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = KSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke_3";
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_22B2BC000, v4, OS_LOG_TYPE_INFO, "%s  Key save state: %@", buf, 0x16u);
  }

  if (!v3)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_19;
  }
  id v5 = [v3 domain];
  uint64_t v6 = *MEMORY[0x263EFD498];
  if ([v5 isEqualToString:*MEMORY[0x263EFD498]])
  {
    uint64_t v7 = [v3 code];

    if (v7 == 5006)
    {
      uint64_t v8 = KSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
        _os_log_impl(&dword_22B2BC000, v8, OS_LOG_TYPE_INFO, "%s  Account not supported", buf, 0xCu);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v10 = [v3 domain];
  if (![v10 isEqualToString:v6])
  {

    goto LABEL_18;
  }
  uint64_t v11 = [v3 code];

  if (v11 != 14)
  {
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_19;
  }
  uint64_t v12 = KSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_22B2BC000, v12, OS_LOG_TYPE_INFO, "%s  Record changed - key exists. Loading from server...", buf, 0xCu);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_162;
  v14[3] = &unk_264891C00;
  uint64_t v13 = *(void **)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  [v13 loadKeyWithCompletion:v14];

LABEL_19:
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = KSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, "%s  Key load state: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) firstTimeDownloadWithKey:a2];
  }
  return result;
}

void __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_3;
    v6[3] = &unk_264891A48;
    id v7 = v3;
    [v5 modifyInformationWithOperations:v6];
  }
}

uint64_t __46___KSUserWordsSynchroniser_checkConfiguration__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return a2;
}

void __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2;
  v3[3] = &unk_264891A48;
  int64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 modifyInformationWithOperations:v3];
  [*(id *)(a1 + 32) checkForDownload:*(void *)(*(void *)(a1 + 32) + 48) uploads:*(void *)(*(void *)(a1 + 32) + 48) allLanguages:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2_cold_1(a1, v6, v7);
    }
  }
  else
  {
    [v5 setObject:*(void *)(a1 + 32) forKey:@"Key"];
  }

  return a2 ^ 1u;
}

void __54___KSUserWordsSynchroniser_deltaDownloadForLanguages___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  if ([*(id *)(*(void *)(a1 + 32) + 24) checkIfExists])
  {
    id v7 = [MEMORY[0x263EFF9C0] setWithArray:*(void *)(a1 + 40)];
    int64_t v2 = [*(id *)(a1 + 32) information];
    id v3 = [v2 objectForKey:@"Languages"];

    if (v3)
    {
      id v4 = [MEMORY[0x263EFFA08] setWithArray:v3];
      [v7 minusSet:v4];
    }
    if ([v7 count])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v7 allObjects];
      [v5 checkForDownload:v6 uploads:0 allLanguages:*(void *)(a1 + 40)];
    }
  }
}

void __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke_2";
      __int16 v18 = 2112;
      id v19 = v5;
      int v8 = "%s  Failed to load remote key, error: %@";
      id v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    }
  }
  else
  {
    int v11 = [*(id *)(a1 + 32) isEqualToData:v6];
    id v7 = KSCategory();
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke";
        int v8 = "%s  Local key is up to date";
        id v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_7;
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "-[_KSUserWordsSynchroniser generateRecordListForLanguages:]_block_invoke";
        _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, "%s  Local key is outdated; replacing it with the current remote key",
          buf,
          0xCu);
      }

      uint64_t v13 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke_167;
      v14[3] = &unk_264891A48;
      id v15 = v6;
      [v13 modifyInformationWithOperations:v14];
      id v7 = v15;
    }
  }
}

uint64_t __59___KSUserWordsSynchroniser_generateRecordListForLanguages___block_invoke_167(uint64_t a1, uint64_t a2, void *a3)
{
  return a2;
}

void __40___KSUserWordsSynchroniser_checkErrors___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = KSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __40___KSUserWordsSynchroniser_checkErrors___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) reset];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40___KSUserWordsSynchroniser_checkErrors___block_invoke_2;
    block[3] = &unk_2648906A8;
    void block[4] = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __40___KSUserWordsSynchroniser_checkErrors___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
  [*(id *)(a1 + 32) modifyInformationWithOperations:&__block_literal_global_176];
  int64_t v2 = *(void **)(a1 + 32);
  return [v2 checkConfiguration];
}

uint64_t __40___KSUserWordsSynchroniser_checkErrors___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return a2;
}

void __93___KSUserWordsSynchroniser_readFilesWithRecordIDs_forColumns_priority_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) checkErrors:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76___KSUserWordsSynchroniser_overwriteFilesWithRecords_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) checkErrors:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50___KSUserWordsSynchroniser_loadKeyWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) checkErrors:v5];
  }
  id v6 = [v5 domain];
  if ([v6 isEqualToString:*MEMORY[0x263EFD498]])
  {
    uint64_t v7 = [v5 code];

    if (v7 != 2) {
      goto LABEL_7;
    }
    id v6 = [v5 userInfo];
    int v8 = [v6 objectForKey:*MEMORY[0x263EFD4C8]];
    id v9 = [v8 allValues];
    uint64_t v10 = [v9 lastObject];

    id v5 = (id)v10;
  }

LABEL_7:
  uint64_t v11 = *(void *)(a1 + 48);
  BOOL v12 = [v15 objectForKey:*(void *)(a1 + 40)];
  uint64_t v13 = [v12 encryptedValueStore];
  uint64_t v14 = [v13 objectForKey:@"keybytes"];
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v14);
}

void __51___KSUserWordsSynchroniser_saveKey_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    [*(id *)(a1 + 32) checkErrors:v8];
  }
  id v9 = [v8 domain];
  if ([v9 isEqualToString:*MEMORY[0x263EFD498]])
  {
    uint64_t v10 = [v8 code];

    if (v10 != 2) {
      goto LABEL_7;
    }
    id v9 = [v8 userInfo];
    uint64_t v11 = [v9 objectForKey:*MEMORY[0x263EFD4C8]];
    BOOL v12 = [v11 allValues];
    uint64_t v13 = [v12 lastObject];

    id v8 = (id)v13;
  }

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  id v5 = [v3 recordType];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 recordType];
    [v7 setObject:v6 forKey:v8];
  }
  [v6 addObject:v9];
}

uint64_t __64___KSUserWordsSynchroniser_dumpAllRecordsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setObject:a2 forKey:@"Error"];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45___KSUserWordsSynchroniser_accountDidChange___block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 136315394;
  id v4 = "-[_KSUserWordsSynchroniser accountDidChange:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_22B2BC000, a2, OS_LOG_TYPE_ERROR, "%s  Resetting user words state due to account change %i", (uint8_t *)&v3, 0x12u);
}

void __48___KSUserWordsSynchroniser_identitiesDidChange___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Error reading files (upload check): %@", v2, v3, v4, v5, 2u);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_2_137_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Failed to push our dictionaries. Undoubtedly we shall try again. %@", v2, v3, v4, v5, 2u);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[_KSUserWordsSynchroniser checkForDownload:uploads:allLanguages:]_block_invoke";
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  The server claimed it had better data, but it did not", buf, 0xCu);
}

void __66___KSUserWordsSynchroniser_checkForDownload_uploads_allLanguages___block_invoke_142_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Error reading files (download data): %@", v2, v3, v4, v5, 2u);
}

void __61___KSUserWordsSynchroniser_generateKeyWithCompletionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&void v3[4] = "-[_KSUserWordsSynchroniser generateKeyWithCompletionHandler:]_block_invoke_3";
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_3_0(&dword_22B2BC000, a2, a3, "%s  Failed to %s (%@), trying again later", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __53___KSUserWordsSynchroniser_firstTimeDownloadWithKey___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 objectForKey:@"Key"];
  int v6 = 136315650;
  uint64_t v7 = "-[_KSUserWordsSynchroniser firstTimeDownloadWithKey:]_block_invoke_2";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_22B2BC000, a3, OS_LOG_TYPE_ERROR, "%s  Settings file already exists! Very wrong (new key %@; old key %@)",
    (uint8_t *)&v6,
    0x20u);
}

void __40___KSUserWordsSynchroniser_checkErrors___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = @"YES";
  *(void *)&v4[4] = "-[_KSUserWordsSynchroniser checkErrors:]_block_invoke";
  *(_DWORD *)uint64_t v4 = 136315650;
  *(_WORD *)&v4[12] = 2112;
  if (!*(void *)(a1 + 40)) {
    uint64_t v3 = @"NO";
  }
  *(void *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  OUTLINED_FUNCTION_3_0(&dword_22B2BC000, a2, a3, "%s  Failed to reset zone (delete=%@; error=%@)",
    *(void *)v4,
    *(void *)&v4[8],
    *(void *)&v4[16],
    a2);
}

@end