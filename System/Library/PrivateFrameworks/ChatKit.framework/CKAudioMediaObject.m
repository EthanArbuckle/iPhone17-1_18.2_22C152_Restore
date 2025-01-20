@interface CKAudioMediaObject
+ (BOOL)isPreviewable;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (Class)__ck_attachmentItemClass;
+ (id)UTITypes;
+ (id)_cachedPowerLevelsForKey:(id)a3;
+ (id)fallbackFilenamePrefix;
+ (id)generateThumbnailForPowerLevelsFromMetadata:(id)a3 color:(id)a4;
+ (id)generateThumbnailForWidth:(double)a3 color:(id)a4 powerLevels:(id)a5 fileURL:(id)a6;
+ (id)generateWaveformFromPowerLevels:(double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5;
+ (void)_cachePowerLevels:(id)a3 forKey:(id)a4;
+ (void)normalizedPowerLevelsForPowerValues:(id)a3 powerLevelsCount:(unint64_t)a4 powerLevels:(double *)a5;
- (BOOL)canExport;
- (BOOL)isAudioMessage;
- (BOOL)isPreviewable;
- (BOOL)shouldBeQuickLooked;
- (BOOL)shouldSuppressPreview;
- (BOOL)supportsPreviewMetadata;
- (BOOL)supportsUnknownSenderPreview;
- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5;
- (Class)balloonViewClass;
- (Class)replyContextBalloonViewClass;
- (NSArray)powerLevels;
- (NSArray)powerLevelsFromMetadata;
- (NSString)previewMetadataFilenameExtension;
- (NSURL)temporaryFileURL;
- (double)duration;
- (double)durationFromMetadata;
- (id)attachmentSummary:(unint64_t)a3;
- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4;
- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4 withColor:(id)a5;
- (id)generatePlaceholderThumbnailForWidth:(double)a3;
- (id)generatePlaceholderThumbnailForWidth:(double)a3 withColor:(id)a4;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5 withColor:(id)a6;
- (id)generateThumbnailForWidth:(double)a3;
- (id)generateThumbnailForWidth:(double)a3 withColor:(id)a4;
- (id)metricsCollectorMediaType;
- (id)pasteboardItemProvider;
- (id)previewFilenameExtension;
- (id)previewItemTitle;
- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4;
- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4;
- (id)temporaryWaveformWithWidth:(double)a3 orientation:(char)a4;
- (id)waveformForOrientation:(char)a3;
- (int)mediaType;
- (int64_t)totalPacketsCount;
- (void)restorePreviewMetadataFromDict:(id)a3;
- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5;
- (void)setDurationFromMetadata:(double)a3;
- (void)setPowerLevels:(id)a3;
- (void)setPowerLevelsFromMetadata:(id)a3;
- (void)setTemporaryFileURL:(id)a3;
- (void)setTotalPacketsCount:(int64_t)a3;
@end

@implementation CKAudioMediaObject

+ (id)UTITypes
{
  v2 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_65];
  v4 = [v2 objectsAtIndexes:v3];

  return v4;
}

BOOL __30__CKAudioMediaObject_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F22538]) != 0;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D960];
}

+ (id)fallbackFilenamePrefix
{
  return @"AUDIO";
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Audio Files" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 1;
}

- (BOOL)shouldSuppressPreview
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isPriusEnabled];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKAudioMediaObject;
    return [(CKMediaObject *)&v9 shouldSuppressPreview];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKAudioMediaObject;
    if ([(CKMediaObject *)&v8 shouldSuppressPreview])
    {
      return 1;
    }
    else
    {
      v6 = [(CKMediaObject *)self messageContext];
      char v5 = [v6 isSenderUnauthenticated];
    }
  }
  return v5;
}

- (BOOL)supportsUnknownSenderPreview
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v3 = [v2 isPriusEnabled];

  return v3;
}

- (id)pasteboardItemProvider
{
  char v3 = [(CKMediaObject *)self fileURL];
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v3];
  char v5 = [(CKMediaObject *)self filename];
  if ([(CKAudioMediaObject *)self isAudioMessage])
  {
    if ([(CKMediaObject *)self isFromMe])
    {
      v6 = CKFrameworkBundle();
      uint64_t v7 = [v6 localizedStringForKey:@"AUDIO_MESSAGE_SAVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      v6 = [(CKMediaObject *)self senderHandle];
      objc_super v8 = NSString;
      objc_super v9 = CKFrameworkBundle();
      v10 = [v9 localizedStringForKey:@"AUDIO_MESSAGE_VOICE_MEMO_LABEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v11 = [v6 name];
      if (v11) {
        [v6 name];
      }
      else {
      v12 = [v6 displayID];
      }
      v13 = objc_msgSend(v8, "stringWithFormat:", v10, v12);

      v14 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v15 = [v14 userInterfaceLayoutDirection];

      if (v15 == 1) {
        v16 = @"\u200F";
      }
      else {
        v16 = @"\u200E";
      }
      uint64_t v7 = [(__CFString *)v16 stringByAppendingString:v13];
    }
    char v5 = (void *)v7;
  }
  [v4 setSuggestedName:v5];

  return v4;
}

- (double)duration
{
  if ([(CKMediaObject *)self generatePreviewOutOfProcess]
    && [(CKAudioMediaObject *)self isAudioMessage])
  {
    char v3 = [(CKMediaObject *)self previewMetadata];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    double result = 0.0;
    if (isKindOfClass)
    {
      v6 = [(CKMediaObject *)self previewMetadata];
      [(CKAudioMediaObject *)self restorePreviewMetadataFromDict:v6];
      [(CKAudioMediaObject *)self durationFromMetadata];
      double v8 = v7;

      return v8;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKAudioMediaObject;
    [(CKAVMediaObject *)&v9 duration];
  }
  return result;
}

+ (void)_cachePowerLevels:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (v12 && v5)
  {
    if (!sPowerLevelDictionary)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
      double v7 = (void *)sPowerLevelDictionary;
      sPowerLevelDictionary = v6;
    }
    if (!sPowerLevelKeyArray)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
      objc_super v9 = (void *)sPowerLevelKeyArray;
      sPowerLevelKeyArray = v8;
    }
    v10 = [(id)sPowerLevelDictionary objectForKeyedSubscript:v5];

    if (v10)
    {
      [(id)sPowerLevelDictionary removeObjectForKey:v5];
    }
    else if ((unint64_t)[(id)sPowerLevelKeyArray count] >= 5)
    {
      v11 = [(id)sPowerLevelKeyArray objectAtIndexedSubscript:0];
      [(id)sPowerLevelDictionary removeObjectForKey:v11];
      [(id)sPowerLevelKeyArray removeFirstObject];
    }
    [(id)sPowerLevelDictionary setObject:v12 forKeyedSubscript:v5];
    [(id)sPowerLevelKeyArray addObject:v5];
  }
}

+ (id)_cachedPowerLevelsForKey:(id)a3
{
  return (id)[(id)sPowerLevelDictionary objectForKey:a3];
}

- (NSArray)powerLevels
{
  v2 = [(CKMediaObject *)self transferGUID];
  char v3 = +[CKAudioMediaObject _cachedPowerLevelsForKey:v2];

  return (NSArray *)v3;
}

- (void)setPowerLevels:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObject *)self transferGUID];
  +[CKAudioMediaObject _cachePowerLevels:v4 forKey:v5];
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (BOOL)isPreviewable
{
  if ([(CKAudioMediaObject *)self shouldSuppressPreview]) {
    return 0;
  }

  return [(CKAudioMediaObject *)self isAudioMessage];
}

- (BOOL)isAudioMessage
{
  v2 = [(CKMediaObject *)self messageContext];
  char v3 = [v2 isAudioMessage];

  return v3;
}

- (Class)balloonViewClass
{
  if ([(CKAudioMediaObject *)self shouldSuppressPreview])
  {
    char v3 = (objc_class *)objc_opt_class();
  }
  else
  {
    if ([(CKAudioMediaObject *)self isAudioMessage])
    {
      id v4 = +[CKUIBehavior sharedBehaviors];
      id v5 = (objc_class *)(id)[v4 audioBalloonViewClass];

      goto LABEL_7;
    }
    v7.receiver = self;
    v7.super_class = (Class)CKAudioMediaObject;
    char v3 = [(CKMediaObject *)&v7 balloonViewClass];
  }
  id v5 = v3;
LABEL_7:

  return v5;
}

- (Class)replyContextBalloonViewClass
{
  [(CKAudioMediaObject *)self isAudioMessage];
  v2 = objc_opt_class();

  return (Class)v2;
}

- (BOOL)canExport
{
  return 1;
}

- (void)restorePreviewMetadataFromDict:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKey:@"duration"];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = [v5 objectForKey:@"powerLevels"];
    v10 = (void *)v9;
    if (v8 != 0.0 && v9 != 0)
    {
      [(CKAudioMediaObject *)self setDurationFromMetadata:v8];
      [(CKAudioMediaObject *)self setPowerLevelsFromMetadata:v10];
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = [(CKMediaObject *)self transferGUID];
          v14 = [(CKMediaObject *)self filename];
          *(_DWORD *)buf = 134218754;
          v23 = self;
          __int16 v24 = 2112;
          v25 = v13;
          __int16 v26 = 2112;
          v27 = v14;
          __int16 v28 = 2112;
          v29 = v5;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] duration and power levels restored from metadataDict %@.", buf, 0x2Au);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        uint64_t v15 = [(CKMediaObject *)self transferGUID];
        v20 = [(CKMediaObject *)self filename];
        _CKLog();
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(CKMediaObject *)self transferGUID];
      v18 = [(CKMediaObject *)self filename];
      *(_DWORD *)buf = 134218754;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] error restoring duration and power levels from metadataDict %@.", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v19 = [(CKMediaObject *)self transferGUID];
    v21 = [(CKMediaObject *)self filename];
    _CKLog();
  }
}

- (id)temporaryWaveformWithWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v31 = self;
      __int16 v32 = 1024;
      int v33 = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "%@ previewForOrientation:%d", buf, 0x12u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v27 = self;
    uint64_t v29 = (int)v4;
    _CKLog();
  }
  double v8 = [(CKMediaObject *)self transfer];
  if ([v8 isFileDataReady] & 1) != 0 || (objc_msgSend(v8, "isRestoring"))
  {
    if ([(CKMediaObject *)self generatePreviewOutOfProcess])
    {
      [(CKAudioMediaObject *)self durationFromMetadata];
      if (v9 == 0.0
        || ([(CKAudioMediaObject *)self powerLevelsFromMetadata],
            v10 = objc_claimAutoreleasedReturnValue(),
            BOOL v11 = v10 == 0,
            v10,
            v11))
      {
        id v12 = [(CKMediaObject *)self previewMetadata];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v14 = [(CKMediaObject *)self previewMetadata];
          [(CKAudioMediaObject *)self restorePreviewMetadataFromDict:v14];
        }
      }
    }
    uint64_t v15 = [(CKAudioMediaObject *)self generateThumbnailForWidth:a3];
    v16 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v15 width:v4 orientation:a3];

    if (v16) {
      goto LABEL_36;
    }
    v17 = +[CKUIBehavior sharedBehaviors];
    v18 = [v17 defaultWaveformImage];

    if (v18)
    {
      [v18 size];
      v16 = -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v18, v4);

      if (v16)
      {
LABEL_36:
        id v25 = v16;
        goto LABEL_39;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_DEBUG, "Failed to load default waveform image from assets", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
    }
    __int16 v24 = [(CKAudioMediaObject *)self generatePlaceholderThumbnailForWidth:a3];
    v16 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v24 width:v4 orientation:a3];

    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    __int16 v28 = self;
    _CKLog();
  }
  v20 = +[CKUIBehavior sharedBehaviors];
  v21 = [v20 defaultWaveformImage];

  if (v21)
  {
    v22 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v21 width:v4 orientation:a3];
  }
  else
  {
    v22 = 0;
  }
  id v25 = v22;

LABEL_39:

  return v25;
}

- (id)waveformForOrientation:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(CKMediaObject *)self transferGUID];
      double v7 = [(CKMediaObject *)self filename];
      *(_DWORD *)buf = 134218754;
      v73 = self;
      __int16 v74 = 2112;
      v75 = v6;
      __int16 v76 = 2112;
      v77 = v7;
      __int16 v78 = 1024;
      int v79 = v3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] previewForOrientation:%d", buf, 0x26u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    double v8 = [(CKMediaObject *)self transferGUID];
    v62 = [(CKMediaObject *)self filename];
    uint64_t v63 = (int)v3;
    v58 = self;
    v61 = v8;
    _CKLog();
  }
  double v9 = [(CKMediaObject *)self transfer];
  if ([v9 isFileDataReady] & 1) != 0 || (objc_msgSend(v9, "isRestoring"))
  {
    if ([(CKMediaObject *)self generatePreviewOutOfProcess])
    {
      [(CKAudioMediaObject *)self durationFromMetadata];
      if (v10 == 0.0
        || ([(CKAudioMediaObject *)self powerLevelsFromMetadata],
            BOOL v11 = objc_claimAutoreleasedReturnValue(),
            BOOL v12 = v11 == 0,
            v11,
            v12))
      {
        v13 = [(CKMediaObject *)self previewMetadata];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v15 = [(CKMediaObject *)self previewMetadata];
          [(CKAudioMediaObject *)self restorePreviewMetadataFromDict:v15];
        }
      }
    }
    v16 = [(CKMediaObject *)self previewCacheKeyWithOrientation:v3];
    v17 = [(CKMediaObject *)self previewDispatchCache];
    v18 = [v17 cachedPreviewForKey:v16];

    if (v18)
    {
      id v19 = v18;
LABEL_78:
      id v26 = v19;
LABEL_79:

      goto LABEL_80;
    }
    v20 = [(CKMediaObject *)self transfer];
    int v21 = [v20 isFileURLFinalized];

    if (v21)
    {
      v22 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v3 extension:@"png" generateIntermediaries:0];
      v23 = [(CKAudioMediaObject *)self savedPreviewFromURL:v22 forOrientation:v3];
      if (v23)
      {
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          __int16 v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_DEBUG, "%@ preview read from disk.", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        id v25 = [(CKMediaObject *)self previewDispatchCache];
        [v25 setCachedPreview:v23 key:v16];

        id v26 = v23;
        goto LABEL_79;
      }
    }
    __int16 v28 = +[CKUIBehavior sharedBehaviors];
    [v28 previewMaxWidth];
    double v30 = v29;

    if (![(CKMediaObject *)self generatePreviewOutOfProcess]
      || [(CKMediaObject *)self generatePreviewOutOfProcess]
      && ([(CKAudioMediaObject *)self durationFromMetadata], v31 != 0.0)
      && ([(CKAudioMediaObject *)self powerLevelsFromMetadata],
          __int16 v32 = objc_claimAutoreleasedReturnValue(),
          BOOL v33 = v32 == 0,
          v32,
          !v33))
    {
      uint64_t v34 = +[CKUIBehavior sharedBehaviors];
      [(CKAudioMediaObject *)self duration];
      objc_msgSend(v34, "transcriptWaveformWidthForDuration:");
      double v30 = v35;

      [(CKAudioMediaObject *)self duration];
      double v37 = v36;
      v38 = +[CKUIBehavior sharedBehaviors];
      [v38 waveformMaxWidthDuration];
      BOOL v40 = v37 > v39;

      int v41 = IMOSLoggingEnabled();
      if (v40)
      {
        if (v41)
        {
          CKLogCStringForType(2);
          v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_DEBUG, "%@ duration is long. Generate waveform in background.", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        v43 = [(CKMediaObject *)self previewDispatchCache];
        char v44 = [v43 isGeneratingPreviewForKey:v16];

        if ((v44 & 1) == 0)
        {
          v45 = [(CKMediaObject *)self previewDispatchCache];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_157;
          v67[3] = &unk_1E5624FF8;
          v67[4] = self;
          *(double *)&v67[5] = v30;
          char v68 = v3;
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_162;
          v64[3] = &unk_1E5623DE8;
          v64[4] = self;
          id v65 = v16;
          char v66 = v3;
          [v45 enqueueGenerationBlock:v67 completion:v64 withPriority:0 forKey:v65];
        }
      }
      else
      {
        if (v41)
        {
          CKLogCStringForType(2);
          v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v73 = self;
            _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_DEBUG, "%@ duration is short. Generate waveform sychronously.", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v59 = self;
          _CKLog();
        }
        v47 = -[CKAudioMediaObject generateThumbnailForWidth:](self, "generateThumbnailForWidth:", v30, v59);
        v48 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v47 width:v3 orientation:v30];

        if (v48)
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(2);
            v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = self;
              _os_log_impl(&dword_18EF18000, v49, OS_LOG_TYPE_DEBUG, "Finished generating preview for %@", buf, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
          {
            v60 = self;
            _CKLog();
          }
          v50 = [(CKMediaObject *)self previewDispatchCache];
          [v50 setCachedPreview:v48 key:v16];

          v51 = [(CKMediaObject *)self previewDispatchCache];
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke;
          v69[3] = &unk_1E5624FD0;
          v69[4] = self;
          char v71 = v3;
          id v52 = v48;
          id v70 = v52;
          [v51 enqueueSaveBlock:v69 forMediaObject:self withPriority:0];

          goto LABEL_77;
        }
      }
    }
    v53 = +[CKUIBehavior sharedBehaviors];
    v54 = [v53 defaultWaveformImage];

    if (v54)
    {
      [v54 size];
      -[CKAudioMediaObject generatePreviewFromThumbnail:width:orientation:](self, "generatePreviewFromThumbnail:width:orientation:", v54, v3);
      id v52 = (id)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
LABEL_77:
        id v19 = v52;
        goto LABEL_78;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v55, OS_LOG_TYPE_DEBUG, "Failed to load default waveform image from assets", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
    }
    v56 = [(CKAudioMediaObject *)self generatePlaceholderThumbnailForWidth:v30];
    id v52 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v56 width:v3 orientation:v30];

    goto LABEL_77;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = self;
      _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  id v26 = 0;
LABEL_80:

  return v26;
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "Saving waveform for %@ to disk.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v7 = *(void *)(a1 + 32);
    _CKLog();
  }
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", *(char *)(a1 + 48), @"png", 1, v7);
  [v3 savePreview:*(void *)(a1 + 40) toURL:v6 forOrientation:*(char *)(a1 + 48)];
}

id __45__CKAudioMediaObject_waveformForOrientation___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "Starting background generation of waveform for %@.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v10 = *(void *)(a1 + 32);
    _CKLog();
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend(v6, "generateThumbnailForWidth:", *(double *)(a1 + 40), v10);
  double v8 = [v6 generatePreviewFromThumbnail:v7 width:*(char *)(a1 + 48) orientation:*(double *)(a1 + 40)];

  return v8;
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_162(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_2;
  block[3] = &unk_1E5623DE8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  char v5 = *(unsigned char *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) previewDispatchCache];
  id v3 = [v2 cachedPreviewForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "Finished generating preview for %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      uint64_t v7 = *(void *)(a1 + 32);
      _CKLog();
    }
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "previewDispatchCache", v7);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__CKAudioMediaObject_waveformForOrientation___block_invoke_163;
    v8[3] = &unk_1E5624FD0;
    v8[4] = *(void *)(a1 + 32);
    char v10 = *(unsigned char *)(a1 + 48);
    id v9 = v3;
    [v6 enqueueSaveBlock:v8 forMediaObject:*(void *)(a1 + 32) withPriority:0];

    [*(id *)(a1 + 32) postPreviewDidChangeNotifications];
  }
}

void __45__CKAudioMediaObject_waveformForOrientation___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_DEBUG, "Saving waveform for %@ to disk.", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v7 = *(void *)(a1 + 32);
    _CKLog();
  }
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "previewCachesFileURLWithOrientation:extension:generateIntermediaries:", *(char *)(a1 + 48), @"png", 1, v7);
  [v3 savePreview:*(void *)(a1 + 40) toURL:v6 forOrientation:*(char *)(a1 + 48)];
}

- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4
{
  return [(CKAudioMediaObject *)self composeWaveformForWidth:a4 orientation:0 withColor:a3];
}

- (id)composeWaveformForWidth:(double)a3 orientation:(char)a4 withColor:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  uint64_t v9 = [(CKAudioMediaObject *)self generateThumbnailForWidth:v8 withColor:a3];
  uint64_t v10 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v9 width:v5 orientation:v8 withColor:a3];

  if (!v10)
  {
    BOOL v11 = [(CKAudioMediaObject *)self generatePlaceholderThumbnailForWidth:v8 withColor:a3];
    uint64_t v10 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v11 width:v5 orientation:v8 withColor:a3];
  }

  return v10;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  uint64_t v10 = [v9 theme];
  BOOL v11 = v10;
  if (v5 == 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  uint64_t v13 = [v10 waveformColorForColorType:v12];

  v14 = [(CKAudioMediaObject *)self generatePreviewFromThumbnail:v8 width:v5 orientation:v13 withColor:a4];

  return v14;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5 withColor:(id)a6
{
  id v6 = a3;
  uint64_t v7 = +[CKUIBehavior sharedBehaviors];
  id v8 = objc_msgSend(v6, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v7, "waveformGapWidth"));

  return v8;
}

- (id)previewFilenameExtension
{
  return @"png";
}

- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = [(CKMediaObject *)self fileManager];
    uint64_t v10 = [v8 path];
    char v11 = [v9 fileExistsAtPath:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = v7;
      id v13 = v8;
      im_perform_with_task_assertion();
    }
  }
}

void __55__CKAudioMediaObject_savePreview_toURL_forOrientation___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = CKCreatePNGRepresentationFromUIImageFilterTypeNone(*(void **)(a1 + 32));
  CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "%@ preview saved to %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKAudioMediaObject;
  uint64_t v4 = [(CKMediaObject *)&v8 savedPreviewFromURL:a3 forOrientation:a4];
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  id v6 = objc_msgSend(v4, "imageWithAlignmentRectInsets:", 0.0, 0.0, 0.0, (double)(unint64_t)objc_msgSend(v5, "waveformGapWidth"));

  return v6;
}

- (id)generateThumbnailForWidth:(double)a3
{
  return [(CKAudioMediaObject *)self generateThumbnailForWidth:0 withColor:a3];
}

- (id)generateThumbnailForWidth:(double)a3 withColor:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(CKMediaObject *)self generatePreviewOutOfProcess];
  objc_super v8 = [(CKAudioMediaObject *)self powerLevels];
  if (v7)
  {
    uint64_t v9 = +[CKAudioMediaObject generateThumbnailForWidth:v6 color:v8 powerLevels:0 fileURL:a3];

    if (v9) {
      goto LABEL_5;
    }
    objc_super v8 = [(CKAudioMediaObject *)self powerLevelsFromMetadata];
  }
  uint64_t v10 = [(CKMediaObject *)self fileURL];
  uint64_t v9 = +[CKAudioMediaObject generateThumbnailForWidth:v6 color:v8 powerLevels:v10 fileURL:a3];

LABEL_5:

  return v9;
}

+ (void)normalizedPowerLevelsForPowerValues:(id)a3 powerLevelsCount:(unint64_t)a4 powerLevels:(double *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v29 = (uint64_t)&v29;
  MEMORY[0x1F4188790](v7);
  objc_super v8 = (char *)&v29 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * a4);
  bzero(a5, 8 * a4);
  bzero(v8, 8 * a4);
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  uint64_t v32 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v31 = *(void *)v34;
    unint64_t v11 = a4 - 1;
    double v30 = a5 + 1;
    do
    {
      uint64_t v12 = 0;
      unint64_t v13 = v10 * a4;
      unint64_t v14 = v9;
      do
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * v12) floatValue];
        float v16 = v15;
        unint64_t v17 = [v7 count];
        if (v10 * a4 / v17 >= v11) {
          unint64_t v9 = a4 - 1;
        }
        else {
          unint64_t v9 = v10 * a4 / v17;
        }
        unint64_t v18 = *(void *)&v8[8 * v9];
        double v19 = v16 * v16 + a5[v9] * a5[v9] * (double)v18;
        unint64_t v20 = v18 + 1;
        double v21 = sqrt(v19 / (double)v20);
        a5[v9] = v21;
        if (v9 != v14 && v14 + 1 < v9)
        {
          float v23 = a5[v14];
          float v24 = v21 - v23;
          double v25 = (float)((float)(v24 / (float)(v9 - v14)) + v23);
          unint64_t v26 = v13 / v17;
          if (v13 / v17 >= v11) {
            unint64_t v26 = a4 - 1;
          }
          unint64_t v27 = ~v14 + v26;
          __int16 v28 = &v30[v14];
          do
          {
            *v28++ = v25;
            --v27;
          }
          while (v27);
        }
        *(void *)&v8[8 * v9] = v20;
        ++v10;
        ++v12;
        v13 += a4;
        unint64_t v14 = v9;
      }
      while (v12 != v32);
      uint64_t v32 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }
}

+ (id)generateThumbnailForWidth:(double)a3 color:(id)a4 powerLevels:(id)a5 fileURL:(id)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  unint64_t v13 = (unint64_t)(a3 / (double)(unint64_t)[v12 waveformPowerLevelWidthIncrement]);

  if (v13)
  {
    bzero((char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v13);
    if ([v10 count])
    {
      +[CKAudioMediaObject normalizedPowerLevelsForPowerValues:v10 powerLevelsCount:v13 powerLevels:(char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
LABEL_4:
      unint64_t v13 = +[CKAudioMediaObject generateWaveformFromPowerLevels:(char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0) powerLevelsCount:v13 color:v9];
      goto LABEL_8;
    }
    if (v11
      && CKWaveformPowerLevelsForFileURL(v11, (char *)v15 - ((8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13))
    {
      goto LABEL_4;
    }
    unint64_t v13 = 0;
  }
LABEL_8:

  return (id)v13;
}

+ (id)generateThumbnailForPowerLevelsFromMetadata:(id)a3 color:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count])
  {
    uint64_t v7 = [v5 count];
    objc_super v8 = (char *)v14 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, 8 * v7);
    bzero(v8, 8 * v7);
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v10 = [v5 objectAtIndex:i];
        [v10 floatValue];
        *(double *)&v8[8 * i] = v11;
      }
    }
    uint64_t v12 = +[CKAudioMediaObject generateWaveformFromPowerLevels:v8 powerLevelsCount:v7 color:v6];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)generateWaveformFromPowerLevels:(double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5
{
  id v7 = a5;
  objc_super v8 = +[CKUIBehavior sharedBehaviors];
  [v8 waveformMinLinearPowerLevel];
  double v10 = v9;

  if (a4)
  {
    float v11 = a3;
    unint64_t v12 = a4;
    double v13 = 1.0;
    do
    {
      if (*v11 < 1.0) {
        double v10 = 0.0;
      }
      double v14 = fmax(*v11 - v10, 0.0);
      *v11++ = v14;
      if (v13 < v14) {
        double v13 = v14;
      }
      --v12;
    }
    while (v12);
    float v15 = a3;
    unint64_t v16 = a4;
    do
    {
      *float v15 = *v15 / v13;
      ++v15;
      --v16;
    }
    while (v16);
  }
  unint64_t v17 = CKWaveformWithPowerLevels((uint64_t)a3, a4, v7);

  return v17;
}

- (BOOL)supportsPreviewMetadata
{
  return 1;
}

- (NSString)previewMetadataFilenameExtension
{
  return (NSString *)@"plist";
}

- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3];
  id v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6DF38] code:4 userInfo:0];
  }

  return v6;
}

- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = [v7 writeToURL:v8 atomically:1];
    if ((v9 & 1) == 0)
    {
      if (_IMWillLog())
      {
        id v12 = v8;
        _IMAlwaysLog();
      }
      if (a5)
      {
        uint64_t v10 = 9;
LABEL_9:
        objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F6DF38], v10, 0, v12);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    _IMWarn();
    char v9 = 0;
    if (a5)
    {
      uint64_t v10 = 13;
      goto LABEL_9;
    }
  }

  return v9;
}

- (BOOL)shouldBeQuickLooked
{
  id v3 = [(CKMediaObject *)self messageContext];
  char v4 = [v3 isAudioMessage];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CKAudioMediaObject;
  return [(CKMediaObject *)&v6 shouldBeQuickLooked];
}

- (id)previewItemTitle
{
  id v3 = [(CKMediaObject *)self filename];
  if ([v3 isEqualToString:@"Audio Message.caf"])
  {

LABEL_4:
    objc_super v6 = CKFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"PREVIEW_TITLE_AUDIO_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    goto LABEL_6;
  }
  char v4 = [(CKMediaObject *)self filename];
  int v5 = [v4 isEqualToString:@"Audio Message.amr"];

  if (v5) {
    goto LABEL_4;
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3
{
  return [(CKAudioMediaObject *)self generatePlaceholderThumbnailForWidth:0 withColor:a3];
}

- (id)generatePlaceholderThumbnailForWidth:(double)a3 withColor:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CKAudioMediaObject_generatePlaceholderThumbnailForWidth_withColor___block_invoke;
  block[3] = &unk_1E5620C40;
  id v6 = v5;
  id v23 = v6;
  if (generatePlaceholderThumbnailForWidth_withColor__once != -1) {
    dispatch_once(&generatePlaceholderThumbnailForWidth_withColor__once, block);
  }
  id v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = a3 / (double)(unint64_t)[v7 waveformPowerLevelWidthIncrement];

  char v9 = +[CKUIBehavior sharedBehaviors];
  [v9 waveformHeight];
  double v11 = v10;

  id v12 = +[CKUIBehavior sharedBehaviors];
  double v13 = (double)(unint64_t)[v12 waveformPowerLevelWidthIncrement];

  double v14 = [MEMORY[0x1E4F42D90] mainScreen];
  [v14 scale];
  double v16 = v15;

  unint64_t v17 = (CGImage *)[(id)generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform CGImage];
  v25.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v25.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v25.size.width = (double)(unint64_t)v8 * v13 * v16;
  v25.size.height = v11 * v16;
  CGImageRef v18 = CGImageCreateWithImageInRect(v17, v25);
  if (v18)
  {
    CGImageRef v19 = v18;
    unint64_t v20 = [MEMORY[0x1E4F42A80] imageWithCGImage:v18 scale:0 orientation:v16];
    CFRelease(v19);
  }
  else
  {
    unint64_t v20 = 0;
  }

  return v20;
}

void __69__CKAudioMediaObject_generatePlaceholderThumbnailForWidth_withColor___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 waveformMaxPowerLevelsCount];

  char v4 = (char *)v7 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v3);
  bzero(v4, 8 * v3);
  uint64_t v5 = CKWaveformWithPowerLevels((uint64_t)v4, v3, *(void **)(a1 + 32));
  id v6 = (void *)generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform;
  generatePlaceholderThumbnailForWidth_withColor__sMaxWidthPlaceholderWaveform = v5;
}

- (NSURL)temporaryFileURL
{
  return self->_temporaryFileURL;
}

- (void)setTemporaryFileURL:(id)a3
{
}

- (int64_t)totalPacketsCount
{
  return self->_totalPacketsCount;
}

- (void)setTotalPacketsCount:(int64_t)a3
{
  self->_totalPacketsCount = a3;
}

- (NSArray)powerLevelsFromMetadata
{
  return self->_powerLevelsFromMetadata;
}

- (void)setPowerLevelsFromMetadata:(id)a3
{
}

- (double)durationFromMetadata
{
  return self->_durationFromMetadata;
}

- (void)setDurationFromMetadata:(double)a3
{
  self->_durationFromMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevelsFromMetadata, 0);

  objc_storeStrong((id *)&self->_temporaryFileURL, 0);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

@end