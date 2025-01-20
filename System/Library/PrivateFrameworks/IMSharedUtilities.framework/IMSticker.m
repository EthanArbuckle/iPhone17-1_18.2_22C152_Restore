@interface IMSticker
+ (IMAssociatedMessageGeometryDescriptor)geometryDescriptorFromUserInfoDictionary:(SEL)a3;
+ (id)saveAdaptiveImageGlyphToTemporaryFile:(id)a3;
+ (id)userInfoDictionaryWithExternalURI:(id)a3;
+ (id)userInfoDictionaryWithGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3;
+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 externalURI:(id)a10;
+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 stickerPositionVersion:(unint64_t)a10 externalURI:(id)a11;
- (BOOL)isEmojiSticker;
- (BOOL)isEqual:(id)a3;
- (IMSticker)init;
- (IMSticker)initWithAdaptiveImageGlyphFromUnknownSource:(id)a3;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 moodCategory:(id)a8 stickerName:(id)a9;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 moodCategory:(id)a8 stickerName:(id)a9 textToSpeechName:(id)a10;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 effectType:(int64_t)a12;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 effectType:(int64_t)a12 textToSpeechName:(id)a13;
- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 textToSpeechName:(id)a12;
- (IMSticker)initWithStickerIdentifier:(id)a3 stickerPackID:(id)a4 representations:(id)a5 effectType:(int64_t)a6 initialFrameIndex:(unint64_t)a7 externalURI:(id)a8 stickerName:(id)a9 accessibilityLabel:(id)a10 accessibilityName:(id)a11 searchText:(id)a12 sanitizedPrompt:(id)a13 metadata:(id)a14;
- (IMSticker)initWithStickerPropertyDictionary:(id)a3 stickerPackID:(id)a4 stickerPackBundlePath:(id)a5;
- (NSAdaptiveImageGlyph)cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly;
- (NSArray)representations;
- (NSData)metadata;
- (NSData)recipe;
- (NSDictionary)attributionInfo;
- (NSString)accessibilityLabel;
- (NSString)accessibilityName;
- (NSString)adaptiveImageGlyphContentDescription;
- (NSString)adaptiveImageGlyphContentIdentifier;
- (NSString)ballonBundleID;
- (NSString)externalURI;
- (NSString)moodCategory;
- (NSString)sanitizedPrompt;
- (NSString)searchText;
- (NSString)stickerGUID;
- (NSString)stickerName;
- (NSString)stickerPackGUID;
- (NSString)textToSpeechName;
- (NSString)uniqueID;
- (NSURL)animatedImageCacheURLFromExtension;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getSafeExternalURI;
- (int64_t)stickerEffectType;
- (unint64_t)hash;
- (unint64_t)initialFrameIndex;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityName:(id)a3;
- (void)setAdaptiveImageGlyphContentDescription:(id)a3;
- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3;
- (void)setAnimatedImageCacheURLFromExtension:(id)a3;
- (void)setAttributionInfo:(id)a3;
- (void)setBallonBundleID:(id)a3;
- (void)setCachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly:(id)a3;
- (void)setExternalURI:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setInitialFrameIndex:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setMoodCategory:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setRepresentations:(id)a3;
- (void)setSanitizedPrompt:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setStickerEffectType:(int64_t)a3;
- (void)setStickerName:(id)a3;
- (void)setStickerPackGUID:(id)a3;
@end

@implementation IMSticker

- (BOOL)isEmojiSticker
{
  return 0;
}

- (IMSticker)init
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "IMSticker. Calling init directly is not supported", v5, 2u);
    }
  }
  return 0;
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11
{
  return [(IMSticker *)self initWithStickerID:a3 stickerPackID:a4 fileURL:a5 accessibilityLabel:a6 accessibilityName:a7 searchText:a8 sanitizedPrompt:a9 moodCategory:a10 stickerName:a11 textToSpeechName:a11];
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 effectType:(int64_t)a12
{
  return [(IMSticker *)self initWithStickerID:a3 stickerPackID:a4 fileURL:a5 accessibilityLabel:a6 accessibilityName:a7 searchText:a8 sanitizedPrompt:a9 moodCategory:a10 stickerName:a11 effectType:a12 textToSpeechName:a11];
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 textToSpeechName:(id)a12
{
  return [(IMSticker *)self initWithStickerID:a3 stickerPackID:a4 fileURL:a5 accessibilityLabel:a6 accessibilityName:a7 searchText:a8 sanitizedPrompt:a9 moodCategory:a10 stickerName:a11 effectType:-1 textToSpeechName:a12];
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 searchText:(id)a8 sanitizedPrompt:(id)a9 moodCategory:(id)a10 stickerName:(id)a11 effectType:(int64_t)a12 textToSpeechName:(id)a13
{
  id v18 = a3;
  id v69 = a4;
  id v68 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  v67 = v18;
  if (v18)
  {
    v70.receiver = self;
    v70.super_class = (Class)IMSticker;
    v26 = [(IMSticker *)&v70 init];
    if (v26)
    {
      uint64_t v27 = [v18 copy];
      stickerGUID = v26->_stickerGUID;
      v26->_stickerGUID = (NSString *)v27;

      uint64_t v29 = [v69 copy];
      stickerPackGUID = v26->_stickerPackGUID;
      v26->_stickerPackGUID = (NSString *)v29;

      uint64_t v31 = [v68 copy];
      fileURL = v26->_fileURL;
      v26->_fileURL = (NSURL *)v31;

      uint64_t v33 = [v19 copy];
      accessibilityLabel = v26->_accessibilityLabel;
      v26->_accessibilityLabel = (NSString *)v33;

      uint64_t v35 = [v20 copy];
      accessibilityName = v26->_accessibilityName;
      v26->_accessibilityName = (NSString *)v35;

      uint64_t v37 = [v21 copy];
      searchText = v26->_searchText;
      v26->_searchText = (NSString *)v37;

      uint64_t v39 = [v22 copy];
      sanitizedPrompt = v26->_sanitizedPrompt;
      v26->_sanitizedPrompt = (NSString *)v39;

      uint64_t v41 = [v23 copy];
      moodCategory = v26->_moodCategory;
      v26->_moodCategory = (NSString *)v41;

      uint64_t v43 = [v24 copy];
      stickerName = v26->_stickerName;
      v26->_stickerName = (NSString *)v43;

      uint64_t v45 = [v25 copy];
      textToSpeechName = v26->_textToSpeechName;
      v26->_textToSpeechName = (NSString *)v45;

      id v47 = v25;
      id v48 = v22;
      v49 = NSString;
      [(IMSticker *)v26 stickerPackGUID];
      id v66 = v24;
      id v50 = v21;
      v52 = id v51 = v19;
      [(IMSticker *)v26 stickerGUID];
      id v53 = v23;
      v55 = id v54 = v20;
      v56 = v49;
      id v22 = v48;
      id v25 = v47;
      uint64_t v57 = [v56 stringWithFormat:@"%@.%@", v52, v55];
      uniqueID = v26->_uniqueID;
      v26->_uniqueID = (NSString *)v57;

      id v20 = v54;
      id v23 = v53;

      id v19 = v51;
      id v21 = v50;
      id v24 = v66;
      externalURI = v26->_externalURI;
      v26->_externalURI = 0;

      representations = v26->_representations;
      v26->_representations = 0;

      v26->_stickerEffectType = -1;
    }
    v61 = v26;
    v62 = v61;
  }
  else
  {
    v61 = self;
    v63 = IMLogHandleForCategory("IMSticker");
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0E50();
    }

    v62 = 0;
  }

  return v62;
}

- (IMSticker)initWithStickerIdentifier:(id)a3 stickerPackID:(id)a4 representations:(id)a5 effectType:(int64_t)a6 initialFrameIndex:(unint64_t)a7 externalURI:(id)a8 stickerName:(id)a9 accessibilityLabel:(id)a10 accessibilityName:(id)a11 searchText:(id)a12 sanitizedPrompt:(id)a13 metadata:(id)a14
{
  id v17 = a3;
  id v18 = a4;
  id obj = a5;
  id v55 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v56.receiver = self;
  v56.super_class = (Class)IMSticker;
  v26 = [(IMSticker *)&v56 init];
  if (v26)
  {
    uint64_t v27 = [v17 copy];
    stickerGUID = v26->_stickerGUID;
    v26->_stickerGUID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    stickerPackGUID = v26->_stickerPackGUID;
    v26->_stickerPackGUID = (NSString *)v29;

    fileURL = v26->_fileURL;
    v26->_fileURL = 0;

    uint64_t v32 = [v21 copy];
    accessibilityLabel = v26->_accessibilityLabel;
    v26->_accessibilityLabel = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    accessibilityName = v26->_accessibilityName;
    v26->_accessibilityName = (NSString *)v34;

    uint64_t v36 = [v23 copy];
    searchText = v26->_searchText;
    v26->_searchText = (NSString *)v36;

    uint64_t v38 = [v24 copy];
    sanitizedPrompt = v26->_sanitizedPrompt;
    v26->_sanitizedPrompt = (NSString *)v38;

    moodCategory = v26->_moodCategory;
    v26->_moodCategory = 0;

    uint64_t v41 = [v20 copy];
    stickerName = v26->_stickerName;
    v26->_stickerName = (NSString *)v41;

    textToSpeechName = v26->_textToSpeechName;
    v26->_textToSpeechName = 0;

    uint64_t v44 = [(IMSticker *)v26 stickerGUID];
    uniqueID = v26->_uniqueID;
    v26->_uniqueID = (NSString *)v44;

    uint64_t v46 = [v19 copy];
    externalURI = v26->_externalURI;
    v26->_externalURI = (NSString *)v46;

    objc_storeStrong((id *)&v26->_representations, obj);
    v26->_stickerEffectType = a6;
    v26->_initialFrameIndex = a7;
    uint64_t v48 = [v25 copy];
    metadata = v26->_metadata;
    v26->_metadata = (NSData *)v48;
  }
  return v26;
}

- (IMSticker)initWithAdaptiveImageGlyphFromUnknownSource:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)IMSticker;
  v6 = [(IMSticker *)&v38 init];
  if (v6)
  {
    v7 = [v5 contentIdentifier];
    uint64_t v8 = [v7 copy];
    stickerGUID = v6->_stickerGUID;
    v6->_stickerGUID = (NSString *)v8;

    stickerPackGUID = v6->_stickerPackGUID;
    v6->_stickerPackGUID = (NSString *)@"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension";

    v11 = +[IMSticker saveAdaptiveImageGlyphToTemporaryFile:v5];
    uint64_t v12 = [v11 copy];
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v12;

    v14 = [v5 contentIdentifier];
    uint64_t v15 = [v14 copy];
    adaptiveImageGlyphContentIdentifier = v6->_adaptiveImageGlyphContentIdentifier;
    v6->_adaptiveImageGlyphContentIdentifier = (NSString *)v15;

    id v17 = [v5 contentDescription];
    uint64_t v18 = [v17 copy];
    adaptiveImageGlyphContentDescription = v6->_adaptiveImageGlyphContentDescription;
    v6->_adaptiveImageGlyphContentDescription = (NSString *)v18;

    objc_storeStrong((id *)&v6->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly, a3);
    id v20 = [v5 contentDescription];
    uint64_t v21 = [v20 copy];
    accessibilityLabel = v6->_accessibilityLabel;
    v6->_accessibilityLabel = (NSString *)v21;

    moodCategory = v6->_moodCategory;
    v6->_moodCategory = 0;

    id v24 = [v5 contentDescription];
    uint64_t v25 = [v24 copy];
    stickerName = v6->_stickerName;
    v6->_stickerName = (NSString *)v25;

    uint64_t v27 = [v5 contentDescription];
    uint64_t v28 = [v27 copy];
    textToSpeechName = v6->_textToSpeechName;
    v6->_textToSpeechName = (NSString *)v28;

    v30 = NSString;
    uint64_t v31 = [(IMSticker *)v6 stickerPackGUID];
    uint64_t v32 = [(IMSticker *)v6 stickerGUID];
    uint64_t v33 = [v30 stringWithFormat:@"%@.%@", v31, v32];
    uniqueID = v6->_uniqueID;
    v6->_uniqueID = (NSString *)v33;

    externalURI = v6->_externalURI;
    v6->_externalURI = 0;

    representations = v6->_representations;
    v6->_representations = 0;

    v6->_stickerEffectType = -1;
  }

  return v6;
}

+ (id)saveAdaptiveImageGlyphToTemporaryFile:(id)a3
{
  id v3 = a3;
  v4 = [v3 contentIdentifier];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = objc_msgSend(v5, "im_temporaryFileURLForAdaptiveImageGlyphWithContentIdentifier:", v4);
  v7 = [v6 path];
  if ([v5 fileExistsAtPath:v7])
  {
    uint64_t v8 = IMLogHandleForCategory("IMSticker");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Temporary file already exists for adaptive image glyph content identifier, not re-saving image.", v13, 2u);
    }
  }
  else
  {
    uint64_t v8 = [v7 stringByDeletingLastPathComponent];
    if ((objc_msgSend(v5, "__im_makeDirectoriesInPath:mode:", v8, 448) & 1) == 0)
    {
      v9 = IMLogHandleForCategory("IMSticker");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0EB8();
      }
    }
    v10 = [v3 imageContent];
    if (([v10 writeToURL:v6 atomically:1] & 1) == 0)
    {
      v11 = IMLogHandleForCategory("IMSticker");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0E84();
      }
    }
  }

  return v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IMSticker Name: %@, guid %@, packID %@, fileURL %@, accessibilityLabel %@, moodCategory %@, attributionInfo: %@, balloonBundleID: %@, textToSpeechName: %@, externalURI: %@, self %p>", self->_stickerName, self->_stickerGUID, self->_stickerPackGUID, self->_fileURL, self->_accessibilityLabel, self->_moodCategory, self->_attributionInfo, self->_ballonBundleID, self->_textToSpeechName, self->_externalURI, self];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMSticker *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [(IMSticker *)self stickerGUID];
        v7 = [(IMSticker *)v5 stickerGUID];
        id v8 = v6;
        id v9 = v7;
        v10 = v9;
        if (v8 == v9)
        {
        }
        else
        {
          BOOL v11 = 0;
          uint64_t v12 = v9;
          id v13 = v8;
          if (!v8 || !v9) {
            goto LABEL_79;
          }
          int v14 = [v8 isEqualToString:v9];

          if (!v14)
          {
            BOOL v11 = 0;
LABEL_80:

            goto LABEL_81;
          }
        }
        uint64_t v15 = [(IMSticker *)self stickerPackGUID];
        v16 = [(IMSticker *)v5 stickerPackGUID];
        id v13 = v15;
        id v17 = v16;
        uint64_t v12 = v17;
        if (v13 == v17)
        {
        }
        else
        {
          BOOL v11 = 0;
          uint64_t v18 = v17;
          id v19 = v13;
          if (!v13 || !v17) {
            goto LABEL_78;
          }
          int v20 = [v13 isEqualToString:v17];

          if (!v20)
          {
            BOOL v11 = 0;
LABEL_79:

            goto LABEL_80;
          }
        }
        uint64_t v21 = [(IMSticker *)self stickerName];
        id v22 = [(IMSticker *)v5 stickerName];
        id v19 = v21;
        id v23 = v22;
        uint64_t v18 = v23;
        if (v19 == v23)
        {
        }
        else
        {
          BOOL v11 = 0;
          id v24 = v23;
          id v25 = v19;
          if (!v19 || !v23) {
            goto LABEL_77;
          }
          int v26 = [v19 isEqualToString:v23];

          if (!v26)
          {
            BOOL v11 = 0;
LABEL_78:

            goto LABEL_79;
          }
        }
        uint64_t v27 = [(IMSticker *)self textToSpeechName];
        uint64_t v28 = [(IMSticker *)v5 textToSpeechName];
        id v25 = v27;
        id v29 = v28;
        v74 = v29;
        v73 = v18;
        if (v25 != v29)
        {
          BOOL v11 = 0;
          if (v25)
          {
            v30 = v29;
            uint64_t v31 = v25;
            if (v29)
            {
              int v32 = [v25 isEqualToString:v29];

              if (!v32)
              {
                BOOL v11 = 0;
LABEL_76:
                id v24 = v74;
                uint64_t v18 = v73;
LABEL_77:

                goto LABEL_78;
              }
LABEL_30:
              id v72 = v25;
              uint64_t v33 = [(IMSticker *)self moodCategory];
              uint64_t v34 = [(IMSticker *)v5 moodCategory];
              id v35 = v33;
              id v36 = v34;
              objc_super v70 = v36;
              id v71 = v35;
              if (v35 == v36)
              {
              }
              else
              {
                BOOL v11 = 0;
                if (!v35)
                {
                  uint64_t v37 = v36;
                  id v25 = v72;
                  goto LABEL_73;
                }
                uint64_t v37 = v36;
                id v25 = v72;
                if (!v36)
                {
LABEL_73:

                  goto LABEL_74;
                }
                int v38 = [v35 isEqualToString:v36];

                if (!v38)
                {
                  BOOL v11 = 0;
                  id v25 = v72;
LABEL_74:
                  v30 = v70;
                  uint64_t v31 = v71;
                  goto LABEL_75;
                }
              }
              uint64_t v39 = [(IMSticker *)self accessibilityLabel];
              v40 = [(IMSticker *)v5 accessibilityLabel];
              id v35 = v39;
              id v41 = v40;
              id v68 = v35;
              id v69 = v41;
              if (v35 != v41)
              {
                BOOL v11 = 0;
                if (v35)
                {
                  v42 = v41;
                  id v25 = v72;
                  if (v41)
                  {
                    int v43 = [v35 isEqualToString:v41];

                    if (!v43)
                    {
                      BOOL v11 = 0;
                      id v25 = v72;
                      uint64_t v37 = v69;
                      goto LABEL_73;
                    }
LABEL_43:
                    uint64_t v44 = [(IMSticker *)self fileURL];
                    uint64_t v45 = [(IMSticker *)v5 fileURL];
                    id v46 = v44;
                    id v47 = v45;
                    id v66 = v47;
                    id v67 = v46;
                    if (v46 != v47)
                    {
                      BOOL v11 = 0;
                      if (v46)
                      {
                        uint64_t v48 = v47;
                        id v25 = v72;
                        if (v47)
                        {
                          int v49 = [v46 isEqual:v47];

                          if (!v49)
                          {
                            BOOL v11 = 0;
                            id v25 = v72;
LABEL_71:
                            v42 = v66;
                            id v35 = v67;
                            goto LABEL_72;
                          }
LABEL_50:
                          id v50 = [(IMSticker *)self representations];
                          id v51 = [(IMSticker *)v5 representations];
                          id v46 = v50;
                          id v52 = v51;
                          v65 = v52;
                          if (v46 == v52)
                          {
                          }
                          else
                          {
                            BOOL v11 = 0;
                            if (!v46)
                            {
                              id v53 = v52;
                              id v54 = 0;
                              goto LABEL_68;
                            }
                            id v53 = v52;
                            id v54 = v46;
                            if (!v52)
                            {
LABEL_68:

                              goto LABEL_69;
                            }
                            int v55 = [v46 isEqual:v52];

                            if (!v55)
                            {
                              BOOL v11 = 0;
LABEL_69:
                              id v25 = v72;
                              uint64_t v48 = v65;
                              goto LABEL_70;
                            }
                          }
                          objc_super v56 = [(IMSticker *)self externalURI];
                          uint64_t v57 = [(IMSticker *)v5 externalURI];
                          id v54 = v56;
                          id v58 = v57;
                          v59 = v58;
                          if (v54 == v58)
                          {
                            id v63 = v58;

                            id v64 = v54;
                          }
                          else
                          {
                            if (!v54 || !v58)
                            {

                              id v53 = v59;
                              BOOL v11 = 0;
                              goto LABEL_68;
                            }
                            int v62 = [v54 isEqualToString:v58];
                            id v63 = v59;

                            id v64 = v54;
                            if (!v62)
                            {
                              BOOL v11 = 0;
LABEL_65:
                              id v53 = v63;
                              id v54 = v64;
                              goto LABEL_68;
                            }
                          }
                          unint64_t v60 = [(IMSticker *)self initialFrameIndex];
                          BOOL v11 = v60 == [(IMSticker *)v5 initialFrameIndex];
                          goto LABEL_65;
                        }
                      }
                      else
                      {
                        uint64_t v48 = v47;
                        id v25 = v72;
                      }
LABEL_70:

                      goto LABEL_71;
                    }

                    goto LABEL_50;
                  }
                }
                else
                {
                  v42 = v41;
                  id v25 = v72;
                }
LABEL_72:

                id v35 = v68;
                uint64_t v37 = v69;
                goto LABEL_73;
              }

              goto LABEL_43;
            }
          }
          else
          {
            v30 = v29;
            uint64_t v31 = 0;
          }
LABEL_75:

          goto LABEL_76;
        }

        goto LABEL_30;
      }
    }
    BOOL v11 = 0;
  }
LABEL_81:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(IMSticker *)self uniqueID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (IMSticker)initWithStickerPropertyDictionary:(id)a3 stickerPackID:(id)a4 stickerPackBundlePath:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && v9
    && ([v8 objectForKey:@"IMStickerIdentifier"],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10)
    && v11)
  {
    uint64_t v12 = [v8 objectForKey:@"IMStickerIdentifier"];
    id v13 = [v12 im_lastPathComponent];
    if ([v13 length])
    {
      int v14 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v15 = [v10 stringByAppendingPathComponent:v13];
      v16 = [v14 fileURLWithPath:v15];

      id v17 = [v8 objectForKeyedSubscript:@"stickerEffectType"];
      objc_opt_class();
      id v29 = v13;
      if (objc_opt_isKindOfClass()) {
        uint64_t v24 = [v17 integerValue];
      }
      else {
        uint64_t v24 = -1;
      }
      uint64_t v27 = [v8 objectForKey:@"IMStickerIdentifier"];
      uint64_t v28 = [v8 objectForKey:@"IMStickerAccessibilityLabel"];
      int v26 = [v8 objectForKey:@"IMStickerAccessibilityName"];
      int v20 = [v8 objectForKey:@"IMStickerSearchText"];
      id v25 = [v8 objectForKey:@"IMStickerSanitizedPrompt"];
      uint64_t v21 = [v8 objectForKey:@"IMStickerMoodCategory"];
      id v22 = [v8 objectForKey:@"IMStickerName"];
      self = [(IMSticker *)self initWithStickerID:v27 stickerPackID:v9 fileURL:v16 accessibilityLabel:v28 accessibilityName:v26 searchText:v20 sanitizedPrompt:v25 moodCategory:v21 stickerName:v22 effectType:v24];

      uint64_t v18 = self;
      id v13 = v29;
    }
    else
    {
      id v19 = IMLogHandleForCategory("IMSticker");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1A09F0EEC((uint64_t)v12, v19);
      }

      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory("IMSticker");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_error_impl(&dword_1A0772000, v12, OS_LOG_TYPE_ERROR, "initWithStickerPropertyDictionary called with invalid parameters stickerPropertyDictionary %@ stickerPackGUID %@ stickerPackBundlePath %@", buf, 0x20u);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)getSafeExternalURI
{
  if ([(NSString *)self->_externalURI hasPrefix:@"sticker:///"])
  {
    unint64_t v3 = [(NSString *)self->_externalURI componentsSeparatedByString:@"/"];
    v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isValidUUID = TRUE"];
    id v5 = [v3 filteredArrayUsingPredicate:v4];

    if ((unint64_t)[v5 count] < 2)
    {
      if ([v5 count] == 1)
      {
        id v8 = [v5 firstObject];
        v7 = [(NSString *)self->_externalURI stringByReplacingOccurrencesOfString:v8 withString:&stru_1EF2CAD28];
      }
      else
      {
        v7 = self->_externalURI;
      }
    }
    else
    {
      v6 = IMLogHandleForCategory("IMSticker");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "This externalURI format was not accounted for at time of writing this function. Returning empty string.", buf, 2u);
      }

      v7 = &stru_1EF2CAD28;
    }
  }
  else
  {
    unint64_t v3 = IMLogHandleForCategory("IMSticker");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "externalURI did not start with 'sticker:///'. Returning empty string.", v10, 2u);
    }
    v7 = &stru_1EF2CAD28;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(IMSticker *)self representations];

  id v30 = objc_alloc((Class)objc_opt_class());
  id v31 = [(IMSticker *)self stickerGUID];
  uint64_t v5 = [(IMSticker *)self stickerPackGUID];
  if (v4)
  {
    uint64_t v28 = [(IMSticker *)self representations];
    uint64_t v6 = v5;
    int v26 = (void *)v5;
    int64_t v27 = [(IMSticker *)self stickerEffectType];
    unint64_t v7 = [(IMSticker *)self initialFrameIndex];
    id v8 = [(IMSticker *)self externalURI];
    id v9 = [(IMSticker *)self stickerName];
    id v10 = [(IMSticker *)self accessibilityLabel];
    BOOL v11 = [(IMSticker *)self accessibilityName];
    uint64_t v12 = [(IMSticker *)self searchText];
    id v13 = [(IMSticker *)self sanitizedPrompt];
    int v14 = [(IMSticker *)self metadata];
    uint64_t v15 = (void *)[v30 initWithStickerIdentifier:v31 stickerPackID:v6 representations:v28 effectType:v27 initialFrameIndex:v7 externalURI:v8 stickerName:v9 accessibilityLabel:v10 accessibilityName:v11 searchText:v12 sanitizedPrompt:v13 metadata:v14];
  }
  else
  {
    id v29 = [(IMSticker *)self fileURL];
    v16 = [(IMSticker *)self accessibilityLabel];
    id v17 = [(IMSticker *)self accessibilityName];
    uint64_t v18 = [(IMSticker *)self searchText];
    id v19 = [(IMSticker *)self sanitizedPrompt];
    int v20 = [(IMSticker *)self moodCategory];
    uint64_t v21 = [(IMSticker *)self stickerName];
    id v22 = [(IMSticker *)self textToSpeechName];
    id v23 = (void *)v5;
    uint64_t v15 = (void *)[v30 initWithStickerID:v31 stickerPackID:v5 fileURL:v29 accessibilityLabel:v16 accessibilityName:v17 searchText:v18 sanitizedPrompt:v19 moodCategory:v20 stickerName:v21 textToSpeechName:v22];

    objc_msgSend(v15, "setStickerEffectType:", -[IMSticker stickerEffectType](self, "stickerEffectType"));
  }
  id v24 = v15;

  return v24;
}

+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 stickerPositionVersion:(unint64_t)a10 externalURI:(id)a11
{
  v33[10] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = NSString;
  id v31 = a11;
  id v29 = objc_msgSend(v18, "stringWithFormat:", @"%tu", a3);
  id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%tu", 0);
  int v20 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&a4);
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&a5);
  id v22 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&a6);
  id v23 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&a7);
  id v24 = [NSNumber numberWithUnsignedInteger:a9];
  id v25 = objc_msgSend(NSString, "stringWithFormat:", @"%.8f", *(void *)&a8);
  int v26 = [NSNumber numberWithUnsignedInteger:a10];
  v32[0] = @"sli";
  v32[1] = @"sai";
  v33[0] = v29;
  v33[1] = v19;
  v32[2] = @"spw";
  v32[3] = @"sxs";
  v33[2] = v20;
  v33[3] = v21;
  v32[4] = @"sys";
  v32[5] = @"ssa";
  v33[4] = v22;
  v33[5] = v23;
  v32[6] = @"sro";
  v32[7] = @"safi";
  v33[6] = v25;
  v33[7] = v24;
  v32[8] = @"spv";
  v32[9] = @"suri";
  v33[8] = v26;
  v33[9] = v31;
  int64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:10];

  return v27;
}

+ (id)userInfoDictionaryWithLayoutIntent:(unint64_t)a3 parentPreviewWidth:(double)a4 xScalar:(double)a5 yScalar:(double)a6 scale:(double)a7 rotation:(double)a8 initialFrameIndex:(unint64_t)a9 externalURI:(id)a10
{
  return (id)MEMORY[0x1F4181798](IMSticker, sel_userInfoDictionaryWithLayoutIntent_parentPreviewWidth_xScalar_yScalar_scale_rotation_initialFrameIndex_stickerPositionVersion_externalURI_);
}

+ (id)userInfoDictionaryWithExternalURI:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v8 = @"suri";
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory("IMSticker");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1A09F0F64();
    }

    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)userInfoDictionaryWithGeometryDescriptor:(IMAssociatedMessageGeometryDescriptor *)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel_userInfoDictionaryWithLayoutIntent_parentPreviewWidth_xScalar_yScalar_scale_rotation_initialFrameIndex_externalURI_);
}

+ (IMAssociatedMessageGeometryDescriptor)geometryDescriptorFromUserInfoDictionary:(SEL)a3
{
  id v5 = a4;
  *(_OWORD *)&retstr->var0 = IMAssociatedMessageGeometryDescriptorZero;
  *(_OWORD *)&retstr->var2 = unk_1A0A078A8;
  *(_OWORD *)&retstr->var4 = xmmword_1A0A078B8;
  retstr->var6 = 0.0;
  if (v5)
  {
    id v30 = v5;
    uint64_t v6 = [v5 objectForKeyedSubscript:@"sli"];
    if (v6)
    {
      unint64_t v7 = [v30 objectForKeyedSubscript:@"sli"];
      unint64_t v8 = [v7 integerValue];
    }
    else
    {
      unint64_t v8 = 0;
    }
    retstr->var0 = v8;

    id v9 = [v30 objectForKeyedSubscript:@"sli"];
    double v10 = 0.0;
    double v11 = 0.0;
    if (v9)
    {
      uint64_t v12 = [v30 objectForKeyedSubscript:@"sli"];
      [v12 doubleValue];
      double v11 = v13;
    }
    retstr->var2 = v11;

    int v14 = [v30 objectForKeyedSubscript:@"sxs"];
    if (v14)
    {
      uint64_t v15 = [v30 objectForKeyedSubscript:@"sxs"];
      [v15 doubleValue];
      double v10 = v16;
    }
    retstr->var3 = v10;

    id v17 = [v30 objectForKeyedSubscript:@"sys"];
    double v18 = 0.0;
    double v19 = 0.0;
    if (v17)
    {
      int v20 = [v30 objectForKeyedSubscript:@"sys"];
      [v20 doubleValue];
      double v19 = v21;
    }
    retstr->var4 = v19;

    id v22 = [v30 objectForKeyedSubscript:@"ssa"];
    if (v22)
    {
      id v23 = [v30 objectForKeyedSubscript:@"ssa"];
      [v23 doubleValue];
      double v18 = v24;
    }
    retstr->var5 = v18;

    id v25 = [v30 objectForKeyedSubscript:@"sro"];
    if (v25)
    {
      int v26 = [v30 objectForKeyedSubscript:@"sro"];
      [v26 doubleValue];
      double v28 = v27;
    }
    else
    {
      double v28 = 0.0;
    }
    retstr->var6 = v28;

    id v5 = v30;
  }

  return result;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSString)stickerGUID
{
  return self->_stickerGUID;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (void)setAdaptiveImageGlyphContentIdentifier:(id)a3
{
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (void)setAdaptiveImageGlyphContentDescription:(id)a3
{
}

- (NSString)moodCategory
{
  return self->_moodCategory;
}

- (void)setMoodCategory:(id)a3
{
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (void)setStickerName:(id)a3
{
}

- (NSString)textToSpeechName
{
  return self->_textToSpeechName;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (void)setExternalURI:(id)a3
{
}

- (NSURL)animatedImageCacheURLFromExtension
{
  return self->_animatedImageCacheURLFromExtension;
}

- (void)setAnimatedImageCacheURLFromExtension:(id)a3
{
}

- (NSData)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (NSString)ballonBundleID
{
  return self->_ballonBundleID;
}

- (void)setBallonBundleID:(id)a3
{
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
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

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSAdaptiveImageGlyph)cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly
{
  return self->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly;
}

- (void)setCachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly:(id)a3
{
}

- (int64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(int64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (unint64_t)initialFrameIndex
{
  return self->_initialFrameIndex;
}

- (void)setInitialFrameIndex:(unint64_t)a3
{
  self->_initialFrameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_cachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_sanitizedPrompt, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_accessibilityName, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_ballonBundleID, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_animatedImageCacheURLFromExtension, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_textToSpeechName, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_moodCategory, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_stickerGUID, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 moodCategory:(id)a8 stickerName:(id)a9
{
  return [(IMSticker *)self initWithStickerID:a3 stickerPackID:a4 fileURL:a5 accessibilityLabel:a6 accessibilityName:a7 searchText:0 sanitizedPrompt:0 moodCategory:a8 stickerName:a9 textToSpeechName:0];
}

- (IMSticker)initWithStickerID:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 accessibilityLabel:(id)a6 accessibilityName:(id)a7 moodCategory:(id)a8 stickerName:(id)a9 textToSpeechName:(id)a10
{
  return [(IMSticker *)self initWithStickerID:a3 stickerPackID:a4 fileURL:a5 accessibilityLabel:a6 accessibilityName:a7 searchText:0 sanitizedPrompt:0 moodCategory:a8 stickerName:a9 textToSpeechName:a10];
}

@end