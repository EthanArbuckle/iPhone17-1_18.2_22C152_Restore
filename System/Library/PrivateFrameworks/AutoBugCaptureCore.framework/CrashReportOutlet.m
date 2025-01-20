@interface CrashReportOutlet
- (BOOL)publishReportForCase:(id)a3 options:(id)a4;
- (id)descriptiveFilenameWithPrefix:(id)a3 domain:(id)a4 process:(id)a5;
@end

@implementation CrashReportOutlet

- (id)descriptiveFilenameWithPrefix:(id)a3 domain:(id)a4 process:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 stringByReplacingOccurrencesOfString:@" " withString:@"+"];
  v10 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@"+"];

  v11 = v7;
  if ([v9 length])
  {
    v11 = v7;
    if ([v10 length])
    {
      v11 = [NSString stringWithFormat:@"%@-%@-%@", v7, v9, v10];
    }
  }

  return v11;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 dampeningType] == -1)
  {
    id v8 = diagcaseLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "Skip publishing report to CrashReporter since this is a transient case.";
LABEL_18:
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
    }
  }
  else
  {
    char v6 = [v5 writeIPSFile];
    id v7 = diagcaseLogHandle();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = [v5 caseId];
        v10 = [v9 UUIDString];
        *(_DWORD *)buf = 138412290;
        id v40 = v10;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, "Publishing report of case %@ to CrashReporter", buf, 0xCu);
      }
      id v8 = [MEMORY[0x263EFF9A0] dictionary];
      v11 = [v5 signature];
      [v8 setObject:v11 forKeyedSubscript:@"signature"];

      v12 = [v5 events];
      [v8 setObject:v12 forKeyedSubscript:@"events"];

      v13 = [v5 attachments];
      [v8 setObject:v13 forKeyedSubscript:@"attachments"];

      v14 = NSDictionary;
      v15 = [v5 caseDampeningTypeString];
      v16 = [v5 caseClosureTypeString];
      v17 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"dampening_type", v16, @"closure_type", 0);
      [v8 setObject:v17 forKeyedSubscript:@"case_status"];

      v18 = [MEMORY[0x263EFF9A0] dictionary];
      v19 = [v5 caseId];
      v20 = [v19 UUIDString];

      if (v20)
      {
        v21 = [v5 caseId];
        v22 = [v21 UUIDString];
        [v18 setObject:v22 forKey:@"caseID"];
      }
      [v5 caseOpenedTime];
      if (v23 != 0.0)
      {
        v24 = NSNumber;
        [v5 caseOpenedTime];
        v25 = objc_msgSend(v24, "numberWithDouble:");
        [v18 setObject:v25 forKey:@"triggerTime"];
      }
      [v8 setObject:v18 forKeyedSubscript:@"case_header"];
      v26 = sanitizedJSONCollectionObject(v8, 1);
      if (![MEMORY[0x263F08900] isValidJSONObject:v26])
      {
        v28 = diagcaseLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v5;
          __int16 v41 = 2112;
          v42 = v26;
          _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_ERROR, "CrashReport content dictionary for case %@ is not JSON compatible. (content=%@)", buf, 0x16u);
        }
        char v30 = 0;
        goto LABEL_27;
      }
      id v38 = 0;
      v27 = [MEMORY[0x263F08900] dataWithJSONObject:v26 options:0 error:&v38];
      v28 = v38;
      if (v28)
      {
        v29 = diagcaseLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v40 = v5;
          __int16 v41 = 2112;
          v42 = v28;
          __int16 v43 = 2112;
          v44 = v26;
          _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_ERROR, "Failed JSON serialization of CrashReport content dictionary for case %@: %@ (content=%@)", buf, 0x20u);
        }
        char v30 = 0;
      }
      else
      {
        if (!v27)
        {
          char v30 = 0;
          goto LABEL_26;
        }
        v36 = [v5 signature];
        v32 = [v36 objectForKeyedSubscript:@"domain"];
        v33 = [v5 signature];
        v34 = [v33 objectForKeyedSubscript:@"detected"];
        v29 = [(CrashReportOutlet *)self descriptiveFilenameWithPrefix:@"AutoBugCapture" domain:v32 process:v34];

        id v37 = v27;
        char v30 = OSAWriteLogForSubmission();
      }
LABEL_26:

LABEL_27:
      goto LABEL_28;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v31 = "Skip publishing report to CrashReporter since we surpassed the daily file count limit.";
      goto LABEL_18;
    }
  }
  char v30 = 0;
LABEL_28:

  return v30;
}

uint64_t __50__CrashReportOutlet_publishReportForCase_options___block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

@end