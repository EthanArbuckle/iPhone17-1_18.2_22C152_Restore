@interface NSString
- (id)_maps_prefixMatchesForSearchString:(id)a3;
@end

@implementation NSString

- (id)_maps_prefixMatchesForSearchString:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  v7 = +[NSMutableArray array];
  id v8 = [v4 length];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100028F44;
  v44[3] = &unk_100082058;
  id v9 = v7;
  id v45 = v9;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 1027, v44);
  v10 = +[NSMutableArray array];
  NSUInteger v11 = [(NSString *)self length];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100028F50;
  v42[3] = &unk_100082058;
  id v12 = v10;
  id v43 = v12;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 1027, v42);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    v31 = v5;
    uint64_t v32 = *(void *)v39;
    context = v6;
    id v28 = v4;
    v30 = v12;
    while (1)
    {
      uint64_t v13 = 0;
LABEL_4:
      if (*(void *)v39 != v32) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v15 = [v12 copy];
      id v16 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (!v16) {
        break;
      }
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
LABEL_8:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
        v21 = [v20 objectAtIndexedSubscript:0];
        v22 = [v20 objectAtIndexedSubscript:1];
        id v23 = [v22 rangeValue];

        if (![v21 localizedStandardRangeOfString:v14]) {
          break;
        }

        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v17) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }
      v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v23, [v14 length]);
      v5 = v31;
      [v31 addObject:v24];

      id v12 = v30;
      [v30 removeObject:v20];

      if ((id)++v13 != v33) {
        goto LABEL_4;
      }
      v6 = context;
      id v4 = v28;
      id v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (!v33) {
        goto LABEL_17;
      }
    }
LABEL_18:

    id v25 = 0;
    id v4 = v28;
    v5 = v31;
  }
  else
  {
LABEL_17:

    id v25 = v5;
  }

  return v25;
}

@end