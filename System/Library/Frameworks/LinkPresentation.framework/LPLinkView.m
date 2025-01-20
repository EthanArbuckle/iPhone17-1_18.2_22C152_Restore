@interface LPLinkView
- (BOOL)_allowsAsynchronousImageDecoding;
- (BOOL)_allowsLoadingMediaWithAutoPlayDisabled;
- (BOOL)_allowsOpeningSensitiveURLs;
- (BOOL)_allowsSkinnyWidth;
- (BOOL)_allowsTapToLoad;
- (BOOL)_applyCornerRadius;
- (BOOL)_backgroundColorSupportsVibrancy:(id)a3;
- (BOOL)_disableAnimations;
- (BOOL)_disableAutoPlay;
- (BOOL)_disableHighlightGesture;
- (BOOL)_disableLinkFollowing;
- (BOOL)_disablePlayback;
- (BOOL)_disablePlaybackControls;
- (BOOL)_disablePreviewGesture;
- (BOOL)_disableTapGesture;
- (BOOL)_forceFlexibleWidth;
- (BOOL)_hasMediaToPlay;
- (BOOL)_inComposeContext;
- (BOOL)_inSenderContext;
- (BOOL)_isCollaborative;
- (BOOL)_isHighlightedForAttribution;
- (BOOL)_isPlayingMedia;
- (BOOL)_isShowingDisclosureView;
- (BOOL)_isUsingAppClipPresentation;
- (BOOL)_layoutHeightDependsOnWidth;
- (BOOL)_maskEnabled;
- (BOOL)_needsMessagesTranscriptPushCounterAnimation;
- (BOOL)_shouldApplyCornerRadius;
- (BOOL)_shouldClipAnimationView;
- (BOOL)_shouldUseAnimations;
- (BOOL)_shouldUseBlur;
- (BOOL)_strictlyRespectsSizeClassHeightConstraints;
- (BOOL)_useCPURenderingForMaterials;
- (BOOL)_useLowMemoryImageFilters;
- (BOOL)_useProgressSpinner;
- (BOOL)_usesDeferredLayout;
- (BOOL)allowsAsynchronousImageDecodingForComponentView:(id)a3;
- (BOOL)allowsBadgingIconEdgeForComponentView:(id)a3;
- (BOOL)allowsVibrancyForComponentView:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)linkHasMediaForComponentView:(id)a3;
- (BOOL)showingDisclosureViewForComponentView:(id)a3;
- (BOOL)usesBackgroundForSymbolImagesForComponentView:(id)a3;
- (CGRect)_primaryCaptionBarFrame;
- (CGRect)_rectForCaptionButtonType:(int64_t)a3;
- (CGSize)_layoutLinkViewForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPImage)_lastResortIcon;
- (LPImage)_mediaOverlayIcon;
- (LPLinkMetadata)_flattenedMetadata;
- (LPLinkMetadata)metadata;
- (LPLinkRendererSizeClassParameters)_sizeClassParameters;
- (LPLinkView)init;
- (LPLinkView)initWithCoder:(NSCoder *)coder;
- (LPLinkView)initWithFrame:(CGRect)a3;
- (LPLinkView)initWithMetadata:(LPLinkMetadata *)metadata;
- (LPLinkView)initWithMetadataLoadedFromRequest:(id)a3;
- (LPLinkView)initWithMetadataLoadedFromURL:(id)a3;
- (LPLinkView)initWithPresentationProperties:(id)a3;
- (LPLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4;
- (LPLinkViewDelegate)delegate;
- (NSArray)_contactsForAttribution;
- (NSArray)_metadataVariants;
- (NSNumber)_selectedVariantIndex;
- (NSRegularExpression)_emphasizedTextExpression;
- (NSString)_sourceBundleIdentifier;
- (NSURL)URL;
- (NSURL)_overrideURL;
- (UIColor)_dominantBackgroundColor;
- (UIColor)_overrideActionButtonColor;
- (UIColor)_overrideBackgroundColor;
- (UIColor)_overrideMediaBackgroundColor;
- (UIColor)_overrideSubtitleButtonColor;
- (UIColor)_resolvedBackgroundColor;
- (UIColor)_underlyingBackgroundColor;
- (UIEdgeInsets)_textSafeAreaInset;
- (UIEdgeInsets)contentInset;
- (UITraitCollection)_effectiveTraitCollection;
- (double)_effectiveCornerRadius;
- (double)minimumCornerRadiusForComponentView:(id)a3;
- (id)_createBackgroundImageView;
- (id)_createCaptionBar;
- (id)_createComponents;
- (id)_createContactsBadgeView;
- (id)_createDomainNameIndicator;
- (id)_createMediaBottomCaptionBarView;
- (id)_createMediaTopCaptionBarView;
- (id)_createMediaView;
- (id)_createMediaViewForProperties:(id)a3;
- (id)_createProgressSpinner;
- (id)_createQuotedTextView;
- (id)_createTapToLoadView;
- (id)_effectiveAppearanceTraits;
- (id)_fetchMetadataForRequest:(id)a3 withSubresources:(BOOL)a4 completionHandler:(id)a5;
- (id)_initWithMetadataLoadedFromRequests:(id)a3;
- (id)_initWithMetadataLoadedFromURLs:(id)a3;
- (id)_initWithMultipleMetadata:(id)a3;
- (id)_initWithNullableURL:(id)a3;
- (id)_initWithSynapseContentItem:(id)a3;
- (id)_mediaBackgroundColor;
- (id)_playable;
- (id)_presentationOverrideBackgroundColor;
- (id)_primaryMediaView;
- (id)_videoViewConfiguration;
- (id)appearanceForComponentView:(id)a3;
- (id)componentView:(id)a3 playerForAudio:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)downloadProgressForComponentView:(id)a3;
- (id)layoutExclusionsForView:(id)a3;
- (int64_t)_animationOrigin;
- (int64_t)_blurEffectStyle;
- (int64_t)_style;
- (int64_t)_themePlatform;
- (int64_t)componentView:(id)a3 allowedImageFilterForFilter:(int64_t)a4;
- (int64_t)rendererStyleForComponentView:(id)a3;
- (int64_t)sharedObjectDownloadStateForComponentView:(id)a3;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (unint64_t)_bytesLoaded;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
- (unint64_t)_preferredSizeClass;
- (void)_addCaptionButton:(id)a3;
- (void)_addHighlightRecognizerToView:(id)a3 forMedia:(BOOL)a4;
- (void)_addTapRecognizerToView:(id)a3 forMedia:(BOOL)a4;
- (void)_animateWithDuration:(double)a3 animations:(id)a4;
- (void)_cancelActiveHighlight;
- (void)_captionBarButtonPressed:(id)a3;
- (void)_captionHighlightRecognized:(id)a3;
- (void)_captionTapRecognized:(id)a3;
- (void)_commonInitWithURL:(id)a3;
- (void)_computePresentationPropertiesFromMetadataIfNeeded;
- (void)_configureWithoutLoadingMetadataFromURLs:(id)a3;
- (void)_disableBlur;
- (void)_enableBlur;
- (void)_fetchMetadataForRequest:(id)a3;
- (void)_installHighlightGestureRecognizers;
- (void)_installPreviewGestureRecognizer;
- (void)_installTapGestureRecognizers;
- (void)_invalidateLayout;
- (void)_invalidatePresentationProperties;
- (void)_invalidatePresentationPropertiesAndLayout;
- (void)_layoutLinkView;
- (void)_mediaHighlightRecognized:(id)a3;
- (void)_mediaTapRecognized:(id)a3;
- (void)_openURL;
- (void)_openURLAllowingSensitiveSchemes:(BOOL)a3 allowingAssociatedApplications:(BOOL)a4;
- (void)_pauseMedia;
- (void)_playMedia;
- (void)_rebuildEntireView;
- (void)_rebuildGestureRecognizersIfNeeded;
- (void)_rebuildSubviewsWithAnimation:(BOOL)a3;
- (void)_removeCaptionButtonWithType:(int64_t)a3;
- (void)_resetMediaPlayback;
- (void)_setAction:(id)a3 withAttributedText:(id)a4 buttonType:(int64_t)a5;
- (void)_setAction:(id)a3 withText:(id)a4;
- (void)_setAction:(id)a3 withText:(id)a4 buttonType:(int64_t)a5;
- (void)_setAllowsAsynchronousImageDecoding:(BOOL)a3;
- (void)_setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3;
- (void)_setAllowsOpeningSensitiveURLs:(BOOL)a3;
- (void)_setAllowsSkinnyWidth:(BOOL)a3;
- (void)_setAllowsTapToLoad:(BOOL)a3;
- (void)_setAnimationOrigin:(int64_t)a3;
- (void)_setApplyCornerRadius:(BOOL)a3;
- (void)_setButtonActions:(id)a3;
- (void)_setBytesLoaded:(unint64_t)a3;
- (void)_setCollaborationFooterViewModel:(id)a3 action:(id)a4;
- (void)_setCollaborative:(BOOL)a3;
- (void)_setContactsForAttribution:(id)a3;
- (void)_setDisableAnimations:(BOOL)a3;
- (void)_setDisableAutoPlay:(BOOL)a3;
- (void)_setDisableHighlightGesture:(BOOL)a3;
- (void)_setDisableLinkFollowing:(BOOL)a3;
- (void)_setDisablePlayback:(BOOL)a3;
- (void)_setDisablePlaybackControls:(BOOL)a3;
- (void)_setDisablePreviewGesture:(BOOL)a3;
- (void)_setDisableTapGesture:(BOOL)a3;
- (void)_setEffectiveAppearanceTraits:(id)a3;
- (void)_setEffectiveCornerRadius:(double)a3;
- (void)_setEmphasizedTextExpression:(id)a3;
- (void)_setForceFlexibleWidth:(BOOL)a3;
- (void)_setHighlightCaption:(BOOL)a3;
- (void)_setHighlightMedia:(BOOL)a3;
- (void)_setHighlightedForAttribution:(BOOL)a3;
- (void)_setInComposeContext:(BOOL)a3;
- (void)_setInSenderContext:(BOOL)a3;
- (void)_setLastResortIcon:(id)a3;
- (void)_setMaskEnabled:(BOOL)a3;
- (void)_setMaskEnabledForAnimation:(BOOL)a3;
- (void)_setMaskImage:(id)a3;
- (void)_setMediaOverlayIcon:(id)a3;
- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4;
- (void)_setMetadataInternal:(id)a3;
- (void)_setMultipleMetadata:(id)a3;
- (void)_setNeedsMessagesTranscriptPushCounterAnimation:(BOOL)a3;
- (void)_setOverrideActionButtonColor:(id)a3;
- (void)_setOverrideBackgroundColor:(id)a3;
- (void)_setOverrideMediaBackgroundColor:(id)a3;
- (void)_setOverrideSubtitle:(id)a3;
- (void)_setOverrideSubtitleButtonColor:(id)a3;
- (void)_setOverrideURL:(id)a3;
- (void)_setPreferredSizeClass:(unint64_t)a3;
- (void)_setPresentationProperties:(id)a3;
- (void)_setSelectedVariantIndex:(id)a3;
- (void)_setShowingDisclosureView:(BOOL)a3;
- (void)_setSizeClassParameters:(id)a3;
- (void)_setSourceBundleIdentifier:(id)a3;
- (void)_setSuppressChatKitMask:(BOOL)a3;
- (void)_setTextSafeAreaInset:(UIEdgeInsets)a3;
- (void)_setUnderlyingBackgroundColor:(id)a3;
- (void)_setUseCPURenderingForMaterials:(BOOL)a3;
- (void)_setUseLowMemoryImageFilters:(BOOL)a3;
- (void)_setUsesDeferredLayout:(BOOL)a3;
- (void)_setupView;
- (void)_uninstallHighlightGestureRecognizers;
- (void)_uninstallPreviewGestureRecognizer;
- (void)_uninstallTapGestureRecognizers;
- (void)_updateBackgroundColor;
- (void)_updateBlur;
- (void)_updateCornerRadius;
- (void)_updateEffectiveAppearanceTraitsIfNeeded;
- (void)_updateMasking;
- (void)_updateMetadataIsComplete;
- (void)animateBackgroundColor;
- (void)animateFromOldFrame:(CGRect)a3 oldMediaBackgroundFrame:(CGRect)a4 oldCaptionBarView:(id)a5;
- (void)animateInViews;
- (void)animateOutAndRemoveViews;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)componentViewDidChangeMediaState:(id)a3;
- (void)componentViewDidTapCaptionButton:(id)a3 buttonType:(int64_t)a4;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)resetDownloadState;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setMetadata:(LPLinkMetadata *)metadata;
- (void)setURL:(id)a3;
- (void)tapToLoadViewWasTapped:(id)a3;
- (void)themeParametersDidChange;
@end

@implementation LPLinkView

- (LPLinkView)init
{
  v3 = objc_alloc_init(LPLinkMetadata);
  v4 = [(LPLinkView *)self initWithMetadata:v3];

  return v4;
}

- (LPLinkView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPLinkView;
  v3 = -[LPLinkView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(LPLinkView *)v3 _commonInitWithURL:0];
    v4->_usesComputedPresentationProperties = 1;
    v4->_metadataIsComplete = 1;
    v5 = v4;
  }

  return v4;
}

- (LPLinkView)initWithCoder:(NSCoder *)coder
{
  return 0;
}

- (LPLinkView)initWithMetadataLoadedFromURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:v4];
  v6 = [(LPLinkView *)self initWithMetadataLoadedFromRequest:v5];

  return v6;
}

- (LPLinkView)initWithMetadataLoadedFromRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = [(LPLinkView *)self _initWithNullableURL:v5];
  objc_super v7 = v6;
  if (v6)
  {
    [(LPLinkView *)v6 _fetchMetadataForRequest:v4];
    v8 = v7;
  }

  return v7;
}

- (id)_initWithMetadataLoadedFromURLs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = objc_msgSend(MEMORY[0x1E4F18DA8], "requestWithURL:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
        [v5 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [(LPLinkView *)self _initWithMetadataLoadedFromRequests:v5];
  return v11;
}

- (id)_initWithMetadataLoadedFromRequests:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = v5;
  if (v5)
  {
    [(LPLinkView *)v5 _commonInitWithURL:0];
    v6->_usesComputedPresentationProperties = 1;
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * v11) URL];
          [v7 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    if ((unint64_t)[v8 count] < 0xB)
    {
      objc_storeStrong((id *)&v6->_multipleURLs, v7);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke;
      v22 = &unk_1E5B06658;
      id v15 = v14;
      id v23 = v15;
      long long v16 = v6;
      v24 = v16;
      [v8 enumerateObjectsUsingBlock:&v19];
      -[LPLinkView _setMultipleMetadata:](v16, "_setMultipleMetadata:", v15, v19, v20, v21, v22);
      v17 = v16;
    }
    else
    {
      [(LPLinkView *)v6 _configureWithoutLoadingMetadataFromURLs:v7];
      long long v13 = v6;
    }
  }
  return v6;
}

void __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  BOOL v7 = a3 < 2;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke_2;
  v12 = &unk_1E5B06630;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v8 = [v13 _fetchMetadataForRequest:a2 withSubresources:v7 completionHandler:&v9];
  objc_msgSend(v6, "addObject:", v8, v9, v10, v11, v12);
}

void __50__LPLinkView__initWithMetadataLoadedFromRequests___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setMultipleMetadata:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 840));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained linkView:*(void *)(a1 + 32) didFetchMetadata:*(void *)(*(void *)(a1 + 32) + 424)];
  }
}

- (id)_initWithNullableURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = v5;
  if (v5)
  {
    [(LPLinkView *)v5 _commonInitWithURL:v4];
    v6->_usesComputedPresentationProperties = 1;
    v6->_metadataIsComplete = 1;
    BOOL v7 = v6;
  }

  return v6;
}

- (LPLinkView)initWithMetadata:(LPLinkMetadata *)metadata
{
  id v4 = metadata;
  v5 = [(LPLinkMetadata *)v4 originalURL];
  id v6 = [(LPLinkView *)self _initWithNullableURL:v5];

  if (v6)
  {
    [(LPLinkView *)v6 setMetadata:v4];
    BOOL v7 = v6;
  }

  return v6;
}

- (id)_initWithMultipleMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LPLinkView;
  v5 = -[LPLinkView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = v5;
  if (v5)
  {
    [(LPLinkView *)v5 _commonInitWithURL:0];
    v6->_usesComputedPresentationProperties = 1;
    v6->_metadataIsComplete = 1;
    [(LPLinkView *)v6 _setMultipleMetadata:v4];
    BOOL v7 = v6;
  }

  return v6;
}

- (LPLinkView)initWithPresentationProperties:(id)a3
{
  v3 = [(LPLinkView *)self initWithPresentationProperties:a3 URL:0];
  id v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (LPLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LPLinkView;
  id v8 = -[LPLinkView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v9 = v8;
  if (v8)
  {
    [(LPLinkView *)v8 _commonInitWithURL:v7];
    [(LPLinkView *)v9 _setPresentationProperties:v6];
    uint64_t v10 = v9;
  }

  return v9;
}

- (id)_initWithSynapseContentItem:(id)a3
{
  id v4 = a3;
  id v5 = [[LPLinkMetadata alloc] _initWithSynapseContentItem:v4];
  id v6 = [(LPLinkView *)self initWithMetadata:v5];

  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (void)_commonInitWithURL:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  pendingMetadataProviders = self->_pendingMetadataProviders;
  self->_pendingMetadataProviders = v6;

  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v9 = [v8 bundleIdentifier];
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  self->_sourceBundleIdentifier = v9;

  self->_loggingID = ++generateLoggingID_nextLoggingID;
  objc_storeStrong((id *)&self->_URL, a3);
  self->_applyCornerRadius = 1;
  self->_allowsSkinnyWidth = +[LPApplicationCompatibilityQuirks allowsSkinnyWidthByDefault];
  self->_presentationPropertyState = -1;
  self->_allowsAsynchronousImageDecoding = !+[LPApplicationIdentification isFreeform];
  uint64_t v11 = self;
  v22[0] = v11;
  objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v13 = (id)[(LPLinkView *)self registerForTraitChanges:v12 withHandler:&__block_literal_global_19];

  id v14 = self;
  v21 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v16 = (id)[(LPLinkView *)self registerForTraitChanges:v15 withHandler:&__block_literal_global_124_0];

  v17 = self;
  uint64_t v20 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v19 = (id)[(LPLinkView *)self registerForTraitChanges:v18 withHandler:&__block_literal_global_127];
}

void __33__LPLinkView__commonInitWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _invalidatePresentationProperties];
  [v2 themeParametersDidChange];
}

uint64_t __33__LPLinkView__commonInitWithURL___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 themeParametersDidChange];
}

void __33__LPLinkView__commonInitWithURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v2[84] |= 1uLL;
  ++v2[85];
  v3 = v2;
  [v2 themeParametersDidChange];
  --v3[85];
}

- (void)dealloc
{
  +[LPTheme removeClient:self];
  v3.receiver = self;
  v3.super_class = (Class)LPLinkView;
  [(LPLinkView *)&v3 dealloc];
}

- (void)_setApplyCornerRadius:(BOOL)a3
{
  self->_applyCornerRadius = a3;
  [(LPLinkView *)self _rebuildEntireView];
}

- (BOOL)_shouldApplyCornerRadius
{
  BOOL v3 = sizeClassAllowsProgressSpinner(self->_effectiveSizeClass);
  if (v3) {
    LOBYTE(v3) = self->_applyCornerRadius;
  }
  return v3;
}

- (void)_setEffectiveCornerRadius:(double)a3
{
  self->_hasOverrideCornerRadius = 1;
  self->_overrideCornerRadius = a3;
  [(LPLinkView *)self _updateCornerRadius];
}

- (double)_effectiveCornerRadius
{
  [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
  if (self->_hasOverrideCornerRadius)
  {
    double overrideCornerRadius = self->_overrideCornerRadius;
  }
  else
  {
    id v4 = [(LPTheme *)self->_theme cornerRadius];
    [v4 value];
    double overrideCornerRadius = v5;
  }
  [(LPLinkView *)self frame];
  double v7 = v6 * 0.5;
  [(LPLinkView *)self frame];
  return fmin(overrideCornerRadius, fmin(v7, v8 * 0.5));
}

- (void)_updateCornerRadius
{
  animationView = self->_animationView;
  BOOL v4 = [(LPLinkView *)self _shouldApplyCornerRadius];
  double v5 = 0.0;
  if (v4) {
    [(LPLinkView *)self _effectiveCornerRadius];
  }

  [(UIView *)animationView _lp_setCornerRadius:v5];
}

- (BOOL)_shouldClipAnimationView
{
  return sizeClassAllowsProgressSpinner(self->_effectiveSizeClass);
}

- (void)_configureWithoutLoadingMetadataFromURLs:(id)a3
{
  id v9 = a3;
  BOOL v4 = objc_alloc_init(LPLinkMetadata);
  double v5 = NSString;
  double v6 = LPLocalizedString(@"%ld Document(s)");
  double v7 = objc_msgSend(v5, "stringWithFormat:", v6, objc_msgSend(v9, "count"));
  [(LPLinkMetadata *)v4 setTitle:v7];

  double v8 = objc_alloc_init(LPSummarizedLinkMetadata);
  [(LPLinkMetadata *)v4 setSpecialization:v8];

  [(LPLinkView *)self _setMetadata:v4 isFinal:1];
}

- (id)_fetchMetadataForRequest:(id)a3 withSubresources:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(LPLinkView *)self _updateMetadataIsComplete];
  uint64_t v10 = objc_alloc_init(LPMetadataProvider);
  [(NSHashTable *)self->_pendingMetadataProviders addObject:v10];
  [(LPMetadataProvider *)v10 setShouldFetchSubresources:v6];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6;
  long long v25 = __Block_byref_object_dispose__6;
  id v26 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke;
  v17[3] = &unk_1E5B066C8;
  v17[4] = self;
  uint64_t v11 = v10;
  uint64_t v18 = v11;
  id v12 = v9;
  id v19 = v12;
  uint64_t v20 = &v21;
  uint64_t v13 = [(LPMetadataProvider *)v11 _startFetchingMetadataForRequest:v8 completionHandler:v17];
  id v14 = (void *)v22[5];
  v22[5] = v13;

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5B066A0;
  id v2 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __74__LPLinkView__fetchMetadataForRequest_withSubresources_completionHandler___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 416) removeObject:a1[5]];
  uint64_t result = a1[6];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_fetchMetadataForRequest:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__LPLinkView__fetchMetadataForRequest___block_invoke;
  v7[3] = &unk_1E5B066F0;
  v7[4] = self;
  uint64_t v4 = [(LPLinkView *)self _fetchMetadataForRequest:a3 withSubresources:1 completionHandler:v7];
  self->_allowsTapToLoad = 0;
  double v5 = [(LPLinkViewComponents *)self->_components media];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [(LPLinkView *)self _setMetadata:v4 isFinal:0];
  }
}

void __39__LPLinkView__fetchMetadataForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __39__LPLinkView__fetchMetadataForRequest___block_invoke_2;
  uint64_t v13 = &unk_1E5B04E18;
  uint64_t v14 = *(void *)(a1 + 32);
  id v4 = v3;
  id v15 = v4;
  double v5 = (void (**)(void))_Block_copy(&v10);
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "media", v10, v11, v12, v13, v14);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 584) media];
    [v8 animateOutWithCompletionHandler:v5];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 584) captionBar];
    [v9 animateOut];

    [*(id *)(*(void *)(a1 + 32) + 584) setCaptionBar:0];
  }
  else
  {
    v5[2](v5);
  }
}

void __39__LPLinkView__fetchMetadataForRequest___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setMetadata:*(void *)(a1 + 40) isFinal:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 840));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained linkView:*(void *)(a1 + 32) didFetchMetadata:*(void *)(*(void *)(a1 + 32) + 424)];
  }
}

- (void)_setupView
{
  +[LPTheme addClient:self];
  objc_msgSend(MEMORY[0x1E4FB1EB0], "_lp_createFlippedView");
  id v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  animationView = self->_animationView;
  self->_animationView = v3;

  double v5 = [(UIView *)self->_animationView layer];
  [v5 setMasksToBounds:1];

  [(LPLinkView *)self addSubview:self->_animationView];
  objc_msgSend(MEMORY[0x1E4FB1EB0], "_lp_createFlippedView");
  id v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v6;

  [(LPLinkView *)self _updateEffectiveAppearanceTraitsIfNeeded];
  [(UIView *)self->_animationView addSubview:self->_contentView];
  uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  tapGestureRecognizers = self->_tapGestureRecognizers;
  self->_tapGestureRecognizers = v8;

  uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  highlightGestureRecognizers = self->_highlightGestureRecognizers;
  self->_highlightGestureRecognizers = v10;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__LPLinkView__setupView__block_invoke;
  aBlock[3] = &unk_1E5B06738;
  aBlock[4] = self;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  v12[2]();
  uint64_t v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  captionHighlightView = self->_captionHighlightView;
  self->_captionHighlightView = v13;

  [(UIView *)self->_animationView addSubview:self->_captionHighlightView];
  ((void (*)(void (**)(void)))v12[2])(v12);
  id v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  mediaHighlightView = self->_mediaHighlightView;
  self->_mediaHighlightView = v15;

  [(UIView *)self->_animationView addSubview:self->_mediaHighlightView];
  [(LPLinkView *)self _updateBlur];
  [(UIView *)self->_animationView _lp_setHoverEffectEnabled:!self->_disableTapGesture];
  if (+[LPSettings showDebugIndicators])
  {
    id v17 = [MEMORY[0x1E4FB1618] redColor];
    uint64_t v18 = [v17 CGColor];
    id v19 = [(LPLinkView *)self layer];
    [v19 setBorderColor:v18];

    uint64_t v20 = [(LPLinkView *)self layer];
    [v20 setBorderWidth:0.5];

    id v21 = [MEMORY[0x1E4FB1618] greenColor];
    uint64_t v22 = [v21 CGColor];
    uint64_t v23 = [(UIView *)self->_animationView layer];
    [v23 setBorderColor:v22];

    v24 = [(UIView *)self->_animationView layer];
    [v24 setBorderWidth:0.5];
  }
}

LPBackgroundColorView *__24__LPLinkView__setupView__block_invoke(uint64_t a1)
{
  id v2 = [LPBackgroundColorView alloc];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 448) highlightColor];
  id v4 = [(LPBackgroundColorView *)v2 initWithColor:v3];

  [(LPBackgroundColorView *)v4 setHidden:1];
  [(LPBackgroundColorView *)v4 setUserInteractionEnabled:0];
  double v5 = [*(id *)(*(void *)(a1 + 32) + 448) highlightCompositingFilter];
  [(UIView *)v4 _lp_applyAndRegisterForUpdatesToValue:v5 withApplyCallback:&__block_literal_global_144];

  return v4;
}

uint64_t __24__LPLinkView__setupView__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setCompositingFilter:");
}

- (int64_t)_blurEffectStyle
{
  return [(LPTheme *)self->_theme backgroundMaterial];
}

- (BOOL)_shouldUseBlur
{
  if ([(LPLinkView *)self _themePlatform] != 5 || self->_overrideBackgroundColor) {
    goto LABEL_3;
  }
  int v3 = sizeClassAllowsBackgroundColor(self->_effectiveSizeClass);
  if (!v3) {
    return v3;
  }
  if (+[LPSettings useLightweightMaterials]) {
LABEL_3:
  }
    LOBYTE(v3) = 0;
  else {
    LOBYTE(v3) = self->_backgroundColorSupportsVibrancy;
  }
  return v3;
}

- (void)_updateBlur
{
  if ([(LPLinkView *)self _shouldUseBlur])
  {
    [(LPLinkView *)self _enableBlur];
  }
  else
  {
    [(LPLinkView *)self _disableBlur];
  }
}

- (void)_enableBlur
{
  if (!self->_blurView && self->_contentView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
    objc_msgSend(MEMORY[0x1E4FB14C8], "effectWithStyle:", -[LPLinkView _blurEffectStyle](self, "_blurEffectStyle"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:");
    blurView = self->_blurView;
    self->_blurView = v4;

    [(UIView *)self->_animationView insertSubview:self->_blurView belowSubview:self->_contentView];
    id v7 = [(UIVisualEffectView *)self->_blurView contentView];
    [v7 addSubview:self->_contentView];
  }
}

- (void)_disableBlur
{
  if (self->_blurView)
  {
    -[UIView insertSubview:belowSubview:](self->_animationView, "insertSubview:belowSubview:", self->_contentView);
    [(UIVisualEffectView *)self->_blurView removeFromSuperview];
    blurView = self->_blurView;
    self->_blurView = 0;
  }
}

- (double)minimumCornerRadiusForComponentView:(id)a3
{
  id v4 = a3;
  double v5 = [(LPLinkViewComponents *)self->_components captionBar];
  if (([v5 hasIconViewEqualToComponentView:v4] & 1) == 0)
  {
    id v6 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
    if (![v6 hasIconViewEqualToComponentView:v4])
    {
      uint64_t v10 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
      char v11 = [v10 hasIconViewEqualToComponentView:v4];

      double v8 = 0.0;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters minimumIconCornerRadius];
  double v8 = v7;
LABEL_6:

  return v8;
}

- (id)appearanceForComponentView:(id)a3
{
  id v3 = [(UIView *)self _lp_appearance];

  return v3;
}

- (int64_t)_themePlatform
{
  return +[LPTheme platformForView:self];
}

- (UIColor)_resolvedBackgroundColor
{
  id v3 = [(LPTheme *)self->_theme backgroundColor];
  if ([(LPLinkView *)self _themePlatform] == 5)
  {
    id v4 = [(LPLinkView *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 != 2)
    {
      uint64_t v6 = +[LPTheme defaultBackgroundColorForPlatform:0];

      id v3 = (void *)v6;
    }
  }
  overrideBackgroundColor = self->_overrideBackgroundColor;
  if (overrideBackgroundColor)
  {
    double v8 = overrideBackgroundColor;
  }
  else
  {
    uint64_t v9 = [(LPLinkView *)self _presentationOverrideBackgroundColor];
    uint64_t v10 = (void *)v9;
    if (v9) {
      char v11 = (void *)v9;
    }
    else {
      char v11 = v3;
    }
    double v8 = v11;
  }
  underlyingBackgroundColor = self->_underlyingBackgroundColor;
  if (underlyingBackgroundColor)
  {
    uint64_t v13 = [(UIColor *)underlyingBackgroundColor _lp_colorBlendedWithColor:v8];
  }
  else
  {
    uint64_t v13 = v8;
  }
  uint64_t v14 = v13;

  return v14;
}

- (UIColor)_dominantBackgroundColor
{
  [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
  properties = self->_properties;

  return [(LPWebLinkPresentationProperties *)properties dominantImageBackgroundColor];
}

- (BOOL)_backgroundColorSupportsVibrancy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LPLinkView *)self traitCollection];
  uint64_t v6 = [v4 resolvedColorWithTraitCollection:v5];

  double v7 = [MEMORY[0x1E4FB1618] clearColor];
  LOBYTE(v5) = [v6 isEqual:v7];

  return (char)v5;
}

- (void)_updateBackgroundColor
{
  id v3 = [(LPLinkView *)self _resolvedBackgroundColor];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v3;

  self->_backgroundColorSupportsVibrancy = [(LPLinkView *)self _backgroundColorSupportsVibrancy:self->_backgroundColor];
}

- (id)_effectiveAppearanceTraits
{
  return self->_effectiveTraitCollection;
}

- (void)_setEffectiveAppearanceTraits:(id)a3
{
  id v7 = a3;
  uint64_t v5 = [(LPLinkView *)self _effectiveAppearanceTraits];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(LPLinkView *)self willChangeValueForKey:@"_effectiveTraitCollection"];
    objc_storeStrong((id *)&self->_effectiveTraitCollection, a3);
    [(LPLinkView *)self didChangeValueForKey:@"_effectiveTraitCollection"];
  }
}

- (void)_updateEffectiveAppearanceTraitsIfNeeded
{
  id v3 = [(LPWebLinkPresentationProperties *)self->_properties dominantImageBackgroundColor];
  id v4 = v3;
  if (v3 && !self->_overrideBackgroundColor)
  {
    uint64_t v11 = [v3 deprecatedLuminosityLevel];
    id v12 = [(LPLinkView *)self traitCollection];
    uint64_t v13 = v12;
    uint64_t v14 = 1;
    if (v11 == 1) {
      uint64_t v14 = 2;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__LPLinkView__updateEffectiveAppearanceTraitsIfNeeded__block_invoke;
    v17[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v17[4] = v14;
    id v15 = [v12 traitCollectionByModifyingTraits:v17];
    [(LPLinkView *)self _setEffectiveAppearanceTraits:v15];

    uint64_t v9 = [(LPLinkView *)self _effectiveAppearanceTraits];
    uint64_t v16 = [v9 userInterfaceStyle];
    uint64_t v10 = [(UIView *)self->_contentView traitOverrides];
    [v10 setUserInterfaceStyle:v16];
    goto LABEL_8;
  }
  uint64_t v5 = [(UIView *)self _lp_appearance];
  [(LPLinkView *)self _setEffectiveAppearanceTraits:v5];

  char v6 = [(UIView *)self->_contentView traitOverrides];
  id v7 = self;
  int v8 = [v6 containsTrait:v7];

  if (v8)
  {
    uint64_t v9 = [(UIView *)self->_contentView traitOverrides];
    uint64_t v10 = self;
    [v9 removeTrait:v10];
LABEL_8:
  }
}

uint64_t __54__LPLinkView__updateEffectiveAppearanceTraitsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (void)themeParametersDidChange
{
  int64_t v3 = [(LPLinkView *)self _themePlatform];
  id v4 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  uint64_t v5 = [v4 button];

  int64_t v6 = [(LPWebLinkPresentationProperties *)self->_properties style];
  uint64_t v16 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  id v7 = [v16 trailingIcon];
  id v17 = v7;
  if (!v7)
  {
    id v15 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
    id v17 = [v15 leadingIcon];
  }
  int64_t v8 = v6;
  unint64_t effectiveSizeClass = self->_effectiveSizeClass;
  sizeClassParameters = self->_sizeClassParameters;
  uint64_t v11 = [(LPLinkView *)self traitCollection];
  id v12 = [v11 preferredContentSizeCategory];
  +[LPTheme themeWithStyle:v8 icon:v17 platform:v3 sizeClass:effectiveSizeClass sizeClassParameters:sizeClassParameters hasButton:v5 != 0 preferredContentSizeCategory:v12];
  uint64_t v13 = (LPTheme *)objc_claimAutoreleasedReturnValue();
  theme = self->_theme;
  self->_theme = v13;

  if (!v7)
  {
  }
  [(LPLinkView *)self _updateBackgroundColor];
  [(LPLinkView *)self _updateBlur];

  [(LPLinkView *)self _rebuildEntireView];
}

- (void)_setOverrideURL:(id)a3
{
  uint64_t v5 = (NSURL *)a3;
  objc_storeStrong((id *)&self->_URL, a3);
  overrideURL = self->_overrideURL;
  self->_overrideURL = v5;

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setUnderlyingBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingBackgroundColor, a3);

  [(LPLinkView *)self themeParametersDidChange];
}

- (void)_setOverrideBackgroundColor:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  if (v5 | (unint64_t)self->_overrideBackgroundColor && (objc_msgSend((id)v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideBackgroundColor, a3);
    [(LPLinkView *)self _updateBackgroundColor];
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setOverrideMediaBackgroundColor:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  int64_t v6 = (void *)v5;
  if (v5 | (unint64_t)self->_overrideMediaBackgroundColor)
  {
    id v10 = (id)v5;
    char v7 = objc_msgSend((id)v5, "isEqual:");
    int64_t v6 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideMediaBackgroundColor, a3);
      int64_t v8 = [(LPLinkView *)self _mediaBackgroundColor];
      uint64_t v9 = [(LPLinkViewComponents *)self->_components mediaBackground];
      [v9 setColor:v8];

      int64_t v6 = v10;
    }
  }
}

- (void)_setOverrideActionButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideActionButtonColor, a3);

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setOverrideSubtitleButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideSubtitleButtonColor, a3);

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setContactsForAttribution:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_contactsForAttribution, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactsForAttribution, a3);
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setHighlightedForAttribution:(BOOL)a3
{
  if (self->_highlightedForAttribution != a3)
  {
    self->_highlightedForAttribution = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setCollaborationFooterViewModel:(id)a3 action:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14)
  {
    char v7 = objc_alloc_init(LPCollaborationFooterPresentationProperties);
    int64_t v8 = [v14 optionsSummary];
    [(LPCollaborationFooterPresentationProperties *)v7 setTitle:v8];

    uint64_t v9 = [v14 metadata];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [(LPCollaborationFooterPresentationProperties *)v9 initiatorHandle];
      [(LPCollaborationFooterPresentationProperties *)v7 setInitiatorName:v11];

      id v12 = [(LPCollaborationFooterPresentationProperties *)v10 initiatorNameComponents];
      [(LPCollaborationFooterPresentationProperties *)v7 setInitiatorNameComponents:v12];
    }
    [(LPCollaborationFooterPresentationProperties *)v7 setAction:v6];
    collaborationFooter = self->_collaborationFooter;
    self->_collaborationFooter = v7;
  }
  else
  {
    id v10 = self->_collaborationFooter;
    self->_collaborationFooter = 0;
  }

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setShowingDisclosureView:(BOOL)a3
{
  if (self->_showingDisclosureView != a3)
  {
    self->_showingDisclosureView = a3;
    id v4 = [(LPLinkViewComponents *)self->_components captionBar];
    int64_t v3 = [v4 collaborationFooterView];
    [v3 updateIndicator];
  }
}

- (void)_setLastResortIcon:(id)a3
{
  id v5 = (LPImage *)a3;
  if (self->_lastResortIcon != v5)
  {
    objc_storeStrong((id *)&self->_lastResortIcon, a3);
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setMediaOverlayIcon:(id)a3
{
  id v5 = (LPImage *)a3;
  if (self->_mediaOverlayIcon != v5)
  {
    objc_storeStrong((id *)&self->_mediaOverlayIcon, a3);
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setInComposeContext:(BOOL)a3
{
  if (self->_inComposeContext != a3)
  {
    self->_inComposeContext = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setInSenderContext:(BOOL)a3
{
  if (self->_inSenderContext != a3)
  {
    self->_inSenderContext = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setCollaborative:(BOOL)a3
{
  if (self->_collaborative != a3)
  {
    self->_collaborative = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (BOOL)_useCPURenderingForMaterials
{
  return self->_useCPURenderingForMaterials
      || +[LPApplicationIdentification isNotesPreviewGenerator];
}

- (void)_setUseCPURenderingForMaterials:(BOOL)a3
{
  if (self->_useCPURenderingForMaterials != a3)
  {
    self->_useCPURenderingForMaterials = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (LPLinkMetadata)metadata
{
  metadata = self->_metadata;
  if (metadata)
  {
    id v4 = (LPPlaceholderLinkMetadata *)[(LPLinkMetadata *)metadata copy];
  }
  else
  {
    id v4 = objc_alloc_init(LPPlaceholderLinkMetadata);
    [(LPLinkMetadata *)v4 setURL:self->_URL];
    [(LPLinkMetadata *)v4 setOriginalURL:self->_URL];
  }

  return (LPLinkMetadata *)v4;
}

- (int64_t)sharedObjectDownloadStateForComponentView:(id)a3
{
  return self->_sharedObjectDownloadState;
}

- (void)_setBytesLoaded:(unint64_t)a3
{
  self->_bytesLoaded = a3;
  if (!self->_metadata) {
    return;
  }
  uint64_t v9 = [[LPLinkMetadataDownloadProgressTransformer alloc] initWithBytesLoaded:a3 downloadState:self->_sharedObjectDownloadState metadata:self->_metadata];
  id v4 = [(LPLinkMetadataDownloadProgressTransformer *)v9 downloadProgressForTransformer:v9];
  id v5 = v4;
  if (v4)
  {
    int v6 = [v4 isFinished];
    int64_t v7 = 1;
    if (v6) {
      int64_t v7 = 2;
    }
    self->_int64_t sharedObjectDownloadState = v7;
    goto LABEL_8;
  }
  int64_t sharedObjectDownloadState = self->_sharedObjectDownloadState;
  self->_int64_t sharedObjectDownloadState = 0;
  if (sharedObjectDownloadState) {
LABEL_8:
  }
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)resetDownloadState
{
  self->_int64_t sharedObjectDownloadState = 0;
  self->_bytesLoaded = 0;
  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setMetadataInternal:(id)a3
{
  id v5 = a3;
  int v6 = (LPLinkMetadata *)[v5 copy];
  metadata = self->_metadata;
  self->_metadata = v6;

  overrideURL = self->_overrideURL;
  if (overrideURL)
  {
    int v9 = 0;
    id v10 = self->_overrideURL;
  }
  else
  {
    uint64_t v11 = [v5 originalURL];
    int64_t v3 = (void *)v11;
    if (v11)
    {
      int v9 = 0;
      id v10 = (void *)v11;
    }
    else
    {
      id v10 = [v5 URL];
      int64_t v3 = 0;
      int v9 = 1;
    }
  }
  objc_storeStrong((id *)&self->_URL, v10);
  if (v9) {

  }
  if (!overrideURL) {
  if (self->_metadata)
  }
  {
    self->_asynchronouslyLoadingMetadataFields = 1;
    uint64_t v12 = ++_setMetadataInternal__currentAsyncLoadRequestID;
    uint64_t v13 = (void *)[v5 copy];
    if ([v5 _isDeferringAsynchronousLoads])
    {
      id v14 = [v13 _createAsynchronousLoadDeferralToken];
      [v5 _addFinishedDeferringAsynchronousLoadHandler:v14];
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __35__LPLinkView__setMetadataInternal___block_invoke;
    id v19 = &unk_1E5B06780;
    uint64_t v23 = v12;
    uint64_t v20 = self;
    id v21 = v5;
    id v15 = v13;
    id v22 = v15;
    [v15 _loadAsynchronousFieldsWithUpdateHandler:&v16];
  }
  [(LPLinkView *)self _updateMetadataIsComplete];
  if (!self->_metadata || self->_asynchronouslyLoadingMetadataFields) {
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

void __35__LPLinkView__setMetadataInternal___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56) == _setMetadataInternal__currentAsyncLoadRequestID)
  {
    if (sizeClassPrefersAsynchronousFieldsMetadataUpdateAfterCompletion(*(void *)(*(void *)(a1 + 32) + 616))
      && ([*(id *)(a1 + 40) specialization],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 _canDeferAsynchronousFieldsMetadataUpdateUntilCompletion],
          v4,
          v5)
      && !a2)
    {
      int v6 = 0;
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 48) copy];
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(void **)(v8 + 424);
      *(void *)(v8 + 424) = v7;

      int v6 = 1;
      if (a2)
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 696) = 0;
        [*(id *)(a1 + 32) _updateMetadataIsComplete];
      }
    }
    if (v6)
    {
      id v10 = *(void **)(a1 + 32);
      [v10 _invalidatePresentationPropertiesAndLayout];
    }
  }
}

- (LPLinkMetadata)_flattenedMetadata
{
  int64_t v3 = [(LPLinkMetadata *)self->_metadata variants];
  unint64_t v4 = [(NSNumber *)self->_selectedVariantIndex unsignedIntegerValue];
  if (v4 >= [v3 count]) {
    [(LPLinkView *)self metadata];
  }
  else {
  int v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[NSNumber unsignedIntegerValue](self->_selectedVariantIndex, "unsignedIntegerValue"));
  }

  return (LPLinkMetadata *)v5;
}

- (void)setMetadata:(LPLinkMetadata *)metadata
{
}

- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4
{
  self->_mayReceiveAdditionalMetadata = !a4;
  selectedVariantIndex = self->_selectedVariantIndex;
  self->_selectedVariantIndex = 0;
  id v6 = a3;

  [(LPLinkView *)self _setMetadataInternal:v6];
}

- (void)_setSelectedVariantIndex:(id)a3
{
  id v5 = a3;
  if ((-[NSNumber isEqual:](self->_selectedVariantIndex, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedVariantIndex, a3);
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setMultipleMetadata:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    unint64_t v4 = [[LPMultipleMetadataPresentationTransformer alloc] initWithMetadata:v6];
    [(LPMultipleMetadataPresentationTransformer *)v4 setPreferredSizeClass:self->_preferredSizeClass];
    self->_mayReceiveAdditionalMetadata = 0;
    id v5 = [(LPMultipleMetadataPresentationTransformer *)v4 summaryMetadata];
    [(LPLinkView *)self _setMetadataInternal:v5];
  }
  else
  {
    unint64_t v4 = [v6 firstObject];
    [(LPLinkView *)self _setMetadataInternal:v4];
  }
}

- (void)_setPreferredSizeClass:(unint64_t)a3
{
  if (self->_preferredSizeClass != a3)
  {
    self->_preferredSizeClass = a3;
    self->_unint64_t effectiveSizeClass = a3;
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
    [(LPLinkView *)self themeParametersDidChange];
  }
}

- (void)_setSizeClassParameters:(id)a3
{
  id v6 = a3;
  if (!-[LPLinkRendererSizeClassParameters isEqual:](self->_sizeClassParameters, "isEqual:"))
  {
    unint64_t v4 = (LPLinkRendererSizeClassParameters *)[v6 copy];
    sizeClassParameters = self->_sizeClassParameters;
    self->_sizeClassParameters = v4;

    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
    [(LPLinkView *)self themeParametersDidChange];
  }
}

- (void)_setSourceBundleIdentifier:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_sourceBundleIdentifier != v5)
  {
    objc_storeStrong((id *)&self->_sourceBundleIdentifier, a3);
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_addCaptionButton:(id)a3
{
  id v5 = a3;
  if ([v5 type] == 1)
  {
    objc_storeStrong((id *)&self->_captionButton, a3);
    [(LPConcretePresentationProperties *)self->_properties setCaptionButton:v5];
  }
  else
  {
    objc_storeStrong((id *)&self->_captionTextButton, a3);
    [(LPConcretePresentationProperties *)self->_properties setCaptionTextButton:v5];
  }
}

- (void)_removeCaptionButtonWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    captionButton = self->_captionButton;
    self->_captionButton = 0;

    [(LPConcretePresentationProperties *)self->_properties setCaptionButton:0];
    id v5 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
    [v5 setButton:0];
  }
  else
  {
    captionTextButton = self->_captionTextButton;
    self->_captionTextButton = 0;

    [(LPConcretePresentationProperties *)self->_properties setCaptionTextButton:0];
  }

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setAction:(id)a3 withText:(id)a4 buttonType:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (v10 && v8)
  {
    int v9 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    [(LPCaptionButtonPresentationProperties *)v9 setText:v8];
    [(LPCaptionButtonPresentationProperties *)v9 setCallback:v10];
    [(LPCaptionButtonPresentationProperties *)v9 setType:a5];
    [(LPLinkView *)self _addCaptionButton:v9];
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
  else
  {
    [(LPLinkView *)self _removeCaptionButtonWithType:a5];
  }
}

- (void)_setAction:(id)a3 withText:(id)a4
{
}

- (void)_setAction:(id)a3 withAttributedText:(id)a4 buttonType:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  if (v10 && v8)
  {
    int v9 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    [(LPCaptionButtonPresentationProperties *)v9 setAttributedText:v8];
    [(LPCaptionButtonPresentationProperties *)v9 setCallback:v10];
    [(LPCaptionButtonPresentationProperties *)v9 setType:a5];
    [(LPLinkView *)self _addCaptionButton:v9];
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
  else
  {
    [(LPLinkView *)self _removeCaptionButtonWithType:a5];
  }
}

- (void)_setButtonActions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = objc_alloc_init(LPCaptionButtonPresentationProperties);
    [(LPCaptionButtonPresentationProperties *)v6 setActions:v5];
    [(LPCaptionButtonPresentationProperties *)v6 setType:1];
    [(LPCaptionButtonPresentationProperties *)v6 setCallback:&__block_literal_global_162];
    if ((unint64_t)[v5 count] < 2)
    {
      id v15 = [(LPCaptionButtonPresentationProperties *)v6 actions];
      uint64_t v16 = [v15 firstObject];
      uint64_t v17 = [v16 handler];
      [(LPCaptionButtonPresentationProperties *)v6 setCallback:v17];

LABEL_27:
      [(LPLinkView *)self _addCaptionButton:v6];
      [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];

      goto LABEL_28;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(LPCaptionButtonPresentationProperties *)v6 actions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      char v9 = 0;
      id v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          if ((v9 & 1) != 0 || [*(id *)(*((void *)&v18 + 1) + 8 * v12) isHeader])
          {
            [v13 setSelected:0];
          }
          else if ([v13 isSelected])
          {
            char v9 = 1;
          }
          else
          {
            if (!v10) {
              id v10 = v13;
            }
            char v9 = 0;
          }
          ++v12;
        }
        while (v8 != v12);
        uint64_t v14 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v8 = v14;
      }
      while (v14);

      if (v9) {
        goto LABEL_26;
      }
    }
    else
    {

      id v10 = 0;
    }
    [v10 setSelected:1];
LABEL_26:

    goto LABEL_27;
  }
  [(LPLinkView *)self _removeCaptionButtonWithType:1];
LABEL_28:
}

- (void)_setOverrideSubtitle:(id)a3
{
  id v6 = a3;
  id v4 = (NSAttributedString *)[v6 copy];
  overrideSubtitle = self->_overrideSubtitle;
  self->_overrideSubtitle = v4;

  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (CGRect)_rectForCaptionButtonType:(int64_t)a3
{
  id v5 = [(LPConcretePresentationProperties *)self->_properties captionButton];
  uint64_t v6 = [v5 type];

  if (v6 == a3)
  {
    uint64_t v7 = [(LPLinkViewComponents *)self->_components captionBar];
    uint64_t v8 = [v7 button];
  }
  else
  {
    char v9 = [(LPConcretePresentationProperties *)self->_properties captionTextButton];
    uint64_t v10 = [v9 type];

    if (v10 != a3)
    {
      uint64_t v11 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(LPLinkViewComponents *)self->_components captionBar];
    uint64_t v8 = [v7 subtitleButton];
  }
  uint64_t v11 = (void *)v8;

LABEL_7:
  [v11 bounds];
  objc_msgSend(v11, "convertRect:toView:", self);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_invalidatePresentationProperties
{
  self->_presentationPropertyState = -1;
}

- (void)_invalidatePresentationPropertiesAndLayout
{
  [(LPLinkView *)self _invalidatePresentationProperties];

  [(LPLinkView *)self _invalidateLayout];
}

- (void)_updateMetadataIsComplete
{
  if (self->_mayReceiveAdditionalMetadata || self->_asynchronouslyLoadingMetadataFields)
  {
    self->_BOOL metadataIsComplete = 0;
  }
  else
  {
    BOOL metadataIsComplete = self->_metadataIsComplete;
    BOOL v4 = [(LPLinkMetadata *)self->_metadata _isDeferringAsynchronousLoads];
    self->_BOOL metadataIsComplete = !v4;
    if (!metadataIsComplete && !v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained _linkViewMetadataDidBecomeComplete:self];
      }
    }
  }
}

- (void)_computePresentationPropertiesFromMetadataIfNeeded
{
  if (self->_usesComputedPresentationProperties && self->_presentationPropertyState)
  {
    uint64_t v10 = objc_alloc_init(LPLinkMetadataPresentationTransformer);
    metadata = self->_metadata;
    if (metadata)
    {
      BOOL v4 = [(LPLinkView *)self _flattenedMetadata];
    }
    else
    {
      BOOL v4 = 0;
    }
    [(LPLinkMetadataPresentationTransformer *)v10 setMetadata:v4];
    if (metadata) {

    }
    [(LPLinkMetadataPresentationTransformer *)v10 setURL:self->_URL];
    [(LPLinkMetadataPresentationTransformer *)v10 setComplete:self->_metadataIsComplete];
    [(LPLinkMetadataPresentationTransformer *)v10 setAllowsTapToLoad:self->_allowsTapToLoad];
    [(LPLinkMetadataPresentationTransformer *)v10 setPreferredSizeClass:self->_preferredSizeClass];
    [(LPLinkMetadataPresentationTransformer *)v10 setSizeClassParameters:self->_sizeClassParameters];
    [(LPLinkMetadataPresentationTransformer *)v10 setSourceBundleIdentifier:self->_sourceBundleIdentifier];
    [(UIView *)self _lp_backingScaleFactor];
    -[LPLinkMetadataPresentationTransformer setScaleFactor:](v10, "setScaleFactor:");
    [(LPLinkMetadataPresentationTransformer *)v10 setAllowsTapping:!self->_disableTapGesture];
    BOOL v5 = !self->_disablePlayback && !self->_disablePlaybackControls;
    [(LPLinkMetadataPresentationTransformer *)v10 setAllowsPlayback:v5];
    [(LPLinkMetadataPresentationTransformer *)v10 setAllowsPlaybackControls:!self->_disablePlaybackControls];
    [(LPLinkMetadataPresentationTransformer *)v10 setSourceContextIcon:self->_lastResortIcon];
    [(LPLinkMetadataPresentationTransformer *)v10 setHasOverriddenBackgroundColor:self->_overrideBackgroundColor != 0];
    [(LPLinkMetadataPresentationTransformer *)v10 setCollaborative:self->_collaborative];
    [(LPLinkMetadataPresentationTransformer *)v10 setInComposeContext:self->_inComposeContext];
    [(LPLinkMetadataPresentationTransformer *)v10 setBytesLoaded:self->_bytesLoaded];
    [(LPLinkMetadataPresentationTransformer *)v10 setSharedObjectDownloadState:self->_sharedObjectDownloadState];
    [(LPLinkMetadataPresentationTransformer *)v10 setMediaOverlayIcon:self->_mediaOverlayIcon];
    uint64_t v6 = [(UIView *)self _lp_appearance];
    [(LPLinkMetadataPresentationTransformer *)v10 setEffectiveAppearance:v6];

    uint64_t v7 = [(LPLinkView *)self traitCollection];
    uint64_t v8 = [v7 preferredContentSizeCategory];
    [(LPLinkMetadataPresentationTransformer *)v10 setPreferredContentSizeCategory:v8];

    self->_unint64_t effectiveSizeClass = [(LPLinkMetadataPresentationTransformer *)v10 effectiveSizeClass];
    char v9 = [(LPLinkMetadataPresentationTransformer *)v10 presentationProperties];
    [(LPLinkView *)self _setPresentationProperties:v9];
  }
}

- (BOOL)_useProgressSpinner
{
  BOOL v4 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  BOOL v5 = [v4 leadingIcon];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  id v2 = [v6 leadingIcon];
  if ([v2 _isFallbackIcon])
  {
    double v14 = v6;
LABEL_4:
    uint64_t v7 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
    uint64_t v8 = [v7 trailingIcon];
    if (v8)
    {
      char v9 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
      uint64_t v10 = [v9 trailingIcon];
      char v11 = [v10 _isFallbackIcon] ^ 1;
    }
    else
    {
      char v11 = 0;
    }

    uint64_t v6 = v14;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  char v11 = 1;
LABEL_9:

LABEL_10:
  if (![(LPWebLinkPresentationProperties *)self->_properties isPreliminary] || (v11 & 1) != 0) {
    return 0;
  }
  unint64_t effectiveSizeClass = self->_effectiveSizeClass;

  return sizeClassAllowsProgressSpinner(effectiveSizeClass);
}

- (NSArray)_metadataVariants
{
  return (NSArray *)[(LPLinkMetadata *)self->_metadata variants];
}

- (void)_setPresentationProperties:(id)a3
{
  id v10 = a3;
  unint64_t presentationPropertyState = self->_presentationPropertyState;
  self->_unint64_t presentationPropertyState = 0;
  BOOL v5 = [[LPConcretePresentationPropertiesParameters alloc] initWithUsesComputedPresentationProperties:self->_usesComputedPresentationProperties inComposeContext:self->_inComposeContext inSenderContext:self->_inSenderContext effectiveSizeClass:self->_effectiveSizeClass overrideSubtitleButtonColor:self->_overrideSubtitleButtonColor overrideActionButtonColor:self->_overrideActionButtonColor overrideSubtitle:self->_overrideSubtitle captionButton:self->_captionButton captionTextButton:self->_captionTextButton];
  uint64_t v6 = [[LPConcretePresentationProperties alloc] initWithParameters:v5 properties:v10];
  objc_storeStrong((id *)&self->_properties, v6);
  uint64_t v7 = [(LPWebLinkPresentationProperties *)self->_properties overrideURL];

  if (v7)
  {
    uint64_t v8 = [(LPWebLinkPresentationProperties *)self->_properties overrideURL];
    URL = self->_URL;
    self->_URL = v8;
  }
  if (presentationPropertyState == 1) {
    ++self->_suppressNeedsResizeCount;
  }
  if (!self->_theme || self->_sharedObjectDownloadState != 1) {
    [(LPLinkView *)self themeParametersDidChange];
  }
  if (presentationPropertyState != 1) {
    self->_shouldAnimateDuringNextBuild = self->_hasEverBuilt;
  }
  [(LPLinkView *)self _updateEffectiveAppearanceTraitsIfNeeded];
  [(LPLinkView *)self _rebuildEntireView];
  if (presentationPropertyState == 1) {
    --self->_suppressNeedsResizeCount;
  }
}

- (id)_presentationOverrideBackgroundColor
{
  properties = self->_properties;
  int64_t v3 = [(LPTheme *)self->_theme mediaImage];
  [v3 darkeningAmount];
  BOOL v4 = presentationOverrideBackgroundColorForProperties(properties);

  return v4;
}

- (int64_t)_style
{
  [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
  properties = self->_properties;

  return [(LPWebLinkPresentationProperties *)properties style];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  [(LPLinkView *)&v4 layoutSubviews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__LPLinkView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E5B04DF0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __28__LPLinkView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutLinkView];
}

- (void)didMoveToWindow
{
  self->_componentsNeedLayout = 1;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(LPLinkView *)self _invalidateLayout];
  }
}

- (void)_setTextSafeAreaInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_textSafeAreaInset.left
    || a3.top != self->_textSafeAreaInset.top
    || a3.right != self->_textSafeAreaInset.right
    || a3.bottom != self->_textSafeAreaInset.bottom)
  {
    self->_textSafeAreaInset = a3;
    [(LPLinkView *)self _invalidateLayout];
  }
}

- (BOOL)_strictlyRespectsSizeClassHeightConstraints
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout])
  {
    ++self->_suppressNeedsResizeCount;
    [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
    v12.receiver = self;
    v12.super_class = (Class)LPLinkView;
    [(LPLinkView *)&v12 intrinsicContentSize];
    double v4 = v3;
    double v6 = v5;
    --self->_suppressNeedsResizeCount;
  }
  else
  {
    uint64_t v7 = [(LPTheme *)self->_theme maximumWidth];
    [v7 value];
    -[LPLinkView sizeThatFits:](self, "sizeThatFits:");
    double v4 = v8;
    double v6 = v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  ++self->_suppressNeedsResizeCount;
  [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
  double v6 = [(LPTheme *)self->_theme maximumWidth];
  [v6 value];
  double v8 = fmin(width, v7);

  double v9 = floor(v8);
  -[LPLinkView _layoutLinkViewForSize:applyingLayout:](self, "_layoutLinkViewForSize:applyingLayout:", 0, v9 - (self->_contentInset.left + self->_contentInset.right), floor(height) - (self->_contentInset.top + self->_contentInset.bottom));
  double v11 = v10;
  double v13 = v12;
  if (v10 > v9)
  {
    double v14 = LPLogChannelUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int loggingID = self->_loggingID;
      v22[0] = 67109632;
      v22[1] = loggingID;
      __int16 v23 = 2048;
      double v24 = v11;
      __int16 v25 = 2048;
      double v26 = v9;
      _os_log_impl(&dword_1A35DC000, v14, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: laid out to larger than maximum requested size (%g > %g)", (uint8_t *)v22, 0x1Cu);
    }
  }
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  --self->_suppressNeedsResizeCount;
  double v20 = v11 - (-right - left);
  double v21 = v13 - (-bottom - top);
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (void)animateOutAndRemoveViews
{
  id v3 = [(LPLinkViewComponents *)self->_components captionBar];
  [v3 animateOut];

  id v4 = [(LPLinkViewComponents *)self->_components media];
  [v4 removeFromSuperview];

  id v5 = [(LPLinkViewComponents *)self->_components quote];
  [v5 removeFromSuperview];

  id v6 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
  [v6 removeFromSuperview];

  id v7 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
  [v7 removeFromSuperview];

  id v8 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
  [v8 removeFromSuperview];

  id v9 = [(LPLinkViewComponents *)self->_components backgroundImage];
  [v9 removeFromSuperview];

  id v10 = [(LPLinkViewComponents *)self->_components contactsBadge];
  [v10 removeFromSuperview];

  id v11 = [(LPLinkViewComponents *)self->_components progressSpinner];
  [v11 removeFromSuperview];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v12 = a3;
  id v5 = [v12 valueForKey:@"associatedView"];
  [v12 setValue:0 forKey:@"associatedView"];
  id v6 = [v5 layer];
  id v7 = [v6 animationForKey:@"widthSpring"];
  if (v7 == v12)
  {
  }
  else
  {
    id v8 = [v5 layer];
    id v9 = [v8 animationForKey:@"heightSpring"];

    if (v9 != v12) {
      goto LABEL_6;
    }
  }
  id v10 = [(UIView *)self->_animationView layer];
  [v10 removeAnimationForKey:@"widthSpring"];

  id v11 = [(UIView *)self->_animationView layer];
  [v11 removeAnimationForKey:@"heightSpring"];

  [(LPLinkView *)self _setMaskEnabledForAnimation:0];
LABEL_6:
}

- (void)animateInViews
{
  id v35 = [(LPLinkView *)self layer];
  [v35 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 2.0, 100.0, 50.0);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  [v36 setKeyPath:@"opacity"];
  [v36 setFromValue:&unk_1EF7127E0];
  [v36 setToValue:&unk_1EF7127F8];
  id v5 = [(LPLinkViewComponents *)self->_components captionBar];
  [v5 animateInWithBaseAnimation:v36 currentTime:v4];

  id v6 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
  [v6 animateInWithBaseAnimation:v36 currentTime:v4];

  id v7 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
  [v7 animateInWithBaseAnimation:v36 currentTime:v4];

  id v8 = [(LPLinkViewComponents *)self->_components media];
  id v9 = [v8 layer];
  double v10 = v4 + 0.05;
  id v11 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v4 + 0.05);
  [v9 addAnimation:v11 forKey:@"fadeIn"];

  id v12 = [(LPLinkViewComponents *)self->_components quote];
  double v13 = [v12 layer];
  double v14 = v4 + 0.285;
  double v15 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  [v13 addAnimation:v15 forKey:@"fadeIn"];

  double v16 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
  double v17 = [v16 layer];
  double v18 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  [v17 addAnimation:v18 forKey:@"fadeIn"];

  double v19 = [(LPLinkViewComponents *)self->_components backgroundImage];
  double v20 = [v19 layer];
  double v21 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  [v20 addAnimation:v21 forKey:@"fadeIn"];

  double v22 = [(LPLinkViewComponents *)self->_components mediaBackground];
  __int16 v23 = [v22 layer];
  [v23 opacity];
  float v25 = v24;

  if (v25 == 0.0)
  {
    double v26 = [(LPLinkViewComponents *)self->_components mediaBackground];
    uint64_t v27 = [v26 layer];
    LODWORD(v28) = 1.0;
    [v27 setOpacity:v28];

    objc_super v29 = [(LPLinkViewComponents *)self->_components mediaBackground];
    v30 = [v29 layer];
    uint64_t v31 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v10);
    [v30 addAnimation:v31 forKey:@"fadeIn"];
  }
  v32 = [(LPLinkViewComponents *)self->_components contactsBadge];
  v33 = [v32 layer];
  v34 = objc_msgSend(v36, "_lp_copyWithBeginTime:", v14);
  [v33 addAnimation:v34 forKey:@"fadeIn"];
}

- (void)_setMaskImage:(id)a3
{
  id v4 = a3;
  animationMaskView = self->_animationMaskView;
  id v8 = v4;
  if (!animationMaskView)
  {
    id v6 = objc_alloc_init(_TtC16LinkPresentation19LPAnimationMaskView);
    id v7 = self->_animationMaskView;
    self->_animationMaskView = v6;

    animationMaskView = self->_animationMaskView;
    id v4 = v8;
  }
  [(LPAnimationMaskView *)animationMaskView setImage:v4];
  [(LPAnimationMaskView *)self->_animationMaskView setAnimationOrigin:self->_animationOrigin];
}

- (void)_setAnimationOrigin:(int64_t)a3
{
  self->_animationOrigin = a3;
  -[LPAnimationMaskView setAnimationOrigin:](self->_animationMaskView, "setAnimationOrigin:");
}

- (void)animateFromOldFrame:(CGRect)a3 oldMediaBackgroundFrame:(CGRect)a4 oldCaptionBarView:(id)a5
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  id v130 = a5;
  [(LPLinkView *)self frame];
  BOOL v13 = v10 == v12;
  if (v9 != v14) {
    BOOL v13 = 0;
  }
  BOOL v129 = v13;
  double v15 = objc_msgSend(MEMORY[0x1E4F39C90], "_lp_springWithMass:stiffness:damping:", 2.0, 300.0, 37.0);
  [(LPLinkView *)self frame];
  if (v16 != v10)
  {
    double v17 = (void *)[v15 copy];
    [v17 setKeyPath:@"bounds.size.width"];
    double v18 = [NSNumber numberWithDouble:v10];
    [v17 setFromValue:v18];

    double v19 = NSNumber;
    [(LPLinkView *)self frame];
    double v21 = [v19 numberWithDouble:v20];
    [v17 setToValue:v21];

    double v22 = [(LPAnimationMaskView *)self->_animationMaskView imageView];
    __int16 v23 = [v22 layer];
    [v23 addAnimation:v17 forKey:@"maskWidthSpring"];

    float v24 = (void *)[v15 copy];
    [v24 setDelegate:self];
    [v24 setRemovedOnCompletion:0];
    [v24 setValue:self->_animationView forKey:@"associatedView"];
    [v24 setKeyPath:@"bounds.size.width"];
    float v25 = [NSNumber numberWithDouble:v10];
    [v24 setFromValue:v25];

    double v26 = NSNumber;
    [(LPLinkView *)self frame];
    double v28 = [v26 numberWithDouble:v27];
    [v24 setToValue:v28];

    objc_super v29 = [(UIView *)self->_animationView layer];
    [v29 addAnimation:v24 forKey:@"widthSpring"];

    if ([(LPLinkView *)self _animationOrigin] == 1
      && self->_needsMessagesTranscriptPushCounterAnimation)
    {
      v30 = (void *)[v17 copy];
      uint64_t v31 = [(LPAnimationMaskView *)self->_animationMaskView imageView];
      v32 = [v31 layer];
      [v32 addAnimation:v30 forKey:@"imageViewAnimation"];

      v33 = [MEMORY[0x1E4F39B48] animation];
      [v33 setDuration:0.3];
      v34 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v33 setTimingFunction:v34];

      [v33 setKeyPath:@"transform.translation.x"];
      id v35 = NSNumber;
      [(LPLinkView *)self frame];
      v37 = [v35 numberWithDouble:v10 - v36];
      [v33 setFromValue:v37];

      [v33 setToValue:&unk_1EF7127E0];
      v38 = [(UIView *)self->_animationView layer];
      [v38 addAnimation:v33 forKey:@"horizontalSlide"];

      v39 = [(LPAnimationMaskView *)self->_animationMaskView layer];
      [v39 addAnimation:v33 forKey:@"horizontalSlide"];
    }
    if (![(LPLinkView *)self _animationOrigin])
    {
      v40 = (void *)[v15 copy];
      [v40 setKeyPath:@"transform.translation.x"];
      v41 = NSNumber;
      [(LPLinkView *)self frame];
      v43 = [v41 numberWithDouble:v42 - v10];
      [v40 setFromValue:v43];

      [v40 setToValue:&unk_1EF7127E0];
      v44 = [(LPAnimationMaskView *)self->_animationMaskView imageView];
      v45 = [v44 layer];
      [v45 addAnimation:v40 forKey:@"maskViewSpring"];
    }
  }
  v46 = [(LPLinkViewComponents *)self->_components mediaBackground];
  if (v46
    && (v132.origin.CGFloat x = x,
        v132.origin.CGFloat y = y,
        v132.size.CGFloat width = width,
        v132.size.double height = height,
        BOOL IsNull = CGRectIsNull(v132),
        v46,
        !IsNull))
  {
    [(LPLinkView *)self frame];
    double v55 = v54;
    v52 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [v52 frame];
    double v49 = v55 - v56 - (v9 - height);
  }
  else
  {
    v48 = [(LPLinkViewComponents *)self->_components mediaBackground];

    double v49 = v9;
    if (!v48) {
      goto LABEL_16;
    }
    [(LPLinkView *)self frame];
    double v51 = v50;
    v52 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [v52 frame];
    double v49 = v51 - v53;
  }

LABEL_16:
  [(LPLinkView *)self frame];
  if (v57 != v9)
  {
    v58 = (void *)[v15 copy];
    [v58 setKeyPath:@"bounds.size.height"];
    v59 = [NSNumber numberWithDouble:v9];
    [v58 setFromValue:v59];

    v60 = NSNumber;
    [(LPLinkView *)self frame];
    v62 = [v60 numberWithDouble:v61];
    [v58 setToValue:v62];

    v63 = [(LPAnimationMaskView *)self->_animationMaskView imageView];
    v64 = [v63 layer];
    [v64 addAnimation:v58 forKey:@"maskHeightSpring"];

    v65 = (void *)[v15 copy];
    [v65 setDelegate:self];
    [v65 setRemovedOnCompletion:0];
    [v65 setValue:self->_animationView forKey:@"associatedView"];
    [v65 setKeyPath:@"bounds.size.height"];
    v66 = [NSNumber numberWithDouble:v9];
    [v65 setFromValue:v66];

    v67 = NSNumber;
    [(LPLinkView *)self frame];
    v69 = [v67 numberWithDouble:v68];
    [v65 setToValue:v69];

    v70 = [(UIView *)self->_animationView layer];
    [v70 addAnimation:v65 forKey:@"heightSpring"];

    v71 = (void *)[v15 copy];
    [v71 setKeyPath:@"transform.translation"];
    if ([(LPLinkView *)self _animationOrigin] == 1
      && self->_needsMessagesTranscriptPushCounterAnimation)
    {
      id v72 = objc_alloc_init(MEMORY[0x1E4F39B48]);
      [v72 setDuration:0.3];
      v73 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [v72 setTimingFunction:v73];

      [v72 setKeyPath:@"transform.translation.y"];
      v74 = NSNumber;
      [(LPLinkView *)self frame];
      v76 = [v74 numberWithDouble:v9 - v75];
      [v72 setFromValue:v76];

      [v72 setToValue:&unk_1EF7127E0];
      v77 = [(UIView *)self->_animationView layer];
      [v77 addAnimation:v72 forKey:@"verticalSlide"];

      v78 = [(LPAnimationMaskView *)self->_animationMaskView layer];
      [v78 addAnimation:v72 forKey:@"verticalSlide"];
    }
    int64_t animationOrigin = self->_animationOrigin;
    if (animationOrigin == 2)
    {
      [(LPLinkView *)self frame];
      double v80 = (v10 - v82) * 0.5;
    }
    else
    {
      double v80 = 0.0;
      if (animationOrigin == 1)
      {
        [(LPLinkView *)self frame];
        double v80 = v10 - v81;
      }
    }
    v83 = (void *)MEMORY[0x1E4F29238];
    [(LPLinkView *)self frame];
    v85 = objc_msgSend(v83, "_lp_valueWithCGSize:", v80, v9 - v84);
    [v71 setFromValue:v85];

    double v86 = *MEMORY[0x1E4F1DB30];
    double v87 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v88 = objc_msgSend(MEMORY[0x1E4F29238], "_lp_valueWithCGSize:", *MEMORY[0x1E4F1DB30], v87);
    [v71 setToValue:v88];

    v89 = [(LPLinkViewComponents *)self->_components captionBar];
    v90 = [v89 layer];
    [v90 addAnimation:v71 forKey:@"transformSpring"];

    v91 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
    v92 = [v91 layer];
    [v92 addAnimation:v71 forKey:@"transformSpring"];

    v93 = (void *)[v71 copy];
    int64_t v94 = self->_animationOrigin;
    if (v94 == 2)
    {
      [(LPLinkView *)self frame];
      double v95 = (v97 - v10) * 0.5;
    }
    else
    {
      double v95 = 0.0;
      if (v94 == 1)
      {
        [(LPLinkView *)self frame];
        double v95 = v96 - v10;
      }
    }
    v98 = (void *)MEMORY[0x1E4F29238];
    [(LPLinkView *)self frame];
    v100 = objc_msgSend(v98, "_lp_valueWithCGSize:", v95, v99 - v9);
    [v93 setToValue:v100];

    v101 = objc_msgSend(MEMORY[0x1E4F29238], "_lp_valueWithCGSize:", v86, v87);
    [v93 setFromValue:v101];

    v102 = [v130 layer];
    [v102 addAnimation:v93 forKey:@"previousCaptionBarPositionMaintaining"];

    v103 = (void *)[v71 copy];
    v104 = (void *)MEMORY[0x1E4F29238];
    [(LPLinkView *)self frame];
    v106 = objc_msgSend(v104, "_lp_valueWithCGSize:", v80, v49 + v9 - v105);
    [v103 setFromValue:v106];

    v107 = [(LPLinkViewComponents *)self->_components mediaBackground];
    v108 = [v107 layer];
    [v108 addAnimation:v103 forKey:@"captionBarAdjustedTransformSpring"];
  }
  if (![(LPLinkView *)self _animationOrigin])
  {
    v109 = (void *)[v15 copy];
    [v109 setKeyPath:@"transform.translation.y"];
    v110 = NSNumber;
    [(LPLinkView *)self frame];
    v112 = [v110 numberWithDouble:v9 - v111];
    [v109 setFromValue:v112];

    [v109 setToValue:&unk_1EF7127E0];
    v113 = [(LPAnimationMaskView *)self->_animationMaskView imageView];
    v114 = [v113 layer];
    [v114 addAnimation:v109 forKey:@"maskViewYSpring"];

    v115 = [(UIView *)self->_animationView layer];
    [v115 addAnimation:v109 forKey:@"maskViewYSpring"];
  }
  v116 = (void *)[v15 copy];
  [v116 setKeyPath:@"transform.scale.x"];
  v117 = NSNumber;
  v118 = [(LPLinkViewComponents *)self->_components mediaBackground];
  [v118 frame];
  v120 = [v117 numberWithDouble:v10 / v119];
  [v116 setFromValue:v120];

  [v116 setToValue:&unk_1EF7127F8];
  v121 = [(LPLinkViewComponents *)self->_components mediaBackground];
  v122 = [v121 layer];
  [v122 addAnimation:v116 forKey:@"mediaScaleSpring"];

  v123 = (void *)[v15 copy];
  [v123 setKeyPath:@"transform.scale.y"];
  v124 = NSNumber;
  [(LPLinkView *)self frame];
  v126 = [v124 numberWithDouble:v9 / v125];
  [v123 setFromValue:v126];

  [v123 setToValue:&unk_1EF7127F8];
  v127 = [(LPLinkViewComponents *)self->_components mediaBackground];
  v128 = [v127 layer];
  [v128 addAnimation:v123 forKey:@"mediaScaleYSpring"];

  if (!v129) {
    [(LPLinkView *)self _setMaskEnabledForAnimation:1];
  }
}

- (void)_setSuppressChatKitMask:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(LPLinkView *)self superview];
  NSClassFromString(&cfstr_Ckballoonview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(LPLinkView *)self superview];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v9 = [(LPLinkView *)self superview];
      [v9 setSuppressMask:v3];
    }
  }
}

- (void)_updateMasking
{
  BOOL v3 = [(LPLinkView *)self maskView];

  if (self->_maskEnabled)
  {
    if (v3) {
      return;
    }
    [(LPLinkView *)self _setSuppressChatKitMask:1];
  }
  else
  {
    BOOL v4 = v3 == 0;
    BOOL maskEnabledForAnimation = self->_maskEnabledForAnimation;
    if ((v4 ^ self->_maskEnabledForAnimation)) {
      return;
    }
    [(LPLinkView *)self _setSuppressChatKitMask:maskEnabledForAnimation];
    if (!maskEnabledForAnimation)
    {
      animationMaskView = 0;
      goto LABEL_8;
    }
  }
  animationMaskView = self->_animationMaskView;
LABEL_8:

  [(LPLinkView *)self setMaskView:animationMaskView];
}

- (void)_setMaskEnabled:(BOOL)a3
{
  self->_maskEnabled = a3;
  [(LPLinkView *)self _updateMasking];
}

- (void)_setMaskEnabledForAnimation:(BOOL)a3
{
  self->_BOOL maskEnabledForAnimation = a3;
  [(LPLinkView *)self _updateMasking];
}

- (void)animateBackgroundColor
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F39B48]);
  [v4 setDuration:0.65];
  [v4 setKeyPath:@"backgroundColor"];
  objc_msgSend(v4, "setToValue:", -[UIColor CGColor](self->_backgroundColor, "CGColor"));
  BOOL v3 = [(UIView *)self->_animationView layer];
  [v3 addAnimation:v4 forKey:@"backgroundColorTransition"];
}

- (BOOL)_layoutHeightDependsOnWidth
{
  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  return [(LPLinkView *)&v4 _layoutHeightDependsOnWidth];
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  if (+[LPApplicationCompatibilityQuirks supportsLPLinkViewAutolayout])
  {
    return 3;
  }
  v4.receiver = self;
  v4.super_class = (Class)LPLinkView;
  return [(LPLinkView *)&v4 _axesForDerivingIntrinsicContentSizeFromLayoutSize];
}

- (id)_createComponents
{
  BOOL v3 = objc_alloc_init(LPLinkViewComponents);
  if ([(LPLinkView *)self _useProgressSpinner]
    && (sizeClassAllowsLargeProgressSpinner(self->_preferredSizeClass) & 1) != 0)
  {
    objc_super v4 = [(LPLinkView *)self _createProgressSpinner];
    [(LPLinkViewComponents *)v3 setProgressSpinner:v4];
LABEL_32:

    goto LABEL_33;
  }
  id v5 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  int v6 = [v5 hasAnyContent];

  BOOL v7 = [(LPConcretePresentationProperties *)self->_properties hasMedia];
  id v8 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];

  if (v8) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  if (v9 == 1)
  {
    double v10 = [(LPWebLinkPresentationProperties *)self->_properties mediaTopCaptionBar];
    int v11 = [v10 hasAnyContent];

    double v12 = [(LPWebLinkPresentationProperties *)self->_properties mediaBottomCaptionBar];
    int v13 = [v12 hasAnyContent];
  }
  else
  {
    int v11 = 0;
    int v13 = 0;
  }
  double v14 = [(LPWebLinkPresentationProperties *)self->_properties domainNameForIndicator];

  double v15 = [(LPWebLinkPresentationProperties *)self->_properties backgroundImage];

  NSUInteger v16 = [(NSArray *)self->_contactsForAttribution count];
  if (v6)
  {
    double v17 = [(LPLinkView *)self _createCaptionBar];
    [(LPLinkViewComponents *)v3 setCaptionBar:v17];

    if (!v7) {
      goto LABEL_12;
    }
  }
  else if (!v7)
  {
LABEL_12:
    int v18 = 0;
    if (v11) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  double v21 = [(LPLinkView *)self _createMediaView];
  [(LPLinkViewComponents *)v3 setMedia:v21];

  int v18 = 1;
  if (v11)
  {
LABEL_13:
    double v19 = [(LPLinkView *)self _createMediaTopCaptionBarView];
    [(LPLinkViewComponents *)v3 setMediaTopCaptionBar:v19];

    if ((v13 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_19:
    double v22 = [(LPLinkView *)self _createMediaBottomCaptionBarView];
    [(LPLinkViewComponents *)v3 setMediaBottomCaptionBar:v22];

    if (v8) {
      goto LABEL_15;
    }
LABEL_20:
    if (!v18) {
      goto LABEL_26;
    }
    goto LABEL_21;
  }
LABEL_18:
  if (v13) {
    goto LABEL_19;
  }
LABEL_14:
  if (!v8) {
    goto LABEL_20;
  }
LABEL_15:
  double v20 = [(LPLinkView *)self _createQuotedTextView];
  [(LPLinkViewComponents *)v3 setQuote:v20];

LABEL_21:
  __int16 v23 = [(LPLinkViewComponents *)self->_components mediaBackground];
  float v24 = v23;
  if (!v23) {
    float v24 = objc_alloc_init(LPBackgroundColorView);
  }
  [(LPLinkViewComponents *)v3 setMediaBackground:v24];
  if (!v23) {

  }
LABEL_26:
  if (v14)
  {
    float v25 = [(LPLinkView *)self _createDomainNameIndicator];
    [(LPLinkViewComponents *)v3 setDomainNameIndicator:v25];
  }
  if (v15)
  {
    double v26 = [(LPLinkView *)self _createBackgroundImageView];
    [(LPLinkViewComponents *)v3 setBackgroundImage:v26];
  }
  if (v16)
  {
    objc_super v4 = [(LPLinkView *)self _createContactsBadgeView];
    [(LPLinkViewComponents *)v3 setContactsBadge:v4];
    goto LABEL_32;
  }
LABEL_33:

  return v3;
}

- (id)_mediaBackgroundColor
{
  BOOL v3 = [(LPWebLinkPresentationProperties *)self->_properties imageProperties];
  objc_super v4 = [v3 backgroundColor];

  if (v4)
  {
    id v5 = [(LPWebLinkPresentationProperties *)self->_properties imageProperties];
    int v6 = [v5 backgroundColor];
  }
  else
  {
    overrideMediaBackgroundColor = self->_overrideMediaBackgroundColor;
    if (overrideMediaBackgroundColor || (overrideMediaBackgroundColor = self->_overrideBackgroundColor) != 0)
    {
      id v8 = overrideMediaBackgroundColor;
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB1618] clearColor];
    }
    int v6 = v8;
  }

  return v6;
}

- (void)_rebuildSubviewsWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  self->_needsRebuild = 0;
  if (a3)
  {
    [(LPLinkView *)self animateOutAndRemoveViews];
  }
  else
  {
    while (1)
    {
      id v65 = [(UIView *)self->_contentView subviews];
      uint64_t v8 = [v65 count];

      if (!v8) {
        break;
      }
      id v66 = [(UIView *)self->_contentView subviews];
      int v9 = [v66 lastObject];
      [v9 removeFromSuperview];
    }
    while (1)
    {
      id v67 = [(LPLinkViewComponents *)self->_components mediaBackground];
      double v10 = [v67 subviews];
      uint64_t v11 = [v10 count];

      if (!v11) {
        break;
      }
      id v68 = [(LPLinkViewComponents *)self->_components mediaBackground];
      double v12 = [v68 subviews];
      int v13 = [v12 lastObject];
      [v13 removeFromSuperview];
    }
  }
  [(LPLinkView *)self _uninstallTapGestureRecognizers];
  [(LPLinkView *)self _uninstallHighlightGestureRecognizers];
  [(LPLinkView *)self _updateCornerRadius];
  BOOL v5 = [(LPLinkView *)self _shouldClipAnimationView];
  id v63 = [(UIView *)self->_animationView layer];
  [v63 setMasksToBounds:v5];

  v64 = self->_components;
  componentsForSizing = self->_componentsForSizing;
  if (componentsForSizing)
  {
    BOOL v7 = componentsForSizing;
  }
  else
  {
    BOOL v7 = [(LPLinkView *)self _createComponents];
  }
  components = self->_components;
  self->_components = v7;

  [(LPLinkView *)self _setEmphasizedTextExpression:self->_emphasizedTextExpression];
  double v15 = [(LPLinkViewComponents *)self->_components backgroundImage];

  if (v15)
  {
    contentView = self->_contentView;
    double v17 = [(LPLinkViewComponents *)self->_components backgroundImage];
    [(UIView *)contentView addSubview:v17];
  }
  int v18 = [(LPLinkViewComponents *)self->_components mediaBackground];

  if (v18)
  {
    if ([(LPWebLinkPresentationProperties *)self->_properties style] != 15 && v3)
    {
      double v19 = [(LPLinkViewComponents *)v64 mediaBackground];

      if (!v19)
      {
        double v20 = [(LPLinkViewComponents *)self->_components mediaBackground];
        double v21 = [v20 layer];
        [v21 setOpacity:0.0];
      }
    }
    double v22 = self->_contentView;
    __int16 v23 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [(UIView *)v22 addSubview:v23];
  }
  else
  {
    __int16 v23 = [(LPLinkViewComponents *)v64 mediaBackground];
    [v23 removeFromSuperview];
  }

  float v24 = [(LPLinkViewComponents *)self->_components captionBar];

  if (v24)
  {
    float v25 = self->_contentView;
    double v26 = [(LPLinkViewComponents *)self->_components captionBar];
    [(UIView *)v25 addSubview:v26];

    double v27 = [(LPLinkViewComponents *)self->_components captionBar];
    double v28 = [v27 button];
    [v28 addTarget:self action:sel__captionBarButtonPressed_];
  }
  objc_super v29 = [(LPLinkView *)self _sizeClassParameters];
  [v29 minimumMediaCornerRadius];
  if (v30 == 0.0)
  {
    double v35 = 0.0;
  }
  else
  {
    [(LPLinkView *)self _effectiveCornerRadius];
    double v32 = v31;
    v33 = [(LPLinkView *)self _sizeClassParameters];
    [v33 minimumMediaCornerRadius];
    double v35 = fmax(v32, v34);
  }
  double v36 = [(LPLinkViewComponents *)self->_components mediaBackground];

  if (v36)
  {
    v37 = [(LPLinkView *)self _mediaBackgroundColor];
    v38 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [v38 setColor:v37];

    if (v35 != 0.0)
    {
      v39 = [(LPLinkViewComponents *)self->_components mediaBackground];
      objc_msgSend(v39, "_lp_setCornerRadius:", v35);
    }
    v40 = self->_contentView;
    v41 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [(UIView *)v40 _lp_bringSubviewToFront:v41];
  }
  double v42 = [(LPLinkViewComponents *)self->_components media];

  if (v42)
  {
    v43 = [(LPLinkViewComponents *)self->_components mediaBackground];
    v44 = [(LPLinkViewComponents *)self->_components media];
    [v43 addSubview:v44];
  }
  v45 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];

  if (v45)
  {
    v46 = self->_contentView;
    v47 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
    [(UIView *)v46 addSubview:v47];
  }
  v48 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];

  if (v48)
  {
    double v49 = self->_contentView;
    double v50 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
    [(UIView *)v49 addSubview:v50];
  }
  double v51 = [(LPLinkViewComponents *)self->_components quote];

  if (v51)
  {
    v52 = [(LPLinkViewComponents *)self->_components mediaBackground];
    double v53 = [(LPLinkViewComponents *)self->_components quote];
    [v52 addSubview:v53];
  }
  double v54 = [(LPLinkViewComponents *)self->_components domainNameIndicator];

  if (v54)
  {
    double v55 = self->_contentView;
    double v56 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
    [(UIView *)v55 addSubview:v56];
  }
  double v57 = [(LPLinkViewComponents *)self->_components contactsBadge];

  if (v57)
  {
    v58 = self->_contentView;
    v59 = [(LPLinkViewComponents *)self->_components contactsBadge];
    [(UIView *)v58 addSubview:v59];
  }
  v60 = [(LPLinkViewComponents *)self->_components progressSpinner];

  if (v60)
  {
    double v61 = self->_contentView;
    v62 = [(LPLinkViewComponents *)self->_components progressSpinner];
    [(UIView *)v61 addSubview:v62];
  }
  if (v3)
  {
    [(LPLinkView *)self animateInViews];
    [(LPLinkView *)self animateBackgroundColor];
  }
  [(UIView *)self->_animationView _lp_setBackgroundColor:self->_backgroundColor];
  [(LPLinkView *)self _rebuildGestureRecognizersIfNeeded];
  self->_hasEverBuilt = 1;
}

- (BOOL)_shouldUseAnimations
{
  if (self->_disableAnimations) {
    return 0;
  }
  else {
    return !+[LPSettings disableAnimations];
  }
}

- (void)_layoutLinkView
{
  [(LPLinkView *)self _computePresentationPropertiesFromMetadataIfNeeded];
  if (!self->_hasEverBuilt) {
    [(LPLinkView *)self _setupView];
  }
  [(LPLinkView *)self _updateCornerRadius];
  if (!self->_hasEverBuilt) {
    goto LABEL_6;
  }
  if (![(LPLinkView *)self _shouldUseAnimations]) {
    goto LABEL_6;
  }
  [(UIView *)self->_animationView frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(LPLinkView *)self bounds];
  v53.origin.CGFloat x = v11;
  v53.origin.CGFloat y = v12;
  v53.size.CGFloat width = v13;
  v53.size.double height = v14;
  v52.origin.CGFloat x = v4;
  v52.origin.CGFloat y = v6;
  v52.size.CGFloat width = v8;
  v52.size.double height = v10;
  if (!CGRectEqualToRect(v52, v53)) {
    BOOL shouldAnimateDuringNextBuild = self->_shouldAnimateDuringNextBuild;
  }
  else {
LABEL_6:
  }
    BOOL shouldAnimateDuringNextBuild = 0;
  NSUInteger v16 = [(LPLinkViewComponents *)self->_components mediaBackground];
  if (v16)
  {
    id v49 = v16;
    double v17 = [(LPLinkViewComponents *)self->_components mediaBackground];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    NSUInteger v16 = v49;
  }
  else
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  if (shouldAnimateDuringNextBuild)
  {
    uint64_t v26 = [(LPLinkViewComponents *)self->_components captionBar];
    componentsForSizing = self->_componentsForSizing;
    self->_componentsForSizing = 0;

    id v50 = (id)v26;
  }
  else if (self->_needsRebuild)
  {
    id v50 = 0;
  }
  else
  {
    id v50 = 0;
    if (self->_hasEverBuilt) {
      goto LABEL_18;
    }
  }
  [(LPLinkView *)self _rebuildSubviewsWithAnimation:shouldAnimateDuringNextBuild];
  if (v50) {
    -[UIView _lp_bringSubviewToFront:](self, "_lp_bringSubviewToFront:");
  }
  else {
    id v50 = 0;
  }
LABEL_18:
  if ([(LPLinkView *)self _shouldUseAnimations])
  {
    int64_t animationOrigin = self->_animationOrigin;
    double v29 = 0.0;
    double v30 = 0.5;
    if (animationOrigin == 2) {
      double v29 = 0.5;
    }
    else {
      double v30 = 1.0;
    }
    if (animationOrigin == 1) {
      double v31 = 1.0;
    }
    else {
      double v31 = v29;
    }
    if (animationOrigin == 1) {
      double v32 = 1.0;
    }
    else {
      double v32 = v30;
    }
    -[UIView setAnchorPoint:](self->_animationView, "setAnchorPoint:", v31, v32, v30);
    -[LPAnimationMaskView setAnchorPoint:](self->_animationMaskView, "setAnchorPoint:", v31, v32);
    v33 = [(LPLinkViewComponents *)self->_components media];
    objc_msgSend(v33, "setAnchorPoint:", v31, v32);

    double v34 = [(LPLinkViewComponents *)self->_components mediaBackground];
    objc_msgSend(v34, "setAnchorPoint:", v31, v32);
  }
  [(LPLinkView *)self bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:", v35 + self->_contentInset.left, v36 + self->_contentInset.top, v37 - (self->_contentInset.left + self->_contentInset.right), v38 - (self->_contentInset.top + self->_contentInset.bottom));
  [(LPLinkView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  [(UIView *)self->_animationView frame];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  [(LPLinkView *)self bounds];
  -[UIView setFrame:](self->_animationView, "setFrame:");
  [(LPLinkView *)self bounds];
  -[LPAnimationMaskView setFrame:](self->_animationMaskView, "setFrame:");
  [(UIView *)self->_contentView bounds];
  -[LPLinkView _layoutLinkViewForSize:applyingLayout:](self, "_layoutLinkViewForSize:applyingLayout:", 1, v47, v48);
  if (shouldAnimateDuringNextBuild)
  {
    -[LPLinkView animateFromOldFrame:oldMediaBackgroundFrame:oldCaptionBarView:](self, "animateFromOldFrame:oldMediaBackgroundFrame:oldCaptionBarView:", v50, v40, v42, v44, v46, v19, v21, v23, v25);
    self->_BOOL shouldAnimateDuringNextBuild = 0;
  }
}

- (void)_rebuildEntireView
{
  self->_needsRebuild = 1;
  componentsForSizing = self->_componentsForSizing;
  self->_componentsForSizing = 0;

  [(LPLinkView *)self _invalidateLayout];
}

- (void)_invalidateLayout
{
  [(LPLinkView *)self invalidateIntrinsicContentSize];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!self->_suppressNeedsResizeCount && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained linkViewNeedsResize:self];
  }
  if (!self->_usesDeferredLayout)
  {
    [(UIView *)self _lp_setNeedsLayout];
    [(LPLinkViewComponents *)self->_components applyToAllViews:&__block_literal_global_275];
  }
}

uint64_t __31__LPLinkView__invalidateLayout__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setNeedsLayout");
}

- (void)_setAllowsTapToLoad:(BOOL)a3
{
  self->_allowsTapToLoad = a3;
  [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
}

- (void)_setEmphasizedTextExpression:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_emphasizedTextExpression, a3);
  double v5 = [(LPLinkViewComponents *)self->_components captionBar];
  [v5 setEmphasizedTextExpression:v9];

  CGFloat v6 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
  [v6 setEmphasizedTextExpression:v9];

  double v7 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
  [v7 setEmphasizedTextExpression:v9];

  CGFloat v8 = [(LPLinkViewComponents *)self->_components quote];
  [v8 setEmphasizedTextExpression:v9];
}

- (id)_createProgressSpinner
{
  double v3 = [LPIndeterminateProgressSpinnerView alloc];
  CGFloat v4 = [(LPTheme *)self->_theme progressSpinner];
  double v5 = [(LPWebLinkPresentationProperties *)self->_properties progressSpinner];
  CGFloat v6 = [(LPIndeterminateProgressSpinnerView *)v3 initWithHost:self style:v4 properties:v5];

  return v6;
}

- (id)_createCaptionBar
{
  double v3 = [LPCaptionBarView alloc];
  CGFloat v4 = [(LPTheme *)self->_theme captionBar];
  double v5 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  CGFloat v6 = [(LPCaptionBarView *)v3 initWithHost:self style:v4 presentationProperties:v5];

  [(LPCaptionBarView *)v6 setEmphasizedTextExpression:self->_emphasizedTextExpression];
  [(LPCaptionBarView *)v6 setUseProgressSpinner:[(LPLinkView *)self _useProgressSpinner]];
  if (+[LPSettings showDebugIndicators])
  {
    id v7 = [MEMORY[0x1E4FB1618] blueColor];
    uint64_t v8 = [v7 CGColor];
    id v9 = [(LPCaptionBarView *)v6 layer];
    [v9 setBorderColor:v8];

    CGFloat v10 = [(LPCaptionBarView *)v6 layer];
    [v10 setBorderWidth:0.5];
  }
  if (!self->_disablePlayback && !self->_disablePlaybackControls)
  {
    CGFloat v11 = [(LPWebLinkPresentationProperties *)self->_properties inlinePlaybackInformation];

    if (v11)
    {
      CGFloat v12 = [(LPWebLinkPresentationProperties *)self->_properties inlinePlaybackInformation];
      [(LPCaptionBarView *)v6 setPlaybackInformation:v12];
    }
  }
  if (self->_collaborationFooter)
  {
    CGFloat v13 = [LPCollaborationFooterView alloc];
    collaborationFooter = self->_collaborationFooter;
    double v15 = [(LPTheme *)self->_theme captionBar];
    NSUInteger v16 = [v15 collaborationFooter];
    double v17 = [(LPCollaborationFooterView *)v13 initWithHost:self properties:collaborationFooter style:v16];
    [(LPCaptionBarView *)v6 setCollaborationFooterView:v17];
  }

  return v6;
}

- (id)_createMediaTopCaptionBarView
{
  double v3 = [LPCaptionBarView alloc];
  CGFloat v4 = [(LPTheme *)self->_theme mediaTopCaptionBar];
  double v5 = [(LPWebLinkPresentationProperties *)self->_properties mediaTopCaptionBar];
  CGFloat v6 = [(LPCaptionBarView *)v3 initWithHost:self style:v4 presentationProperties:v5];

  [(LPCaptionBarView *)v6 setEmphasizedTextExpression:self->_emphasizedTextExpression];
  id v7 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];

  if (v7)
  {
    uint64_t v8 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];
    -[UIView _lp_setForceLTR:](v6, "_lp_setForceLTR:", objc_msgSend(v8, "_lp_isLTRText"));
  }
  [(LPCaptionBarView *)v6 setUserInteractionEnabled:0];

  return v6;
}

- (id)_createMediaBottomCaptionBarView
{
  double v3 = [LPCaptionBarView alloc];
  CGFloat v4 = [(LPTheme *)self->_theme mediaBottomCaptionBar];
  double v5 = [(LPWebLinkPresentationProperties *)self->_properties mediaBottomCaptionBar];
  CGFloat v6 = [(LPCaptionBarView *)v3 initWithHost:self style:v4 presentationProperties:v5];

  [(LPCaptionBarView *)v6 setEmphasizedTextExpression:self->_emphasizedTextExpression];
  id v7 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];

  if (v7)
  {
    uint64_t v8 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];
    -[UIView _lp_setForceLTR:](v6, "_lp_setForceLTR:", objc_msgSend(v8, "_lp_isLTRText"));
  }
  [(LPCaptionBarView *)v6 setUserInteractionEnabled:0];

  return v6;
}

- (id)_createTapToLoadView
{
  double v3 = [LPTapToLoadView alloc];
  CGFloat v4 = [(LPTheme *)self->_theme tapToLoad];
  double v5 = [(LPTapToLoadView *)v3 initWithHost:self style:v4];

  [(LPTapToLoadView *)v5 setTapToLoadViewDelegate:self];

  return v5;
}

- (id)_videoViewConfiguration
{
  double v3 = objc_alloc_init(LPVisualMediaViewConfiguration);
  [(LPVisualMediaViewConfiguration *)v3 setDisablePlayback:self->_disablePlayback];
  [(LPVisualMediaViewConfiguration *)v3 setDisablePlaybackControls:self->_disablePlaybackControls];
  [(LPVisualMediaViewConfiguration *)v3 setDisableAutoPlay:self->_disableAutoPlay];
  [(LPVisualMediaViewConfiguration *)v3 setAllowsLoadingMediaWithAutoPlayDisabled:self->_allowsLoadingMediaWithAutoPlayDisabled];
  BOOL v4 = [(LPLinkView *)self _shouldApplyCornerRadius];
  double v5 = 28.0;
  if (v4) {
    [(LPLinkView *)self _effectiveCornerRadius];
  }
  [(LPVisualMediaViewConfiguration *)v3 setFullScreenTransitionCornerRadius:v5];

  return v3;
}

- (id)_createMediaViewForProperties:(id)a3
{
  id v4 = a3;
  if ([v4 style] == 15)
  {
    double v5 = [(LPLinkView *)self _createTapToLoadView];
    goto LABEL_12;
  }
  CGFloat v6 = [v4 video];
  id v7 = [v6 youTubeURL];

  if (v7)
  {
    uint64_t v8 = [LPYouTubeVideoView alloc];
    id v9 = [v4 video];
    CGFloat v10 = [(LPTheme *)self->_theme mediaVideo];
    CGFloat v11 = [v4 image];
    CGFloat v12 = [(LPTheme *)self->_theme mediaImage];
    CGFloat v13 = [(LPLinkView *)self _videoViewConfiguration];
    uint64_t v14 = [(LPYouTubeVideoView *)v8 initWithHost:self video:v9 style:v10 posterFrame:v11 posterFrameStyle:v12 configuration:v13];
LABEL_9:
    double v5 = (LPImageView *)v14;

LABEL_10:
LABEL_11:

    goto LABEL_12;
  }
  double v15 = [v4 video];
  NSUInteger v16 = [v15 streamingURL];
  if (v16)
  {

LABEL_8:
    double v19 = [LPStreamingVideoView alloc];
    id v9 = [v4 video];
    CGFloat v10 = [(LPTheme *)self->_theme mediaVideo];
    CGFloat v11 = [v4 image];
    CGFloat v12 = [(LPTheme *)self->_theme mediaImage];
    CGFloat v13 = [(LPLinkView *)self _videoViewConfiguration];
    uint64_t v14 = [(LPStreamingVideoView *)v19 initWithHost:self video:v9 style:v10 posterFrame:v11 posterFrameStyle:v12 configuration:v13];
    goto LABEL_9;
  }
  double v17 = [v4 video];
  double v18 = [v17 data];

  if (v18) {
    goto LABEL_8;
  }
  double v21 = [v4 image];
  int v22 = [v21 _isFallbackIcon];

  if (v22)
  {
    double v23 = [LPImageView alloc];
    id v9 = [v4 image];
    CGFloat v10 = [(LPTheme *)self->_theme placeholderImage];
    uint64_t v24 = [(LPImageView *)v23 initWithHost:self image:v9 properties:0 style:v10];
    goto LABEL_20;
  }
  double v25 = [v4 image];

  if (v25)
  {
    uint64_t v26 = [v4 alternateImages];

    if (!v26)
    {
      double v30 = [LPImageView alloc];
      id v9 = [v4 image];
      CGFloat v10 = [v4 imageProperties];
      CGFloat v11 = [(LPTheme *)self->_theme mediaImage];
      double v5 = [(LPImageView *)v30 initWithHost:self image:v9 properties:v10 style:v11];
      goto LABEL_10;
    }
    double v27 = [v4 alternateImages];
    id v9 = (void *)[v27 mutableCopy];

    double v28 = [v4 image];
    [v9 insertObject:v28 atIndex:0];

    double v29 = [LPMultipleImageView alloc];
    CGFloat v10 = [(LPTheme *)self->_theme mediaImage];
    uint64_t v24 = [(LPMultipleImageView *)v29 initWithHost:self images:v9 style:v10];
LABEL_20:
    double v5 = (LPImageView *)v24;
    goto LABEL_11;
  }
  double v5 = 0;
LABEL_12:

  return v5;
}

- (id)_createMediaView
{
  return [(LPLinkView *)self _createMediaViewForProperties:self->_properties];
}

- (id)_createQuotedTextView
{
  double v3 = [LPQuoteView alloc];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v5 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];
  CGFloat v6 = (void *)[v4 initWithString:v5];
  id v7 = [(LPTheme *)self->_theme quotedText];
  uint64_t v8 = [(LPQuoteView *)v3 initWithHost:self text:v6 style:v7];

  [(LPQuoteView *)v8 setEmphasizedTextExpression:self->_emphasizedTextExpression];
  id v9 = [(LPWebLinkPresentationProperties *)self->_properties quotedText];
  -[UIView _lp_setForceLTR:](v8, "_lp_setForceLTR:", objc_msgSend(v9, "_lp_isLTRText"));

  return v8;
}

- (id)_createDomainNameIndicator
{
  double v3 = [LPDomainNameIndicator alloc];
  id v4 = [(LPWebLinkPresentationProperties *)self->_properties domainNameForIndicator];
  double v5 = [(LPDomainNameIndicator *)v3 initWithHost:self domainName:v4 theme:self->_theme];

  return v5;
}

- (id)_createBackgroundImageView
{
  if (self->_overrideBackgroundColor
    && ([(LPWebLinkPresentationProperties *)self->_properties captionBar],
        double v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 usesBlurredBackground],
        v3,
        (v4 & 1) != 0))
  {
    double v5 = 0;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__LPLinkView__createBackgroundImageView__block_invoke;
    v11[3] = &unk_1E5B067C8;
    v11[4] = self;
    CGFloat v6 = __40__LPLinkView__createBackgroundImageView__block_invoke((uint64_t)v11);
    id v7 = [LPImageView alloc];
    uint64_t v8 = [(LPWebLinkPresentationProperties *)self->_properties backgroundImageProperties];
    id v9 = [(LPTheme *)self->_theme backgroundImage];
    double v5 = [(LPImageView *)v7 initWithHost:self image:v6 properties:v8 style:v9];
  }

  return v5;
}

LPImage *__40__LPLinkView__createBackgroundImageView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 504) backgroundImage];
  double v3 = [*(id *)(*(void *)(a1 + 32) + 504) captionBar];
  char v4 = [v3 usesBlurredBackground];

  if (v4)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 719))
    {
      mapsBackgroundImage(v2);
      double v5 = (LPImage *)objc_claimAutoreleasedReturnValue();
      CGFloat v6 = [v2 _darkInterfaceAlternativeImage];

      if (!v6) {
        goto LABEL_9;
      }
      id v7 = [v2 _darkInterfaceAlternativeImage];
      uint64_t v8 = mapsBackgroundImage(v7);
      [(LPImage *)v5 _setDarkInterfaceAlternativeImage:v8];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
      CGFloat v10 = [v2 platformImage];
      uint64_t v11 = objc_msgSend(v10, "_lp_CGImage");
      CGFloat v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v12 scale];
      id v7 = objc_msgSend(v9, "initWithCGImage:scale:orientation:", v11, 5);

      double v5 = [[LPImage alloc] initWithPlatformImage:v7];
      CGFloat v13 = [v2 _darkInterfaceAlternativeImage];

      if (v13)
      {
        id v14 = objc_alloc(MEMORY[0x1E4FB1818]);
        double v15 = [v2 _darkInterfaceAlternativeImage];
        NSUInteger v16 = [v15 platformImage];
        uint64_t v17 = objc_msgSend(v16, "_lp_CGImage");
        double v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v18 scale];
        double v19 = objc_msgSend(v14, "initWithCGImage:scale:orientation:", v17, 5);

        double v20 = [[LPImage alloc] initWithPlatformImage:v19];
        [(LPImage *)v5 _setDarkInterfaceAlternativeImage:v20];
      }
    }
  }
  else
  {
    double v5 = v2;
  }
LABEL_9:

  return v5;
}

- (id)_createContactsBadgeView
{
  double v3 = [LPContactsBadgeView alloc];
  contactsForAttribution = self->_contactsForAttribution;
  BOOL highlightedForAttribution = self->_highlightedForAttribution;
  CGFloat v6 = [(LPTheme *)self->_theme contactsBadgeStyle];
  id v7 = [(LPContactsBadgeView *)v3 initWithHost:self contacts:contactsForAttribution highlighted:highlightedForAttribution style:v6];

  return v7;
}

- (BOOL)linkHasMediaForComponentView:(id)a3
{
  return [(LPConcretePresentationProperties *)self->_properties hasMedia];
}

- (int64_t)componentView:(id)a3 allowedImageFilterForFilter:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 7 && ![(LPLinkView *)self _isUsingAppClipPresentation]) {
    goto LABEL_5;
  }
  if ([(LPLinkView *)self _useLowMemoryImageFilters])
  {
    if ((unint64_t)(a4 - 5) < 2)
    {
LABEL_5:
      a4 = 3;
      goto LABEL_6;
    }
    if ((unint64_t)(a4 - 8) < 3) {
      a4 = 1;
    }
  }
LABEL_6:

  return a4;
}

- (void)componentViewDidTapCaptionButton:(id)a3 buttonType:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _linkView:self didTapCaptionButtonWithType:a4];
  }
}

- (id)componentView:(id)a3 playerForAudio:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained _linkView:self playerForAudio:v5],
        (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v7 = +[LPStreamingAudioPlayer playerWithAudio:v5];
  }

  return v7;
}

- (id)downloadProgressForComponentView:(id)a3
{
  double v3 = [[LPLinkMetadataDownloadProgressTransformer alloc] initWithBytesLoaded:self->_bytesLoaded downloadState:self->_sharedObjectDownloadState metadata:self->_metadata];
  char v4 = [(LPLinkMetadataDownloadProgressTransformer *)v3 downloadProgressForTransformer:v3];

  return v4;
}

- (CGSize)_layoutLinkViewForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  id v7 = &OBJC_IVAR___LPLinkView__componentsForSizing;
  if (a4) {
    id v7 = &OBJC_IVAR___LPLinkView__components;
  }
  id v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  if (!v8)
  {
    id v8 = [(LPLinkView *)self _createComponents];
    objc_storeStrong((id *)&self->_componentsForSizing, v8);
  }
  double v270 = width;
  if (!v4)
  {
    if ([(LPWebLinkPresentationProperties *)self->_properties style] == 15)
    {
      id v9 = [(LPTheme *)self->_theme tapToLoad];
      CGFloat v10 = [v9 width];
      [v10 value];
      double width = fmin(v11, width);
    }
    else if (self->_allowsSkinnyWidth)
    {
      CGFloat v12 = [v8 media];

      if (v12)
      {
        v305[0] = MEMORY[0x1E4F143A8];
        v305[1] = 3221225472;
        v305[2] = __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke;
        v305[3] = &unk_1E5B06488;
        v305[4] = self;
        if (__52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke((uint64_t)v305))
        {
          [(LPTheme *)self->_theme widthFractionForTallMedia];
          double width = ceil(width * v13);
        }
      }
    }
  }
  id v14 = objc_msgSend(v8, "captionBar", *(void *)&v270);
  double v15 = *MEMORY[0x1E4F1DB20];
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 24);

  double r2_16 = v18;
  double r2_24 = v17;
  double v303 = v16;
  double v304 = v15;
  if (v14)
  {
    double top = self->_textSafeAreaInset.top;
    double left = self->_textSafeAreaInset.left;
    double bottom = self->_textSafeAreaInset.bottom;
    double right = self->_textSafeAreaInset.right;
    double v23 = [v8 captionBar];
    objc_msgSend(v23, "setTextSafeAreaInset:", top, left, bottom, right);

    uint64_t v24 = [v8 captionBar];
    objc_msgSend(v24, "sizeThatFits:", width, height);
    double r1 = v25;
    double v27 = v26;

    if (self->_forceFlexibleWidth)
    {
      int v28 = !v4;
    }
    else
    {
      uint64_t v30 = [(LPWebLinkPresentationProperties *)self->_properties style];
      unint64_t effectiveSizeClass = self->_effectiveSizeClass;
      double v32 = [v8 quote];
      v33 = [v8 media];
      int v28 = shouldUseFlexibleWidth(v30, effectiveSizeClass, v32 != 0, v33 != 0) & !v4;
    }
    if (v28) {
      double v34 = v27;
    }
    else {
      double v34 = width;
    }
    double v29 = height - r1;
    double v276 = 0.0;
    double v285 = 0.0;
    double v286 = v34;
  }
  else
  {
    double r1 = v18;
    double v285 = v15;
    double v286 = v17;
    double v276 = v16;
    double v29 = height;
  }
  double v35 = [v8 quote];

  if (v35)
  {
    double v36 = self->_textSafeAreaInset.top;
    double v37 = self->_textSafeAreaInset.left;
    double v38 = self->_textSafeAreaInset.bottom;
    double v39 = self->_textSafeAreaInset.right;
    double v40 = [v8 quote];
    objc_msgSend(v40, "setContentInset:", v36, v37, v38, v39);

    double v41 = [v8 quote];
    objc_msgSend(v41, "sizeThatFits:", width, v29);
    CGFloat v275 = v42;
    double v44 = v43;

    [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters mediaFixedAspectRatio];
    if (v45 != 0.0)
    {
      [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters mediaFixedAspectRatio];
      double v44 = width / v46;
    }
    double v47 = fmin(v44, v29);
    if (v4)
    {
      double v48 = [v8 media];

      if (!v48) {
        double v47 = v29;
      }
    }
    double v29 = v29 - v47;
    double v49 = 0.0;
    CGFloat rect = 0.0;
    double v292 = width;
  }
  else
  {
    double v47 = r2_16;
    CGFloat v275 = r2_24;
    double v292 = r2_24;
    CGFloat rect = v303;
    double v49 = v304;
  }
  double r2 = v49;
  id v50 = [v8 media];

  if (v50)
  {
    double v51 = [v8 media];
    objc_msgSend(v51, "sizeThatFits:", width, v29);
    double v278 = v52;
    double v54 = v53;

    [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters mediaFixedAspectRatio];
    if (v55 == 0.0)
    {
      if (v4) {
        double v57 = v29;
      }
      else {
        double v57 = v54;
      }
    }
    else
    {
      [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters mediaFixedAspectRatio];
      double v57 = width / v56;
    }
    double v81 = [v8 mediaTopCaptionBar];

    double v280 = r2_24;
    double v281 = r2_16;
    double MinY = v303;
    double v282 = v304;
    if (v81)
    {
      double v82 = self->_textSafeAreaInset.top;
      double v83 = self->_textSafeAreaInset.left;
      double v84 = self->_textSafeAreaInset.bottom;
      double v85 = self->_textSafeAreaInset.right;
      double v86 = [v8 mediaTopCaptionBar];
      objc_msgSend(v86, "setTextSafeAreaInset:", v82, v83, v84, v85);

      double v87 = [v8 mediaTopCaptionBar];
      objc_msgSend(v87, "sizeThatFits:", width, v57);
      double v89 = v88;

      v309.origin.double x = 0.0;
      double v282 = 0.0;
      v309.origin.double y = 0.0;
      v309.size.double width = width;
      v309.size.double height = v57;
      double MinY = CGRectGetMinY(v309);
      double v280 = width;
      double v281 = fmin(v89, v57);
    }
    v90 = [v8 domainNameIndicator];

    double v295 = r2_16;
    double v297 = r2_24;
    double v59 = v303;
    double v293 = v304;
    if (v90)
    {
      v91 = [v8 domainNameIndicator];
      objc_msgSend(v91, "sizeThatFits:", width, v57);
      double v93 = v92;
      double v95 = v94;

      v310.origin.double x = 0.0;
      v310.origin.double y = 0.0;
      v310.size.double width = width;
      v310.size.double height = v57;
      double v59 = CGRectGetMinY(v310);
      BOOL v96 = [(UIView *)self _lp_isLTR];
      double v295 = fmin(v95, v57);
      double v297 = fmin(v93, width);
      double v97 = width - v297;
      if (v96) {
        double v97 = 0.0;
      }
      double v293 = v97;
    }
    v98 = [v8 mediaBottomCaptionBar];

    if (v98)
    {
      double v99 = self->_textSafeAreaInset.top;
      double v100 = self->_textSafeAreaInset.left;
      double v101 = self->_textSafeAreaInset.bottom;
      double v102 = self->_textSafeAreaInset.right;
      v103 = [v8 mediaBottomCaptionBar];
      objc_msgSend(v103, "setTextSafeAreaInset:", v99, v100, v101, v102);

      v104 = [v8 mediaBottomCaptionBar];
      objc_msgSend(v104, "sizeThatFits:", width, v57);
      double v106 = v105;

      v311.origin.double x = 0.0;
      double v274 = 0.0;
      v311.origin.double y = 0.0;
      v311.size.double width = width;
      v311.size.double height = v57;
      double v272 = width;
      double v273 = fmin(v106, v57);
      double v287 = CGRectGetMaxY(v311) - v273;
      double v294 = width;
      double v302 = 0.0;
      double r2_8 = 0.0;
    }
    else
    {
      double v302 = 0.0;
      double v272 = r2_24;
      double v273 = r2_16;
      double v287 = v303;
      double v274 = v304;
      double r2_8 = 0.0;
      double v294 = width;
    }
  }
  else
  {
    v58 = [v8 quote];

    double v57 = r2_16;
    double v272 = r2_24;
    double v273 = r2_16;
    double v287 = v303;
    double v274 = v304;
    double v294 = r2_24;
    double v295 = r2_16;
    double v297 = r2_24;
    double v59 = v303;
    double v293 = v304;
    double v280 = r2_24;
    double v281 = r2_16;
    double MinY = v303;
    double v282 = v304;
    double v278 = r2_24;
    double v302 = v303;
    double r2_8 = v304;
    if (v58)
    {
      v60 = [v8 mediaTopCaptionBar];

      double v280 = r2_24;
      double v281 = r2_16;
      double MinY = v303;
      double v282 = v304;
      if (v60)
      {
        double v61 = self->_textSafeAreaInset.top;
        double v62 = self->_textSafeAreaInset.left;
        double v63 = self->_textSafeAreaInset.bottom;
        double v64 = self->_textSafeAreaInset.right;
        id v65 = [v8 mediaTopCaptionBar];
        objc_msgSend(v65, "setTextSafeAreaInset:", v61, v62, v63, v64);

        id v66 = [v8 mediaTopCaptionBar];
        objc_msgSend(v66, "sizeThatFits:", v292, v47);
        double v68 = v67;

        v307.origin.double x = r2;
        v307.origin.double y = rect;
        v307.size.double width = v292;
        v307.size.double height = v47;
        double MinY = CGRectGetMinY(v307);
        double v280 = v292;
        double v281 = fmin(v68, v47);
        double v282 = r2;
      }
      v69 = [v8 mediaBottomCaptionBar];

      if (v69)
      {
        double v70 = self->_textSafeAreaInset.top;
        double v71 = self->_textSafeAreaInset.left;
        double v72 = self->_textSafeAreaInset.bottom;
        double v73 = self->_textSafeAreaInset.right;
        v74 = [v8 mediaBottomCaptionBar];
        objc_msgSend(v74, "setTextSafeAreaInset:", v70, v71, v72, v73);

        double v75 = [v8 mediaBottomCaptionBar];
        objc_msgSend(v75, "sizeThatFits:", v292, v47);
        double v77 = v76;

        v308.origin.double x = r2;
        v308.origin.double y = rect;
        v308.size.double width = v292;
        v308.size.double height = v47;
        double v272 = v292;
        double v273 = fmin(v77, v47);
        double v274 = r2;
        double v57 = r2_16;
        double v295 = r2_16;
        double v287 = CGRectGetMaxY(v308) - v273;
        double v78 = r2_24;
        double v297 = r2_24;
        double v80 = v303;
        double v79 = v304;
      }
      else
      {
        double v57 = r2_16;
        double v78 = r2_24;
        double v272 = r2_24;
        double v273 = r2_16;
        double v80 = v303;
        double v287 = v303;
        double v79 = v304;
        double v274 = v304;
        double v295 = r2_16;
        double v297 = r2_24;
      }
      double v59 = v80;
      double v293 = v79;
      double v294 = v78;
      double v278 = v78;
      double v302 = v80;
      double r2_8 = v79;
    }
  }
  v107 = [v8 progressSpinner];

  double v288 = r2_24;
  double v289 = r2_16;
  if (v107)
  {
    v108 = [v8 progressSpinner];
    objc_msgSend(v108, "sizeThatFits:", v271, height);
    double v110 = v109;
    double v112 = v111;

    double v288 = v110;
    double v304 = (v271 - v110) * 0.5;
    double v289 = v112;
    double v303 = (height - v112) * 0.5;
  }
  v113 = [v8 media];
  if (v113)
  {
    double v114 = v47;

    CGFloat v115 = rect;
  }
  else
  {
    v116 = [v8 domainNameIndicator];

    CGFloat v115 = rect;
    if (v116)
    {
      double v114 = v47;
      v117 = [v8 domainNameIndicator];
      objc_msgSend(v117, "sizeThatFits:", v297, v295);
      double v297 = v118;
      double v295 = v119;

      BOOL v120 = [(UIView *)self _lp_isLTR];
      double v121 = width - v297;
      double v59 = 0.0;
      if (v120) {
        double v121 = 0.0;
      }
      double v293 = v121;
    }
    else
    {
      double v114 = v47;
    }
  }
  v122 = [v8 media];

  if (v122)
  {
    v312.origin.double x = r2_8;
    v312.origin.double y = v302;
    v312.size.double width = v294;
    v312.size.double height = v57;
    double MaxY = CGRectGetMaxY(v312);
  }
  else
  {
    double MaxY = 0.0;
  }
  v124 = [v8 media];
  if (v124)
  {
  }
  else
  {
    double v125 = [v8 domainNameIndicator];

    if (v125)
    {
      v313.origin.double x = v293;
      v313.origin.double y = v59;
      v313.size.double width = v297;
      v313.size.double height = v295;
      double MaxY = CGRectGetMaxY(v313);
    }
  }
  v126 = [v8 quote];

  if (v126)
  {
    v314.origin.double x = r2;
    v314.origin.double y = MaxY;
    v314.size.double width = v292;
    v314.size.double height = v114;
    double v127 = CGRectGetMaxY(v314);
  }
  else
  {
    double v127 = MaxY;
    double MaxY = v115;
  }
  v128 = [v8 captionBar];

  double v129 = v278;
  if (v128) {
    double v130 = v127;
  }
  else {
    double v130 = v276;
  }
  double v131 = v285;
  double v132 = v286;
  double recta = v130;
  double v133 = r1;
  double v134 = r2_8;
  double v135 = v302;
  double v136 = v57;
  CGRect v315 = CGRectUnion(*(CGRect *)(&v130 - 1), *(CGRect *)(&v129 - 2));
  v327.origin.double x = r2;
  v327.origin.double y = v115;
  v327.size.double width = v275;
  v327.size.double height = v114;
  CGRect v316 = CGRectUnion(v315, v327);
  v328.origin.double y = v303;
  v328.origin.double x = v304;
  v328.size.double width = v288;
  v328.size.double height = v289;
  CGRect v317 = CGRectUnion(v316, v328);
  v329.origin.double x = v293;
  v329.origin.double y = v59;
  v329.size.double width = v297;
  v329.size.double height = v295;
  CGRect v318 = CGRectUnion(v317, v329);
  CGFloat v137 = v318.size.width;
  double v138 = v318.size.height;
  v139 = [(LPWebLinkPresentationProperties *)self->_properties minimumHeight];
  if (v139)
  {
    v140 = [(LPWebLinkPresentationProperties *)self->_properties minimumHeight];
    [v140 doubleValue];
    double v142 = v141;

    BOOL v143 = v138 < v142;
    double v144 = v138;
    if (v143)
    {
      v145 = [(LPWebLinkPresentationProperties *)self->_properties minimumHeight];
      [v145 doubleValue];
      double v144 = v146;
    }
  }
  else
  {
    double v144 = v138;
  }
  v147 = [v8 quote];

  double v277 = v144;
  CGFloat v279 = v137;
  if (v4 && v138 < height)
  {
    double v148 = height - v138;
    if (!v147) {
      double v148 = v148 * 0.5;
    }
    double v302 = v302 + v148;
    double v59 = v59 + v148;
    double MinY = MinY + v148;
    double v287 = v287 + v148;
    double recta = recta + v148;
    double MaxY = MaxY + v148;
  }
  if (v4)
  {
    v319.origin.double x = r2_8;
    v319.origin.double y = v302;
    v319.size.double width = v294;
    v319.size.double height = v57;
    BOOL IsNull = CGRectIsNull(v319);
    v320.origin.double x = r2;
    v320.origin.double y = MaxY;
    v320.size.double width = v292;
    v320.size.double height = v114;
    BOOL v150 = CGRectIsNull(v320);
    if (IsNull || v150)
    {
      if (IsNull)
      {
        if (v150)
        {
          v151 = [v8 mediaBackground];
          objc_msgSend(v151, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        }
        else
        {
          v151 = [v8 mediaBackground];
          objc_msgSend(v151, "setFrame:", r2, MaxY, v292, v114);
        }
      }
      else
      {
        v151 = [v8 mediaBackground];
        objc_msgSend(v151, "setFrame:", r2_8, v302, v294, v57);
      }
    }
    else
    {
      v330.origin.double x = r2;
      v321.origin.double x = r2_8;
      v321.origin.double y = v302;
      v321.size.double width = v294;
      v321.size.double height = v57;
      v330.origin.double y = MaxY;
      v330.size.double width = v292;
      v330.size.double height = v114;
      CGRect v322 = CGRectUnion(v321, v330);
      double x = v322.origin.x;
      double y = v322.origin.y;
      double v154 = v322.size.width;
      double v155 = v322.size.height;
      v151 = [v8 mediaBackground];
      objc_msgSend(v151, "setFrame:", x, y, v154, v155);
    }

    v156 = [v8 mediaBackground];
    objc_msgSend(v156, "convertRect:fromView:", self->_contentView, r2_8, v302, v294, v57);
    double v158 = v157;
    double v160 = v159;
    double v162 = v161;
    double v164 = v163;
    v165 = [v8 media];
    objc_msgSend(v165, "setFrame:", v158, v160, v162, v164);

    v166 = [v8 domainNameIndicator];
    objc_msgSend(v166, "setFrame:", v293, v59, v297, v295);

    v167 = [v8 mediaTopCaptionBar];
    objc_msgSend(v167, "setFrame:", v282, MinY, v280, v281);

    v168 = [v8 mediaBottomCaptionBar];
    objc_msgSend(v168, "setFrame:", v274, v287, v272, v273);

    v169 = [v8 mediaBackground];
    objc_msgSend(v169, "convertRect:fromView:", self->_contentView, r2, MaxY, v292, v114);
    double v171 = v170;
    double v173 = v172;
    double v175 = v174;
    double v177 = v176;
    v178 = [v8 quote];
    objc_msgSend(v178, "setFrame:", v171, v173, v175, v177);

    [(LPLinkView *)self bounds];
    -[LPLinkView convertRect:toView:](self, "convertRect:toView:", self->_contentView);
    double v180 = v179;
    double v182 = v181;
    double v184 = v183;
    double v186 = v185;
    v187 = [v8 backgroundImage];
    objc_msgSend(v187, "setFrame:", v180, v182, v184, v186);

    v188 = [v8 progressSpinner];
    objc_msgSend(v188, "setFrame:", v304, v303, v288, v289);

    v189 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
    LODWORD(v178) = [v189 usesBlurredBackground];

    if (v178)
    {
      v190 = [v8 backgroundImage];
      [v190 frame];
      double v192 = v191;
      double v194 = v193;
      double v196 = v195;
      double v198 = v197;

      v199 = [v8 backgroundImage];
      objc_msgSend(v199, "setFrame:", v192, v57 + v194, v196, v198);
    }
    double v201 = self->_contentInset.top;
    double v200 = self->_contentInset.left;
    double v202 = self->_contentInset.bottom;
    double v203 = self->_contentInset.right;
    v323.origin.double x = r2_8;
    v323.origin.double y = v302;
    v323.size.double width = v294;
    v323.size.double height = v57;
    if (CGRectIsNull(v323)) {
      double v204 = -v201;
    }
    else {
      double v204 = 0.0;
    }
    double v205 = self->_textSafeAreaInset.top;
    double v206 = self->_textSafeAreaInset.left;
    double v207 = self->_textSafeAreaInset.bottom;
    double v208 = self->_textSafeAreaInset.right;
    v209 = [v8 captionBar];
    objc_msgSend(v209, "setTextSafeAreaInset:", v205 - v204, v200 + v206, v202 + v207, v203 + v208);

    v210 = [v8 captionBar];
    double v211 = -v203 - v200;
    objc_msgSend(v210, "setFrame:", v285 - v200, recta + v204, v286 - v211, r1 - (v204 - v202));

    animationView = self->_animationView;
    v213 = [v8 captionBar];
    [v213 frame];
    -[UIView convertRect:fromView:](animationView, "convertRect:fromView:", self->_contentView, v214 - v200, v204 + v215, v216 - v211, v217 - (v204 - v202));
    double v219 = v218;

    [(UIView *)self->_animationView bounds];
    double v221 = v220;
    [(UIView *)self->_animationView bounds];
    double v223 = v222;
    if (v219 == 0.0) {
      double v224 = 0.0;
    }
    else {
      double v224 = v221;
    }
    -[UIView setFrame:](self->_mediaHighlightView, "setFrame:", 0.0, 0.0, v224, v219);
    if (v223 - v219 == 0.0) {
      double v225 = 0.0;
    }
    else {
      double v225 = v221;
    }
    -[UIView setFrame:](self->_captionHighlightView, "setFrame:", 0.0, v219, v225, v223 - v219);
    v226 = [v8 contactsBadge];

    if (v226)
    {
      v227 = [v8 contactsBadge];
      objc_msgSend(v227, "sizeThatFits:", r2_24, r2_16);
      double v229 = v228;
      double v231 = v230;

      v232 = [(LPTheme *)self->_theme contactsBadgeStyle];
      uint64_t v233 = [v232 location];

      if (v233 == 1)
      {
        v234 = [v8 captionBar];
        objc_msgSend(v234, "_lp_layoutIfNeeded");

        v235 = [v8 captionBar];
        v236 = [v235 primaryIconView];
        v237 = [v8 captionBar];
        v238 = [v237 primaryIconView];
        [v238 bounds];
        objc_msgSend(v236, "convertRect:toView:", self->_contentView);
        CGFloat v240 = v239;
        CGFloat v242 = v241;
        CGFloat v244 = v243;
        CGFloat v246 = v245;

        v324.origin.double x = v240;
        v324.origin.double y = v242;
        v324.size.double width = v244;
        v324.size.double height = v246;
        double MaxX = CGRectGetMaxX(v324);
        v325.origin.double x = v240;
        v325.origin.double y = v242;
        v325.size.double width = v244;
        v325.size.double height = v246;
        double v248 = CGRectGetMaxY(v325);
        v249 = [(LPTheme *)self->_theme contactsBadgeStyle];
        [v249 iconOffset];
        double v251 = v250;

        v252 = [(LPTheme *)self->_theme contactsBadgeStyle];
        [v252 iconOffset];
        double v253 = v248 - v231 * 0.5;
        double MinX = MaxX - v229 * 0.5 + v251;
        double v256 = v253 + v255;
      }
      else
      {
        v257 = [v8 mediaBackground];
        [v257 frame];
        CGFloat v259 = v258;
        CGFloat v261 = v260;
        double v263 = v262;
        CGFloat v265 = v264;

        BOOL v266 = [(UIView *)self _lp_isLTR];
        double v256 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        if (v266)
        {
          double MinX = v263 - v229;
        }
        else
        {
          v326.origin.double x = v259;
          v326.origin.double y = v261;
          v326.size.double width = v263;
          v326.size.double height = v265;
          double MinX = CGRectGetMinX(v326);
        }
      }
      v267 = [v8 contactsBadge];
      objc_msgSend(v267, "setFrame:", MinX, v256, v229, v231);
    }
    if (self->_componentsNeedLayout)
    {
      self->_componentsNeedLayout = 0;
      [v8 applyToAllViews:&__block_literal_global_299];
    }
  }

  double v269 = v277;
  double v268 = v279;
  result.double height = v269;
  result.double width = v268;
  return result;
}

BOOL __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory) {
    return 0;
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 504) captionBar];
  id v7 = [v6 buttonCaption];
  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 504) captionButton];
    if (v9)
    {
      char v8 = 1;
    }
    else
    {
      CGFloat v10 = [*(id *)(*(void *)(a1 + 32) + 504) captionTextButton];
      char v8 = v10 != 0;
    }
  }

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 504) style];
  CGFloat v12 = [*(id *)(*(void *)(a1 + 32) + 504) quotedText];
  double v13 = [*(id *)(*(void *)(a1 + 32) + 504) image];
  id v14 = [*(id *)(*(void *)(a1 + 32) + 504) video];
  BOOL v5 = shouldUseSkinnyWidth(v11, v12, v13, v14, v8);

  return v5;
}

uint64_t __52__LPLinkView__layoutLinkViewForSize_applyingLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_lp_setNeedsLayout");
}

- (CGRect)_primaryCaptionBarFrame
{
  double v3 = [(LPLinkViewComponents *)self->_components captionBar];

  if (v3)
  {
    BOOL v4 = [(LPLinkViewComponents *)self->_components captionBar];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [(LPLinkViewComponents *)self->_components captionBar];
    -[LPLinkView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB20];
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)_playable
{
  double v3 = [(LPLinkViewComponents *)self->_components media];
  int v4 = [v3 conformsToProtocol:&unk_1EF71E788];

  components = self->_components;
  if (v4) {
    [(LPLinkViewComponents *)components media];
  }
  else {
  double v6 = [(LPLinkViewComponents *)components captionBar];
  }
  double v7 = [v6 playable];

  return v7;
}

- (void)_playMedia
{
  id v2 = [(LPLinkView *)self _playable];
  [v2 setPlaying:1];
}

- (void)_pauseMedia
{
  id v2 = [(LPLinkView *)self _playable];
  [v2 setPlaying:0];
}

- (BOOL)_isPlayingMedia
{
  id v2 = [(LPLinkView *)self _playable];
  char v3 = [v2 isPlaying];

  return v3;
}

- (BOOL)_hasMediaToPlay
{
  id v2 = [(LPLinkView *)self _playable];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_resetMediaPlayback
{
  id v2 = [(LPLinkView *)self _playable];
  [v2 resetPlaybackState];
}

- (id)_primaryMediaView
{
  BOOL v3 = [(LPLinkViewComponents *)self->_components media];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(LPLinkViewComponents *)self->_components captionBar];
    id v5 = [v6 primaryIconView];
  }

  return v5;
}

- (void)_animateWithDuration:(double)a3 animations:(id)a4
{
}

- (void)componentViewDidChangeMediaState:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__LPLinkView_componentViewDidChangeMediaState___block_invoke;
  v3[3] = &unk_1E5B04DF0;
  v3[4] = self;
  [(LPLinkView *)self _animateWithDuration:v3 animations:0.2];
}

void __47__LPLinkView_componentViewDidChangeMediaState___block_invoke(uint64_t a1)
{
  v1 = (id *)a1;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 584) contactsBadge];

  if (v2)
  {
    id v5 = [*((id *)v1[4] + 73) contactsBadge];
    int v3 = [v1[4] _isPlayingMedia];
    if (v3)
    {
      v1 = [v1[4] _playable];
      int v4 = [v1 hasMuteControl];
    }
    else
    {
      int v4 = 0;
    }
    objc_msgSend(v5, "_lp_setOpacity:", (double)(v4 ^ 1u));
    if (v3) {
  }
    }
}

- (id)layoutExclusionsForView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [(LPLinkViewComponents *)self->_components contactsBadge];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1E4FB14C0];
    double v8 = [(LPLinkViewComponents *)self->_components contactsBadge];
    double v9 = [(LPLinkViewComponents *)self->_components contactsBadge];
    [v9 layoutExclusionRect];
    objc_msgSend(v8, "convertRect:toView:", v4);
    double v10 = objc_msgSend(v7, "bezierPathWithRect:");
    [v5 addObject:v10];
  }
  double v11 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];

  if (v11)
  {
    double v12 = [(LPLinkViewComponents *)self->_components mediaTopCaptionBar];
    double v13 = [v12 layoutExclusionsForView:v4];
    [v5 addObjectsFromArray:v13];
  }
  double v14 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];

  if (v14)
  {
    double v15 = [(LPLinkViewComponents *)self->_components mediaBottomCaptionBar];
    double v16 = [v15 layoutExclusionsForView:v4];
    [v5 addObjectsFromArray:v16];
  }
  if ([v5 count]) {
    id v17 = v5;
  }
  else {
    id v17 = 0;
  }

  return v17;
}

- (int64_t)rendererStyleForComponentView:(id)a3
{
  return [(LPWebLinkPresentationProperties *)self->_properties style];
}

- (BOOL)allowsVibrancyForComponentView:(id)a3
{
  BOOL result = !self->_useCPURenderingForMaterials
        && ([(LPLinkView *)self _themePlatform] != 5
         || ([(LPLinkView *)self traitCollection],
             id v5 = objc_claimAutoreleasedReturnValue(),
             uint64_t v6 = [v5 userInterfaceStyle],
             v5,
             v6 == 2))
        && self->_backgroundColorSupportsVibrancy;
  return result;
}

- (BOOL)allowsBadgingIconEdgeForComponentView:(id)a3
{
  id v4 = [(LPTheme *)self->_theme contactsBadgeStyle];
  BOOL v5 = [v4 location] != 1 || -[NSArray count](self->_contactsForAttribution, "count") == 0;

  return v5;
}

- (BOOL)showingDisclosureViewForComponentView:(id)a3
{
  return self->_showingDisclosureView;
}

- (BOOL)allowsAsynchronousImageDecodingForComponentView:(id)a3
{
  return self->_allowsAsynchronousImageDecoding;
}

- (BOOL)usesBackgroundForSymbolImagesForComponentView:(id)a3
{
  return sizeClassRequiresLeadingIcon(self->_effectiveSizeClass);
}

- (void)_installHighlightGestureRecognizers
{
  int v3 = [(LPLinkViewComponents *)self->_components captionBar];

  if (v3)
  {
    id v8 = [(LPLinkViewComponents *)self->_components captionBar];
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");
  }
  id v4 = [(LPLinkViewComponents *)self->_components media];

  if (v4)
  {
    id v9 = [(LPLinkViewComponents *)self->_components media];
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");
  }
  BOOL v5 = [(LPLinkViewComponents *)self->_components domainNameIndicator];

  if (v5)
  {
    id v10 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");
  }
  uint64_t v6 = [(LPLinkViewComponents *)self->_components quote];

  if (v6)
  {
    id v11 = [(LPLinkViewComponents *)self->_components quote];
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");
  }
  double v7 = [(LPLinkViewComponents *)self->_components progressSpinner];

  if (v7)
  {
    id v12 = [(LPLinkViewComponents *)self->_components progressSpinner];
    -[LPLinkView _addHighlightRecognizerToView:forMedia:](self, "_addHighlightRecognizerToView:forMedia:");
  }
}

- (void)_installTapGestureRecognizers
{
  int v3 = [(LPLinkViewComponents *)self->_components captionBar];

  if (v3)
  {
    id v11 = [(LPLinkViewComponents *)self->_components captionBar];
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");
  }
  uint64_t v4 = [(LPLinkViewComponents *)self->_components media];
  if (v4)
  {
    id v12 = (id)v4;
    BOOL v5 = [(LPLinkViewComponents *)self->_components media];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      uint64_t v6 = [(LPLinkViewComponents *)self->_components media];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_8;
      }
    }
    id v13 = [(LPLinkViewComponents *)self->_components media];
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");
  }
LABEL_8:
  id v8 = [(LPLinkViewComponents *)self->_components domainNameIndicator];

  if (v8)
  {
    id v14 = [(LPLinkViewComponents *)self->_components domainNameIndicator];
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");
  }
  id v9 = [(LPLinkViewComponents *)self->_components quote];

  if (v9)
  {
    id v15 = [(LPLinkViewComponents *)self->_components quote];
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");
  }
  id v10 = [(LPLinkViewComponents *)self->_components progressSpinner];

  if (v10)
  {
    id v16 = [(LPLinkViewComponents *)self->_components progressSpinner];
    -[LPLinkView _addTapRecognizerToView:forMedia:](self, "_addTapRecognizerToView:forMedia:");
  }
}

- (void)_uninstallHighlightGestureRecognizers
{
  for (i = self->_highlightGestureRecognizers; [(NSMutableArray *)i count]; i = self->_highlightGestureRecognizers)
  {
    uint64_t v4 = [(NSMutableArray *)self->_highlightGestureRecognizers lastObject];
    BOOL v5 = [v4 view];
    [v5 removeGestureRecognizer:v4];

    [(NSMutableArray *)self->_highlightGestureRecognizers removeLastObject];
  }
}

- (void)_uninstallTapGestureRecognizers
{
  for (i = self->_tapGestureRecognizers; [(NSMutableArray *)i count]; i = self->_tapGestureRecognizers)
  {
    uint64_t v4 = [(NSMutableArray *)self->_tapGestureRecognizers lastObject];
    BOOL v5 = [v4 view];
    [v5 removeGestureRecognizer:v4];

    [(NSMutableArray *)self->_tapGestureRecognizers removeLastObject];
  }
}

- (void)_rebuildGestureRecognizersIfNeeded
{
  BOOL v3 = [(NSMutableArray *)self->_highlightGestureRecognizers count] != 0;
  if (((v3 ^ [(LPLinkView *)self _disableHighlightGesture]) & 1) == 0)
  {
    if ([(LPLinkView *)self _disableHighlightGesture]) {
      [(LPLinkView *)self _uninstallHighlightGestureRecognizers];
    }
    else {
      [(LPLinkView *)self _installHighlightGestureRecognizers];
    }
  }
  if (([(NSMutableArray *)self->_tapGestureRecognizers count] == 0) == !self->_disableTapGesture)
  {
    if (self->_disableTapGesture) {
      [(LPLinkView *)self _uninstallTapGestureRecognizers];
    }
    else {
      [(LPLinkView *)self _installTapGestureRecognizers];
    }
  }
  BOOL v4 = self->_contextMenuInteraction != 0;
  if (((v4 ^ [(LPLinkView *)self _disablePreviewGesture]) & 1) == 0)
  {
    if ([(LPLinkView *)self _disablePreviewGesture])
    {
      [(LPLinkView *)self _uninstallPreviewGestureRecognizer];
    }
    else
    {
      [(LPLinkView *)self _installPreviewGestureRecognizer];
    }
  }
}

- (void)_setDisableTapGesture:(BOOL)a3
{
  if (self->_disableTapGesture != a3)
  {
    self->_disableTapGesture = a3;
    [(LPLinkView *)self _rebuildGestureRecognizersIfNeeded];
    [(UIView *)self->_animationView _lp_setHoverEffectEnabled:!self->_disableTapGesture];
    [(LPLinkView *)self _invalidatePresentationPropertiesAndLayout];
  }
}

- (void)_setDisableHighlightGesture:(BOOL)a3
{
  self->_hasSetDisableHighlightGesture = 1;
  if (self->_disableHighlightGesture != a3)
  {
    self->_disableHighlightGesture = a3;
    [(LPLinkView *)self _rebuildGestureRecognizersIfNeeded];
  }
}

- (BOOL)_disableHighlightGesture
{
  if (self->_hasSetDisableHighlightGesture) {
    id v2 = &OBJC_IVAR___LPLinkView__disableHighlightGesture;
  }
  else {
    id v2 = &OBJC_IVAR___LPLinkView__disableTapGesture;
  }
  return *((unsigned char *)&self->super.super.super.isa + *v2);
}

- (void)_setDisablePreviewGesture:(BOOL)a3
{
  self->_hasSetDisablePreviewGesture = 1;
  if (self->_disablePreviewGesture != a3)
  {
    self->_disablePreviewGesture = a3;
    [(LPLinkView *)self _rebuildGestureRecognizersIfNeeded];
  }
}

- (BOOL)_disablePreviewGesture
{
  if (!sizeClassAllowsProgressSpinner(self->_effectiveSizeClass)
    || +[LPApplicationIdentification isMobileReminders])
  {
    return 1;
  }
  if (self->_hasSetDisablePreviewGesture) {
    BOOL v4 = &OBJC_IVAR___LPLinkView__disablePreviewGesture;
  }
  else {
    BOOL v4 = &OBJC_IVAR___LPLinkView__disableTapGesture;
  }
  return *((unsigned char *)&self->super.super.super.isa + *v4) != 0;
}

- (void)_addTapRecognizerToView:(id)a3 forMedia:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4FB1D38]);
  double v7 = &selRef__mediaTapRecognized_;
  if (!v4) {
    double v7 = &selRef__captionTapRecognized_;
  }
  id v8 = (void *)[v6 initWithTarget:self action:*v7];
  [v8 _setDelaysRecognitionForGreaterTapCounts:1];
  [v8 setName:@"LPLinkViewTap"];
  [v9 addGestureRecognizer:v8];
  [(NSMutableArray *)self->_tapGestureRecognizers addObject:v8];
}

- (void)_addHighlightRecognizerToView:(id)a3 forMedia:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [LPHighlightGestureRecognizer alloc];
  double v7 = &selRef__mediaHighlightRecognized_;
  if (!v4) {
    double v7 = &selRef__captionHighlightRecognized_;
  }
  id v8 = [(LPHighlightGestureRecognizer *)v6 initWithTarget:self action:*v7];
  [(LPHighlightGestureRecognizer *)v8 setDelegate:self];
  [(LPHighlightGestureRecognizer *)v8 setName:@"LPLinkViewHighlight"];
  [v9 addGestureRecognizer:v8];
  [(NSMutableArray *)self->_highlightGestureRecognizers addObject:v8];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  BOOL v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [v5 view];
  double v7 = [(LPLinkViewComponents *)self->_components media];
  if (![v6 isDescendantOfView:v7]) {
    goto LABEL_5;
  }
  id v8 = [(LPLinkViewComponents *)self->_components media];
  if (![v8 shouldAllowHighlightToRecognizeSimultaneouslyWithGesture:v5]
    || self->_disablePlayback)
  {

LABEL_5:
    goto LABEL_6;
  }
  BOOL disablePlaybackControls = self->_disablePlaybackControls;

  if (!disablePlaybackControls) {
    goto LABEL_12;
  }
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_12:
    LOBYTE(v10) = 0;
    goto LABEL_13;
  }
  id v9 = [v5 view];
  if ([v9 isDescendantOfView:self]) {
    int v10 = [(NSMutableArray *)self->_tapGestureRecognizers containsObject:v5] ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

LABEL_13:
  return v10;
}

- (void)_cancelActiveHighlight
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_highlightGestureRecognizers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(v6, "setEnabled:", 0, (void)v7);
        [v6 setEnabled:1];
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_setHighlightMedia:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  char v5 = [v7 shouldHighlightIndependently];

  BOOL v6 = !v3;
  if ((v5 & 1) == 0)
  {
    id v8 = [(UIView *)self->_captionHighlightView layer];
    [v8 setHidden:v6];
  }
  id v9 = [(UIView *)self->_mediaHighlightView layer];
  [v9 setHidden:v6];
}

- (void)_setHighlightCaption:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(LPWebLinkPresentationProperties *)self->_properties captionBar];
  char v5 = [v7 shouldHighlightIndependently];

  BOOL v6 = !v3;
  if ((v5 & 1) == 0)
  {
    id v8 = [(UIView *)self->_mediaHighlightView layer];
    [v8 setHidden:v6];
  }
  id v9 = [(UIView *)self->_captionHighlightView layer];
  [v9 setHidden:v6];
}

- (void)_mediaHighlightRecognized:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(LPLinkView *)self _setHighlightMedia:v5];
LABEL_6:
}

- (void)_captionHighlightRecognized:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(LPLinkView *)self _setHighlightCaption:v5];
LABEL_6:
}

- (void)_mediaTapRecognized:(id)a3
{
  if (!self->_disableTapGesture) {
    [(LPLinkView *)self _openURL];
  }
}

- (void)_captionTapRecognized:(id)a3
{
  if (!self->_disableTapGesture) {
    [(LPLinkView *)self _openURLAllowingSensitiveSchemes:self->_allowsOpeningSensitiveURLs allowingAssociatedApplications:1];
  }
}

- (void)_captionBarButtonPressed:(id)a3
{
  id v7 = [(LPConcretePresentationProperties *)self->_properties captionButton];
  -[LPLinkView componentViewDidTapCaptionButton:buttonType:](self, "componentViewDidTapCaptionButton:buttonType:", self, [v7 type]);

  id v8 = [(LPConcretePresentationProperties *)self->_properties captionButton];
  uint64_t v4 = [v8 callback];

  if (v4)
  {
    id v9 = [(LPConcretePresentationProperties *)self->_properties captionButton];
    uint64_t v5 = [v9 callback];
    v5[2]();
  }
  else if (!self->_disableTapGesture)
  {
    BOOL allowsOpeningSensitiveURLs = self->_allowsOpeningSensitiveURLs;
    [(LPLinkView *)self _openURLAllowingSensitiveSchemes:allowsOpeningSensitiveURLs allowingAssociatedApplications:1];
  }
}

- (void)tapToLoadViewWasTapped:(id)a3
{
  if (![(NSHashTable *)self->_pendingMetadataProviders count])
  {
    id v4 = [(NSURL *)self->_URL _lp_requestWithAttribution:1];
    -[LPLinkView _fetchMetadataForRequest:](self, "_fetchMetadataForRequest:");
  }
}

- (BOOL)_isUsingAppClipPresentation
{
  if ([(LPWebLinkPresentationProperties *)self->_properties style] != 41) {
    return 0;
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  BOOL v3 = (void *)getCPSClipURLClass_softClass_0;
  uint64_t v13 = getCPSClipURLClass_softClass_0;
  if (!getCPSClipURLClass_softClass_0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getCPSClipURLClass_block_invoke_0;
    v9[3] = &unk_1E5B04EB8;
    v9[4] = &v10;
    __getCPSClipURLClass_block_invoke_0((uint64_t)v9);
    BOOL v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  if (![v4 isSupported]) {
    return 0;
  }
  uint64_t v5 = [(LPLinkMetadata *)self->_metadata associatedApplication];
  id v6 = [v5 bundleIdentifier];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)_openURL
{
}

- (void)_openURLAllowingSensitiveSchemes:(BOOL)a3 allowingAssociatedApplications:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (![(LPLinkView *)self _disableLinkFollowing])
  {
    overrideAllowsOpeningSensitiveURLs = self->_overrideAllowsOpeningSensitiveURLs;
    if (overrideAllowsOpeningSensitiveURLs) {
      a3 = [(NSNumber *)overrideAllowsOpeningSensitiveURLs BOOLValue];
    }
    id v8 = [(LPLinkView *)self metadata];
    id v9 = [v8 originatingSynapseContentItem];

    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4FA9240] sharedManager];
      id v11 = [(LPLinkView *)self metadata];
      uint64_t v12 = [v11 originatingSynapseContentItem];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke;
      v43[3] = &unk_1E5B067F0;
      v43[4] = self;
      [v10 navigateToContentItem:v12 completion:v43];

      return;
    }
    if (self->_URL)
    {
      uint64_t v13 = +[LPPresentationSpecializations URLToOpenForURL:](LPPresentationSpecializations, "URLToOpenForURL:");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v15 = [(LPLinkMetadata *)self->_metadata specialization];
        char v16 = [v15 _disallowsURLOverrideByDelegate];

        if ((v16 & 1) == 0)
        {
          id v17 = [WeakRetained _linkView:self overrideURLForOpeningURL:v13];

          if (!v17)
          {
            double v34 = LPLogChannelUI();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int loggingID = self->_loggingID;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = loggingID;
              _os_log_impl(&dword_1A35DC000, v34, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: delegate handled openURL", buf, 8u);
            }
            goto LABEL_27;
          }
          if (([v17 isEqual:self->_URL] & 1) == 0)
          {
            double v18 = LPLogChannelUI();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v19 = self->_loggingID;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v19;
              _os_log_impl(&dword_1A35DC000, v18, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: delegate overrode link to open", buf, 8u);
            }
          }
          uint64_t v13 = v17;
        }
      }
      if (objc_opt_respondsToSelector()) {
        [WeakRetained _linkView:self willOpenURL:v13];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_328;
      aBlock[3] = &unk_1E5B06818;
      BOOL v42 = a3;
      id v20 = v13;
      id v41 = v20;
      double v21 = (void (**)(void))_Block_copy(aBlock);
      if (v4 && [(LPLinkView *)self _isUsingAppClipPresentation])
      {
        double v22 = LPLogChannelUI();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = self->_loggingID;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v23;
          _os_log_impl(&dword_1A35DC000, v22, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: attempting to follow an App Clip link", buf, 8u);
        }
        uint64_t v44 = 0;
        double v45 = &v44;
        uint64_t v46 = 0x2050000000;
        double v24 = (void *)getCPSClipRequestClass_softClass;
        uint64_t v47 = getCPSClipRequestClass_softClass;
        if (!getCPSClipRequestClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v49 = 3221225472;
          id v50 = __getCPSClipRequestClass_block_invoke;
          double v51 = &unk_1E5B04EB8;
          double v52 = &v44;
          __getCPSClipRequestClass_block_invoke((uint64_t)buf);
          double v24 = (void *)v45[3];
        }
        double v25 = v24;
        _Block_object_dispose(&v44, 8);
        id v26 = [v25 alloc];
        double v27 = [(LPLinkMetadata *)self->_metadata URL];
        URL = v27;
        if (!v27) {
          URL = self->_URL;
        }
        double v29 = [(LPLinkMetadata *)self->_metadata associatedApplication];
        uint64_t v30 = [v29 bundleIdentifier];
        double v31 = (void *)[v26 initWithURL:URL fallbackClipBundleID:v30];

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_331;
        v36[3] = &unk_1E5B06840;
        id v37 = v31;
        double v38 = self;
        double v39 = v21;
        id v32 = v31;
        [v32 requestClipWithCompletion:v36];
      }
      else
      {
        v21[2](v21);
      }

LABEL_27:
      return;
    }
    v33 = LPLogChannelUI();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[LPLinkView _openURLAllowingSensitiveSchemes:allowingAssociatedApplications:]((uint64_t)self, v33);
    }
  }
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = LPLogChannelUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_328(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
  }
  else
  {
    id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:0];
  }
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_331(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v5 || !a2)
  {
    id v9 = LPLogChannelUI();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(_DWORD *)(*(void *)(a1 + 40) + 408);
      int v11 = 67109120;
      int v12 = v10;
      _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: falling back from App Clip link to openURL", (uint8_t *)&v11, 8u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    BOOL v7 = LPLogChannelUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(*(void *)(a1 + 40) + 408);
      int v11 = 67109120;
      int v12 = v8;
      _os_log_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_DEFAULT, "LPLinkView<%d>: successfully followed an App Clip link", (uint8_t *)&v11, 8u);
    }
  }
}

- (void)_installPreviewGestureRecognizer
{
  if (self->_animationView)
  {
    BOOL v3 = (UIContextMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    contextMenuInteraction = self->_contextMenuInteraction;
    self->_contextMenuInteraction = v3;

    animationView = self->_animationView;
    id v6 = self->_contextMenuInteraction;
    [(UIView *)animationView addInteraction:v6];
  }
}

- (void)_uninstallPreviewGestureRecognizer
{
  [(UIView *)self->_animationView removeInteraction:self->_contextMenuInteraction];
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = 0;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  int v8 = -[LPLinkView hitTest:withEvent:](self, "hitTest:withEvent:", 0, x, y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2050000000;
    int v11 = (void *)getDDContextMenuActionClass_softClass;
    uint64_t v43 = getDDContextMenuActionClass_softClass;
    if (!getDDContextMenuActionClass_softClass)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      id v37 = __getDDContextMenuActionClass_block_invoke;
      double v38 = &unk_1E5B04EB8;
      double v39 = &v40;
      __getDDContextMenuActionClass_block_invoke((uint64_t)&v35);
      int v11 = (void *)v41[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v40, 8);
    [(UIView *)self->_animationView bounds];
    uint64_t v13 = objc_msgSend(v12, "updateContext:withSourceRect:", 0);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v15 = [WeakRetained _contextMenuActionsForLinkView:self];
      char v16 = (void *)[v15 copy];

      id v17 = (void *)[v13 mutableCopy];
      uint64_t v40 = 0;
      id v41 = &v40;
      uint64_t v42 = 0x2020000000;
      double v18 = (void *)getkDDContextMenuActionsKeySymbolLoc_ptr;
      uint64_t v43 = getkDDContextMenuActionsKeySymbolLoc_ptr;
      if (!getkDDContextMenuActionsKeySymbolLoc_ptr)
      {
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        id v37 = __getkDDContextMenuActionsKeySymbolLoc_block_invoke;
        double v38 = &unk_1E5B04EB8;
        double v39 = &v40;
        unsigned int v19 = DataDetectorsUILibrary();
        id v20 = dlsym(v19, "kDDContextMenuActionsKey");
        *(void *)(v39[1] + 24) = v20;
        getkDDContextMenuActionsKeySymbolLoc_ptr = *(void *)(v39[1] + 24);
        double v18 = (void *)v41[3];
      }
      _Block_object_dispose(&v40, 8);
      if (!v18)
      {
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        double v34 = [NSString stringWithUTF8String:"NSString *getkDDContextMenuActionsKey(void)"];
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"LPLinkView.m", 103, @"%s", dlerror());
        goto LABEL_24;
      }
      [v17 setObject:v16 forKey:*v18];
      uint64_t v21 = [v17 copy];

      uint64_t v13 = (void *)v21;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_15:
      double v29 = [(LPLinkView *)self URL];
      uint64_t v30 = [v12 contextMenuConfigurationWithURL:v29 inView:self->_animationView context:v13 menuIdentifier:0];

      if (objc_opt_respondsToSelector())
      {
        id v31 = [WeakRetained _linkView:self contextMenuConfigurationForSuggestedConfiguration:v30];
      }
      else
      {
        id v31 = v30;
      }
      int v10 = v31;

      goto LABEL_19;
    }
    uint64_t v22 = [WeakRetained _wantsContextMenuPreviewForLinkView:self];
    unsigned int v23 = (void *)[v13 mutableCopy];
    double v24 = [NSNumber numberWithBool:v22];
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x2020000000;
    double v25 = (void *)getkDDContextMenuWantsPreviewKeySymbolLoc_ptr;
    uint64_t v43 = getkDDContextMenuWantsPreviewKeySymbolLoc_ptr;
    if (!getkDDContextMenuWantsPreviewKeySymbolLoc_ptr)
    {
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      id v37 = __getkDDContextMenuWantsPreviewKeySymbolLoc_block_invoke;
      double v38 = &unk_1E5B04EB8;
      double v39 = &v40;
      id v26 = DataDetectorsUILibrary();
      double v27 = dlsym(v26, "kDDContextMenuWantsPreviewKey");
      *(void *)(v39[1] + 24) = v27;
      getkDDContextMenuWantsPreviewKeySymbolLoc_ptr = *(void *)(v39[1] + 24);
      double v25 = (void *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (v25)
    {
      [v23 setObject:v24 forKey:*v25];

      uint64_t v28 = [v23 copy];
      uint64_t v13 = (void *)v28;
      goto LABEL_15;
    }
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    double v34 = [NSString stringWithUTF8String:"NSString *getkDDContextMenuWantsPreviewKey(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"LPLinkView.m", 105, @"%s", dlerror());
LABEL_24:

    __break(1u);
    return result;
  }
  int v10 = 0;
LABEL_19:

  return v10;
}

- (BOOL)_disableAnimations
{
  return self->_disableAnimations;
}

- (void)_setDisableAnimations:(BOOL)a3
{
  self->_disableAnimations = a3;
}

- (BOOL)_needsMessagesTranscriptPushCounterAnimation
{
  return self->_needsMessagesTranscriptPushCounterAnimation;
}

- (void)_setNeedsMessagesTranscriptPushCounterAnimation:(BOOL)a3
{
  self->_needsMessagesTranscriptPushCounterAnimation = a3;
}

- (BOOL)_disableTapGesture
{
  return self->_disableTapGesture;
}

- (BOOL)_disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)_setDisableAutoPlay:(BOOL)a3
{
  self->_disableAutoPladouble y = a3;
}

- (BOOL)_allowsLoadingMediaWithAutoPlayDisabled
{
  return self->_allowsLoadingMediaWithAutoPlayDisabled;
}

- (void)_setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3
{
  self->_allowsLoadingMediaWithAutoPlayDisabled = a3;
}

- (BOOL)_disablePlayback
{
  return self->_disablePlayback;
}

- (void)_setDisablePlayback:(BOOL)a3
{
  self->_disablePlayback = a3;
}

- (BOOL)_disablePlaybackControls
{
  return self->_disablePlaybackControls;
}

- (void)_setDisablePlaybackControls:(BOOL)a3
{
  self->_BOOL disablePlaybackControls = a3;
}

- (int64_t)_animationOrigin
{
  return self->_animationOrigin;
}

- (BOOL)_allowsTapToLoad
{
  return self->_allowsTapToLoad;
}

- (BOOL)_usesDeferredLayout
{
  return self->_usesDeferredLayout;
}

- (void)_setUsesDeferredLayout:(BOOL)a3
{
  self->_usesDeferredLayout = a3;
}

- (BOOL)_forceFlexibleWidth
{
  return self->_forceFlexibleWidth;
}

- (void)_setForceFlexibleWidth:(BOOL)a3
{
  self->_forceFlexibleWidth = a3;
}

- (BOOL)_applyCornerRadius
{
  return self->_applyCornerRadius;
}

- (UIEdgeInsets)_textSafeAreaInset
{
  double top = self->_textSafeAreaInset.top;
  double left = self->_textSafeAreaInset.left;
  double bottom = self->_textSafeAreaInset.bottom;
  double right = self->_textSafeAreaInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSURL)_overrideURL
{
  return self->_overrideURL;
}

- (unint64_t)_preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (NSString)_sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSRegularExpression)_emphasizedTextExpression
{
  return self->_emphasizedTextExpression;
}

- (UIColor)_overrideBackgroundColor
{
  return self->_overrideBackgroundColor;
}

- (UIColor)_overrideMediaBackgroundColor
{
  return self->_overrideMediaBackgroundColor;
}

- (UIColor)_underlyingBackgroundColor
{
  return self->_underlyingBackgroundColor;
}

- (UIColor)_overrideActionButtonColor
{
  return self->_overrideActionButtonColor;
}

- (UIColor)_overrideSubtitleButtonColor
{
  return self->_overrideSubtitleButtonColor;
}

- (BOOL)_allowsOpeningSensitiveURLs
{
  return self->_allowsOpeningSensitiveURLs;
}

- (void)_setAllowsOpeningSensitiveURLs:(BOOL)a3
{
  self->_BOOL allowsOpeningSensitiveURLs = a3;
}

- (NSArray)_contactsForAttribution
{
  return self->_contactsForAttribution;
}

- (BOOL)_isHighlightedForAttribution
{
  return self->_highlightedForAttribution;
}

- (LPImage)_lastResortIcon
{
  return self->_lastResortIcon;
}

- (BOOL)_inComposeContext
{
  return self->_inComposeContext;
}

- (BOOL)_inSenderContext
{
  return self->_inSenderContext;
}

- (BOOL)_isCollaborative
{
  return self->_collaborative;
}

- (LPLinkRendererSizeClassParameters)_sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (unint64_t)_bytesLoaded
{
  return self->_bytesLoaded;
}

- (BOOL)_isShowingDisclosureView
{
  return self->_showingDisclosureView;
}

- (BOOL)_allowsAsynchronousImageDecoding
{
  return self->_allowsAsynchronousImageDecoding;
}

- (void)_setAllowsAsynchronousImageDecoding:(BOOL)a3
{
  self->_allowsAsynchronousImageDecoding = a3;
}

- (BOOL)_allowsSkinnyWidth
{
  return self->_allowsSkinnyWidth;
}

- (void)_setAllowsSkinnyWidth:(BOOL)a3
{
  self->_allowsSkinnyWidth = a3;
}

- (NSNumber)_selectedVariantIndex
{
  return self->_selectedVariantIndex;
}

- (LPImage)_mediaOverlayIcon
{
  return self->_mediaOverlayIcon;
}

- (BOOL)_maskEnabled
{
  return self->_maskEnabled;
}

- (UITraitCollection)_effectiveTraitCollection
{
  return self->_effectiveTraitCollection;
}

- (LPLinkViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPLinkViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)_disableLinkFollowing
{
  return self->__disableLinkFollowing;
}

- (void)_setDisableLinkFollowing:(BOOL)a3
{
  self->__disableLinkFollowing = a3;
}

- (BOOL)_useLowMemoryImageFilters
{
  return self->__useLowMemoryImageFilters;
}

- (void)_setUseLowMemoryImageFilters:(BOOL)a3
{
  self->__useLowMemoryImageFilters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectiveTraitCollection, 0);
  objc_storeStrong((id *)&self->_mediaOverlayIcon, 0);
  objc_storeStrong((id *)&self->_selectedVariantIndex, 0);
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
  objc_storeStrong((id *)&self->_lastResortIcon, 0);
  objc_storeStrong((id *)&self->_contactsForAttribution, 0);
  objc_storeStrong((id *)&self->_overrideSubtitleButtonColor, 0);
  objc_storeStrong((id *)&self->_underlyingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_emphasizedTextExpression, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_animationMaskView, 0);
  objc_storeStrong((id *)&self->_overrideAllowsOpeningSensitiveURLs, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_componentsForSizing, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_collaborationFooter, 0);
  objc_storeStrong((id *)&self->_overrideSubtitle, 0);
  objc_storeStrong((id *)&self->_overrideActionButtonColor, 0);
  objc_storeStrong((id *)&self->_overrideMediaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_captionTextButton, 0);
  objc_storeStrong((id *)&self->_captionButton, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_mediaHighlightView, 0);
  objc_storeStrong((id *)&self->_captionHighlightView, 0);
  objc_storeStrong((id *)&self->_highlightGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_multipleURLs, 0);
  objc_storeStrong((id *)&self->_multipleMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_pendingMetadataProviders, 0);
}

- (void)_openURLAllowingSensitiveSchemes:(uint64_t)a1 allowingAssociatedApplications:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 408);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPLinkView<%d>: opening a link that has nil URL", (uint8_t *)v3, 8u);
}

void __78__LPLinkView__openURLAllowingSensitiveSchemes_allowingAssociatedApplications___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(*(void *)(a1 + 32) + 408);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A35DC000, log, OS_LOG_TYPE_ERROR, "LPLinkView<%d>: opening a SYContentItem has failed: %@ ", (uint8_t *)v4, 0x12u);
}

@end