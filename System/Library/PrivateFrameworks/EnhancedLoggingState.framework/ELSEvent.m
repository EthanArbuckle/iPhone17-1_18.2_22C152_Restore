@interface ELSEvent
+ (id)sessionData;
+ (void)createLoggingEventWith:(id)a3;
+ (void)createLoggingEventWith:(id)a3 postfix:(id)a4;
@end

@implementation ELSEvent

+ (void)createLoggingEventWith:(id)a3
{
}

+ (void)createLoggingEventWith:(id)a3 postfix:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (createLoggingEventWith_postfix__onceToken != -1) {
    dispatch_once(&createLoggingEventWith_postfix__onceToken, &__block_literal_global_3);
  }
  v8 = +[ELSManager sharedManager];
  v9 = [v8 snapshot];
  v10 = [v9 metadata];

  if (v10)
  {
    v11 = +[ELSEnvironment sharedInstance];
    v12 = [v11 cloudKitContainerIdentifier];

    v13 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v12];
    v14 = [v13 publicCloudDatabase];
    if (v7)
    {
      v15 = [@":" stringByAppendingString:v7];
    }
    else
    {
      v15 = &stru_26D1285D8;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"EnhancedLoggingEvent"];
    v17 = [a1 sessionData];
    [v16 setObject:v17 forKeyedSubscript:@"session"];

    v18 = [v6 stringByAppendingString:v15];
    [v16 setObject:v18 forKeyedSubscript:@"event"];

    v19 = [MEMORY[0x263EFF910] date];
    [v16 setObject:v19 forKeyedSubscript:@"capturedAt"];

    id v20 = objc_alloc(MEMORY[0x263EFD748]);
    v23[0] = v16;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    v22 = (void *)[v20 initWithRecordsToSave:v21 recordIDsToDelete:0];

    [v22 setPerRecordSaveBlock:&__block_literal_global_16];
    [v14 addOperation:v22];
  }
  else
  {
    v12 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ELSEvent createLoggingEventWith:postfix:](v12);
    }
  }
}

uint64_t __43__ELSEvent_createLoggingEventWith_postfix___block_invoke()
{
  return +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement];
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  id v7 = ELSLogHandleForCategory(11);
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_13_cold_2((uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_13_cold_1((uint64_t)v5, v8);
  }
}

+ (id)sessionData
{
  v2 = +[ELSManager sharedManager];
  v3 = [v2 snapshot];
  v4 = [v3 metadata];

  id v5 = @"sessionKey";
  id v6 = [v4 objectForKeyedSubscript:@"sessionKey"];

  if (!v6)
  {
    id v5 = @"enrollmentTicketNumber";
    id v7 = [v4 objectForKeyedSubscript:@"enrollmentTicketNumber"];

    if (!v7)
    {
      id v5 = @"gigafilesToken";
      v8 = [v4 objectForKeyedSubscript:@"gigafilesToken"];

      if (!v8) {
        id v5 = @"not-found";
      }
    }
  }
  v9 = v5;
  v10 = (void *)[[NSString alloc] initWithFormat:@"%@:", v9];
  v11 = [v4 objectForKeyedSubscript:v9];

  if (v11)
  {
    uint64_t v12 = [v4 objectForKeyedSubscript:v9];
    v13 = [v10 stringByAppendingString:v12];

    v10 = (void *)v12;
  }
  else
  {
    v13 = [v10 stringByAppendingString:@"not-found"];
  }

  return v13;
}

+ (void)createLoggingEventWith:(os_log_t)log postfix:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F731000, log, OS_LOG_TYPE_ERROR, "Error: Unable to create logging event when ELS snapshot metadata is nil", v1, 2u);
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F731000, a2, OS_LOG_TYPE_DEBUG, "Saved enhancedLoggingEventRecord: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __43__ELSEvent_createLoggingEventWith_postfix___block_invoke_13_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F731000, a2, OS_LOG_TYPE_ERROR, "Error saving enhancedLoggingEventRecord: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end