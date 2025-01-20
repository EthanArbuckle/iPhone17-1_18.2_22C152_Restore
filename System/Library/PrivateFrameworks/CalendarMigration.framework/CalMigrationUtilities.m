@interface CalMigrationUtilities
+ (id)destinationCalendarDirectory;
+ (id)homeRelativePathForURL:(id)a3 inCalendarDirectory:(id)a4;
+ (id)sourceCalendarDirectoryForHomeDirectory:(id)a3;
+ (id)subdirectoriesInDirectory:(id)a3 withPrivacySafePathProvider:(id)a4 error:(id *)a5;
+ (id)validatedSourceCalendarDirectoryForHomeDirectory:(id)a3;
+ (void)clearPreviousMigrationResultsWithDatabaseFileURL:(id)a3;
+ (void)enumerateSelfAndDetachedEventsWithEvent:(void *)a3 usingBlock:(id)a4;
@end

@implementation CalMigrationUtilities

+ (id)validatedSourceCalendarDirectoryForHomeDirectory:(id)a3
{
  v3 = [a1 sourceCalendarDirectoryForHomeDirectory:a3];
  char v14 = 0;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5 isDirectory:&v14];

  if (v6)
  {
    if (v14)
    {
      id v7 = v3;
      goto LABEL_10;
    }
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v9 = "Calendar directory is a file instead of a folder.";
      v10 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
  else
  {
    v8 = +[CalMigrationLog defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      v9 = "User home directory has no calendar directory.";
      v10 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_22133F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }

  id v7 = 0;
LABEL_10:

  return v7;
}

+ (id)homeRelativePathForURL:(id)a3 inCalendarDirectory:(id)a4
{
  id v5 = a3;
  if (!v5)
  {
    char v14 = 0;
    goto LABEL_18;
  }
  char v6 = [a4 path];
  id v7 = [v6 stringByStandardizingPath];

  v8 = [v5 path];
  v9 = [v8 stringByStandardizingPath];

  v10 = [v7 pathComponents];
  v11 = [v9 pathComponents];
  unint64_t v12 = [v11 count];
  if (v12 < [v10 count])
  {
    __int16 v13 = +[CalMigrationLog defaultCategory];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
LABEL_15:

      v20 = v9;
      goto LABEL_16;
    }
LABEL_14:
    +[CalMigrationUtilities homeRelativePathForURL:inCalendarDirectory:]();
    goto LABEL_15;
  }
  if ([v10 count])
  {
    uint64_t v15 = 0;
    while (1)
    {
      v16 = [v11 objectAtIndexedSubscript:v15];
      v17 = [v10 objectAtIndexedSubscript:v15];
      char v18 = [v16 isEqualToString:v17];

      if ((v18 & 1) == 0) {
        break;
      }
      if (++v15 == [v10 count]) {
        goto LABEL_10;
      }
    }
    __int16 v13 = +[CalMigrationLog defaultCategory];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v19 = [v11 count];
  if (v19 == [v10 count])
  {
    v20 = @"Library/Calendar";
LABEL_16:
    char v14 = v20;
    goto LABEL_17;
  }
  v21 = objc_msgSend(v11, "subarrayWithRange:", objc_msgSend(v10, "count"), objc_msgSend(v11, "count") - objc_msgSend(v10, "count"));
  v22 = [@"Library/Calendar" pathComponents];
  v23 = [v22 arrayByAddingObjectsFromArray:v21];
  char v14 = [NSString pathWithComponents:v23];

LABEL_17:
LABEL_18:

  return v14;
}

+ (id)subdirectoriesInDirectory:(id)a3 withPrivacySafePathProvider:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v27 = a4;
  v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = [v8 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:a5];

  if (v9)
  {
    id v26 = v7;
    v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v25 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (!v12) {
      goto LABEL_15;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "path", v25);
        char v18 = [v17 stringByStandardizingPath];

        char v28 = 0;
        uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
        char v20 = [v19 fileExistsAtPath:v18 isDirectory:&v28];

        if (v20)
        {
          if (!v28) {
            goto LABEL_13;
          }
          v21 = [NSURL fileURLWithPath:v18];
          [v10 addObject:v21];
        }
        else
        {
          v21 = +[CalMigrationLog defaultCategory];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            v22 = [v27 privacySafePathForURLInCalendarDirectory:v16];
            *(_DWORD *)buf = 138543362;
            v34 = v22;
            _os_log_fault_impl(&dword_22133F000, v21, OS_LOG_TYPE_FAULT, "File %{public}@ doesn't exist right after we found it by listing its parent directory.", buf, 0xCu);
          }
        }

LABEL_13:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (!v13)
      {
LABEL_15:

        v23 = (void *)[v10 copy];
        v9 = v25;
        id v7 = v26;
        goto LABEL_17;
      }
    }
  }
  v23 = 0;
LABEL_17:

  return v23;
}

+ (id)sourceCalendarDirectoryForHomeDirectory:(id)a3
{
  return (id)[a3 URLByAppendingPathComponent:@"Library/Calendar"];
}

+ (id)destinationCalendarDirectory
{
  v2 = (void *)CalDatabaseCopyDirectoryPath();
  v3 = [NSURL fileURLWithPath:v2];

  return v3;
}

+ (void)enumerateSelfAndDetachedEventsWithEvent:(void *)a3 usingBlock:(id)a4
{
  id v5 = (void (**)(id, void *, void *, unsigned char *))a4;
  char v10 = 0;
  v5[2](v5, a3, a3, &v10);
  char v6 = (void *)CalEventCopyDetachedEvents();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__CalMigrationUtilities_enumerateSelfAndDetachedEventsWithEvent_usingBlock___block_invoke;
  v8[3] = &unk_2645A4498;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateCalEventRefsUsingBlock:v8];
}

uint64_t __76__CalMigrationUtilities_enumerateSelfAndDetachedEventsWithEvent_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)clearPreviousMigrationResultsWithDatabaseFileURL:(id)a3
{
  id v6 = [a3 path];
  v3 = [v6 stringByAppendingString:@"-shm"];
  v4 = [v6 stringByAppendingString:@"-wal"];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  [v5 removeItemAtPath:v6 error:0];
  [v5 removeItemAtPath:v3 error:0];
  [v5 removeItemAtPath:v4 error:0];
}

+ (void)homeRelativePathForURL:inCalendarDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22133F000, v0, v1, "Invalid URL (not in the calendar directory) given to _homeRelativePathForURL:inCalendarDirectory: url = %@, calendarDirectory = %@");
}

@end