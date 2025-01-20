@interface CNUIPRLikenessLookup
+ (BOOL)useGivenAvatarForContact:(id)a3;
+ (id)basicMonogramForContactFuture:(id)a3 monogramColor:(id)a4;
+ (id)basicMonogramFromString:(id)a3 color:(id)a4;
+ (id)basicMonogramObservableForContactFuture:(id)a3 monogramColor:(id)a4;
+ (id)basicMonogramObservableFromString:(id)a3 color:(id)a4;
+ (id)contactFuture:(id)a3 contactStore:(id)a4 personaId:(id)a5 scheduler:(id)a6 refetchContact:(BOOL)a7;
+ (id)contactFuture:(id)a3 contactStore:(id)a4 refetchContact:(BOOL)a5;
+ (id)descriptorForRequiredKeys;
+ (id)observableFromLikenessProviderBlock:(id)a3 withScheduler:(id)a4;
+ (id)photoObservableWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4 scheduler:(id)a5;
+ (id)photoWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4;
- (BOOL)isMeContact:(id)a3;
- (BOOL)mayIncludeSource:(int64_t)a3;
- (BOOL)shouldFetchSharedPhotoForContact:(id)a3;
- (BOOL)skipContactLookup;
- (CNContactStore)contactStore;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIMeContactMonitor)meMonitor;
- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4;
- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5;
- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4;
- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4 meMonitor:(id)a5;
- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4 meMonitor:(id)a5 personaId:(id)a6;
- (CNUIPRLikenessLookup)initWithPersonaId:(id)a3 schedulerProvider:(id)a4;
- (CNUIPRLikenessProvider)loadingPlaceholderLikeness;
- (CNUIPlaceholderProviderFactory)placeholderProviderFactory;
- (NSString)personaId;
- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4;
- (id)badgeWithLikenessBadge:(id)a3;
- (id)basicMonogramFromString:(id)a3 color:(id)a4;
- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4;
- (id)basicMonogramObservableWithContactFuture:(id)a3 monogramColor:(id)a4;
- (id)basicMonogramWithContactFuture:(id)a3 monogramColor:(id)a4;
- (id)blessedPhotoObservableWithFuture:(id)a3 contact:(id)a4 workScheduler:(id)a5;
- (id)blessedPhotoWithFuture:(id)a3 contact:(id)a4;
- (id)contentObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6;
- (id)futureResultForPhotoImageDataForContact:(id)a3 error:(id *)a4;
- (id)futureResultForPhotoImageDataForMeContact:(id)a3 error:(id *)a4;
- (id)likenessForContact:(id)a3 error:(id *)a4;
- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5;
- (id)likenessForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5;
- (id)likenessObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6;
- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5;
- (id)likenessesForContact:(id)a3 workScheduler:(id)a4;
- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5;
- (id)loadingPlaceholderObservableWithPlaceholderProviderFactory:(id)a3;
- (id)loadingPlaceholderWithPlaceholderProviderFactory:(id)a3;
- (id)photoFutureForContactFuture:(id)a3 photoFuture:(id)a4 allowingFallbackForMeCard:(BOOL)a5;
- (id)photoFutureForContactFuture:(id)a3 scheduler:(id)a4;
- (id)photoImageDataForContact:(id)a3 error:(id *)a4;
- (id)remoteImageWithContactFuture:(id)a3;
- (id)remoteImagesObservableWithContactFuture:(id)a3 workScheduler:(id)a4;
- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5;
- (id)silhouetteObservableWithPlaceholderProviderFactory:(id)a3 contact:(id)a4 workScheduler:(id)a5;
- (id)silhouetteWithPlaceholderProviderFactory:(id)a3 contact:(id)a4;
- (int64_t)prohibitedSources;
- (unint64_t)lookupOptions;
- (void)setLookupOptions:(unint64_t)a3;
- (void)setMeMonitor:(id)a3;
- (void)setPlaceholderProviderFactory:(id)a3;
- (void)setProhibitedSources:(int64_t)a3;
@end

@implementation CNUIPRLikenessLookup

uint64_t __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) futureResultForPhotoImageDataForContact:*(void *)(a1 + 40) error:a2];
}

- (id)likenessForContact:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(CNUIPRLikenessLookup *)self placeholderProviderFactory];
  v10 = [(CNUIPRLikenessLookup *)self likenessForContact:v8 placeholderProviderFactory:v9 options:v7];

  return v10;
}

- (CNUIPRLikenessProvider)loadingPlaceholderLikeness
{
  v3 = [(CNUIPRLikenessLookup *)self placeholderProviderFactory];
  v4 = [(CNUIPRLikenessLookup *)self loadingPlaceholderWithPlaceholderProviderFactory:v3];

  return (CNUIPRLikenessProvider *)v4;
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (id)loadingPlaceholderWithPlaceholderProviderFactory:(id)a3
{
  return (id)[a3 loadingPlaceholderProvider];
}

- (id)likenessForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_class();
  v12 = [(CNUIPRLikenessLookup *)self contactStore];
  v13 = objc_msgSend(v11, "contactFuture:contactStore:refetchContact:", v8, v12, -[CNUIPRLikenessLookup skipContactLookup](self, "skipContactLookup") ^ 1);

  v14 = [MEMORY[0x263F33660] immediateScheduler];
  v15 = [(CNUIPRLikenessLookup *)self photoFutureForContactFuture:v13 scheduler:v14];

  v16 = [(CNUIPRLikenessLookup *)self photoFutureForContactFuture:v13 photoFuture:v15 allowingFallbackForMeCard:0];
  uint64_t v17 = [(CNUIPRLikenessLookup *)self blessedPhotoWithFuture:v16 contact:v8];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:].cold.4();
    }
  }
  else
  {
    uint64_t v20 = [(CNUIPRLikenessLookup *)self remoteImageWithContactFuture:v13];
    if (v20)
    {
      v18 = (void *)v20;
      v19 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:]();
      }
    }
    else
    {
      v21 = [v10 monogramColor];
      v18 = [(CNUIPRLikenessLookup *)self basicMonogramWithContactFuture:v13 monogramColor:v21];

      if (v18)
      {
        v19 = +[CNUICoreLogProvider likenesses_os_log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:]();
        }
      }
      else
      {
        v18 = [(CNUIPRLikenessLookup *)self silhouetteWithPlaceholderProviderFactory:v9 contact:v8];
        v19 = +[CNUICoreLogProvider likenesses_os_log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[CNUIPRLikenessLookup likenessForContact:placeholderProviderFactory:options:]();
        }
      }
    }
  }

  id v22 = v18;
  return v22;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (id)photoFutureForContactFuture:(id)a3 scheduler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke;
  v10[3] = &unk_264018CE8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [a3 flatMap:v10];

  return v8;
}

- (id)photoFutureForContactFuture:(id)a3 photoFuture:(id)a4 allowingFallbackForMeCard:(BOOL)a5
{
  id v5 = a4;
  return v5;
}

- (id)blessedPhotoWithFuture:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:1])
  {
    id v8 = +[CNUILikenessFingerprint fingerprintForContact:v7];
    id v9 = [(id)objc_opt_class() photoWithPhotoFuture:v6 likenessFingerprint:v8];
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessLookup blessedPhotoWithFuture:contact:]();
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)mayIncludeSource:(int64_t)a3
{
  return ([(CNUIPRLikenessLookup *)self prohibitedSources] & a3) == 0;
}

- (int64_t)prohibitedSources
{
  return self->_prohibitedSources;
}

+ (id)photoWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4
{
  id v5 = a4;
  id v11 = 0;
  id v6 = [a3 result:&v11];
  id v7 = v11;
  if (v6)
  {
    id v8 = [[CNUIPRLikenessPhotoProvider alloc] initWithPhotoData:v6 fingerprint:v5];
  }
  else
  {
    id v9 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup photoWithPhotoFuture:likenessFingerprint:]((uint64_t)v7, v9);
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)contactFuture:(id)a3 contactStore:(id)a4 refetchContact:(BOOL)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.7();
    }
    goto LABEL_7;
  }
  if ([(id)objc_opt_class() useGivenAvatarForContact:v8])
  {
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:]();
    }
LABEL_7:

    id v11 = [MEMORY[0x263F335E0] futureWithResult:v8];
    goto LABEL_8;
  }
  if (!v9)
  {
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:]();
    }
    goto LABEL_7;
  }
  if ([MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] != 3)
  {
    id v10 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.6();
    }
    goto LABEL_7;
  }
  v13 = [a1 descriptorForRequiredKeys];
  v26[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v25 = 0;
  v15 = [v9 contactsMatchingPropertiesOfContact:v8 unifyResults:1 keysToFetch:v14 error:&v25];
  id v16 = v25;

  if (v15)
  {
    if ([v15 count])
    {
      if ((unint64_t)[v15 count] >= 2)
      {
        uint64_t v17 = +[CNUICoreLogProvider likenesses_os_log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_20B704000, v17, OS_LOG_TYPE_INFO, "[LikenessResolver] Matched more than one contact when resolving likeness", v24, 2u);
        }
      }
      v18 = [v15 firstObject];
      v19 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.5();
      }

      uint64_t v20 = [MEMORY[0x263F335E0] futureWithResult:v18];
    }
    else
    {
      id v22 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.4();
      }

      v23 = (void *)MEMORY[0x263F335E0];
      v18 = +[CNContactsUIError errorWithCode:402];
      uint64_t v20 = [v23 futureWithError:v18];
    }
    id v11 = (void *)v20;
  }
  else
  {
    v21 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:]((uint64_t)v16, v21);
    }

    id v11 = [MEMORY[0x263F335E0] futureWithError:v16];
  }

LABEL_8:
  return v11;
}

+ (id)descriptorForRequiredKeys
{
  v8[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFE9F8];
  v3 = objc_msgSend(MEMORY[0x263EFEA20], "descriptorForRequiredKeysForStyle:", 1002, *MEMORY[0x263EFE140], *MEMORY[0x263EFE0B0], *MEMORY[0x263EFE0A8], *MEMORY[0x263EFDF80], *MEMORY[0x263EFE070], *MEMORY[0x263EFE148]);
  v8[6] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:7];
  id v5 = [NSString stringWithUTF8String:"+[CNUIPRLikenessLookup descriptorForRequiredKeys]"];
  id v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

+ (BOOL)useGivenAvatarForContact:(id)a3
{
  id v3 = a3;
  if ([v3 hasBeenPersisted])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 imageData];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)remoteImageWithContactFuture:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:1])
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__CNUIPRLikenessLookup_remoteImageWithContactFuture___block_invoke;
    v10[3] = &unk_264018B90;
    v10[4] = &v11;
    id v5 = [v4 flatMap:v10];
    id v6 = [(id)objc_opt_class() photoWithPhotoFuture:v5 likenessFingerprint:v12[5]];
    id v7 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v4 result:0];
      -[CNUIPRLikenessLookup remoteImageWithContactFuture:]((uint64_t)v6, v8, buf, v7);
    }

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id __78__CNUIPRLikenessLookup_basicMonogramObservableForContactFuture_monogramColor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isKeyAvailable:*MEMORY[0x263EFE148]] && !objc_msgSend(v2, "contactType"))
  {
    id v5 = [MEMORY[0x263EFEA20] abbreviatedStringFromContact:v2 trimmingWhitespace:1];
    if ((*(uint64_t (**)(void))(*MEMORY[0x263F334E0] + 16))())
    {
      id v6 = [MEMORY[0x263EFF9D0] null];
    }
    else
    {
      id v6 = v5;
    }
    id v3 = v6;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
  }

  return v3;
}

- (id)basicMonogramWithContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:2])
  {
    id v8 = [(id)objc_opt_class() basicMonogramForContactFuture:v6 monogramColor:v7];
    id v9 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessLookup basicMonogramWithContactFuture:monogramColor:]();
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)basicMonogramForContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6 = a4;
  id v7 = [a3 result:0];
  id v8 = 0;
  if ([v7 isKeyAvailable:*MEMORY[0x263EFE148]])
  {
    if ([v7 contactType])
    {
      id v8 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x263EFEA20] abbreviatedStringFromContact:v7 trimmingWhitespace:1];
      id v10 = v9;
      if (v9 && [v9 length])
      {
        id v8 = [a1 basicMonogramFromString:v10 color:v6];
      }
      else
      {
        id v8 = 0;
      }
    }
  }

  return v8;
}

- (id)likenessesForContact:(id)a3 options:(id)a4 workScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(CNUIPRLikenessLookup *)self placeholderProviderFactory];
  v12 = [(CNUIPRLikenessLookup *)self likenessObservableForContact:v8 placeholderProviderFactory:v11 options:v10 workScheduler:v9];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke;
  v16[3] = &unk_264018B40;
  id v17 = v8;
  id v13 = v8;
  v14 = [v12 doOnNext:v16];

  return v14;
}

- (id)likenessObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6
{
  id v10 = a4;
  uint64_t v11 = (void *)MEMORY[0x263EFF980];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [v11 array];
  id v16 = [(CNUIPRLikenessLookup *)self contentObservableForContact:v14 placeholderProviderFactory:v10 options:v13 workScheduler:v12];

  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:8])
  {
    id v17 = [(CNUIPRLikenessLookup *)self loadingPlaceholderObservableWithPlaceholderProviderFactory:v10];
    objc_msgSend(v15, "_cn_addNonNilObject:", v17);

    uint64_t v18 = [(CNUIPRLikenessLookup *)self schedulerProvider];
    v19 = [v18 mainThreadScheduler];
    uint64_t v20 = [v16 observeOn:v19];

    id v16 = (void *)v20;
  }
  [v15 addObject:v16];
  v21 = [MEMORY[0x263F33608] concatenate:v15];

  return v21;
}

- (id)contentObservableForContact:(id)a3 placeholderProviderFactory:(id)a4 options:(id)a5 workScheduler:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_class();
  v15 = [(CNUIPRLikenessLookup *)self contactStore];
  id v16 = [(CNUIPRLikenessLookup *)self personaId];
  id v17 = objc_msgSend(v14, "contactFuture:contactStore:personaId:scheduler:refetchContact:", v10, v15, v16, v13, -[CNUIPRLikenessLookup skipContactLookup](self, "skipContactLookup") ^ 1);

  v34 = [(CNUIPRLikenessLookup *)self photoFutureForContactFuture:v17 scheduler:v13];
  uint64_t v18 = -[CNUIPRLikenessLookup photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:](self, "photoFutureForContactFuture:photoFuture:allowingFallbackForMeCard:", v17);
  v19 = [MEMORY[0x263EFF980] array];
  v33 = (void *)v18;
  uint64_t v20 = [(CNUIPRLikenessLookup *)self blessedPhotoObservableWithFuture:v18 contact:v10 workScheduler:v13];
  objc_msgSend(v19, "_cn_addNonNilObject:", v20);

  v21 = [(CNUIPRLikenessLookup *)self remoteImagesObservableWithContactFuture:v17 workScheduler:v13];
  objc_msgSend(v19, "_cn_addNonNilObject:", v21);

  v35 = v12;
  id v22 = [v12 monogramColor];
  v23 = [(CNUIPRLikenessLookup *)self basicMonogramObservableWithContactFuture:v17 monogramColor:v22];
  objc_msgSend(v19, "_cn_addNonNilObject:", v23);

  v36 = v11;
  v24 = [(CNUIPRLikenessLookup *)self silhouetteObservableWithPlaceholderProviderFactory:v11 contact:v10 workScheduler:v13];
  objc_msgSend(v19, "_cn_addNonNilObject:", v24);

  id v25 = [v19 firstObject];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v26 = objc_msgSend(v19, "_cn_tail");
  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v30 = 0;
      v31 = v25;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v26);
        }
        id v25 = [v31 onEmpty:*(void *)(*((void *)&v37 + 1) + 8 * v30)];

        ++v30;
        v31 = v25;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v28);
  }

  return v25;
}

- (id)silhouetteObservableWithPlaceholderProviderFactory:(id)a3 contact:(id)a4 workScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:4])
  {
    id v11 = objc_opt_class();
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke;
    uint64_t v18 = &unk_264018C00;
    id v19 = v8;
    id v20 = v9;
    id v12 = [v11 observableFromLikenessProviderBlock:&v15 withScheduler:v10];
    id v13 = objc_msgSend(v12, "doOnNext:", &__block_literal_global_38, v15, v16, v17, v18);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)blessedPhotoObservableWithFuture:(id)a3 contact:(id)a4 workScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:1])
  {
    id v11 = +[CNUILikenessFingerprint fingerprintForContact:v9];
    id v12 = [(id)objc_opt_class() photoObservableWithPhotoFuture:v8 likenessFingerprint:v11 scheduler:v10];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke;
    v15[3] = &unk_264018B40;
    id v16 = v9;
    id v13 = [v12 doOnNext:v15];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)remoteImagesObservableWithContactFuture:(id)a3 workScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:1])
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__2;
    id v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke;
    v14[3] = &unk_264018B90;
    v14[4] = &v15;
    id v8 = [v6 flatMap:v14];
    id v9 = [(id)objc_opt_class() photoObservableWithPhotoFuture:v8 likenessFingerprint:v16[5] scheduler:v7];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2;
    v12[3] = &unk_264018B40;
    id v13 = v6;
    id v10 = [v9 doOnNext:v12];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)photoObservableWithPhotoFuture:(id)a3 likenessFingerprint:(id)a4 scheduler:(id)a5
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F33608];
  id v9 = a5;
  id v10 = [v8 observableWithFuture:a3];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__CNUIPRLikenessLookup_photoObservableWithPhotoFuture_likenessFingerprint_scheduler___block_invoke;
  v17[3] = &unk_264018C98;
  id v18 = v7;
  id v11 = v7;
  id v12 = [v10 map:v17];
  id v13 = [v12 subscribeOn:v9];

  id v14 = [MEMORY[0x263F33608] emptyObservable];
  uint64_t v15 = [v13 onError:v14];

  return v15;
}

- (id)basicMonogramObservableWithContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:2])
  {
    id v8 = [(id)objc_opt_class() basicMonogramObservableForContactFuture:v6 monogramColor:v7];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke;
    v11[3] = &unk_264018B40;
    id v12 = v6;
    id v9 = [v8 doOnNext:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)observableFromLikenessProviderBlock:(id)a3 withScheduler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F33608];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke;
  v12[3] = &unk_264018C70;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = [v7 observableWithBlock:v12];

  return v10;
}

id __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) shouldFetchSharedPhotoForContact:v3];
  id v5 = (void *)MEMORY[0x263F335E0];
  if (v4)
  {
    id v6 = v14;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    id v7 = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_2;
  }
  else
  {
    id v6 = v13;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v7 = __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_3;
  }
  v6[2] = v7;
  v6[3] = &unk_264018CC0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v6[4] = v8;
  v6[5] = v3;
  id v10 = v3;
  id v11 = [v5 futureWithBlock:v6 scheduler:v9];

  return v11;
}

- (BOOL)shouldFetchSharedPhotoForContact:(id)a3
{
  id v4 = a3;
  if (([(CNUIPRLikenessLookup *)self lookupOptions] & 2) != 0)
  {
    if ([(CNUIPRLikenessLookup *)self isMeContact:v4])
    {
      id v6 = [MEMORY[0x263F335C8] currentEnvironment];
      id v7 = [v6 nicknameProvider];
      char v8 = [v7 isNicknameSharingEnabled];
    }
    else
    {
      char v8 = 0;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v10 = [v4 thumbnailImageData];
    if (v10)
    {
      BOOL v11 = 1;
    }
    else if ([v4 isKeyAvailable:*MEMORY[0x263EFDFF8]])
    {
      id v12 = [v4 imageData];
      BOOL v11 = v12 != 0;
    }
    else
    {
      BOOL v11 = 0;
    }

    BOOL v5 = v8 & (isKindOfClass & v11 ^ 1);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)skipContactLookup
{
  return [(CNUIPRLikenessLookup *)self lookupOptions] & 1;
}

- (unint64_t)lookupOptions
{
  return self->_lookupOptions;
}

+ (id)basicMonogramObservableForContactFuture:(id)a3 monogramColor:(id)a4
{
  id v6 = (void *)MEMORY[0x263F33608];
  id v7 = a4;
  char v8 = [v6 observableWithFuture:a3];
  uint64_t v9 = [v8 map:&__block_literal_global_49];
  id v10 = [v9 filter:*MEMORY[0x263F334C8]];

  BOOL v11 = [a1 basicMonogramObservableFromString:v10 color:v7];

  return v11;
}

+ (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__CNUIPRLikenessLookup_basicMonogramObservableFromString_color___block_invoke;
  v10[3] = &unk_264018BD8;
  id v11 = v5;
  id v6 = v5;
  id v7 = [a3 map:v10];
  char v8 = [v7 filter:*MEMORY[0x263F334C8]];

  return v8;
}

id __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CNUILikenessFingerprint fingerprintForContact:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = +[CNUIRemotePhotoFutures photoForContact:v3];

  return v7;
}

id __53__CNUIPRLikenessLookup_remoteImageWithContactFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CNUILikenessFingerprint fingerprintForContact:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = +[CNUIRemotePhotoFutures photoForContact:v3];

  return v7;
}

- (id)futureResultForPhotoImageDataForContact:(id)a3 error:(id *)a4
{
  uint64_t v5 = -[CNUIPRLikenessLookup photoImageDataForContact:error:](self, "photoImageDataForContact:error:", a3);
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFE180] code:302 userInfo:0];
    char v8 = v7;
    if (a4) {
      *a4 = v7;
    }

    id v6 = 0;
  }

  return v6;
}

- (id)photoImageDataForContact:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if ([v4 isKeyAvailable:*MEMORY[0x263EFE140]])
  {
    uint64_t v5 = [v4 thumbnailImageData];
    if (![v5 length] && objc_msgSend(v4, "isKeyAvailable:", *MEMORY[0x263EFDFF8]))
    {
      id v6 = [v4 imageData];

      if ([v4 isKeyAvailable:*MEMORY[0x263EFDF60]]) {
        [v4 cropRect];
      }
      uint64_t v5 = CNImageUtilsCroppedImageDataFromFullSizeImageData();
    }
    id v7 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessLookup photoImageDataForContact:error:]();
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setProhibitedSources:(int64_t)a3
{
  self->_prohibitedSources = a3;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  return [(CNUIPRLikenessLookup *)self initWithContactStore:a3 schedulerProvider:a4 meMonitor:0 personaId:&stru_26BFC7668];
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4 meMonitor:(id)a5 personaId:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNUIPRLikenessLookup;
  uint64_t v15 = [(CNUIPRLikenessLookup *)&v21 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contactStore, a3);
    uint64_t v17 = objc_alloc_init(CNUIPlaceholderProviderFactory);
    placeholderProviderFactory = v16->_placeholderProviderFactory;
    v16->_placeholderProviderFactory = v17;

    objc_storeStrong((id *)&v16->_schedulerProvider, a4);
    objc_storeStrong((id *)&v16->_meMonitor, a5);
    objc_storeStrong((id *)&v16->_personaId, a6);
    id v19 = v16;
  }

  return v16;
}

void __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  id v6 = v4(v3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_3;
  v8[3] = &unk_264018368;
  id v9 = *(id *)(a1 + 32);
  id v10 = v6;
  id v7 = v6;
  [v5 performBlock:v8];
}

- (id)silhouetteWithPlaceholderProviderFactory:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNUIPRLikenessLookup *)self mayIncludeSource:4])
  {
    char v8 = [v6 placeholderProviderForContact:v7];
    id v9 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CNUIPRLikenessLookup silhouetteWithPlaceholderProviderFactory:contact:]();
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) placeholderProviderForContact:*(void *)(a1 + 40)];
}

id __64__CNUIPRLikenessLookup_basicMonogramObservableFromString_color___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334E0];
  if ((*(unsigned int (**)(void, id))(*MEMORY[0x263F334E0] + 16))(*MEMORY[0x263F334E0], v3))
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    id v6 = [(objc_class *)getPRMonogramClass_0() monogram];
    [v6 setText:v3];
    id v7 = [v6 text];
    int v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

    if (v8)
    {
      id v5 = [MEMORY[0x263EFF9D0] null];
    }
    else
    {
      if (*(void *)(a1 + 32)) {
        objc_msgSend(v6, "setMonogramColor:");
      }
      id v9 = (void *)MEMORY[0x263F5D440];
      id v10 = [v6 dataRepresentation];
      id v11 = [v9 monogramWithRecipe:v10 staticRepresentation:0];

      if (v11)
      {
        id v12 = [[CNUIPRLikenessProvider alloc] initWithPRLikeness:v11];
      }
      else
      {
        id v12 = [MEMORY[0x263EFF9D0] null];
      }
      id v5 = v12;
    }
  }

  return v5;
}

void __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke_cold_1();
  }
}

void __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_meMonitor, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

uint64_t __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 observerDidComplete];
}

void __97__CNUIPRLikenessLookup_silhouetteObservableWithPlaceholderProviderFactory_contact_workScheduler___block_invoke_2()
{
  v0 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    -[CNUIPRLikenessLookup silhouetteWithPlaceholderProviderFactory:contact:]();
  }
}

id __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CNUIPRLikenessLookup_observableFromLikenessProviderBlock_withScheduler___block_invoke_2;
  v9[3] = &unk_264018C48;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v5;
  id v6 = v3;
  id v7 = [v4 performCancelableBlock:v9];

  return v7;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 schedulerProvider:(id)a4 meMonitor:(id)a5
{
  return [(CNUIPRLikenessLookup *)self initWithContactStore:a3 schedulerProvider:a4 meMonitor:a5 personaId:&stru_26BFC7668];
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4 meMonitor:(id)a5
{
  id v7 = (void *)MEMORY[0x263F33668];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 defaultProvider];
  id v12 = objc_alloc(MEMORY[0x263F33668]);
  id v13 = [v11 mainThreadScheduler];
  id v14 = [v11 immediateScheduler];
  uint64_t v15 = [v11 valueForKey:@"serialSchedulerProvider"];
  id v16 = [v11 valueForKey:@"synchronousSerialSchedulerProvider"];
  uint64_t v17 = [v11 valueForKey:@"readerWriterSchedulerProvider"];
  id v18 = (void *)[v12 initWithBackgroundScheduler:v9 mainThreadScheduler:v13 immediateScheduler:v14 serialSchedulerProvider:v15 synchronousSerialSchedulerProvider:v16 readerWriterSchedulerProvider:v17];

  id v19 = [(CNUIPRLikenessLookup *)self initWithContactStore:v10 schedulerProvider:v18 meMonitor:v8 personaId:&stru_26BFC7668];
  return v19;
}

- (CNUIPRLikenessLookup)initWithContactStore:(id)a3 scheduler:(id)a4
{
  return [(CNUIPRLikenessLookup *)self initWithContactStore:a3 scheduler:a4 meMonitor:0];
}

- (CNUIPRLikenessLookup)initWithPersonaId:(id)a3 schedulerProvider:(id)a4
{
  return [(CNUIPRLikenessLookup *)self initWithContactStore:0 schedulerProvider:a4 meMonitor:0 personaId:a3];
}

- (id)likenessesForContacts:(id)a3 options:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CNUIPRLikenessLookup *)self placeholderProviderFactory];
  id v10 = objc_msgSend(v8, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__CNUIPRLikenessLookup_likenessesForContacts_options_error___block_invoke;
  v15[3] = &unk_264017418;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = objc_msgSend(v10, "_cn_map:", v15);

  return v13;
}

uint64_t __60__CNUIPRLikenessLookup_likenessesForContacts_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) likenessForContact:a2 placeholderProviderFactory:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

- (id)resolveLikenessesForContacts:(id)a3 workScheduler:(id)a4 withContentHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v10, "_cn_take:", +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts"));

  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __86__CNUIPRLikenessLookup_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke;
  v23 = &unk_264017E98;
  v24 = self;
  id v25 = v8;
  id v12 = v8;
  id v13 = objc_msgSend(v11, "_cn_map:", &v20);

  id v14 = (void *)MEMORY[0x263F33608];
  uint64_t v15 = [(CNUIPRLikenessLookup *)self schedulerProvider];
  id v16 = [v14 combineLatest:v13 resultScheduler:v12 schedulerProvider:v15];
  id v17 = [MEMORY[0x263F33610] observerWithResultBlock:v9];

  id v18 = [v16 subscribe:v17];

  return v18;
}

uint64_t __86__CNUIPRLikenessLookup_resolveLikenessesForContacts_workScheduler_withContentHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) likenessesForContact:a2 workScheduler:*(void *)(a1 + 40)];
}

- (id)likenessForContact:(id)a3 error:(id *)a4
{
  return [(CNUIPRLikenessLookup *)self likenessForContact:a3 options:0 error:a4];
}

- (id)likenessesForContact:(id)a3 workScheduler:(id)a4
{
  return [(CNUIPRLikenessLookup *)self likenessesForContact:a3 options:0 workScheduler:a4];
}

- (id)loadingPlaceholderObservableWithPlaceholderProviderFactory:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__CNUIPRLikenessLookup_loadingPlaceholderObservableWithPlaceholderProviderFactory___block_invoke;
  v11[3] = &unk_264018B68;
  id v12 = v4;
  id v6 = v4;
  id v7 = [(CNUIPRLikenessLookup *)self schedulerProvider];
  id v8 = [v7 mainThreadScheduler];
  id v9 = [v5 observableFromLikenessProviderBlock:v11 withScheduler:v8];

  return v9;
}

uint64_t __83__CNUIPRLikenessLookup_loadingPlaceholderObservableWithPlaceholderProviderFactory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadingPlaceholderProvider];
}

void __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke_cold_1();
  }
}

void __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2_cold_1();
  }
}

+ (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 length])
  {
    id v7 = [(objc_class *)getPRMonogramClass_0() monogram];
    [v7 setText:v5];
    id v8 = [v7 text];
    if (v8)
    {
      id v9 = [v7 text];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        if (v6) {
          [v7 setMonogramColor:v6];
        }
        id v11 = (void *)MEMORY[0x263F5D440];
        id v12 = [v7 dataRepresentation];
        id v13 = [v11 monogramWithRecipe:v12 staticRepresentation:0];

        if (v13) {
          id v8 = [[CNUIPRLikenessProvider alloc] initWithPRLikeness:v13];
        }
        else {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)basicMonogramFromString:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() basicMonogramFromString:v6 color:v5];

  return v7;
}

- (id)basicMonogramObservableFromString:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() basicMonogramObservableFromString:v6 color:v5];

  return v7;
}

- (id)badgeWithLikenessBadge:(id)a3
{
  id v3 = a3;
  id v4 = [[CNUIPRLikenessBadgeImageProvider alloc] initWithBadge:v3];

  return v4;
}

- (id)badgeObservableWithLikenessBadge:(id)a3 workScheduler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke;
  v12[3] = &unk_264018B68;
  id v13 = v5;
  id v8 = v5;
  id v9 = [v7 observableFromLikenessProviderBlock:v12 withScheduler:v6];

  uint64_t v10 = [v9 doOnNext:&__block_literal_global_41];

  return v10;
}

CNUIPRLikenessBadgeImageProvider *__71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke(uint64_t a1)
{
  v1 = [[CNUIPRLikenessBadgeImageProvider alloc] initWithBadge:*(void *)(a1 + 32)];
  return v1;
}

void __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2()
{
  v0 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2_cold_1();
  }
}

CNUIPRLikenessPhotoProvider *__85__CNUIPRLikenessLookup_photoObservableWithPhotoFuture_likenessFingerprint_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CNUIPRLikenessPhotoProvider alloc] initWithPhotoData:v3 fingerprint:*(void *)(a1 + 32)];

  return v4;
}

+ (id)contactFuture:(id)a3 contactStore:(id)a4 personaId:(id)a5 scheduler:(id)a6 refetchContact:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!a7)
  {
    id v17 = +[CNUICoreLogProvider likenesses_os_log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[CNUIPRLikenessLookup contactFuture:contactStore:refetchContact:].cold.7();
    }

    id v16 = (void *)MEMORY[0x263F335E0];
    goto LABEL_7;
  }
  int v14 = [(id)objc_opt_class() useGivenAvatarForContact:v11];
  uint64_t v15 = (void *)MEMORY[0x263F335E0];
  if (v14)
  {
    id v16 = (void *)MEMORY[0x263F335E0];
LABEL_7:
    id v18 = [v16 futureWithResult:v11];
    goto LABEL_9;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke;
  v23[3] = &unk_264017C00;
  id v19 = v11;
  id v24 = v19;
  id v26 = a1;
  id v25 = v12;
  id v18 = [v15 futureWithBlock:v23 scheduler:v13];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke_51;
  v21[3] = &unk_264017A08;
  id v22 = v19;
  [v18 addSuccessBlock:v21];

LABEL_9:
  return v18;
}

id __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke(uint64_t a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = *(id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 48) descriptorForRequiredKeys];
  if (*(void *)(a1 + 40) && [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0] == 3)
  {
    uint64_t v8 = a1 + 32;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v8 + 8);
    v15[0] = v5;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    uint64_t v10 = [v7 contactsMatchingPropertiesOfContact:v6 unifyResults:1 keysToFetch:v9 error:a2];

    if ((unint64_t)[v10 count] >= 2)
    {
      id v11 = +[CNUICoreLogProvider likenesses_os_log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_20B704000, v11, OS_LOG_TYPE_INFO, "[LikenessResolver] Matched more than one contact when resolving likeness", v14, 2u);
      }
    }
    uint64_t v12 = [v10 firstObject];

    id v4 = (id)v12;
  }

  return v4;
}

void __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke_51(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider likenesses_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke_51_cold_1();
  }
}

- (BOOL)isMeContact:(id)a3
{
  id v4 = a3;
  if ([(CNUIPRLikenessLookup *)self skipContactLookup])
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [(CNUIPRLikenessLookup *)self meMonitor];

    if (v6)
    {
      id v7 = [(CNUIPRLikenessLookup *)self meMonitor];
      char v5 = [v7 isMeContact:v4];
    }
    else
    {
      uint64_t v8 = [(CNUIPRLikenessLookup *)self contactStore];
      id v7 = [v8 _crossPlatformUnifiedMeContactWithKeysToFetch:MEMORY[0x263EFFA68] error:0];

      id v9 = [v4 identifier];
      uint64_t v10 = [v7 identifier];
      char v5 = [v9 isEqualToString:v10];
    }
  }

  return v5;
}

uint64_t __62__CNUIPRLikenessLookup_photoFutureForContactFuture_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) futureResultForPhotoImageDataForMeContact:*(void *)(a1 + 40) error:a2];
}

- (id)futureResultForPhotoImageDataForMeContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263F33630]);
  uint64_t v8 = [MEMORY[0x263F335C8] currentEnvironment];
  id v9 = [v8 nicknameProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__CNUIPRLikenessLookup_futureResultForPhotoImageDataForMeContact_error___block_invoke;
  v18[3] = &unk_264018D10;
  id v10 = v6;
  id v19 = v10;
  uint64_t v20 = self;
  id v11 = v7;
  id v21 = v11;
  [v9 fetchPersonalNicknameAsContactWithCompletion:v18];

  uint64_t v12 = *MEMORY[0x263F33508];
  id v13 = [v11 future];
  int v14 = [v13 resultWithTimeout:0 error:0.2];
  uint64_t v15 = (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B8] + 16))())
  {
    uint64_t v16 = [(CNUIPRLikenessLookup *)self futureResultForPhotoImageDataForContact:v10 error:a4];

    uint64_t v15 = (void *)v16;
  }

  return v15;
}

void __72__CNUIPRLikenessLookup_futureResultForPhotoImageDataForMeContact_error___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  if (!a2) {
    id v4 = (void *)a1[4];
  }
  id v5 = v4;
  id v6 = (void *)a1[5];
  id v11 = a2;
  id v7 = [v6 photoImageDataForContact:v5 error:0];
  int v8 = (*(uint64_t (**)(void))(*MEMORY[0x263F334B8] + 16))();
  id v9 = (void *)a1[6];
  if (v8)
  {
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFE180] code:302 userInfo:0];
    [v9 finishWithError:v10];
  }
  else
  {
    [v9 finishWithResult:v7];
  }
}

- (void)setLookupOptions:(unint64_t)a3
{
  self->_lookupOptions = a3;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (CNUIMeContactMonitor)meMonitor
{
  return self->_meMonitor;
}

- (void)setMeMonitor:(id)a3
{
}

- (void)setPlaceholderProviderFactory:(id)a3
{
}

void __67__CNUIPRLikenessLookup_likenessesForContact_options_workScheduler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[LikenessResolver] Concatenation received provider %@ for contact %@");
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Falling back to silhouette likeness", v2, v3, v4, v5, v6);
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Found basic monogram likeness", v2, v3, v4, v5, v6);
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Found remote image likeness", v2, v3, v4, v5, v6);
}

- (void)likenessForContact:placeholderProviderFactory:options:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Found blessed photo likeness", v2, v3, v4, v5, v6);
}

- (void)blessedPhotoWithFuture:contact:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[LikenessResolver] Received photo provider %@ for contact %@");
}

void __79__CNUIPRLikenessLookup_blessedPhotoObservableWithFuture_contact_workScheduler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[LikenessResolver] Received photo provider %@ for contact %@");
}

- (void)remoteImageWithContactFuture:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "[LikenessResolver] Received photo provider %@ for contact %@", buf, 0x16u);
}

void __78__CNUIPRLikenessLookup_remoteImagesObservableWithContactFuture_workScheduler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_7();
  os_log_t v1 = [*(id *)(v0 + 32) result:0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[LikenessResolver] Received remote image %@ for contact %@", v4, v5, v6, v7, v8);
}

- (void)basicMonogramWithContactFuture:monogramColor:.cold.1()
{
  OUTLINED_FUNCTION_7();
  os_log_t v1 = [v0 result:0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[LikenessResolver] Creating basic monogram %@ for contact %@", v4, v5, v6, v7, v8);
}

void __79__CNUIPRLikenessLookup_basicMonogramObservableWithContactFuture_monogramColor___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  os_log_t v1 = [*(id *)(v0 + 32) result:0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[LikenessResolver] Creating basic monogram %@ for contact %@", v4, v5, v6, v7, v8);
}

- (void)silhouetteWithPlaceholderProviderFactory:contact:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Creating silhouette", v2, v3, v4, v5, v6);
}

void __71__CNUIPRLikenessLookup_badgeObservableWithLikenessBadge_workScheduler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Creating badge", v2, v3, v4, v5, v6);
}

+ (void)photoWithPhotoFuture:(uint64_t)a1 likenessFingerprint:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[LikenessResolver] Could not load photo: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)contactFuture:contactStore:refetchContact:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Using a provided transient contact", v2, v3, v4, v5, v6);
}

+ (void)contactFuture:contactStore:refetchContact:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] No refetching store provided; continuing with original contact",
    v2,
    v3,
    v4,
    v5,
    v6);
}

+ (void)contactFuture:(uint64_t)a1 contactStore:(NSObject *)a2 refetchContact:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "[LikenessResolver] Refetch failed with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)contactFuture:contactStore:refetchContact:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_20B704000, v0, OS_LOG_TYPE_ERROR, "[LikenessResolver] Refetch succeeded but no contacts were found", v1, 2u);
}

+ (void)contactFuture:contactStore:refetchContact:.cold.5()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[LikenessResolver] got contact %@ matching %@");
}

+ (void)contactFuture:contactStore:refetchContact:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Contacts access not authorized; continuing with original contact",
    v2,
    v3,
    v4,
    v5,
    v6);
}

+ (void)contactFuture:contactStore:refetchContact:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_20B704000, v0, v1, "[LikenessResolver] Contact lookup disabled, skipping contact refetch", v2, v3, v4, v5, v6);
}

void __86__CNUIPRLikenessLookup_contactFuture_contactStore_personaId_scheduler_refetchContact___block_invoke_51_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[LikenessResolver] got contact %@ matching %@");
}

- (void)photoImageDataForContact:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  os_log_t v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v0, "length"));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[LikenessResolver] Returning thumbnail/image of %@, length: %@", v4, v5, v6, v7, v8);
}

@end