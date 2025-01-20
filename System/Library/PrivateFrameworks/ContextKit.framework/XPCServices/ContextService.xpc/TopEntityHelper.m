@interface TopEntityHelper
+ (id)findNamedEntities:(id)a3;
+ (id)mergeAndSort:(id)a3 usingMergeType:(unint64_t)a4;
+ (void)initialize;
@end

@implementation TopEntityHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [&off_1004B1CF0 componentsJoinedByString:@")|("];
    id v5 = +[NSString stringWithFormat:@"^((%@))\\.?\\s", v2];

    uint64_t v3 = +[NSRegularExpression regularExpressionWithPattern:v5 options:1 error:0];
    v4 = (void *)qword_100563070;
    qword_100563070 = v3;
  }
}

+ (id)findNamedEntities:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSLinguisticTagger);
  NSLinguisticTagScheme v17 = NSLinguisticTagSchemeNameType;
  id v5 = +[NSArray arrayWithObjects:&v17 count:1];
  id v6 = [v4 initWithTagSchemes:v5 options:30];

  [v6 setString:v3];
  v7 = objc_opt_new();
  id v8 = [v3 length];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002B2370;
  v14[3] = &unk_10048BC50;
  id v15 = v3;
  id v9 = v7;
  id v16 = v9;
  id v10 = v3;
  objc_msgSend(v6, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v8, NSLinguisticTagSchemeNameType, 30, v14);
  v11 = v16;
  id v12 = v9;

  return v12;
}

+ (id)mergeAndSort:(id)a3 usingMergeType:(unint64_t)a4
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v44 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v61;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v61 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if ((unint64_t)[v5 count] >= 0x32)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v68 = 50;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Trimmed entity list to count: %lu", buf, 0xCu);
          }
          goto LABEL_19;
        }
        v11 = [v10 name];
        id v12 = [v11 length];

        if ((unint64_t)v12 <= 0x64)
        {
          v13 = [v10 name];
          v14 = v13;
          if (a4 == 1)
          {
            uint64_t v15 = objc_msgSend((id)qword_100563070, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), &stru_10048C1F8);

            v14 = (void *)v15;
          }
          id v16 = [v5 objectForKeyedSubscript:v14];

          if (v16)
          {
            NSLinguisticTagScheme v17 = [v5 objectForKeyedSubscript:v14];
            [(CTKMergedNamedEntity *)v17 mergeWith:v10];
          }
          else
          {
            NSLinguisticTagScheme v17 = [[CTKMergedNamedEntity alloc] initWithEntity:v10];
            [v5 setObject:v17 forKeyedSubscript:v14];
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v42 = v5;
  unint64_t v18 = a4;
  id v41 = [v42 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (!v41) {
    goto LABEL_47;
  }
  uint64_t v40 = *(void *)v57;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v57 != v40) {
        objc_enumerationMutation(v42);
      }
      uint64_t v43 = v19;
      v20 = *(void **)(*((void *)&v56 + 1) + 8 * v19);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v21 = v42;
      id v22 = [v21 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v53;
        uint64_t v46 = *(void *)v53;
        do
        {
          v25 = 0;
          id v47 = v23;
          do
          {
            if (*(void *)v53 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v25);
            if (v20 != v26)
            {
              if (v18 == 1)
              {
                if (![v20 localizedCaseInsensitiveContainsString:*(void *)(*((void *)&v52 + 1) + 8 * (void)v25)])goto LABEL_43; {
              }
                }
              else if (v18 != 2 {
                     || ([*(id *)(*((void *)&v52 + 1) + 8 * (void)v25) localizedCaseInsensitiveContainsString:v20] & 1) == 0)
              }
              {
                goto LABEL_43;
              }
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              v27 = [v21 objectForKeyedSubscript:v26];
              v28 = [v27 sourceNamedEntities];

              id v29 = [v28 countByEnumeratingWithState:&v48 objects:v64 count:16];
              if (v29)
              {
                id v30 = v29;
                uint64_t v31 = *(void *)v49;
                do
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(void *)v49 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    uint64_t v33 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
                    v34 = [v21 objectForKeyedSubscript:v20];
                    [v34 mergeWith:v33];
                  }
                  id v30 = [v28 countByEnumeratingWithState:&v48 objects:v64 count:16];
                }
                while (v30);
              }

              [v44 addObject:v26];
              unint64_t v18 = a4;
              uint64_t v24 = v46;
              id v23 = v47;
            }
LABEL_43:
            v25 = (char *)v25 + 1;
          }
          while (v25 != v23);
          id v23 = [v21 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v23);
      }

      uint64_t v19 = v43 + 1;
    }
    while ((id)(v43 + 1) != v41);
    id v41 = [v21 countByEnumeratingWithState:&v56 objects:v66 count:16];
  }
  while (v41);
LABEL_47:

  v35 = [v44 allObjects];
  [v42 removeObjectsForKeys:v35];

  v36 = [v42 allValues];
  v37 = [v36 sortedArrayUsingSelector:"descendingScoreCompare:"];

  return v37;
}

@end