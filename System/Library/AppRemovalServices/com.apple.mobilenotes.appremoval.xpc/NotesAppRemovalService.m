@interface NotesAppRemovalService
- (id)deleteAppUserDefaults;
- (id)deleteSharedUserDefaults;
- (void)removeAppWithReply:(id)a3;
@end

@implementation NotesAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v104 = (void (**)(id, id))a3;
  v4 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002B1C();
  }

  v5 = +[ICAuthenticationState sharedState];
  [v5 removeAllMainKeysFromKeychain];

  v6 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100002AE8();
  }
  v101 = self;

  v7 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100002AB4();
  }

  v8 = +[ACAccountStore defaultStore];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v9 = [v8 accounts];
  id v10 = [v9 countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v129;
    uint64_t v13 = ACAccountDataclassNotes;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v129 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = [*(id *)(*((void *)&v128 + 1) + 8 * i) displayAccount];
        if ([v15 isEnabledForDataclass:v13])
        {
          [v15 setEnabled:0 forDataclass:v13];
          [v8 saveAccount:v15 withCompletionHandler:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v11);
  }

  v16 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100002A80();
  }

  v108 = +[NSFileManager defaultManager];
  v17 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100002A4C();
  }

  v18 = +[ICNoteContext sharedContext];
  [v18 destroyPersistentStore];

  v19 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100002A18();
  }
  v103 = v8;

  v20 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000029E4();
  }

  uint64_t v21 = +[ICPaths applicationDocumentsURL];
  v22 = +[ICPaths persistentStoreURL];
  v23 = [v22 lastPathComponent];

  id v127 = 0;
  v105 = (void *)v21;
  v24 = [v108 contentsOfDirectoryAtURL:v21 includingPropertiesForKeys:0 options:4 error:&v127];
  v25 = v127;
  if (v25)
  {
    v26 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000025D4();
    }
  }
  v106 = v25;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v27 = v24;
  id v28 = [v27 countByEnumeratingWithState:&v123 objects:v138 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v124;
    do
    {
      v31 = 0;
      do
      {
        if (*(void *)v124 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v123 + 1) + 8 * (void)v31);
        v34 = [v32 lastPathComponent];
        if ([v34 hasPrefix:v23]) {
          goto LABEL_34;
        }
        v35 = [v32 lastPathComponent];
        unsigned __int8 v36 = [v35 isEqualToString:@"tmp"];

        if ((v36 & 1) == 0)
        {
          id v122 = 0;
          [v108 removeItemAtURL:v32 error:&v122];
          v34 = v122;
          if ([v34 code] == (id)4) {
            goto LABEL_34;
          }
          if (v34)
          {
            v37 = os_log_create("com.apple.notes", "Application");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v135 = (uint64_t)v32;
              __int16 v136 = 2112;
              v137 = v34;
              _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "couldn't remove file at URL: %@, error: %@", buf, 0x16u);
            }

            v34 = v34;
            v106 = v34;
LABEL_34:
          }
        }
        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v38 = [v27 countByEnumeratingWithState:&v123 objects:v138 count:16];
      id v29 = v38;
    }
    while (v38);
  }

  v39 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    sub_1000029B0();
  }

  v40 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    sub_10000297C();
  }

  +[NoteContext removeSqliteAndIdxFiles];
  v41 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100002948();
  }

  v42 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    sub_100002914();
  }

  v43 = CPSharedResourcesDirectory();
  v44 = NoteContextPersistentStorePath();
  v107 = [v44 lastPathComponent];

  contexta = v43;
  v95 = [v43 stringByAppendingString:@"/Library/Notes/"];
  +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  v93 = v121 = v106;
  v45 = objc_msgSend(v108, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
  v46 = v106;

  if (v46)
  {
    v47 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1000028AC();
    }
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v48 = v45;
  id v49 = [v48 countByEnumeratingWithState:&v117 objects:v133 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v118;
    do
    {
      v52 = 0;
      do
      {
        if (*(void *)v118 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v52);
        v55 = [v53 lastPathComponent];
        unsigned __int8 v56 = [v55 hasPrefix:v107];

        if ((v56 & 1) == 0)
        {
          id v116 = 0;
          [v108 removeItemAtURL:v53 error:&v116];
          v57 = v116;
          if ([v57 code] != (id)4)
          {
            if (!v57) {
              goto LABEL_68;
            }
            v58 = os_log_create("com.apple.notes", "Application");
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v135 = (uint64_t)v53;
              __int16 v136 = 2112;
              v137 = v57;
              _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "couldn't remove file at URL: %@, error: %@", buf, 0x16u);
            }

            v59 = v57;
            v46 = v59;
          }
        }
LABEL_68:
        v52 = (char *)v52 + 1;
      }
      while (v50 != v52);
      id v50 = [v48 countByEnumeratingWithState:&v117 objects:v133 count:16];
    }
    while (v50);
  }

  v60 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
    sub_100002878();
  }

  v61 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    sub_100002844();
  }

  v62 = [(NotesAppRemovalService *)v101 deleteAppUserDefaults];
  if (v62)
  {
    v63 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1000027DC();
    }

    if (!v46) {
      v46 = v62;
    }
  }
  v64 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    sub_1000027A8();
  }

  v65 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
    sub_100002774();
  }

  v66 = [(NotesAppRemovalService *)v101 deleteSharedUserDefaults];

  if (v66)
  {
    v67 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      sub_10000270C();
    }

    if (!v46) {
      v46 = v66;
    }
  }
  v68 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
    sub_1000026D8();
  }

  v69 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
    sub_1000026A4();
  }

  uint64_t v70 = [v105 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  id v115 = 0;
  [v108 removeItemAtURL:v70 error:&v115];
  v71 = v115;
  if ([v71 code] == (id)4)
  {
    v72 = v71;
    v71 = 0;
  }
  else
  {
    if (!v71) {
      goto LABEL_99;
    }
    v72 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v135 = v70;
      __int16 v136 = 2112;
      v137 = v71;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "couldn't remove file at URL: %@, error: %@", buf, 0x16u);
    }
  }
LABEL_99:
  v73 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
    sub_100002670();
  }
  v102 = v66;

  v74 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
    sub_10000263C();
  }

  uint64_t v75 = +[ICPaths importDocumentsURL];
  v94 = (void *)v75;
  v114 = v46;
  v76 = [v108 contentsOfDirectoryAtURL:v75 includingPropertiesForKeys:0 options:4 error:&v114];
  v77 = v114;

  if (v77)
  {
    v78 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      sub_1000025D4();
    }
  }
  v96 = v71;
  v98 = (void *)v70;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v79 = v76;
  id v80 = [v79 countByEnumeratingWithState:&v110 objects:v132 count:16];
  if (v80)
  {
    id v81 = v80;
    uint64_t v82 = *(void *)v111;
    do
    {
      v83 = 0;
      do
      {
        if (*(void *)v111 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v83);
        id v109 = 0;
        [v108 removeItemAtURL:v84 error:&v109];
        v86 = v109;
        if ([v86 code] != (id)4)
        {
          if (!v86) {
            goto LABEL_118;
          }
          v87 = os_log_create("com.apple.notes", "Application");
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v135 = (uint64_t)v84;
            __int16 v136 = 2112;
            v137 = v86;
            _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "couldn't remove file at URL: %@, error: %@", buf, 0x16u);
          }

          v88 = v86;
          v77 = v88;
        }

LABEL_118:
        v83 = (char *)v83 + 1;
      }
      while (v81 != v83);
      id v81 = [v79 countByEnumeratingWithState:&v110 objects:v132 count:16];
    }
    while (v81);
  }

  v89 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
    sub_1000025A0();
  }

  v90 = os_log_create("com.apple.notes", "Application");
  v91 = v90;
  if (v77)
  {
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
      sub_100002538();
    }
  }
  else if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
  {
    sub_100002504();
  }

  v104[2](v104, v77);
}

- (id)deleteAppUserDefaults
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  v3 = ICNotesAppBundleIdentifier();
  id v4 = [v2 initWithSuiteName:v3];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [v4 dictionaryRepresentation];
  v6 = [v5 allKeys];

  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v22 + 1) + 8 * i)) {
          objc_msgSend(v4, "removeObjectForKey:");
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v8);
  }

  if ([v4 synchronize])
  {
    id v11 = +[ICAppGroupDefaults sharedAppGroupDefaults];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = objc_msgSend(v11, "dictionaryRepresentation", 0);
    uint64_t v13 = [v12 allKeys];

    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          if (*(void *)(*((void *)&v18 + 1) + 8 * (void)j)) {
            objc_msgSend(v11, "removeObjectForKey:");
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
  }
  else
  {
    v27[0] = NSLocalizedDescriptionKey;
    v27[1] = @"BundleId";
    v28[0] = @"Unable to synchronize app NSUserDefaults for AppRemoval.";
    id v11 = ICNotesAppBundleIdentifier();
    v28[1] = v11;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v14 = +[NSError errorWithDomain:@"com.apple.mobilenotes.appremoval.errorDomain" code:-1 userInfo:v13];
  }

  return v14;
}

- (id)deleteSharedUserDefaults
{
  id v2 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(v2, "dictionaryRepresentation", 0);
  id v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * i)) {
          objc_msgSend(v2, "removeObjectForKey:");
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  if ([v2 synchronize])
  {
    uint64_t v9 = 0;
  }
  else
  {
    v17[0] = NSLocalizedDescriptionKey;
    v17[1] = @"BundleId";
    v18[0] = @"Unable to synchronize shared NSUserDefaults for AppRemoval.";
    id v10 = ICNotesAppBundleIdentifier();
    v18[1] = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.mobilenotes.appremoval.errorDomain" code:-1 userInfo:v11];
  }
  return v9;
}

@end