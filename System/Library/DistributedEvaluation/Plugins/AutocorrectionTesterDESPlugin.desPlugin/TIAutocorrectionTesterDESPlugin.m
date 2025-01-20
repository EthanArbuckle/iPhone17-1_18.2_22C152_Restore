@interface TIAutocorrectionTesterDESPlugin
- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation TIAutocorrectionTesterDESPlugin

- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [a4 objectForKey:@"localeIdentifier"];
  v9 = [v7 objectForKey:@"localeIdentifier"];
  if (v9)
  {
    if (v8)
    {
      v10 = +[NSLocale localeWithLocaleIdentifier:v8];
      v11 = v10;
      if (!v10)
      {
        BOOL v15 = 0;
LABEL_43:

        goto LABEL_44;
      }
      v12 = [v10 languageCode];
      v13 = v12;
      if (!v12
        || ([v12 isEqualToString:@"zh"] & 1) != 0
        || [v13 isEqualToString:@"ja"])
      {
        if (a5)
        {
          v14 = &off_94680;
LABEL_9:
          +[NSError errorWithDomain:@"com.apple.TIDESPlugin" code:2 userInfo:v14];
          BOOL v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

          goto LABEL_43;
        }
        goto LABEL_41;
      }
      id v17 = v9;
      v18 = +[NSLocale localeWithLocaleIdentifier:v8];
      v19 = [v18 languageCode];
      v36 = v18;
      v39 = [v18 countryCode];
      v37 = v17;
      v20 = +[NSLocale localeWithLocaleIdentifier:v17];
      v21 = [v20 languageCode];
      v22 = [v20 countryCode];
      v42 = v19;
      if ([v19 isEqualToString:v21])
      {
        v35 = v21;
        v34 = v20;
        v23 = v39;
        if (!v39)
        {

LABEL_38:
          BOOL v15 = 1;
          goto LABEL_42;
        }
        v25 = v22;
        v24 = v35;
        if (v22)
        {
          unsigned __int8 v26 = [v39 isEqualToString:v22];
        }
        else
        {
          +[NSLocale preferredLanguages];
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          id v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v41)
          {
            v33 = v13;
            int v27 = 0;
            uint64_t v40 = *(void *)v44;
            while (2)
            {
              for (i = 0; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v44 != v40) {
                  objc_enumerationMutation(obj);
                }
                v29 = +[NSLocale localeWithLocaleIdentifier:*(void *)(*((void *)&v43 + 1) + 8 * i)];
                v30 = [v29 languageCode];
                v31 = [v29 countryCode];
                v27 |= [v42 isEqualToString:v30];
                if (v27 & 1) != 0 && ([v39 isEqualToString:v31])
                {

                  unsigned __int8 v26 = 1;
                  goto LABEL_34;
                }
              }
              id v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
              if (v41) {
                continue;
              }
              break;
            }
            unsigned __int8 v26 = v27 ^ 1;
LABEL_34:
            v13 = v33;
            v25 = 0;
            v24 = v35;
          }
          else
          {
            unsigned __int8 v26 = 1;
          }

          v23 = v39;
        }

        if (v26) {
          goto LABEL_38;
        }
      }
      else
      {
      }
      if (a5)
      {
        v14 = &off_946A8;
        goto LABEL_9;
      }
LABEL_41:
      BOOL v15 = 0;
      goto LABEL_42;
    }
    if (a5)
    {
      v16 = &off_94658;
      goto LABEL_14;
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_44;
  }
  if (!a5) {
    goto LABEL_15;
  }
  v16 = &off_94630;
LABEL_14:
  +[NSError errorWithDomain:@"com.apple.TIDESPlugin" code:1 userInfo:v16];
  BOOL v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

  return v15;
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v53 = a3;
  id v46 = a4;
  id v47 = a5;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = a6;
  id v51 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (v51)
  {
    id v54 = 0;
    v52 = 0;
    uint64_t v49 = *(void *)v73;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v73 != v49) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v11);
        v13 = objc_msgSend(v12, "pathExtension", v46);
        if ([v13 isEqualToString:@"txt"])
        {
          id v14 = v12;

          v52 = v14;
        }
        else
        {
          BOOL v15 = [v12 URLByDeletingLastPathComponent];

          id v16 = v12;
          id v54 = v15;
          archive_read_new();
          archive_read_support_filter_all();
          archive_read_support_format_all();
          archive_write_disk_new();
          archive_write_disk_set_standard_lookup();
          id v17 = v16;
          [v17 fileSystemRepresentation];
          unsigned int open_filename = archive_read_open_filename();
          if (!open_filename)
          {
            uint64_t v66 = 0;
            for (unsigned int i = archive_read_next_header(); ; unsigned int i = archive_read_next_header())
            {
              unsigned int open_filename = i;
              if (i) {
                break;
              }
              v21 = +[NSString stringWithUTF8String:archive_entry_pathname()];
              v22 = [v54 URLByAppendingPathComponent:v21];

              id v23 = v22;
              [v23 fileSystemRepresentation];
              archive_entry_set_pathname();
              if (!archive_write_header())
              {
                uint64_t v77 = 0;
                uint64_t v78 = 0;
                uint64_t v76 = 0;
                while (1)
                {
                  unsigned int data_block = archive_read_data_block();
                  unsigned int open_filename = data_block;
                  if (data_block) {
                    break;
                  }
                  if (archive_write_data_block()) {
                    goto LABEL_26;
                  }
                }
                if (data_block != 1 || archive_write_finish_entry())
                {
LABEL_26:

                  break;
                }
              }
            }
          }
          archive_read_close();
          archive_read_free();
          archive_write_close();
          archive_write_free();
          if (open_filename >= 2 && a7 != 0)
          {
            *a7 = +[NSError errorWithDomain:@"com.apple.TIDESPlugin" code:(int)open_filename userInfo:&off_946D0];

LABEL_47:
            id v43 = 0;
            long long v44 = obj;
            goto LABEL_48;
          }

          if (open_filename >= 2) {
            goto LABEL_47;
          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v11 != v51);
      id v25 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
      id v51 = v25;
    }
    while (v25);
  }
  else
  {
    id v54 = 0;
    v52 = 0;
  }

  id v50 = [objc_alloc((Class)NSString) initWithData:v47 encoding:4];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_3FF48;
  v70 = sub_3FF58;
  id v71 = +[NSMutableDictionary dictionary];
  [v53 objectForKey:@"configurations"];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v26 countByEnumeratingWithState:&v62 objects:v79 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v63;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v63 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v62 + 1) + 8 * (void)j);
        v31 = objc_msgSend(v26, "objectForKeyedSubscript:", v30, v46);
        id v32 = [v31 mutableCopy];

        v33 = [v53 objectForKey:@"localeIdentifier"];
        [v32 setObject:v33 forKey:@"KEYBOARD_LANGUAGE"];

        if (v52)
        {
          v34 = [v52 path];
          [v32 setObject:v34 forKey:@"TEXT"];
        }
        else
        {
          [v32 setObject:v50 forKey:@"SENTENCE"];
        }
        [v32 setValue:@"0" forKey:@"WORD_LEARNING_ENABLED"];
        v35 = [[AutocorrectionTesterAppDelegate alloc] initWithOptions:v32];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_3FF60;
        v58[3] = &unk_8D808;
        id v36 = v53;
        uint64_t v60 = v30;
        v61 = &v66;
        id v59 = v36;
        [(AutocorrectionTesterAppDelegate *)v35 runWithObserver:v58];
        if (v54)
        {
          v37 = [v54 path];
          [v32 setObject:v37 forKey:@"CUSTOM_STATIC_DICTIONARY_PATH"];

          v38 = [v54 path];
          [v32 setObject:v38 forKey:@"CUSTOM_LANGUAGE_MODEL_PATH"];

          [(AutocorrectionTesterAppDelegate *)v35 resetOptions:v32];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_403FC;
          v55[3] = &unk_8D830;
          v55[4] = v30;
          id v56 = v36;
          v57 = &v66;
          [(AutocorrectionTesterAppDelegate *)v35 runWithObserver:v55];
        }
      }
      id v27 = [v26 countByEnumeratingWithState:&v62 objects:v79 count:16];
    }
    while (v27);
  }

  v39 = (void *)v67[5];
  uint64_t v40 = [v53 objectForKey:@"typewheel_job_id"];
  id v41 = (void *)v40;
  if (v40) {
    CFStringRef v42 = (const __CFString *)v40;
  }
  else {
    CFStringRef v42 = &stru_8DEF0;
  }
  objc_msgSend(v39, "setValue:forKey:", v42, @"job_id", v46);

  id v43 = (id)v67[5];
  _Block_object_dispose(&v66, 8);

  long long v44 = v50;
LABEL_48:

  return v43;
}

@end