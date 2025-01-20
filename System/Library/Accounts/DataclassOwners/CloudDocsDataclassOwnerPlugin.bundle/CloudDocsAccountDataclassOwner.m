@interface CloudDocsAccountDataclassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation CloudDocsAccountDataclassOwner

+ (id)dataclasses
{
  uint64_t v4 = kAccountDataclassUbiquity;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return [(CloudDocsAccountDataclassOwner *)self actionsForEnablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return [(CloudDocsAccountDataclassOwner *)self actionsForDisablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v12, 0, sizeof(v12));
  sub_2754(0, (uint64_t)"-[CloudDocsAccountDataclassOwner actionsForEnablingDataclassOnAccount:forDataclass:]", 37, v12);
  v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v12[0];
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx action for enabling %@ in %@%@", buf, 0x2Au);
  }

  v9 = +[ACDataclassAction actionWithType:1];
  v13 = v9;
  v10 = +[NSArray arrayWithObjects:&v13 count:1];

  sub_2928(v12);
  return v10;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(v32, 0, sizeof(v32));
  sub_2754(0, (uint64_t)"-[CloudDocsAccountDataclassOwner actionsForDisablingDataclassOnAccount:forDataclass:]", 43, v32);
  v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v37 = v32[0];
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = v5;
    __int16 v42 = 2112;
    v43 = v7;
    _os_log_debug_impl(&dword_0, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx action for disabling %@ in %@%@", buf, 0x2Au);
  }

  v9 = +[BRAccount currentLoggedInAccountWithError:0];
  v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  v11 = [v9 containerWithPendingChanges];
  id v12 = [v11 count];
  if (v11 && !v12)
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_31B0((uint64_t)v13, v14);
    }

LABEL_9:
    id v15 = +[ACDataclassAction actionWithType:3];
    v33[0] = v15;
    id v16 = +[ACDataclassAction actionWithType:0];
    v33[1] = v16;
    id v17 = +[NSArray arrayWithObjects:v33 count:2];
    goto LABEL_20;
  }
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v11;
  id v18 = [v15 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "localizedName", (void)v28);
        [v16 addObject:v22];
      }
      id v19 = [v15 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v19);
  }

  v23 = brc_bread_crumbs();
  v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_3228((uint64_t)v15, (uint64_t)v23, v24);
  }

  v25 = +[ACDataclassAction destructiveActionWithType:8 affectedContainers:v16];
  v34[0] = v25;
  v26 = +[ACDataclassAction actionWithType:0];
  v34[1] = v26;
  id v17 = +[NSArray arrayWithObjects:v34 count:2];

LABEL_20:
  sub_2928(v32);

  return v17;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  memset(v12, 0, sizeof(v12));
  sub_2754(0, (uint64_t)"-[CloudDocsAccountDataclassOwner performAction:forAccount:withChildren:forDataclass:]", 79, v12);
  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v14 = v12[0];
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx perform action %@ for %@%@", buf, 0x2Au);
  }

  sub_2928(v12);
  return 1;
}

@end