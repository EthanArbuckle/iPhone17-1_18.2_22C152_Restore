@interface SBCalendarWidgetMigrator
- (SBCalendarWidgetMigrator)init;
- (SBCalendarWidgetMigrator)initWithIconModelStore:(id)a3;
- (id)_maybeMigratedListFromList:(id)a3;
- (id)_performMigration:(id)a3;
- (void)migrateIfNecessary;
@end

@implementation SBCalendarWidgetMigrator

- (SBCalendarWidgetMigrator)init
{
  v3 = [@"~/Library/SpringBoard/IconState.plist" stringByExpandingTildeInPath];
  v4 = +[NSURL fileURLWithPath:v3];

  v5 = [@"~/Library/SpringBoard/DesiredIconState.plist" stringByExpandingTildeInPath];
  v6 = +[NSURL fileURLWithPath:v5];

  id v7 = [objc_alloc((Class)SBIconModelPropertyListFileStore) initWithIconStateURL:v4 desiredIconStateURL:v6];
  v8 = [(SBCalendarWidgetMigrator *)self initWithIconModelStore:v7];

  return v8;
}

- (SBCalendarWidgetMigrator)initWithIconModelStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCalendarWidgetMigrator;
  v6 = [(SBCalendarWidgetMigrator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (void)migrateIfNecessary
{
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Migration needed for calendar widgets.", buf, 2u);
  }

  store = self->_store;
  id v27 = 0;
  id v5 = [(SBIconModelStore *)store loadCurrentIconState:&v27];
  id v6 = v27;
  if (v6)
  {
    id v7 = v6;
    v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10774(v7);
    }

    objc_super v9 = v5;
LABEL_7:

    goto LABEL_8;
  }
  if (!v5)
  {
    objc_super v9 = SBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] No current icon state found to migrate.", buf, 2u);
    }
    id v7 = 0;
    goto LABEL_7;
  }
  objc_super v9 = [(SBCalendarWidgetMigrator *)self _performMigration:v5];

  if (v9)
  {
    v15 = self->_store;
    id v26 = 0;
    unsigned int v16 = [(SBIconModelStore *)v15 saveCurrentIconState:v9 error:&v26];
    id v7 = v26;
    v17 = SBLogCommon();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Migrated calendar widgets in icon state.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_106F0(v7);
    }

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_8:
  v10 = self->_store;
  id v25 = 0;
  v11 = [(SBIconModelStore *)v10 loadDesiredIconState:&v25];
  v12 = v25;
  if (v12)
  {
    v13 = v12;
    v14 = SBLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1066C(v13);
    }
  }
  else if (v11)
  {
    v19 = [(SBCalendarWidgetMigrator *)self _performMigration:v11];

    if (!v19) {
      goto LABEL_13;
    }
    v20 = self->_store;
    id v24 = 0;
    unsigned int v21 = [(SBIconModelStore *)v20 saveDesiredIconState:v19 error:&v24];
    v13 = v24;
    v22 = SBLogCommon();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Migrated calendar widgets in desired icon state.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      sub_105E8(v13);
    }
  }
  else
  {
    v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] No desired icon state found to migrate.", buf, 2u);
    }
  }

LABEL_13:
}

- (id)_performMigration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  uint64_t v6 = kSBIconStateIconLists;
  id v7 = [v4 objectForKeyedSubscript:kSBIconStateIconLists];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v34 = v6;
      v35 = v7;
      id v36 = v5;
      id v37 = v4;
      id v11 = 0;
      char v12 = 0;
      uint64_t v13 = *(void *)v39;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (!v11) {
            id v11 = objc_alloc_init((Class)NSMutableArray);
          }
          uint64_t v17 = -[SBCalendarWidgetMigrator _maybeMigratedListFromList:](self, "_maybeMigratedListFromList:", v15, v34, v35, v36, v37, (void)v38);
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
        id v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v10);
      int v20 = v12 & 1;
      id v5 = v36;
      id v4 = v37;
      uint64_t v6 = v34;
      id v7 = v35;
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
    uint64_t v23 = [(SBCalendarWidgetMigrator *)self _maybeMigratedListFromList:v22];
    id v24 = (void *)v23;
    if (v23) {
      id v25 = (void *)v23;
    }
    else {
      id v25 = v22;
    }
    if (v23) {
      int v20 = 1;
    }
    [v5 setObject:v25 forKeyedSubscript:v21];
  }
  uint64_t v26 = kSBIconStateFavoriteTodayPageList;
  id v27 = [v4 objectForKeyedSubscript:kSBIconStateFavoriteTodayPageList];
  if (v27)
  {
    uint64_t v28 = [(SBCalendarWidgetMigrator *)self _maybeMigratedListFromList:v27];
    v29 = (void *)v28;
    if (v28) {
      v30 = (void *)v28;
    }
    else {
      v30 = v22;
    }
    if (v28) {
      int v20 = 1;
    }
    [v5 setObject:v30 forKeyedSubscript:v26];
  }
  if (v20) {
    v31 = v5;
  }
  else {
    v31 = 0;
  }
  id v32 = v31;

  return v32;
}

- (id)_maybeMigratedListFromList:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v59 = 0;
    goto LABEL_78;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (!v6)
  {

    v58 = 0;
    goto LABEL_77;
  }
  id v7 = v6;
  id v61 = v3;
  char v71 = 0;
  uint64_t v8 = *(void *)v83;
  uint64_t v75 = kSBIconStateCustomIconElementTypeWidget;
  uint64_t v76 = kSBIconStateCustomIconElementTypeKey;
  uint64_t v66 = kSBIconStateIconTypeCustom;
  uint64_t v67 = kSBIconStateIconTypeKey;
  uint64_t v9 = kSBIconStateGridSizeClassIdentifier;
  id v10 = &BSCGFloatEpsilon_ptr;
  v64 = v4;
  uint64_t v65 = kSBIconStateCustomIconElementKey;
  uint64_t v69 = kSBIconStateGridSizeClassIdentifier;
  uint64_t v62 = *(void *)v83;
  id v63 = v5;
  uint64_t v74 = kSBIconStateWidgetKindKey;
  do
  {
    uint64_t v11 = 0;
    id v68 = v7;
    do
    {
      if (*(void *)v83 != v8)
      {
        uint64_t v12 = v11;
        objc_enumerationMutation(v5);
        uint64_t v11 = v12;
      }
      uint64_t v70 = v11;
      uint64_t v13 = *(void **)(*((void *)&v82 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v4 addObject:v13];
        goto LABEL_69;
      }
      id v14 = v13;
      uint64_t v15 = [v14 objectForKey:v76];
      unsigned int v16 = [v15 isEqualToString:v75];

      id v73 = v14;
      if (!v16)
      {
        int v20 = [v14 objectForKey:v67];
        if ([v20 isEqualToString:v66]
          && ([v14 objectForKey:v69], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v22 = (void *)v21;
          uint64_t v23 = [v14 objectForKey:v65];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v25 = v14;
            v72 = [v14 objectForKey:v69];
            uint64_t v26 = [v14 objectForKey:v65];
            id v27 = objc_alloc_init((Class)NSMutableArray);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v28 = v26;
            id v29 = [v28 countByEnumeratingWithState:&v77 objects:v86 count:16];
            if (!v29) {
              goto LABEL_44;
            }
            id v30 = v29;
            uint64_t v31 = *(void *)v78;
            while (1)
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(void *)v78 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  [v27 addObject:v33];
                  continue;
                }
                uint64_t v34 = v10;
                id v35 = v33;
                id v36 = [v35 objectForKey:v76];
                unsigned int v37 = [v36 isEqualToString:v75];

                if (!v37) {
                  goto LABEL_39;
                }
                long long v38 = [v35 objectForKey:v74];
                unsigned int v39 = [v38 isEqualToString:@"com.apple.CalendarWidget.CalendarWidget"];

                if (v39)
                {
                  if (([v72 isEqualToString:@"small"] & 1) != 0
                    || [v72 isEqualToString:@"medium"])
                  {
                    id v40 = objc_msgSend(v35, "mutableCopy", v61);
                    [v40 setObject:@"com.apple.CalendarWidget.CalendarUpNextWidget" forKeyedSubscript:v74];
                    [v27 addObject:v40];
                    long long v41 = SBLogCommon();
                    id v25 = v73;
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_37;
                    }
                    goto LABEL_38;
                  }
                  id v25 = v73;
                  if ([v72 isEqualToString:@"large"])
                  {
                    id v40 = [v35 mutableCopy];
                    [v40 setObject:@"com.apple.CalendarWidget.CalendarListWidget" forKeyedSubscript:v74];
                    [v27 addObject:v40];
                    long long v41 = SBLogCommon();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_37;
                    }
                    goto LABEL_38;
                  }
LABEL_39:
                  objc_msgSend(v27, "addObject:", v35, v61);
                  goto LABEL_40;
                }
                v42 = [v35 objectForKey:v74];
                unsigned int v43 = [v42 isEqualToString:@"com.apple.CalendarWidget.CalendarSpatialWidget"];

                if (v43)
                {
                  id v25 = v73;
                  if (([v72 isEqualToString:@"large"] & 1) == 0
                    && ![v72 isEqualToString:@"extraLarge"])
                  {
                    goto LABEL_39;
                  }
                  id v40 = objc_msgSend(v35, "mutableCopy", v61);
                  [v40 setObject:@"com.apple.CalendarWidget.CalendarUpNextWidget" forKeyedSubscript:v74];
                  [v27 addObject:v40];
                  long long v41 = SBLogCommon();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_37:
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Found calendar widget stack element to migrate...", buf, 2u);
                  }
LABEL_38:

                  char v71 = 1;
LABEL_40:
                  id v10 = v34;
                  goto LABEL_41;
                }
                [v27 addObject:v35];
                id v10 = v34;
                id v25 = v73;
LABEL_41:
              }
              id v30 = [v28 countByEnumeratingWithState:&v77 objects:v86 count:16];
              if (!v30)
              {
LABEL_44:

                if ([v27 count])
                {
                  id v44 = [v25 mutableCopy];
                  [v44 setObject:v27 forKeyedSubscript:v65];
                  id v4 = v64;
                  [v64 addObject:v44];
                }
                else
                {
                  id v4 = v64;
                  [v64 addObject:v25];
                }
                uint64_t v9 = v69;

                uint64_t v8 = v62;
                id v5 = v63;
                id v7 = v68;
                goto LABEL_67;
              }
            }
          }
        }
        else
        {
        }
        objc_msgSend(v4, "addObject:", v14, v61);
        id v7 = v68;
        goto LABEL_48;
      }
      uint64_t v17 = [v14 objectForKey:v74];
      unsigned int v18 = [v17 isEqualToString:@"com.apple.CalendarWidget.CalendarWidget"];

      if (v18)
      {
        uint64_t v19 = [v14 objectForKey:v9];
        if ([v19 isEqualToString:@"small"])
        {

LABEL_53:
          id v50 = objc_msgSend(v14, "mutableCopy", v61);
          [v50 setObject:@"com.apple.CalendarWidget.CalendarUpNextWidget" forKeyedSubscript:v74];
          [v4 addObject:v50];
          v51 = SBLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
LABEL_57:
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Found calendar widget to migrate...", buf, 2u);
          }
LABEL_58:

          char v71 = 1;
          uint64_t v9 = v69;
          goto LABEL_67;
        }
        v48 = [v14 objectForKey:v9];
        unsigned int v49 = [v48 isEqualToString:@"medium"];

        if (v49) {
          goto LABEL_53;
        }
        uint64_t v9 = v69;
        v54 = [v14 objectForKey:v69];
        unsigned int v55 = [v54 isEqualToString:@"large"];

        if (v55)
        {
          id v56 = [v14 mutableCopy];
          [v56 setObject:@"com.apple.CalendarWidget.CalendarListWidget" forKeyedSubscript:v74];
          [v4 addObject:v56];
          v57 = SBLogCommon();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_DEFAULT, "[CalendarWidgetMigrator] Found calendar widget to migrate...", buf, 2u);
          }

          char v71 = 1;
LABEL_67:
          id v14 = v73;
          goto LABEL_68;
        }
LABEL_63:
        objc_msgSend(v4, "addObject:", v14, v61);
        goto LABEL_68;
      }
      v45 = [v14 objectForKey:v74];
      unsigned int v46 = [v45 isEqualToString:@"com.apple.CalendarWidget.CalendarSpatialWidget"];

      if (!v46) {
        goto LABEL_63;
      }
      v47 = [v14 objectForKey:v9];
      if ([v47 isEqualToString:@"large"])
      {

LABEL_56:
        id v50 = objc_msgSend(v14, "mutableCopy", v61);
        [v50 setObject:@"com.apple.CalendarWidget.CalendarUpNextWidget" forKeyedSubscript:v74];
        [v4 addObject:v50];
        v51 = SBLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      v52 = [v14 objectForKey:v9];
      unsigned int v53 = [v52 isEqualToString:@"extraLarge"];

      if (v53) {
        goto LABEL_56;
      }
      [v4 addObject:v14];
LABEL_48:
      uint64_t v9 = v69;
LABEL_68:

LABEL_69:
      uint64_t v11 = v70 + 1;
    }
    while ((id)(v70 + 1) != v7);
    id v7 = [v5 countByEnumeratingWithState:&v82 objects:v87 count:16];
  }
  while (v7);

  if (v71) {
    v58 = v4;
  }
  else {
    v58 = 0;
  }
  id v3 = v61;
LABEL_77:
  id v59 = v58;

LABEL_78:

  return v59;
}

- (void).cxx_destruct
{
}

@end