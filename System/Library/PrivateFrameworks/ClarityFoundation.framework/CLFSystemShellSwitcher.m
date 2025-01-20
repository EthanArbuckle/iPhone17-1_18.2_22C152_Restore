@interface CLFSystemShellSwitcher
+ (CLFSystemShellSwitcher)sharedSystemShellSwitcher;
- (BOOL)_createFileWithError:(id *)a3;
- (BOOL)_removeFileWithError:(id *)a3;
- (BOOL)isClarityBoardEnabled;
- (BOOL)setClarityBoardEnabled:(BOOL)a3 error:(id *)a4;
- (id)_directoryURL;
- (void)setClarityBoardEnabled:(BOOL)a3;
- (void)signalSiriAvailability;
@end

@implementation CLFSystemShellSwitcher

- (BOOL)isClarityBoardEnabled
{
  return _AXSClarityBoardEnabled() != 0;
}

+ (CLFSystemShellSwitcher)sharedSystemShellSwitcher
{
  if (sharedSystemShellSwitcher_onceToken != -1) {
    dispatch_once(&sharedSystemShellSwitcher_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedSystemShellSwitcher_SharedSystemShellSwitcher;
  return (CLFSystemShellSwitcher *)v2;
}

uint64_t __51__CLFSystemShellSwitcher_sharedSystemShellSwitcher__block_invoke()
{
  sharedSystemShellSwitcher_SharedSystemShellSwitcher = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BOOL)setClarityBoardEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  v7 = +[CLFLog commonLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v20 = v5;
    _os_log_impl(&dword_217F54000, v7, OS_LOG_TYPE_DEFAULT, "Set ClarityBoard enabled: %i", buf, 8u);
  }

  if (v5)
  {
    v8 = +[CLFSettings_GeneratedCode sharedInstance];
    [v8 setRestartReason:@"enableClarityBoard"];

    v9 = +[CLFSettings_GeneratedCode sharedInstance];
    [v9 setShouldShowTripleClickInstructions:1];

    if (![(CLFSystemShellSwitcher *)self _createFileWithError:a4])
    {
LABEL_12:
      LOBYTE(v10) = 0;
      return v10;
    }
LABEL_7:
    uint64_t v11 = reboot3();
    if (!v11)
    {
      LOBYTE(v10) = 1;
      return v10;
    }
    uint64_t v12 = v11;
    v13 = +[CLFLog commonLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CLFSystemShellSwitcher setClarityBoardEnabled:error:](v12, v13);
    }

    if (a4)
    {
      v14 = objc_msgSend(NSNumber, "numberWithInt:", v12, @"RebootErrorCode");
      v18 = v14;
      v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:5 userInfo:v15];
    }
    goto LABEL_12;
  }
  BOOL v10 = [(CLFSystemShellSwitcher *)self _removeFileWithError:a4];
  if (v10) {
    goto LABEL_7;
  }
  return v10;
}

- (id)_directoryURL
{
  return (id)MEMORY[0x270F90670](self, a2);
}

- (BOOL)_createFileWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = [(CLFSystemShellSwitcher *)self _directoryURL];
  if (v4)
  {
    BOOL v5 = [MEMORY[0x263F08850] defaultManager];
    id v17 = 0;
    int v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v7 = v17;
    if (!v6)
    {
      v14 = +[CLFLog commonLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[CLFSystemShellSwitcher _createFileWithError:]();
      }

      if (a3)
      {
        if (v7)
        {
          uint64_t v18 = *MEMORY[0x263F08608];
          id v19 = v7;
          [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        }
        [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:3 userInfo:0];
        LOBYTE(v10) = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      goto LABEL_25;
    }
    v8 = [v4 URLByAppendingPathComponent:@"ClarityBoardEnabled"];
    v9 = [MEMORY[0x263EFF8F8] data];
    id v16 = 0;
    int v10 = [v9 writeToURL:v8 options:0x10000000 error:&v16];
    id v11 = v16;

    uint64_t v12 = +[CLFLog commonLog];
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v8;
        _os_log_impl(&dword_217F54000, v13, OS_LOG_TYPE_DEFAULT, "Created file at %@.", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[CLFSystemShellSwitcher _createFileWithError:]();
      }

      if (!a3) {
        goto LABEL_24;
      }
      if (v11)
      {
        uint64_t v20 = *MEMORY[0x263F08608];
        id v21 = v11;
        v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      }
      else
      {
        v13 = 0;
      }
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:2 userInfo:v13];
    }

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:1 userInfo:0];
    LOBYTE(v10) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_26:

  return v10;
}

- (BOOL)_removeFileWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = [(CLFSystemShellSwitcher *)self _directoryURL];
  if (v4)
  {
    BOOL v5 = [MEMORY[0x263F08850] defaultManager];
    int v6 = [v4 URLByAppendingPathComponent:@"ClarityBoardEnabled"];
    id v15 = 0;
    int v7 = [v5 removeItemAtURL:v6 error:&v15];
    id v8 = v15;
    v9 = v8;
    if (v7)
    {
      int v10 = +[CLFLog commonLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_217F54000, v10, OS_LOG_TYPE_DEFAULT, "Removed file at %@.", buf, 0xCu);
      }
LABEL_20:

      goto LABEL_21;
    }
    id v11 = [v8 domain];
    if ([v11 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v12 = [v9 code];

      if (v12 == 4)
      {
        LOBYTE(v7) = 1;
        goto LABEL_21;
      }
    }
    else
    {
    }
    v13 = +[CLFLog commonLog];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[CLFSystemShellSwitcher _removeFileWithError:]();
    }

    if (a3)
    {
      if (v9)
      {
        uint64_t v16 = *MEMORY[0x263F08608];
        id v17 = v9;
        int v10 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      }
      else
      {
        int v10 = 0;
      }
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:4 userInfo:v10];
      goto LABEL_20;
    }
    LOBYTE(v7) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"CLFSystemShellSwitcher" code:1 userInfo:0];
    LOBYTE(v7) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_22:

  return v7;
}

- (void)signalSiriAvailability
{
  v3 = +[CLFLog commonLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217F54000, v3, OS_LOG_TYPE_DEFAULT, "Siri is now available", buf, 2u);
  }

  v4 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CLFSystemShellSwitcher_signalSiriAvailability__block_invoke;
  block[3] = &unk_2642F37D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__CLFSystemShellSwitcher_signalSiriAvailability__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isClarityBoardEnabled])
  {
    v1 = NSDictionary;
    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v3 = [v2 pathForResource:@"CLFSiriAXBundles" ofType:@"plist"];
    v4 = [v1 dictionaryWithContentsOfFile:v3];

    BOOL v5 = [v4 objectForKey:@"SiriAXBundles"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = [NSString stringWithFormat:@"/System/Library/AccessibilityBundles/%@.axbundle", *(void *)(*((void *)&v12 + 1) + 8 * v9)];
          id v11 = [MEMORY[0x263F086E0] bundleWithPath:v10];
          [v11 load];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)setClarityBoardEnabled:(BOOL)a3
{
  self->_clarityBoardEnabled = a3;
}

- (void)setClarityBoardEnabled:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_217F54000, a2, OS_LOG_TYPE_FAULT, "Unable to initiate user-space reboot. Error code: %i", (uint8_t *)v2, 8u);
}

- (void)_createFileWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217F54000, v0, v1, "Error creating file at %@: %@.");
}

- (void)_createFileWithError:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217F54000, v0, v1, "Error creating directory at %@: %@");
}

- (void)_removeFileWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217F54000, v0, v1, "Error removing file at %@: %@.");
}

@end