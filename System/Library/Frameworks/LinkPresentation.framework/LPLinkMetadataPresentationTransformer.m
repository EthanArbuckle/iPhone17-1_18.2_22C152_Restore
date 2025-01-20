@interface LPLinkMetadataPresentationTransformer
- (BOOL)_hasNonMicroblogQuotedTextForStyle:(int64_t)a3;
- (BOOL)_prefersIconAsImage;
- (BOOL)_prefersImageAsIconWithStyle:(int64_t)a3;
- (BOOL)_prefersLeadingIconWithStyle:(int64_t)a3;
- (BOOL)_shouldUseMicroblogQuotedTextForStyle:(int64_t)a3;
- (BOOL)_useVisualRefreshCaptionBarColorsForProperties:(id)a3;
- (BOOL)allowsPlayback;
- (BOOL)allowsPlaybackControls;
- (BOOL)allowsTapToLoad;
- (BOOL)allowsTapping;
- (BOOL)hasMedia;
- (BOOL)hasMediaWithProperties:(id)a3;
- (BOOL)hasOverriddenBackgroundColor;
- (BOOL)isCollaborative;
- (BOOL)isComplete;
- (BOOL)isInComposeContext;
- (BOOL)shouldUseAppClipPresentation;
- (LPImage)mediaOverlayIcon;
- (LPImage)sourceContextIcon;
- (LPLinkMetadata)metadata;
- (LPLinkMetadataPresentationTransformer)init;
- (LPLinkRendererSizeClassParameters)sizeClassParameters;
- (NSString)domainName;
- (NSString)preferredContentSizeCategory;
- (NSString)sourceBundleIdentifier;
- (NSURL)URL;
- (NSURL)canonicalURL;
- (NSURL)originalURL;
- (UITraitCollection)effectiveAppearance;
- (double)scaleFactor;
- (id)_lastResortIcon;
- (id)_preferredBackgroundColorImageSourceForProperties:(id)a3;
- (id)arAsset;
- (id)audioForStyle:(int64_t)a3;
- (id)backgroundColorForStyle:(int64_t)a3;
- (id)commonPresentationPropertiesForStyle:(int64_t)a3;
- (id)domainNameForIndicator;
- (id)imageForStyle:(int64_t)a3 imageMetadata:(id)a4 icon:(id *)a5 alternateImages:(id *)a6;
- (id)mainCaptionBarForStyle:(int64_t)a3;
- (id)presentationProperties;
- (id)quotedTextForStyle:(int64_t)a3;
- (id)quotedTextForStyleIgnoringAllowsQuotedText:(int64_t)a3;
- (id)subtitleForStyle:(int64_t)a3;
- (id)summaryForStyle:(int64_t)a3;
- (id)titleForStyle:(int64_t)a3;
- (id)unspecializedPresentationProperties;
- (id)unspecializedPresentationPropertiesForStyle:(int64_t)a3;
- (id)videoForStyle:(int64_t)a3;
- (int64_t)rendererStyle;
- (int64_t)sharedObjectDownloadState;
- (unint64_t)_rowConfigurationForStyle:(int64_t)a3;
- (unint64_t)bytesLoaded;
- (unint64_t)effectiveSizeClass;
- (unint64_t)preferredSizeClass;
- (void)_populateDominantBackgroundColorForPropertiesIfNeeded:(id)a3;
- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4;
- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5;
- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5 canBecomeImage:(BOOL)a6;
- (void)_populateProperties:(id)a3 withPrimaryImage:(id)a4;
- (void)_populatePropertiesForMediaOverlayIcon:(id)a3;
- (void)_propagateDominantBackgroundColorToDependentPropertiesIfNeeded:(id)a3;
- (void)presentationProperties;
- (void)setAllowsPlayback:(BOOL)a3;
- (void)setAllowsPlaybackControls:(BOOL)a3;
- (void)setAllowsTapToLoad:(BOOL)a3;
- (void)setAllowsTapping:(BOOL)a3;
- (void)setBytesLoaded:(unint64_t)a3;
- (void)setCollaborative:(BOOL)a3;
- (void)setComplete:(BOOL)a3;
- (void)setEffectiveAppearance:(id)a3;
- (void)setHasOverriddenBackgroundColor:(BOOL)a3;
- (void)setInComposeContext:(BOOL)a3;
- (void)setMediaOverlayIcon:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPreferredSizeClass:(unint64_t)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSharedObjectDownloadState:(int64_t)a3;
- (void)setSizeClassParameters:(id)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setSourceContextIcon:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation LPLinkMetadataPresentationTransformer

- (LPLinkMetadataPresentationTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPLinkMetadataPresentationTransformer;
  v2 = [(LPLinkMetadataPresentationTransformer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_scaleFactor = 2.0;
    *(_WORD *)&v2->_allowsTapping = 257;
    v2->_allowsPlayback = 1;
    v4 = v2;
  }

  return v3;
}

- (NSURL)originalURL
{
  URL = self->_URL;
  if (URL)
  {
    v3 = URL;
  }
  else
  {
    v3 = [(LPLinkMetadata *)self->_metadata originalURL];
  }

  return v3;
}

- (NSURL)canonicalURL
{
  v3 = [(LPLinkMetadata *)self->_metadata URL];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  }
  objc_super v6 = v5;

  return (NSURL *)v6;
}

- (int64_t)rendererStyle
{
  v3 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
  v4 = +[LPPresentationSpecializations searchQueryForURL:v3];

  if (v4) {
    return 4;
  }
  v7 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v7)
  {
  }
  else
  {
    v9 = [(LPLinkMetadata *)self->_metadata title];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v11 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
      if (+[LPPresentationSpecializations isAppleFitnessURL:v11])
      {
        int64_t v5 = 43;
      }
      else if (+[LPPresentationSpecializations isAppleHealthURL:v11])
      {
        int64_t v5 = 52;
      }
      else
      {
        if (!+[LPPresentationSpecializations isAppleMusicClassicalURL:v11])
        {
          BOOL v15 = +[LPPresentationSpecializations isAppleBookSeriesURL:v11];

          if (v15) {
            return 57;
          }
          goto LABEL_6;
        }
        int64_t v5 = 55;
      }

      return v5;
    }
  }
LABEL_6:
  if ([(LPLinkMetadataPresentationTransformer *)self preferredSizeClass] == 2) {
    return 1;
  }
  if (!self->_metadata && self->_complete && self->_allowsTapToLoad) {
    return 15;
  }
  BOOL v8 = [(LPLinkMetadataPresentationTransformer *)self shouldUseAppClipPresentation];
  if (+[LPPresentationSpecializations isMicroblogPost:self->_metadata]&& !v8)
  {
    return 3;
  }
  if ([(LPLinkMetadataPresentationTransformer *)self preferredSizeClass] == 3
    || [(LPLinkMetadataPresentationTransformer *)self preferredSizeClass] == 5)
  {
    return 0;
  }
  v12 = [(LPLinkMetadata *)self->_metadata title];
  if (v12
    || ([(LPLinkMetadata *)self->_metadata siteName],
        (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(LPLinkMetadata *)self->_metadata image], (v12 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(LPLinkMetadata *)self->_metadata video], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v16 = [(LPLinkMetadata *)self->_metadata icon];

    if (!v16) {
      return 2;
    }
  }
  BOOL v13 = [(LPLinkMetadata *)self->_metadata _hasMedia];
  int64_t v14 = 41;
  if (!v8) {
    int64_t v14 = 0;
  }
  if (v13) {
    return v14;
  }
  else {
    return 1;
  }
}

- (id)mainCaptionBarForStyle:(int64_t)a3
{
  int64_t v5 = objc_alloc_init(LPCaptionBarPresentationProperties);
  switch([(LPLinkMetadataPresentationTransformer *)self _rowConfigurationForStyle:a3])
  {
    case 0uLL:
      int v17 = stylePrefersSubtitleForOneUpPresentation(a3);
      char v18 = v17;
      if (v17
        && ([(LPLinkMetadataPresentationTransformer *)self originalURL],
            (v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = [(LPLinkMetadataPresentationTransformer *)self subtitleForStyle:a3];
        int v20 = 0;
        int v21 = 1;
      }
      else
      {
        v19 = [(LPLinkMetadata *)self->_metadata title];
        v9 = 0;
        int v21 = 0;
        int v20 = 1;
      }
      v29 = [(LPCaptionBarPresentationProperties *)v5 top];
      v30 = [v29 leading];
      [v30 setText:v19];

      if (v20)
      {

        if (!v21) {
          goto LABEL_27;
        }
      }
      else if (!v21)
      {
LABEL_27:
        if (v18) {
          goto LABEL_4;
        }
        goto LABEL_5;
      }

      if (v18) {
        goto LABEL_4;
      }
LABEL_5:
      if (a3 == 57)
      {
        v12 = LPLocalizedString(@" Books");
        BOOL v13 = [(LPCaptionBarPresentationProperties *)v5 belowBottom];
        int64_t v14 = [v13 leading];
        [v14 setText:v12];
      }
      if (self->_allowsTapping && self->_allowsPlayback)
      {
        if (a3 == 15
          || ([(LPLinkMetadataPresentationTransformer *)self videoForStyle:a3],
              BOOL v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          [(LPCaptionBarPresentationProperties *)v5 setTrailingAccessoryType:1];
          [(LPCaptionBarPresentationProperties *)v5 setShouldHighlightIndependently:1];
        }
      }
      return v5;
    case 1uLL:
    case 3uLL:
      goto LABEL_2;
    case 2uLL:
      if ([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass] == 8)
      {
        v22 = [(LPLinkMetadataPresentationTransformer *)self titleForStyle:a3];
        v23 = [(LPCaptionBarPresentationProperties *)v5 top];
        v24 = [v23 leading];
        [v24 setText:v22];

        v25 = [(LPLinkMetadataPresentationTransformer *)self quotedTextForStyleIgnoringAllowsQuotedText:a3];
        v26 = v25;
        if (!v25)
        {
          v26 = [(LPLinkMetadataPresentationTransformer *)self summaryForStyle:a3];
        }
        v27 = [(LPCaptionBarPresentationProperties *)v5 bottom];
        v28 = [v27 leading];
        [v28 setText:v26];

        if (!v25) {
        v9 = [(LPLinkMetadataPresentationTransformer *)self subtitleForStyle:a3];
        }
        uint64_t v10 = [(LPCaptionBarPresentationProperties *)v5 belowBottom];
        id v11 = [v10 leading];
        [v11 setText:v9];
      }
      else
      {
LABEL_2:
        objc_super v6 = [(LPLinkMetadataPresentationTransformer *)self titleForStyle:a3];
        v7 = [(LPCaptionBarPresentationProperties *)v5 top];
        BOOL v8 = [v7 leading];
        [v8 setText:v6];

        v9 = [(LPLinkMetadataPresentationTransformer *)self subtitleForStyle:a3];
        uint64_t v10 = [(LPCaptionBarPresentationProperties *)v5 bottom];
        id v11 = [v10 leading];
        [v11 setText:v9];
      }

LABEL_4:
      goto LABEL_5;
    default:
      goto LABEL_5;
  }
}

- (id)titleForStyle:(int64_t)a3
{
  int64_t v5 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
  objc_super v6 = +[LPPresentationSpecializations searchQueryForURL:v5];

  if (v6)
  {
    id v7 = v6;
LABEL_3:
    BOOL v8 = v7;
    goto LABEL_4;
  }
  if (a3 != 3) {
    goto LABEL_14;
  }
  uint64_t v10 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
  BOOL v11 = +[LPPresentationSpecializations isSinaWeiboURL:v10];

  if (v11)
  {
    BOOL v8 = 0;
    goto LABEL_4;
  }
  v12 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
  BOOL v13 = +[LPPresentationSpecializations isTweetURL:v12];

  if (!v13) {
    goto LABEL_14;
  }
  int64_t v14 = [(LPLinkMetadata *)self->_metadata title];
  uint64_t v15 = [v14 rangeOfString:@" on Twitter" options:12];
  uint64_t v17 = v16;

  if (!v17)
  {
    char v18 = [(LPLinkMetadata *)self->_metadata title];
    uint64_t v15 = [v18 rangeOfString:@" on X" options:12];
    uint64_t v20 = v19;

    if (!v20)
    {
LABEL_14:
      v22 = [(LPLinkMetadata *)self->_metadata title];

      metadata = self->_metadata;
      if (v22) {
        [(LPLinkMetadata *)metadata title];
      }
      else {
      id v7 = [(LPLinkMetadata *)metadata siteName];
      }
      goto LABEL_3;
    }
  }
  int v21 = [(LPLinkMetadata *)self->_metadata title];
  BOOL v8 = [v21 substringToIndex:v15];

LABEL_4:

  return v8;
}

- (NSString)domainName
{
  v2 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  v3 = objc_msgSend(v2, "_lp_simplifiedStringForDisplayOnly:", 0);

  objc_msgSend(v3, "_lp_setStringType:", 1);

  return (NSString *)v3;
}

- (BOOL)shouldUseAppClipPresentation
{
  v3 = [(LPLinkMetadata *)self->_metadata associatedApplication];
  v4 = [v3 bundleIdentifier];

  return v4 && [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass] == 0;
}

- (id)subtitleForStyle:(int64_t)a3
{
  int64_t v5 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  objc_super v6 = v5;
  if (!v5)
  {
    uint64_t v7 = [(LPLinkMetadata *)self->_metadata summary];
    goto LABEL_24;
  }
  if (![v5 isFileURL])
  {
    if (objc_msgSend(v6, "_lp_isTelephoneURL"))
    {
      uint64_t v7 = objc_msgSend(v6, "_lp_formattedTelephoneNumber");
      goto LABEL_24;
    }
    if (a3 <= 51)
    {
      if (a3 == 41)
      {
        uint64_t v16 = [(LPLinkMetadataPresentationTransformer *)self metadata];
        uint64_t v17 = [v16 associatedApplication];
        char v18 = [v17 caption];

        if (v18)
        {
          int64_t v14 = [(LPLinkMetadataPresentationTransformer *)self metadata];
          uint64_t v19 = [v14 associatedApplication];
          uint64_t v15 = [v19 caption];

          goto LABEL_22;
        }
        goto LABEL_23;
      }
      if (a3 != 43) {
        goto LABEL_23;
      }
      uint64_t v10 = [(LPLinkMetadataPresentationTransformer *)self metadata];
      BOOL v11 = [v10 summary];

      if (!v11) {
        goto LABEL_23;
      }
    }
    else
    {
      if (a3 != 52)
      {
        if (a3 == 55)
        {
          uint64_t v7 = LPLocalizedString(@" Music Classical");
          goto LABEL_24;
        }
        if (a3 == 57)
        {
          BOOL v8 = [(LPLinkMetadataPresentationTransformer *)self metadata];
          v9 = [v8 summary];

          if (v9) {
            goto LABEL_18;
          }
        }
LABEL_23:
        uint64_t v7 = [(LPLinkMetadataPresentationTransformer *)self domainName];
        goto LABEL_24;
      }
      v12 = [(LPLinkMetadataPresentationTransformer *)self metadata];
      BOOL v13 = [v12 summary];

      if (!v13) {
        goto LABEL_23;
      }
    }
LABEL_18:
    int64_t v14 = [(LPLinkMetadataPresentationTransformer *)self metadata];
    uint64_t v15 = [v14 summary];
LABEL_22:

    goto LABEL_25;
  }
  uint64_t v7 = [v6 lastPathComponent];
LABEL_24:
  uint64_t v15 = (void *)v7;
LABEL_25:

  return v15;
}

- (id)summaryForStyle:(int64_t)a3
{
  v4 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  if (!v4) {
    goto LABEL_3;
  }
  int64_t v5 = [(LPLinkMetadata *)self->_metadata summary];
  objc_super v6 = [(LPLinkMetadata *)self->_metadata title];
  objc_msgSend(v5, "_lp_similarityToString:", v6);
  double v8 = v7;

  if (v8 <= 0.6)
  {
    v9 = [(LPLinkMetadata *)self->_metadata summary];
  }
  else
  {
LABEL_3:
    v9 = 0;
  }

  return v9;
}

- (id)domainNameForIndicator
{
  v3 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  v4 = v3;
  if (v3 && ([v3 isFileURL] & 1) == 0 && (objc_msgSend(v4, "_lp_isTelephoneURL") & 1) == 0)
  {
    int64_t v5 = [(LPLinkMetadataPresentationTransformer *)self metadata];
    objc_super v6 = [v5 associatedApplication];
    float v7 = [v6 bundleIdentifier];
    if (v7)
    {
      double v8 = [(LPLinkMetadataPresentationTransformer *)self metadata];
      v9 = [v8 associatedApplication];
      uint64_t v10 = [v9 caption];

      if (v10)
      {
        BOOL v11 = [(LPLinkMetadataPresentationTransformer *)self domainName];
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)_hasNonMicroblogQuotedTextForStyle:(int64_t)a3
{
  if (!styleSupportsQuotedText(a3)
    || !sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
  {
    return 0;
  }
  v4 = [(LPLinkMetadata *)self->_metadata selectedText];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)_shouldUseMicroblogQuotedTextForStyle:(int64_t)a3
{
  return a3 == 3
      || +[LPPresentationSpecializations isMicroblogPost:self->_metadata];
}

- (id)quotedTextForStyleIgnoringAllowsQuotedText:(int64_t)a3
{
  id v5 = [(LPLinkMetadata *)self->_metadata summary];
  if ([(LPLinkMetadataPresentationTransformer *)self _shouldUseMicroblogQuotedTextForStyle:a3])
  {
    objc_super v6 = [(LPLinkMetadataPresentationTransformer *)self URL];
    BOOL v7 = +[LPPresentationSpecializations isTweetURL:v6];

    if (v7)
    {
      double v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^[\\p{Quotation_Mark}](.*)[\\p{Quotation_Mark}]$" options:8 error:0];
      v9 = objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
      if ([v9 numberOfRanges] == 2)
      {
        uint64_t v10 = [v9 rangeAtIndex:1];
        uint64_t v12 = objc_msgSend(v5, "substringWithRange:", v10, v11);

        id v5 = (id)v12;
      }
    }
    id v5 = v5;
    id v13 = v5;
  }
  else
  {
    int64_t v14 = [(LPLinkMetadata *)self->_metadata selectedText];
    uint64_t v15 = objc_msgSend(v14, "_lp_stringByTrimmingWhitespace");

    if ([v15 length]) {
      id v13 = v15;
    }
    else {
      id v13 = 0;
    }
  }

  return v13;
}

- (id)quotedTextForStyle:(int64_t)a3
{
  if (styleSupportsQuotedText(a3)
    && sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
  {
    id v5 = [(LPLinkMetadataPresentationTransformer *)self quotedTextForStyleIgnoringAllowsQuotedText:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_lastResortIcon
{
  uint64_t v3 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(LPLinkMetadata *)self->_metadata specialization];
    int v6 = [v5 conformsToProtocol:&unk_1EF7250D0];

    if (v6)
    {
      BOOL v7 = [(LPLinkMetadata *)self->_metadata specialization];
      id v8 = [v7 fallbackIconForTransformer:self];

      if (v8) {
        goto LABEL_26;
      }
    }
  }
  v9 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  char v10 = objc_msgSend(v9, "_lp_isHTTPFamilyURL");

  if (v10)
  {
LABEL_5:
    uint64_t v11 = [(LPLinkMetadataPresentationTransformer *)self sourceContextIcon];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[LPResources safariIcon];
    }
    id v8 = v13;

    goto LABEL_26;
  }
  int64_t v14 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  int v15 = [v14 isFileURL];

  if (v15)
  {
    uint64_t v16 = +[LPResources fileIcon];
  }
  else
  {
    uint64_t v17 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
    int v18 = objc_msgSend(v17, "_lp_isTelephoneURL");

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v16 = +[LPResources telephoneIcon];
  }
  id v8 = (id)v16;
  if (v16) {
    goto LABEL_26;
  }
LABEL_12:
  uint64_t v19 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
  if (v19
    || ([(LPLinkMetadata *)self->_metadata specialization],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else if (+[LPApplicationIdentification isMobileNotes])
  {
    id v8 = +[LPResources textIcon];
    if (v8) {
      goto LABEL_26;
    }
  }
  id v8 = [(LPLinkMetadataPresentationTransformer *)self sourceContextIcon];
  if (v8) {
    goto LABEL_26;
  }
  if ([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass] != 2) {
    goto LABEL_5;
  }
  double scaleFactor = self->_scaleFactor;
  int v21 = self->_sourceBundleIdentifier;
  if (iconForApplication_applicationIcon)
  {
    double v22 = *(double *)&iconForApplication_applicationIconScaleFactor;
    if (*(double *)&iconForApplication_applicationIconScaleFactor == scaleFactor
      && ((NSString *)iconForApplication_applicationBundleIdentifier == v21
       || (objc_msgSend((id)iconForApplication_applicationBundleIdentifier, "_lp_isEqualIgnoringCase:", v21, *(double *)&iconForApplication_applicationIconScaleFactor) & 1) != 0))
    {
      goto LABEL_36;
    }
  }
  if (v21
    && (objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", v22),
        v23 = objc_claimAutoreleasedReturnValue(),
        [v23 bundleIdentifier],
        v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = objc_msgSend(v24, "_lp_isEqualIgnoringCase:", v21),
        v24,
        v23,
        !v25))
  {
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v21];
  }
  else
  {
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F6F248], "applicationIcon", v22);
  }
  id v8 = (id)v26;
  if (v26)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F6F258]);
    +[LPTheme largestIconSizeInPoints];
    double v30 = v29;
    +[LPTheme largestIconSizeInPoints];
    v32 = objc_msgSend(v28, "initWithSize:scale:", v30, v31, scaleFactor);
    [v32 setShouldApplyMask:0];
    v33 = [v8 prepareImageForDescriptor:v32];
    uint64_t v34 = [v33 CGImage];
    if (v34)
    {
      v35 = objc_alloc_init(LPImageProperties);
      [(LPImageProperties *)v35 setType:1];
      id v36 = [[LPImage alloc] _initWithCGImage:v34 properties:v35];
      v37 = (void *)iconForApplication_applicationIcon;
      iconForApplication_applicationIcon = (uint64_t)v36;

      uint64_t v38 = [(NSString *)v21 copy];
      v39 = (void *)iconForApplication_applicationBundleIdentifier;
      iconForApplication_applicationBundleIdentifier = v38;

      iconForApplication_applicationIconScaleFactor = *(void *)&scaleFactor;
LABEL_36:
      id v8 = (id)iconForApplication_applicationIcon;
      goto LABEL_38;
    }

    id v8 = 0;
  }
LABEL_38:

  if (!v8) {
    goto LABEL_5;
  }
LABEL_26:

  return v8;
}

- (id)imageForStyle:(int64_t)a3 imageMetadata:(id)a4 icon:(id *)a5 alternateImages:(id *)a6
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v52 = a4;
  BOOL v48 = [(LPLinkMetadataPresentationTransformer *)self isComplete];
  unint64_t v10 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];
  int v51 = sizeClassAllowsIconWithPlaceholderImage(v10);
  BOOL v11 = sizeClassRequiresLargeMedia(v10);
  if (styleSupportsIcon(a3)) {
    int v12 = 1;
  }
  else {
    int v12 = sizeClassPrefersIcon(v10);
  }
  v50 = a5;
  BOOL v47 = v11;
  if (styleSupportsImage(a3)) {
    int v13 = sizeClassPrefersIcon(v10) ^ 1;
  }
  else {
    int v13 = 0;
  }
  if (stylePrefersImageAsIcon(a3) & 1) != 0 || (sizeClassPrefersImageAsIcon(v10))
  {
    BOOL v49 = 1;
  }
  else if (sizeClassSupportsIconHoisting(v10))
  {
    v39 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
    BOOL v49 = +[LPPresentationSpecializations isGoogleURL:v39];
  }
  else
  {
    BOOL v49 = 0;
  }
  int64_t v14 = [(LPLinkMetadataPresentationTransformer *)self quotedTextForStyle:a3];
  if (v14) {
    BOOL v15 = v10 == 5;
  }
  else {
    BOOL v15 = 0;
  }
  int v16 = v15;

  BOOL v17 = [(LPLinkMetadataPresentationTransformer *)self _hasNonMicroblogQuotedTextForStyle:a3];
  int v18 = v13 & ~v16;
  int v19 = v17 | v16 | v12;
  if ((v19 | v18) != 1)
  {
    unint64_t v37 = 0;
    goto LABEL_29;
  }
  uint64_t v20 = [(LPLinkMetadata *)self->_metadata icon];
  int v21 = imageOnlyIfViable(v20);

  double v22 = [(LPLinkMetadata *)self->_metadata iconMetadata];
  v23 = [v22 URL];

  if (v23)
  {
    v24 = [LPImageRemoteURLRepresentation alloc];
    int v25 = [(LPLinkMetadata *)self->_metadata iconMetadata];
    uint64_t v26 = [v25 URL];
    v27 = [(LPImageRemoteURLRepresentation *)v24 initWithScale:1 URL:v26];
    v54[0] = v27;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    objc_msgSend(v21, "set_remoteURLsForEmailCompatibleOutput:", v28);
  }
  double v29 = [(LPLinkMetadata *)self->_metadata image];
  double v30 = imageOnlyIfViable(v29);

  if (a6)
  {
    *a6 = [(LPLinkMetadata *)self->_metadata alternateImages];
  }
  double v31 = [v52 URL];

  if (v31)
  {
    v32 = [LPImageRemoteURLRepresentation alloc];
    v33 = [v52 URL];
    uint64_t v34 = [(LPImageRemoteURLRepresentation *)v32 initWithScale:1 URL:v33];
    v53 = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    objc_msgSend(v30, "set_remoteURLsForEmailCompatibleOutput:", v35);
  }
  int v36 = v17 || v49;
  if (!v30) {
    int v36 = 0;
  }
  if (v36 == 1)
  {

    if (!a6)
    {
      unint64_t v37 = 0;
LABEL_46:
      int v21 = v30;
      goto LABEL_49;
    }
LABEL_45:
    unint64_t v37 = 0;
    *a6 = 0;
    goto LABEL_46;
  }
  if (v30)
  {
    int v40 = [v30 _isLowResolutionAsImage] ^ 1;
    if (v21) {
      int v40 = 1;
    }
    int v41 = v40 | !v48;
    if (v41) {
      unint64_t v37 = (unint64_t)v30;
    }
    else {
      unint64_t v37 = 0;
    }
    if (v48) {
      v42 = v30;
    }
    else {
      v42 = 0;
    }
    if (!v40) {
      int v21 = v42;
    }
    if ((v41 & 1) == 0 && a6) {
      goto LABEL_45;
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
LABEL_49:
  if ((v19 ^ 1 | v18))
  {
    uint64_t v38 = (uint64_t)v21;
  }
  else
  {
    if (v21) {
      BOOL v43 = 0;
    }
    else {
      BOOL v43 = v48;
    }
    if (v43 || v37 && [v21 _isLowResolutionAsIconWithScaleFactor:self->_scaleFactor])
    {
      uint64_t v38 = (uint64_t)(id)v37;

      if (a6) {
        *a6 = 0;
      }
    }
    else
    {
      uint64_t v38 = (uint64_t)v21;
    }

    unint64_t v37 = 0;
  }
  if (((v19 | v18 ^ 1) & 1) == 0)
  {
    BOOL v44 = v47;
    if (v37) {
      BOOL v44 = 0;
    }
    if (v51 & v44)
    {
      unint64_t v37 = 0;
      goto LABEL_66;
    }

LABEL_29:
    uint64_t v38 = 0;
  }
LABEL_66:
  if (!(v37 | v38))
  {
    uint64_t v38 = [(LPLinkMetadataPresentationTransformer *)self _lastResortIcon];
  }
  if ((v19 | v51) == 1) {
    id *v50 = (id) v38;
  }
  if (v18) {
    id v45 = (id)v37;
  }
  else {
    id v45 = 0;
  }

  return v45;
}

- (id)videoForStyle:(int64_t)a3
{
  if (styleSupportsVideo(a3)
    && sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
  {
    v4 = [(LPLinkMetadata *)self->_metadata video];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)audioForStyle:(int64_t)a3
{
  return [(LPLinkMetadata *)self->_metadata audio];
}

- (id)arAsset
{
  if (canDisplayARAssets()
    && sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
  {
    uint64_t v3 = [(LPLinkMetadata *)self->_metadata arAsset];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)backgroundColorForStyle:(int64_t)a3
{
  int v5 = sizeClassAllowsBackgroundColor([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]);
  int v6 = 0;
  if (a3 == 3 && v5)
  {
    BOOL v7 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
    BOOL v8 = +[LPPresentationSpecializations isTweetURL:v7];

    if (v8)
    {
      int v6 = +[LPResources tweetBackgroundColor];
    }
    else
    {
      v9 = [(LPLinkMetadataPresentationTransformer *)self canonicalURL];
      BOOL v10 = +[LPPresentationSpecializations isSinaWeiboURL:v9];

      if (v10)
      {
        int v6 = +[LPResources weiboBackgroundColor];
      }
      else
      {
        int v6 = 0;
      }
    }
  }

  return v6;
}

- (id)commonPresentationPropertiesForStyle:(int64_t)a3
{
  int v5 = objc_alloc_init(LPWebLinkPresentationProperties);
  [(LPWebLinkPresentationProperties *)v5 setPreliminary:!self->_complete];
  [(LPWebLinkPresentationProperties *)v5 setStyle:a3];
  int v6 = [(LPLinkMetadataPresentationTransformer *)self quotedTextForStyle:[(LPWebLinkPresentationProperties *)v5 style]];
  [(LPWebLinkPresentationProperties *)v5 setQuotedText:v6];

  return v5;
}

- (id)unspecializedPresentationProperties
{
  int64_t v3 = [(LPLinkMetadataPresentationTransformer *)self rendererStyle];

  return [(LPLinkMetadataPresentationTransformer *)self unspecializedPresentationPropertiesForStyle:v3];
}

- (id)unspecializedPresentationPropertiesForStyle:(int64_t)a3
{
  int v5 = -[LPLinkMetadataPresentationTransformer commonPresentationPropertiesForStyle:](self, "commonPresentationPropertiesForStyle:");
  int v6 = [(LPLinkMetadataPresentationTransformer *)self mainCaptionBarForStyle:a3];
  [v5 setCaptionBar:v6];

  BOOL v7 = [(LPLinkMetadataPresentationTransformer *)self backgroundColorForStyle:a3];
  [v5 setBackgroundColor:v7];

  BOOL v8 = [(LPLinkMetadata *)self->_metadata imageMetadata];
  id v37 = 0;
  id v38 = 0;
  v9 = [(LPLinkMetadataPresentationTransformer *)self imageForStyle:a3 imageMetadata:v8 icon:&v38 alternateImages:&v37];
  id v10 = v38;
  id v11 = v37;
  [v5 setImage:v9];

  int v12 = [v5 image];

  if (v12)
  {
    [v5 setAlternateImages:v11];

    id v11 = 0;
  }
  int v13 = [(LPLinkMetadataPresentationTransformer *)self videoForStyle:a3];
  [v5 setVideo:v13];

  int64_t v14 = [(LPLinkMetadataPresentationTransformer *)self audioForStyle:a3];
  [v5 setAudio:v14];

  BOOL v15 = [(LPLinkMetadataPresentationTransformer *)self arAsset];
  [v5 setArAsset:v15];

  int v16 = [v5 audio];

  if (v16)
  {
    BOOL v17 = [v5 audio];
    int v18 = +[LPInlineMediaPlaybackInformation audioFilePlaybackInformationWithAudio:v17];

    [v5 setInlinePlaybackInformation:v18];
  }
  if ((styleSupportsStackedIcons(a3) & 1) == 0)
  {

    id v11 = 0;
  }
  int v19 = [v5 image];
  if (v19
    || ([v5 video], (int v19 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 quotedText], (int v19 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 arAsset], (int v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v20 = 1;
  }
  else
  {
    if (!sizeClassRequiresLargeMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
    {
      int v20 = 1;
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    int v19 = +[LPResources safariIcon];
    [v5 setImage:v19];
    int v20 = 0;
  }

  if (!v10) {
    goto LABEL_18;
  }
LABEL_13:
  if ((v20 | [v10 _isFallbackIcon] ^ 1) == 1)
  {
    if ([(LPLinkMetadataPresentationTransformer *)self _prefersLeadingIconWithStyle:a3])
    {
      int v21 = [v5 captionBar];
      [v21 setLeadingIcon:v10];

      double v22 = [v5 captionBar];
      [v22 setAdditionalLeadingIcons:v11];
    }
    else
    {
      v23 = [v5 captionBar];
      [v23 setTrailingIcon:v10];

      double v22 = [v5 captionBar];
      [v22 setAdditionalTrailingIcons:v11];
    }
  }
LABEL_18:
  if (a3 == 41)
  {
    v24 = [(LPLinkMetadata *)self->_metadata associatedApplication];
    int v25 = [v24 icon];
    uint64_t v26 = [v5 captionBar];
    [v26 setLeadingIcon:v25];

    v27 = [v5 captionBar];
    [v27 setShouldHighlightIndependently:1];

    if (self->_allowsTapping)
    {
      id v28 = [(LPLinkMetadata *)self->_metadata associatedApplication];
      double v29 = [v28 action];

      if (v29)
      {
        double v30 = [(LPLinkMetadata *)self->_metadata associatedApplication];
        double v31 = [v30 action];
        v32 = [v5 captionBar];
        [v32 setButtonCaption:v31];
      }
    }
    v33 = [(LPLinkMetadataPresentationTransformer *)self domainNameForIndicator];
    [v5 setDomainNameForIndicator:v33];
  }
  uint64_t v34 = objc_alloc_init(LPIndeterminateProgressSpinnerPresentationProperties);
  v35 = [(LPLinkMetadataPresentationTransformer *)self subtitleForStyle:a3];
  [(LPIndeterminateProgressSpinnerPresentationProperties *)v34 setText:v35];

  [v5 setProgressSpinner:v34];

  return v5;
}

- (id)presentationProperties
{
  unint64_t v4 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];
  int v5 = [(LPLinkMetadata *)self->_metadata specialization];
  if (v5)
  {
    int v6 = [(LPLinkMetadata *)self->_metadata specialization];
    v2 = (void *)[v6 conformsToProtocol:&unk_1EF724640];

    if (v2)
    {
      BOOL v7 = [(LPLinkMetadata *)self->_metadata specialization];
      BOOL v8 = [(LPLinkMetadataPresentationTransformer *)self originalURL];
      if (v8
        && (([(LPLinkMetadataPresentationTransformer *)self originalURL],
             v2 = objc_claimAutoreleasedReturnValue(),
             int v9 = [v7 canGeneratePresentationPropertiesForURL:v2],
             v4 == 2)
          ? (int v10 = 1)
          : (int v10 = v9),
            v2,
            v8,
            v10 != 1))
      {
      }
      else
      {
        id v11 = [v7 presentationPropertiesForTransformer:self];

        if (v11) {
          goto LABEL_12;
        }
      }
    }
  }
  id v11 = [(LPLinkMetadataPresentationTransformer *)self unspecializedPresentationProperties];
LABEL_12:
  if ((sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]) & 1) == 0)
  {
    [v11 setImage:0];
    [v11 setVideo:0];
  }
  if (!self->_allowsPlayback)
  {
    [v11 setInlinePlaybackInformation:0];
    [v11 setVideo:0];
    [v11 setAudio:0];
  }
  if ((sizeClassAllowsMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]) & 1) == 0) {
    [v11 setQuotedText:0];
  }
  if (!sizeClassAllowsInlinePlayback([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])
    || ([v11 inlinePlaybackInformation],
        int v12 = objc_claimAutoreleasedReturnValue(),
        [v12 type],
        char v13 = canPlayInlineMediaType(),
        v12,
        (v13 & 1) == 0))
  {
    [v11 setInlinePlaybackInformation:0];
  }
  unint64_t v14 = -[LPLinkMetadataPresentationTransformer _rowConfigurationForStyle:](self, "_rowConfigurationForStyle:", [v11 style]);
  if (v14 == 1)
  {
    v32 = [v11 captionBar];
    v33 = [v32 aboveTop];
    uint64_t v34 = [v33 leading];
    [v34 setText:0];

    v35 = [v11 captionBar];
    int v36 = [v35 aboveTop];
    id v37 = [v36 trailing];
    [v37 setText:0];

    id v38 = [v11 captionBar];
    v39 = [v38 belowBottom];
    int v40 = [v39 leading];
    [v40 setText:0];

    double v30 = [v11 captionBar];
    double v31 = [v30 belowBottom];
    v2 = [v31 trailing];
    [v2 setText:0];
  }
  else
  {
    if (v14) {
      goto LABEL_26;
    }
    BOOL v15 = [v11 captionBar];
    int v16 = [v15 aboveTop];
    BOOL v17 = [v16 leading];
    [v17 setText:0];

    int v18 = [v11 captionBar];
    int v19 = [v18 aboveTop];
    int v20 = [v19 trailing];
    [v20 setText:0];

    int v21 = [v11 captionBar];
    double v22 = [v21 bottom];
    v23 = [v22 leading];
    [v23 setText:0];

    v24 = [v11 captionBar];
    int v25 = [v24 bottom];
    uint64_t v26 = [v25 trailing];
    [v26 setText:0];

    v27 = [v11 captionBar];
    id v28 = [v27 belowBottom];
    double v29 = [v28 leading];
    [v29 setText:0];

    double v30 = [v11 captionBar];
    double v31 = [v30 belowBottom];
    v2 = [v31 trailing];
    [v2 setText:0];
  }

LABEL_26:
  if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters neverShowText])
  {
    int v41 = [v11 captionBar];
    v42 = [v41 top];
    BOOL v43 = [v42 leading];
    [v43 setText:0];

    BOOL v44 = [v11 captionBar];
    id v45 = [v44 top];
    v46 = [v45 trailing];
    [v46 setText:0];

    BOOL v47 = [v11 captionBar];
    BOOL v48 = [v47 aboveTop];
    BOOL v49 = [v48 leading];
    [v49 setText:0];

    v50 = [v11 captionBar];
    int v51 = [v50 aboveTop];
    id v52 = [v51 trailing];
    [v52 setText:0];

    v53 = [v11 captionBar];
    v54 = [v53 bottom];
    v55 = [v54 leading];
    [v55 setText:0];

    v56 = [v11 captionBar];
    v57 = [v56 bottom];
    v58 = [v57 trailing];
    [v58 setText:0];

    v59 = [v11 captionBar];
    v60 = [v59 belowBottom];
    v61 = [v60 leading];
    [v61 setText:0];

    v62 = [v11 captionBar];
    v63 = [v62 belowBottom];
    v2 = [v63 trailing];
    [v2 setText:0];

    [v11 setQuotedText:0];
  }
  if ([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass] == 2)
  {
    v135 = [v11 captionBar];
    v134 = [v135 aboveTop];
    int v64 = [v134 hasAnyContent];
    v133 = [v11 captionBar];
    v65 = [v133 top];
    int v66 = [v65 hasAnyContent];
    v67 = [v11 captionBar];
    v68 = [v67 bottom];
    int v69 = [v68 hasAnyContent];
    v70 = [v11 captionBar];
    v2 = [v70 belowBottom];
    int v71 = v66 + v64 + v69 + [v2 hasAnyContent];

    if (v71 == 1)
    {
      v72 = [v11 captionBar];
      [v72 applyToAllCaptions:&__block_literal_global_22];
    }
  }
  v73 = [v11 inlinePlaybackInformation];
  if (v73)
  {
    BOOL allowsPlayback = self->_allowsPlayback;

    if (allowsPlayback)
    {
      v75 = [v11 captionBar];
      [v75 setTrailingIcon:0];

      v76 = [v11 captionBar];
      [v76 setAdditionalTrailingIcons:0];
    }
  }
  v77 = [v11 captionBar];
  v78 = [v77 button];
  if (v78)
  {
    v2 = [v11 captionBar];
    v79 = [v2 button];
    uint64_t v80 = [v79 type];

    if (v80 == 1)
    {
      v81 = [v11 captionBar];
      [v81 setTrailingIcon:0];

      v82 = [v11 captionBar];
      [v82 setAdditionalTrailingIcons:0];

      [v11 setInlinePlaybackInformation:0];
    }
  }
  else
  {
  }
  if (sizeClassSupportsIconHoisting([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]))
  {
    if (![(LPLinkMetadataPresentationTransformer *)self hasMediaWithProperties:v11])
    {
      v83 = [v11 captionBar];
      v84 = [v83 leadingIcon];
      v85 = v84;
      if (!v84)
      {
        v2 = [v11 captionBar];
        v85 = [v2 trailingIcon];
      }
      [v11 setImage:v85];
      if (!v84)
      {
      }
      v86 = objc_alloc_init(LPImagePresentationProperties);
      +[LPTheme placeholderIconSizeInPoints];
      double v88 = v87;
      +[LPTheme placeholderIconSizeInPoints];
      -[LPImagePresentationProperties setFixedSize:](v86, "setFixedSize:", v88, v89);
      [(LPImagePresentationProperties *)v86 setScalingMode:3];
      [(LPImagePresentationProperties *)v86 setFilter:3];
      [v11 setImageProperties:v86];
    }
    v90 = [v11 captionBar];
    [v90 removeAllIcons];
  }
  if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters neverShowIcon])
  {
    v91 = [v11 captionBar];
    [v91 removeAllIcons];

    v92 = [v11 mediaTopCaptionBar];
    [v92 removeAllIcons];

    v93 = [v11 mediaBottomCaptionBar];
    [v93 removeAllIcons];
  }
  if (sizeClassRequiresLargeMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])
    && ![(LPLinkMetadataPresentationTransformer *)self hasMediaWithProperties:v11])
  {
    v94 = [(LPLinkMetadataPresentationTransformer *)self _lastResortIcon];
    [v11 setImage:v94];
  }
  unint64_t v95 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];
  [v11 style];
  if (sizeClassRequiresLeadingIcon(v95))
  {
    v96 = [v11 captionBar];
    v97 = [v96 leadingIcon];

    if (!v97)
    {
      v98 = [(LPLinkMetadataPresentationTransformer *)self _lastResortIcon];
      v99 = [v11 captionBar];
      [v99 setLeadingIcon:v98];
    }
  }
  if (sizeClassAllowsApplicationBadge([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])
    || styleRequiresApplicationBadge([v11 style]))
  {
    v100 = [(LPLinkMetadata *)self->_metadata sourceApplication];
    if (!v100)
    {
      v101 = [(LPLinkMetadata *)self->_metadata specialization];
      if (v101
        && ([(LPLinkMetadata *)self->_metadata specialization],
            v102 = objc_claimAutoreleasedReturnValue(),
            int v103 = [v102 conformsToProtocol:&unk_1EF724950],
            v102,
            v101,
            v103))
      {
        v104 = [(LPLinkMetadata *)self->_metadata specialization];
        v100 = [v104 sourceApplicationMetadataForTransformer:self];
      }
      else
      {
        v100 = 0;
      }
    }
    v105 = [v11 captionBar];
    v106 = [v105 leadingIcon];
    if (v106)
    {
      v107 = [v100 icon];

      if (!v107)
      {
LABEL_65:

        goto LABEL_66;
      }
      v105 = [v100 icon];
      v108 = [v11 captionBar];
      [v108 setLeadingIconBadge:v105];
    }
    goto LABEL_65;
  }
LABEL_66:
  if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters onlyShowIcon]) {
    goto LABEL_73;
  }
  v109 = objc_alloc_init(LPWebLinkPresentationProperties);
  -[LPWebLinkPresentationProperties setPreliminary:](v109, "setPreliminary:", [v11 isPreliminary]);
  -[LPWebLinkPresentationProperties setStyle:](v109, "setStyle:", [v11 style]);
  v110 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [(LPWebLinkPresentationProperties *)v109 setCaptionBar:v110];

  v111 = [v11 captionBar];
  v112 = [v111 leadingIcon];

  if (v112)
  {
    v113 = [v11 captionBar];
    v114 = [v113 leadingIcon];
    v115 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v115 setLeadingIcon:v114];

    v116 = [v11 captionBar];
    v117 = [v116 leadingIconProperties];
    v118 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v118 setLeadingIconProperties:v117];

    v119 = [v11 captionBar];
    v120 = [v119 additionalLeadingIcons];
    v121 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v121 setAdditionalLeadingIcons:v120];
LABEL_71:

    goto LABEL_72;
  }
  v122 = [v11 captionBar];
  v123 = [v122 trailingIcon];

  if (v123)
  {
    v124 = [v11 captionBar];
    v125 = [v124 trailingIcon];
    v126 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v126 setTrailingIcon:v125];

    v127 = [v11 captionBar];
    v128 = [v127 trailingIconProperties];
    v129 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v129 setTrailingIconProperties:v128];

    v119 = [v11 captionBar];
    v120 = [v119 additionalTrailingIcons];
    v121 = [(LPWebLinkPresentationProperties *)v109 captionBar];
    [v121 setAdditionalTrailingIcons:v120];
    goto LABEL_71;
  }
LABEL_72:
  v130 = v109;

  id v11 = v130;
LABEL_73:
  [(LPLinkMetadataPresentationTransformer *)self _propagateDominantBackgroundColorToDependentPropertiesIfNeeded:v11];
  if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters useDominantColorForText])
  {
    [(LPLinkMetadataPresentationTransformer *)self _populateDominantBackgroundColorForPropertiesIfNeeded:v11];
    v131 = [v11 captionBar];
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke_83;
    v136[3] = &unk_1E5B06A58;
    id v137 = v11;
    [v131 applyToAllCaptions:v136];
  }
  if (self->_mediaOverlayIcon) {
    [(LPLinkMetadataPresentationTransformer *)self _populatePropertiesForMediaOverlayIcon:v11];
  }

  return v11;
}

void __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = +[LPTheme primaryLabelColor];
  [v3 setColor:v2];
}

void __63__LPLinkMetadataPresentationTransformer_presentationProperties__block_invoke_83(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) dominantImageBackgroundColor];
  [v4 setColor:v3];
}

- (BOOL)hasMediaWithProperties:(id)a3
{
  id v4 = a3;
  int v5 = [v4 video];
  if (!v5)
  {
    BOOL v7 = [v4 image];
    if (!v7
      || ([v4 image],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 _isFallbackIcon]))
    {
      BOOL v8 = [v4 alternateImages];
      if (![v8 count])
      {
        int v9 = [v4 arAsset];
        if (!v9)
        {
          id v11 = [v4 quotedText];
          BOOL v6 = v11 != 0;

          if (!v7) {
            goto LABEL_11;
          }
          goto LABEL_10;
        }
      }
      BOOL v6 = 1;
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)hasMedia
{
  v2 = self;
  id v3 = [(LPLinkMetadataPresentationTransformer *)self presentationProperties];
  LOBYTE(v2) = [(LPLinkMetadataPresentationTransformer *)v2 hasMediaWithProperties:v3];

  return (char)v2;
}

- (id)_preferredBackgroundColorImageSourceForProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 image];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    BOOL v7 = [v3 captionBar];
    BOOL v8 = [v7 leadingIcon];
    int v9 = v8;
    if (v8)
    {
      id v6 = v8;
    }
    else
    {
      int v10 = [v3 captionBar];
      id v6 = [v10 trailingIcon];
    }
  }

  return v6;
}

- (BOOL)_useVisualRefreshCaptionBarColorsForProperties:(id)a3
{
  id v4 = a3;
  if ((sizeClassUsesVisualRefresh([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass]) & 1) == 0
    || !styleAllowsVisualRefresh([v4 style])
    || styleUsesBlurBackgroundForCaptionBar([v4 style]))
  {
    goto LABEL_4;
  }
  BOOL v7 = [v4 backgroundColor];
  if (v7) {
    goto LABEL_7;
  }
  if (!self->_hasOverriddenBackgroundColor)
  {
    BOOL v8 = [(LPLinkMetadataPresentationTransformer *)self _preferredBackgroundColorImageSourceForProperties:v4];
    BOOL v7 = v8;
    if (v8)
    {
      int v9 = [v8 platformImage];
      if (objc_msgSend(v9, "_lp_isSymbolImage") & 1) != 0 || (objc_msgSend(v7, "_isPrecomposedAppIcon"))
      {
      }
      else
      {
        int v10 = [v7 properties];
        uint64_t v11 = [v10 type];

        if (!v11)
        {
          BOOL v5 = 1;
          goto LABEL_8;
        }
      }
    }
LABEL_7:
    BOOL v5 = 0;
LABEL_8:

    goto LABEL_5;
  }
LABEL_4:
  BOOL v5 = 0;
LABEL_5:

  return v5;
}

- (void)_populateDominantBackgroundColorForPropertiesIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dominantImageBackgroundColor];

  if (!v5)
  {
    id v6 = [(LPLinkMetadataPresentationTransformer *)self _preferredBackgroundColorImageSourceForProperties:v4];
    if (v6)
    {
      BOOL v7 = [v4 image];
      BOOL v8 = [v7 _darkInterfaceAlternativeImage];

      int v9 = [v6 platformImage];
      if (objc_msgSend(v9, "_lp_isSymbolImage"))
      {
      }
      else
      {
        int v10 = [v8 platformImage];
        char v11 = objc_msgSend(v10, "_lp_isSymbolImage");

        if ((v11 & 1) == 0)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke;
          v24[3] = &unk_1E5B065C8;
          id v25 = v6;
          int v12 = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke((uint64_t)v24);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2;
          v21[3] = &unk_1E5B06A80;
          id v22 = v8;
          id v13 = v12;
          id v23 = v13;
          unint64_t v14 = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2((uint64_t)v21);
          BOOL v15 = v14;
          if (v13 && v14)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4;
            v17[3] = &unk_1E5B06AC8;
            v17[4] = self;
            id v18 = v14;
            id v19 = v13;
            id v20 = &__block_literal_global_87;
            int v16 = __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4((uint64_t)v17);
            [v4 setDominantImageBackgroundColor:v16];
          }
        }
      }
    }
  }
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = [v2 dominantColor];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    BOOL v5 = [v4 properties];
    id v6 = [v5 dominantColor];
  }
  else
  {
    BOOL v5 = [v4 platformImage];
    BOOL v7 = objc_msgSend(v5, "_lp_dominantColors");
    id v6 = [v7 firstObject];
  }

  return v6;
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = [v2 dominantColor];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    BOOL v5 = [v4 properties];
    id v6 = [v5 dominantColor];
  }
  else
  {
    BOOL v7 = [v4 platformImage];
    BOOL v8 = objc_msgSend(v7, "_lp_dominantColors");
    BOOL v5 = [v8 firstObject];

    int v9 = v5;
    if (!*(void *)(a1 + 32)) {
      int v9 = *(void **)(a1 + 40);
    }
    id v6 = v9;
  }
  int v10 = v6;

  return v10;
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_3(uint64_t a1, void *a2)
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v4 = 0.0;
  [a2 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4];
  v2 = [MEMORY[0x1E4FB1618] colorWithHue:v7 saturation:v6 brightness:v5 + dbl_1A3711EA0[v5 < 0.5] alpha:v4];

  return v2;
}

id __95__LPLinkMetadataPresentationTransformer__populateDominantBackgroundColorForPropertiesIfNeeded___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) effectiveAppearance];
  unsigned int v3 = objc_msgSend(v2, "_lp_prefersDarkInterface");

  uint64_t v4 = 48;
  if (v3) {
    uint64_t v4 = 40;
  }
  id v5 = *(id *)(a1 + v4);
  double v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if ([*(id *)(*(void *)(a1 + 32) + 40) useDominantColorForText])
  {
    double v7 = objc_msgSend(MEMORY[0x1E4FB1618], "_lp_systemBackgroundColor");
    uint64_t v8 = v3;
    int v9 = objc_msgSend(v7, "_lp_colorForcingUserInterfaceStyle:", v3);

    if ([v6 contrastsWith:v9])
    {
      id v10 = v6;
    }
    else
    {
      char v11 = [MEMORY[0x1E4FB1618] labelColor];
      objc_msgSend(v11, "_lp_colorForcingUserInterfaceStyle:", v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (void)_propagateDominantBackgroundColorToDependentPropertiesIfNeeded:(id)a3
{
  id v11 = a3;
  if ([(LPLinkMetadataPresentationTransformer *)self _useVisualRefreshCaptionBarColorsForProperties:v11])
  {
    [(LPLinkMetadataPresentationTransformer *)self _populateDominantBackgroundColorForPropertiesIfNeeded:v11];
    uint64_t v4 = [v11 captionBar];
    id v5 = [v4 playButton];

    if (!v5)
    {
      double v6 = objc_alloc_init(LPPlayButtonPresentationProperties);
      double v7 = [v11 captionBar];
      [v7 setPlayButton:v6];
    }
    uint64_t v8 = [v11 dominantImageBackgroundColor];
    int v9 = [v11 captionBar];
    id v10 = [v9 playButton];
    [v10 setAccentColor:v8];
  }
}

- (void)_populatePropertiesForMediaOverlayIcon:(id)a3
{
  id v10 = a3;
  -[LPLinkMetadataPresentationTransformer _populateDominantBackgroundColorForPropertiesIfNeeded:](self, "_populateDominantBackgroundColorForPropertiesIfNeeded:");
  uint64_t v4 = [v10 mediaBottomCaptionBar];

  if (!v4)
  {
    id v5 = objc_alloc_init(LPCaptionBarPresentationProperties);
    [v10 setMediaBottomCaptionBar:v5];
  }
  double v6 = objc_alloc_init(LPImagePresentationProperties);
  [(LPImagePresentationProperties *)v6 setFilter:1];
  [(LPImagePresentationProperties *)v6 setScalingMode:3];
  mediaOverlayIcon = self->_mediaOverlayIcon;
  uint64_t v8 = [v10 mediaBottomCaptionBar];
  [v8 setTrailingIcon:mediaOverlayIcon];

  int v9 = [v10 mediaBottomCaptionBar];
  [v9 setTrailingIconProperties:v6];
}

- (unint64_t)_rowConfigurationForStyle:(int64_t)a3
{
  uint64_t v3 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];

  return rowConfigurationForSizeClass(v3);
}

- (BOOL)_prefersIconAsImage
{
  uint64_t v2 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];

  return sizeClassRequiresLargeMedia(v2);
}

- (BOOL)_prefersImageAsIconWithStyle:(int64_t)a3
{
  if (sizeClassRequiresLargeMedia([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])) {
    return 0;
  }
  if (sizeClassPrefersIcon([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])) {
    return 1;
  }

  return stylePrefersImageAsIcon(a3);
}

- (BOOL)_prefersLeadingIconWithStyle:(int64_t)a3
{
  if (sizeClassRequiresTrailingIcon([(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass])) {
    return 0;
  }
  if (stylePrefersLeadingIcon(a3)) {
    return 1;
  }
  unint64_t v6 = [(LPLinkMetadataPresentationTransformer *)self effectiveSizeClass];

  return sizeClassPrefersLeadingIcon(v6);
}

- (void)_populateProperties:(id)a3 withPrimaryImage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[LPLinkMetadataPresentationTransformer _prefersImageAsIconWithStyle:](self, "_prefersImageAsIconWithStyle:", [v8 style]))
  {
    if (-[LPLinkMetadataPresentationTransformer _prefersLeadingIconWithStyle:](self, "_prefersLeadingIconWithStyle:", [v8 style]))
    {
      double v7 = [v8 captionBar];
      [v7 setLeadingIcon:v6];
    }
    else
    {
      double v7 = [v8 captionBar];
      [v7 setTrailingIcon:v6];
    }
  }
  else
  {
    [v8 setImage:v6];
  }
}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4
{
}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5 canBecomeImage:(BOOL)a6
{
  BOOL v6 = a6;
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(LPLinkMetadataPresentationTransformer *)self _prefersIconAsImage] && v6)
  {
    [v15 setImage:v10];
    [v15 setImageProperties:v11];
  }
  else
  {
    if (-[LPLinkMetadataPresentationTransformer _prefersLeadingIconWithStyle:](self, "_prefersLeadingIconWithStyle:", [v15 style]))
    {
      int v12 = [v15 captionBar];
      [v12 setLeadingIcon:v10];

      [v15 setImageProperties:v11];
      id v13 = [v15 captionBar];
      [v13 setLeadingIconProperties:v11];
    }
    else
    {
      unint64_t v14 = [v15 captionBar];
      [v14 setTrailingIcon:v10];

      [v15 setImageProperties:v11];
      id v13 = [v15 captionBar];
      [v13 setTrailingIconProperties:v11];
    }
  }
}

- (void)_populateProperties:(id)a3 withPrimaryIcon:(id)a4 iconProperties:(id)a5
{
}

- (void)setPreferredSizeClass:(unint64_t)a3
{
  if (a3 == 9)
  {
    self->_preferredSizeClass = 0;
    if ([(LPLinkMetadataPresentationTransformer *)self hasMedia]) {
      a3 = 9;
    }
    else {
      a3 = 8;
    }
  }
  self->_preferredSizeClass = a3;
}

- (unint64_t)effectiveSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)allowsTapToLoad
{
  return self->_allowsTapToLoad;
}

- (void)setAllowsTapToLoad:(BOOL)a3
{
  self->_allowsTapToLoad = a3;
}

- (BOOL)allowsTapping
{
  return self->_allowsTapping;
}

- (void)setAllowsTapping:(BOOL)a3
{
  self->_allowsTapping = a3;
}

- (BOOL)allowsPlaybackControls
{
  return self->_allowsPlaybackControls;
}

- (void)setAllowsPlaybackControls:(BOOL)a3
{
  self->_allowsPlaybackControls = a3;
}

- (BOOL)allowsPlayback
{
  return self->_allowsPlayback;
}

- (void)setAllowsPlayback:(BOOL)a3
{
  self->_BOOL allowsPlayback = a3;
}

- (BOOL)hasOverriddenBackgroundColor
{
  return self->_hasOverriddenBackgroundColor;
}

- (void)setHasOverriddenBackgroundColor:(BOOL)a3
{
  self->_hasOverriddenBackgroundColor = a3;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkRendererSizeClassParameters)sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (void)setSizeClassParameters:(id)a3
{
}

- (LPImage)sourceContextIcon
{
  return self->_sourceContextIcon;
}

- (void)setSourceContextIcon:(id)a3
{
}

- (LPImage)mediaOverlayIcon
{
  return self->_mediaOverlayIcon;
}

- (void)setMediaOverlayIcon:(id)a3
{
}

- (UITraitCollection)effectiveAppearance
{
  return self->_effectiveAppearance;
}

- (void)setEffectiveAppearance:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_double scaleFactor = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (BOOL)isCollaborative
{
  return self->_collaborative;
}

- (void)setCollaborative:(BOOL)a3
{
  self->_collaborative = a3;
}

- (BOOL)isInComposeContext
{
  return self->_inComposeContext;
}

- (void)setInComposeContext:(BOOL)a3
{
  self->_inComposeContext = a3;
}

- (unint64_t)bytesLoaded
{
  return self->_bytesLoaded;
}

- (void)setBytesLoaded:(unint64_t)a3
{
  self->_bytesLoaded = a3;
}

- (int64_t)sharedObjectDownloadState
{
  return self->_sharedObjectDownloadState;
}

- (void)setSharedObjectDownloadState:(int64_t)a3
{
  self->_sharedObjectDownloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_effectiveAppearance, 0);
  objc_storeStrong((id *)&self->_mediaOverlayIcon, 0);
  objc_storeStrong((id *)&self->_sourceContextIcon, 0);
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)presentationProperties
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_1A35DC000, v0, v1, "Failed to generate presentation properties for LPLinkMetadata specialization class %@ with exception: %@");
}

@end