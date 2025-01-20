@interface SSUXPCUtils
+ (BOOL)isPlaceholder:(id)a3;
+ (id)extractSingleBundleId:(id)a3;
+ (id)extractUserInfo:(id)a3;
+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4;
@end

@implementation SSUXPCUtils

+ (id)extractUserInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (MEMORY[0x22A657850]() == MEMORY[0x263EF8708])
  {
    v5 = xpc_dictionary_get_dictionary(v3, "UserInfo");
  }
  else
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      v8 = "+[SSUXPCUtils extractUserInfo:]";
      _os_log_error_impl(&dword_2263A0000, v4, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event of non-dictionary type", (uint8_t *)&v7, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

+ (void)dispatchAsyncWithTransaction:(id)a3 block:(id)a4
{
  id v5 = a4;
  v6 = a3;
  int v7 = (void *)os_transaction_create();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SSUXPCUtils_dispatchAsyncWithTransaction_block___block_invoke;
  v10[3] = &unk_2647A4ED8;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

uint64_t __50__SSUXPCUtils_dispatchAsyncWithTransaction_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)extractSingleBundleId:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [a1 extractUserInfo:a3];
  v4 = v3;
  if (v3)
  {
    id v5 = xpc_dictionary_get_array(v3, "bundleIDs");
    v6 = v5;
    if (v5)
    {
      size_t count = xpc_array_get_count(v5);
      id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:count];
      if (count)
      {
        size_t v10 = 0;
        *(void *)&long long v9 = 136315138;
        long long v17 = v9;
        do
        {
          string = xpc_array_get_string(v6, v10);
          if (string)
          {
            id v12 = [NSString stringWithUTF8String:string];
            [v8 addObject:v12];
          }
          else
          {
            id v12 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v19 = "+[SSUXPCUtils extractSingleBundleId:]";
              _os_log_error_impl(&dword_2263A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: Encountered non-string bundle ID. Skipping.", buf, 0xCu);
            }
          }

          ++v10;
        }
        while (count != v10);
      }
      if ([v8 count])
      {
        if ((unint64_t)[v8 count] >= 2)
        {
          v13 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v19 = "+[SSUXPCUtils extractSingleBundleId:]";
            _os_log_impl(&dword_2263A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Received list of bundle IDs of size greater than 1. Continuing using the first one.", buf, 0xCu);
          }
        }
        v14 = [v8 firstObject];
        goto LABEL_25;
      }
      v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[SSUXPCUtils extractSingleBundleId:]";
        _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Received empty list of bundle IDs. Aborting app registration handling.", buf, 0xCu);
      }
    }
    else
    {
      id v8 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[SSUXPCUtils extractSingleBundleId:]";
        _os_log_error_impl(&dword_2263A0000, v8, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing bundle IDs", buf, 0xCu);
      }
    }
    v14 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[SSUXPCUtils extractSingleBundleId:]";
    _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing user info", buf, 0xCu);
  }
  v14 = 0;
LABEL_26:

  return v14;
}

+ (BOOL)isPlaceholder:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = [a1 extractUserInfo:a3];
  v4 = v3;
  if (v3)
  {
    BOOL v5 = xpc_dictionary_get_BOOL(v3, "isPlaceholder");
  }
  else
  {
    v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      long long v9 = "+[SSUXPCUtils isPlaceholder:]";
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Received XPC event missing user info", (uint8_t *)&v8, 0xCu);
    }

    BOOL v5 = 0;
  }

  return v5;
}

@end