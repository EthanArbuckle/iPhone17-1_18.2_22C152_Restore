@interface BLStreamingZipHandler
+ (id)optionsWithHashes:(id)a3 type:(id)a4 size:(int64_t)a5;
@end

@implementation BLStreamingZipHandler

+ (id)optionsWithHashes:(id)a3 type:(id)a4 size:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  if (v8 && v7 && a5 >= 1)
  {
    id v10 = SZExtractorOptionsHashType;
    if ([v8 isEqualToString:@"MD5"])
    {
      v11 = &SZExtractorHashTypeMD5;
    }
    else
    {
      if (![v8 isEqualToString:@"SHA1"])
      {
        v12 = BLServiceDownloadStreamingZipLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v17 = 138543362;
          id v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[Download-StreamingZip]: Invalid hash type: %{public}@", (uint8_t *)&v17, 0xCu);
        }

        goto LABEL_12;
      }
      v11 = &SZExtractorHashTypeSHA1;
    }
    [v9 setObject:*v11 forKey:v10];
LABEL_12:
    uint64_t v13 = SZExtractorOptionsHashesArray;

    [v9 setObject:v7 forKey:v13];
    uint64_t v14 = SZExtractorOptionsHashedChunkSize;
    v15 = +[NSNumber numberWithInteger:a5];
    [v9 setObject:v15 forKey:v14];
  }

  return v9;
}

@end