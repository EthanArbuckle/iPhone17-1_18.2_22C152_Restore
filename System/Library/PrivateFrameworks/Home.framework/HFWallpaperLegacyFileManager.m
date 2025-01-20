@interface HFWallpaperLegacyFileManager
- (HFWallpaperLegacyFileManager)init;
- (NSURL)wallpaperFolderURL;
- (id)clearAllWallpapers;
- (id)filenameForType:(int64_t)a3 variant:(int64_t)a4;
- (void)migrateCache:(id)a3;
- (void)setWallpaperFolderURL:(id)a3;
@end

@implementation HFWallpaperLegacyFileManager

- (HFWallpaperLegacyFileManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFWallpaperLegacyFileManager;
  v2 = [(HFWallpaperLegacyFileManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HFUtilities wallpaperURL];
    wallpaperFolderURL = v2->_wallpaperFolderURL;
    v2->_wallpaperFolderURL = (NSURL *)v3;
  }
  return v2;
}

- (void)migrateCache:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  v49 = (void (**)(id, void *, void, void *))a3;
  v4 = [(HFWallpaperLegacyFileManager *)self wallpaperFolderURL];

  if (v4)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    objc_super v6 = [(HFWallpaperLegacyFileManager *)self wallpaperFolderURL];
    v7 = [v6 path];
    v8 = [v5 contentsOfDirectoryAtPath:v7 error:0];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v9 = v8;
    unint64_t v10 = 0x263F08000uLL;
    v11 = v9;
    uint64_t v12 = [v9 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (!v12) {
      goto LABEL_35;
    }
    uint64_t v14 = v12;
    uint64_t v56 = *MEMORY[0x263F080E0];
    uint64_t v57 = *(void *)v59;
    *(void *)&long long v13 = 138412290;
    long long v48 = v13;
    v50 = self;
    v54 = v11;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v55 = v14;
      do
      {
        if (*(void *)v59 != v57) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8 * v15);
        v17 = [(HFWallpaperLegacyFileManager *)self wallpaperFolderURL];
        v18 = [v17 URLByAppendingPathComponent:v16];

        v19 = [*(id *)(v10 + 2128) defaultManager];
        v20 = [v18 path];
        v21 = [v19 attributesOfItemAtPath:v20 error:0];

        v22 = [v21 fileType];
        LODWORD(v20) = [v22 isEqualToString:v56];

        if (v20)
        {
          v23 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v16];
          if (v23)
          {
            v24 = [v18 URLByAppendingPathComponent:@"info.plist"];
            v25 = NSDictionary;
            v26 = [v24 path];
            v27 = [v25 dictionaryWithContentsOfFile:v26];

            if (v27)
            {
              v28 = [[HFWallpaper alloc] initWithDictionary:v27];
              p_super = &v28->super;
              if (v28)
              {
                v51 = v27;
                v53 = v28;
                v30 = [(HFWallpaperLegacyFileManager *)self filenameForType:[(HFWallpaper *)v28 type] variant:0];
                v31 = [v18 URLByAppendingPathComponent:v30];

                v32 = (void *)MEMORY[0x263F1C6B0];
                v33 = [*(id *)(v10 + 2128) defaultManager];
                os_log_t log = v31;
                v34 = [v31 path];
                v35 = [v33 contentsAtPath:v34];
                v36 = [MEMORY[0x263F1C920] mainScreen];
                [v36 scale];
                v37 = objc_msgSend(v32, "imageWithData:scale:", v35);

                v38 = HFLogForCategory(0x48uLL);
                v39 = v38;
                if (v37)
                {
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = &v53->super;
                    __int16 v64 = 2112;
                    v65 = v23;
                    _os_log_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEFAULT, "Migrating wallpaper %@ for HomeKit identifier %@", buf, 0x16u);
                  }

                  ((void (**)(id, void *, HFWallpaper *, void *))v49)[2](v49, v23, v53, v37);
                  v40 = [MEMORY[0x263F08850] defaultManager];
                  v41 = [v18 path];
                  char v42 = [v40 removeItemAtPath:v41 error:0];

                  p_super = &v53->super;
                  v27 = v51;
                  if ((v42 & 1) == 0)
                  {
                    v39 = HFLogForCategory(0x48uLL);
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      v43 = [v18 path];
                      *(_DWORD *)buf = v48;
                      v63 = v43;
                      _os_log_error_impl(&dword_20B986000, v39, OS_LOG_TYPE_ERROR, "Failed to remove wallpaper at path \"%@\"", buf, 0xCu);

                      goto LABEL_26;
                    }
                    goto LABEL_27;
                  }
                }
                else
                {
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    v47 = [log path];
                    *(_DWORD *)buf = v48;
                    v63 = v47;
                    _os_log_error_impl(&dword_20B986000, v39, OS_LOG_TYPE_ERROR, "Failed to read original wallpaper at path \"%@\"", buf, 0xCu);
                  }
                  v27 = v51;
LABEL_26:
                  p_super = &v53->super;
LABEL_27:
                }
                self = v50;
                unint64_t v10 = 0x263F08000;
LABEL_29:
                v45 = log;
              }
              else
              {
                v45 = HFLogForCategory(0x48uLL);
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  [v18 path];
                  v46 = os_log_t log = v45;
                  *(_DWORD *)buf = 138412546;
                  v63 = v46;
                  __int16 v64 = 2112;
                  v65 = v27;
                  _os_log_error_impl(&dword_20B986000, log, OS_LOG_TYPE_ERROR, "Failed to create wallpaper at path \"%@\" from dict %@", buf, 0x16u);

                  goto LABEL_29;
                }
              }
LABEL_30:
            }
            else
            {
              p_super = HFLogForCategory(0x48uLL);
              if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              {
                v45 = [v24 path];
                *(_DWORD *)buf = v48;
                v63 = v45;
                _os_log_error_impl(&dword_20B986000, p_super, OS_LOG_TYPE_ERROR, "No wallpaper found at path \"%@\"", buf, 0xCu);
                goto LABEL_30;
              }
            }
          }
          else
          {
            v24 = HFLogForCategory(0x48uLL);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v44 = [v18 path];
              *(_DWORD *)buf = v48;
              v63 = v44;
              _os_log_error_impl(&dword_20B986000, v24, OS_LOG_TYPE_ERROR, "Unable to migrate non-wallpaper directory \"%@\"", buf, 0xCu);
            }
          }

          v11 = v54;
          uint64_t v14 = v55;
        }

        ++v15;
      }
      while (v14 != v15);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (!v14)
      {
LABEL_35:

        goto LABEL_38;
      }
    }
  }
  v11 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Unable to access wallpaper directory", buf, 2u);
  }
LABEL_38:
}

- (id)clearAllWallpapers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(HFWallpaperLegacyFileManager *)self wallpaperFolderURL];
  v5 = [v4 path];
  id v12 = 0;
  char v6 = [v3 removeItemAtPath:v5 error:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    v8 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = [(HFWallpaperLegacyFileManager *)self wallpaperFolderURL];
      v11 = [v10 path];
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to remove all wallpapers at path \"%@\"", buf, 0xCu);
    }
  }
  return v7;
}

- (id)filenameForType:(int64_t)a3 variant:(int64_t)a4
{
  v5 = @".jpg";
  if (!a3) {
    v5 = @".png";
  }
  char v6 = v5;
  switch(a4)
  {
    case 2:
      id v7 = @"blurred";
      goto LABEL_9;
    case 1:
      id v7 = @"processed";
      goto LABEL_9;
    case 0:
      id v7 = @"original";
LABEL_9:
      v8 = [(__CFString *)v7 stringByAppendingString:v6];
      goto LABEL_11;
  }
  NSLog(&cfstr_UnknownValueFo.isa, a4);
  v8 = 0;
LABEL_11:

  return v8;
}

- (NSURL)wallpaperFolderURL
{
  return self->_wallpaperFolderURL;
}

- (void)setWallpaperFolderURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end