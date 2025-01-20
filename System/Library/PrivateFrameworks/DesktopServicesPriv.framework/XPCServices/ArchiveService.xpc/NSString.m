@interface NSString
+ (BOOL)ds_fileNameHasClaimedFileExtension:(id)a3;
+ (id)ds_commonParentPathForItemURLs:(id)a3;
@end

@implementation NSString

+ (id)ds_commonParentPathForItemURLs:(id)a3
{
  id v19 = a3;
  if ([v19 count])
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = sub_10000D934;
    v36 = sub_10000D944;
    v3 = [v19 firstObject];
    v4 = [v3 URLByDeletingLastPathComponent];
    id v37 = [v4 pathComponents];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = objc_msgSend(v19, "subarrayWithRange:", 1, (char *)objc_msgSend(v19, "count") - 1);
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [*(id *)(*((void *)&v28 + 1) + 8 * i) pathComponents];
          uint64_t v24 = 0;
          v25 = &v24;
          uint64_t v26 = 0x2020000000;
          char v27 = 0;
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10000D94C;
          v20[3] = &unk_10002CFB8;
          v22 = &v32;
          v23 = &v24;
          id v10 = v9;
          id v21 = v10;
          [v10 enumerateObjectsUsingBlock:v20];
          if (!*((unsigned char *)v25 + 24))
          {
            if ([v10 count])
            {
              uint64_t v11 = objc_msgSend(v10, "subarrayWithRange:", 0, (char *)objc_msgSend(v10, "count") - 1);
              v12 = (void *)v33[5];
              v33[5] = v11;
            }
            else
            {
              v13 = v5;
              v14 = v33;
              id v15 = v10;
              v12 = (void *)v14[5];
              v14[5] = (uint64_t)v15;
              v5 = v13;
            }
          }
          _Block_object_dispose(&v24, 8);
        }
        id v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v6);
    }

    v16 = +[NSString pathWithComponents:v33[5]];
    if (([v16 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v17 = [v16 stringByAppendingString:@"/"];

      v16 = (void *)v17;
    }
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)ds_fileNameHasClaimedFileExtension:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathExtension];
  if ([v4 length])
  {
    v5 = [v3 pathExtension];
    id v6 = +[UTType typeWithFilenameExtension:v5 conformingToType:UTTypeItem];

    if ([v6 isDeclared])
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = objc_alloc((Class)LSClaimBinding);
      v9 = [v6 identifier];
      id v10 = [v8 initWithTypeIdentifier:v9 error:0];

      uint64_t v11 = [v10 bundleRecord];
      v12 = [v11 executableURL];

      BOOL v7 = v12 != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end