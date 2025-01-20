@interface SBNewsIconStateMigrator
- (SBNewsIconStateMigrator)init;
- (SBNewsIconStateMigrator)initWithModelStore:(id)a3;
- (id)_defaultTodayListWidgetBundleIdentifiersExceptForNews;
- (id)_defaultTodayListWidgetGridSizeExceptForNews;
- (id)_maybeMigratedListFromList:(id)a3;
- (id)_performGridSizeClassMigration:(id)a3;
- (id)_performNewsWidgetRestoration:(id)a3;
- (void)_migrateIconStateWithBlock:(id)a3;
- (void)migrateGridSizeClassIfNecessaryFromBuildVersion:(id)a3 isInternalInstall:(BOOL)a4;
- (void)restoreNewsWidgetInTodayListFromBuildVersion:(id)a3;
@end

@implementation SBNewsIconStateMigrator

- (SBNewsIconStateMigrator)init
{
  v3 = [@"~/Library/SpringBoard/IconState.plist" stringByExpandingTildeInPath];
  v4 = +[NSURL fileURLWithPath:v3];

  v5 = [@"~/Library/SpringBoard/DesiredIconState.plist" stringByExpandingTildeInPath];
  v6 = +[NSURL fileURLWithPath:v5];

  id v7 = [objc_alloc((Class)SBIconModelPropertyListFileStore) initWithIconStateURL:v4 desiredIconStateURL:v6];
  v8 = [(SBNewsIconStateMigrator *)self initWithModelStore:v7];

  return v8;
}

- (SBNewsIconStateMigrator)initWithModelStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBNewsIconStateMigrator;
  v6 = [(SBNewsIconStateMigrator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void)migrateGridSizeClassIfNecessaryFromBuildVersion:(id)a3 isInternalInstall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 majorBuildNumber];
  if ((uint64_t)v7 < 19 || !v4)
  {
    if ((uint64_t)v7 <= 18)
    {
LABEL_10:
      v11 = SBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Migration needed for news widget family.", buf, 2u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_ED94;
      v13[3] = &unk_19888;
      v13[4] = self;
      [(SBNewsIconStateMigrator *)self _migrateIconStateWithBlock:v13];
      goto LABEL_16;
    }
  }
  else if ([v6 majorBuildNumber] == (char *)&dword_10 + 3)
  {
    objc_super v9 = [v6 majorBuildLetterString];
    unsigned __int8 v10 = [v9 isEqualToString:@"A"];

    if (v10) {
      goto LABEL_10;
    }
  }
  v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] No migration needed.", buf, 2u);
  }

LABEL_16:
}

- (void)restoreNewsWidgetInTodayListFromBuildVersion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 majorBuildNumber];
  id v6 = (char *)[v4 compareBuildVersionString:@"19C9999" withPrecision:2];

  id v7 = SBLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((uint64_t)v5 < 19 || v6 == (unsigned char *)&dword_0 + 1)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[NewsWidgetRestoreMigration] No restore needed.", buf, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Migration needed for news widget restoration.", buf, 2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_EED8;
    v9[3] = &unk_19888;
    v9[4] = self;
    [(SBNewsIconStateMigrator *)self _migrateIconStateWithBlock:v9];
  }
}

- (id)_performGridSizeClassMigration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v6 = kSBIconStateIconLists;
  id v7 = [v4 objectForKeyedSubscript:kSBIconStateIconLists];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v29 = v6;
      v30 = v7;
      id v31 = v5;
      id v32 = v4;
      id v11 = 0;
      char v12 = 0;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (!v11) {
            id v11 = objc_alloc_init((Class)NSMutableArray);
          }
          uint64_t v17 = -[SBNewsIconStateMigrator _maybeMigratedListFromList:](self, "_maybeMigratedListFromList:", v15, v29, v30, v31, v32, (void)v33);
          v18 = (void *)v17;
          if (v17) {
            uint64_t v19 = v17;
          }
          else {
            uint64_t v19 = v15;
          }
          if (v17) {
            char v12 = 1;
          }
          [v11 addObject:v19];
        }
        id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v10);
      int v20 = v12 & 1;
      id v5 = v31;
      id v4 = v32;
      uint64_t v6 = v29;
      id v7 = v30;
    }
    else
    {
      id v11 = 0;
      int v20 = 0;
    }

    [v5 setObject:v11 forKeyedSubscript:v6];
  }
  else
  {
    id v11 = 0;
    int v20 = 0;
  }
  uint64_t v21 = kSBIconStateTodayPageList;
  v22 = [v4 objectForKeyedSubscript:kSBIconStateTodayPageList];
  if (v22)
  {
    uint64_t v23 = [(SBNewsIconStateMigrator *)self _maybeMigratedListFromList:v22];
    v24 = (void *)v23;
    if (v23) {
      v25 = (void *)v23;
    }
    else {
      v25 = v22;
    }
    if (v23) {
      int v20 = 1;
    }
    [v5 setObject:v25 forKeyedSubscript:v21];
  }
  if (v20) {
    v26 = v5;
  }
  else {
    v26 = 0;
  }
  id v27 = v26;

  return v27;
}

- (id)_performNewsWidgetRestoration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v6 = kSBIconStateTodayPageList;
  id v7 = [v4 objectForKeyedSubscript:kSBIconStateTodayPageList];
  id v8 = v7;
  if (v7)
  {
    if ([v7 count] == &dword_8)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F508;
      v21[3] = &unk_198B0;
      v21[4] = self;
      v21[5] = &v22;
      [v8 enumerateObjectsUsingBlock:v21];
    }
    else
    {
      *((unsigned char *)v23 + 24) = 0;
      id v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v20 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Cannot restore News widget - today list count is not eqaul to default today list count.", v20, 2u);
      }
    }
  }
  if (*((unsigned char *)v23 + 24))
  {
    v26[0] = kSBIconStateWidgetKindKey;
    v26[1] = kSBIconStateCustomIconElementTypeKey;
    v27[0] = @"today";
    v27[1] = kSBIconStateCustomIconElementTypeWidget;
    v26[2] = kSBIconStateIconContainerBundleIdentifier;
    v26[3] = kSBIconStateIconBundleIdentifier;
    v27[2] = @"com.apple.news";
    v27[3] = @"com.apple.news.widget";
    v26[4] = kSBIconStateLeafIdentifier;
    id v10 = +[NSUUID UUID];
    id v11 = [v10 UUIDString];
    v27[4] = v11;
    v27[5] = &__kCFBooleanFalse;
    v26[5] = kSBIconStateAllowsExternalSuggestionsKey;
    v26[6] = kSBIconStateUniqueIdentifier;
    char v12 = +[NSUUID UUID];
    uint64_t v13 = [v12 UUIDString];
    v27[6] = v13;
    v27[7] = &__kCFBooleanTrue;
    v26[7] = kSBIconStateAllowsSuggestionsKey;
    v26[8] = kSBIconStateGridSizeClassIdentifier;
    v26[9] = kSBIconStateIconTypeKey;
    v27[8] = @"newsLargeTall";
    v27[9] = kSBIconStateIconTypeCustom;
    v14 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:10];

    id v15 = [v8 mutableCopy];
    [v15 insertObject:v14 atIndex:2];
    [v5 setObject:v15 forKeyedSubscript:v6];
    v16 = SBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] News widget is restored.", v20, 2u);
    }

    if (*((unsigned char *)v23 + 24)) {
      uint64_t v17 = v5;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v22, 8);

  return v18;
}

- (void)_migrateIconStateWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  store = self->_store;
  id v29 = 0;
  uint64_t v6 = [(SBIconModelStore *)store loadCurrentIconState:&v29];
  id v7 = v29;
  if (v7)
  {
    id v8 = v7;
    id v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1123C(v8);
    }

    id v10 = v6;
LABEL_5:

    goto LABEL_6;
  }
  if (!v6)
  {
    id v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] No current icon state found to migrate.", buf, 2u);
    }
    id v8 = 0;
    goto LABEL_5;
  }
  id v10 = v4[2](v4, v6);

  if (v10)
  {
    v16 = self->_store;
    id v28 = 0;
    unsigned int v17 = [(SBIconModelStore *)v16 saveCurrentIconState:v10 error:&v28];
    id v8 = v28;
    id v18 = SBLogCommon();
    uint64_t v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Migrated news widget(s) in icon state.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_111B8(v8);
    }

    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:
  id v11 = self->_store;
  id v26 = 0;
  char v12 = [(SBIconModelStore *)v11 loadDesiredIconState:&v26];
  uint64_t v13 = v26;
  if (v13)
  {
    v14 = v13;
    id v15 = SBLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_11134(v14);
    }
  }
  else if (v12)
  {
    int v20 = v4[2](v4, v12);

    if (!v20) {
      goto LABEL_11;
    }
    uint64_t v21 = self->_store;
    id v25 = 0;
    unsigned int v22 = [(SBIconModelStore *)v21 saveDesiredIconState:v20 error:&v25];
    v14 = v25;
    uint64_t v23 = SBLogCommon();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24) {
        sub_1106C(v23);
      }
    }
    else if (v24)
    {
      sub_110B0(v14);
    }
  }
  else
  {
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] No desired icon state found to migrate.", buf, 2u);
    }
  }

LABEL_11:
}

- (id)_maybeMigratedListFromList:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v25 = 0;
    goto LABEL_28;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v6)
  {

    BOOL v24 = 0;
    goto LABEL_27;
  }
  id v7 = v6;
  id v27 = v3;
  char v28 = 0;
  uint64_t v8 = *(void *)v35;
  uint64_t v9 = kSBIconStateCustomIconElementTypeKey;
  uint64_t v10 = kSBIconStateCustomIconElementTypeWidget;
  uint64_t v32 = kSBIconStateGridSizeClassIdentifier;
  uint64_t v29 = kSBIconStateIconBundleIdentifier;
  uint64_t v30 = kSBIconStateCustomIconElementTypeWidget;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v35 != v8) {
        objc_enumerationMutation(v5);
      }
      char v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v4 addObject:v12];
        continue;
      }
      id v13 = v12;
      v14 = [v13 objectForKey:v9];
      if (![v14 isEqualToString:v10]) {
        goto LABEL_16;
      }
      id v15 = [v13 objectForKey:v32];
      if (([v15 isEqualToString:@"extraLarge"] & 1) == 0)
      {

LABEL_16:
        goto LABEL_17;
      }
      [v13 objectForKey:v29];
      id v16 = v7;
      uint64_t v17 = v8;
      id v18 = v4;
      uint64_t v19 = v9;
      v21 = id v20 = v5;
      unsigned int v31 = [v21 hasPrefix:@"com.apple.news"];

      id v5 = v20;
      uint64_t v9 = v19;
      id v4 = v18;
      uint64_t v8 = v17;
      id v7 = v16;
      uint64_t v10 = v30;

      if (v31)
      {
        unsigned int v22 = SBLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[NewsIconStateMigration] Found news widget to migrate...", buf, 2u);
        }

        id v23 = [v13 mutableCopy];
        [v23 setObject:@"newsLargeTall" forKeyedSubscript:v32];
        [v4 addObject:v23];

        char v28 = 1;
        uint64_t v10 = v30;
        goto LABEL_18;
      }
LABEL_17:
      objc_msgSend(v4, "addObject:", v13, v27);
LABEL_18:
    }
    id v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  }
  while (v7);

  if (v28) {
    BOOL v24 = v4;
  }
  else {
    BOOL v24 = 0;
  }
  id v3 = v27;
LABEL_27:
  id v25 = v24;

LABEL_28:

  return v25;
}

- (id)_defaultTodayListWidgetBundleIdentifiersExceptForNews
{
  return &off_1A6D8;
}

- (id)_defaultTodayListWidgetGridSizeExceptForNews
{
  return &off_1A6F0;
}

- (void).cxx_destruct
{
}

@end