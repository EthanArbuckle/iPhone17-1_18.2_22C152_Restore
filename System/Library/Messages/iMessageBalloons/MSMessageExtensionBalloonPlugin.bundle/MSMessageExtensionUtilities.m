@interface MSMessageExtensionUtilities
+ (id)isValidMediaPayload:(id)a3;
+ (id)isValidMessagePayload:(id)a3;
+ (id)isValidSticker:(id)a3;
+ (unint64_t)_maxAppMessageURLength;
+ (unint64_t)_maxStickerFileSize;
+ (unint64_t)_minStickerFileSize;
@end

@implementation MSMessageExtensionUtilities

+ (unint64_t)_maxStickerFileSize
{
  return 512000;
}

+ (unint64_t)_minStickerFileSize
{
  return 0;
}

+ (id)isValidSticker:(id)a3
{
  id v4 = a3;
  v5 = [v4 mediaURL];
  if (v5
    || ([v4 stickerRepresentations],
        v5 = objc_claimAutoreleasedReturnValue(),
        ![v5 count]))
  {

    goto LABEL_3;
  }
  v25 = [v4 stickerStoreIdentifier];

  if (!v25)
  {
LABEL_3:
    uint64_t v6 = [v4 mediaURL];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [v4 mediaURL];
      if ([v8 isFileURL])
      {
        v9 = +[NSFileManager defaultManager];
        v10 = [v4 mediaURL];
        v11 = [v10 path];
        unsigned __int8 v12 = [v9 fileExistsAtPath:v11];

        if (v12)
        {
          v13 = [v4 mediaURL];
          v14 = [v13 path];

          v15 = +[NSFileManager defaultManager];
          uint64_t v32 = 0;
          v16 = [v15 attributesOfItemAtPath:v14 error:&v32];
          uint64_t v17 = v32;

          if (v17 || !v16)
          {
            v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:5 userInfo:0];
          }
          else
          {
            v18 = [v16 objectForKey:NSFileSize];
            v19 = v18;
            if (v18
              && (id v20 = [v18 unsignedIntegerValue], v20 <= objc_msgSend(a1, "_maxStickerFileSize"))
              && (id v21 = [v19 unsignedIntegerValue], v21 > objc_msgSend(a1, "_minStickerFileSize")))
            {
              v22 = [v14 pathExtension];
              if (v22)
              {
                PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v22, 0);
                v24 = 0;
                if (!UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeGIF))
                {
                  if (UTTypeConformsTo(PreferredIdentifierForTag, kUTTypePNG)
                    || UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeJPEG)
                    || UTTypeConformsTo(PreferredIdentifierForTag, kIMUTTypeHEIFStandard))
                  {
                    v24 = 0;
                  }
                  else
                  {
                    v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:7 userInfo:0];
                  }
                }
              }
              else
              {
                v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:7 userInfo:0];
              }
            }
            else
            {
              v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:6 userInfo:0];
            }
          }
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:4 userInfo:0];
    goto LABEL_36;
  }
  v26 = [v4 stickerRepresentations];
  v14 = [v26 firstObject];

  v27 = [v14 data];
  id v28 = [v27 length];

  if (v28 > [a1 _maxStickerFileSize] || v28 <= objc_msgSend(a1, "_minStickerFileSize"))
  {
    uint64_t v30 = 6;
LABEL_30:
    v24 = +[NSError errorWithDomain:MSStickersErrorDomain code:v30 userInfo:0];
    goto LABEL_35;
  }
  CFStringRef v29 = (const __CFString *)[v14 type];
  if (!UTTypeConformsTo(v29, kUTTypeGIF)
    && !UTTypeConformsTo(v29, kUTTypePNG)
    && !UTTypeConformsTo(v29, kUTTypeJPEG)
    && !UTTypeConformsTo(v29, kIMUTTypeHEIFStandard))
  {
    uint64_t v30 = 7;
    goto LABEL_30;
  }
  v24 = 0;
LABEL_35:

LABEL_36:

  return v24;
}

+ (id)isValidMediaPayload:(id)a3
{
  v3 = [a3 mediaURL];
  id v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  if ([v3 isFileURL])
  {
    v5 = +[NSFileManager defaultManager];
    uint64_t v6 = [v4 path];
    unsigned __int8 v7 = [v5 fileExistsAtPath:v6];

    if (v7)
    {
LABEL_4:
      v8 = 0;
      goto LABEL_8;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 4;
  }
  v8 = +[NSError errorWithDomain:MSMessagesErrorDomain code:v9 userInfo:0];
LABEL_8:

  return v8;
}

+ (unint64_t)_maxAppMessageURLength
{
  return 5120;
}

+ (id)isValidMessagePayload:(id)a3
{
  id v4 = [a3 URL];
  v5 = [v4 absoluteString];
  id v6 = [v5 length];
  id v7 = [a1 _maxAppMessageURLength];

  if (v6 <= v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = +[NSError errorWithDomain:MSMessagesErrorDomain code:8 userInfo:0];
  }

  return v8;
}

@end