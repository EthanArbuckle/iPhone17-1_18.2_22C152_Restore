@interface WKWebExtensionRegisteredScriptsSQLiteStore
@end

@implementation WKWebExtensionRegisteredScriptsSQLiteStore

id __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = [a3 objectForKeyedSubscript:@"id"];

  return v3;
}

void __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v8, (id *)(a1 + 48));
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
      v6[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_3;
      v6[3] = &unk_1E5810FD8;
      uint64_t v5 = *(void *)(a1 + 32);
      id v7 = *(id *)(a1 + 40);
      [v4 addScripts:v5 completionHandler:v6];
    }
    CFRelease(v4);
  }
}

uint64_t __79___WKWebExtensionRegisteredScriptsSQLiteStore_updateScripts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v33, a1 + 6);
  v1 = v33;
  if (v33)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v33);
    id v32 = 0;
    v21 = v1;
    char v2 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v32 createIfNecessary:0];
    v20 = (__CFString *)v32;

    if (v2)
    {
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v1);
      v19 = *(void **)(objc_claimAutoreleasedReturnValue() + 24);
      id v3 = NSString;
      id obja = a1[4];
      v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obja, "count"));
      v18 = v3;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      long long v34 = 0u;
      id obj = obja;
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v35 != v6) {
              objc_enumerationMutation(obj);
            }
            v8 = [*(id *)(*((void *)&v34 + 1) + 8 * i) stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
            v9 = [NSString stringWithFormat:@"'%@'", v8];
            [v4 addObject:v9];
          }
          uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
        }
        while (v5);
      }

      v10 = [v4 componentsJoinedByString:@","];

      v11 = [v18 stringWithFormat:@"DELETE FROM registered_scripts WHERE key in (%@)", v10];
      int v12 = WebKit::_SQLiteDatabaseExecuteAndReturnError<>(v19, 0, v11);

      if (v12 != 101)
      {
        v13 = (id)qword_1EB357DF8;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v21);
          objc_claimAutoreleasedReturnValue();
          uint64_t v17 = v21[1];
          *(_DWORD *)buf = 138477827;
          uint64_t v39 = v17;
          _os_log_error_impl(&dword_1985F2000, v13, OS_LOG_TYPE_ERROR, "Failed to delete scripts for extension %{private}@.", buf, 0xCu);
        }
        v20 = @"Failed to delete scripts from registered content scripts storage.";
      }
      WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v21);
      v14 = [(id)objc_claimAutoreleasedReturnValue() _deleteDatabaseIfEmpty];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_13;
      block[3] = &unk_1E5811028;
      id v28 = a1[5];
      v15 = v20;
      v26 = v15;
      id v27 = v14;
      id v16 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_2;
      v29[3] = &unk_1E5811000;
      id v31 = a1[5];
      v15 = v20;
      v30 = v15;
      dispatch_async(MEMORY[0x1E4F14428], v29);

      id v16 = v31;
    }

    if (v33) {
      CFRelease(v33);
    }
  }
}

uint64_t __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __86___WKWebExtensionRegisteredScriptsSQLiteStore_deleteScriptsWithIDs_completionHandler___block_invoke_13(uint64_t a1)
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

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"persistAcrossSessions"];
  objc_opt_class();
  uint64_t v4 = WTF::dynamic_objc_cast<NSNumber>(v3);

  if (v4) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v25, a1 + 6);
  id v2 = v25;
  if (v25)
  {
    WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v25);
    id v24 = 0;
    char v3 = [(id)objc_claimAutoreleasedReturnValue() _openDatabaseIfNecessaryReturningErrorMessage:&v24];
    id v4 = v24;

    if (v3)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = a1[4];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v20;
        do
        {
          uint64_t v8 = 0;
          v9 = v4;
          do
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
            v11 = v25;
            int v12 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v25);
            v13 = WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v12);
            uint64_t v14 = v11[3];
            id v18 = v9;
            [v13 _insertScript:v10 inDatabase:v14 errorMessage:&v18];
            id v4 = v18;

            ++v8;
            v9 = v4;
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }
        while (v6);
      }

      v15 = (id *)v17;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_4;
      v17[3] = &unk_1E5811000;
      v17[5] = a1[5];
      id v16 = v4;
      v17[4] = v16;
    }
    else
    {
      v15 = (id *)v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_3;
      v23[3] = &unk_1E5811000;
      v23[5] = a1[5];
      id v16 = v4;
      v23[4] = v16;
    }
    dispatch_async(MEMORY[0x1E4F14428], v15);

    if (v25) {
      CFRelease(v25);
    }
  }
}

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76___WKWebExtensionRegisteredScriptsSQLiteStore_addScripts_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke(uint64_t a1)
{
  WTF::WeakObjCPtrArc<_WKWebExtensionRegisteredScriptsSQLiteStore>::get(&v12, (id *)(a1 + 40));
  id v2 = v12;
  WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v12);
  id v11 = 0;
  char v3 = [(id)objc_claimAutoreleasedReturnValue() _getScriptsWithOutErrorMessage:&v11];
  id v4 = v11;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5811028;
  id v10 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v4;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  if (v2) {
    CFRelease(v2);
  }
}

uint64_t __79___WKWebExtensionRegisteredScriptsSQLiteStore_getScriptsWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end