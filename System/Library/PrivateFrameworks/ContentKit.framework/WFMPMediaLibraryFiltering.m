@interface WFMPMediaLibraryFiltering
+ (Class)objectClass;
+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4;
@end

@implementation WFMPMediaLibraryFiltering

+ (Class)objectClass
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getMPMediaItemClass_softClass_25558;
  uint64_t v9 = getMPMediaItemClass_softClass_25558;
  if (!getMPMediaItemClass_softClass_25558)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getMPMediaItemClass_block_invoke_25559;
    v5[3] = &unk_26428AC60;
    v5[4] = &v6;
    __getMPMediaItemClass_block_invoke_25559((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return (Class)v3;
}

+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v34 = (void (**)(id, void *, void *))a4;
  v35 = objc_opt_new();
  v37 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v39;
    uint64_t v33 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v37 addObject:v9];
          continue;
        }
        id v10 = v9;
        if ([v10 comparisonType] == 4)
        {
          uint64_t v11 = 0;
        }
        else
        {
          if ([v10 comparisonType] != 99)
          {

            goto LABEL_25;
          }
          uint64_t v11 = 1;
        }
        v12 = [v10 property];
        v13 = [v12 userInfo];

        v14 = [v10 value];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v14 != 0)) == 1)
        {
          uint64_t v43 = 0;
          v44 = &v43;
          uint64_t v45 = 0x2020000000;
          v15 = (void *)getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_25581;
          uint64_t v46 = getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_25581;
          if (!getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_25581)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getMPMediaItemPropertyMediaTypeSymbolLoc_block_invoke_25582;
            v49 = &unk_26428AC60;
            v50 = &v43;
            v16 = MediaPlayerLibrary_25560();
            v17 = dlsym(v16, "MPMediaItemPropertyMediaType");
            *(void *)(v50[1] + 24) = v17;
            getMPMediaItemPropertyMediaTypeSymbolLoc_ptr_25581 = *(void *)(v50[1] + 24);
            v15 = (void *)v44[3];
          }
          _Block_object_dispose(&v43, 8);
          if (!v15)
          {
            v31 = [MEMORY[0x263F08690] currentHandler];
            v32 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyMediaType(void)"];
            objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"WFMPMediaLibraryFiltering.m", 19, @"%s", dlerror(), v33);

            __break(1u);
          }
          if ([v13 isEqualToString:*v15])
          {
            v18 = WFMPMediaTypeMapping();
            v19 = [v18 allKeysForObject:v14];
            uint64_t v20 = [v19 firstObject];

            v14 = (void *)v20;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2050000000;
          v21 = (void *)getMPMediaPropertyPredicateClass_softClass;
          v49 = (void *)getMPMediaPropertyPredicateClass_softClass;
          if (!getMPMediaPropertyPredicateClass_softClass)
          {
            v42[0] = MEMORY[0x263EF8330];
            v42[1] = 3221225472;
            v42[2] = __getMPMediaPropertyPredicateClass_block_invoke;
            v42[3] = &unk_26428AC60;
            v42[4] = buf;
            __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)v42);
            v21 = *(void **)(*(void *)&buf[8] + 24);
          }
          id v22 = v21;
          _Block_object_dispose(buf, 8);
          v23 = [v22 predicateWithValue:v14 forProperty:v13 comparisonType:v11];
        }
        else
        {
          v23 = 0;
        }

        if (v23)
        {
          [v35 addObject:v23];

          continue;
        }
LABEL_25:
        [v37 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v6);
  }

  v24 = getWFMediaLibraryFilteringLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "+[WFMPMediaLibraryFiltering performCustomFilteringUsingComparisonPredicates:resultHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    v49 = v37;
    _os_log_impl(&dword_216505000, v24, OS_LOG_TYPE_INFO, "%s Filtering with media predicates %@, unfilterable predicates %@", buf, 0x20u);
  }

  if ([v35 count])
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    v25 = (void *)getMPMediaQueryClass_softClass_25588;
    uint64_t v46 = getMPMediaQueryClass_softClass_25588;
    if (!getMPMediaQueryClass_softClass_25588)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMPMediaQueryClass_block_invoke_25589;
      v49 = &unk_26428AC60;
      v50 = &v43;
      __getMPMediaQueryClass_block_invoke_25589((uint64_t)buf);
      v25 = (void *)v44[3];
    }
    v26 = v25;
    _Block_object_dispose(&v43, 8);
    v27 = (void *)[[v26 alloc] initWithFilterPredicates:v35];
    v28 = [v27 items];

    v29 = getWFMediaLibraryFilteringLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = [v28 count];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFMPMediaLibraryFiltering performCustomFilteringUsingComparisonPredicates:resultHandler:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v30;
      _os_log_impl(&dword_216505000, v29, OS_LOG_TYPE_INFO, "%s MPMediaQuery completed with %lu results", buf, 0x16u);
    }

    v34[2](v34, v28, v37);
  }
  else
  {
    v34[2](v34, 0, 0);
  }
}

@end