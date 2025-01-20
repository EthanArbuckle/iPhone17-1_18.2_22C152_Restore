@interface MCMRuntimeState
- (MCMRuntimeState)init;
- (MCMTestLocks)testLocks;
- (NSURL)url;
- (id)_accumulateAsPlist;
- (id)_accumulateTestLocksAsPlistArray;
- (id)_urlForDirectory;
- (void)_accumulateAndPersist;
- (void)_loadAndRestore;
- (void)_restoreFromPlist:(id)a3;
- (void)_restoreTestLock:(unint64_t)a3 count:(unint64_t)a4;
- (void)_restoreTestLocksWithPlistArray:(id)a3;
- (void)persist;
- (void)reset;
- (void)restore;
@end

@implementation MCMRuntimeState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_testLocks, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (MCMTestLocks)testLocks
{
  return self->_testLocks;
}

- (void)_restoreTestLock:(unint64_t)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      v7 = [(MCMRuntimeState *)self testLocks];
      [v7 acquireLock:a3];

      --v4;
    }
    while (v4);
  }
}

- (void)_restoreTestLocksWithPlistArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        id v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_11:
          id v12 = 0;
          id v13 = 0;
          v14 = 0;
          goto LABEL_12;
        }
        if (!v9) {
          goto LABEL_11;
        }
        v10 = [v9 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksNum"];
        objc_opt_class();
        id v11 = v10;
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }

        v16 = [v9 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksCount"];
        objc_opt_class();
        id v17 = v16;
        if (objc_opt_isKindOfClass()) {
          id v13 = v17;
        }
        else {
          id v13 = 0;
        }

        if (v12 && v13)
        {
          -[MCMRuntimeState _restoreTestLock:count:](self, "_restoreTestLock:count:", [v12 unsignedLongLongValue], objc_msgSend(v13, "unsignedLongValue"));
          v14 = v9;
          goto LABEL_15;
        }
        v14 = v9;
LABEL_12:
        v15 = container_log_handle_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v9;
          _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Malformed test locks dict when restoring state; testLockValue = %@",
            buf,
            0xCu);
        }

LABEL_15:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
      uint64_t v5 = v18;
    }
    while (v18);
  }
}

- (void)_restoreFromPlist:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksEnabled"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    uint64_t v7 = [v6 BOOLValue];
    v8 = [(MCMRuntimeState *)self testLocks];
    [v8 setEnabled:v7];
  }
  id v9 = [v12 objectForKeyedSubscript:@"MCMRuntimeStateTestLocks"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11) {
    [(MCMRuntimeState *)self _restoreTestLocksWithPlistArray:v11];
  }
}

- (void)_loadAndRestore
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = +[MCMFileManager defaultManager];
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = [(MCMRuntimeState *)self url];
  id v12 = 0;
  uint64_t v7 = objc_msgSend(v5, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v6, 0, v4, 0, &v12);
  id v8 = v12;

  if (!v7)
  {
    id v9 = [v8 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v10 = [v8 code];

      if (v10 == 2)
      {
        id v11 = container_log_handle_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEBUG, "Did not find runtime state to restore, so skipping", buf, 2u);
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    id v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Could not load runtime state to restore; error = %@",
        buf,
        0xCu);
    }
    goto LABEL_10;
  }
  [(MCMRuntimeState *)self _restoreFromPlist:v7];
LABEL_11:
}

- (id)_accumulateTestLocksAsPlistArray
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 15; ++i)
  {
    id v5 = [(MCMRuntimeState *)self testLocks];
    uint64_t v6 = [v5 countOfLock:i];

    if (v6 >= 1)
    {
      v12[0] = @"MCMRuntimeStateTestLocksNum";
      uint64_t v7 = [NSNumber numberWithUnsignedLongLong:i];
      v12[1] = @"MCMRuntimeStateTestLocksCount";
      v13[0] = v7;
      id v8 = [NSNumber numberWithInteger:v6];
      v13[1] = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
      [v3 addObject:v9];
    }
  }
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (id)_accumulateAsPlist
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"MCMRuntimeStateTestLocksEnabled";
  id v3 = NSNumber;
  uint64_t v4 = [(MCMRuntimeState *)self testLocks];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "enabled"));
  v9[1] = @"MCMRuntimeStateTestLocks";
  v10[0] = v5;
  uint64_t v6 = [(MCMRuntimeState *)self _accumulateTestLocksAsPlistArray];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)_accumulateAndPersist
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  uint64_t v4 = +[MCMFileManager defaultManager];
  id v5 = [(MCMRuntimeState *)self _accumulateAsPlist];
  uint64_t v6 = [(MCMRuntimeState *)self url];
  id v10 = 0;
  char v7 = objc_msgSend(v5, "MCM_writeToURL:withOptions:fileManager:error:", v6, 0x10000000, v4, &v10);
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    id v9 = container_log_handle_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Failed to write runtime state data; error = %@",
        buf,
        0xCu);
    }
  }
}

- (id)_urlForDirectory
{
  if (xpc_is_system_session()) {
    v2 = @"root";
  }
  else {
    v2 = @"mobile";
  }
  id v3 = +[MCMPOSIXUser posixUserWithName:v2];
  uint64_t v4 = [v3 homeDirectoryURL];
  id v5 = [v4 URLByAppendingPathComponent:@"Library/MobileContainerManager" isDirectory:1];

  return v5;
}

- (void)restore
{
  if (os_variant_has_internal_content())
  {
    [(MCMRuntimeState *)self _loadAndRestore];
  }
}

- (void)persist
{
  if (os_variant_has_internal_content())
  {
    [(MCMRuntimeState *)self _accumulateAndPersist];
  }
}

- (void)reset
{
  id v4 = +[MCMFileManager defaultManager];
  id v3 = [(MCMRuntimeState *)self url];
  [v4 removeItemAtURL:v3 error:0];
}

- (MCMRuntimeState)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)MCMRuntimeState;
  v2 = [(MCMRuntimeState *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    id v4 = [(MCMRuntimeState *)v2 _urlForDirectory];
    id v5 = [v4 URLByAppendingPathComponent:@"runtime_state" isDirectory:0];
    uint64_t v6 = [v5 URLByAppendingPathExtension:@"plist"];
    url = v3->_url;
    v3->_url = (NSURL *)v6;

    uint64_t v8 = +[MCMTestLocks sharedInstance];
    testLocks = v3->_testLocks;
    v3->_testLocks = (MCMTestLocks *)v8;
  }
  return v3;
}

@end