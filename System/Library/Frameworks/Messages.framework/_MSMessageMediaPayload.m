@interface _MSMessageMediaPayload
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isSticker;
- (BOOL)uriIsMemoji;
- (BOOL)uriIsUltraExtension;
- (CGRect)sourceFrame;
- (NSArray)stickerRepresentations;
- (NSData)data;
- (NSData)generativePlaygroundRecipeData;
- (NSData)mediaData;
- (NSData)stickerMetadata;
- (NSDictionary)attributionInfo;
- (NSString)accessibilityLabel;
- (NSString)accessibilityName;
- (NSString)externalURI;
- (NSString)mediaFilename;
- (NSString)mediaType;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (NSString)stickerName;
- (NSString)stickerPackGUID;
- (NSString)text;
- (NSURL)animatedImageCacheURL;
- (NSURL)mediaURL;
- (NSUUID)stickerStoreIdentifier;
- (UIImage)image;
- (_MSMessageMediaPayload)init;
- (_MSMessageMediaPayload)initWithCoder:(id)a3;
- (_MSMessageMediaPayload)initWithIMSticker:(id)a3;
- (_MSMessageMediaPayload)initWithSticker:(id)a3;
- (id)convertToStickerWithExtensionIdentifier:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (unint64_t)initialFrameIndex;
- (unint64_t)stickerEffectType;
- (unint64_t)stickerPositionVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityName:(id)a3;
- (void)setAnimatedImageCacheURL:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setData:(id)a3;
- (void)setExternalURI:(id)a3;
- (void)setGenerativePlaygroundRecipeData:(id)a3;
- (void)setImage:(id)a3;
- (void)setInitialFrameIndex:(unint64_t)a3;
- (void)setIsSticker:(BOOL)a3;
- (void)setMediaData:(id)a3;
- (void)setMediaFilename:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setMediaURL:(id)a3;
- (void)setSanitizedPrompt:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSourceFrame:(CGRect)a3;
- (void)setStickerEffectType:(unint64_t)a3;
- (void)setStickerMetadata:(id)a3;
- (void)setStickerName:(id)a3;
- (void)setStickerPackGUID:(id)a3;
- (void)setStickerPositionVersion:(unint64_t)a3;
- (void)setStickerRepresentations:(id)a3;
- (void)setStickerStoreIdentifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _MSMessageMediaPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)convertToStickerWithExtensionIdentifier:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_MSMessageMediaPayload *)self isSticker])
  {
    v10 = 0;
    goto LABEL_48;
  }
  uint64_t v5 = [(_MSMessageMediaPayload *)self stickerRepresentations];
  id v70 = v4;
  if (!v5
    || (v6 = (void *)v5,
        [(_MSMessageMediaPayload *)self stickerStoreIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v11 = NSString;
    v12 = [(_MSMessageMediaPayload *)self mediaURL];
    v13 = [v12 path];
    v14 = IMSharedHelperMD5HashOfFileAtPath();
    v15 = [v11 stringWithFormat:@"%@-sticker", v14];

    v16 = [(_MSMessageMediaPayload *)self mediaURL];
    uint64_t v17 = [v16 pathExtension];

    v69 = (void *)v17;
    if (v17)
    {
      uint64_t v18 = [v15 stringByAppendingPathExtension:v17];

      v15 = (void *)v18;
    }
    v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v20 = objc_msgSend(v19, "im_randomTemporaryFileURLWithFileName:", v15);

    v71 = (void *)v20;
    if (v20
      && ([(_MSMessageMediaPayload *)self mediaURL],
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v21))
    {
      v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      v23 = [(_MSMessageMediaPayload *)self mediaURL];
      id v73 = 0;
      int v24 = [v22 copyItemAtURL:v23 toURL:v20 error:&v73];
      id v25 = v73;

      if (!v24 || !v25) {
        goto LABEL_19;
      }
      v26 = ms_defaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:]();
      }
    }
    else
    {
      v26 = ms_defaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(_MSMessageMediaPayload *)self mediaURL];
        *(_DWORD *)buf = 138412546;
        uint64_t v75 = v20;
        __int16 v76 = 2112;
        v77 = v27;
        _os_log_impl(&dword_1E4A76000, v26, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: Cannot copy sticker file: %@ to %@, because either the source or destination file URL is nil. This may be expected if the original sticker did not have a file URL", buf, 0x16u);
      }
      id v25 = 0;
    }

LABEL_19:
    id v28 = v15;
    id v29 = v4;
    v66 = v25;
    if (+[_MSPresentationState isRunningInCameraContext])
    {
      v30 = [(_MSMessageMediaPayload *)self mediaFilename];
      if (!v30)
      {
        v31 = [(_MSMessageMediaPayload *)self mediaURL];
        v30 = [v31 lastPathComponent];
      }
    }
    else
    {
      v30 = 0;
    }
    id v32 = objc_alloc(MEMORY[0x1E4F6EA58]);
    v33 = [(_MSMessageMediaPayload *)self accessibilityLabel];
    v34 = [(_MSMessageMediaPayload *)self accessibilityName];
    v35 = [(_MSMessageMediaPayload *)self searchText];
    v36 = [(_MSMessageMediaPayload *)self sanitizedPrompt];
    v10 = (void *)[v32 initWithStickerID:v28 stickerPackID:v29 fileURL:v71 accessibilityLabel:v33 accessibilityName:v34 searchText:v35 sanitizedPrompt:v36 moodCategory:0 stickerName:v30];

    v37 = [(_MSMessageMediaPayload *)self stickerRepresentations];

    if (v37)
    {
      v38 = [(_MSMessageMediaPayload *)self stickerRepresentations];
      [v10 setRepresentations:v38];
    }
    v39 = [(_MSMessageMediaPayload *)self externalURI];

    if (v39)
    {
      v40 = [(_MSMessageMediaPayload *)self externalURI];
      [v10 setExternalURI:v40];
    }
    v41 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v42 = [v41 isStickersAppEnabled];

    if (v42 && [(_MSMessageMediaPayload *)self stickerEffectType]) {
      objc_msgSend(v10, "setStickerEffectType:", -[_MSMessageMediaPayload stickerEffectType](self, "stickerEffectType"));
    }

    id v4 = v70;
    goto LABEL_33;
  }
  v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isStickersAppEnabled];

  if (v9) {
    unint64_t v68 = [(_MSMessageMediaPayload *)self stickerEffectType];
  }
  else {
    unint64_t v68 = -1;
  }
  id v67 = objc_alloc(MEMORY[0x1E4F6EA58]);
  v72 = [(_MSMessageMediaPayload *)self stickerStoreIdentifier];
  v64 = [v72 UUIDString];
  v43 = [(_MSMessageMediaPayload *)self stickerRepresentations];
  unint64_t v65 = [(_MSMessageMediaPayload *)self initialFrameIndex];
  v44 = [(_MSMessageMediaPayload *)self externalURI];
  v45 = [(_MSMessageMediaPayload *)self stickerName];
  v63 = [(_MSMessageMediaPayload *)self accessibilityLabel];
  v46 = [(_MSMessageMediaPayload *)self accessibilityName];
  v47 = [(_MSMessageMediaPayload *)self searchText];
  v48 = [(_MSMessageMediaPayload *)self sanitizedPrompt];
  v49 = [(_MSMessageMediaPayload *)self stickerMetadata];
  v10 = (void *)[v67 initWithStickerIdentifier:v64 stickerPackID:v4 representations:v43 effectType:v68 initialFrameIndex:v65 externalURI:v44 stickerName:v45 accessibilityLabel:v63 accessibilityName:v46 searchText:v47 sanitizedPrompt:v48 metadata:v49];

LABEL_33:
  v50 = IMBalloonExtensionIDWithSuffix();
  int v51 = [v4 isEqualToString:v50];

  if (v51)
  {
    v52 = [(_MSMessageMediaPayload *)self animatedImageCacheURL];
    [v10 setAnimatedImageCacheURLFromExtension:v52];
  }
  v53 = [MEMORY[0x1E4F6BC18] sharedInstance];
  v54 = [v53 balloonPluginForBundleID:v4];

  if (v54)
  {
    v55 = v54;
  }
  else
  {
    v56 = ms_defaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:]();
    }

    v55 = self;
  }
  v57 = [(_MSMessageMediaPayload *)v55 attributionInfo];
  Mutable = (__CFDictionary *)[v57 mutableCopy];

  if (!Mutable)
  {
    v59 = ms_defaultLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[_MSMessageMediaPayload convertToStickerWithExtensionIdentifier:]();
    }

    Mutable = [MEMORY[0x1E4F1CA60] dictionary];
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
  }
  v60 = [v10 accessibilityLabel];
  if (v60) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6D3C0], v60);
  }

  v61 = (void *)[(__CFDictionary *)Mutable copy];
  [v10 setAttributionInfo:v61];

LABEL_48:

  return v10;
}

- (_MSMessageMediaPayload)initWithSticker:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_MSMessageMediaPayload;
  uint64_t v5 = [(_MSMessageMediaPayload *)&v40 init];
  if (v5)
  {
    uint64_t v6 = [v4 imageFileURL];
    mediaURL = v5->_mediaURL;
    v5->_mediaURL = (NSURL *)v6;

    uint64_t v8 = [v4 localizedDescription];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    v5->_isSticker = 1;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v4 data];
      data = v5->_data;
      v5->_data = (NSData *)v10;
    }
    uint64_t v12 = [v4 stickerPackGUID];
    stickerPackGUID = v5->_stickerPackGUID;
    v5->_stickerPackGUID = (NSString *)v12;

    uint64_t v14 = [v4 representations];
    stickerRepresentations = v5->_stickerRepresentations;
    v5->_stickerRepresentations = (NSArray *)v14;

    uint64_t v16 = [v4 externalURI];
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v16;

    uint64_t v18 = [v4 stickerIdentifier];
    stickerStoreIdentifier = v5->_stickerStoreIdentifier;
    v5->_stickerStoreIdentifier = (NSUUID *)v18;

    v5->_stickerEffectType = [v4 stickerEffectType];
    uint64_t v20 = [v4 attributionInfo];
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v20;

    if (!v5->_attributionInfo)
    {
      v22 = ms_defaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[_MSMessageMediaPayload initWithSticker:](v22);
      }
    }
    uint64_t v23 = [v4 animatedImageCacheURL];
    animatedImageCacheURL = v5->_animatedImageCacheURL;
    v5->_animatedImageCacheURL = (NSURL *)v23;

    uint64_t v25 = *MEMORY[0x1E4F6D3E0];
    v26 = [(NSDictionary *)v5->_attributionInfo objectForKey:*MEMORY[0x1E4F6D3E0]];

    if (!v26)
    {
      if ([(_MSMessageMediaPayload *)v5 uriIsMemoji])
      {
        v27 = ms_defaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4A76000, v27, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be Memoji. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        id v28 = (id *)MEMORY[0x1E4F6CB78];
LABEL_13:
        id v29 = *v28;
        if (!v29) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      if (!IMIsRunningIniMessageAppExtension())
      {
        if (![(_MSMessageMediaPayload *)v5 uriIsUltraExtension]) {
          goto LABEL_25;
        }
        v39 = ms_defaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4A76000, v39, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be StickersUltraExtension. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        id v28 = (id *)MEMORY[0x1E4F6CAF8];
        goto LABEL_13;
      }
      v30 = [MEMORY[0x1E4F28B50] mainBundle];
      id v29 = [v30 bundleIdentifier];
      if (v29)
      {
        v31 = ms_defaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v29;
          _os_log_impl(&dword_1E4A76000, v31, OS_LOG_TYPE_DEFAULT, "MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID from 3rd party extension: %@", buf, 0xCu);
        }

        id v32 = v29;
      }

      if (v29)
      {
LABEL_21:
        v33 = v5->_attributionInfo;
        if (v33)
        {
          v34 = (void *)[(NSDictionary *)v33 mutableCopy];
        }
        else
        {
          v34 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v35 = v34;
        [v34 setObject:v29 forKey:v25];
        uint64_t v36 = [v35 copy];
        v37 = v5->_attributionInfo;
        v5->_attributionInfo = (NSDictionary *)v36;
      }
    }
  }
LABEL_25:

  return v5;
}

- (_MSMessageMediaPayload)initWithIMSticker:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_MSMessageMediaPayload;
  uint64_t v5 = [(_MSMessageMediaPayload *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 fileURL];
    mediaURL = v5->_mediaURL;
    v5->_mediaURL = (NSURL *)v6;

    uint64_t v8 = [v4 accessibilityLabel];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;

    uint64_t v10 = [v4 accessibilityName];
    accessibilityName = v5->_accessibilityName;
    v5->_accessibilityName = (NSString *)v10;

    uint64_t v12 = [v4 searchText];
    searchText = v5->_searchText;
    v5->_searchText = (NSString *)v12;

    uint64_t v14 = [v4 sanitizedPrompt];
    sanitizedPrompt = v5->_sanitizedPrompt;
    v5->_sanitizedPrompt = (NSString *)v14;

    v5->_isSticker = 1;
    uint64_t v16 = [v4 stickerPackGUID];
    stickerPackGUID = v5->_stickerPackGUID;
    v5->_stickerPackGUID = (NSString *)v16;

    uint64_t v18 = [v4 representations];
    stickerRepresentations = v5->_stickerRepresentations;
    v5->_stickerRepresentations = (NSArray *)v18;

    uint64_t v20 = [v4 externalURI];
    externalURI = v5->_externalURI;
    v5->_externalURI = (NSString *)v20;

    id v22 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v23 = [v4 uniqueID];
    uint64_t v24 = [v22 initWithUUIDString:v23];
    stickerStoreIdentifier = v5->_stickerStoreIdentifier;
    v5->_stickerStoreIdentifier = (NSUUID *)v24;

    v5->_stickerEffectType = [v4 stickerEffectType];
    v26 = [v4 attributionInfo];
    uint64_t v27 = [v26 copy];
    attributionInfo = v5->_attributionInfo;
    v5->_attributionInfo = (NSDictionary *)v27;

    if (!v5->_attributionInfo)
    {
      id v29 = ms_defaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_MSMessageMediaPayload initWithSticker:](v29);
      }
    }
    v30 = [v4 ballonBundleID];
    char v31 = [v30 containsString:*MEMORY[0x1E4F6CBE8]];

    if ((v31 & 1) == 0)
    {
      uint64_t v32 = [v4 animatedImageCacheURLFromExtension];
      animatedImageCacheURL = v5->_animatedImageCacheURL;
      v5->_animatedImageCacheURL = (NSURL *)v32;
    }
    uint64_t v34 = *MEMORY[0x1E4F6D3E0];
    v35 = [(NSDictionary *)v5->_attributionInfo objectForKey:*MEMORY[0x1E4F6D3E0]];

    if (!v35)
    {
      if ([(_MSMessageMediaPayload *)v5 uriIsMemoji])
      {
        uint64_t v36 = ms_defaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4A76000, v36, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be Memoji. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v37 = (id *)MEMORY[0x1E4F6CB78];
LABEL_13:
        id v38 = *v37;
        if (!v38) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      if (!IMIsRunningIniMessageAppExtension())
      {
        if (![(_MSMessageMediaPayload *)v5 uriIsUltraExtension]) {
          goto LABEL_25;
        }
        v48 = ms_defaultLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4A76000, v48, OS_LOG_TYPE_DEFAULT, "_MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID to be StickersUltraExtension. This means the extension didn't set a bundle ID on the attribution info.", buf, 2u);
        }

        v37 = (id *)MEMORY[0x1E4F6CAF8];
        goto LABEL_13;
      }
      v39 = [MEMORY[0x1E4F28B50] mainBundle];
      id v38 = [v39 bundleIdentifier];
      if (v38)
      {
        objc_super v40 = ms_defaultLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v38;
          _os_log_impl(&dword_1E4A76000, v40, OS_LOG_TYPE_DEFAULT, "MSMessageMediaPayload: No bundle ID in attribution info, but inferred the bundle ID from 3rd party extension: %@", buf, 0xCu);
        }

        id v41 = v38;
      }

      if (v38)
      {
LABEL_21:
        id v42 = v5->_attributionInfo;
        if (v42)
        {
          uint64_t v43 = (void *)[(NSDictionary *)v42 mutableCopy];
        }
        else
        {
          uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        v44 = v43;
        [v43 setObject:v38 forKey:v34];
        uint64_t v45 = [v44 copy];
        v46 = v5->_attributionInfo;
        v5->_attributionInfo = (NSDictionary *)v45;
      }
    }
  }
LABEL_25:

  return v5;
}

- (BOOL)uriIsMemoji
{
  externalURI = self->_externalURI;
  return externalURI && [(NSString *)externalURI hasPrefix:@"sticker:///memoji"];
}

- (BOOL)uriIsUltraExtension
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_externalURI)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [&unk_1F406F120 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(&unk_1F406F120);
          }
          if ([(NSString *)self->_externalURI hasPrefix:*(void *)(*((void *)&v8 + 1) + 8 * i)])
          {
            LOBYTE(v3) = 1;
            return v3;
          }
        }
        uint64_t v4 = [&unk_1F406F120 countByEnumeratingWithState:&v8 objects:v12 count:16];
        LOBYTE(v3) = 0;
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (_MSMessageMediaPayload)initWithCoder:(id)a3
{
  v61[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)_MSMessageMediaPayload;
  uint64_t v5 = [(_MSMessageMediaPayload *)&v58 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaData"];
    long long v9 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaFilename"];
    long long v11 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    uint64_t v13 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    v15 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gpRecipeData"];
    uint64_t v17 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityLabel"];
    v19 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityName"];
    v21 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchText"];
    uint64_t v23 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedPrompt"];
    uint64_t v25 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerPackGUID"];
    uint64_t v27 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v26;

    v5[8] = [v4 decodeBoolForKey:@"isSticker"];
    id v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceFrame"];
    id v29 = v28;
    if (v28)
    {
      [v28 CGRectValue];
      *((void *)v5 + 25) = v30;
      *((void *)v5 + 26) = v31;
      *((void *)v5 + 27) = v32;
      *((void *)v5 + 28) = v33;
    }
    else
    {
      long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)(v5 + 200) = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v5 + 216) = v34;
    }
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialFrameIndex"];
    *((void *)v5 + 18) = [v35 unsignedIntegerValue];
    Class v36 = NSClassFromString(&cfstr_Uistickerrepre.isa);
    if (v36)
    {
      uint64_t v37 = [v4 decodeArrayOfObjectsOfClass:v36 forKey:@"stickerRepresentations"];
      id v38 = (void *)*((void *)v5 + 19);
      *((void *)v5 + 19) = v37;
    }
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalURI"];
    objc_super v40 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerStoreIdentifier"];
    id v42 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerName"];
    v44 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributionInfoData"];
    *((void *)v5 + 5) = (int)[v4 decodeIntForKey:@"stickerEffectType"];
    v46 = (void *)MEMORY[0x1E4F1CAD0];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    v61[2] = objc_opt_class();
    v61[3] = objc_opt_class();
    v61[4] = objc_opt_class();
    v61[5] = objc_opt_class();
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
    v48 = [v46 setWithArray:v47];

    if (objc_opt_respondsToSelector())
    {
      id v57 = 0;
      uint64_t v49 = [MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v48 fromData:v45 error:&v57];
      id v50 = v57;
      id v51 = (void *)*((void *)v5 + 14);
      *((void *)v5 + 14) = v49;
    }
    else
    {
      uint64_t v52 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v48 fromData:v45 error:0];
      id v50 = 0;
      id v51 = (void *)*((void *)v5 + 14);
      *((void *)v5 + 14) = v52;
    }

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"animatedImageCacheURL"];
    v54 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v53;

    if (v50)
    {
      v55 = ms_defaultLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v60 = v50;
        _os_log_impl(&dword_1E4A76000, v55, OS_LOG_TYPE_DEFAULT, "strict-decoding 011 exception/error after unarchivedObjectOfClasses: [%@]", buf, 0xCu);
      }
    }
  }

  return (_MSMessageMediaPayload *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = self->_mediaData;
  uint64_t v5 = self->_mediaType;
  uint64_t v6 = self->_mediaFilename;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    goto LABEL_11;
  }
  image = self->_image;
  if (image)
  {
    long long v9 = [(UIImage *)image __ms_PNGData];

    id v10 = (id)*MEMORY[0x1E4F22678];
    goto LABEL_12;
  }
  mediaURL = self->_mediaURL;
  if (mediaURL)
  {
    long long v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:mediaURL options:8 error:0];

    id v10 = [(NSURL *)self->_mediaURL __ms_UTI];

    if (!v6)
    {
      uint64_t v6 = [(NSURL *)self->_mediaURL lastPathComponent];
    }
  }
  else
  {
LABEL_11:
    long long v9 = v4;
    id v10 = v5;
  }
LABEL_12:
  [v15 encodeObject:v10 forKey:@"mediaType"];
  [v15 encodeObject:v9 forKey:@"mediaData"];
  [v15 encodeObject:v6 forKey:@"mediaFilename"];
  [v15 encodeObject:self->_text forKey:@"text"];
  [v15 encodeObject:self->_data forKey:@"data"];
  [v15 encodeObject:self->_generativePlaygroundRecipeData forKey:@"gpRecipeData"];
  [v15 encodeObject:self->_accessibilityLabel forKey:@"accessibilityLabel"];
  [v15 encodeObject:self->_accessibilityName forKey:@"accessibilityName"];
  [v15 encodeObject:self->_searchText forKey:@"searchText"];
  [v15 encodeObject:self->_sanitizedPrompt forKey:@"sanitizedPrompt"];
  [v15 encodeObject:self->_stickerPackGUID forKey:@"stickerPackGUID"];
  [v15 encodeBool:self->_isSticker forKey:@"isSticker"];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_sourceFrame.origin.x, self->_sourceFrame.origin.y, self->_sourceFrame.size.width, self->_sourceFrame.size.height);
  [v15 encodeObject:v12 forKey:@"sourceFrame"];

  uint64_t v13 = [NSNumber numberWithUnsignedInteger:self->_initialFrameIndex];
  [v15 encodeObject:v13 forKey:@"initialFrameIndex"];

  [v15 encodeObject:self->_stickerRepresentations forKey:@"stickerRepresentations"];
  [v15 encodeObject:self->_externalURI forKey:@"externalURI"];
  [v15 encodeObject:self->_stickerStoreIdentifier forKey:@"stickerStoreIdentifier"];
  [v15 encodeObject:self->_stickerName forKey:@"stickerName"];
  [v15 encodeObject:self->_animatedImageCacheURL forKey:@"animatedImageCacheURL"];
  uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_attributionInfo requiringSecureCoding:1 error:0];
  [v15 encodeObject:v14 forKey:@"attributionInfoData"];

  [v15 encodeInteger:self->_stickerEffectType forKey:@"stickerEffectType"];
}

- (_MSMessageMediaPayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)_MSMessageMediaPayload;
  return [(_MSMessageMediaPayload *)&v3 init];
}

- (void)setMediaURL:(id)a3
{
  id v4 = (NSURL *)a3;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  mediaURL = self->_mediaURL;
  self->_mediaURL = v4;
}

- (NSURL)mediaURL
{
  mediaURL = self->_mediaURL;
  if (!mediaURL)
  {
    if (self->_mediaData && self->_mediaType)
    {
      id v4 = +[_MSTempFileManager sharedInstance];
      uint64_t v5 = [v4 writeTemporaryFileWithData:self->_mediaData type:self->_mediaType];
      uint64_t v6 = self->_mediaURL;
      self->_mediaURL = v5;

      mediaURL = self->_mediaURL;
    }
    else
    {
      mediaURL = 0;
    }
  }

  return mediaURL;
}

- (void)setImage:(id)a3
{
  id v4 = (UIImage *)a3;
  mediaType = self->_mediaType;
  self->_mediaType = 0;

  mediaData = self->_mediaData;
  self->_mediaData = 0;

  image = self->_image;
  self->_image = v4;
}

- (UIImage)image
{
  if (!self->_image)
  {
    if (self->_mediaData)
    {
      CFStringRef mediaType = (const __CFString *)self->_mediaType;
      if (mediaType)
      {
        if (UTTypeConformsTo(mediaType, (CFStringRef)*MEMORY[0x1E4F225F8]))
        {
          uint64_t v6 = [MEMORY[0x1E4F42A80] imageWithData:self->_mediaData];
          image = self->_image;
          self->_image = v6;
        }
      }
    }
  }
  objc_super v3 = self->_image;

  return v3;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1F406F138;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1F406F150;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, void))a4;
  if ([a3 isEqualToString:@"com.apple.sticker.mediaPayload"])
  {
    BOOL v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    v6[2](v6, v7, 0);
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:8675309 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v7);
  }

  return 0;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v11 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:&v11];
  id v7 = v11;
  uint64_t v8 = v7;
  if (a5 && !v6)
  {
    *a5 = v7;
    long long v9 = ms_defaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_MSMessageMediaPayload objectWithItemProviderData:typeIdentifier:error:]();
    }
  }

  return v6;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSData)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
}

- (NSString)mediaFilename
{
  return self->_mediaFilename;
}

- (void)setMediaFilename:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityName
{
  return self->_accessibilityName;
}

- (void)setAccessibilityName:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSString)sanitizedPrompt
{
  return self->_sanitizedPrompt;
}

- (void)setSanitizedPrompt:(id)a3
{
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
}

- (unint64_t)stickerPositionVersion
{
  return self->_stickerPositionVersion;
}

- (void)setStickerPositionVersion:(unint64_t)a3
{
  self->_stickerPositionVersion = a3;
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
}

- (CGRect)sourceFrame
{
  double x = self->_sourceFrame.origin.x;
  double y = self->_sourceFrame.origin.y;
  double width = self->_sourceFrame.size.width;
  double height = self->_sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndedouble x = a3;
}

- (NSArray)stickerRepresentations
{
  return self->_stickerRepresentations;
}

- (void)setStickerRepresentations:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
}

- (NSUUID)stickerStoreIdentifier
{
  return self->_stickerStoreIdentifier;
}

- (void)setStickerStoreIdentifier:(id)a3
{
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void)setStickerName:(id)a3
{
}

- (NSData)stickerMetadata
{
  return self->_stickerMetadata;
}

- (void)setStickerMetadata:(id)a3
{
}

- (NSURL)animatedImageCacheURL
{
  return self->_animatedImageCacheURL;
}

- (void)setAnimatedImageCacheURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_stickerMetadata, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_stickerStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_stickerRepresentations, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_sanitizedPrompt, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mediaFilename, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (void)convertToStickerWithExtensionIdentifier:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1E4A76000, v1, OS_LOG_TYPE_ERROR, "IMStickerFromPayload: could not generate attribution info for '%@' even after attempting to fall back to using the info on the media payload: %@", v2, 0x16u);
}

- (void)convertToStickerWithExtensionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1E4A76000, v0, v1, "IMStickerFromPayload: unable to find plugin for %@", v2, v3, v4, v5, v6);
}

- (void)convertToStickerWithExtensionIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1E4A76000, v0, v1, "Error copying sticker file: %@", v2, v3, v4, v5, v6);
}

- (void)initWithSticker:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E4A76000, log, OS_LOG_TYPE_ERROR, "_MSMessageMediaPayload: Missing sticker attributionInfo in initWithSticker", v1, 2u);
}

+ (void)objectWithItemProviderData:typeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1E4A76000, v0, v1, "Decoding _MSMessageMediaPayload for sticker failed with error: %@", v2, v3, v4, v5, v6);
}

@end