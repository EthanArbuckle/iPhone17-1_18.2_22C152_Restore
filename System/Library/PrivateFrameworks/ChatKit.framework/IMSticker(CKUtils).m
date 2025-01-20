@interface IMSticker(CKUtils)
+ (BOOL)dragItemIsRepositioningSticker:()CKUtils;
+ (double)calculatePreviewScaleWithTargetSize:()CKUtils imageData:;
+ (double)calculatedRecentsItemWidthFromStickersUltraExtensionForStickerChatItem:()CKUtils collectionViewWidth:;
+ (id)stickerWithMSMessageMediaPayload:()CKUtils;
+ (uint64_t)dragItemIsSticker:()CKUtils;
+ (uint64_t)dropSessionIsRepositioningSticker:()CKUtils;
- (CKImageData)imageData;
- (double)calculatePreviewScaleWithTargetSize:()CKUtils;
- (id)image;
- (id)initWithUISticker:()CKUtils adaptiveImageGlyph:;
- (id)stickerEffectViewForStickerChatItem:()CKUtils;
- (id)uiSticker;
- (void)stickerEffectViewSnapshotForStickerChatItem:()CKUtils completion:;
- (void)stickerViewForStickerChatItem:()CKUtils snapshotEffectView:completion:;
@end

@implementation IMSticker(CKUtils)

- (id)initWithUISticker:()CKUtils adaptiveImageGlyph:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  v33 = [v6 representations];
  uint64_t v9 = [v6 effectType];
  v10 = [v6 externalURI];
  v29 = [v6 name];
  v11 = [v6 accessibilityLabel];
  v32 = [v6 accessibilityName];
  v31 = [v6 searchText];
  if (objc_opt_respondsToSelector())
  {
    v28 = [v6 sanitizedPrompt];
  }
  else
  {
    v28 = 0;
  }
  v30 = [v6 metadata];
  v12 = [v6 attributionInfo];
  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F6D3E0]];
  if (v13)
  {
    id v14 = (id)v13;
    v15 = a1;
    v16 = +[CKBalloonPluginManager sharedInstance];
    v17 = [v16 pluginForIdentifier:v14];
    if (v17)
    {

      a1 = v15;
      goto LABEL_15;
    }

    v12 = 0;
    a1 = v15;
  }
  switch(objc_msgSend(v6, "_ck_stickerType"))
  {
    case 0:
    case 1:
    case 2:
      v18 = (id *)MEMORY[0x1E4F6CAF8];
      goto LABEL_14;
    case 3:
      v18 = (id *)MEMORY[0x1E4F6CB78];
      goto LABEL_14;
    case 4:
      v18 = (id *)MEMORY[0x1E4F6CBA8];
      goto LABEL_14;
    case 5:
      v18 = (id *)MEMORY[0x1E4F6CBD0];
LABEL_14:
      id v14 = *v18;
      break;
    default:
      id v14 = 0;
      break;
  }
LABEL_15:
  id v19 = (id)[a1 initWithStickerIdentifier:v8 stickerPackID:v14 representations:v33 effectType:v9 initialFrameIndex:0 externalURI:v10 stickerName:v29 accessibilityLabel:v11 accessibilityName:v32 searchText:v31 sanitizedPrompt:v28 metadata:v30];
  [v19 setAttributionInfo:v12];
  if (v7)
  {
    [MEMORY[0x1E4F6EA58] saveAdaptiveImageGlyphToTemporaryFile:v7];
    v20 = v27 = v8;
    v21 = (void *)[v20 copy];
    [v19 setFileURL:v21];

    [v19 setRepresentations:0];
    v22 = [v7 contentIdentifier];
    v23 = (void *)[v22 copy];
    [v19 setAdaptiveImageGlyphContentIdentifier:v23];

    v24 = [v7 contentDescription];
    v25 = (void *)[v24 copy];
    [v19 setAdaptiveImageGlyphContentDescription:v25];

    [v19 setCachedAdaptiveImageGlyphForSkippingPreviewGenerationOnly:v7];
    v8 = v27;
  }

  return v19;
}

- (id)uiSticker
{
  v2 = [a1 stickerGUID];
  v3 = [a1 representations];
  uint64_t v22 = [a1 stickerEffectType];
  v4 = [a1 externalURI];
  v5 = [a1 attributionInfo];
  id v6 = [a1 stickerName];
  id v7 = [a1 accessibilityLabel];
  v8 = [a1 accessibilityName];
  uint64_t v9 = [a1 searchText];
  v23 = [a1 sanitizedPrompt];
  v10 = [a1 metadata];
  if (![v3 count])
  {
    v11 = [a1 fileURL];
    objc_msgSend((id)MEMORY[0x192FBA860](@"MSSticker", @"Messages"), "_stickerRepresentationsForImageFileURL:", v11);
    v21 = v9;
    v12 = v8;
    uint64_t v13 = v7;
    id v14 = v6;
    v15 = v5;
    v16 = v4;
    uint64_t v18 = v17 = v2;

    v3 = (void *)v18;
    v2 = v17;
    v4 = v16;
    v5 = v15;
    id v6 = v14;
    id v7 = v13;
    v8 = v12;
    uint64_t v9 = v21;
  }
  id v19 = objc_opt_new();
  [v19 setIdentifier:v2];
  [v19 setRepresentations:v3];
  [v19 setAttributionInfo:v5];
  [v19 setEffectType:v22];
  [v19 setName:v6];
  [v19 setExternalURI:v4];
  [v19 setSearchText:v9];
  if (objc_opt_respondsToSelector()) {
    [v19 setSanitizedPrompt:v23];
  }
  [v19 setAccessibilityName:v8];
  [v19 setAccessibilityLabel:v7];
  [v19 setMetadata:v10];

  return v19;
}

+ (id)stickerWithMSMessageMediaPayload:()CKUtils
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 attributionInfo];
    uint64_t v5 = *MEMORY[0x1E4F6D3E0];
    id v6 = [v4 objectForKey:*MEMORY[0x1E4F6D3E0]];

    if (v6)
    {
      if ([v6 containsString:@"com.apple.messages.MSMessageExtensionBalloonPlugin:"])
      {
        id v7 = [v6 componentsSeparatedByString:@":"];
        uint64_t v8 = [v7 lastObject];

        id v6 = (void *)v8;
      }
      uint64_t v9 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
      uint64_t v10 = [v9 teamIdentifier];
      v11 = (void *)v10;
      v12 = @"0000000000";
      if (v10) {
        v12 = (__CFString *)v10;
      }
      uint64_t v13 = v12;

      id v14 = IMBalloonExtensionIDWithTeamAndSuffix();

      v15 = [MEMORY[0x1E4F6BC18] sharedInstance];
      v16 = [v15 balloonPluginForBundleID:v14];

      v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v16 identifier];
        int v25 = 138412290;
        v26 = v18;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Using plugin identifier for sticker drop: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[IMSticker(CKUtils) stickerWithMSMessageMediaPayload:](v5, v9);
      }
      id v6 = 0;
      v16 = 0;
    }

    uint64_t v20 = [v16 identifier];
    v21 = (void *)v20;
    uint64_t v22 = &stru_1EDE4CA38;
    if (v20) {
      uint64_t v22 = (__CFString *)v20;
    }
    v23 = v22;

    id v19 = [v3 convertToStickerWithExtensionIdentifier:v23];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)image
{
  v2 = [a1 fileURL];
  id v3 = [v2 path];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v5 = [a1 fileURL];
    id v6 = [v5 path];
    id v7 = [v4 imageWithContentsOfFile:v6];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v8 = [a1 representations];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 data];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v5 = [a1 representations];
    id v6 = [v5 firstObject];
    v12 = [v6 data];
    id v7 = [v11 imageWithData:v12];

    goto LABEL_5;
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (CKImageData)imageData
{
  v2 = [a1 fileURL];
  id v3 = [v2 path];

  if (v3)
  {
    v4 = [CKImageData alloc];
    uint64_t v5 = [a1 fileURL];
    id v6 = [(CKImageData *)v4 initWithURL:v5];
LABEL_5:

    goto LABEL_6;
  }
  id v7 = [a1 representations];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 data];

  if (v9)
  {
    uint64_t v10 = [CKImageData alloc];
    uint64_t v5 = [a1 representations];
    v11 = [v5 firstObject];
    v12 = [v11 data];
    id v6 = [(CKImageData *)v10 initWithData:v12];

    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

+ (double)calculatePreviewScaleWithTargetSize:()CKUtils imageData:
{
  id v7 = a5;
  uint64_t v8 = [v7 image];

  if (v8)
  {
    [v7 ptSize];
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [v7 image];
    [v13 scale];
    double v15 = v14;

    v16 = +[CKUIBehavior sharedBehaviors];
    [v16 previewMaxWidth];
    double v18 = v17;

    id v19 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v19, "thumbnailFillSizeForWidth:imageSize:", v18, v10, v12);
    double v21 = v20;
    double v23 = v22;

    v24 = objc_msgSend(v7, "thumbnailFillToSize:", v21, v23);
    [v24 size];
    double v26 = v25;
    double v28 = v27;

    v29 = +[CKUIBehavior sharedBehaviors];
    v30 = +[CKUIBehavior sharedBehaviors];
    [v30 stickerScreenScale];
    objc_msgSend(v29, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v26, v28, v15, 1.0, v31, v18);
    double v33 = v32;
    double v35 = v34;

    if (v12 <= v10)
    {
      if (v33 <= 0.0) {
        double v39 = 1.0;
      }
      else {
        double v39 = v33;
      }
      double v37 = a1 / v39;
    }
    else
    {
      if (v35 <= 0.0) {
        double v36 = 1.0;
      }
      else {
        double v36 = v35;
      }
      double v37 = a2 / v36;
    }
  }
  else
  {
    v38 = IMLogHandleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      +[IMSticker(CKUtils) calculatePreviewScaleWithTargetSize:imageData:](v38);
    }

    double v37 = 1.0;
  }

  return v37;
}

+ (double)calculatedRecentsItemWidthFromStickersUltraExtensionForStickerChatItem:()CKUtils collectionViewWidth:
{
  memset(&v27, 0, sizeof(v27));
  id v5 = a4;
  CGAffineTransformMakeScale(&v27, 1.25, 1.25);
  uint64_t v6 = MEMORY[0x192FBA860](@"_MSStickerDragPreviewContainerView", @"Messages");
  if (v6)
  {
    id v7 = (void *)v6;
    if (objc_opt_respondsToSelector())
    {
      [v7 targetPreviewTransform];
      CGAffineTransform v27 = (CGAffineTransform)v26;
    }
  }
  CGAffineTransform v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformDecompose(&v26, &v25);
  double width = v26.scale.width;
  double v9 = v26.scale.width * 48.0;
  double v10 = v26.scale.height * 48.0;
  double v11 = [v5 mediaObject];
  double v12 = [v11 transfer];
  uint64_t v13 = [v12 attributionInfo];
  double v14 = [v13 objectForKey:*MEMORY[0x1E4F6D3C0]];

  double v15 = [v5 stickerPackGUID];

  v16 = IMStickersExtensionIdentifier();
  if ([v15 containsString:v16])
  {
    double v17 = [v11 sticker];
    double v18 = [v17 externalURI];
    if ([v18 hasPrefix:@"sticker:///emoji/"])
    {

      goto LABEL_17;
    }
    uint64_t v23 = [v14 length];

    if (v23) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  double v19 = 96.0;
  if (a1 > 430.0) {
    double v19 = 224.0;
  }
  double v20 = 4.0;
  if (a1 > 430.0) {
    double v20 = 8.0;
  }
  double v21 = (a1 + -32.0 - v19) / v20 * width;
  BOOL v22 = v21 < v9;
  if (v21 < v10) {
    BOOL v22 = 1;
  }
  if (!v22) {
    double v9 = v21;
  }
LABEL_17:

  return v9;
}

- (double)calculatePreviewScaleWithTargetSize:()CKUtils
{
  id v5 = (void *)MEMORY[0x1E4F6EA58];
  uint64_t v6 = [a1 imageData];
  objc_msgSend(v5, "calculatePreviewScaleWithTargetSize:imageData:", v6, a2, a3);
  double v8 = v7;

  return v8;
}

- (void)stickerViewForStickerChatItem:()CKUtils snapshotEffectView:completion:
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isClingEnabled];

  if (v11)
  {
    if (a4)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __82__IMSticker_CKUtils__stickerViewForStickerChatItem_snapshotEffectView_completion___block_invoke;
      v13[3] = &unk_1E5624BE8;
      v13[4] = a1;
      id v14 = v9;
      [a1 stickerEffectViewSnapshotForStickerChatItem:v8 completion:v13];
    }
    else
    {
      double v12 = [a1 stickerEffectViewForStickerChatItem:v8];
      (*((void (**)(id, void *))v9 + 2))(v9, v12);
    }
  }
}

- (id)stickerEffectViewForStickerChatItem:()CKUtils
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isClingEnabled];

  if (v6)
  {
    double v7 = [v4 mediaObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      uint64_t v9 = [v8 stickerEffectType];
      if ([v8 needsAnimation] & 1) != 0 || (IMStickerEffectTypeShouldAvoidEffectView())
      {
        double v10 = 0;
      }
      else
      {
        id v11 = MTLCreateSystemDefaultDevice();
        double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB3FF8]) initWithDevice:v11];
        [v10 setContentMode:1];
        double v12 = [v10 layer];
        long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
        v21[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
        v21[5] = v13;
        long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
        v21[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
        v21[7] = v14;
        long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
        v21[0] = *MEMORY[0x1E4F39B10];
        v21[1] = v15;
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
        v21[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
        v21[3] = v16;
        [v12 setTransform:v21];

        double v17 = [v10 layer];
        [v17 removeAllAnimations];

        double v18 = [a1 image];
        [v10 setImage:v18];

        double v19 = [MEMORY[0x1E4FB3FF0] effectWithType:v9];
        [v10 setEffect:v19];
      }
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)stickerEffectViewSnapshotForStickerChatItem:()CKUtils completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isClingEnabled];

  if (v9)
  {
    double v10 = [a1 stickerEffectViewForStickerChatItem:v6];
    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke;
      v11[3] = &unk_1E5624C10;
      id v12 = v7;
      [v10 snapshotWithCompletionHandler:v11];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else
  {
    double v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[IMSticker(CKUtils) stickerEffectViewSnapshotForStickerChatItem:completion:](v10);
    }
  }
}

+ (uint64_t)dragItemIsSticker:()CKUtils
{
  id v3 = a3;
  id v4 = [v3 itemProvider];
  if ([v4 hasItemConformingToTypeIdentifier:@"com.apple.sticker.mediaPayload"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = [v3 itemProvider];
    uint64_t v5 = [v6 hasItemConformingToTypeIdentifier:@"com.apple.sticker"];
  }
  return v5;
}

+ (BOOL)dragItemIsRepositioningSticker:()CKUtils
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isStickerRepositioningEnabled];

  if (v5
    && ([v3 localObject],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0)
    && [MEMORY[0x1E4F6EA58] dragItemIsSticker:v3])
  {
    id v8 = [v3 localObject];
    int v9 = [v8 objectForKey:@"kStickerIsRepositioningKey"];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (uint64_t)dropSessionIsRepositioningSticker:()CKUtils
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "items", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([MEMORY[0x1E4F6EA58] dragItemIsRepositioningSticker:*(void *)(*((void *)&v8 + 1) + 8 * i)])
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (void)stickerWithMSMessageMediaPayload:()CKUtils .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Missing sticker pack bundle ID in attributionInfo for media payload. Expected attributionInfo key: %@.", (uint8_t *)&v2, 0xCu);
}

+ (void)calculatePreviewScaleWithTargetSize:()CKUtils imageData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Unable to calculate initial scaled for nil image", v1, 2u);
}

- (void)stickerEffectViewSnapshotForStickerChatItem:()CKUtils completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Could not snapshot effectView. Platform not supported or feature not enabled.", v1, 2u);
}

@end