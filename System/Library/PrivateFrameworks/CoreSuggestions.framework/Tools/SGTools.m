@interface SGTools
+ (BOOL)registerTabCompletions;
+ (id)commands;
+ (id)completionCommands;
+ (id)dictionaryFromArgs:(id)a3 keys:(id)a4;
+ (id)filesFromArgs:(id)a3;
+ (id)getEntityStore;
+ (id)getRecipientsFilter;
+ (id)helpStrings;
+ (id)messageFromArgs:(id)a3;
+ (id)reverseMapAnnotationsForMessageFile:(id)a3 forMailMessage:(id)a4 withPreprocessed:(id)a5;
+ (id)searchableItemFromDictionary:(id)a3;
+ (id)searchableItemFromMessage:(id)a3;
+ (id)searchableItemsFromArgs:(id)a3;
+ (void)addSearchableItems:(id)a3;
+ (void)allowPastAndCancelledEventsWithBlock:(id)a3;
+ (void)beSameUserAsSuggestd;
+ (void)confirmSuggestions:(id)a3;
+ (void)initialize;
+ (void)registerBoolPreferenceCommand:(id)a3 disableOnMacOSCustomerBuild:(BOOL)a4 getter:(id)a5 setter:(id)a6;
+ (void)registerCommand:(id)a3 disableOnMacOSCustomerBuild:(BOOL)a4 code:(id)a5;
@end

@implementation SGTools

+ (BOOL)registerTabCompletions
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = [a1 completionCommands];
  id v5 = [v3 initWithFormat:@"_suggest_tool_tab()\n{\nlocal cur verbs\nCOMPREPLY=()\ncur=\"${COMP_WORDS[COMP_CWORD]}\"\nverbs=\"%@\"\n\ncase \"${COMP_CWORD}\" in\n1\nCOMPREPLY=( $(compgen -W \"${verbs}\" -- ${cur}))\nreturn 0\n;;\n@]\n;;\nesac\n}\ncomplete -o default -F _suggest_tool_tab suggest_tool\n"),
         v4);

  id v6 = objc_alloc((Class)NSString);
  v7 = sub_100006034(@"~/suggest-tool-tab-completion.sh");
  id v8 = [v6 initWithFormat:@"\nCreating registration script: %@ ...", v7];
  puts((const char *)[v8 UTF8String]);

  v9 = [@"~/suggest-tool-tab-completion.sh" stringByExpandingTildeInPath];
  id v40 = 0;
  LOBYTE(v4) = [v5 writeToFile:v9 atomically:1 encoding:4 error:&v40];
  id v10 = v40;
  if (v4)
  {
    id v11 = +[NSFileManager defaultManager];
    NSFileAttributeKey v43 = NSFileProtectionKey;
    NSFileProtectionType v44 = NSFileProtectionNone;
    v12 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v39 = v10;
    unsigned __int8 v13 = [v11 setAttributes:v12 ofItemAtPath:v9 error:&v39];
    id v14 = v39;

    if ((v13 & 1) == 0)
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to set file protection class.\nError: %@", v14];
      puts((const char *)[v15 UTF8String]);
    }
    v16 = [@"~/.profile" stringByExpandingTildeInPath];
    id v38 = v14;
    v17 = +[NSString stringWithContentsOfFile:v16 encoding:4 error:&v38];
    id v18 = v38;

    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"source %@\n", v9];
    unsigned int v20 = [v17 containsString:v19];
    id v21 = objc_alloc((Class)NSString);
    v22 = v21;
    if (v20)
    {
      id v23 = [v21 initWithFormat:@"TAB completions script is already sourced in %@", @"~/.profile"];
      puts((const char *)[v23 UTF8String]);
    }
    else
    {
      v25 = sub_100006034(@"~/.profile");
      id v26 = [v22 initWithFormat:@"Updating %@ ...", v25];
      puts((const char *)[v26 UTF8String]);

      if (v17)
      {
        v27 = [v17 stringByAppendingString:@"\n"];
      }
      else
      {
        v27 = &stru_10005B0F8;
      }
      v17 = [(__CFString *)v27 stringByAppendingString:v19];

      id v37 = v18;
      unsigned __int8 v28 = [v17 writeToFile:v16 atomically:1 encoding:4 error:&v37];
      id v10 = v37;

      if ((v28 & 1) == 0)
      {
        id v33 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to write profile file: %@.\nError: %@", @"~/.profile", v10];
        puts((const char *)[v33 UTF8String]);
        BOOL v24 = 0;
LABEL_16:

        goto LABEL_17;
      }
      id v18 = v10;
    }
    NSFileAttributeKey v41 = NSFileProtectionKey;
    NSFileProtectionType v42 = NSFileProtectionNone;
    v29 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v36 = v18;
    unsigned __int8 v30 = [v11 setAttributes:v29 ofItemAtPath:v16 error:&v36];
    id v10 = v36;

    if ((v30 & 1) == 0)
    {
      id v31 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to set file protection class.\nError: %@", v10];
      puts((const char *)[v31 UTF8String]);
    }
    id v32 = objc_alloc((Class)NSString);
    sub_100006034(v19);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = [v32 initWithFormat:@"To load TAB completions without reboot run: %@", v33];
    puts((const char *)[v34 UTF8String]);

    BOOL v24 = 1;
    goto LABEL_16;
  }
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to write script file.\nError: %@", v10];
  puts((const char *)[v11 UTF8String]);
  BOOL v24 = 0;
LABEL_17:

  return v24;
}

+ (id)completionCommands
{
  v2 = [(id)qword_10006A7C0 allKeys];
  id v3 = [v2 mutableCopy];

  [v3 sortUsingSelector:"compare:"];
  uint64_t v4 = objc_msgSend(v3, "_pas_componentsJoinedByString:", @" ");

  return v4;
}

+ (id)getRecipientsFilter
{
  id v2 = objc_alloc((Class)SGBloomFilter);
  id v3 = +[SGPaths suggestionsDirectory];
  id v4 = [v2 initWithDirectory:v3 name:@"significant-pseudo-contacts.bf"];

  return v4;
}

+ (id)getEntityStore
{
  id v2 = +[SGSqlEntityStore defaultPath];
  id v3 = +[SGSqlEntityStore defaultSnippetPath];
  id v4 = +[SGSqlEntityStore sqlStoreWithEntityDbPathNoMigrate:v2 snippetDbPath:v3 isEphemeral:0 executeJournals:0];

  id v5 = [v4 journal];
  [v5 freezeObservers];

  return v4;
}

+ (void)beSameUserAsSuggestd
{
  if (!getuid())
  {
    id v2 = getpwnam("mobile");
    if (!v2)
    {
      id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to get pwInfo Exiting."];
      puts((const char *)[v6 UTF8String]);

      _exit(7);
    }
    id v3 = v2;
    if (!v2->pw_uid)
    {
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error: got pwInfo for uid=0. Exiting."];
      puts((const char *)[v7 UTF8String]);

      _exit(8);
    }
    int v4 = fileno(__stdoutp);
    if (isatty(v4) == 1)
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Dropping root privileges to %s (%i)", v3->pw_name, v3->pw_uid);
      puts((const char *)[v5 UTF8String]);
    }
    if (setuid(v3->pw_uid))
    {
      id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Error: could not set uid"];
      puts((const char *)[v8 UTF8String]);

      _exit(9);
    }
    if (!getuid())
    {
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to setuid to drop privileges. Exiting."];
      puts((const char *)[v9 UTF8String]);

      _exit(10);
    }
  }
}

+ (void)confirmSuggestions:(id)a3
{
  id v3 = a3;
  int v4 = +[SGSuggestionsService serviceForMail];
  id v5 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    id v14 = v18;
    id v15 = v21;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v9);
        id v11 = [objc_alloc((Class)NSString) initWithFormat:@"\nConfirming %@\n", v10, v14, v15];
        puts((const char *)[v11 UTF8String]);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_group_enter(v5);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v21[0] = sub_100006720;
          v21[1] = &unk_100058E20;
          v21[2] = v10;
          v22 = v5;
          [v4 confirmContact:v10 withCompletion:v20];
          v12 = v22;
LABEL_10:

          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_group_enter(v5);
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v18[0] = sub_1000067B4;
          v18[1] = &unk_100058E20;
          v18[2] = v10;
          id v19 = v5;
          [v4 confirmEvent:v10 withCompletion:v17];
          v12 = v19;
          goto LABEL_10;
        }
        id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown suggestion type..."];
        puts((const char *)[v13 UTF8String]);

LABEL_12:
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)addSearchableItems:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"suggest_tool.m", 6881, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  if (qword_10006A7D0 != -1) {
    dispatch_once(&qword_10006A7D0, &stru_10005AB40);
  }
  id v6 = sgLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding %lu searchable items", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_100006C74;
  id v40 = sub_100006C84;
  id v41 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    uint64_t v9 = SGBundleIdentifierMail;
    unint64_t v25 = kHVMaxHtmlSize;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v12 = [v11 bundleID];
        unsigned int v13 = [v12 isEqualToString:v9];

        if (v13
          && ([v11 attributeSet],
              id v14 = objc_claimAutoreleasedReturnValue(),
              [v14 HTMLContentDataNoCopy],
              id v15 = objc_claimAutoreleasedReturnValue(),
              BOOL v16 = (unint64_t)[v15 length] > v25,
              v15,
              v14,
              v16))
        {
          v17 = sgLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v31 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting email from -addSearchableItems: due to size", v31, 2u);
          }
        }
        else
        {
          id v18 = +[HVSearchableItemHelper serializeAttributesAndBody:v11];
          dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
          unsigned int v20 = +[SGSuggestionsService serviceForInternal];
          id v21 = [v18 attributeSetData];
          v22 = [v18 htmlContentData];
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100006C8C;
          v27[3] = &unk_10005AB68;
          p_long long buf = &buf;
          v17 = v18;
          unsigned __int8 v28 = v17;
          long long v23 = v19;
          v29 = v23;
          [v20 addSearchableItemMetadata:v21 htmlData:v22 completion:v27];

          +[_PASDispatch waitForSemaphore:v23];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

+ (id)reverseMapAnnotationsForMessageFile:(id)a3 forMailMessage:(id)a4 withPreprocessed:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v34 = 0;
  id v9 = a3;
  uint64_t v10 = +[NSRegularExpression regularExpressionWithPattern:@"((?:\\.eml|_jsEntity\\.json))$" options:1 error:&v34];
  id v11 = v34;
  v12 = objc_msgSend(v10, "stringByReplacingMatchesInString:options:range:withTemplate:", v9, 0, 0, objc_msgSend(v9, "length"), @"_expectations.json");

  unsigned int v13 = +[NSFileManager defaultManager];
  unsigned int v14 = [v13 fileExistsAtPath:v12];

  if (!v14)
  {
    uint64_t v21 = 0;
    v22 = 0;
LABEL_6:
    id v20 = [objc_alloc((Class)_PASTuple2) initWithFirst:v21 second:v22];

    id v15 = (id)v21;
    id v16 = v11;
    goto LABEL_8;
  }
  id v33 = v11;
  id v15 = +[NSData dataWithContentsOfFile:v12 options:0 error:&v33];
  id v16 = v33;

  if (v15)
  {
    id v32 = v16;
    v17 = +[NSJSONSerialization JSONObjectWithData:v15 options:0 error:&v32];
    id v18 = v32;

    if (v18)
    {
      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v17, v18];
      puts((const char *)[v19 UTF8String]);

      id v20 = 0;
      id v16 = v18;
      goto LABEL_8;
    }
    long long v24 = [v17 objectForKeyedSubscript:@"outputs"];

    if (v24)
    {
      unint64_t v25 = [v17 objectForKeyedSubscript:@"outputs"];
      long long v26 = [v25 objectAtIndexedSubscript:0];
      v27 = [v26 objectForKeyedSubscript:@"schemas"];
      unsigned __int8 v28 = [v27 objectAtIndexedSubscript:0];

      id v29 = [v17 objectForKeyedSubscript:@"outputs"];
      unsigned __int8 v30 = [v29 objectAtIndexedSubscript:0];
      v22 = [v30 objectForKeyedSubscript:@"category"];
    }
    else
    {
      v22 = [v17 objectForKeyedSubscript:@"expectation"];

      if (!v22)
      {
        unsigned __int8 v28 = 0;
        goto LABEL_20;
      }
      id v29 = [v17 objectForKeyedSubscript:@"expectation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v29;
        v22 = 0;
        unsigned __int8 v28 = v29;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unsigned __int8 v28 = 0;
          v22 = 0;
          goto LABEL_15;
        }
        unsigned __int8 v28 = [v29 objectAtIndexedSubscript:0];
        v22 = 0;
      }
    }

    if (!v28)
    {
LABEL_20:
      id v31 = objc_opt_new();
      uint64_t v21 = [v31 reverseMapMailMessage:v7 withPreprocessedHTML:v8 forCategory:v22 withSchemExpectation:v28];

      id v11 = 0;
      goto LABEL_6;
    }
    +[SGStructuredEventClassification categoryForSchema:v28];
    v22 = id v29 = v22;
LABEL_15:

    goto LABEL_20;
  }
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v16];
  puts((const char *)[v15 UTF8String]);
  id v20 = 0;
LABEL_8:

  return v20;
}

+ (id)searchableItemFromMessage:(id)a3
{
  id v3 = a3;
  int v4 = [v3 date];
  if (v4)
  {
    [v3 setDate:v4];
  }
  else
  {
    id v5 = objc_opt_new();
    [v3 setDate:v5];
  }
  id v6 = [v3 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];
  id v7 = +[NSUUID UUID];
  id v8 = [v7 UUIDString];
  [v6 setUniqueIdentifier:v8];

  [v6 setDomainIdentifier:@"suggest-tool-domain"];
  uint64_t v9 = CSAccountTypeIMAP;
  uint64_t v10 = [v6 attributeSet];
  [v10 setAccountType:v9];

  return v6;
}

+ (id)searchableItemsFromArgs:(id)a3
{
  id v3 = a3;
  v49 = objc_opt_new();
  v64 = objc_opt_new();
  v63 = objc_opt_new();
  v62 = objc_opt_new();
  int v4 = objc_opt_new();
  id v5 = +[NSCharacterSet alphanumericCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  id v6 = +[NSCharacterSet whitespaceCharacterSet];
  [v4 formUnionWithCharacterSet:v6];

  [v4 invert];
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100007AE0;
  v80[3] = &unk_10005AAF8;
  id v46 = v4;
  id v81 = v46;
  v82 = v83;
  v61 = objc_retainBlock(v80);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v3;
  id v7 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (!v7)
  {
    id v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_27;
  }
  id v51 = v7;
  id v8 = 0;
  uint64_t v9 = 0;
  v47 = v67;
  uint64_t v50 = *(void *)v77;
  do
  {
    v57 = 0;
    v54 = v8;
    do
    {
      if (*(void *)v77 != v50) {
        objc_enumerationMutation(obj);
      }
      uint64_t v56 = *(void *)(*((void *)&v76 + 1) + 8 * (void)v57);
      if (sub_100007C10())
      {
        uint64_t v10 = +[NSData dataWithContentsOfFile:v56];
        v58 = +[MFMailMessage sg_messageWithRFC822Data:v10];

        v52 = objc_msgSend(v58, "sg_bestAlternativePart");
        id v11 = objc_msgSend(v58, "sg_allHeaders");
        v55 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:v11];

        id v12 = [v52 copy];
        [v55 setHtmlBody:v12];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        unsigned int v13 = [v58 messageBodyIfAvailable];
        id v59 = [v13 attachments];

        id v14 = [v59 countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v14)
        {
          uint64_t v60 = *(void *)v73;
          do
          {
            id v65 = v14;
            for (i = 0; i != v65; i = (char *)i + 1)
            {
              if (*(void *)v73 != v60) {
                objc_enumerationMutation(v59);
              }
              id v16 = [*(id *)(*((void *)&v72 + 1) + 8 * i) mimePart];
              id v17 = objc_alloc((Class)NSString);
              id v18 = [v16 type];
              id v19 = [v16 subtype];
              id v20 = [v17 initWithFormat:@"%@/%@", v18, v19, v46, v47];

              uint64_t v21 = [v16 mimeBody];
              v22 = [v21 rawData];
              id v23 = [v16 range];
              unint64_t v25 = objc_msgSend(v22, "subdataWithRange:", v23, v24);

              long long v26 = [v16 decodedDataForData:v25];

              v27 = [v16 attachmentFilename];
              unsigned __int8 v28 = ((void (*)(void *, void *))v61[2])(v61, v27);

              id v29 = NSTemporaryDirectory();
              id v30 = objc_alloc((Class)NSString);
              id v31 = +[NSProcessInfo processInfo];
              id v32 = [v31 globallyUniqueString];
              id v33 = [v30 initWithFormat:@"%@_%@", v32, v28];
              id v34 = [v29 stringByAppendingPathComponent:v33];

              [v26 writeToFile:v34 atomically:1];
              [v64 addObject:v20];
              [v63 addObject:v28];
              [v62 addObject:v34];
            }
            id v14 = [v59 countByEnumeratingWithState:&v72 objects:v84 count:16];
          }
          while (v14);
        }

        long long v35 = v52;
        goto LABEL_17;
      }
      uint64_t v36 = +[NSData dataWithContentsOfFile:v56];
      if (v36)
      {
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v67[0] = sub_100007C94;
        v67[1] = &unk_10005AB20;
        v71 = v61;
        id v68 = v64;
        id v69 = v63;
        id v70 = v62;
        v55 = +[SGSimpleMailMessage parseRfc822:v36 attachmentCallback:v66];
        v58 = (void *)v36;

        long long v35 = v71;
LABEL_17:

        uint64_t v9 = v55;
        goto LABEL_18;
      }

LABEL_18:
      if (v9)
      {
        id v8 = [v9 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];

        id v37 = [v8 attributeSet];
        [v37 setAttachmentTypes:v64];

        uint64_t v38 = [v8 attributeSet];
        [v38 setAttachmentNames:v63];

        id v39 = [v8 attributeSet];
        [v39 setAttachmentPaths:v62];

        id v40 = [UTTypeEmailMessage identifier];
        id v41 = [v8 attributeSet];
        [v41 setContentType:v40];

        [v49 addObject:v8];
      }
      else
      {
        id v42 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to extract message for: %@", v56];
        puts((const char *)[v42 UTF8String]);

        id v8 = v54;
      }
      v54 = v8;
      v57 = (char *)v57 + 1;
    }
    while (v57 != v51);
    id v43 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
    id v51 = v43;
  }
  while (v43);
LABEL_27:

  id v44 = v49;
  _Block_object_dispose(v83, 8);

  return v44;
}

+ (id)dictionaryFromArgs:(id)a3 keys:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 pathExtension];
  unsigned int v9 = [v8 isEqualToString:@"json"];

  if (!v9)
  {
    id v11 = objc_opt_new();
    if ([v6 count])
    {
      unint64_t v19 = 0;
      do
      {
        id v20 = [v5 objectAtIndexedSubscript:v19];
        uint64_t v21 = [v6 objectAtIndexedSubscript:v19];
        [v11 setObject:v20 forKeyedSubscript:v21];

        ++v19;
      }
      while ((unint64_t)[v6 count] > v19);
    }
    long long v26 = v11;
    unsigned int v13 = +[NSArray arrayWithObjects:&v26 count:1];
    goto LABEL_9;
  }
  uint64_t v10 = [v5 objectAtIndexedSubscript:0];
  id v25 = 0;
  id v11 = +[NSData dataWithContentsOfFile:v10 options:0 error:&v25];
  id v12 = v25;

  if (!v11)
  {
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v12];
    puts((const char *)[v22 UTF8String]);

    id v18 = &__NSArray0__struct;
    goto LABEL_11;
  }
  id v24 = v12;
  unsigned int v13 = +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:&v24];
  id v14 = v24;

  if (!v14)
  {
LABEL_9:

    id v18 = v13;
    goto LABEL_12;
  }
  id v15 = objc_alloc((Class)NSString);
  id v16 = [v5 objectAtIndexedSubscript:0];
  id v17 = [v15 initWithFormat:@"Error decoding JSON content from %@: %@", v16, v14];
  puts((const char *)[v17 UTF8String]);

  id v18 = v13;
  id v12 = v14;
LABEL_11:

LABEL_12:

  return v18;
}

+ (id)filesFromArgs:(id)a3
{
  id v3 = a3;
  int v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 pathExtension];
  unsigned int v6 = [v5 isEqualToString:@"json"];

  if (!v6)
  {
    id v8 = [v3 objectAtIndexedSubscript:0];
    id v22 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v22 count:1];
LABEL_6:

    id v15 = v10;
    goto LABEL_9;
  }
  id v7 = [v3 objectAtIndexedSubscript:0];
  id v21 = 0;
  id v8 = +[NSData dataWithContentsOfFile:v7 options:0 error:&v21];
  id v9 = v21;

  if (!v8)
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v9];
    puts((const char *)[v16 UTF8String]);

    id v15 = &__NSArray0__struct;
    goto LABEL_8;
  }
  id v20 = v9;
  uint64_t v10 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v20];
  id v11 = v20;

  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = [v3 objectAtIndexedSubscript:0];
      id v23 = v18;
      uint64_t v19 = +[NSArray arrayWithObjects:&v23 count:1];

      uint64_t v10 = (void *)v19;
    }
    goto LABEL_6;
  }
  id v12 = objc_alloc((Class)NSString);
  unsigned int v13 = [v3 objectAtIndexedSubscript:0];
  id v14 = [v12 initWithFormat:@"Error decoding JSON content from %@: %@", v13, v11];
  puts((const char *)[v14 UTF8String]);

  id v15 = v10;
  id v9 = v11;
LABEL_8:

LABEL_9:

  return v15;
}

+ (id)messageFromArgs:(id)a3
{
  id v3 = a3;
  int v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];
  unsigned int v6 = [v3 objectAtIndexedSubscript:2];
  id v7 = [v3 objectAtIndexedSubscript:3];
  if ([v7 hasPrefix:@"@"])
  {
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Loading message body from file"];
    puts((const char *)[v8 UTF8String]);

    id v9 = [v7 substringFromIndex:1];
    id v23 = 0;
    uint64_t v10 = +[NSString stringWithContentsOfFile:v9 encoding:4 error:&v23];
    id v11 = v23;

    if (v11)
    {
      id v21 = +[NSAssertionHandler currentHandler];
      id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SGTools messageFromArgs:]");
      [v21 handleFailureInFunction:v22, @"suggest_tool.m", 6666, @"Error loading message body: %@", v11 file lineNumber description];
    }
    id v7 = (void *)v10;
  }
  id v12 = [objc_alloc((Class)SGSimpleMailMessage) initForBuilding];
  unsigned int v13 = +[NSUUID UUID];
  id v14 = [v13 UUIDString];
  [v12 setMessageId:v14];

  [v12 setSubject:v4];
  id v15 = +[SGSimpleNamedEmailAddress namedEmailAddressWithFieldValue:v5];
  id v24 = v15;
  id v16 = +[NSArray arrayWithObjects:&v24 count:1];
  [v12 setTo:v16];

  id v17 = +[SGSimpleNamedEmailAddress namedEmailAddressWithFieldValue:v6];
  [v12 setFrom:v17];

  [v12 setHtmlBody:v7];
  [v12 setSource:@"suggest_tool"];
  if ((unint64_t)[v3 count] < 5)
  {
    id v18 = +[NSDate date];
    [v12 setDate:v18];
  }
  else
  {
    id v18 = [v3 objectAtIndexedSubscript:4];
    [v18 doubleValue];
    uint64_t v19 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    [v12 setDate:v19];
  }

  return v12;
}

+ (id)helpStrings
{
  id v2 = [(id)qword_10006A7C8 mutableCopy];
  [v2 sortUsingSelector:"compare:"];

  return v2;
}

+ (id)commands
{
  return (id)qword_10006A7C0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)qword_10006A7C0;
    qword_10006A7C0 = v4;

    uint64_t v6 = objc_opt_new();
    id v7 = (void *)qword_10006A7C8;
    qword_10006A7C8 = v6;

    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_10000B358;
    v122[3] = &unk_100058D40;
    v122[4] = a1;
    [a1 registerCommand:@"viewPrefs" disableOnMacOSCustomerBuild:1 code:v122];
    v121[0] = _NSConcreteStackBlock;
    v121[1] = 3221225472;
    v121[2] = sub_10000B488;
    v121[3] = &unk_100058D40;
    v121[4] = a1;
    [a1 registerCommand:@"setSyncHistoryToCloud [YES/NO]" disableOnMacOSCustomerBuild:1 code:v121];
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = sub_10000B620;
    v120[3] = &unk_100058D40;
    v120[4] = a1;
    [a1 registerCommand:@"spotlightReimport PERSONHANDLE STARTDATE ENDDATE" disableOnMacOSCustomerBuild:1 code:v120];
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_10000B870;
    v119[3] = &unk_100058D40;
    v119[4] = a1;
    [a1 registerCommand:@"suggestionsFromMessage SUBJECT TO FROM BODY (optional DATE)" disableOnMacOSCustomerBuild:1 code:v119];
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_10000BC38;
    v118[3] = &unk_100058D40;
    v118[4] = a1;
    [a1 registerCommand:@"confirmSuggestionsFromMessage SUBJECT TO FROM BODY (optional DATE)" disableOnMacOSCustomerBuild:1 code:v118];
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_10000BE50;
    v117[3] = &unk_100058DF8;
    v117[4] = a1;
    v117[5] = a2;
    [a1 registerCommand:@"confirmSuggestionsFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v117];
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10000C138;
    v116[3] = &unk_100058D40;
    v116[4] = a1;
    [a1 registerCommand:@"rejectSuggestionsFromMessage SUBJECT TO FROM BODY (optional DATE)" disableOnMacOSCustomerBuild:1 code:v116];
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_10000C5CC;
    v114[3] = &unk_100058CF8;
    v115 = &stru_100058E60;
    [a1 registerCommand:@"rejectSuggestionsFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v114];
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_10000CB00;
    v113[3] = &unk_100058D40;
    v113[4] = a1;
    [a1 registerCommand:@"harvestQueueAddMessage SUBJECT TO FROM BODY (optional DATE)" disableOnMacOSCustomerBuild:1 code:v113];
    [a1 registerCommand:@"suggestionsFromTextMessage [SENDER_NAME] SENDER_EMAIL CONTENT" disableOnMacOSCustomerBuild:1 code:&stru_100058EA0];
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_10000CC04;
    v112[3] = &unk_100058D40;
    v112[4] = a1;
    [a1 registerCommand:@"suggestionsFromTextMessageJson JSON_FILE" disableOnMacOSCustomerBuild:1 code:v112];
    [a1 registerCommand:@"carrierCodeFromCarrierName CARRIER_NAME" disableOnMacOSCustomerBuild:1 code:&stru_100058EC0];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_10000CD70;
    v111[3] = &unk_100058DF8;
    v111[4] = a2;
    v111[5] = a1;
    [a1 registerCommand:@"airportCodeFromAirportName AIRPORT_NAME CARRIER_CODE FLIGHT_NUMBER" disableOnMacOSCustomerBuild:1 code:v111];
    [a1 registerCommand:@"cityForIataCode IATA_CODE" disableOnMacOSCustomerBuild:1 code:&stru_100058EE0];
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472;
    v110[2] = sub_10000D304;
    v110[3] = &unk_100058D40;
    v110[4] = a1;
    [a1 registerCommand:@"isEventCandidate URL TITLE" disableOnMacOSCustomerBuild:1 code:v110];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_10000D640;
    v109[3] = &unk_100058D40;
    v109[4] = a1;
    [a1 registerCommand:@"suggestionsFromHTML PATH URL EXTRACTIONDATE" disableOnMacOSCustomerBuild:1 code:v109];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_10000D6D8;
    v106[3] = &unk_1000590B0;
    id v108 = a1;
    v107 = &stru_100058E60;
    [a1 registerCommand:@"suggestionsJsonLdOutputFromRFC822 FILEPATH (.eml or json with eml file paths)" disableOnMacOSCustomerBuild:1 code:v106];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_10000D7AC;
    v105[3] = &unk_100058D40;
    v105[4] = a1;
    [a1 registerCommand:@"dkimVerificationForEmail FILEPATH [BODY|HEADERS|ALL]" disableOnMacOSCustomerBuild:1 code:v105];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_10000DB1C;
    v102[3] = &unk_1000590B0;
    id v104 = a1;
    v103 = &stru_100058E60;
    [a1 registerCommand:@"ipsosMessagesFromSearchableItems FILEPATH (.eml or json with eml file paths)" disableOnMacOSCustomerBuild:1 code:v102];
    [a1 registerCommand:@"titleSuggestionForMessage MESSAGE_CONTENT" disableOnMacOSCustomerBuild:1 code:&stru_1000590D0];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10000DF28;
    v101[3] = &unk_100058D40;
    v101[4] = a1;
    [a1 registerCommand:@"suggestionsJsonLdOutputFromSMS FILEPATH (.json with text messages)" disableOnMacOSCustomerBuild:1 code:v101];
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_10000DFDC;
    v98[3] = &unk_1000590B0;
    id v100 = a1;
    v99 = &stru_100058E60;
    [a1 registerCommand:@"suggestionsFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v98];
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_10000E0A8;
    v97[3] = &unk_100058D40;
    v97[4] = a1;
    [a1 registerCommand:@"extractAttributesAndDonateMail EML_FILEPATH" disableOnMacOSCustomerBuild:1 code:v97];
    [a1 registerCommand:@"extractAttributesAndDonateMessage [SENDER_NAME] SENDER_PHONE MESSAGE_CONTENT" disableOnMacOSCustomerBuild:1 code:&stru_100059140];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10000E154;
    v96[3] = &unk_100058D40;
    v96[4] = a1;
    [a1 registerCommand:@"mlEventSuggestionsFromTextMessageJson JSON_FILE" disableOnMacOSCustomerBuild:1 code:v96];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10000E2E0;
    v95[3] = &unk_100058DF8;
    v95[4] = a2;
    v95[5] = a1;
    [a1 registerCommand:@"mlEventExtractionForMessageEventDissectorFrom JSON_FILE" disableOnMacOSCustomerBuild:1 code:v95];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10000E8DC;
    v92[3] = &unk_1000590B0;
    id v94 = a1;
    v93 = &stru_100058E60;
    [a1 registerCommand:@"harvestEventFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v92];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10000E9AC;
    v89[3] = &unk_1000590B0;
    id v91 = a1;
    v90 = &stru_100058E60;
    [a1 registerCommand:@"jsEntityFromRFC822 FILEPATH (.eml or json with eml file paths)" disableOnMacOSCustomerBuild:1 code:v89];
    [a1 registerCommand:@"isInhuman emailbody|emailaddress|name string" disableOnMacOSCustomerBuild:1 code:&stru_100059160];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10000EDD4;
    v87[3] = &unk_100058CF8;
    v88 = &stru_100058E60;
    [a1 registerCommand:@"htmlFromRFC822 FILEPATH (eml file, or omit for stdin)", 1, v87 disableOnMacOSCustomerBuild code];
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10000EFE8;
    v84[3] = &unk_1000590B0;
    id v86 = a1;
    v85 = &stru_100058E60;
    [a1 registerCommand:@"reportCorrectness ZIP_FILEPATH OUTPUT_PLIST_PATH" disableOnMacOSCustomerBuild:1 code:v84];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10000F0B4;
    v83[3] = &unk_100058D40;
    void v83[4] = a1;
    [a1 registerCommand:@"suggestionsFromConversation (.json with conversation or json with json file path), can use --preprocess to run without performance bailouts", 1, v83 disableOnMacOSCustomerBuild code];
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10000F168;
    v82[3] = &unk_100058DF8;
    v82[4] = a1;
    v82[5] = a2;
    [a1 registerCommand:@"dissectAttachmentsFromSearchableItem FILEPATH" disableOnMacOSCustomerBuild:1 code:v82];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10000F22C;
    v81[3] = &unk_100058D40;
    v81[4] = a1;
    [a1 registerCommand:@"dbPath" disableOnMacOSCustomerBuild:0 code:v81];
    [a1 registerCommand:@"resetConfirmationHistory" disableOnMacOSCustomerBuild:0 code:&stru_1000591D0];
    [a1 registerCommand:@"rebuildNamesForDetailCache" disableOnMacOSCustomerBuild:0 code:&stru_1000591F0];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10000F2B4;
    v80[3] = &unk_100058D40;
    void v80[4] = a1;
    [a1 registerCommand:@"reset" disableOnMacOSCustomerBuild:0 code:v80];
    [a1 registerCommand:@"updateAsset" disableOnMacOSCustomerBuild:0 code:&stru_100059260];
    [a1 registerCommand:@"assetVersion" disableOnMacOSCustomerBuild:0 code:&stru_1000592A8];
    [a1 registerCommand:@"modelAssetVersion" disableOnMacOSCustomerBuild:0 code:&stru_1000592C8];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000104A8;
    v79[3] = &unk_100058D40;
    v79[4] = a1;
    [a1 registerCommand:@"dbSchema" disableOnMacOSCustomerBuild:0 code:v79];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100010B6C;
    v78[3] = &unk_100058D40;
    v78[4] = a1;
    [a1 registerCommand:@"runQueryOnEntities SQL" disableOnMacOSCustomerBuild:1 code:v78];
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_100010C20;
    v77[3] = &unk_100058D40;
    v77[4] = a1;
    [a1 registerCommand:@"dbCheck [PathToSuggestionsDirectory]" disableOnMacOSCustomerBuild:1 code:v77];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100010EBC;
    v76[3] = &unk_100058D40;
    v76[4] = a1;
    [a1 registerCommand:@"dbStats" disableOnMacOSCustomerBuild:0 code:v76];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100011F94;
    v75[3] = &unk_100058D40;
    v75[4] = a1;
    [a1 registerCommand:@"namesForDetailCaches" disableOnMacOSCustomerBuild:1 code:v75];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100012118;
    v74[3] = &unk_100058D40;
    v74[4] = a1;
    [a1 registerCommand:@"reportDbStats" disableOnMacOSCustomerBuild:0 code:v74];
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100012208;
    v73[3] = &unk_100058D40;
    v73[4] = a1;
    [a1 registerCommand:@"migrateDatabases" disableOnMacOSCustomerBuild:0 code:v73];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10001229C;
    v72[3] = &unk_100058DF8;
    v72[4] = a1;
    v72[5] = a2;
    [a1 registerCommand:@"filesystemMetadata" disableOnMacOSCustomerBuild:0 code:v72];
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000127E8;
    v71[3] = &unk_100058D40;
    v71[4] = a1;
    [a1 registerCommand:@"createEntityStore PATH" disableOnMacOSCustomerBuild:1 code:v71];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100012AA0;
    v70[3] = &unk_100058D40;
    v70[4] = a1;
    [a1 registerCommand:@"allSerializedContacts" disableOnMacOSCustomerBuild:1 code:v70];
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100012B10;
    v69[3] = &unk_100058D40;
    v69[4] = a1;
    [a1 registerCommand:@"updateSerializedContacts" disableOnMacOSCustomerBuild:1 code:v69];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100012B6C;
    v68[3] = &unk_100058D40;
    v68[4] = a1;
    [a1 registerCommand:@"allPrecomputedCNContactMatches" disableOnMacOSCustomerBuild:1 code:v68];
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    void v67[2] = sub_100012D40;
    v67[3] = &unk_100058D40;
    v67[4] = a1;
    [a1 registerCommand:@"updateCNContactMatches" disableOnMacOSCustomerBuild:1 code:v67];
    [a1 registerCommand:@"removeDeprecatedDefaults" disableOnMacOSCustomerBuild:1 code:&stru_1000593E8];
    [a1 registerCommand:@"isEnabled" disableOnMacOSCustomerBuild:0 code:&stru_100059408];
    [a1 registerCommand:@"timingLogs" disableOnMacOSCustomerBuild:1 code:&stru_100059428];
    [a1 registerCommand:@"clearTimingLogs" disableOnMacOSCustomerBuild:1 code:&stru_100059468];
    [a1 registerCommand:@"prepareForRealtimeExtraction" disableOnMacOSCustomerBuild:0 code:&stru_1000594F0];
    [a1 registerCommand:@"prepareForQuery" disableOnMacOSCustomerBuild:0 code:&stru_100059510];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    void v66[2] = sub_100012D9C;
    v66[3] = &unk_100058D40;
    v66[4] = a1;
    [a1 registerCommand:@"RTCLogReset" disableOnMacOSCustomerBuild:1 code:v66];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100012DEC;
    v65[3] = &unk_100058D40;
    v65[4] = a1;
    [a1 registerCommand:@"RTCGetDictionaryExtractions" disableOnMacOSCustomerBuild:1 code:v65];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100012E88;
    v64[3] = &unk_100058D40;
    v64[4] = a1;
    [a1 registerCommand:@"RTCGetDictionaryInteractions" disableOnMacOSCustomerBuild:1 code:v64];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100012F24;
    v63[3] = &unk_100058D40;
    v63[4] = a1;
    [a1 registerCommand:@"RTCGetDictionaryInteractionsSummary" disableOnMacOSCustomerBuild:1 code:v63];
    [a1 registerCommand:@"RTCSendLogs" disableOnMacOSCustomerBuild:0 code:&stru_100059530];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_100012FC0;
    v62[3] = &unk_100058D40;
    v62[4] = a1;
    [a1 registerCommand:@"RTCStoreAge" disableOnMacOSCustomerBuild:0 code:v62];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100013054;
    v59[3] = &unk_1000590B0;
    id v61 = a1;
    uint64_t v60 = &stru_100058E60;
    [a1 registerCommand:@"parseMicrodataToJson FILEPATH (.eml or .html)" disableOnMacOSCustomerBuild:1 code:v59];
    [a1 registerCommand:@"parseNames RAWNAMEFILE OUTFILE" disableOnMacOSCustomerBuild:1 code:&stru_100059550];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100013388;
    v58[3] = &unk_100058D40;
    v58[4] = a1;
    [a1 registerCommand:@"addMessage MESSAGE_FILE ..." disableOnMacOSCustomerBuild:1 code:v58];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100013468;
    v57[3] = &unk_100058DF8;
    v57[4] = a1;
    v57[5] = a2;
    [a1 registerCommand:@"acceptAllFromMessage MESSAGE_FILE" disableOnMacOSCustomerBuild:1 code:v57];
    [a1 registerCommand:@"namesForDetail TEXT [IGNORE_SIGNIFICANCE] [SUPPORTS_INFO_LOOKUP]" disableOnMacOSCustomerBuild:1 code:&stru_100059570];
    [a1 registerCommand:@"interactionStoreLookupForDetail TEXT" disableOnMacOSCustomerBuild:1 code:&stru_100059590];
    [a1 registerCommand:@"namesForDetailWithAdditionalInfo TEXT [IGNORE_SIGNIFICANCE]" disableOnMacOSCustomerBuild:1 code:&stru_1000595D8];
    [a1 registerCommand:@"contactMatchesWithMessagingPrefix PREFIX" disableOnMacOSCustomerBuild:1 code:&stru_1000595F8];
    [a1 registerCommand:@"contactMatchesWithFullTextSearch TEXT" disableOnMacOSCustomerBuild:1 code:&stru_100059618];
    [a1 registerCommand:@"contactMatchesByPhoneNumber NUMBER" disableOnMacOSCustomerBuild:1 code:&stru_100059638];
    [a1 registerCommand:@"contactMatchesByEmailAddress EMAIL" disableOnMacOSCustomerBuild:1 code:&stru_100059658];
    [a1 registerCommand:@"contactMatchesBySocialProfile BUNDLE_IDENTIFIER USER_NAME [USER_IDENTIFIER DISPLAY_NAME SERVICE TEAM_IDENTIFIER]" disableOnMacOSCustomerBuild:1 code:&stru_100059678];
    [a1 registerCommand:@"birthdayExtractionsByStartDate startDate endDate" disableOnMacOSCustomerBuild:1 code:&stru_100059698];
    [a1 registerCommand:@"celebrationExtractionsByStartDate startDate endDate" disableOnMacOSCustomerBuild:1 code:&stru_1000596B8];
    [a1 registerCommand:@"contactFromRecordID RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_1000596D8];
    [a1 registerCommand:@"registerContactWithRecents NAME PHONE/EMAIL" disableOnMacOSCustomerBuild:1 code:&stru_100059720];
    [a1 registerCommand:@"cnContactMatchesForRecordId RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059768];
    [a1 registerCommand:@"cnContactMatchesForRecordIds RECORD_ID ..." disableOnMacOSCustomerBuild:1 code:&stru_100059788];
    [a1 registerCommand:@"contactMatchesWithContact FIRST_NAME LAST_NAME EMAIL PHONE POSTAL_ADDRESS" disableOnMacOSCustomerBuild:1 code:&stru_1000597E8];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100013968;
    v56[3] = &unk_100058D40;
    v56[4] = a1;
    [a1 registerCommand:@"contactMatchesWithMeContact" disableOnMacOSCustomerBuild:1 code:v56];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100013CB0;
    v55[3] = &unk_100058D40;
    v55[4] = a1;
    [a1 registerCommand:@"contactMatchesWithPeopleWhoShareMyName" disableOnMacOSCustomerBuild:1 code:v55];
    [a1 registerCommand:@"contactMatchesWithContactIdentifier IDENTIFIER_STRING" disableOnMacOSCustomerBuild:1 code:&stru_100059808];
    [a1 registerCommand:@"allContacts" disableOnMacOSCustomerBuild:1 code:&stru_100059828];
    [a1 registerCommand:@"allEvents" disableOnMacOSCustomerBuild:1 code:&stru_100059848];
    [a1 registerCommand:@"allEventsInEmlFiles" disableOnMacOSCustomerBuild:1 code:&stru_100059868];
    [a1 registerCommand:@"allEventsOnCalendars" disableOnMacOSCustomerBuild:1 code:&stru_100059918];
    [a1 registerCommand:@"geocodeLocation" disableOnMacOSCustomerBuild:1 code:&stru_100059938];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10001401C;
    v54[3] = &unk_100058DF8;
    v54[4] = a1;
    v54[5] = a2;
    [a1 registerCommand:@"geocodeEventsFromRFC822" disableOnMacOSCustomerBuild:1 code:v54];
    [a1 registerCommand:@"addInteractionFromSchema JSON_FILE (optional BUNDLE_ID)" disableOnMacOSCustomerBuild:1 code:&stru_1000599A8];
    [a1 registerCommand:@"allReminders" disableOnMacOSCustomerBuild:1 code:&stru_1000599F0];
    [a1 registerCommand:@"foundInStringForRecordId RECORD_ID STYLE" disableOnMacOSCustomerBuild:1 code:&stru_100059A10];
    [a1 registerCommand:@"reminderTitleForContent TEXT_CONTENT" disableOnMacOSCustomerBuild:1 code:&stru_100059A30];
    [a1 registerCommand:@"logUserCreatedReminderTitle TITLE" disableOnMacOSCustomerBuild:1 code:&stru_100059A50];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000140DC;
    v53[3] = &unk_100058D40;
    v53[4] = a1;
    [a1 registerCommand:@"allDeliveries" disableOnMacOSCustomerBuild:1 code:v53];
    [a1 registerCommand:@"recentURLs" disableOnMacOSCustomerBuild:1 code:&stru_100059A70];
    [a1 registerCommand:@"urlsFoundBetween STARTDATE ENDDATE (optional EXCLUDING_BUNDLE_1 ...)" disableOnMacOSCustomerBuild:1 code:&stru_100059A90];
    [a1 registerCommand:@"urlsFoundContaining SUBSTRING (optional FLAG_FILTER)" disableOnMacOSCustomerBuild:1 code:&stru_100059AB0];
    [a1 registerCommand:@"registerURLFeedback URL (ENGAGED|OFFERED|REJECTED)" disableOnMacOSCustomerBuild:1 code:&stru_100059AD0];
    [a1 registerCommand:@"waitForURLChange" disableOnMacOSCustomerBuild:1 code:&stru_100059AF0];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100014614;
    v52[3] = &unk_100058D40;
    v52[4] = a1;
    [a1 registerCommand:@"dumpCNContactStore" disableOnMacOSCustomerBuild:1 code:v52];
    [a1 registerCommand:@"originFromRecordId RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059B78];
    [a1 registerCommand:@"confirmRecord RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059BC0];
    [a1 registerCommand:@"rejectRecord RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059BE0];
    [a1 registerCommand:@"confirmContactDetailRecord RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059C00];
    [a1 registerCommand:@"rejectContactDetailRecord RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059C20];
    [a1 registerCommand:@"calendarEventsForDate YYYYMMDD" disableOnMacOSCustomerBuild:1 code:&stru_100059C40];
    [a1 registerCommand:@"confirmEventByRecordId RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059CA0];
    [a1 registerCommand:@"rejectEventByRecordId RECORD_ID" disableOnMacOSCustomerBuild:1 code:&stru_100059CC0];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000147A4;
    v51[3] = &unk_100058D40;
    v51[4] = a1;
    [a1 registerCommand:@"setMessagesToProcessImmediately N" disableOnMacOSCustomerBuild:1 code:v51];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100014880;
    v50[3] = &unk_100058D40;
    v50[4] = a1;
    [a1 registerCommand:@"dirtyTest" disableOnMacOSCustomerBuild:1 code:v50];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100014958;
    v49[3] = &unk_100058D40;
    v49[4] = a1;
    [a1 registerCommand:@"mergeHighlights" disableOnMacOSCustomerBuild:1 code:v49];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100014E84;
    v48[3] = &unk_100058D40;
    v48[4] = a1;
    [a1 registerCommand:@"createRelatedCNContacts NUMBER" disableOnMacOSCustomerBuild:1 code:v48];
    [a1 registerCommand:@"isEmailAddressSignificant EMAIL" disableOnMacOSCustomerBuild:1 code:&stru_100059D30];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000153A8;
    v47[3] = &unk_100058D40;
    v47[4] = a1;
    [a1 registerCommand:@"addEmailToRecipientsFilter EMAIL" disableOnMacOSCustomerBuild:1 code:v47];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000154FC;
    v46[3] = &unk_100058D40;
    v46[4] = a1;
    [a1 registerCommand:@"checkForEmailInRecipientsFilter EMAIL" disableOnMacOSCustomerBuild:1 code:v46];
    [a1 registerCommand:@"refreshLost" disableOnMacOSCustomerBuild:1 code:&stru_100059D78];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100015664;
    v45[3] = &unk_100058D40;
    v45[4] = a1;
    [a1 registerCommand:@"setShowPastEvents 1|0" disableOnMacOSCustomerBuild:1 code:v45];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100015738;
    v44[3] = &unk_100058D40;
    v44[4] = a1;
    [a1 registerCommand:@"setAlwaysShowCancelledEvents 1|0" disableOnMacOSCustomerBuild:1 code:v44];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10001580C;
    v43[3] = &unk_100058D40;
    v43[4] = a1;
    [a1 registerCommand:@"setOnlyShowSignificantPseudoContacts 1|0" disableOnMacOSCustomerBuild:1 code:v43];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000158E0;
    v42[3] = &unk_100058D40;
    v42[4] = a1;
    [a1 registerCommand:@"setOnlyShowSignificantNLEvents 1|0" disableOnMacOSCustomerBuild:1 code:v42];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000159B4;
    v41[3] = &unk_100058D40;
    v41[4] = a1;
    [a1 registerCommand:@"setAllowAgeBasedPruning 1|0" disableOnMacOSCustomerBuild:1 code:v41];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100015A88;
    v40[3] = &unk_100058D40;
    v40[4] = a1;
    [a1 registerCommand:@"setUseMLModelForContacts 1|0" disableOnMacOSCustomerBuild:1 code:v40];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100015B5C;
    v39[3] = &unk_100058D40;
    v39[4] = a1;
    [a1 registerCommand:@"setAllowUnverifiedSourceForMarkup 1|0" disableOnMacOSCustomerBuild:1 code:v39];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100015C30;
    v38[3] = &unk_100058D40;
    v38[4] = a1;
    [a1 registerCommand:@"setAllowAnyDomainForMarkup 1|0" disableOnMacOSCustomerBuild:1 code:v38];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100015D04;
    v37[3] = &unk_100058D40;
    v37[4] = a1;
    [a1 registerCommand:@"setHarvestBudgetNumberOfOperations NUMBER_OF_OPERATIONS" disableOnMacOSCustomerBuild:1 code:v37];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100015DC8;
    v36[3] = &unk_100058D40;
    v36[4] = a1;
    [a1 registerCommand:@"setHarvestBudgetCPUTimeSeconds CPUTimeSeconds" disableOnMacOSCustomerBuild:1 code:v36];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100015E94;
    v35[3] = &unk_100058DF8;
    v35[4] = a1;
    v35[5] = a2;
    [a1 registerCommand:@"sanityCheckDaemonConnection" disableOnMacOSCustomerBuild:1 code:v35];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100016B30;
    v34[3] = &unk_100058DF8;
    v34[4] = a1;
    v34[5] = a2;
    [a1 registerCommand:@"smokeTestXpcAutorelease" disableOnMacOSCustomerBuild:1 code:v34];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100016CF4;
    v33[3] = &unk_100058D40;
    v33[4] = a1;
    [a1 registerCommand:@"monitorNotifications" disableOnMacOSCustomerBuild:1 code:v33];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100016DB4;
    v32[3] = &unk_100058DF8;
    v32[4] = a1;
    v32[5] = a2;
    [a1 registerCommand:@"testChangeNotifications" disableOnMacOSCustomerBuild:1 code:v32];
    [a1 registerCommand:@"permafailList" disableOnMacOSCustomerBuild:1 code:&stru_100059F78];
    [a1 registerCommand:@"permafailView FILEPATH" disableOnMacOSCustomerBuild:1 code:&stru_100059F98];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000171EC;
    v31[3] = &unk_100058D40;
    v31[4] = a1;
    [a1 registerCommand:@"permafailDissect FILEPATH" disableOnMacOSCustomerBuild:1 code:v31];
    [a1 registerCommand:@"addInteraction TYPE IN_OR_OUT HANDLE (optional DISPLAY_NAME)" disableOnMacOSCustomerBuild:1 code:&stru_100059FF8];
    [a1 registerCommand:@"deleteInteractionsWithIdentifiers IDENTIFIERS bundleID" disableOnMacOSCustomerBuild:1 code:&stru_10005A040];
    [a1 registerCommand:@"deleteInteractionsWithGroupIdentifiers GROUP_IDENTIFIERS bundleID" disableOnMacOSCustomerBuild:1 code:&stru_10005A060];
    [a1 registerCommand:@"deleteInteractionsWithBundleID bundleID" disableOnMacOSCustomerBuild:1 code:&stru_10005A080];
    [a1 registerCommand:@"testEventsForSchemas" disableOnMacOSCustomerBuild:1 code:&stru_10005A0A0];
    [a1 registerCommand:@"clearCaches" disableOnMacOSCustomerBuild:0 code:&stru_10005A0E8];
    [a1 registerCommand:@"produceExampleHashing" disableOnMacOSCustomerBuild:1 code:&stru_10005A108];
    [a1 registerCommand:@"convertStringForModel" disableOnMacOSCustomerBuild:1 code:&stru_10005A128];
    [a1 registerCommand:@"hashVectorizeStringForModel" disableOnMacOSCustomerBuild:1 code:&stru_10005A148];
    [a1 registerCommand:@"runTrysteroPlan SERIALIZED_PLAN_PATH" disableOnMacOSCustomerBuild:1 code:&stru_10005A168];
    [a1 registerCommand:@"runEspressoTrainingPlan RECIPE_JSON SERIALIZED_PLAN_PATH ESPRESSO_MODEL_PATH" disableOnMacOSCustomerBuild:1 code:&stru_10005A1B0];
    [a1 registerBoolPreferenceCommand:@"detectContacts" disableOnMacOSCustomerBuild:1 getter:&stru_10005A1D0 setter:&stru_10005A210];
    [a1 registerBoolPreferenceCommand:@"detectNLEvents" disableOnMacOSCustomerBuild:1 getter:&stru_10005A230 setter:&stru_10005A250];
    [a1 registerBoolPreferenceCommand:@"detectStructuredEvents" disableOnMacOSCustomerBuild:1 getter:&stru_10005A270 setter:&stru_10005A290];
    [a1 registerBoolPreferenceCommand:@"detectReminders" disableOnMacOSCustomerBuild:1 getter:&stru_10005A2B0 setter:&stru_10005A2D0];
    [a1 registerBoolPreferenceCommand:@"detectStructuredEventsML" disableOnMacOSCustomerBuild:1 getter:&stru_10005A2F0 setter:&stru_10005A310];
    [a1 registerBoolPreferenceCommand:@"detectRemindersInMail" disableOnMacOSCustomerBuild:1 getter:&stru_10005A330 setter:&stru_10005A350];
    [a1 registerBoolPreferenceCommand:@"enableEventsMLRegexEnsembleExtraction" disableOnMacOSCustomerBuild:1 getter:&stru_10005A370 setter:&stru_10005A390];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100017518;
    v30[3] = &unk_100058D40;
    v30[4] = a1;
    [a1 registerCommand:@"tabCompletions" disableOnMacOSCustomerBuild:1 code:v30];
    [a1 registerCommand:@"deleteCloudKitZone" disableOnMacOSCustomerBuild:0 code:&stru_10005A3B0];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100017520;
    v29[3] = &unk_100058D40;
    v29[4] = a1;
    [a1 registerCommand:@"useManateeSaltForHistory 0|1" disableOnMacOSCustomerBuild:1 code:v29];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001764C;
    v28[3] = &unk_100058D40;
    v28[4] = a1;
    [a1 registerCommand:@"showOperatingSystemVersionInSnippets 0|1" disableOnMacOSCustomerBuild:1 code:v28];
    [a1 registerCommand:@"topSalientMails" disableOnMacOSCustomerBuild:1 code:&stru_10005A3D0];
    [a1 registerCommand:@"magicUnsubscribeCandidates" disableOnMacOSCustomerBuild:1 code:&stru_10005A3F0];
    [a1 registerCommand:@"preventMagicUnsubscribe" disableOnMacOSCustomerBuild:1 code:&stru_10005A410];
    [a1 registerCommand:@"mailOmissionDetection" disableOnMacOSCustomerBuild:1 code:&stru_10005A430];
    [a1 registerCommand:@"runSGMIOnPersonalEmails" disableOnMacOSCustomerBuild:1 code:&stru_10005A450];
    [a1 registerCommand:@"resetAndEvaluateMailIntelligenceDetection" disableOnMacOSCustomerBuild:1 code:&stru_10005A470];
    [a1 registerCommand:@"realTimeFollowUp" disableOnMacOSCustomerBuild:1 code:&stru_10005A490];
    [a1 registerCommand:@"realTimeFollowUpNewSPI" disableOnMacOSCustomerBuild:1 code:&stru_10005A4B0];
    [a1 registerCommand:@"registerValueForSGMailIntelligenceFeatureSetting" disableOnMacOSCustomerBuild:1 code:&stru_10005A4D0];
    [a1 registerCommand:@"feedbackSPIForFollowUp" disableOnMacOSCustomerBuild:1 code:&stru_10005A4F0];
    [a1 registerCommand:@"mailDetectFollowUp" disableOnMacOSCustomerBuild:1 code:&stru_10005A510];
    [a1 registerCommand:@"mailDetectedFollowUps" disableOnMacOSCustomerBuild:1 code:&stru_10005A530];
    [a1 registerCommand:@"mailLastFollowUpWarningResultsWithLimit" disableOnMacOSCustomerBuild:1 code:&stru_10005A550];
    [a1 registerCommand:@"resetMailSaliencyFeature" disableOnMacOSCustomerBuild:1 code:&stru_10005A570];
    [a1 registerCommand:@"mailFeaturesFromRFC822" disableOnMacOSCustomerBuild:1 code:&stru_10005A590];
    [a1 registerCommand:@"mailSaliencyFromRFC822" disableOnMacOSCustomerBuild:1 code:&stru_10005A5B0];
    [a1 registerCommand:@"mailSaliencySetHighEngagement" disableOnMacOSCustomerBuild:1 code:&stru_10005A5D0];
    [a1 registerCommand:@"mailSaliencySetHighEngagementToMessageIdsList" disableOnMacOSCustomerBuild:1 code:&stru_10005A5F0];
    [a1 registerCommand:@"mailSaliencyFeature" disableOnMacOSCustomerBuild:1 code:&stru_10005A610];
    [a1 registerCommand:@"mailSaliencySubmodelProbabilities" disableOnMacOSCustomerBuild:1 code:&stru_10005A630];
    [a1 registerCommand:@"mailSaliencyModelIntrospection" disableOnMacOSCustomerBuild:1 code:&stru_10005A650];
    [a1 registerCommand:@"mailSaliencyStats" disableOnMacOSCustomerBuild:1 code:&stru_10005A670];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100017778;
    v27[3] = &unk_100058D40;
    void v27[4] = a1;
    [a1 registerCommand:@"miSalientMails -m MAILBOX_ID -l LIMIT -w -a" disableOnMacOSCustomerBuild:1 code:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100017E3C;
    v26[3] = &unk_100058D40;
    v26[4] = a1;
    [a1 registerCommand:@"miMagicUnsubscribeCandidates -mc MIN_COUNT -ms MIN_SCORE -l LIMIT" disableOnMacOSCustomerBuild:1 code:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000183F0;
    v25[3] = &unk_100058D40;
    v25[4] = a1;
    [a1 registerCommand:@"miPreventMagicUnsubscribe FIELD COMMA_SEPARATED_VALUES" disableOnMacOSCustomerBuild:1 code:v25];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000185A8;
    v24[3] = &unk_100058D40;
    v24[4] = a1;
    [a1 registerCommand:@"miOmissionDetection SUBJECT CONTENT [options]" disableOnMacOSCustomerBuild:1 code:v24];
    [a1 registerCommand:@"miRunOnPersonalEmails LIMIT -language LANGUAGE" disableOnMacOSCustomerBuild:1 code:&stru_10005A6F8];
    [a1 registerCommand:@"miResetAndEvaluate DB_PATH CONTACT_FILE_PATH OUTPUT_FILE_PATH SELECTION VERBOSITY" disableOnMacOSCustomerBuild:1 code:&stru_10005A7A8];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100018F40;
    v23[3] = &unk_100058D40;
    v23[4] = a1;
    [a1 registerCommand:@"miFollowUp SUBJECT BODY [options]" disableOnMacOSCustomerBuild:1 code:v23];
    [a1 registerCommand:@"miRegisterSetting VALUE FEATURE_NAME" disableOnMacOSCustomerBuild:1 code:&stru_10005A7C8];
    [a1 registerCommand:@"miFeedbackSPIForFollowUp VALUE BODY" disableOnMacOSCustomerBuild:1 code:&stru_10005A7E8];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000193C0;
    v22[3] = &unk_100058D40;
    v22[4] = a1;
    [a1 registerCommand:@"miDetectFollowUp DATE BODY IS_SENT" disableOnMacOSCustomerBuild:1 code:v22];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100019838;
    void v21[3] = &unk_100058D40;
    v21[4] = a1;
    [a1 registerCommand:@"miReset" disableOnMacOSCustomerBuild:1 code:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100019888;
    v19[3] = &unk_100058CF8;
    id v20 = &stru_100058E60;
    [a1 registerCommand:@"miFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v19];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100019B68;
    v16[3] = &unk_1000590B0;
    id v17 = &stru_100058E60;
    id v18 = a1;
    [a1 registerCommand:@"miSaliencyFromRFC822 FILEPATH" disableOnMacOSCustomerBuild:1 code:v16];
    [a1 registerCommand:@"miPreprocessingForOfflineTraining INPUT_FOLDER_PATH OUTPUT_FOLDER_PATH" disableOnMacOSCustomerBuild:1 code:&stru_10005A808];
    [a1 registerCommand:@"miSetHighEngagement SENDER_EMAIL" disableOnMacOSCustomerBuild:1 code:&stru_10005A870];
    [a1 registerCommand:@"miSetHighEngagementToMessageIdsList COMMA_SEPARATED_MSG_IDS_LIST" disableOnMacOSCustomerBuild:1 code:&stru_10005A8B8];
    [a1 registerCommand:@"miSpotlightSaliencyFeature SPOTLIGHT_UNIQUE_IDENTIFIER FEATURE_NAME" disableOnMacOSCustomerBuild:1 code:&stru_10005A8D8];
    [a1 registerCommand:@"miSpotlightSubmodelProbabilities SPOTLIGHT_UNIQUE_IDENTIFIER " disableOnMacOSCustomerBuild:1 code:&stru_10005A8F8];
    [a1 registerCommand:@"miIntrospection" disableOnMacOSCustomerBuild:1 code:&stru_10005A918];
    [a1 registerCommand:@"miStats" disableOnMacOSCustomerBuild:1 code:&stru_10005A938];
    [a1 registerCommand:@"miPerformIncrementalTrainingsOnFakeData TRAINING_COUNT TESTING_COUNT (params are optional)" disableOnMacOSCustomerBuild:1 code:&stru_10005A958];
    [a1 registerCommand:@"downloadAssets" disableOnMacOSCustomerBuild:1 code:&stru_10005A978];
    [a1 registerCommand:@"base64ProtoToJSON className base64Data" disableOnMacOSCustomerBuild:1 code:&stru_10005AA00];
    [a1 registerCommand:@"decodePETMessages [className=*] [jsonFormat=YES]" disableOnMacOSCustomerBuild:1 code:&stru_10005AA20];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100019E0C;
    v15[3] = &unk_100058D40;
    v15[4] = a1;
    [a1 registerCommand:@"setEnableDKIMEnforcement 1|0" disableOnMacOSCustomerBuild:1 code:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100019EE0;
    v13[3] = &unk_10005AA88;
    id v8 = [objc_alloc((Class)_PASLazyResult) initWithBlock:&stru_10005AA60];
    id v14 = v8;
    [a1 registerCommand:@"eventUpdateCategories" disableOnMacOSCustomerBuild:1 code:v13];
    [a1 registerCommand:@"resetEventUpdateCategories" disableOnMacOSCustomerBuild:1 code:&stru_10005AAA8];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001A190;
    v10[3] = &unk_10005AAD0;
    id v11 = v8;
    id v12 = a1;
    id v9 = v8;
    [a1 registerCommand:@"setEventUpdateCategories" disableOnMacOSCustomerBuild:1 code:v10];
  }
}

+ (void)registerBoolPreferenceCommand:(id)a3 disableOnMacOSCustomerBuild:(BOOL)a4 getter:(id)a5 setter:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = [v10 stringByAppendingString:@" [0|1]"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  void v17[2] = sub_100036F5C;
  v17[3] = &unk_100058D20;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v21 = a1;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  [a1 registerCommand:v13 disableOnMacOSCustomerBuild:v8 code:v17];
}

+ (void)registerCommand:(id)a3 disableOnMacOSCustomerBuild:(BOOL)a4 code:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 componentsSeparatedByString:@" "];
  id v10 = [v9 objectAtIndexedSubscript:0];

  if (v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000372A8;
    v16[3] = &unk_100058CF8;
    id v17 = v7;
    id v11 = objc_retainBlock(v16);
    [(id)qword_10006A7C0 setObject:v11 forKeyedSubscript:v10];

    CFStringRef v12 = @" (internal only on macOS)";
  }
  else
  {
    id v13 = objc_retainBlock(v7);
    [(id)qword_10006A7C0 setObject:v13 forKeyedSubscript:v10];

    CFStringRef v12 = &stru_10005B0F8;
  }
  id v14 = (void *)qword_10006A7C8;
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v8, v12];

  [v14 addObject:v15];
}

+ (void)allowPastAndCancelledEventsWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  [a1 beSameUserAsSuggestd];
  id v5 = +[SGPreferenceStorage showPastEvents];
  id v6 = +[SGPreferenceStorage alwaysShowCancelledEvents];
  id v7 = +[SGPreferenceStorage detectReminders];
  +[SGPreferenceStorage setShowPastEvents:1];
  +[SGPreferenceStorage setAlwaysShowCancelledEvents:1];
  +[SGPreferenceStorage setDetectReminders:1];
  v4[2](v4);

  +[SGPreferenceStorage setShowPastEvents:v5];
  +[SGPreferenceStorage setAlwaysShowCancelledEvents:v6];

  +[SGPreferenceStorage setDetectReminders:v7];
}

+ (id)searchableItemFromDictionary:(id)a3
{
  id v5 = a3;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100037A38;
  v49[3] = &unk_100058CD0;
  v49[4] = a2;
  void v49[5] = a1;
  v48 = objc_retainBlock(v49);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"conversationId"];
  if (!v6)
  {
    id v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1055 description:@"JSON key \"conversationId\" is required"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1056 description:@"conversationId must be a string"];
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"textContent"];
  if (!v7)
  {
    long long v35 = +[NSAssertionHandler currentHandler];
    [v35 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1059 description:@"JSON key \"textContent\" is required"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1060 description:@"textContent must be a string"];
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:@"sender"];
  if (!v8)
  {
    id v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1063 description:@"JSON key \"sender\" is required"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1064 description:@"sender must be a dictionary"];
  }
  id v9 = objc_msgSend(v5, "objectForKeyedSubscript:", @"recipients", v8);
  if (!v9)
  {
    id v39 = +[NSAssertionHandler currentHandler];
    [v39 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1067 description:@"JSON key \"recipients\" is required"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v40 = +[NSAssertionHandler currentHandler];
    [v40 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1068 description:@"recipients must be an array"];
  }
  id v10 = [v5 objectForKeyedSubscript:@"accountHandles"];
  if (!v10)
  {
    +[NSAssertionHandler currentHandler];
    uint64_t v41 = v7;
    v43 = uint64_t v42 = v6;
    [v43 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1071 description:@"JSON key \"accountHandles\" is required"];

    uint64_t v6 = v42;
    uint64_t v7 = v41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NSAssertionHandler currentHandler];
    uint64_t v44 = v7;
    id v46 = v45 = v6;
    [v46 handleFailureInMethod:a2 object:a1 file:@"suggest_tool.m" lineNumber:1072 description:@"accountHandles must be an array"];

    uint64_t v6 = v45;
    uint64_t v7 = v44;
  }
  id v11 = a1;
  if ([v10 count])
  {
    [v10 firstObject];
    uint64_t v12 = v7;
    v14 = uint64_t v13 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v6 = v13;
    uint64_t v7 = v12;
    if ((isKindOfClass & 1) == 0)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2 object:v11 file:@"suggest_tool.m" lineNumber:1073 description:@"accountHandles must contain strings"];
    }
  }
  id v17 = objc_opt_new();
  id v18 = [v17 attributeSet];
  id v19 = (void *)v7;
  [v18 setTextContent:v7];

  id v20 = (void *)v6;
  [v17 setDomainIdentifier:v6];
  id v21 = ((void (*)(void *, void *))v48[2])(v48, v47);
  uint64_t v50 = v21;
  id v22 = +[NSArray arrayWithObjects:&v50 count:1];
  id v23 = [v17 attributeSet];
  [v23 setAuthors:v22];

  id v24 = sgMap();
  id v25 = [v17 attributeSet];
  [v25 setPrimaryRecipients:v24];

  long long v26 = [v17 attributeSet];
  [v26 setAccountHandles:v10];

  v27 = [v5 objectForKeyedSubscript:@"date"];

  if (v27)
  {
    unsigned __int8 v28 = objc_opt_new();
    id v29 = [v5 objectForKeyedSubscript:@"date"];
    id v30 = [v28 dateFromString:v29];
    id v31 = [v17 attributeSet];
    [v31 setContentCreationDate:v30];
  }

  return v17;
}

@end