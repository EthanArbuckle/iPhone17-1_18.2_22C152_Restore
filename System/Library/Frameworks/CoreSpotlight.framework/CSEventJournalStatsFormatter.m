@interface CSEventJournalStatsFormatter
+ (id)tabulateStats:(id)a3;
@end

@implementation CSEventJournalStatsFormatter

+ (id)tabulateStats:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v47 = v3;
    id obj = v3;
    id v49 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v85;
      v64 = v4;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v85 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = v5;
          uint64_t v6 = *(void *)(*((void *)&v84 + 1) + 8 * v5);
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          uint64_t v59 = v6;
          objc_msgSend(obj, "objectForKeyedSubscript:");
          id v51 = (id)objc_claimAutoreleasedReturnValue();
          id v53 = [v51 countByEnumeratingWithState:&v80 objects:v90 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v81;
            do
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v81 != v52) {
                  objc_enumerationMutation(v51);
                }
                uint64_t v55 = v7;
                uint64_t v8 = *(void *)(*((void *)&v80 + 1) + 8 * v7);
                id v54 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@", v59, v8];
                v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:\n", [v54 UTF8String]);
                [v4 addObject:v9];

                v10 = [obj objectForKeyedSubscript:v59];
                uint64_t v58 = v8;
                v11 = [v10 objectForKeyedSubscript:v8];
                v12 = [v11 allKeys];
                v13 = [v12 sortedArrayUsingComparator:&stru_1000DC238];

                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                id v56 = v13;
                id v61 = [v56 countByEnumeratingWithState:&v76 objects:v89 count:16];
                if (v61)
                {
                  uint64_t v57 = *(void *)v77;
                  do
                  {
                    uint64_t v14 = 0;
                    do
                    {
                      if (*(void *)v77 != v57) {
                        objc_enumerationMutation(v56);
                      }
                      uint64_t v62 = v14;
                      v15 = *(void **)(*((void *)&v76 + 1) + 8 * v14);
                      v16 = [obj objectForKeyedSubscript:v59];
                      v17 = [v16 objectForKeyedSubscript:v58];
                      v18 = [v17 objectForKeyedSubscript:v15];

                      v66 = v18;
                      v19 = [v18 allKeys];
                      v20 = [v19 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

                      id v21 = [v15 UTF8String];
                      id v22 = [v20 count];
                      CFStringRef v23 = &stru_1000DD7E8;
                      if (!v22) {
                        CFStringRef v23 = @"\t<empty>";
                      }
                      v24 = +[NSString stringWithFormat:@"%s[%s]:%@", "    ", v21, v23];
                      [v4 addObject:v24];

                      long long v74 = 0u;
                      long long v75 = 0u;
                      long long v72 = 0u;
                      long long v73 = 0u;
                      id v63 = v20;
                      id v67 = [v63 countByEnumeratingWithState:&v72 objects:v88 count:16];
                      if (v67)
                      {
                        uint64_t v65 = *(void *)v73;
                        do
                        {
                          for (i = 0; i != v67; i = (char *)i + 1)
                          {
                            if (*(void *)v73 != v65) {
                              objc_enumerationMutation(v63);
                            }
                            uint64_t v71 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                            v26 = objc_msgSend(v66, "objectForKeyedSubscript:");
                            id v70 = objc_alloc((Class)NSString);
                            uint64_t v27 = [v26 objectForKeyedSubscript:@"add"];
                            v28 = (void *)v27;
                            if (v27) {
                              v29 = (_UNKNOWN **)v27;
                            }
                            else {
                              v29 = &off_1000E62B8;
                            }
                            v69 = v29;
                            uint64_t v30 = [v26 objectForKeyedSubscript:@"addsWithNeedsEmbeddings"];
                            v31 = (void *)v30;
                            if (v30) {
                              v32 = (_UNKNOWN **)v30;
                            }
                            else {
                              v32 = &off_1000E62B8;
                            }
                            v68 = v32;
                            uint64_t v33 = [v26 objectForKeyedSubscript:@"update"];
                            v34 = (void *)v33;
                            if (v33) {
                              v35 = (_UNKNOWN **)v33;
                            }
                            else {
                              v35 = &off_1000E62B8;
                            }
                            uint64_t v36 = [v26 objectForKeyedSubscript:@"updatesWithNeedsEmbeddings"];
                            v37 = (void *)v36;
                            if (v36) {
                              v38 = (_UNKNOWN **)v36;
                            }
                            else {
                              v38 = &off_1000E62B8;
                            }
                            uint64_t v39 = [v26 objectForKeyedSubscript:@"delete"];
                            v40 = (void *)v39;
                            if (v39) {
                              v41 = (_UNKNOWN **)v39;
                            }
                            else {
                              v41 = &off_1000E62B8;
                            }
                            id v42 = [v70 initWithFormat:@"%s%s[%@]\t-> Adds:%@\tAddsWithNeedsEmbeddings:%@\tUpdates:%@\tUpdatesWithNeedsEmbeddings:%@\tDeletes:%@", "    ", "    ", v71, v69, v68, v35, v38, v41];

                            id v43 = v42;
                            v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v43 UTF8String]);
                            id v4 = v64;
                            [v64 addObject:v44];
                          }
                          id v67 = [v63 countByEnumeratingWithState:&v72 objects:v88 count:16];
                        }
                        while (v67);
                      }

                      [v4 addObject:@"\n"];
                      uint64_t v14 = v62 + 1;
                    }
                    while ((id)(v62 + 1) != v61);
                    id v61 = [v56 countByEnumeratingWithState:&v76 objects:v89 count:16];
                  }
                  while (v61);
                }

                uint64_t v7 = v55 + 1;
              }
              while ((id)(v55 + 1) != v53);
              id v53 = [v51 countByEnumeratingWithState:&v80 objects:v90 count:16];
            }
            while (v53);
          }

          uint64_t v5 = v50 + 1;
        }
        while ((id)(v50 + 1) != v49);
        id v49 = [obj countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v49);
    }

    v45 = [v4 componentsJoinedByString:@"\n"];
    id v3 = v47;
  }
  else
  {
    v45 = @"empty stats";
  }

  return v45;
}

@end