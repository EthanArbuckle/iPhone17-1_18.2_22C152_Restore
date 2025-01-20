@interface CalMigrationToolArgumentParser
+ (id)_argumentParseErrorWithCode:(unint64_t)a3 argument:(id)a4;
+ (id)commandLineArgumentsForToolOptions:(id)a3;
+ (id)parseOptionsFromCommandLineArguments:(id)a3 printUsage:(BOOL *)a4 error:(id *)a5;
+ (id)usageStringWithToolPath:(id)a3 parseError:(id)a4;
+ (unint64_t)_argumentFromCommandLineArgument:(id)a3;
+ (void)_appendToArguments:(id)a3 ifNeededForTriStateOption:(int64_t)a4 forceEnableArgument:(id)a5 forceDisableArgument:(id)a6;
@end

@implementation CalMigrationToolArgumentParser

+ (id)parseOptionsFromCommandLineArguments:(id)a3 printUsage:(BOOL *)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (![v8 count])
  {
    if (a4) {
      *a4 = 1;
    }
    v22 = 0;
    if (a5) {
      *a5 = 0;
    }
    goto LABEL_76;
  }
  id v55 = 0;
  id v56 = 0;
  id v53 = 0;
  id v54 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v10)
  {

    v17 = 0;
    uint64_t v27 = -1;
    uint64_t v15 = -1;
    uint64_t v28 = -1;
    uint64_t v29 = -1;
    uint64_t v30 = -1;
    uint64_t v31 = -1;
    goto LABEL_42;
  }
  uint64_t v11 = v10;
  v42 = a4;
  v43 = a5;
  v12 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v50;
  uint64_t v47 = -1;
  uint64_t v48 = -1;
  uint64_t v45 = -1;
  uint64_t v46 = -1;
  uint64_t v15 = -1;
  uint64_t v44 = -1;
LABEL_4:
  uint64_t v16 = 0;
  while (2)
  {
    v17 = v13;
    if (*(void *)v50 != v14) {
      objc_enumerationMutation(v9);
    }
    v18 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
    uint64_t v19 = [a1 _argumentFromCommandLineArgument:v18];
    if (v12 && v19 != 1)
    {
      v23 = v43;
      if (v43)
      {
        id v24 = a1;
        uint64_t v25 = 2;
        v26 = v17;
LABEL_40:
        [v24 _argumentParseErrorWithCode:v25 argument:v26];
        v22 = 0;
        id *v23 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_74;
      }
LABEL_73:
      v22 = 0;
LABEL_74:

      goto LABEL_75;
    }
    switch(v19)
    {
      case -1:
        goto LABEL_54;
      case 0:
        if (v42) {
          BOOL *v42 = 1;
        }
        if (!v43) {
          goto LABEL_73;
        }
        v22 = 0;
        id *v43 = 0;
        goto LABEL_74;
      case 1:
        if (!v12)
        {
LABEL_54:
          v37 = v43;
          if (!v43) {
            goto LABEL_73;
          }
          id v38 = a1;
          uint64_t v39 = 0;
LABEL_67:
          [v38 _argumentParseErrorWithCode:v39 argument:v18];
          v22 = 0;
          id *v37 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_74;
        }
        uint64_t v20 = [NSURL fileURLWithPath:v18];
        v21 = *v12;
        *v12 = (void *)v20;

        if (!*v12)
        {
          v37 = v43;
          if (!v43) {
            goto LABEL_73;
          }
          id v38 = a1;
          uint64_t v39 = 3;
          goto LABEL_67;
        }
        v12 = 0;
LABEL_29:
        id v13 = v18;

        if (v11 != ++v16) {
          continue;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v11) {
          goto LABEL_4;
        }

        if (!v12)
        {
          v17 = v13;
          a5 = v43;
          uint64_t v27 = v44;
          uint64_t v30 = v47;
          uint64_t v31 = v48;
          uint64_t v28 = v45;
          uint64_t v29 = v46;
LABEL_42:
          if (v56)
          {
            if (!v55)
            {
              v32 = [v56 URLByAppendingPathComponent:@"Library/Group Containers/group.com.apple.calendar" isDirectory:1];
              id v33 = v55;
              id v55 = v32;
            }
            if (!v53 || v54)
            {
              id v36 = objc_alloc(MEMORY[0x263F2FE28]);
              v22 = (void *)[v36 initWithHomeDirectory:v56 destinationDirectory:v55 performCalendarMigration:v31 performReminderMigration:v30 performCleanup:v29 deleteMigratedData:v28 backupBeforeCalendarMigration:v15 backupBeforeReminderMigration:v27 saveAccountsChangesToFile:v54 accountsDatabaseFile:v53];
              goto LABEL_75;
            }
            if (a5)
            {
              id v34 = a1;
              uint64_t v35 = 6;
LABEL_51:
              [v34 _argumentParseErrorWithCode:v35 argument:0];
              v22 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_75;
            }
          }
          else if (a5)
          {
            id v34 = a1;
            uint64_t v35 = 1;
            goto LABEL_51;
          }
          v22 = 0;
          goto LABEL_75;
        }
        if (v43)
        {
          [a1 _argumentParseErrorWithCode:2 argument:v13];
          v22 = 0;
          id *v43 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v17 = v13;
LABEL_75:

LABEL_76:
        return v22;
      case 2:
        v12 = &v56;
        goto LABEL_29;
      case 3:
        v12 = &v55;
        goto LABEL_29;
      case 4:
        if ([v9 count] == 1)
        {
          uint64_t v40 = [objc_alloc(MEMORY[0x263F2FE28]) initUsingCalendarDaemon];
          goto LABEL_64;
        }
        v23 = v43;
        if (!v43) {
          goto LABEL_73;
        }
        id v24 = a1;
        uint64_t v25 = 4;
        goto LABEL_72;
      case 5:
        if ([v9 count] == 1)
        {
          uint64_t v40 = [objc_alloc(MEMORY[0x263F2FE28]) initUsingCalendarDaemonWaitingForRemindersOnly];
LABEL_64:
          v22 = (void *)v40;
          goto LABEL_74;
        }
        v23 = v43;
        if (!v43) {
          goto LABEL_73;
        }
        id v24 = a1;
        uint64_t v25 = 5;
LABEL_72:
        v26 = 0;
        goto LABEL_40;
      case 6:
        uint64_t v48 = 1;
        goto LABEL_29;
      case 7:
        uint64_t v48 = 0;
        goto LABEL_29;
      case 8:
        uint64_t v47 = 1;
        goto LABEL_29;
      case 9:
        uint64_t v47 = 0;
        goto LABEL_29;
      case 10:
        uint64_t v46 = 1;
        goto LABEL_29;
      case 11:
        uint64_t v46 = 0;
        goto LABEL_29;
      case 12:
        uint64_t v45 = 1;
        goto LABEL_29;
      case 13:
        uint64_t v45 = 0;
        goto LABEL_29;
      case 14:
        uint64_t v15 = 1;
        goto LABEL_29;
      case 15:
        uint64_t v15 = 0;
        goto LABEL_29;
      case 16:
        uint64_t v44 = 1;
        goto LABEL_29;
      case 17:
        uint64_t v44 = 0;
        goto LABEL_29;
      case 18:
        v12 = &v54;
        goto LABEL_29;
      case 19:
        v12 = &v53;
        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
}

+ (unint64_t)_argumentFromCommandLineArgument:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"--"])
  {
    if ([v3 isEqualToString:@"--help"])
    {
      unint64_t v4 = 0;
    }
    else if ([v3 isEqualToString:@"--homeDirectory"])
    {
      unint64_t v4 = 2;
    }
    else if ([v3 isEqualToString:@"--destinationDirectory"])
    {
      unint64_t v4 = 3;
    }
    else if ([v3 isEqualToString:@"--migrateUsingCalendarDaemon"])
    {
      unint64_t v4 = 4;
    }
    else if ([v3 isEqualToString:@"--migrateUsingCalendarDaemonWaitingForRemindersOnly"])
    {
      unint64_t v4 = 5;
    }
    else if ([v3 isEqualToString:@"--performCalendarMigration"])
    {
      unint64_t v4 = 6;
    }
    else if ([v3 isEqualToString:@"--skipCalendarMigration"])
    {
      unint64_t v4 = 7;
    }
    else if ([v3 isEqualToString:@"--performReminderMigration"])
    {
      unint64_t v4 = 8;
    }
    else if ([v3 isEqualToString:@"--skipReminderMigration"])
    {
      unint64_t v4 = 9;
    }
    else if ([v3 isEqualToString:@"--performCleanup"])
    {
      unint64_t v4 = 10;
    }
    else if ([v3 isEqualToString:@"--skipCleanup"])
    {
      unint64_t v4 = 11;
    }
    else if ([v3 isEqualToString:@"--deleteMigratedData"])
    {
      unint64_t v4 = 12;
    }
    else if ([v3 isEqualToString:@"--skipDeleteMigratedData"])
    {
      unint64_t v4 = 13;
    }
    else if ([v3 isEqualToString:@"--backupBeforeCalendarMigration"])
    {
      unint64_t v4 = 14;
    }
    else if ([v3 isEqualToString:@"--skipBackupBeforeCalendarMigration"])
    {
      unint64_t v4 = 15;
    }
    else if ([v3 isEqualToString:@"--backupBeforeReminderMigration"])
    {
      unint64_t v4 = 16;
    }
    else if ([v3 isEqualToString:@"--skipBackupBeforeReminderMigration"])
    {
      unint64_t v4 = 17;
    }
    else if ([v3 isEqualToString:@"--saveAccountChangesToFile"])
    {
      unint64_t v4 = 18;
    }
    else if ([v3 isEqualToString:@"--accountsDatabaseFile"])
    {
      unint64_t v4 = 19;
    }
    else
    {
      unint64_t v4 = -1;
    }
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (id)_argumentParseErrorWithCode:(unint64_t)a3 argument:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  [v6 setObject:@"kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument" forKeyedSubscript:@"kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument"];
  switch(a3)
  {
    case 0uLL:
      [NSString stringWithFormat:@"Unrecognized option: %@", v5];
      goto LABEL_7;
    case 1uLL:
      v7 = @"Missing required option: --homeDirectory";
      break;
    case 2uLL:
      [NSString stringWithFormat:@"Missing required argument for option %@", v5];
      goto LABEL_7;
    case 3uLL:
      [NSString stringWithFormat:@"Invalid path: %@", v5];
LABEL_7:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      v7 = @"--migrateUsingCalendarDaemon cannot be used in combination with any other options";
      break;
    case 5uLL:
      v7 = @"--migrateUsingCalendarDaemonWaitingForRemindersOnly cannot be used in combination with any other options";
      break;
    case 6uLL:
      v7 = @"--accountsDatabaseFile requires --saveAccountChangesToFile";
      break;
    default:
      v7 = 0;
      break;
  }
  [v6 setObject:v7 forKeyedSubscript:@"kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Message"];
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"kCalMigrationToolOptionsArgumentParseErrorDomain" code:a3 userInfo:v6];

  return v8;
}

+ (id)usageStringWithToolPath:(id)a3 parseError:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (v5) {
    v7 = v5;
  }
  else {
    v7 = @"CalendarMigrationTool";
  }
  id v8 = [NSString stringWithFormat:@"Usage:\n  %@ --migrateUsingCalendarDaemon\n    Asks the calendar daemon to perform migration and blocks until migration is finished\n  %@ --migrateUsingCalendarDaemonWaitingForRemindersOnly\n    Asks the calendar daemon to perform migration and blocks only until reminder migration is finished\n\n  %@ --homeDirectory <path to user home directory> [options]\n    Performs migration with the given options in this tool's process\n\nOptions:\n--help                                               Print this usage message\n--migrateUsingCalendarDaemon                         Asks the calendar daemon to perform migration and blocks until migration is finished\n--migrateUsingCalendarDaemonWaitingForRemindersOnly  Asks the calendar daemon to perform migration and blocks only until reminder migration is finished\n--homeDirectory                                      The home directory of the user to migrate\n--destinationDirectory                               The directory to migrate into\n--performCalendarMigration                           Force migration of calendar data\n--skipCalendarMigration                              Skip migration of calendar data\n--performReminderMigration                           Force migration of reminder data\n--skipReminderMigration                              Skip migration of reminder data\n--performCleanup                                     Force cleanup\n--skipCleanup                                        Skip cleanup\n--deleteMigratedData                                 Force deletion of migrated data\n--skipDeleteMigratedData                             Skip deletion of migrated data\n--backupBeforeCalendarMigration                      Perform a backup of the Calendars directory before calendar migration\n--skipBackupBeforeCalendarMigration                  Skip backup of the Calendars directory before calendar migration\n--backupBeforeReminderMigration                      Perform a backup of the Calendars directory before reminder migration\n--skipBackupBeforeReminderMigration                  Skip backup of the Calendars directory before reminder migration\n--saveAccountChangesToFile                           Save any account changes to the given file instead of modifying the actual account store\n--accountsDatabaseFile                               Use the specified Accounts database instead of the current user's (requires --saveAccountChangesToFile).\n", v7, v7, v7];
  if (v6)
  {
    id v9 = [v6 domain];
    int v10 = [v9 isEqualToString:@"kCalMigrationToolOptionsArgumentParseErrorDomain"];

    if (v10)
    {
      uint64_t v11 = [v6 userInfo];
      v12 = [v11 objectForKeyedSubscript:@"kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Message"];

      if (v12) {
        goto LABEL_16;
      }
      id v13 = [v6 userInfo];
      uint64_t v14 = [v13 objectForKeyedSubscript:@"kCalMigrationToolOptionsArgumentParseErrorUserInfoKey_Argument"];

      if (v14)
      {
        uint64_t v15 = [NSString stringWithFormat:@"Error parsing command line arguments here: %@", v14];
      }
      else
      {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = [v6 localizedDescription];
    }
    if (v15) {
      v12 = (__CFString *)v15;
    }
    else {
      v12 = @"Unknown error parsing arguments";
    }
  }
  else
  {
    v12 = @"Performs migration of legacy calendar files";
  }
LABEL_16:
  uint64_t v16 = [NSString stringWithFormat:@"%@\n\n%@", v12, v8];

  return v16;
}

+ (id)commandLineArgumentsForToolOptions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  if ([v4 migrateUsingCalendarDaemon])
  {
    if ([v4 waitForRemindersOnly]) {
      id v6 = @"--migrateUsingCalendarDaemonWaitingForRemindersOnly";
    }
    else {
      id v6 = @"--migrateUsingCalendarDaemon";
    }
    [v5 addObject:v6];
  }
  else
  {
    [v5 addObject:@"--homeDirectory"];
    v7 = [v4 homeDirectory];
    id v8 = [v7 path];
    [v5 addObject:v8];

    id v9 = [v4 destinationDirectory];

    if (v9)
    {
      [v5 addObject:@"--destinationDirectory"];
      int v10 = [v4 destinationDirectory];
      uint64_t v11 = [v10 path];
      [v5 addObject:v11];
    }
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performCalendarMigration"), @"--performCalendarMigration", @"--skipCalendarMigration");
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performReminderMigration"), @"--performReminderMigration", @"--skipReminderMigration");
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "performCleanup"), @"--performCleanup", @"--skipCleanup");
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "deleteMigratedData"), @"--deleteMigratedData", @"--skipDeleteMigratedData");
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "backupBeforeCalendarMigration"), @"--backupBeforeCalendarMigration", @"--skipBackupBeforeCalendarMigration");
    objc_msgSend(a1, "_appendToArguments:ifNeededForTriStateOption:forceEnableArgument:forceDisableArgument:", v5, objc_msgSend(v4, "backupBeforeReminderMigration"), @"--backupBeforeReminderMigration", @"--skipBackupBeforeReminderMigration");
    v12 = [v4 accountsChangesFile];

    if (v12)
    {
      [v5 addObject:@"--saveAccountChangesToFile"];
      id v13 = [v4 accountsChangesFile];
      uint64_t v14 = [v13 path];
      [v5 addObject:v14];
    }
    uint64_t v15 = [v4 accountsDatabaseFile];

    if (v15)
    {
      [v5 addObject:@"--accountsDatabaseFile"];
      uint64_t v16 = [v4 accountsDatabaseFile];
      v17 = [v16 path];
      [v5 addObject:v17];
    }
  }
  v18 = (void *)[v5 copy];

  return v18;
}

+ (void)_appendToArguments:(id)a3 ifNeededForTriStateOption:(int64_t)a4 forceEnableArgument:(id)a5 forceDisableArgument:(id)a6
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = v10;
  id v12 = v9;
  if (a4 != 1)
  {
    if (a4) {
      goto LABEL_5;
    }
    id v12 = v10;
  }
  [v13 addObject:v12];
LABEL_5:
}

@end