@interface ATAirlock
+ (id)sharedInstance;
- (ATAirlock)init;
- (id)artworkPathForDataclass:(id)a3 artworkIdentifier:(id)a4;
- (id)geniusPathForDataclass:(id)a3 geniusIdentifier:(id)a4;
- (id)lyricsPathForDataclass:(id)a3 lyricsIdentifier:(id)a4;
- (id)pathForAsset:(id)a3 withDataclass:(id)a4;
- (id)pathForDataclass:(id)a3;
- (void)copyAssetToAirlock:(id)a3;
- (void)createAirlockForDataclasses:(id)a3;
- (void)evacuate;
- (void)evacuateDataclasses:(id)a3;
- (void)processCompletedAsset:(id)a3;
- (void)purgeAssetWithIdentifier:(id)a3 dataclass:(id)a4;
@end

@implementation ATAirlock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_fm, 0);
}

- (void)evacuate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(NSFileManager *)self->_fm fileExistsAtPath:self->_basePath])
  {
    fm = self->_fm;
    basePath = self->_basePath;
    id v8 = 0;
    BOOL v5 = [(NSFileManager *)fm removeItemAtPath:basePath error:&v8];
    id v6 = v8;
    if (!v5)
    {
      v7 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_ERROR, "failed to evacuate airlock. err=%{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (id)pathForAsset:(id)a3 withDataclass:(id)a4
{
  id v5 = a3;
  id v6 = [v5 identifier];
  v7 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v8 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  basePath = self->_basePath;
  id v10 = [v5 dataclass];

  uint64_t v11 = [(NSString *)basePath stringByAppendingPathComponent:v10];
  v12 = [v11 stringByAppendingPathComponent:v8];

  return v12;
}

- (id)pathForDataclass:(id)a3
{
  return [(NSString *)self->_basePath stringByAppendingPathComponent:a3];
}

- (id)lyricsPathForDataclass:(id)a3 lyricsIdentifier:(id)a4
{
  basePath = self->_basePath;
  id v6 = a4;
  v7 = [(NSString *)basePath stringByAppendingPathComponent:a3];
  id v8 = [v7 stringByAppendingPathComponent:@"Lyrics"];
  v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (id)geniusPathForDataclass:(id)a3 geniusIdentifier:(id)a4
{
  basePath = self->_basePath;
  id v6 = a4;
  v7 = [(NSString *)basePath stringByAppendingPathComponent:a3];
  id v8 = [v7 stringByAppendingPathComponent:@"Genius"];
  v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (id)artworkPathForDataclass:(id)a3 artworkIdentifier:(id)a4
{
  basePath = self->_basePath;
  id v6 = a4;
  v7 = [(NSString *)basePath stringByAppendingPathComponent:a3];
  id v8 = [v7 stringByAppendingPathComponent:@"Artwork"];
  v9 = [v8 stringByAppendingPathComponent:v6];

  return v9;
}

- (void)processCompletedAsset:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 storeInfo];
  id v6 = [v5 syncID];
  uint64_t v7 = [v6 longLongValue];

  if (v7)
  {
    id v8 = [v4 storeInfo];
    v9 = [v8 syncID];
    id v10 = [v9 stringByRemovingPercentEncoding];
  }
  else
  {
    id v8 = [v4 identifier];
    id v10 = [v8 stringByRemovingPercentEncoding];
  }

  basePath = self->_basePath;
  v12 = [v4 dataclass];
  v13 = [(NSString *)basePath stringByAppendingPathComponent:v12];
  v14 = [v13 stringByAppendingPathComponent:v10];

  v15 = [v4 path];
  v16 = [@"/var/mobile/Media/" stringByAppendingPathComponent:v15];
  v17 = [v16 stringByStandardizingPath];

  if (([v17 hasPrefix:@"/var/mobile/Media/"] & 1) == 0)
  {
    v22 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_18:
      id v28 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138543362;
    id v58 = v17;
    v24 = "Cannot move asset outside of AFC root: %{public}@";
    v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    uint32_t v27 = 12;
LABEL_17:
    _os_log_impl(&dword_2164B1000, v25, v26, v24, buf, v27);
    goto LABEL_18;
  }
  if (![v4 isDownload]) {
    goto LABEL_14;
  }
  uint64_t v18 = [v4 path];
  if (!v18) {
    goto LABEL_14;
  }
  v19 = (void *)v18;
  v20 = [v4 path];
  if (![v20 length])
  {

    goto LABEL_14;
  }
  BOOL v21 = [(NSFileManager *)self->_fm fileExistsAtPath:v14];

  if (!v21)
  {
LABEL_14:
    if (([v4 isDownload] & 1) == 0)
    {
      fm = self->_fm;
      id v53 = 0;
      BOOL v30 = [(NSFileManager *)fm removeItemAtPath:v14 error:&v53];
      id v28 = v53;
      v31 = os_log_create("com.apple.amp.AirTraffic", "Framework");
      v22 = v31;
      if (v30)
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138543362;
        id v58 = v4;
        v32 = "Removed completed upload for asset %{public}@";
        v33 = v22;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        uint32_t v35 = 12;
      }
      else
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 138543618;
        id v58 = v4;
        __int16 v59 = 2114;
        id v60 = v28;
        v32 = "Failed ro remove completed upload for asset %{public}@, error: %{public}@";
        v33 = v22;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
        uint32_t v35 = 22;
      }
      _os_log_impl(&dword_2164B1000, v33, v34, v32, buf, v35);
      goto LABEL_19;
    }
    v22 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    id v58 = v4;
    __int16 v59 = 2114;
    id v60 = v14;
    v24 = "asset not found in airlock. asset=%{public}@, airlockPath=%{public}@";
    v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_INFO;
    uint32_t v27 = 22;
    goto LABEL_17;
  }
  v22 = [v17 stringByDeletingLastPathComponent];
  if ([(NSFileManager *)self->_fm fileExistsAtPath:v22])
  {
    id v23 = 0;
  }
  else
  {
    v36 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v58 = v22;
      _os_log_impl(&dword_2164B1000, v36, OS_LOG_TYPE_DEFAULT, "Airlock destination directory not present, creating %{public}@", buf, 0xCu);
    }

    v37 = self->_fm;
    id v56 = 0;
    BOOL v38 = [(NSFileManager *)v37 createDirectoryAtPath:v22 withIntermediateDirectories:1 attributes:0 error:&v56];
    id v23 = v56;
    if (!v38)
    {
      v39 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v58 = v22;
        __int16 v59 = 2114;
        id v60 = v23;
        _os_log_impl(&dword_2164B1000, v39, OS_LOG_TYPE_ERROR, "Could not create directory %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
  v40 = self->_fm;
  id v55 = v23;
  BOOL v41 = [(NSFileManager *)v40 moveItemAtPath:v14 toPath:v17 error:&v55];
  id v28 = v55;

  if (v41)
  {
    v42 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [v4 path];
      v44 = [@"/var/mobile/Media/" stringByAppendingPathComponent:v43];
      *(_DWORD *)buf = 138543618;
      id v58 = v14;
      __int16 v59 = 2112;
      id v60 = v44;
      _os_log_impl(&dword_2164B1000, v42, OS_LOG_TYPE_DEFAULT, "Airlock moved %{public}@ to %{pubic}@", buf, 0x16u);
    }
LABEL_49:

    goto LABEL_19;
  }
  if ([(NSFileManager *)self->_fm fileExistsAtPath:v17])
  {
    v45 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v58 = v17;
      _os_log_impl(&dword_2164B1000, v45, OS_LOG_TYPE_DEFAULT, "File already exists at %{public}@, removing", buf, 0xCu);
    }

    [(NSFileManager *)self->_fm removeItemAtPath:v17 error:0];
    v46 = self->_fm;
    id v54 = v28;
    [(NSFileManager *)v46 moveItemAtPath:v14 toPath:v17 error:&v54];
    id v47 = v54;

    id v28 = v47;
  }
  if (![(NSFileManager *)self->_fm fileExistsAtPath:v17])
  {
    v48 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v58 = v4;
      __int16 v59 = 2114;
      id v60 = v28;
      _os_log_impl(&dword_2164B1000, v48, OS_LOG_TYPE_ERROR, "Failed to move completed file for asset %{public}@, error: %{public}@", buf, 0x16u);
    }

    BOOL v49 = [(NSFileManager *)self->_fm fileExistsAtPath:v22];
    BOOL v50 = [(NSFileManager *)self->_fm fileExistsAtPath:v14];
    v42 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v51 = "does not exist";
      *(_DWORD *)buf = 136315906;
      if (v50) {
        v52 = "exists";
      }
      else {
        v52 = "does not exist";
      }
      id v58 = (id)v52;
      __int16 v59 = 2114;
      id v60 = v14;
      if (v49) {
        v51 = "exists";
      }
      __int16 v61 = 2080;
      v62 = v51;
      __int16 v63 = 2114;
      v64 = v22;
      _os_log_impl(&dword_2164B1000, v42, OS_LOG_TYPE_ERROR, "Source %s: %{public}@, Destination %s: %{public}@", buf, 0x2Au);
    }
    goto LABEL_49;
  }
LABEL_19:
}

- (void)copyAssetToAirlock:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  uint64_t v7 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  id v8 = [v4 path];
  v9 = [@"/var/mobile/Media/" stringByAppendingPathComponent:v8];

  basePath = self->_basePath;
  BOOL v38 = v4;
  uint64_t v11 = [v4 dataclass];
  v12 = [(NSString *)basePath stringByAppendingPathComponent:v11];
  v13 = [v12 stringByAppendingPathComponent:v7];

  char v49 = 0;
  if (![(NSFileManager *)self->_fm fileExistsAtPath:v9 isDirectory:&v49])
  {
    v15 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_impl(&dword_2164B1000, v15, OS_LOG_TYPE_ERROR, "Trying to upload asset with no path! %{public}@", buf, 0xCu);
    }
LABEL_24:
    id v31 = 0;
    goto LABEL_25;
  }
  fm = self->_fm;
  if (!v49)
  {
    id v43 = 0;
    BOOL v32 = [(NSFileManager *)fm copyItemAtPath:v9 toPath:v13 error:&v43];
    id v31 = v43;
    v33 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    v15 = v33;
    if (v32)
    {
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543618;
      v51 = v9;
      __int16 v52 = 2114;
      id v53 = v13;
      os_log_type_t v34 = "Airlock successfully cloned %{public}@ to %{public}@";
      uint32_t v35 = v15;
      os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      __int16 v52 = 2114;
      id v53 = v31;
      os_log_type_t v34 = "Failed to create clone for upload %{public}@, error: %{public}@";
      uint32_t v35 = v15;
      os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2164B1000, v35, v36, v34, buf, 0x16u);
    goto LABEL_25;
  }
  [(NSFileManager *)fm createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v15 = [(NSFileManager *)self->_fm subpathsOfDirectoryAtPath:v9 error:0];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (!v16) {
    goto LABEL_24;
  }
  uint64_t v17 = v16;
  v37 = v7;
  v42 = 0;
  uint64_t v18 = *(void *)v46;
  v40 = v15;
  BOOL v41 = v9;
  v39 = v13;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v46 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      BOOL v21 = self->_fm;
      v22 = objc_msgSend(v9, "stringByAppendingPathComponent:", v20, v37);
      LODWORD(v21) = [(NSFileManager *)v21 fileExistsAtPath:v22 isDirectory:&v49];

      if (v21)
      {
        id v23 = self->_fm;
        if (v49)
        {
          v24 = [v13 stringByAppendingPathComponent:v20];
          [(NSFileManager *)v23 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:0];
LABEL_18:

          continue;
        }
        v25 = [v9 stringByAppendingPathComponent:v20];
        os_log_type_t v26 = [v13 stringByAppendingPathComponent:v20];
        id v44 = v42;
        BOOL v27 = [(NSFileManager *)v23 copyItemAtPath:v25 toPath:v26 error:&v44];
        id v28 = v44;

        v29 = os_log_create("com.apple.amp.AirTraffic", "Framework");
        v24 = v29;
        if (v27)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v39;
            BOOL v30 = [v39 stringByAppendingPathComponent:v20];
            *(_DWORD *)buf = 138543874;
            v51 = v20;
            __int16 v52 = 2114;
            v9 = v41;
            id v53 = v41;
            __int16 v54 = 2114;
            id v55 = v30;
            _os_log_impl(&dword_2164B1000, v24, OS_LOG_TYPE_DEFAULT, "Airlock cloned subpath %{public}@ of upload %{public}@ to %{public}@", buf, 0x20u);

            v42 = v28;
LABEL_17:
            v15 = v40;
            goto LABEL_18;
          }
        }
        else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v51 = v20;
          __int16 v52 = 2114;
          id v53 = v38;
          __int16 v54 = 2114;
          id v55 = v28;
          _os_log_impl(&dword_2164B1000, v24, OS_LOG_TYPE_ERROR, "Failed to create clone for subpath %{public}@ of upload %{public}@, error: %{public}@", buf, 0x20u);
        }
        v42 = v28;
        v13 = v39;
        v9 = v41;
        goto LABEL_17;
      }
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v56 count:16];
  }
  while (v17);
  uint64_t v7 = v37;
  id v31 = v42;
LABEL_25:
}

- (void)purgeAssetWithIdentifier:(id)a3 dataclass:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  id v10 = [(NSString *)self->_basePath stringByAppendingPathComponent:v7];
  uint64_t v11 = [v10 stringByAppendingPathComponent:v9];

  v12 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v11;
    _os_log_impl(&dword_2164B1000, v12, OS_LOG_TYPE_DEFAULT, "Purging %{public}@ with identifier %{public}@, path: %{public}@", (uint8_t *)&v13, 0x20u);
  }

  [(NSFileManager *)self->_fm removeItemAtPath:v11 error:0];
}

- (void)evacuateDataclasses:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2164B1000, v5, OS_LOG_TYPE_DEFAULT, "Evacuating airlock", buf, 2u);
  }

  id v6 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(NSFileManager *)self->_fm subpathsOfDirectoryAtPath:@"/var/mobile/Media/Airlock/" error:0];
    *(_DWORD *)buf = 138543362;
    v29 = v7;
    _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_DEFAULT, "Airlock contents: %{public}@", buf, 0xCu);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEqualToString:", @"Application", (void)v23))
        {
          fm = self->_fm;
          __int16 v15 = [@"/var/mobile/Media/" stringByAppendingPathComponent:@"PublicStaging"];
          LODWORD(fm) = [(NSFileManager *)fm fileExistsAtPath:v15];

          if (fm)
          {
            id v16 = os_log_create("com.apple.amp.AirTraffic", "Framework");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2164B1000, v16, OS_LOG_TYPE_DEFAULT, "Removing PublicStaging", buf, 2u);
            }

            __int16 v17 = self->_fm;
            uint64_t v18 = [@"/var/mobile/Media/" stringByAppendingPathComponent:@"PublicStaging"];
            [(NSFileManager *)v17 removeItemAtPath:v18 error:0];
          }
        }
        uint64_t v19 = self->_fm;
        v20 = [(NSString *)self->_basePath stringByAppendingPathComponent:v13];
        LODWORD(v19) = [(NSFileManager *)v19 fileExistsAtPath:v20];

        if (v19)
        {
          BOOL v21 = self->_fm;
          v22 = [(NSString *)self->_basePath stringByAppendingPathComponent:v13];
          [(NSFileManager *)v21 removeItemAtPath:v22 error:0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)createAirlockForDataclasses:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v14;
    *(void *)&long long v6 = 138543362;
    long long v12 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = -[NSString stringByAppendingPathComponent:](self->_basePath, "stringByAppendingPathComponent:", *(void *)(*((void *)&v13 + 1) + 8 * v9), v12);
        if (![(NSFileManager *)self->_fm fileExistsAtPath:v10])
        {
          uint64_t v11 = os_log_create("com.apple.amp.AirTraffic", "Framework");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v12;
            id v18 = v4;
            _os_log_impl(&dword_2164B1000, v11, OS_LOG_TYPE_DEFAULT, "Creating airlock for %{public}@", buf, 0xCu);
          }

          [(NSFileManager *)self->_fm createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }
}

- (ATAirlock)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATAirlock;
  v2 = [(ATAirlock *)&v8 init];
  v3 = v2;
  if (v2)
  {
    basePath = v2->_basePath;
    v2->_basePath = (NSString *)@"/var/mobile/Media/Airlock/";

    uint64_t v5 = (NSFileManager *)objc_alloc_init(MEMORY[0x263F08850]);
    fm = v3->_fm;
    v3->_fm = v5;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1841);
  }
  v2 = (void *)sharedInstance___sharedAirlock;
  return v2;
}

uint64_t __27__ATAirlock_sharedInstance__block_invoke()
{
  sharedInstance___sharedAirlock = objc_alloc_init(ATAirlock);
  return MEMORY[0x270F9A758]();
}

@end