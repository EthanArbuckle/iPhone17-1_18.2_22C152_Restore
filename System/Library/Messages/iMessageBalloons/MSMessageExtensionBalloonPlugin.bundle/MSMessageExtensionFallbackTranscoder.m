@interface MSMessageExtensionFallbackTranscoder
- (id)fallbackInLPFromPayloadDictionary:(id)a3;
- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6;
- (void)fallbackForData:(id)a3 inFileURL:(id)a4 completionBlock:(id)a5;
@end

@implementation MSMessageExtensionFallbackTranscoder

- (id)fallbackInLPFromPayloadDictionary:(id)a3
{
  v3 = [a3 objectForKey:IMExtensionPayloadFallbackLinkMetadataKey];
  if (!v3)
  {
    v8 = 0;
    goto LABEL_11;
  }
  id v13 = 0;
  id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v13];
  id v5 = v13;
  [v4 _enableStrictSecureDecodingMode];
  v6 = [v4 decodeObjectOfClass:IMWeakLinkClass() forKey:NSKeyedArchiveRootObjectKey];
  v7 = v6;
  if (v5 || !v6)
  {
    _IMWarn();
LABEL_8:
    v8 = 0;
    v9 = v7;
    v7 = v4;
    goto LABEL_9;
  }
  v8 = [v6 originalURL];
  v9 = [v8 scheme];
  if (([v9 isEqualToIgnoringCase:@"http"] & 1) == 0)
  {
    v11 = [v8 scheme];
    unsigned __int8 v12 = [v11 isEqualToIgnoringCase:@"https"];

    if (v12) {
      goto LABEL_10;
    }

    goto LABEL_8;
  }
  id v5 = v4;
LABEL_9:

  id v4 = v5;
LABEL_10:

LABEL_11:

  return v8;
}

- (void)fallbackForData:(id)a3 inFileURL:(id)a4 completionBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_20760;
  v9[3] = &unk_3D418;
  id v10 = a5;
  id v8 = v10;
  [(MSMessageExtensionFallbackTranscoder *)self fallbackForData:a3 attachments:0 inFileURL:a4 completionBlockWithText:v9];
}

- (void)fallbackForData:(id)a3 attachments:(id)a4 inFileURL:(id)a5 completionBlockWithText:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v54 = a5;
  id v12 = a6;
  id v13 = IMExtensionPayloadUnarchivingClasses();
  id v60 = 0;
  v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v10 error:&v60];
  id v15 = v60;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [(MSMessageExtensionFallbackTranscoder *)self fallbackInLPFromPayloadDictionary:v14];
    uint64_t v17 = [v14 objectForKey:IMExtensionPayloadURLKey];
  }
  else
  {
    id v44 = v15;
    _IMWarn();
    v16 = 0;
    uint64_t v17 = 0;
  }
  v51 = (void *)v17;
  if (!objc_msgSend(v11, "count", v44) && !v17)
  {
    if (v16)
    {
      [v16 absoluteString];
      v19 = v18 = v16;
      (*((void (**)(id, void, void *, void, uint64_t, uint64_t))v12 + 2))(v12, 0, v19, 0, 1, 1);

      v16 = v18;
    }
    else
    {
      (*((void (**)(id, void, void, void, uint64_t, void))v12 + 2))(v12, 0, 0, 0, 1, 0);
    }
    goto LABEL_37;
  }
  id v49 = v10;
  v50 = v16;
  id v45 = v15;
  v46 = v14;
  v47 = v13;
  v52 = +[NSMutableArray array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v48 = v11;
  id obj = v11;
  id v20 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v20)
  {
    id v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v57;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v26 = objc_msgSend(v25, "im_lastPathComponent");
        v27 = [v54 URLByAppendingPathComponent:v26];

        v28 = +[NSFileManager defaultManager];
        id v55 = 0;
        unsigned __int8 v29 = [v28 copyItemAtURL:v25 toURL:v27 error:&v55];
        id v30 = v55;

        if (v29)
        {
          [v52 addObject:v27];
        }
        else if (v22)
        {
          v31 = [v30 domain];
          uint64_t v32 = v23;
          id v33 = [v30 code];
          NSErrorUserInfoKey v61 = NSUnderlyingErrorKey;
          id v62 = v22;
          +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v34 = v21;
          v36 = v35 = v22;
          id v37 = v33;
          uint64_t v23 = v32;
          uint64_t v38 = +[NSError errorWithDomain:v31 code:v37 userInfo:v36];

          id v21 = v34;
          id v22 = (id)v38;
        }
        else
        {
          id v22 = v30;
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }

  if (v51)
  {
    v39 = [v51 absoluteString];
  }
  else
  {
    v39 = 0;
  }
  id v15 = v45;
  v40 = [v51 scheme];
  if ([v40 isEqualToIgnoringCase:@"http"]) {
    goto LABEL_32;
  }
  v41 = [v51 scheme];
  unsigned __int8 v42 = [v41 isEqualToIgnoringCase:@"https"];

  if ((v42 & 1) == 0)
  {
    if (v50)
    {
      [v50 absoluteString];
      v39 = v40 = v39;
    }
    else
    {
      v40 = v39;
      v39 = 0;
    }
LABEL_32:
    id v10 = v49;

    goto LABEL_33;
  }
  id v10 = v49;
LABEL_33:
  if ([v52 count]) {
    v43 = v52;
  }
  else {
    v43 = 0;
  }
  (*((void (**)(id, void *, void *, id, BOOL, uint64_t))v12 + 2))(v12, v43, v39, v22, v22 == 0, 1);

  id v11 = v48;
  v14 = v46;
  id v13 = v47;
  v16 = v50;
LABEL_37:
}

@end