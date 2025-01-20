@interface CKAVMediaObject
+ (id)durationCache;
- (BOOL)durationLoaded;
- (double)duration;
- (id)description;
- (void)setDuration:(double)a3;
- (void)setDurationLoaded:(BOOL)a3;
@end

@implementation CKAVMediaObject

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKAVMediaObject;
  v4 = [(CKMediaObject *)&v8 description];
  v5 = [(CKMediaObject *)self transcoderUserInfo];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (double)duration
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (duration__pred_CMTimeGetSecondsCoreMedia != -1) {
    dispatch_once(&duration__pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_72);
  }
  if (!self->_durationLoaded)
  {
    v3 = +[CKAVMediaObject durationCache];
    v4 = [(CKMediaObject *)self transferGUID];
    v5 = [v3 objectForKey:v4];

    if (v5)
    {
      [v5 doubleValue];
      -[CKAVMediaObject setDuration:](self, "setDuration:");
    }
    v6 = [(CKMediaObject *)self transcoderUserInfo];
    v7 = v6;
    if (v6)
    {
      if (self->_durationLoaded) {
        goto LABEL_64;
      }
      objc_super v8 = [v6 objectForKey:*MEMORY[0x1E4F6D380]];
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v47 = self;
              __int16 v48 = 2112;
              double v49 = *(double *)&v8;
              _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "For media object (%@), getting duration (%@) from transcoderUserInfo", buf, 0x16u);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v38 = self;
            double v40 = *(double *)&v8;
            _CKLog();
          }
          objc_msgSend(v8, "doubleValue", v38, *(void *)&v40);
          -[CKAVMediaObject setDuration:](self, "setDuration:");
        }
      }

      if (self->_durationLoaded) {
        goto LABEL_64;
      }
      v10 = [v7 objectForKey:*MEMORY[0x1E4F6D3B8]];
      v11 = [v7 objectForKey:*MEMORY[0x1E4F6D388]];
      if (v10)
      {
        objc_opt_class();
        int isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        int isKindOfClass = 0;
      }
      if (v11)
      {
        objc_opt_class();
        if (isKindOfClass & objc_opt_isKindOfClass())
        {
          [v11 doubleValue];
          double v14 = v13;
          [v10 doubleValue];
          double v16 = v14 - v15;
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(46);
            v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              v47 = self;
              __int16 v48 = 2048;
              double v49 = v16;
              __int16 v50 = 2112;
              v51 = v10;
              __int16 v52 = 2112;
              v53 = v11;
              _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_DEBUG, "For media object (%@), getting duration (%f) from start and end: (%@|%@)", buf, 0x2Au);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v42 = v10;
            v43 = v11;
            double v40 = v16;
            v38 = self;
            _CKLog();
          }
          -[CKAVMediaObject setDuration:](self, "setDuration:", v16, v38, *(void *)&v40, v42, v43);
        }
      }
    }
    if (!self->_durationLoaded)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(46);
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = [(CKMediaObject *)self fileURL];
          *(_DWORD *)buf = 138412546;
          v47 = self;
          __int16 v48 = 2112;
          double v49 = *(double *)&v19;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_DEBUG, "For media object (%@), calculating duration from file: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v41 = [(CKMediaObject *)self fileURL];
        _CKLog();
      }
      id v20 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      char v45 = 0;
      v21 = [(CKMediaObject *)self fileURL];
      v22 = [v21 path];
      int v23 = [v20 fileExistsAtPath:v22 isDirectory:&v45];
      if (v45) {
        int v24 = 0;
      }
      else {
        int v24 = v23;
      }

      if (v24)
      {
        v25 = [(CKMediaObject *)self transcoderUserInfo];
        v26 = [v25 objectForKey:*MEMORY[0x1E4F6D370]];

        if (v26) {
          [MEMORY[0x1E4F1CB10] URLWithString:v26];
        }
        else {
        v29 = [(CKMediaObject *)self fileURL];
        }
        v30 = (void *)MEMORY[0x192FBA860](@"PLAssetSharingUtilities", @"PhotoLibraryServices");
        v31 = [(CKMediaObject *)self fileURL];
        v32 = [v31 path];
        v33 = [v30 playerItemForVideoURL:v29 fallbackFilePath:v32 library:0];

        v34 = [v33 asset];
        v35 = v34;
        v36 = (double (*)(void *))duration__CMTimeGetSeconds;
        if (v34) {
          [v34 duration];
        }
        else {
          memset(v44, 0, sizeof(v44));
        }
        if (v36(v44) >= 0.0) {
          -[CKAVMediaObject setDuration:](self, "setDuration:");
        }
        else {
          self->_durationLoaded = 1;
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(46);
          v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = [(CKMediaObject *)self fileURL];
            *(_DWORD *)buf = 138412290;
            v47 = v28;
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_DEBUG, "  => No file at URL (%@), aborting duration calculation", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v39 = [(CKMediaObject *)self fileURL];
          _CKLog();
        }
        self->_durationLoaded = 1;
      }
    }
LABEL_64:
  }
  return self->_duration;
}

void *__27__CKAVMediaObject_duration__block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CMTimeGetSeconds", @"CoreMedia");
  duration__CMTimeGetSeconds = result;
  return result;
}

+ (id)durationCache
{
  if (durationCache_once != -1) {
    dispatch_once(&durationCache_once, &__block_literal_global_59_0);
  }
  v2 = (void *)durationCache_sDurationCache;

  return v2;
}

void __32__CKAVMediaObject_durationCache__block_invoke()
{
  uint64_t v0 = CKCreateCache(0);
  v1 = (void *)durationCache_sDurationCache;
  durationCache_sDurationCache = v0;
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    self->_durationLoaded = 1;
    id v7 = +[CKAVMediaObject durationCache];
    v5 = [NSNumber numberWithDouble:a3];
    v6 = [(CKMediaObject *)self transferGUID];
    [v7 setObject:v5 forKey:v6];
  }
}

- (BOOL)durationLoaded
{
  return self->_durationLoaded;
}

- (void)setDurationLoaded:(BOOL)a3
{
  self->_durationLoaded = a3;
}

@end