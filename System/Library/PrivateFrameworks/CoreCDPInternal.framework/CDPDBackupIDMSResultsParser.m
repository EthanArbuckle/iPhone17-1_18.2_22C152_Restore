@interface CDPDBackupIDMSResultsParser
- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4;
@end

@implementation CDPDBackupIDMSResultsParser

- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 recoveredInfo];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F32A58]];

  v8 = objc_msgSend(v7, "cdp_unarchivedRoot");
  v9 = [v5 device];

  v10 = [v9 machineID];

  v11 = [v8 objectForKeyedSubscript:@"prk"];
  v12 = [MEMORY[0x263EFF9A0] dictionary];
  v13 = (void *)MEMORY[0x263F34290];
  if (v10)
  {
    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v14, OS_LOG_TYPE_DEFAULT, "Parsed a MID", buf, 2u);
    }

    [v12 setObject:v10 forKeyedSubscript:*v13];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v16 = (void *)MEMORY[0x263F34288];
  if (isKindOfClass)
  {
    v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_218640000, v17, OS_LOG_TYPE_DEFAULT, "Parsed a PRK", v23, 2u);
    }

    [v12 setObject:v11 forKeyedSubscript:*v16];
  }
  uint64_t v18 = [v12 objectForKeyedSubscript:*v13];
  if (v18
    && (v19 = (void *)v18,
        [v12 objectForKeyedSubscript:*v16],
        v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        v20))
  {
    v21 = (void *)[v12 copy];
  }
  else if (a4)
  {
    _CDPStateError();
    v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end