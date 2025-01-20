@interface BuddyBackupUtilities
+ (BOOL)canRestoreBackupMadeOnVersion:(id)a3 toSystemVersion:(id)a4;
+ (id)_suggestedBackupForUDID:(id)a3 deviceClass:(id)a4 backups:(id)a5;
+ (id)backupForUUID:(id)a3 backups:(id)a4;
+ (id)backupForUUID:(id)a3 withManager:(id)a4 error:(id *)a5;
+ (id)getBackupListWithFiltering:(BOOL)a3 manager:(id)a4 retries:(unint64_t)a5 error:(id *)a6;
+ (id)latestCommittedSnapshotFromBackup:(id)a3 requireCompatible:(BOOL)a4;
+ (id)suggestedBackupForCurrentDeviceWithBackups:(id)a3;
+ (id)suggestedBackupForProximity:(id)a3 deviceClass:(id)a4 withManager:(id)a5 error:(id *)a6;
@end

@implementation BuddyBackupUtilities

+ (id)backupForUUID:(id)a3 withManager:(id)a4 error:(id *)a5
{
  id v13 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  v10[1] = a5;
  id v7 = [v13 getBackupListWithFiltering:0 manager:v11 retries:3 error:a5];
  id v8 = [v13 backupForUUID:location[0] backups:v7, v7];
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);

  return v8;
}

+ (id)backupForUUID:(id)a3 backups:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  memset(__b, 0, sizeof(__b));
  id v5 = v16;
  id v6 = [v5 countByEnumeratingWithState:__b objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v5);
        }
        id v15 = *(id *)(__b[1] + 8 * i);
        id v9 = [v15 backupUUID];
        unsigned __int8 v10 = [v9 isEqualToString:location[0]];

        if (v10)
        {
          id v18 = v15;
          int v13 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:__b objects:v19 count:16];
    }
    while (v6);
  }
  int v13 = 0;
LABEL_11:

  if (!v13) {
    id v18 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v11 = v18;

  return v11;
}

+ (id)latestCommittedSnapshotFromBackup:(id)a3 requireCompatible:(BOOL)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  id v5 = [location[0] snapshots];
  id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:0];
  v22 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v22 count:1];
  id v17 = [v5 sortedArrayUsingDescriptors:v7];

  memset(__b, 0, sizeof(__b));
  id v8 = v17;
  id v9 = [v8 countByEnumeratingWithState:__b objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v9; ++i)
      {
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v8);
        }
        id v16 = *(id *)(__b[1] + 8 * i);
        if ([v16 state] == 3
          && (!v18 || ([v16 isCompatible] & 1) != 0))
        {
          id v20 = v16;
          int v14 = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:__b objects:v21 count:16];
    }
    while (v9);
  }
  int v14 = 0;
LABEL_13:

  if (!v14) {
    id v20 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  id v12 = v20;

  return v12;
}

+ (id)getBackupListWithFiltering:(BOOL)a3 manager:(id)a4 retries:(unint64_t)a5 error:(id *)a6
{
  id v42 = a1;
  SEL v41 = a2;
  BOOL v40 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v38 = a5;
  v37 = a6;
  unint64_t v36 = 0;
  id v35 = 0;
  id v34 = 0;
  do
  {
    objc_storeStrong(&v34, 0);
    id obj = v34;
    id v8 = [location getBackupListWithFiltering:v40 error:&obj];
    objc_storeStrong(&v34, obj);
    id v9 = v35;
    id v35 = v8;

    if (v34)
    {
      if (++v36 > v38)
      {
        os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = v26;
          char v24 = 0;
          char v22 = 0;
          if (_BYIsInternalInstall())
          {
            id v17 = (NSString *)v34;
          }
          else if (v34)
          {
            id v25 = [v34 domain];
            char v24 = 1;
            id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v25, [v34 code]);
            v23 = v17;
            char v22 = 1;
          }
          else
          {
            id v17 = 0;
          }
          sub_10004BB7C((uint64_t)v43, (uint64_t)v17);
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to get backup list, giving up: %{public}@", v43, 0xCu);
          if (v22) {

          }
          if (v24) {
        }
          }
        objc_storeStrong((id *)&v26, 0);
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = oslog;
          os_log_type_t v11 = v31;
          int v12 = v36;
          int v13 = v38;
          char v14 = _BYIsInternalInstall();
          char v29 = 0;
          char v27 = 0;
          if (v14)
          {
            id v15 = (NSString *)v34;
          }
          else if (v34)
          {
            id v30 = [v34 domain];
            char v29 = 1;
            id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v30, [v34 code]);
            id v28 = v15;
            char v27 = 1;
          }
          else
          {
            id v15 = 0;
          }
          sub_100131864((uint64_t)buf, v12, v13, (uint64_t)v15);
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Retrying backup list fetch (%u/%u) due to getting backup list: %{public}@", buf, 0x18u);
          if (v27) {

          }
          if (v29) {
        }
          }
        objc_storeStrong((id *)&oslog, 0);
        sleep(4u);
      }
    }
    BOOL v18 = 0;
    if (v34) {
      BOOL v18 = v36 <= v38;
    }
  }
  while (v18);
  if (v34 && v37)
  {
    id v19 = v34;
    id *v37 = v19;
  }
  id v20 = v35;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&location, 0);
  return v20;
}

+ (id)suggestedBackupForProximity:(id)a3 deviceClass:(id)a4 withManager:(id)a5 error:(id *)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  if (location[0])
  {
    id v19 = 0;
    id v9 = [location[0] backupUUID];
    id obj = 0;
    id v10 = +[BuddyBackupUtilities backupForUUID:v9 withManager:v22 error:&obj];
    objc_storeStrong(&v19, obj);
    id v18 = v10;

    if (v19)
    {
      if (v21)
      {
        id v11 = v19;
        id *v21 = v11;
      }
      id v25 = 0;
      int v20 = 1;
    }
    else
    {
      id v12 = [v18 deviceClass];
      char v13 = [v12 isEqualToString:v23] ^ 1;

      if (v13)
      {
        id v25 = 0;
        int v20 = 1;
      }
      else
      {
        id v16 = +[BuddyBackupUtilities latestCommittedSnapshotFromBackup:v18 requireCompatible:0];
        if (v16) {
          id v25 = +[RestorableBackupItem restorableBackupItemWithBackup:v18 snapshot:v16];
        }
        else {
          id v25 = 0;
        }
        int v20 = 1;
        objc_storeStrong(&v16, 0);
      }
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v25 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  char v14 = v25;

  return v14;
}

+ (id)suggestedBackupForCurrentDeviceWithBackups:(id)a3
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)MGCopyAnswer();
  id v7 = v10;
  uint64_t v3 = MGCopyAnswer();
  id v4 = [v9 _suggestedBackupForUDID:v7 deviceClass:v3 backups:location[0], v3];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v4;
}

+ (BOOL)canRestoreBackupMadeOnVersion:(id)a3 toSystemVersion:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = [location[0] componentsSeparatedByString:@"."];
  id v13 = [v15 componentsSeparatedByString:@"."];
  if ([v14 count] && objc_msgSend(v13, "count"))
  {
    for (int i = 0; ; ++i)
    {
      id v5 = [v14 count];
      id v6 = v5 <= [v13 count] ? [v13 count] : [v14 count];
      if (i >= (unint64_t)v6) {
        break;
      }
      signed int v11 = 0;
      signed int v10 = 0;
      if (i < (unint64_t)[v14 count])
      {
        id v7 = [v14 objectAtIndexedSubscript:i];
        signed int v11 = [v7 intValue];
      }
      if (i < (unint64_t)[v13 count])
      {
        id v8 = [v13 objectAtIndexedSubscript:i];
        signed int v10 = [v8 intValue];
      }
      if (v10 > v11)
      {
        char v17 = 1;
        goto LABEL_19;
      }
      if (v11 > v10)
      {
        char v17 = 0;
        goto LABEL_19;
      }
    }
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
LABEL_19:
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17 & 1;
}

+ (id)_suggestedBackupForUDID:(id)a3 deviceClass:(id)a4 backups:(id)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = 0;
  id v27 = 0;
  id v26 = 0;
  memset(__b, 0, sizeof(__b));
  id v7 = v29;
  id v8 = [v7 countByEnumeratingWithState:__b objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)__b[2];
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v7);
      }
      id obj = *(id *)(__b[1] + 8 * v10);
      id v23 = +[BuddyBackupUtilities latestCommittedSnapshotFromBackup:obj requireCompatible:0];
      id v11 = [obj backupUDID];
      unsigned __int8 v12 = [v11 isEqualToString:location[0]];

      if (v12)
      {
        objc_storeStrong(&v28, obj);
        objc_storeStrong(&v27, v23);
        int v22 = 2;
      }
      else
      {
        id v13 = [obj deviceClass];
        char v20 = 0;
        BOOL v14 = 0;
        if ([v13 isEqualToString:v30])
        {
          BOOL v14 = 1;
          if (v26)
          {
            id v15 = v26;
            id v21 = [v23 date];
            char v20 = 1;
            BOOL v14 = [v15 compare:] == (id)-1;
          }
        }
        if (v20) {

        }
        if (v14)
        {
          objc_storeStrong(&v28, obj);
          objc_storeStrong(&v27, v23);
          id v16 = [v23 date];
          id v17 = v26;
          id v26 = v16;
        }
        int v22 = 0;
      }
      objc_storeStrong(&v23, 0);
      if (v22) {
        break;
      }
      if (++v10 >= (unint64_t)v8)
      {
        id v8 = [v7 countByEnumeratingWithState:__b objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v28 && v27) {
    v32 = +[RestorableBackupItem restorableBackupItemWithBackup:v28 snapshot:v27];
  }
  else {
    v32 = 0;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  id v18 = v32;

  return v18;
}

@end