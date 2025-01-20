@interface CSEventJournalStats
+ (BOOL)enumerateEventsWithProtectionClasses:(id)a3 itemAdds:(id)a4 itemUpdates:(id)a5 itemDeletes:(id)a6 cancelBlock:(id)a7;
+ (id)generateStats;
@end

@implementation CSEventJournalStats

+ (id)generateStats
{
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v23 = [&off_1000E7590 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v42;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(&off_1000E7590);
        }
        uint64_t v24 = v2;
        uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * v2);
        id v25 = objc_alloc_init((Class)NSMutableDictionary);
        unsigned int v3 = 0;
        do
        {
          v28 = sub_100034B70(v3);
          v4 = sub_100034DE0();
          unsigned int v29 = v3;
          uint64_t v5 = [v4 stringByAppendingFormat:@"/%@/%s", v26, sub_100005F74(v3)];

          v27 = (void *)v5;
          v6 = [[SKGJournalReader alloc] initWithResourceDirectoryPath:v5];
          id v7 = objc_alloc_init((Class)NSMutableDictionary);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id obj = [(SKGJournalReader *)v6 eventJournalPaths];
          id v8 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v8)
          {
            id v9 = v8;
            uint64_t v10 = *(void *)v38;
            do
            {
              for (i = 0; i != v9; i = (char *)i + 1)
              {
                if (*(void *)v38 != v10) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                id v13 = objc_alloc_init((Class)NSMutableDictionary);
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_10009DF40;
                v35[3] = &unk_1000DD040;
                id v36 = v13;
                v33[0] = _NSConcreteStackBlock;
                v33[1] = 3221225472;
                v33[2] = sub_10009E1F8;
                v33[3] = &unk_1000DD040;
                id v34 = v36;
                v31[0] = _NSConcreteStackBlock;
                v31[1] = 3221225472;
                v31[2] = sub_10009E218;
                v31[3] = &unk_1000DD068;
                id v32 = v34;
                id v14 = v34;
                [(SKGJournalReader *)v6 enumerateItemsOfJournalAtPath:v12 itemAdds:v35 itemUpdates:v33 itemDeletes:v31 cancelBlock:0];
                id v15 = objc_alloc((Class)NSString);
                v16 = sub_100034DE0();
                id v17 = [v15 initWithFormat:@"%@%@", @"file:///private", v16];

                v18 = [v12 absoluteString];
                v19 = [v18 stringByReplacingOccurrencesOfString:v17 withString:&stru_1000DD7E8];

                [v7 setObject:v14 forKeyedSubscript:v19];
              }
              id v9 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v9);
          }

          [v25 setObject:v7 forKeyedSubscript:v28];
          unsigned int v3 = v29 + 1;
        }
        while (v29 != 5);
        [v22 setObject:v25 forKeyedSubscript:v26];

        uint64_t v2 = v24 + 1;
      }
      while ((id)(v24 + 1) != v23);
      id v23 = [&off_1000E7590 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v23);
  }

  return v22;
}

+ (BOOL)enumerateEventsWithProtectionClasses:(id)a3 itemAdds:(id)a4 itemUpdates:(id)a5 itemDeletes:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v61 = a4;
  id v60 = a5;
  id v59 = a6;
  id v12 = a7;
  uint64_t v13 = sub_100034DE0();
  id v14 = +[NSFileManager defaultManager];
  LODWORD(a5) = [v14 isReadableFileAtPath:v13];

  char v51 = (char)a5;
  v52 = (void *)v13;
  if (a5)
  {
    uint64_t v15 = +[NSURL URLWithString:v13];
    +[NSFileManager defaultManager];
    id v17 = v16 = v11;
    NSURLResourceKey v77 = NSURLNameKey;
    v18 = +[NSArray arrayWithObjects:&v77 count:1];
    v49 = (void *)v15;
    v19 = [v17 enumeratorAtURL:v15 includingPropertiesForKeys:v18 options:4 errorHandler:&stru_1000DD088];

    id v20 = objc_alloc_init((Class)NSMutableSet);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v50 = v16;
    id v21 = v16;
    id v22 = [v21 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v71;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v71 != v24) {
            objc_enumerationMutation(v21);
          }
          unsigned int v26 = sub_100034B80(*(void *)(*((void *)&v70 + 1) + 8 * i));
          if (v26 <= 5)
          {
            v27 = +[NSString stringWithUTF8String:sub_100005F74(v26)];
            [v20 addObject:v27];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v23);
    }

    id v28 = objc_alloc_init((Class)NSMutableSet);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v29 = v19;
    id v58 = [v29 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v58)
    {
      id v56 = v29;
      uint64_t v57 = *(void *)v67;
      char v30 = 1;
      id v54 = v28;
      id v55 = v20;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(void *)v67 != v57) {
            objc_enumerationMutation(v29);
          }
          id v32 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
          v33 = [v32 path];
          unsigned __int8 v34 = [v28 containsObject:v33];

          if ((v34 & 1) == 0)
          {
            v35 = [v32 lastPathComponent];
            unsigned int v36 = [v20 containsObject:v35];

            if (v36)
            {
              long long v37 = [SKGJournalReader alloc];
              long long v38 = [v32 path];
              long long v39 = [(SKGJournalReader *)v37 initWithResourceDirectoryPath:v38];

              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              long long v40 = [(SKGJournalReader *)v39 eventJournalPaths];
              id v41 = [v40 countByEnumeratingWithState:&v62 objects:v74 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v63;
                while (2)
                {
                  for (k = 0; k != v42; k = (char *)k + 1)
                  {
                    if (*(void *)v63 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v45 = *(void *)(*((void *)&v62 + 1) + 8 * (void)k);
                    LODWORD(v45) = [(SKGJournalReader *)v39 enumerateItemsOfJournalAtPath:v45 itemAdds:v61 itemUpdates:v60 itemDeletes:v59 cancelBlock:v12];
                    if (!v45)
                    {
                      char v30 = 0;
                      goto LABEL_28;
                    }
                  }
                  id v42 = [v40 countByEnumeratingWithState:&v62 objects:v74 count:16];
                  if (v42) {
                    continue;
                  }
                  break;
                }
                char v30 = 1;
LABEL_28:
                id v28 = v54;
                id v20 = v55;
              }

              id v29 = v56;
            }
          }
          v47 = [v32 path];
          [v28 addObject:v47];
        }
        id v58 = [v29 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v58);
    }
    else
    {
      char v30 = 1;
    }

    id v11 = v50;
  }
  else
  {
    char v30 = 1;
  }

  return v30 & 1 | ((v51 & 1) == 0);
}

@end