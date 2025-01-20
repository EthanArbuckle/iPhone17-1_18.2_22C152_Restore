@interface IMLogDump
+ (id)sharedInstance;
- (BOOL)_checkArgumentValidity:(id)a3 withFileName:(id)a4 withPredicate:(id)a5 withError:(id *)a6;
- (BOOL)_isOnPower;
- (BOOL)_isWifiUsable;
- (BOOL)shouldCollectPowerWifiStats;
- (IMLogDump)init;
- (OS_dispatch_queue)logDumpQueue;
- (double)_calculateMinutesSyncingWithDurationKey:(id)a3 attemptDateKey:(id)a4;
- (id)_calculatePowerAndWifiConnectedTimeInMinutesForDictionary:(id)a3;
- (id)_dictionaryForDayKey:(id)a3;
- (id)_lastHoursToAppend:(int)a3;
- (id)_predicateToAppend:(id)a3;
- (id)logShowCommandToFilePath:(id)a3 lastHours:(int)a4 predicate:(id)a5;
- (void)_calculateConnectedMinutesForDateKey:(id)a3 durationKey:(id)a4 daysDictionary:(id)a5 totalDurationDictionary:(id)a6 totalDurationKey:(id)a7;
- (void)_compressAndDeleteFilesAtPath:(id)a3 destinationFilePath:(id)a4 withCompletion:(id)a5;
- (void)_incrementSyncAttemptsWithKey:(id)a3 syncDateKey:(id)a4;
- (void)_noteSyncEndedForDurationKey:(id)a3 dateKey:(id)a4;
- (void)clearSyncStats;
- (void)dumpLogsToFolderAtPath:(id)a3 withFileName:(id)a4 lastHours:(int)a5 predicate:(id)a6 includeCKDebug:(BOOL)a7 withCompletion:(id)a8;
- (void)dumpMOCLoggingMetaData;
- (void)incrementAHDASyncAttempts;
- (void)incrementCoreDuetSyncAttempts;
- (void)noteAHDASyncEnded;
- (void)noteCoreDuetSyncEnded;
- (void)printIfWeAreInTheMiddleOfASync;
- (void)printPowerAndWifiStats;
- (void)printSyncDurationStats;
@end

@implementation IMLogDump

+ (id)sharedInstance
{
  if (qword_1EB4A66E0 != -1) {
    dispatch_once(&qword_1EB4A66E0, &unk_1EF2BF2A0);
  }
  v2 = (void *)qword_1EB4A6640;

  return v2;
}

- (IMLogDump)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMLogDump;
  v2 = [(IMLogDump *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.Messages.IMLogDump", 0);
    logDumpQueue = v2->_logDumpQueue;
    v2->_logDumpQueue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F6C360] sharedInstance];
    int v6 = [v5 isInternalInstall];

    if (v6) {
      v2->_shouldCollectPowerWifiStats = 1;
    }
  }
  return v2;
}

- (id)_predicateToAppend:(id)a3
{
  return (id)[NSString stringWithFormat:@" --predicate '%@'", a3];
}

- (id)_lastHoursToAppend:(int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @" --last %dh", *(void *)&a3);
}

- (void)dumpMOCLoggingMetaData
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v3 = (id)*MEMORY[0x1E4F177E8];
  uint64_t v33 = 0;
  v26 = v2;
  id v24 = v3;
  v27 = objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:error:");
  id v23 = 0;
  v4 = [v2 accountsWithAccountType:v27];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v4;
      __int16 v37 = 2112;
      id v38 = v23;
      __int16 v39 = 2112;
      id v40 = v24;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Accounts %@ accountTypeError %@ ID Type %@", buf, 0x20u);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = *MEMORY[0x1E4F176A8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v11 = [v10 accountProperties];
        v12 = [v11 valueForKey:v8];
        v13 = NSString;
        v14 = [v10 username];
        v15 = [v13 stringWithFormat:@"%@@%@", v14, v12];

        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [v10 qualifiedUsername];
            *(_DWORD *)buf = 138412546;
            v36 = v15;
            __int16 v37 = 2112;
            id v38 = v17;
            _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "<StartAccountDetails>Account userName %@ | Account qualifiedUserName %@ <EndAccountDetails>", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  v18 = IMGetCachedDomainValueForKey();
  v19 = IMGetCachedDomainValueForKey();
  v20 = IMGetCachedDomainValueForKey();
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v18;
      _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "<StartCoreDuetSyncInfo> LastFullSyncAttempt\x05 %@ <EndCoreDuetLastFullSyncInfo>", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "<StartAHDAgentSyncInfo> LastSyncAttempt %@  | Info %@ <EndAHDAgentSyncInfo>", buf, 0x16u);
    }
  }
  [(IMLogDump *)self printSyncDurationStats];
  [(IMLogDump *)self printPowerAndWifiStats];
}

- (void)_compressAndDeleteFilesAtPath:(id)a3 destinationFilePath:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A07CABBC;
  aBlock[3] = &unk_1E5A10DA0;
  id v19 = v8;
  id v20 = v7;
  id v21 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  v13 = _Block_copy(aBlock);
  id v14 = objc_alloc(MEMORY[0x1E4F6C340]);
  v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
  v17 = (void *)[v14 initWithInputURL:v15 outputURL:v16 identifier:0 operation:2 completionBlock:v13 queue:MEMORY[0x1E4F14428]];

  [v17 start];
}

- (BOOL)_checkArgumentValidity:(id)a3 withFileName:(id)a4 withPredicate:(id)a5 withError:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F6C360] sharedInstance];
  char v13 = [v12 isInternalInstall];

  if ((v13 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Cannot run dumpLogsToFile as device not on internal build", buf, 2u);
      }
    }
    if (a6) {
      goto LABEL_24;
    }
LABEL_57:
    BOOL v23 = 0;
    goto LABEL_58;
  }
  if (v9 && v10)
  {
    char v33 = 0;
    id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v15 = [v14 fileExistsAtPath:v9 isDirectory:&v33];

    if ((v15 & 1) == 0)
    {
      char v33 = 0;
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v32 = 0;
      int v17 = [v16 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v32];
      id v18 = v32;

      if (v17)
      {
        if (v18)
        {
          if (IMOSLoggingEnabled())
          {
            id v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "dumpLogsToFile outFilePath is not a valid file path", buf, 2u);
            }
          }
          if (a6)
          {
            id v20 = v18;
            id v18 = v20;
LABEL_39:
            BOOL v23 = 0;
            *a6 = v20;
LABEL_56:

            goto LABEL_58;
          }
          goto LABEL_55;
        }
        id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v25 = [v24 fileExistsAtPath:v9 isDirectory:&v33];
        if (v33) {
          char v26 = v25;
        }
        else {
          char v26 = 0;
        }

        if ((v26 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              if (v33) {
                long long v30 = @"YES";
              }
              else {
                long long v30 = @"NO";
              }
              *(_DWORD *)buf = 138412290;
              v35 = v30;
              _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "dumpLogsToFile file was not created or filepath is not a directory %@", buf, 0xCu);
            }
          }
          if (a6)
          {
            id v20 = 0;
            goto LABEL_39;
          }
          goto LABEL_55;
        }
      }
    }
    v27 = [v10 lastPathComponent];
    id v18 = v27;
    if (v27 && [v27 length] && !objc_msgSend(v18, "isEqualToString:", @".."))
    {
      if (![v11 containsString:@";"])
      {
        BOOL v23 = 1;
        goto LABEL_56;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_37:
        if (a6)
        {
          id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMLogDumpErrorDomain" code:3 userInfo:0];
          goto LABEL_39;
        }
LABEL_55:
        BOOL v23 = 0;
        goto LABEL_56;
      }
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "dumpLogsToFile predicate is invalid and should not contain \";\"",
          buf,
          2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_37;
      }
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v28, OS_LOG_TYPE_INFO, "dumpLogsToFile failName is invalid", buf, 2u);
      }
    }

    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "dumpLogsToFile outFilePath is nil", buf, 2u);
    }
  }
  if (!a6) {
    goto LABEL_57;
  }
LABEL_24:
  [MEMORY[0x1E4F28C58] errorWithDomain:@"IMLogDumpErrorDomain" code:3 userInfo:0];
  BOOL v23 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

  return v23;
}

- (void)dumpLogsToFolderAtPath:(id)a3 withFileName:(id)a4 lastHours:(int)a5 predicate:(id)a6 includeCKDebug:(BOOL)a7 withCompletion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A07CB458;
  aBlock[3] = &unk_1E5A10DF0;
  id v31 = v16;
  id v17 = v16;
  id v18 = _Block_copy(aBlock);
  id v19 = [(IMLogDump *)self logDumpQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A07CB6F4;
  block[3] = &unk_1E5A10E18;
  block[4] = self;
  id v25 = v13;
  int v29 = a5;
  id v26 = v14;
  id v27 = v15;
  id v28 = v18;
  id v20 = v18;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  dispatch_async(v19, block);
}

- (id)logShowCommandToFilePath:(id)a3 lastHours:(int)a4 predicate:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28E78] stringWithString:@"/usr/bin/log show --source --info"];
  if ((v6 - 1) <= 0xFFFFFFFD)
  {
    id v11 = [(IMLogDump *)self _lastHoursToAppend:v6];
    [v10 appendString:v11];
  }
  if (v9)
  {
    id v12 = [(IMLogDump *)self _predicateToAppend:v9];
    [v10 appendString:v12];
  }
  [v10 appendFormat:@" > %@ 2>&1", v8];

  return v10;
}

- (void)clearSyncStats
{
  id v2 = [NSNumber numberWithDouble:0.0];
  IMSetDomainValueForKey();

  id v3 = [NSNumber numberWithDouble:0.0];
  IMSetDomainValueForKey();

  v4 = [NSNumber numberWithUnsignedInteger:0];
  IMSetDomainValueForKey();

  id v5 = [NSNumber numberWithUnsignedInteger:0];
  IMSetDomainValueForKey();
}

- (void)printIfWeAreInTheMiddleOfASync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = IMGetCachedDomainValueForKey();
  id v3 = IMGetCachedDomainValueForKey();
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = @"YES";
      if (v2) {
        uint64_t v6 = @"YES";
      }
      else {
        uint64_t v6 = @"NO";
      }
      if (!v3) {
        id v5 = @"NO";
      }
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "*** Dumping logs while we are syncing | CoreDuet Sync %@ AHDA Sync %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (double)_calculateMinutesSyncingWithDurationKey:(id)a3 attemptDateKey:(id)a4
{
  id v4 = a4;
  id v5 = IMGetCachedDomainValueForKey();
  [v5 doubleValue];
  double v7 = v6;

  id v8 = IMGetCachedDomainValueForKey();

  if (v8)
  {
    __int16 v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [v8 timeIntervalSinceReferenceDate];
    double v7 = v7 + v11 - v12;
  }
  return v7 / 60.0;
}

- (void)printSyncDurationStats
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(IMLogDump *)self shouldCollectPowerWifiStats])
  {
    id v3 = IMGetCachedDomainValueForKey();
    uint64_t v4 = [v3 unsignedIntegerValue];

    id v5 = IMGetCachedDomainValueForKey();
    uint64_t v6 = [v5 unsignedIntegerValue];

    [(IMLogDump *)self _calculateMinutesSyncingWithDurationKey:@"IMCKTotalDurationOfCoreDuetSync" attemptDateKey:@"CoreduetLastFullSyncAttemptDate"];
    uint64_t v8 = v7;
    [(IMLogDump *)self _calculateMinutesSyncingWithDurationKey:@"IMCKTotalDurationOfAHDASync" attemptDateKey:@"AHDAgentLastSyncAttemptDate"];
    uint64_t v10 = v9;
    if (IMOSLoggingEnabled())
    {
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        double v12 = [NSNumber numberWithUnsignedInteger:v4];
        int v15 = 138412546;
        id v16 = v12;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "<StartCoreDuetAttemptInfo> Number of Attempts %@ | Duration of Sync %.04f Minutes <EndCoreDuetAttemptInfo>", (uint8_t *)&v15, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [NSNumber numberWithUnsignedInteger:v6];
        int v15 = 138412546;
        id v16 = v14;
        __int16 v17 = 2048;
        uint64_t v18 = v10;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "<StartAHDAAttemptInfo> Number of Attempts %@ | Duration of Sync %.04f Minutes <EndAHDAAttemptInfo>", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (id)_dictionaryForDayKey:(id)a3
{
  return (id)IMGetCachedDomainValueForKey();
}

- (BOOL)_isWifiUsable
{
  id v2 = +[IMDeviceConditions sharedInstance];
  char v3 = [v2 isDeviceOnWifi];

  return v3;
}

- (BOOL)_isOnPower
{
  id v2 = +[IMDeviceConditions sharedInstance];
  char v3 = [v2 isDeviceCharging];

  return v3;
}

- (void)_calculateConnectedMinutesForDateKey:(id)a3 durationKey:(id)a4 daysDictionary:(id)a5 totalDurationDictionary:(id)a6 totalDurationKey:(id)a7
{
  id v34 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v12 objectForKeyedSubscript:v34];
  [v16 doubleValue];
  double v18 = v17;

  uint64_t v19 = [v13 objectForKeyedSubscript:v14];

  [v19 doubleValue];
  double v21 = v18 + v20;
  id v22 = [v13 objectForKeyedSubscript:v15];

  if (v22)
  {
    BOOL v23 = [(IMLogDump *)self _isOnPower];
    BOOL v24 = [(IMLogDump *)self _isWifiUsable];
    id v25 = [MEMORY[0x1E4F1C9C8] date];
    [v25 timeIntervalSinceReferenceDate];
    double v27 = v26;
    [v22 timeIntervalSinceReferenceDate];
    double v29 = v27 - v28;
    if ([v34 isEqualToString:@"totalPowerWifi"] && v24 && v23
      || ([v34 isEqualToString:@"totalPower"] & v23) == 1)
    {
      double v21 = v21 + v29;
    }
    else
    {
      int v30 = [v34 isEqualToString:@"totalWifi"];
      double v31 = -0.0;
      if (v24) {
        double v31 = v29;
      }
      double v32 = v21 + v31;
      if (v30) {
        double v21 = v32;
      }
    }
  }
  char v33 = [NSNumber numberWithDouble:v21];
  [v12 setObject:v33 forKeyedSubscript:v34];
}

- (id)_calculatePowerAndWifiConnectedTimeInMinutesForDictionary:(id)a3
{
  id v4 = a3;
  if ([(IMLogDump *)self shouldCollectPowerWifiStats])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = [NSNumber numberWithDouble:0.0];
    [v5 setObject:v6 forKeyedSubscript:@"totalPowerWifi"];

    uint64_t v7 = [NSNumber numberWithDouble:0.0];
    [v5 setObject:v7 forKeyedSubscript:@"totalPower"];

    uint64_t v8 = [NSNumber numberWithDouble:0.0];
    [v5 setObject:v8 forKeyedSubscript:@"totalWifi"];

    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = sub_1A07CC6E4;
    double v26 = &unk_1E5A10E40;
    double v27 = self;
    id v9 = v5;
    id v28 = v9;
    [v4 enumerateKeysAndObjectsUsingBlock:&v23];
    uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"totalPowerWifi", v23, v24, v25, v26, v27);
    [v10 doubleValue];
    double v12 = v11 / 60.0;

    id v13 = [v9 objectForKeyedSubscript:@"totalPower"];
    [v13 doubleValue];
    double v15 = v14 / 60.0;

    id v16 = [v9 objectForKeyedSubscript:@"totalWifi"];
    [v16 doubleValue];
    double v18 = v17 / 60.0;

    uint64_t v19 = [NSNumber numberWithDouble:v12];
    [v9 setObject:v19 forKeyedSubscript:@"totalPowerWifi"];

    double v20 = [NSNumber numberWithDouble:v15];
    [v9 setObject:v20 forKeyedSubscript:@"totalPower"];

    double v21 = [NSNumber numberWithDouble:v18];
    [v9 setObject:v21 forKeyedSubscript:@"totalWifi"];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)printPowerAndWifiStats
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(IMLogDump *)self shouldCollectPowerWifiStats])
  {
    char v3 = IMGetCachedDomainValueForKey();
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        id v22 = v3;
        _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "dictionaryOfDays %@", (uint8_t *)&v21, 0xCu);
      }
    }
    id v5 = [(IMLogDump *)self _calculatePowerAndWifiConnectedTimeInMinutesForDictionary:v3];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"totalPowerWifi"];
    [v6 doubleValue];
    uint64_t v8 = v7;

    id v9 = [v5 objectForKeyedSubscript:@"totalPower"];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [v5 objectForKeyedSubscript:@"totalWifi"];
    [v12 doubleValue];
    double v14 = v13;

    if (IMOSLoggingEnabled())
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        int v21 = 134218242;
        id v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v16;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to POWER & WIFI for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        int v21 = 134218242;
        id v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v18;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to POWER for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
        int v21 = 134218242;
        id v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v20;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "<StartPowerAndWifiConnectedStats> We were connected to WIFI for a total of %.04f minutes over the past %@ days <EndPowerAndWifiConnectedStats>", (uint8_t *)&v21, 0x16u);
      }
    }
  }
}

- (void)incrementCoreDuetSyncAttempts
{
}

- (void)incrementAHDASyncAttempts
{
}

- (void)_incrementSyncAttemptsWithKey:(id)a3 syncDateKey:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMLogDump *)self shouldCollectPowerWifiStats])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = IMGetCachedDomainValueForKey();
    uint64_t v10 = [v9 unsignedIntegerValue];

    uint64_t v11 = v10 + 1;
    if (IMOSLoggingEnabled())
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [NSNumber numberWithUnsignedInteger:v11];
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        double v18 = v13;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Incrementing %@ | numberOfSyncAttempts %@", (uint8_t *)&v15, 0x16u);
      }
    }
    double v14 = [NSNumber numberWithUnsignedInteger:v11];
    IMSetDomainValueForKey();

    IMSetDomainValueForKey();
  }
}

- (void)noteCoreDuetSyncEnded
{
}

- (void)noteAHDASyncEnded
{
}

- (void)_noteSyncEndedForDurationKey:(id)a3 dateKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMLogDump *)self shouldCollectPowerWifiStats])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = IMGetCachedDomainValueForKey();
    [v9 doubleValue];
    double v11 = v10;

    double v12 = IMGetCachedDomainValueForKey();
    if (v12)
    {
      [v8 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [v12 timeIntervalSinceReferenceDate];
      id v16 = [NSNumber numberWithDouble:v11 + v14 - v15];
      IMSetDomainValueForKey();

      IMSetDomainValueForKey();
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "We for some reason did not have a %@, early returning as that would mess up our statistics", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (OS_dispatch_queue)logDumpQueue
{
  return self->_logDumpQueue;
}

- (BOOL)shouldCollectPowerWifiStats
{
  return self->_shouldCollectPowerWifiStats;
}

- (void).cxx_destruct
{
}

@end