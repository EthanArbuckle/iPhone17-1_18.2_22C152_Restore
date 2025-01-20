@interface MFMailMessage
+ (id)sg_dos2Unix:(id)a3;
+ (id)sg_messageWithRFC822Data:(id)a3;
+ (void)sg_loadMailCoreFramework;
- (id)sg_allHeaders;
- (id)sg_bestAlternativePart;
@end

@implementation MFMailMessage

- (id)sg_allHeaders
{
  v2 = [(MFMailMessage *)self headers];
  v3 = [v2 allHeaderKeys];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037DE8;
  v8[3] = &unk_100058C50;
  id v9 = v2;
  id v10 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = v10;
  id v5 = v2;
  v6 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v8);

  return v6;
}

- (id)sg_bestAlternativePart
{
  if (+[NSThread isMainThread])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v56 = 0x3032000000;
    v57 = sub_100006C74;
    v58 = sub_100006C84;
    v59 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000383D0;
    block[3] = &unk_10005A020;
    dispatch_semaphore_t v49 = v3;
    p_long long buf = &buf;
    block[4] = self;
    id v5 = v3;
    dispatch_async(v4, block);

    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    v6 = (__CFString *)*(id *)(*((void *)&buf + 1) + 40);

    _Block_object_dispose(&buf, 8);
    v7 = v59;
  }
  else
  {
    v8 = [(MFMailMessage *)self messageBodyIfAvailable];
    uint64_t v47 = 0;
    v38 = v8;
    if (v8)
    {
      id v9 = [v8 topLevelPart];
      id v10 = 0;
      v11 = 0;
      v12 = 0;
      LOBYTE(buf) = 0;
      BOOL v13 = 1;
      while (1)
      {
        if (!v13)
        {
          uint64_t v14 = [v11 contentToOffset:1 resultOffset:&v47 downloadIfNecessary:0 asHTML:1 isComplete:&buf];

          id v15 = v11;
          v12 = (void *)v14;
          id v10 = v15;
        }
        uint64_t v16 = [(MFMailMessage *)self bestAlternativeInPart:v9];

        BOOL v13 = v16 == 0;
        v11 = (void *)v16;
        if (v16)
        {
          v11 = (void *)v16;
          if ((void *)v16 == v10) {
            break;
          }
        }
      }
    }
    else
    {
      v12 = 0;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v12;
    id v17 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v17)
    {
      id v18 = v17;
      v6 = 0;
      uint64_t v19 = *(void *)v44;
      do
      {
        v20 = 0;
        id v39 = v18;
        do
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [v21 htmlData];
            if (v23)
            {
              v24 = v6;
              unsigned int v25 = [v21 preferredEncoding];
              if ([v21 preferredEncoding] == -1) {
                CFStringEncoding v26 = 1536;
              }
              else {
                CFStringEncoding v26 = v25;
              }
              id v27 = v23;
              v28 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)[v27 bytes], (CFIndex)objc_msgSend(v27, "length"), v26, 0);
              if (v28)
              {
                v29 = v28;
                if (v24)
                {
                  uint64_t v30 = [(__CFString *)v24 stringByAppendingString:v28];

                  v6 = (__CFString *)v30;
                }
                else
                {
                  v6 = v28;
                  v29 = v6;
                }
                id v18 = v39;
              }
              else
              {
                NSStringEncodingDetectionOptionsKey v52 = NSStringEncodingDetectionSuggestedEncodingsKey;
                v31 = +[NSNumber numberWithUnsignedLong:CFStringConvertEncodingToNSStringEncoding(v26)];
                v51 = v31;
                v32 = +[NSArray arrayWithObjects:&v51 count:1];
                v53 = v32;
                v33 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];

                char v42 = 0;
                id v41 = 0;
                NSStringEncoding v34 = +[NSString stringEncodingForData:v27 encodingOptions:v33 convertedString:&v41 usedLossyConversion:&v42];
                v29 = (__CFString *)v41;
                if (v42)
                {
                  v35 = sgLogHandle();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    LODWORD(buf) = 134217984;
                    *(void *)((char *)&buf + 4) = v34;
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Lossy conversion of MFMailMessage. Detected Encoding: %ld", (uint8_t *)&buf, 0xCu);
                  }
                }
                v6 = v24;
                if (v29)
                {
                  id v18 = v39;
                  if (v6)
                  {
                    uint64_t v36 = [(__CFString *)v6 stringByAppendingString:v29];

                    v6 = (__CFString *)v36;
                  }
                  else
                  {
                    v6 = v29;
                  }
                }
                else
                {
                  id v18 = v39;
                }
              }
            }
          }
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v18);
    }
    else
    {
      v6 = 0;
    }

    v7 = v38;
  }

  return v6;
}

+ (void)sg_loadMailCoreFramework
{
  v2 = +[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/MailService.framework"];
  dispatch_semaphore_t v3 = +[NSBundle bundleWithURL:v2];
  id v8 = 0;
  unsigned __int8 v4 = [v3 loadAndReturnError:&v8];
  id v5 = v8;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    id v7 = [v5 domain];
    NSLog(@"Could not load MailCore framework (domain: %s, code: %d).", [v7 UTF8String], objc_msgSend(v6, "code"));
  }
}

+ (id)sg_messageWithRFC822Data:(id)a3
{
  dispatch_semaphore_t v3 = objc_msgSend(a1, "sg_dos2Unix:", a3);
  unsigned __int8 v4 = +[MFMailMessage messageWithRFC822Data:v3];

  return v4;
}

+ (id)sg_dos2Unix:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unsigned __int8 v4 = (char *)[v3 length];
    id v5 = v3;
    v6 = (unsigned __int8 *)[v5 bytes];
    id v7 = malloc_type_malloc((size_t)[v5 length], 0xAFA0981BuLL);
    if (!v7) {
      goto LABEL_16;
    }
    if (v4)
    {
      size_t v8 = 0;
      do
      {
        int v10 = *v6++;
        char v9 = v10;
        if (v10 != 13) {
          v7[v8++] = v9;
        }
        --v4;
      }
      while (v4);
      if (v8)
      {
        v11 = reallocf(v7, v8);
        if (v11)
        {
          v12 = +[NSData dataWithBytesNoCopy:v11 length:v8 freeWhenDone:1];
          goto LABEL_13;
        }
LABEL_16:
        id v14 = +[NSException exceptionWithName:NSMallocException reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v14);
      }
    }
    free(v7);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

@end