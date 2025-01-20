@interface WKWebExtensionDeclarativeNetRequestSQLiteStore
@end

@implementation WKWebExtensionDeclarativeNetRequestSQLiteStore

void __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v8, (id *)(a1 + 48));
  v4 = v8;
  if (v8)
  {
    if ([v3 length])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v4);
      objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke_2;
      v6[3] = &unk_1E5810FD8;
      uint64_t v5 = *(void *)(a1 + 32);
      id v7 = *(id *)(a1 + 40);
      [v4 addRules:v5 completionHandler:v6];
    }
    CFRelease(v4);
  }
}

uint64_t __103___WKWebExtensionDeclarativeNetRequestSQLiteStore_updateRulesByRemovingIDs_addRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke(id *a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v60, a1 + 6);
  id v1 = v60;
  if (v60)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v60);
    id v59 = 0;
    obuint64_t j = v1;
    char v2 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v59];
    id v3 = v59;

    if ((v2 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_2;
      block[3] = &unk_1E5811000;
      id v58 = a1[5];
      id v27 = v3;
      id v57 = v27;
      dispatch_async(MEMORY[0x1E4F14428], block);

      v4 = v58;
LABEL_35:

      if (v60) {
        CFRelease(v60);
      }
      return;
    }
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[4], "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v5 = a1[4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v53 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = WebKit::objectForKey<NSNumber>(*(void **)(*((void *)&v52 + 1) + 8 * i), @"id");
          [v4 addObject:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v63 count:16];
      }
      while (v6);
    }

    v10 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
    v11 = (void *)v10[3];
    v12 = NSString;
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v10);
    uint64_t v13 = *(void *)(objc_claimAutoreleasedReturnValue() + 56);
    v14 = [v4 componentsJoinedByString:@", "];
    v15 = [v12 stringWithFormat:@"SELECT id FROM %@ WHERE id in (%@)", v13, v14];
    v16 = WebKit::SQLiteDatabaseFetch<>(v11, v15);

    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v62 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "int64AtIndex:", 0));
          [v17 addObject:v22];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v62 count:16];
      }
      while (v19);
    }

    if ([v17 count] == 1)
    {
      v23 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
      uint64_t v24 = *(void *)(objc_claimAutoreleasedReturnValue() + 48);
      v25 = [v17 firstObject];
      uint64_t v26 = [v23 stringWithFormat:@"Failed to add %@ rules. Rule %@ does not have a unique ID.", v24, v25];
    }
    else
    {
      if ((unint64_t)[v17 count] < 2)
      {
LABEL_23:
        if ([v3 length])
        {
          v31 = (id *)v47;
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_3;
          v47[3] = &unk_1E5811000;
          v47[5] = a1[5];
          id v27 = v3;
          v47[4] = v27;
        }
        else
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id obja = a1[4];
          uint64_t v32 = [obja countByEnumeratingWithState:&v43 objects:v61 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v44;
LABEL_27:
            uint64_t v34 = 0;
            v35 = v3;
            while (1)
            {
              if (*(void *)v44 != v33) {
                objc_enumerationMutation(obja);
              }
              uint64_t v36 = *(void *)(*((void *)&v43 + 1) + 8 * v34);
              v37 = v60;
              v38 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v60);
              WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v38);
              id v3 = [(id)objc_claimAutoreleasedReturnValue() _insertRule:v36 inDatabase:v37[3]];

              if ([v3 length]) {
                break;
              }
              ++v34;
              v35 = v3;
              if (v32 == v34)
              {
                uint64_t v32 = [obja countByEnumeratingWithState:&v43 objects:v61 count:16];
                if (v32) {
                  goto LABEL_27;
                }
                break;
              }
            }
          }

          v31 = (id *)v42;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_4;
          v42[3] = &unk_1E5811000;
          v42[5] = a1[5];
          id v27 = v3;
          v42[4] = v27;
        }
        dispatch_async(MEMORY[0x1E4F14428], v31);

        goto LABEL_35;
      }
      v28 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(obj);
      uint64_t v29 = *(void *)(objc_claimAutoreleasedReturnValue() + 48);
      v25 = [v17 componentsJoinedByString:@", "];
      uint64_t v26 = [v28 stringWithFormat:@"Failed to add %@ rules. Some rules do not have unique IDs (%@).", v29, v25];
    }
    v30 = (void *)v26;

    id v3 = v30;
    goto LABEL_23;
  }
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __78___WKWebExtensionDeclarativeNetRequestSQLiteStore_addRules_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v26, a1 + 6);
  char v2 = v26;
  if (v26)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v26);
    id v25 = 0;
    char v3 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v25 createIfNecessary:0];
    id v4 = v25;

    if (v3)
    {
      id v5 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      uint64_t v6 = (void *)v2[3];
      uint64_t v7 = NSString;
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v5);
      objc_claimAutoreleasedReturnValue();
      uint64_t v8 = v2[7];
      v9 = [a1[4] componentsJoinedByString:@", "];
      v10 = [v7 stringWithFormat:@"DELETE FROM %@ WHERE id in (%@)", v8, v9];
      LODWORD(v6) = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v6, 0, v10);

      if (v6 != 101)
      {
        v11 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
          objc_claimAutoreleasedReturnValue();
          uint64_t v17 = v2[1];
          *(_DWORD *)buf = 138477827;
          uint64_t v28 = v17;
          _os_log_error_impl(&dword_1985F2000, v11, OS_LOG_TYPE_ERROR, "Failed to delete rules for extension %{private}@.", buf, 0xCu);
        }
        v12 = NSString;
        WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
        objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 stringWithFormat:@"Failed to delete rules from %@ rules storage.", v2[6]];

        id v4 = (id)v13;
      }
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v2);
      v14 = [(id)objc_claimAutoreleasedReturnValue() _deleteDatabaseIfEmpty];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_34;
      block[3] = &unk_1E5811028;
      id v21 = a1[5];
      id v15 = v4;
      id v19 = v15;
      id v20 = v14;
      id v16 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_2;
      v22[3] = &unk_1E5811000;
      id v24 = a1[5];
      id v15 = v4;
      id v23 = v15;
      dispatch_async(MEMORY[0x1E4F14428], v22);

      id v16 = v24;
    }

    if (v26) {
      CFRelease(v26);
    }
  }
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_deleteRules_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) length];
  uint64_t v4 = 32;
  if (!v3) {
    uint64_t v4 = 40;
  }
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v6(v2, v5);
}

void __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke(uint64_t a1)
{
  WTF::WeakObjCPtrArc<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::get(&v13, (id *)(a1 + 40));
  id v2 = v13;
  if (v13)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v13);
    id v12 = 0;
    uint64_t v3 = [(id)objc_claimAutoreleasedReturnValue() _getRulesWithOutErrorMessage:&v12];
    id v4 = v12;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5811028;
    id v5 = *(id *)(a1 + 32);
    id v10 = v4;
    id v11 = v5;
    id v9 = v3;
    id v6 = v4;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);

    CFRelease(v2);
  }
}

uint64_t __81___WKWebExtensionDeclarativeNetRequestSQLiteStore_getRulesWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end