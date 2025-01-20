@interface SHHapticsProviderUtilities
+ (BOOL)isValidAppleArchiveFileURL:(id)a3;
+ (id)availableHapticAlgorithms;
+ (id)cachedHapticTracksForMediaItem:(id)a3;
+ (id)decompressionDirectoryForMediaItem:(id)a3;
+ (id)folderNameForMediaItem:(id)a3;
+ (id)hapticFromResponse:(id)a3;
+ (id)hapticTracksForMediaItem:(id)a3 inDirectory:(id)a4;
+ (id)hapticsFromDownloadResponses:(id)a3;
+ (id)musicHapticsRootDirectory;
@end

@implementation SHHapticsProviderUtilities

+ (id)hapticsFromDownloadResponses:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "hapticFromResponse:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

+ (id)cachedHapticTracksForMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 appleMusicID];

  if (v5)
  {
    id v6 = [a1 decompressionDirectoryForMediaItem:v4];
    id v7 = [a1 hapticTracksForMediaItem:v4 inDirectory:v6];
  }
  else
  {
    id v7 = &__NSArray0__struct;
  }

  return v7;
}

+ (id)hapticFromResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 networkDownloadResponse];
  id v6 = [v5 error];

  id v7 = [v4 networkDownloadResponse];
  id v8 = [v7 downloadedFileLocation];

  if ([a1 isValidAppleArchiveFileURL:v8])
  {
    uint64_t v9 = [v4 mediaItem];
    v10 = [a1 decompressionDirectoryForMediaItem:v9];

    id v25 = v6;
    unsigned int v11 = +[SHCompression decompressAppleArchiveAtURL:v8 toDirectoryURL:v10 error:&v25];
    id v12 = v25;

    v13 = [v4 mediaItem];
    long long v14 = [a1 hapticTracksForMediaItem:v13 inDirectory:v10];

    if (v11 && [v14 count])
    {
      id v15 = objc_alloc((Class)SHHaptic);
      long long v16 = [v4 mediaItem];
      long long v17 = [v4 spatialOffsets];
      id v18 = [v15 initWithHapticTracks:v14 representingMediaItem:v16 spatialOffsets:v17 error:0];

      goto LABEL_10;
    }
    v23 = sh_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v24 = @"No";
      if (v11) {
        CFStringRef v24 = @"Yes";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Could not find default haptics file in archive. ArchiveWasDecompressed: %@", buf, 0xCu);
    }

    if (!v12) {
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = v6;
    if (!v6)
    {
LABEL_6:
      NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
      CFStringRef v31 = @"Failed to download/unzip archive to extract haptics file";
      v19 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v12 = +[SHError errorWithCode:600 underlyingError:0 keyOverrides:v19];
    }
  }
  v20 = sh_log_object();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v27 = @"Failed to download/unzip archive to extract haptics file";
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@. Error: %@", buf, 0x16u);
  }

  id v21 = objc_alloc((Class)SHHaptic);
  v10 = [v4 mediaItem];
  long long v14 = [v4 spatialOffsets];
  id v18 = [v21 initWithHapticTracks:0 representingMediaItem:v10 spatialOffsets:v14 error:v12];
LABEL_10:

  return v18;
}

+ (id)hapticTracksForMediaItem:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  id v32 = a4;
  id v7 = [a1 availableHapticAlgorithms];
  NSErrorUserInfoKey v30 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v29 = a1;
  id obj = [a1 availableHapticAlgorithms];
  id v8 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v34;
    *(void *)&long long v9 = 138412802;
    long long v28 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        long long v14 = objc_msgSend(v32, "URLByAppendingPathComponent:conformingToType:", v13, UTTypeAHAP, v28);
        id v15 = +[NSFileManager defaultManager];
        long long v16 = [v14 path];
        unsigned __int8 v17 = [v15 fileExistsAtPath:v16];

        id v18 = sh_log_object();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v17)
        {
          if (v19)
          {
            v20 = [v6 appleMusicID];
            id v21 = [v6 isrc];
            *(_DWORD *)buf = v28;
            uint64_t v38 = v13;
            __int16 v39 = 2112;
            id v40 = v20;
            __int16 v41 = 2112;
            v42 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Downloaded variant: %@ for media item. AdamID: %@, ISRC: %@", buf, 0x20u);
          }
          id v18 = +[NSData dataWithContentsOfURL:v14];
          id v22 = objc_alloc((Class)SHHapticTrack);
          v23 = [v29 folderNameForMediaItem:v6];
          id v24 = [v22 initWithFileIdentifier:v23 hapticData:v18 algorithm:v13];

          [v30 addObject:v24];
        }
        else
        {
          if (!v19) {
            goto LABEL_13;
          }
          id v24 = [v6 appleMusicID];
          id v25 = [v6 isrc];
          *(_DWORD *)buf = v28;
          uint64_t v38 = v13;
          __int16 v39 = 2112;
          id v40 = v24;
          __int16 v41 = 2112;
          v42 = v25;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No variant: %@ downloaded for media item. AdamID: %@, ISRC: %@", buf, 0x20u);
        }
LABEL_13:
      }
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v10);
  }

  id v26 = [v30 copy];

  return v26;
}

+ (BOOL)isValidAppleArchiveFileURL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 pathExtension];

    if (v5)
    {
      id v6 = [v4 pathExtension];
      id v7 = +[UTType typeWithFilenameExtension:v6];

      LOBYTE(v5) = v7 == UTTypeAppleArchive;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (id)decompressionDirectoryForMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [a1 musicHapticsRootDirectory];
  id v6 = [a1 folderNameForMediaItem:v4];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  return v7;
}

+ (id)folderNameForMediaItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 appleMusicID];
  if (!v4 && ([v3 isrc], (id v4 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v5 = v4, [v4 isEqualToString:&stru_100076968]))
  {
    id v6 = [v3 identifier];
    id v7 = [v6 UUIDString];
    id v8 = v7;
    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      long long v9 = +[NSUUID UUID];
      id v5 = [v9 UUIDString];

      id v4 = v9;
    }

    id v10 = sh_log_object();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [v3 properties];
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      BOOL v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Setting haptics folder name: %@ using media item identifier in media item: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v12 = sh_log_object();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v3 appleMusicID];
    long long v14 = [v3 isrc];
    int v16 = 138412802;
    id v17 = v5;
    __int16 v18 = 2112;
    BOOL v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Returning haptics folder name: %@, MusicID: %@, ISRC:%@", (uint8_t *)&v16, 0x20u);
  }

  return v5;
}

+ (id)musicHapticsRootDirectory
{
  if (qword_100090AE8 != -1) {
    dispatch_once(&qword_100090AE8, &stru_100076068);
  }
  v2 = (void *)qword_100090AE0;

  return v2;
}

+ (id)availableHapticAlgorithms
{
  if (qword_100090AF8 != -1) {
    dispatch_once(&qword_100090AF8, &stru_100076088);
  }
  v2 = (void *)qword_100090AF0;

  return v2;
}

@end