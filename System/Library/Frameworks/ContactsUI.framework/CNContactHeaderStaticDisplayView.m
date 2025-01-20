@interface CNContactHeaderStaticDisplayView
+ (BOOL)_bundleIDIsInAllowListForColorCaching;
+ (BOOL)_colorCachingEnabledForProcess;
+ (id)blurGradient;
+ (id)contactHeaderViewWithContact:(id)a3 allowsPhotoDrops:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7;
+ (id)contactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6;
+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3;
+ (id)makeBlurGradient;
+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5;
+ (id)sizeAttributesShowingNavBar:(BOOL)a3;
- (BOOL)allowsPickerActions;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canSensitiveContentHelpButtonBlockContact:(id)a3;
- (BOOL)canSensitiveContentHelpButtonViewHidePhoto:(id)a3;
- (BOOL)identifierForBackgroundColorIsCurrent:(id)a3;
- (BOOL)isDowntimeContact;
- (BOOL)isEmergencyContact;
- (BOOL)isRestrictedContact;
- (BOOL)shouldShowGemini;
- (BOOL)shouldShowPoster;
- (BOOL)shouldUseFixedHeight;
- (BOOL)usesBrandedCallFormat;
- (CAGradientLayer)avatarBackgroundGradientLayer;
- (CGRect)layerContentsRectForConfiguration:(id)a3;
- (CNContactActionsContainerView)actionsWrapperView;
- (CNContactDowntimeView)downtimeView;
- (CNContactFormatter)contactFormatter;
- (CNContactGeminiIconProvider)geminiIconProvider;
- (CNContactGeminiView)geminiView;
- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8;
- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7;
- (CNGeminiPickerController)geminiPicker;
- (CNGeminiResult)geminiResult;
- (CNMetricsUIReporter)metricsReporter;
- (CNPRSPosterConfiguration)cachedPosterConfiguration;
- (CNSensitiveContentAnalysisManager)sensitiveContentManager;
- (CNSensitiveContentHelpButtonView)sensitiveContentHelpButton;
- (NSDictionary)importantTextAttributes;
- (NSDictionary)taglineTextAttributes;
- (NSString)alternateName;
- (NSString)currentlyDisplayedPosterContactIdentifier;
- (NSString)importantMessage;
- (NSString)message;
- (UILabel)importantLabel;
- (UILabel)taglineLabel;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)avatarBackgroundView;
- (UIView)personHeaderView;
- (UIVisualEffectView)blurView;
- (double)avatarHeightPhoneLandscape;
- (double)bottomMargin;
- (double)height;
- (double)labelsHeight;
- (double)nameFontSize;
- (double)staticHeaderPhotoMaxHeight;
- (double)staticHeaderPhotoMinBottomMargin;
- (double)staticHeaderPhotoMinHeight;
- (double)staticHeaderPhotoMinTopMargin;
- (double)staticHeaderPhotoTopMarginOffset;
- (id)_headerStringForContacts:(id)a3;
- (id)_importantString;
- (id)_unknownContactActionForGeminiView;
- (id)attributedTaglineForContacts:(id)a3;
- (id)descriptorForRequiredKeys;
- (id)downtimeTextAttributes;
- (id)geminiTextAttributes;
- (id)imageDataForColorFetchingIsImageDataOrThumbnail:(BOOL *)a3 bitmapFormat:(id *)a4;
- (id)nameFont;
- (unint64_t)avatarStyle;
- (void)_assignActionToGeminiView;
- (void)_geminiViewBehaviorForSavedContact;
- (void)_geminiViewBehaviorForUnknownContact;
- (void)_updateDowntimeView;
- (void)_updateImportantLabel;
- (void)_updatePhotoView;
- (void)assignImageColorsToAvatarBackgroundView:(id)a3 animated:(BOOL)a4;
- (void)assignSnapshotImageToPosterView:(id)a3 configuration:(id)a4 contentIsSensitive:(BOOL)a5;
- (void)calculateLabelSizes;
- (void)calculateLabelSizesIfNeeded;
- (void)configureSensitiveContentHelpButtonHidden:(BOOL)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)copy:(id)a3;
- (void)createGeminiViewIfNeeded;
- (void)dealloc;
- (void)didFinishUsing;
- (void)didTapSensitiveContentHelpButton;
- (void)disablePhotoTapGesture;
- (void)geminiViewDidPickPreferredChannel:(id)a3;
- (void)handleGeminiViewTouch:(id)a3;
- (void)handleNameLabelLongPress:(id)a3;
- (void)handleNameLabelTap:(id)a3;
- (void)layoutSubviews;
- (void)menuWillHide:(id)a3;
- (void)notifyDelegateOfUpdatedHiddenSensitiveContent:(BOOL)a3;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)sensitiveContentBlurView:(id)a3 didSetContentHidden:(BOOL)a4;
- (void)sensitiveContentBlurView:(id)a3 wantsToPresentInterventionController:(id)a4;
- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToBlockContact:(BOOL)a4;
- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMenu:(id)a4;
- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMoreHelp:(id)a4;
- (void)sensitiveContentHelpButtonView:(id)a3 didSetContentHidden:(BOOL)a4;
- (void)setActionsWrapperView:(id)a3;
- (void)setAllowsPickerActions:(BOOL)a3;
- (void)setAlternateName:(id)a3;
- (void)setAvatarBackgroundGradientLayer:(id)a3;
- (void)setAvatarBackgroundView:(id)a3;
- (void)setAvatarStyle:(unint64_t)a3;
- (void)setBlurView:(id)a3;
- (void)setBlurViewGradient;
- (void)setCachedPosterConfiguration:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setCurrentlyDisplayedPosterContactIdentifier:(id)a3;
- (void)setDefaultLabelColors;
- (void)setDowntimeTextAttributes:(id)a3;
- (void)setDowntimeView:(id)a3;
- (void)setGeminiPicker:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)setGeminiTextAttributes:(id)a3;
- (void)setGeminiView:(id)a3;
- (void)setImportantLabel:(id)a3;
- (void)setImportantMessage:(id)a3;
- (void)setImportantTextAttributes:(id)a3;
- (void)setIsDowntimeContact:(BOOL)a3;
- (void)setIsEmergencyContact:(BOOL)a3;
- (void)setIsRestrictedContact:(BOOL)a3;
- (void)setLabelsHeight:(double)a3;
- (void)setMessage:(id)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setPosterViewHidden:(BOOL)a3;
- (void)setSensitiveContentHelpButton:(id)a3;
- (void)setShouldShowGemini:(BOOL)a3;
- (void)setTaglineLabel:(id)a3;
- (void)setTaglineTextAttributes:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setUpAvatarBackgroundView;
- (void)setUpPosterView;
- (void)setUsesBrandedCallFormat:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateAvatarBackgroundViewVisibility;
- (void)updateConstraints;
- (void)updateFontSizes;
- (void)updateGeminiResult:(id)a3;
- (void)updateImageViewVisiblity;
- (void)updateLabelColorsForImageColors:(id)a3;
- (void)updateLabelColorsForPosterSnapshot:(id)a3;
- (void)updatePosterImageViewForScrollOffset:(CGPoint)a3;
- (void)updatePosterViewImage;
- (void)updateSensitiveContentBlurVisibility:(BOOL)a3;
- (void)updateSizeDependentAttributes;
- (void)updateWithContacts:(id)a3;
@end

@implementation CNContactHeaderStaticDisplayView

+ (id)makeBlurGradient
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, 1.0, 500.0);
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  id v4 = [v3 colorWithAlphaComponent:0.0];
  v36[0] = [v4 CGColor];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  id v6 = [v5 colorWithAlphaComponent:0.0];
  v36[1] = [v6 CGColor];
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  id v8 = [v7 colorWithAlphaComponent:0.1];
  v36[2] = [v8 CGColor];
  v9 = [MEMORY[0x1E4FB1618] whiteColor];
  id v10 = [v9 colorWithAlphaComponent:1.0];
  v36[3] = [v10 CGColor];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  [v2 setColors:v11];

  [v2 setLocations:&unk_1ED915A58];
  v12 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v13 = [v12 timeProvider];
  [v13 timestamp];
  double v15 = v14;

  id v16 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [v2 bounds];
  v19 = objc_msgSend(v16, "initWithSize:", v17, v18);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__CNContactHeaderStaticDisplayView_makeBlurGradient__block_invoke;
  v30[3] = &unk_1E5497590;
  id v20 = v2;
  id v31 = v20;
  v21 = [v19 imageWithActions:v30];
  v22 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v23 = [v22 timeProvider];
  [v23 timestamp];
  double v25 = v24;

  v26 = CNUILogPosters();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    [v21 size];
    v28 = NSStringFromCGSize(v38);
    v29 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v25 - v15];
    *(_DWORD *)buf = 138412546;
    v33 = v28;
    __int16 v34 = 2112;
    v35 = v29;
    _os_log_debug_impl(&dword_18B625000, v26, OS_LOG_TYPE_DEBUG, "Time to draw %@ variable blur image: %@", buf, 0x16u);
  }

  return v21;
}

uint64_t __52__CNContactHeaderStaticDisplayView_makeBlurGradient__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGContext];

  return [v2 renderInContext:v3];
}

+ (id)blurGradient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CNContactHeaderStaticDisplayView_blurGradient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blurGradient_cn_once_token_19 != -1) {
    dispatch_once(&blurGradient_cn_once_token_19, block);
  }
  id v2 = (void *)blurGradient_cn_once_object_19;

  return v2;
}

void __48__CNContactHeaderStaticDisplayView_blurGradient__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) makeBlurGradient];
  id v2 = (void *)blurGradient_cn_once_object_19;
  blurGradient_cn_once_object_19 = v1;
}

+ (BOOL)_bundleIDIsInAllowListForColorCaching
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [&unk_1ED915A40 containsObject:v3];

  return v4;
}

+ (BOOL)_colorCachingEnabledForProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CNContactHeaderStaticDisplayView__colorCachingEnabledForProcess__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_colorCachingEnabledForProcess_cn_once_token_9 != -1) {
    dispatch_once(&_colorCachingEnabledForProcess_cn_once_token_9, block);
  }
  return [(id)_colorCachingEnabledForProcess_cn_once_object_9 BOOLValue];
}

void __66__CNContactHeaderStaticDisplayView__colorCachingEnabledForProcess__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_bundleIDIsInAllowListForColorCaching"));
  id v2 = (void *)_colorCachingEnabledForProcess_cn_once_object_9;
  _colorCachingEnabledForProcess_cn_once_object_9 = v1;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3) {
    +[CNContactHeaderViewSizeAttributes staticDisplayAttributesWithNavBar];
  }
  else {
  uint64_t v3 = +[CNContactHeaderViewSizeAttributes staticDisplayAttributes];
  }

  return v3;
}

+ (id)contactHeaderViewWithContact:(id)a3 allowsPhotoDrops:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  double v14 = [(id)sStaticDisplayContactHeaderView delegate];
  if (v14)
  {

LABEL_4:
    id v15 = objc_alloc((Class)a1);
    id v16 = (id)objc_msgSend(v15, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_5:
    id v17 = v16;
    goto LABEL_6;
  }
  if ([(id)sStaticDisplayContactHeaderView showMonogramsOnly] != v8) {
    goto LABEL_4;
  }
  if (!sStaticDisplayContactHeaderView)
  {
    id v19 = objc_alloc((Class)a1);
    uint64_t v20 = objc_msgSend(v19, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v21 = (void *)sStaticDisplayContactHeaderView;
    sStaticDisplayContactHeaderView = v20;

    id v16 = (id)sStaticDisplayContactHeaderView;
    goto LABEL_5;
  }
  id v17 = (id)sStaticDisplayContactHeaderView;
  [v17 setDelegate:v13];
  [v17 prepareForReuse];
  [v17 updateForShowingNavBar:v9];
  [v17 updateWithNewContact:v12];
LABEL_6:

  return v17;
}

+ (id)contactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6
{
  return (id)[a1 contactHeaderViewWithContact:a3 allowsPhotoDrops:1 showingNavBar:a4 monogramOnly:a5 delegate:a6];
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v8 = +[CNUIContactsEnvironment currentEnvironment];
  BOOL v9 = [v8 inProcessContactStore];

  BOOL v10 = +[CNUIContactsEnvironment currentEnvironment];
  v11 = v10;
  if (v5) {
    [v10 cachingMonogramRenderer];
  }
  else {
  id v12 = [v10 cachingLikenessRenderer];
  }

  id v13 = [CNContactPhotoView alloc];
  double v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v13, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", v7, 1, v9, v6, v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v14;
}

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA48];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CNContactHeaderStaticDisplayView;
  BOOL v6 = objc_msgSendSuper2(&v13, sel_descriptorForRequiredKeys);
  BOOL v7 = [v5 arrayWithObject:v6];

  if (v4)
  {
    BOOL v8 = [v4 descriptorForRequiredKeys];
    [v7 addObject:v8];
  }
  BOOL v9 = (void *)MEMORY[0x1E4F1B8F8];
  BOOL v10 = [NSString stringWithUTF8String:"+[CNContactHeaderStaticDisplayView descriptorForRequiredKeysForContactFormatter:]"];
  v11 = [v9 descriptorWithKeyDescriptors:v7 description:v10];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveContentManager, 0);
  objc_storeStrong((id *)&self->_metricsReporter, 0);
  objc_storeStrong((id *)&self->_geminiIconProvider, 0);
  objc_storeStrong((id *)&self->_geminiPicker, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_cachedPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedPosterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_sensitiveContentHelpButton, 0);
  objc_storeStrong((id *)&self->_avatarBackgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_avatarBackgroundView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_downtimeView, 0);
  objc_storeStrong((id *)&self->_importantLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_importantTextAttributes, 0);
  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, 0);
  objc_storeStrong((id *)&self->_lastBackgroundColors, 0);
  objc_storeStrong((id *)&self->_geminiTextAttributes, 0);

  objc_storeStrong((id *)&self->_downtimeTextAttributes, 0);
}

- (CNSensitiveContentAnalysisManager)sensitiveContentManager
{
  return self->_sensitiveContentManager;
}

- (CNMetricsUIReporter)metricsReporter
{
  return self->_metricsReporter;
}

- (CNContactGeminiIconProvider)geminiIconProvider
{
  return self->_geminiIconProvider;
}

- (void)setGeminiPicker:(id)a3
{
}

- (CNGeminiPickerController)geminiPicker
{
  return self->_geminiPicker;
}

- (void)setGeminiResult:(id)a3
{
}

- (CNGeminiResult)geminiResult
{
  return (CNGeminiResult *)objc_getProperty(self, a2, 776, 1);
}

- (void)setGeminiView:(id)a3
{
}

- (CNContactGeminiView)geminiView
{
  return (CNContactGeminiView *)objc_getProperty(self, a2, 768, 1);
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 760, 1);
}

- (void)setCachedPosterConfiguration:(id)a3
{
}

- (CNPRSPosterConfiguration)cachedPosterConfiguration
{
  return self->_cachedPosterConfiguration;
}

- (void)setCurrentlyDisplayedPosterContactIdentifier:(id)a3
{
}

- (NSString)currentlyDisplayedPosterContactIdentifier
{
  return self->_currentlyDisplayedPosterContactIdentifier;
}

- (void)setSensitiveContentHelpButton:(id)a3
{
}

- (CNSensitiveContentHelpButtonView)sensitiveContentHelpButton
{
  return self->_sensitiveContentHelpButton;
}

- (void)setLabelsHeight:(double)a3
{
  self->_labelsHeight = a3;
}

- (double)labelsHeight
{
  return self->_labelsHeight;
}

- (void)setAvatarBackgroundGradientLayer:(id)a3
{
}

- (CAGradientLayer)avatarBackgroundGradientLayer
{
  return self->_avatarBackgroundGradientLayer;
}

- (void)setAvatarBackgroundView:(id)a3
{
}

- (UIView)avatarBackgroundView
{
  return self->_avatarBackgroundView;
}

- (void)setBlurView:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setDowntimeView:(id)a3
{
}

- (CNContactDowntimeView)downtimeView
{
  return self->_downtimeView;
}

- (void)setImportantLabel:(id)a3
{
}

- (UILabel)importantLabel
{
  return self->_importantLabel;
}

- (void)setTaglineLabel:(id)a3
{
}

- (UILabel)taglineLabel
{
  return (UILabel *)objc_getProperty(self, a2, 680, 1);
}

- (void)setPersonHeaderView:(id)a3
{
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (BOOL)usesBrandedCallFormat
{
  return self->_usesBrandedCallFormat;
}

- (void)setAllowsPickerActions:(BOOL)a3
{
  self->_allowsPickerActions = a3;
}

- (BOOL)allowsPickerActions
{
  return self->_allowsPickerActions;
}

- (BOOL)isDowntimeContact
{
  return self->_isDowntimeContact;
}

- (BOOL)isRestrictedContact
{
  return self->_isRestrictedContact;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (NSString)message
{
  return self->_message;
}

- (void)setAlternateName:(id)a3
{
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (NSDictionary)importantTextAttributes
{
  return self->_importantTextAttributes;
}

- (void)setTaglineTextAttributes:(id)a3
{
}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (BOOL)shouldShowGemini
{
  return self->_shouldShowGemini;
}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToBlockContact:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CNContactHeaderView *)self delegate];
  [v6 headerView:self didRequestToBlockContact:v4];
}

- (void)notifyDelegateOfUpdatedHiddenSensitiveContent:(BOOL)a3
{
  BOOL v4 = !a3;
  id v5 = [(CNContactHeaderView *)self delegate];
  [v5 headerView:self didUpdateSensitiveContentOverride:v4];
}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMoreHelp:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactHeaderView *)self presenterDelegate];
  [v6 sender:self presentViewController:v5];
}

- (BOOL)canSensitiveContentHelpButtonBlockContact:(id)a3
{
  uint64_t v3 = self;
  BOOL v4 = [(CNContactHeaderView *)self delegate];
  LOBYTE(v3) = [v4 isHeaderViewContactBlocked:v3];

  return (char)v3;
}

- (BOOL)canSensitiveContentHelpButtonViewHidePhoto:(id)a3
{
  uint64_t v3 = [(CNContactHeaderView *)self contacts];
  BOOL v4 = [v3 firstObject];
  char v5 = [v4 overrideSensitiveContent];

  return v5;
}

- (void)sensitiveContentHelpButtonView:(id)a3 didRequestToPresentMenu:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactHeaderView *)self presenterDelegate];
  [v6 sender:self presentViewController:v5];
}

- (void)sensitiveContentHelpButtonView:(id)a3 didSetContentHidden:(BOOL)a4
{
}

- (void)sensitiveContentBlurView:(id)a3 didSetContentHidden:(BOOL)a4
{
}

- (void)sensitiveContentBlurView:(id)a3 wantsToPresentInterventionController:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactHeaderView *)self presenterDelegate];
  [v6 sender:self presentViewController:v5];
}

- (void)dealloc
{
  uint64_t v3 = [(CNContactHeaderStaticDisplayView *)self traitChangeRegistration];
  [(CNContactHeaderStaticDisplayView *)self unregisterForTraitChanges:v3];

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v4 dealloc];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactHeaderStaticDisplayView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    BOOL v9 = [(CNContactHeaderView *)self contacts];
    BOOL v10 = [v9 firstObject];
    char v11 = [v10 hasBeenPersisted];

    if ((v11 & 1) == 0)
    {
      id v12 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      objc_super v13 = [v12 contextMenuInteraction];
      [v13 dismissMenu];

      double v14 = [(CNContactHeaderStaticDisplayView *)self geminiIconProvider];
      [v14 updateGeminiIcons];

      [(CNContactHeaderStaticDisplayView *)self _geminiViewBehaviorForUnknownContact];
    }
    [(CNContactHeaderStaticDisplayView *)self updateAvatarBackgroundViewVisibility];
  }
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactHeaderView *)self presenterDelegate];
  [v5 sender:self dismissViewController:v4];

  id v6 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v6 setHighlighted:0];

  [(CNContactHeaderStaticDisplayView *)self setGeminiPicker:0];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v8 setNeedsCalculateLayout];

  BOOL v9 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v9 calculateLayoutIfNeeded];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderStaticDisplayView *)self setNeedsLayout];
  id v13 = [MEMORY[0x1E4F1B9F8] channelStringFromSenderIdentity:v6];

  BOOL v10 = [(CNContactHeaderView *)self delegate];
  [v10 headerViewDidPickPreferredChannel:v13];

  char v11 = [(CNContactHeaderView *)self presenterDelegate];
  [v11 sender:self dismissViewController:v7];

  id v12 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v12 setHighlighted:0];

  [(CNContactHeaderStaticDisplayView *)self setGeminiPicker:0];
}

- (void)handleGeminiViewTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  BOOL v10 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v10 bounds];
  v26.x = v7;
  v26.y = v9;
  uint64_t v11 = CGRectContainsPoint(v27, v26);

  uint64_t v12 = [v4 state];
  switch(v12)
  {
    case 4:
LABEL_12:
      id v16 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      id v24 = v16;
      uint64_t v17 = 0;
      goto LABEL_13;
    case 3:
      if (v11)
      {
        double v18 = [(CNContactHeaderStaticDisplayView *)self geminiView];
        int v19 = [v18 allowsPickerActions];

        if (v19)
        {
          uint64_t v20 = [CNGeminiPickerController alloc];
          v21 = [(CNContactHeaderStaticDisplayView *)self geminiResult];
          v22 = [(CNGeminiPickerController *)v20 initWithGeminiResult:v21];

          [(CNContactHeaderStaticDisplayView *)self setGeminiPicker:v22];
          [(CNGeminiPickerController *)v22 setDelegate:self];
          v23 = [(CNContactHeaderView *)self presenterDelegate];
          [v23 sender:self presentViewController:v22];
        }
      }
      goto LABEL_12;
    case 2:
      if (v11)
      {
        id v13 = [(CNContactHeaderStaticDisplayView *)self geminiView];
        uint64_t v11 = [v13 allowsPickerActions];
      }
      double v14 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      int v15 = [v14 isHighlighted];

      if (v11 != v15)
      {
        id v16 = [(CNContactHeaderStaticDisplayView *)self geminiView];
        id v24 = v16;
        uint64_t v17 = v11;
LABEL_13:
        [v16 setHighlighted:v17];
      }
      break;
  }
}

- (void)geminiViewDidPickPreferredChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v5 setNeedsCalculateLayout];

  double v6 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v6 calculateLayoutIfNeeded];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderStaticDisplayView *)self setNeedsLayout];
  id v7 = [(CNContactHeaderView *)self delegate];
  [v7 headerViewDidPickPreferredChannel:v4];
}

- (id)_unknownContactActionForGeminiView
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNContactHeaderStaticDisplayView *)self geminiResult];
  id v4 = [v3 availableChannels];

  v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__CNContactHeaderStaticDisplayView__unknownContactActionForGeminiView__block_invoke;
        aBlock[3] = &unk_1E54974F0;
        objc_copyWeak(&v25, &location);
        aBlock[4] = v6;
        id v7 = _Block_copy(aBlock);
        double v8 = (void *)MEMORY[0x1E4FB13F0];
        CGFloat v9 = [v6 localizedLabel];
        BOOL v10 = [v8 actionWithTitle:v9 image:0 identifier:0 handler:v7];

        uint64_t v11 = [v6 senderIdentity];
        uint64_t v12 = [(CNContactHeaderStaticDisplayView *)self geminiResult];
        id v13 = [v12 channel];
        double v14 = [v13 senderIdentity];
        [v10 setState:v11 == v14];

        int v15 = [(CNContactHeaderStaticDisplayView *)self geminiIconProvider];
        id v16 = [v6 channelIdentifier];
        uint64_t v17 = [v15 geminiIconForGeminiChannelIdentifier:v16];
        [v10 setImage:v17];

        [v22 addObject:v10];
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v23);
  }

  double v18 = (void *)[v22 copy];

  return v18;
}

void __70__CNContactHeaderStaticDisplayView__unknownContactActionForGeminiView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained metricsReporter];
  uint64_t v3 = [WeakRetained geminiResult];
  id v4 = [v3 channel];
  objc_msgSend(v2, "logUnknownContactGeminiViewDifferentChannelSelected:", objc_msgSend(v4, "isEqual:", *(void *)(a1 + 32)) ^ 1);

  id v5 = [*(id *)(a1 + 32) senderIdentity];
  double v6 = [MEMORY[0x1E4F1B9F8] channelStringFromSenderIdentity:v5];
  [WeakRetained geminiViewDidPickPreferredChannel:v6];
}

- (void)_geminiViewBehaviorForUnknownContact
{
  uint64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:7];

  if (v5)
  {
    id v9 = [(CNContactHeaderStaticDisplayView *)self _unknownContactActionForGeminiView];
    double v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v9];
    id v7 = [(CNContactHeaderStaticDisplayView *)self geminiView];
    [v7 setMenu:v6];

    double v8 = [(CNContactHeaderStaticDisplayView *)self geminiView];
    [v8 setShowsMenuAsPrimaryAction:1];
  }
}

- (void)_geminiViewBehaviorForSavedContact
{
  uint64_t v3 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v3 setMenu:0];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_handleGeminiViewTouch_];
  [v5 setMinimumPressDuration:0.001];
  id v4 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v4 addGestureRecognizer:v5];
}

- (void)_assignActionToGeminiView
{
  uint64_t v3 = [(CNContactHeaderView *)self contacts];
  id v4 = [v3 firstObject];
  int v5 = [v4 hasBeenPersisted];

  if (v5)
  {
    [(CNContactHeaderStaticDisplayView *)self _geminiViewBehaviorForSavedContact];
  }
  else
  {
    [(CNContactHeaderStaticDisplayView *)self _geminiViewBehaviorForUnknownContact];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  BOOL v4 = [(CNContactHeaderView *)self isAXSize];
  int v5 = [(CNContactHeaderView *)self nameLabel];
  id v7 = v5;
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setNumberOfLines:v6];
}

- (void)menuWillHide:(id)a3
{
  id v3 = [(CNContactHeaderView *)self nameLabel];
  [v3 setHighlighted:0];
}

- (void)handleNameLabelLongPress:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v29 = v4;
  if (objc_opt_isKindOfClass()) {
    int v5 = v29;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6
    && [v6 state] == 1
    && [(CNContactHeaderStaticDisplayView *)self becomeFirstResponder])
  {
    id v7 = [MEMORY[0x1E4FB1978] sharedMenuController];
    double v8 = [(CNContactHeaderView *)self nameLabel];
    id v9 = [(CNContactHeaderView *)self nameLabel];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v18 = [(CNContactHeaderView *)self nameLabel];
    objc_msgSend(v8, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v18, "numberOfLines"), v11, v13, v15, v17);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    long long v27 = [(CNContactHeaderView *)self nameLabel];
    objc_msgSend(v7, "showMenuFromView:rect:", v27, v20, v22, v24, v26);

    long long v28 = [(CNContactHeaderView *)self nameLabel];
    [v28 setHighlighted:1];
  }
}

- (void)handleNameLabelTap:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v10 = v4;
  if (objc_opt_isKindOfClass()) {
    int v5 = v10;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    if ([v6 state] == 3)
    {
      id v7 = [(CNContactHeaderView *)self delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(CNContactHeaderView *)self delegate];
        [v9 headerViewDidTapNameLabel:self];
      }
    }
  }
}

- (id)_importantString
{
  id v3 = [(CNContactHeaderStaticDisplayView *)self importantMessage];
  if ([(CNContactHeaderStaticDisplayView *)self isEmergencyContact])
  {
    id v4 = CNContactsUIBundle();
    int v5 = [v4 localizedStringForKey:@"CARD_NAME_EMERGENCY_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
    {
      id v6 = [v3 stringByAppendingFormat:@"\n%@", v5];
    }
    else
    {
      id v6 = v5;
    }
    id v7 = v6;

    id v3 = v7;
  }

  return v3;
}

- (id)attributedTaglineForContacts:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  if ([v4 count] != 1)
  {
    uint64_t v7 = [v4 count];

    char v8 = +[CNNumberFormatting localizedStringWithInteger:v7];
    id v9 = NSString;
    id v10 = CNContactsUIBundle();
    double v11 = [v10 localizedStringForKey:@"CARD_NAME_GROUP_MEMBERS_COUNT-%@" value:&stru_1ED8AC728 table:@"Localized"];
    double v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);
    objc_msgSend(v5, "cnui_appendTaglineString:", v12);

    uint64_t v13 = *MEMORY[0x1E4F5A2A0];
    goto LABEL_39;
  }
  id v6 = [v4 firstObject];

  if ([v6 contactType] == 1)
  {
    if ([(CNContactHeaderStaticDisplayView *)self usesBrandedCallFormat]) {
      [v6 organizationName];
    }
    else {
    double v17 = [v6 personName];
    }
    uint64_t v13 = *MEMORY[0x1E4F5A2A0];
    if (!(*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A2A0] + 16))(*MEMORY[0x1E4F5A2A0], v17)) {
      goto LABEL_38;
    }
    goto LABEL_11;
  }
  uint64_t v13 = *MEMORY[0x1E4F5A2A0];
  double v14 = [v6 personName];
  if (((*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14) & 1) == 0)
  {

LABEL_13:
    double v17 = [MEMORY[0x1E4F1B910] stringFromContact:v6 style:1];
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v17)) {
      objc_msgSend(v5, "cnui_appendTaglineString:", v17);
    }
    double v18 = [v6 nickname];
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v18))
    {
      double v19 = [(CNContactHeaderView *)self delegate];
      char v20 = [v19 isNicknameProhibited];

      if (v20) {
        goto LABEL_19;
      }
      double v18 = [v6 nickname];
      double v21 = +[CNUIFontRepository contactCardStaticHeaderNicknameTaglineFont];
      objc_msgSend(v5, "cnui_appendTaglineString:withFont:", v18, v21);
    }
LABEL_19:
    double v22 = [v6 previousFamilyName];
    int v23 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v22);

    if (v23)
    {
      double v24 = [v6 previousFamilyName];
      objc_msgSend(v5, "cnui_appendTaglineString:", v24);
    }
    double v25 = [v6 jobTitle];
    int v26 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

    long long v27 = [v6 departmentName];
    int v28 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v27);

    if (v26)
    {
      if (v28)
      {
        id v29 = NSString;
        long long v30 = [v6 jobTitle];
        v48 = CNContactsUIBundle();
        id v31 = [v48 localizedStringForKey:@"CARD_NAME_JOB_TITLE_DEPARTMENT_SEPARATOR" value:&stru_1ED8AC728 table:@"Localized"];
        uint64_t v32 = [v6 departmentName];
        v33 = [v29 stringWithFormat:@"%@%@%@", v30, v31, v32];
        objc_msgSend(v5, "cnui_appendTaglineString:", v33);

LABEL_28:
LABEL_29:
        v35 = [v6 organizationName];
        int v36 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v35);

        if (v36)
        {
          v37 = [v6 organizationName];
          objc_msgSend(v5, "cnui_appendTaglineString:", v37);
        }
        CGSize v38 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        v39 = [v38 featureFlags];
        if ([v39 isFeatureEnabled:12]
          && ([v6 isKeyAvailable:*MEMORY[0x1E4F1AD88]] & 1) != 0)
        {
          uint64_t v40 = *MEMORY[0x1E4F5A258];
          v41 = [v6 termsOfAddress];
          LOBYTE(v40) = (*(uint64_t (**)(uint64_t, void *))(v40 + 16))(v40, v41);

          if (v40) {
            goto LABEL_38;
          }
          v42 = (void *)MEMORY[0x1E4F29040];
          v43 = [v6 termsOfAddress];
          CGSize v38 = [v42 localizedDescriptionForAddressingGrammars:v43 uppercased:1];

          if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v38)) {
            objc_msgSend(v5, "cnui_appendTaglineString:uppercased:", v38, 0);
          }
        }
        else
        {
        }
        goto LABEL_38;
      }
      uint64_t v34 = [v6 jobTitle];
    }
    else
    {
      if (!v28) {
        goto LABEL_29;
      }
      uint64_t v34 = [v6 departmentName];
    }
    long long v30 = (void *)v34;
    objc_msgSend(v5, "cnui_appendTaglineString:", v34);
    goto LABEL_28;
  }
  double v15 = [(CNContactHeaderStaticDisplayView *)self alternateName];
  int v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

  if (!v16) {
    goto LABEL_13;
  }
  double v17 = [(CNContactHeaderStaticDisplayView *)self alternateName];
LABEL_11:
  objc_msgSend(v5, "cnui_appendTaglineString:", v17);
LABEL_38:

LABEL_39:
  v44 = [(CNContactHeaderStaticDisplayView *)self message];
  int v45 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v44);

  if (v45)
  {
    v46 = [(CNContactHeaderStaticDisplayView *)self message];
    objc_msgSend(v5, "cnui_appendTaglineString:", v46);
  }

  return v5;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    if ([(CNContactHeaderStaticDisplayView *)self usesBrandedCallFormat])
    {
      uint64_t v5 = *MEMORY[0x1E4F5A258];
      id v6 = [v4 firstObject];
      uint64_t v7 = [v6 phoneNumbers];
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

      if ((v5 & 1) == 0)
      {
        char v8 = [v4 firstObject];
        id v9 = [v8 phoneNumbers];
        id v10 = [v9 firstObject];

        double v11 = [v10 value];
        double v12 = [v11 formattedStringValue];

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
        {
          id v13 = v12;

          goto LABEL_12;
        }
      }
    }
    double v15 = [(CNContactHeaderStaticDisplayView *)self contactFormatter];
    int v16 = [v4 firstObject];
    double v14 = [v15 stringFromContact:v16];
  }
  else
  {
    double v14 = 0;
  }
  if (![v14 length])
  {
    uint64_t v17 = [(CNContactHeaderStaticDisplayView *)self alternateName];

    double v14 = (void *)v17;
  }
  id v13 = v14;
LABEL_12:

  return v13;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (void)copy:(id)a3
{
  id v3 = [(CNContactHeaderView *)self nameLabel];
  id v4 = [v3 text];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v5 setString:v6];
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v24 reloadDataPreservingChanges:a3];
  [(CNContactHeaderStaticDisplayView *)self _assignActionToGeminiView];
  id v4 = [(CNContactHeaderView *)self contacts];
  uint64_t v5 = [(CNContactHeaderStaticDisplayView *)self _headerStringForContacts:v4];

  id v6 = [(CNContactHeaderView *)self contacts];
  uint64_t v7 = [(CNContactHeaderStaticDisplayView *)self attributedTaglineForContacts:v6];

  char v8 = [(CNContactHeaderStaticDisplayView *)self _importantString];
  [(CNContactHeaderStaticDisplayView *)self _updateImportantLabel];
  [(CNContactHeaderStaticDisplayView *)self _updateDowntimeView];
  id v9 = [v7 string];
  id v10 = [(CNContactHeaderStaticDisplayView *)self message];
  if ([v9 isEqualToString:v10])
  {
    uint64_t v11 = [v5 length];

    if (v11) {
      goto LABEL_5;
    }
    [v7 string];
    id v10 = v5;
    v5 = id v9 = v7;
    uint64_t v7 = 0;
  }

LABEL_5:
  if (![v7 length])
  {

    uint64_t v7 = 0;
  }
  double v12 = [(CNContactHeaderView *)self nameLabel];
  uint64_t v13 = [v12 text];
  double v14 = (void *)v13;
  if (v5)
  {
    if (!v13) {
      goto LABEL_17;
    }
  }
  else if (v13)
  {
    goto LABEL_16;
  }
  double v15 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  int v16 = [v15 text];
  uint64_t v17 = v16;
  if (!v7)
  {
    if (!v16) {
      goto LABEL_18;
    }

    if (!v5)
    {
LABEL_17:

LABEL_25:
      [(CNContactHeaderStaticDisplayView *)self setNeedsUpdateConstraints];
      goto LABEL_26;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (!v16)
  {
    BOOL v18 = 1;
    goto LABEL_21;
  }
LABEL_18:
  double v19 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  char v20 = [v19 text];
  if (v8)
  {
    if (v20)
    {

      BOOL v18 = 0;
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }

    BOOL v18 = 1;
    if (v7) {
LABEL_21:
    }
  }
  else
  {
    BOOL v18 = v20 != 0;

    if (v7) {
      goto LABEL_21;
    }
  }
LABEL_22:

  if (v5) {
  if (v18)
  }
    goto LABEL_25;
LABEL_26:
  double v21 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v21, "setAb_text:", v5);

  double v22 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  [v22 setAttributedText:v7];

  int v23 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  objc_msgSend(v23, "setAb_text:", v8);

  [(CNContactHeaderStaticDisplayView *)self _updatePhotoView];
  [(CNContactHeaderStaticDisplayView *)self updatePosterViewImage];
  [(CNContactHeaderStaticDisplayView *)self updateAvatarBackgroundViewVisibility];
  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderStaticDisplayView *)self calculateLabelSizes];
  [(CNContactHeaderStaticDisplayView *)self setNeedsLayout];
}

- (void)setUsesBrandedCallFormat:(BOOL)a3
{
  if (self->_usesBrandedCallFormat != a3)
  {
    self->_usesBrandedCallFormat = a3;
    [(CNContactHeaderView *)self setNeedsReload];
  }
}

- (void)updateGeminiResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v6 = [v5 featureFlags];
  uint64_t v7 = (void *)[v6 isFeatureEnabled:7];

  BOOL v8 = [(CNContactHeaderStaticDisplayView *)self allowsPickerActions];
  BOOL v9 = v8;
  if (v7)
  {
    id v6 = [(CNContactHeaderStaticDisplayView *)self geminiView];
    [v6 setAllowsPickerActions:v9];
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    id v6 = [(CNContactHeaderView *)self contacts];
    uint64_t v7 = [v6 firstObject];
    uint64_t v10 = [v7 hasBeenPersisted];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v11 setAllowsPickerActions:v10];

  if (v9)
  {

    goto LABEL_8;
  }
LABEL_9:
  [(CNContactHeaderStaticDisplayView *)self setGeminiResult:v4];
  double v12 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v12 setGeminiResult:v4];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  uint64_t v13 = [(CNContactHeaderView *)self contacts];
  double v14 = [v13 firstObject];
  int v15 = [v14 hasBeenPersisted];

  if (v15)
  {
    int v16 = [(CNContactHeaderStaticDisplayView *)self geminiPicker];
    [v16 setGeminiResult:v4];
  }
  else
  {
    uint64_t v17 = [(CNContactHeaderStaticDisplayView *)self geminiIconProvider];
    [v17 setGeminiResult:v4];

    [(CNContactHeaderStaticDisplayView *)self _geminiViewBehaviorForUnknownContact];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CNContactHeaderStaticDisplayView_updateGeminiResult___block_invoke;
    block[3] = &unk_1E549B488;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __55__CNContactHeaderStaticDisplayView_updateGeminiResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateConstraints];
}

- (void)_updateDowntimeView
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
  if (v3)
  {
    id v4 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    int v5 = [v4 isHidden];
  }
  else
  {
    int v5 = 1;
  }

  if ([(CNContactHeaderStaticDisplayView *)self isDowntimeContact]
    || [(CNContactHeaderStaticDisplayView *)self isRestrictedContact])
  {
    id v6 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (![(CNContactHeaderStaticDisplayView *)self isDowntimeContact])
  {
    uint64_t v8 = [(CNContactHeaderStaticDisplayView *)self isRestrictedContact] ^ 1;
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v8 = 0;
  if (v7)
  {
LABEL_12:
    BOOL v9 = [CNContactDowntimeView alloc];
    uint64_t v10 = -[CNContactDowntimeView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNContactHeaderStaticDisplayView *)self setDowntimeView:v10];

    uint64_t v11 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22[0] = *MEMORY[0x1E4FB2950];
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v21[0] = @"ABTextStyleAttributeName";
    v21[1] = v12;
    uint64_t v13 = [(CNContactHeaderView *)self contactStyle];
    double v14 = [v13 taglineTextColor];
    v22[1] = v14;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [(CNContactHeaderStaticDisplayView *)self setDowntimeTextAttributes:v15];

    int v16 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    [(CNContactHeaderStaticDisplayView *)self addSubview:v16];
  }
LABEL_13:
  if ([(CNContactHeaderStaticDisplayView *)self isDowntimeContact]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v17 | [(CNContactHeaderStaticDisplayView *)self isRestrictedContact];
  double v19 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
  [v19 setElements:v18];

  char v20 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
  [v20 setHidden:v8];

  if (v5) {
    [(CNContactHeaderStaticDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateImportantLabel
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  if (v3)
  {
    id v4 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
    int v5 = [v4 isHidden];
  }
  else
  {
    int v5 = 1;
  }

  id v6 = [(CNContactHeaderStaticDisplayView *)self _importantString];
  if (v6)
  {
    BOOL v7 = [(CNContactHeaderStaticDisplayView *)self importantLabel];

    if (!v7)
    {
      uint64_t v8 = *MEMORY[0x1E4FB2950];
      uint64_t v9 = *MEMORY[0x1E4FB0700];
      v22[0] = @"ABTextStyleAttributeName";
      v22[1] = v9;
      v23[0] = v8;
      uint64_t v10 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
      v23[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      [(CNContactHeaderStaticDisplayView *)self setImportantTextAttributes:v11];

      id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
      uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CNContactHeaderStaticDisplayView *)self setImportantLabel:v13];

      double v14 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

      int v15 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      [v15 setTextAlignment:1];

      int v16 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      [v16 setNumberOfLines:0];

      uint64_t v17 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      [v17 _setUseShortcutIntrinsicContentSize:1];

      uint64_t v18 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      objc_msgSend(v18, "_cnui_applyContactStyle");

      double v19 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      [(CNContactHeaderStaticDisplayView *)self addSubview:v19];
    }
  }
  char v20 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  [v20 setHidden:v6 == 0];

  double v21 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  LODWORD(v20) = [v21 isHidden];

  if (v5 != v20) {
    [(CNContactHeaderStaticDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updatePhotoView
{
  id v8 = [(CNContactHeaderView *)self contacts];
  unint64_t v5 = [v8 count];
  BOOL v6 = v5 <= 1
    && ([(CNContactHeaderView *)self contacts],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 firstObject],
        id v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 imageDataAvailable] & 1) == 0)
    && ![(CNContactHeaderView *)self alwaysShowsMonogram]
    || [(CNContactHeaderStaticDisplayView *)self shouldShowPoster];
  BOOL v7 = [(CNContactHeaderView *)self photoView];
  [v7 setHidden:v6];

  if (v5 <= 1)
  {
  }
}

- (id)geminiTextAttributes
{
  return self->_geminiTextAttributes;
}

- (void)setGeminiTextAttributes:(id)a3
{
  BOOL v6 = (NSDictionary *)a3;
  if (self->_geminiTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_geminiTextAttributes, a3);
    unint64_t v5 = [(CNContactHeaderStaticDisplayView *)self geminiView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (id)downtimeTextAttributes
{
  return self->_downtimeTextAttributes;
}

- (void)setDowntimeTextAttributes:(id)a3
{
  BOOL v6 = (NSDictionary *)a3;
  if (self->_downtimeTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_downtimeTextAttributes, a3);
    unint64_t v5 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (void)setImportantTextAttributes:(id)a3
{
  BOOL v6 = (NSDictionary *)a3;
  if (self->_importantTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_importantTextAttributes, a3);
    unint64_t v5 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (void)setNameTextAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderStaticDisplayView;
  id v4 = a3;
  [(CNContactHeaderView *)&v6 setNameTextAttributes:v4];
  unint64_t v5 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v5, "setAb_textAttributes:", v4);
}

- (void)didTapSensitiveContentHelpButton
{
  id v3 = [(CNContactHeaderView *)self delegate];
  [v3 headerView:self didUpdateSensitiveContentOverride:0];
}

- (void)configureSensitiveContentHelpButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v25[2] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentManager];
  char v6 = [v5 shouldShowUIForPosterWithSensitiveContent:!v3 forContact:0];

  BOOL v7 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentHelpButton];
  id v8 = v7;
  if (v6)
  {

    if (!v8)
    {
      uint64_t v9 = [CNSensitiveContentHelpButtonView alloc];
      uint64_t v10 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentManager];
      uint64_t v11 = [(CNSensitiveContentHelpButtonView *)v9 initWithManager:v10];
      sensitiveContentHelpButton = self->_sensitiveContentHelpButton;
      self->_sensitiveContentHelpButton = v11;

      [(CNSensitiveContentHelpButtonView *)self->_sensitiveContentHelpButton setDelegate:self];
      [(CNSensitiveContentHelpButtonView *)self->_sensitiveContentHelpButton setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    uint64_t v13 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentHelpButton];
    [(CNContactHeaderStaticDisplayView *)self addSubview:v13];

    objc_super v24 = (void *)MEMORY[0x1E4F28DC8];
    double v14 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentHelpButton];
    int v15 = [v14 bottomAnchor];
    int v16 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
    uint64_t v17 = [v16 topAnchor];
    uint64_t v18 = [v15 constraintEqualToAnchor:v17 constant:-10.0];
    v25[0] = v18;
    double v19 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentHelpButton];
    char v20 = [v19 centerXAnchor];
    double v21 = [(CNContactHeaderStaticDisplayView *)self centerXAnchor];
    double v22 = [v20 constraintEqualToAnchor:v21];
    v25[1] = v22;
    int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [v24 activateConstraints:v23];
  }
  else
  {
    [v7 removeFromSuperview];

    [(CNContactHeaderStaticDisplayView *)self setSensitiveContentHelpButton:0];
  }
}

- (void)updateSensitiveContentBlurVisibility:(BOOL)a3
{
  v47[4] = *MEMORY[0x1E4F143B8];
  [(CNContactHeaderStaticDisplayView *)self configureSensitiveContentHelpButtonHidden:!a3];
  if (a3)
  {
    unint64_t v5 = [(CNContactHeaderView *)self contacts];
    char v6 = [v5 firstObject];

    BOOL v7 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentManager];
    char v8 = [v7 shouldShowUIForPosterWithSensitiveContent:1 forContact:v6];

    uint64_t v9 = [(CNContactHeaderView *)self posterView];
    if ([v9 isHidden])
    {
    }
    else
    {
      uint64_t v11 = [(CNContactHeaderView *)self posterView];
      id v12 = [v11 image];

      if (v12) {
        char v13 = v8;
      }
      else {
        char v13 = 0;
      }
      if (v13)
      {
        double v14 = [(CNContactHeaderView *)self sensitiveContentBlurView];

        if (!v14)
        {
          int v15 = [CNSensitiveContentBlurView alloc];
          int v16 = [(CNContactHeaderStaticDisplayView *)self sensitiveContentManager];
          uint64_t v17 = [(CNSensitiveContentBlurView *)v15 initWithManager:v16];
          [(CNContactHeaderView *)self setSensitiveContentBlurView:v17];

          uint64_t v18 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          [v18 setCanRevealContent:1];

          double v19 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          [v19 setDelegate:self];

          char v20 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

          double v21 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          double v22 = [(CNContactHeaderView *)self nameLabel];
          [(CNContactHeaderStaticDisplayView *)self insertSubview:v21 belowSubview:v22];

          v37 = (void *)MEMORY[0x1E4F28DC8];
          v46 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          v44 = [v46 topAnchor];
          int v45 = [(CNContactHeaderView *)self posterView];
          v43 = [v45 topAnchor];
          v42 = [v44 constraintEqualToAnchor:v43];
          v47[0] = v42;
          v41 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          v39 = [v41 bottomAnchor];
          uint64_t v40 = [(CNContactHeaderView *)self posterView];
          CGSize v38 = [v40 bottomAnchor];
          int v36 = [v39 constraintEqualToAnchor:v38];
          v47[1] = v36;
          v35 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          v33 = [v35 trailingAnchor];
          uint64_t v34 = [(CNContactHeaderView *)self posterView];
          int v23 = [v34 trailingAnchor];
          objc_super v24 = [v33 constraintEqualToAnchor:v23];
          v47[2] = v24;
          double v25 = [(CNContactHeaderView *)self sensitiveContentBlurView];
          int v26 = [v25 leadingAnchor];
          long long v27 = [(CNContactHeaderView *)self posterView];
          int v28 = [v27 leadingAnchor];
          id v29 = [v26 constraintEqualToAnchor:v28];
          v47[3] = v29;
          long long v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
          [v37 activateConstraints:v30];
        }
        id v31 = [(CNContactHeaderView *)self sensitiveContentBlurView];
        [v31 resetRevealState];

        goto LABEL_15;
      }
    }
    uint64_t v32 = [(CNContactHeaderView *)self sensitiveContentBlurView];
    [v32 removeFromSuperview];

    [(CNContactHeaderView *)self setSensitiveContentBlurView:0];
LABEL_15:

    return;
  }
  uint64_t v10 = [(CNContactHeaderView *)self sensitiveContentBlurView];
  [v10 removeFromSuperview];

  [(CNContactHeaderView *)self setSensitiveContentBlurView:0];
}

- (void)updateSizeDependentAttributes
{
  id v2 = [MEMORY[0x1E4FB1978] sharedMenuController];
  if ([v2 isMenuVisible]) {
    [v2 hideMenu];
  }
}

- (void)setBlurViewGradient
{
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactHeaderView *)self contacts];
  id v4 = [v3 firstObject];
  unint64_t v5 = [v4 wallpaper];
  char v6 = [v5 wallpaperType];

  if (![(CNContactHeaderStaticDisplayView *)self shouldShowPoster]
    || (v6 != (void *)*MEMORY[0x1E4F1B878] ? (BOOL v7 = v6 == (void *)*MEMORY[0x1E4F1B880]) : (BOOL v7 = 1), v7))
  {
    char v8 = [(CNContactHeaderView *)self posterView];
    uint64_t v9 = [v8 layer];
    [v9 setFilters:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() blurGradient];
    uint64_t v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A348]];
    id v12 = v10;
    objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v12, "CGImage"), @"inputMaskImage");
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    [v11 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [v11 setValue:v13 forKey:@"inputDither"];
    [v11 setValue:&unk_1ED915530 forKey:@"inputRadius"];
    v17[0] = v11;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    int v15 = [(CNContactHeaderView *)self posterView];
    int v16 = [v15 layer];
    [v16 setFilters:v14];
  }
}

- (void)updatePosterImageViewForScrollOffset:(CGPoint)a3
{
  double y = a3.y;
  if ([(CNContactHeaderStaticDisplayView *)self shouldShowPoster]) {
    [(CNContactHeaderView *)self posterView];
  }
  else {
  unint64_t v5 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  }
  char v6 = v5;
  if (y >= 0.0)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v24[0] = *MEMORY[0x1E4F1DAB8];
    long long v13 = v24[0];
    v24[1] = v14;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v12 = v25;
    [v5 setTransform:v24];
    uint64_t v9 = [(CNContactHeaderView *)self sensitiveContentBlurView];
    uint64_t v10 = v9;
    v23[0] = v13;
    v23[1] = v14;
    v23[2] = v12;
    uint64_t v11 = (CGAffineTransform *)v23;
  }
  else
  {
    [v5 bounds];
    memset(&v22, 0, sizeof(v22));
    CGFloat v8 = fmax(fabs(y) / v7 + 1.0, 1.0);
    CGAffineTransformMakeScale(&v22, v8, v8);
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeTranslation(&v21, 0.0, y * 0.5);
    CGAffineTransform t1 = v22;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransform t2 = v21;
    CGAffineTransformConcat(&v20, &t1, &t2);
    CGAffineTransform v17 = v20;
    [v6 setTransform:&v17];
    CGAffineTransform v16 = v20;
    uint64_t v9 = [(CNContactHeaderView *)self sensitiveContentBlurView];
    uint64_t v10 = v9;
    CGAffineTransform v15 = v16;
    uint64_t v11 = &v15;
  }
  [v9 setTransform:v11];
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v25 layoutSubviews];
  [(CNContactHeaderStaticDisplayView *)self calculateLabelSizes];
  [(CNContactHeaderStaticDisplayView *)self setBlurViewGradient];
  BOOL v3 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinTopMargin];
  double v14 = v13;
  CGAffineTransform v15 = [(CNContactHeaderView *)self photoTopConstraint];
  [v15 constant];
  double v17 = v16;

  if (v17 != v14)
  {
    uint64_t v18 = [(CNContactHeaderView *)self photoTopConstraint];
    [v18 setConstant:v14];
  }
  if ([(CNContactHeaderView *)self isOrientationPhoneLandscape])
  {
    [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMaxHeight];
    double v20 = v19;
    CGAffineTransform v21 = [(CNContactHeaderView *)self photoHeightConstraint];
    [v21 constant];
    double v23 = v22;

    if (v23 != v20)
    {
      objc_super v24 = [(CNContactHeaderView *)self photoHeightConstraint];
      [v24 setConstant:v20];
    }
  }
}

- (void)calculateLabelSizes
{
  if ([(CNContactHeaderView *)self needsLabelSizeCalculation])
  {
    [(CNContactHeaderStaticDisplayView *)self frame];
    double v4 = v3;
    if (v3 == 0.0)
    {
      double v5 = [(CNContactHeaderStaticDisplayView *)self superview];

      if (v5)
      {
        double v6 = [(CNContactHeaderStaticDisplayView *)self superview];
        [v6 frame];
        double v4 = v7;
      }
    }
    if (v4 != 0.0)
    {
      [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:0];
      [(CNContactHeaderStaticDisplayView *)self layoutMargins];
      double v9 = v8;
      [(CNContactHeaderStaticDisplayView *)self layoutMargins];
      double v11 = v4 - (v9 + v10);
      [(CNContactHeaderStaticDisplayView *)self updateFontSizes];
      long long v12 = [(CNContactHeaderView *)self nameLabel];
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      double v14 = v13;

      CGAffineTransform v15 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
      objc_msgSend(v15, "sizeThatFits:", v11, 1000.0);
      double v17 = v16;

      uint64_t v18 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
      objc_msgSend(v18, "sizeThatFits:", v11, 1000.0);
      double v20 = v19;

      CGAffineTransform v21 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
      int v22 = [v21 isHidden];
      uint64_t v23 = MEMORY[0x1E4F1DB30];
      if (v22)
      {
        double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      else
      {
        objc_super v25 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
        objc_msgSend(v25, "sizeThatFits:", v11, 1000.0);
        double v24 = v26;
      }
      long long v27 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      [v27 calculateLayoutIfNeeded];

      if ([(CNContactHeaderStaticDisplayView *)self shouldShowGemini])
      {
        int v28 = [(CNContactHeaderStaticDisplayView *)self geminiView];
        objc_msgSend(v28, "sizeThatFits:", v11, 1000.0);
        double v30 = v29;
      }
      else
      {
        double v30 = *(double *)(v23 + 8);
      }
      double v31 = v14 + v17 + v20 + v24 + v30;
      uint64_t v32 = [(CNContactHeaderStaticDisplayView *)self _screen];
      [v32 scale];
      if (v33 == 0.0)
      {
        if (RoundToScale_onceToken != -1) {
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
        }
        double v33 = *(double *)&RoundToScale___s;
      }
      BOOL v34 = v33 == 1.0;
      double v35 = round(v33 * v31) / v33;
      double v36 = round(v31);
      if (v34) {
        double v37 = v36;
      }
      else {
        double v37 = v35;
      }

      [(CNContactHeaderStaticDisplayView *)self setLabelsHeight:v37];
      id v38 = [(CNContactHeaderView *)self delegate];
      [v38 headerViewDidUpdateLabelSizes];
    }
  }
}

- (void)calculateLabelSizesIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v3 calculateLabelSizesIfNeeded];
  [(CNContactHeaderStaticDisplayView *)self calculateLabelSizes];
}

- (void)disablePhotoTapGesture
{
  id v2 = [(CNContactHeaderView *)self photoView];
  [v2 disablePhotoTapGesture];
}

- (void)setIsDowntimeContact:(BOOL)a3
{
  if (self->_isDowntimeContact != a3)
  {
    self->_isDowntimeContact = a3;
    [(CNContactHeaderView *)self setNeedsReload];
  }
}

- (void)setIsRestrictedContact:(BOOL)a3
{
  if (self->_isRestrictedContact != a3)
  {
    self->_isRestrictedContact = a3;
    [(CNContactHeaderView *)self setNeedsReload];
  }
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  if (self->_isEmergencyContact != a3)
  {
    self->_isEmergencyContact = a3;
    [(CNContactHeaderView *)self setNeedsReload];
  }
}

- (void)setImportantMessage:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_importantMessage != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_importantMessage, a3);
    [(CNContactHeaderView *)self setNeedsReload];
    double v5 = v6;
  }
}

- (void)setMessage:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_message != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_message, a3);
    [(CNContactHeaderView *)self setNeedsReload];
    double v5 = v6;
  }
}

- (void)setActionsWrapperView:(id)a3
{
  double v5 = (CNContactActionsContainerView *)a3;
  if (self->_actionsWrapperView != v5)
  {
    objc_storeStrong((id *)&self->_actionsWrapperView, a3);
    [(CNContactHeaderStaticDisplayView *)self addSubview:v5];
    [(CNContactHeaderStaticDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v189[1] = *MEMORY[0x1E4F143B8];
  v187.receiver = self;
  v187.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v187 updateConstraints];
  BOOL v3 = [(CNContactHeaderView *)self isAXSize];
  [(CNContactHeaderStaticDisplayView *)self bottomMargin];
  double v5 = v4;
  double v6 = (void *)MEMORY[0x1E4F1CA48];
  double v7 = [(CNContactHeaderView *)self activatedConstraints];
  double v8 = [v6 arrayWithArray:v7];

  double v9 = (void *)MEMORY[0x1E4F28DC8];
  double v10 = [(CNContactHeaderView *)self photoHeightConstraint];
  v189[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:1];
  [v9 deactivateConstraints:v11];

  long long v12 = [(CNContactHeaderView *)self photoHeightConstraint];
  [v8 removeObject:v12];

  double v13 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v14 = [(CNContactHeaderView *)self photoTopConstraint];
  uint64_t v188 = v14;
  CGAffineTransform v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
  [v13 deactivateConstraints:v15];

  double v16 = [(CNContactHeaderView *)self photoTopConstraint];
  [v8 removeObject:v16];

  double v17 = [(CNContactHeaderView *)self posterView];
  LOBYTE(v14) = [v17 isHidden];

  if ((v14 & 1) == 0)
  {
    uint64_t v18 = [(CNContactHeaderView *)self posterView];
    double v19 = [v18 topAnchor];
    double v20 = [(CNContactHeaderStaticDisplayView *)self topAnchor];
    CGAffineTransform v21 = [v19 constraintEqualToAnchor:v20];
    [v8 addObject:v21];

    int v22 = [(CNContactHeaderView *)self posterView];
    uint64_t v23 = [v22 leadingAnchor];
    double v24 = [(CNContactHeaderStaticDisplayView *)self leadingAnchor];
    objc_super v25 = [v23 constraintEqualToAnchor:v24];
    [v8 addObject:v25];

    double v26 = [(CNContactHeaderView *)self posterView];
    long long v27 = [v26 trailingAnchor];
    int v28 = [(CNContactHeaderStaticDisplayView *)self trailingAnchor];
    double v29 = [v27 constraintEqualToAnchor:v28];
    [v8 addObject:v29];

    double v30 = [(CNContactHeaderView *)self posterView];
    double v31 = [v30 bottomAnchor];
    if (v3)
    {
      uint64_t v32 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
      double v33 = [v32 topAnchor];
      BOOL v34 = [v31 constraintEqualToAnchor:v33];
      [v8 addObject:v34];
    }
    else
    {
      uint64_t v32 = [(CNContactHeaderStaticDisplayView *)self bottomAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32 constant:-v5];
      [v8 addObject:v33];
    }

    double v35 = [(CNContactHeaderStaticDisplayView *)self blurView];
    double v36 = [v35 topAnchor];
    double v37 = [(CNContactHeaderView *)self posterView];
    id v38 = [v37 topAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v8 addObject:v39];

    uint64_t v40 = [(CNContactHeaderStaticDisplayView *)self blurView];
    v41 = [v40 bottomAnchor];
    v42 = [(CNContactHeaderView *)self posterView];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    [v8 addObject:v44];

    int v45 = [(CNContactHeaderStaticDisplayView *)self blurView];
    v46 = [v45 leadingAnchor];
    v47 = [(CNContactHeaderView *)self posterView];
    v48 = [v47 leadingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    [v8 addObject:v49];

    v50 = [(CNContactHeaderStaticDisplayView *)self blurView];
    v51 = [v50 trailingAnchor];
    v52 = [(CNContactHeaderView *)self posterView];
    v53 = [v52 trailingAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    [v8 addObject:v54];
  }
  v55 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  v56 = [v55 topAnchor];
  v57 = [(CNContactHeaderStaticDisplayView *)self topAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  [v8 addObject:v58];

  v59 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  v60 = [v59 leadingAnchor];
  v61 = [(CNContactHeaderStaticDisplayView *)self leadingAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v8 addObject:v62];

  v63 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  v64 = [v63 trailingAnchor];
  v65 = [(CNContactHeaderStaticDisplayView *)self trailingAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  [v8 addObject:v66];

  v67 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  v68 = [v67 bottomAnchor];
  v69 = [(CNContactHeaderStaticDisplayView *)self bottomAnchor];
  v70 = [v68 constraintEqualToAnchor:v69 constant:-v5];
  [v8 addObject:v70];

  v71 = [(CNContactHeaderView *)self photoView];
  v72 = [v71 centerXAnchor];
  v73 = [(CNContactHeaderStaticDisplayView *)self centerXAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  [v8 addObject:v74];

  v75 = [(CNContactHeaderView *)self photoView];
  v76 = [v75 leadingAnchor];
  v77 = [(CNContactHeaderStaticDisplayView *)self layoutMarginsGuide];
  v78 = [v77 leadingAnchor];
  v79 = [v76 constraintGreaterThanOrEqualToAnchor:v78];
  [v8 addObject:v79];

  v80 = [(CNContactHeaderView *)self photoView];
  v81 = [v80 trailingAnchor];
  v82 = [(CNContactHeaderStaticDisplayView *)self layoutMarginsGuide];
  v83 = [v82 trailingAnchor];
  v84 = [v81 constraintLessThanOrEqualToAnchor:v83];
  [v8 addObject:v84];

  v85 = [(CNContactHeaderView *)self photoView];
  v86 = [v85 bottomAnchor];
  v87 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  v88 = [v87 topAnchor];
  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinBottomMargin];
  v90 = [v86 constraintEqualToAnchor:v88 constant:-v89];
  [v8 addObject:v90];

  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMaxHeight];
  double v92 = v91;
  LODWORD(v87) = [(CNContactHeaderView *)self isOrientationPhoneLandscape];
  v93 = [(CNContactHeaderView *)self photoView];
  v94 = [v93 heightAnchor];
  v95 = v94;
  if (v87) {
    [v94 constraintEqualToConstant:v92];
  }
  else {
  v96 = [v94 constraintLessThanOrEqualToConstant:v92];
  }
  [(CNContactHeaderView *)self setPhotoHeightConstraint:v96];

  v97 = [(CNContactHeaderView *)self photoHeightConstraint];
  [v8 addObject:v97];

  v98 = [(CNContactHeaderView *)self photoView];
  v99 = [v98 topAnchor];
  v100 = [(CNContactHeaderStaticDisplayView *)self topAnchor];
  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinTopMargin];
  v101 = objc_msgSend(v99, "constraintEqualToAnchor:constant:", v100);
  [(CNContactHeaderView *)self setPhotoTopConstraint:v101];

  if ([(CNContactHeaderView *)self isPadRegularHorizontalSize])
  {
    v102 = [(CNContactHeaderView *)self photoTopConstraint];
    LODWORD(v103) = 1148829696;
    [v102 setPriority:v103];

    v104 = [(CNContactHeaderView *)self photoView];
    v105 = [v104 topAnchor];
    v106 = [(CNContactHeaderStaticDisplayView *)self topAnchor];
    [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinTopMargin];
    v107 = objc_msgSend(v105, "constraintGreaterThanOrEqualToAnchor:constant:", v106);
    [v8 addObject:v107];
  }
  v108 = [(CNContactHeaderView *)self photoTopConstraint];
  [v8 addObject:v108];

  v109 = [(CNContactHeaderView *)self photoView];
  LODWORD(v110) = 1132068864;
  [v109 setContentHuggingPriority:1 forAxis:v110];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E54974A0;
  aBlock[4] = self;
  id v111 = v8;
  id v186 = v111;
  v112 = (void (**)(void *, void *))_Block_copy(aBlock);
  v113 = [(CNContactHeaderView *)self nameLabel];
  v112[2](v112, v113);

  v114 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  v182 = v112;
  v112[2](v112, v114);

  v115 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  LODWORD(v116) = 1148846080;
  [v115 setContentHuggingPriority:1 forAxis:v116];

  v117 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  LODWORD(v118) = 1148846080;
  [v117 setContentCompressionResistancePriority:1 forAxis:v118];

  v119 = [(CNContactHeaderView *)self nameLabel];
  LODWORD(v120) = 1148846080;
  [v119 setContentHuggingPriority:1 forAxis:v120];

  v121 = [(CNContactHeaderView *)self nameLabel];
  LODWORD(v122) = 1148846080;
  [v121 setContentCompressionResistancePriority:1 forAxis:v122];

  v123 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
  if (v123)
  {
    v124 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
    int v125 = [v124 isHidden] ^ 1;
  }
  else
  {
    int v125 = 0;
  }

  v126 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
  if (v126)
  {
    v127 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    int v128 = [v127 isHidden] ^ 1;
  }
  else
  {
    int v128 = 0;
  }

  BOOL v129 = [(CNContactHeaderStaticDisplayView *)self shouldShowGemini];
  v130 = [MEMORY[0x1E4F1CA48] array];
  if (v125)
  {
    v131 = [(CNContactHeaderStaticDisplayView *)self importantLabel];
    [v130 addObject:v131];
  }
  if (v128)
  {
    v132 = [(CNContactHeaderStaticDisplayView *)self downtimeView];
    [v130 addObject:v132];
  }
  BOOL v133 = v3;
  if (v129)
  {
    v134 = [(CNContactHeaderStaticDisplayView *)self geminiView];
    [v130 addObject:v134];
  }
  v135 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  v136 = [v135 bottomAnchor];

  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke_2;
  v183[3] = &unk_1E54974C8;
  v183[4] = self;
  id v137 = v111;
  id v184 = v137;
  v138 = objc_msgSend(v130, "_cn_reduce:initialValue:", v183, v136);
  v139 = [(CNContactHeaderView *)self nameLabel];
  v140 = [v139 topAnchor];
  v141 = [v138 constraintEqualToAnchor:v140];
  [v137 addObject:v141];

  v142 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];

  if (v142)
  {
    v181 = v136;
    v143 = [(CNContactHeaderStaticDisplayView *)self leadingAnchor];
    v144 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
    v145 = [v144 leadingAnchor];
    v146 = [v143 constraintEqualToAnchor:v145];
    [v137 addObject:v146];

    v147 = [(CNContactHeaderStaticDisplayView *)self trailingAnchor];
    v148 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
    v149 = [v148 trailingAnchor];
    v150 = [v147 constraintEqualToAnchor:v149];
    [v137 addObject:v150];

    v151 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
    LODWORD(v152) = 1148846080;
    [v151 setContentHuggingPriority:1 forAxis:v152];

    v153 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
    LODWORD(v154) = 1148846080;
    [v153 setContentCompressionResistancePriority:1 forAxis:v154];

    if (!v133)
    {
      v166 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
      v167 = [v166 topAnchor];
      v168 = [(CNContactHeaderView *)self nameLabel];
      v169 = [v168 bottomAnchor];
      v170 = [v167 constraintEqualToAnchor:v169];
      [v137 addObject:v170];

      v171 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
      v172 = [v171 bottomAnchor];
      v173 = [(CNContactHeaderStaticDisplayView *)self bottomAnchor];
      uint64_t v174 = [v172 constraintEqualToAnchor:v173 constant:-v5];
LABEL_32:
      v180 = (void *)v174;
      [v137 addObject:v174];

      v136 = v181;
      goto LABEL_33;
    }
    v155 = [(CNContactHeaderView *)self nameLabel];
    uint64_t v156 = [v155 text];
    if (v156)
    {
      v157 = (void *)v156;
      v158 = [(CNContactHeaderView *)self nameLabel];
      v159 = [v158 text];
      uint64_t v160 = [v159 length];

      if (v160)
      {
        v161 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
        v162 = [v161 topAnchor];
        v163 = [(CNContactHeaderView *)self nameLabel];
        v164 = [v163 bottomAnchor];
        v165 = [v162 constraintEqualToAnchor:v164 constant:v5];
        [v137 addObject:v165];

LABEL_31:
        v171 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
        v172 = [v171 bottomAnchor];
        v173 = [(CNContactHeaderStaticDisplayView *)self bottomAnchor];
        uint64_t v174 = [v172 constraintEqualToAnchor:v173];
        goto LABEL_32;
      }
    }
    else
    {
    }
    v175 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
    v176 = [v175 topAnchor];
    v177 = [(CNContactHeaderView *)self nameLabel];
    v178 = [v177 topAnchor];
    v161 = [v176 constraintEqualToAnchor:v178];

    LODWORD(v179) = 1132068864;
    [v161 setPriority:v179];
    [v137 addObject:v161];
    goto LABEL_31;
  }
LABEL_33:
  [MEMORY[0x1E4F28DC8] activateConstraints:v137];
  [(CNContactHeaderView *)self setActivatedConstraints:v137];
}

void __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [v3 leadingAnchor];
  double v5 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v6 = [v5 leadingAnchor];
  id v12 = [v4 constraintEqualToAnchor:v6];

  [*(id *)(a1 + 40) addObject:v12];
  double v7 = [v3 trailingAnchor];
  double v8 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v9 = [v8 trailingAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9];

  [*(id *)(a1 + 40) addObject:v10];
  LODWORD(v11) = 1148846080;
  [v3 setContentHuggingPriority:0 forAxis:v11];
}

id __53__CNContactHeaderStaticDisplayView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  _OWORD v23[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  [v5 leadingAnchor];
  v21 = uint64_t v20 = a1;
  int v22 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v7 = [v22 leadingAnchor];
  double v8 = [v21 constraintEqualToAnchor:v7];
  v23[0] = v8;
  double v9 = [v5 trailingAnchor];
  double v10 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v11 = [v10 trailingAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v23[1] = v12;
  double v13 = [v5 topAnchor];
  uint64_t v14 = [v6 constraintEqualToAnchor:v13];

  v23[2] = v14;
  CGAffineTransform v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  [*(id *)(v20 + 40) addObjectsFromArray:v15];
  LODWORD(v16) = 1148846080;
  [v5 setContentHuggingPriority:1 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [v5 setContentCompressionResistancePriority:1 forAxis:v17];
  uint64_t v18 = [v5 bottomAnchor];

  return v18;
}

- (double)staticHeaderPhotoMinBottomMargin
{
  if ([(CNContactHeaderView *)self isPadCompactHorizontalSize])
  {
    id v3 = [(CNContactHeaderView *)self sizeAttributes];
    [v3 photoMinBottomMarginPadCompact];
  }
  else if ([(CNContactHeaderView *)self isOrientationPhoneLandscape])
  {
    id v3 = [(CNContactHeaderView *)self sizeAttributes];
    [v3 photoMinBottomMarginPhoneLandscape];
  }
  else
  {
    BOOL v5 = [(CNContactHeaderStaticDisplayView *)self shouldUseFixedHeight];
    id v6 = [(CNContactHeaderView *)self sizeAttributes];
    id v3 = v6;
    if (v5) {
      [v6 photoMinBottomMarginLowQuality];
    }
    else {
      [v6 photoMinBottomMargin];
    }
  }
  double v7 = v4;

  return v7;
}

- (double)avatarHeightPhoneLandscape
{
  [(CNContactHeaderStaticDisplayView *)self frame];
  double v4 = v3;
  if (v3 == 0.0)
  {
    BOOL v5 = [(CNContactHeaderStaticDisplayView *)self superview];

    if (v5)
    {
      id v6 = [(CNContactHeaderStaticDisplayView *)self superview];
      [v6 frame];
      double v4 = v7;
    }
  }
  if (v4 == 0.0) {
    return 0.0;
  }
  [(CNContactHeaderStaticDisplayView *)self layoutMargins];
  double v9 = v8;
  [(CNContactHeaderStaticDisplayView *)self layoutMargins];
  double v11 = v4 - (v9 + v10);
  id v12 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v12, "sizeThatFits:", v11, 3.40282347e38);
  double v14 = v13;

  CGAffineTransform v15 = [(CNContactHeaderView *)self nameLabel];
  double v16 = [v15 font];
  [v16 lineHeight];
  double v18 = ceil(v17);

  double v19 = [(CNContactHeaderView *)self sizeAttributes];
  uint64_t v20 = v19;
  if (v14 <= v18) {
    [v19 photoMaxHeightPhoneLandscape];
  }
  else {
    [v19 photoMinHeight];
  }
  double v22 = v21;

  return v22;
}

- (double)staticHeaderPhotoMaxHeight
{
  if ([(CNContactHeaderView *)self isOrientationPhoneLandscape])
  {
    [(CNContactHeaderStaticDisplayView *)self avatarHeightPhoneLandscape];
    double v4 = v3;
  }
  else
  {
    BOOL v5 = [(CNContactHeaderView *)self sizeAttributes];
    [v5 photoMaxHeight];
    double v4 = v6;
  }
  if ([(CNContactHeaderView *)self isPhotoLowQuality])
  {
    if (![(CNContactHeaderStaticDisplayView *)self shouldShowPoster])
    {
      double v7 = [(CNContactHeaderView *)self sizeAttributes];
      [v7 photoMaxHeightLowQuality];
      double v9 = v8;

      if (v4 >= v9) {
        return v9;
      }
    }
  }
  return v4;
}

- (double)staticHeaderPhotoMinHeight
{
  if ([(CNContactHeaderView *)self isOrientationPhoneLandscape])
  {
    [(CNContactHeaderStaticDisplayView *)self avatarHeightPhoneLandscape];
    double v4 = v3;
  }
  else
  {
    BOOL v5 = [(CNContactHeaderView *)self isPadCompactHorizontalSize];
    double v6 = [(CNContactHeaderView *)self sizeAttributes];
    double v7 = v6;
    if (v5) {
      [v6 photoMaxHeightPadCompact];
    }
    else {
      [v6 photoMinHeight];
    }
    double v4 = v8;
  }
  if ([(CNContactHeaderView *)self isPhotoLowQuality])
  {
    if (![(CNContactHeaderStaticDisplayView *)self shouldShowPoster])
    {
      double v9 = [(CNContactHeaderView *)self sizeAttributes];
      [v9 photoMaxHeightLowQuality];
      double v11 = v10;

      if (v4 >= v11) {
        return v11;
      }
    }
  }
  return v4;
}

- (BOOL)shouldUseFixedHeight
{
  if ([(CNContactHeaderView *)self isOrientationPhoneLandscape]) {
    return 1;
  }
  if ([(CNContactHeaderView *)self isPadCompactHorizontalSize]) {
    return 1;
  }
  BOOL v3 = [(CNContactHeaderStaticDisplayView *)self shouldShowPoster];
  if ([(CNContactHeaderView *)self isPhotoLowQuality])
  {
    if (!v3) {
      return 1;
    }
  }
  if ([(CNContactHeaderView *)self isAXSize] && !v3) {
    return 1;
  }
  double v4 = [(CNContactHeaderView *)self contacts];
  BOOL v5 = [v4 firstObject];
  int v6 = [v5 imageDataAvailable] | v3;

  return v6 ^ 1;
}

- (double)staticHeaderPhotoMinTopMargin
{
  if ([(CNContactHeaderView *)self isPadRegularHorizontalSize])
  {
    BOOL v3 = [(CNContactHeaderView *)self sizeAttributes];
    [v3 photoMinTopMargin];
    double v5 = v4;
    goto LABEL_9;
  }
  if ([(CNContactHeaderView *)self isPadCompactHorizontalSize])
  {
    [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoTopMarginOffset];
    double v7 = v6;
    BOOL v3 = [(CNContactHeaderView *)self sizeAttributes];
    [v3 photoMinTopMarginPadCompact];
  }
  else
  {
    if ([(CNContactHeaderView *)self isOrientationPhoneLandscape])
    {
      BOOL v3 = [(CNContactHeaderStaticDisplayView *)self superview];
      [v3 frame];
      double v5 = v9 * 0.1;
      goto LABEL_9;
    }
    [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoTopMarginOffset];
    double v7 = v10;
    BOOL v3 = [(CNContactHeaderView *)self sizeAttributes];
    [v3 photoMinTopMargin];
  }
  double v5 = v7 + v8;
LABEL_9:

  double result = 0.0;
  if (((*(void *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF) {
    return v5;
  }
  return result;
}

- (double)staticHeaderPhotoTopMarginOffset
{
  BOOL v3 = [(CNContactHeaderView *)self delegate];
  [v3 navigationBarHeight];
  double v5 = v4;

  double v6 = [(CNContactHeaderView *)self delegate];
  [v6 headerViewSafeAreaInsets];
  double v8 = v7;

  return v5 + v8;
}

- (double)nameFontSize
{
  id v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2928]];
  [v2 pointSize];
  double v4 = v3 + 6.0;

  return v4;
}

- (id)nameFont
{
  double v3 = +[CNUIFontRepository contactCardStaticHeaderDefaultNameFont];
  double v4 = [(CNContactHeaderView *)self contacts];
  double v5 = [v4 firstObject];
  double v6 = [v5 wallpaper];
  double v7 = [v6 font];

  if (v7)
  {
    double v8 = [v7 fontDescriptor];
    double v9 = [v8 fontDescriptorWithSymbolicTraits:0x8000];

    id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (void)updateFontSizes
{
  v27[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactHeaderView *)self isAXSize];
  double v4 = [(CNContactHeaderView *)self nameLabel];
  [v4 setAdjustsFontSizeToFitWidth:!v3];

  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 0.7;
  }
  double v6 = [(CNContactHeaderView *)self nameLabel];
  [v6 setMinimumScaleFactor:v5];

  uint64_t v7 = [(CNContactHeaderStaticDisplayView *)self nameFont];
  double v8 = (void *)sCurrentNameFont;
  sCurrentNameFont = v7;

  [(CNContactHeaderStaticDisplayView *)self nameFontSize];
  double v9 = (void *)sCurrentNameFont;
  objc_msgSend((id)sCurrentNameFont, "_scaledValueForValue:");
  id v10 = objc_msgSend(v9, "fontWithSize:");
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = v26;
  v27[0] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v12];

  uint64_t v13 = +[CNUIFontRepository contactCardStaticHeaderDefaultTaglineFont];
  double v14 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v13;

  uint64_t v24 = v11;
  uint64_t v25 = sCurrentTaglineFont;
  CGAffineTransform v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  [self cn_updateDictionaryForKey:@"importantTextAttributes" withChanges:v15];

  uint64_t v22 = v11;
  uint64_t v23 = sCurrentTaglineFont;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [self cn_updateDictionaryForKey:@"downtimeTextAttributes" withChanges:v16];

  uint64_t v20 = v11;
  uint64_t v21 = sCurrentTaglineFont;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [self cn_updateDictionaryForKey:@"geminiTextAttributes" withChanges:v17];

  double v18 = [(CNContactHeaderStaticDisplayView *)self geminiIconProvider];
  [v18 updateGeminiIcons];

  double v19 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v19 setNeedsCalculateLayout];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderStaticDisplayView *)&v7 tintColorDidChange];
  BOOL v3 = [(CNContactHeaderStaticDisplayView *)self tintColor];
  double v4 = [(CNContactHeaderView *)self nameLabel];
  [v4 setHighlightedTextColor:v3];

  double v5 = [(CNContactHeaderStaticDisplayView *)self tintColor];
  double v6 = [(CNContactHeaderStaticDisplayView *)self geminiView];
  [v6 setHighlightedColor:v5];
}

- (unint64_t)avatarStyle
{
  id v2 = [(CNContactHeaderView *)self photoView];
  BOOL v3 = [v2 avatarView];
  unint64_t v4 = [v3 style];

  return v4;
}

- (void)setAvatarStyle:(unint64_t)a3
{
  id v5 = [(CNContactHeaderView *)self photoView];
  unint64_t v4 = [v5 avatarView];
  [v4 setStyle:a3];
}

- (BOOL)shouldShowPoster
{
  if ([(CNContactHeaderView *)self showMonogramsOnly]) {
    goto LABEL_6;
  }
  if ([(CNContactHeaderView *)self isPad]) {
    goto LABEL_6;
  }
  BOOL v3 = [(CNContactHeaderView *)self delegate];
  char v4 = [v3 isOrientationPhoneLandscape];

  if ((v4 & 1) != 0
    || ([(CNContactHeaderView *)self contacts],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6 != 1))
  {
LABEL_6:
    LOBYTE(v12) = 0;
  }
  else
  {
    objc_super v7 = [(CNContactHeaderView *)self contacts];
    double v8 = [v7 firstObject];

    uint64_t v9 = *MEMORY[0x1E4F5A268];
    id v10 = [v8 wallpaper];
    uint64_t v11 = [v10 posterArchiveData];
    int v12 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11) ^ 1;
  }
  return v12;
}

- (void)setShouldShowGemini:(BOOL)a3
{
  if (self->_shouldShowGemini != a3)
  {
    if (a3)
    {
      [(CNContactHeaderStaticDisplayView *)self createGeminiViewIfNeeded];
      id v5 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      [(CNContactHeaderStaticDisplayView *)self addSubview:v5];
    }
    else
    {
      id v5 = [(CNContactHeaderStaticDisplayView *)self geminiView];
      [v5 removeFromSuperview];
    }

    [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
    self->_shouldShowGeminuint64_t i = a3;
    [(CNContactHeaderStaticDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)createGeminiViewIfNeeded
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (!self->_geminiView)
  {
    BOOL v3 = [CNContactGeminiView alloc];
    char v4 = -[CNContactGeminiView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    geminiView = self->_geminiView;
    self->_geminiView = v4;

    [(CNContactGeminiView *)self->_geminiView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactGeminiView *)self->_geminiView setUserInteractionEnabled:1];
    uint64_t v6 = [(CNContactHeaderStaticDisplayView *)self tintColor];
    [(CNContactGeminiView *)self->_geminiView setHighlightedColor:v6];

    objc_super v7 = +[CNUIColorRepository contactCardStaticHeaderGeminiTextColor];
    [(CNContactGeminiView *)self->_geminiView setBackgroundColor:v7];

    v12[0] = *MEMORY[0x1E4FB2950];
    uint64_t v8 = *MEMORY[0x1E4FB0700];
    v11[0] = @"ABTextStyleAttributeName";
    v11[1] = v8;
    uint64_t v9 = +[CNUIColorRepository contactCardStaticHeaderGeminiTextColor];
    v12[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(CNContactHeaderStaticDisplayView *)self setGeminiTextAttributes:v10];
  }
}

- (id)imageDataForColorFetchingIsImageDataOrThumbnail:(BOOL *)a3 bitmapFormat:(id *)a4
{
  MmappedBitmapContext = self;
  objc_super v7 = [(CNContactHeaderView *)self contacts];
  uint64_t v8 = [v7 firstObject];

  if ([v8 isKeyAvailable:*MEMORY[0x1E4F1AF98]])
  {
    uint64_t v9 = *MEMORY[0x1E4F5A268];
    id v10 = [v8 thumbnailImageData];
    LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = [v8 thumbnailImageData];
      goto LABEL_11;
    }
  }
  if ([v8 isKeyAvailable:*MEMORY[0x1E4F1AE28]])
  {
    uint64_t v11 = [v8 imageData];
LABEL_11:
    uint64_t v22 = (void *)v11;
    long long v27 = [MmappedBitmapContext dataForBackgroundColorService:v11];
    LOBYTE(MmappedBitmapContext) = 1;
    goto LABEL_12;
  }
  int v12 = [MmappedBitmapContext photoView];
  uint64_t v13 = [v12 avatarView];
  uint64_t v14 = [v13 displayedImageState];

  if (v14 == 2)
  {
    CGAffineTransform v15 = [MmappedBitmapContext photoView];
    double v16 = [v15 avatarView];
    id v17 = [v16 contentImage];
    double v18 = (CGImage *)[v17 CGImage];

    size_t Width = CGImageGetWidth(v18);
    CGFloat Height = (double)CGImageGetHeight(v18);
    CGImageGetBitsPerComponent(v18);
    MmappedBitmapContext = (void *)CNImageUtilsCreateMmappedBitmapContext();
    v30.origin.x = 0.0;
    v30.origin.double y = 0.0;
    v30.size.width = (double)Width;
    v30.size.height = Height;
    CGContextDrawImage((CGContextRef)MmappedBitmapContext, v30, v18);
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1BA10]) initWithBitmapContext:MmappedBitmapContext];
    uint64_t v22 = v21;
    if (a4) {
      *a4 = v21;
    }
    Data = CGBitmapContextGetData((CGContextRef)MmappedBitmapContext);
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow((CGContextRef)MmappedBitmapContext);
    size_t v25 = CGBitmapContextGetHeight((CGContextRef)MmappedBitmapContext) * BytesPerRow;
    uint64_t v26 = dispatch_get_global_queue(0, 0);
    long long v27 = dispatch_data_create(Data, v25, v26, (dispatch_block_t)*MEMORY[0x1E4F143F8]);

    if (MmappedBitmapContext)
    {
      CFRelease(MmappedBitmapContext);
      LOBYTE(MmappedBitmapContext) = 0;
    }
LABEL_12:

    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  long long v27 = 0;
  LOBYTE(MmappedBitmapContext) = 1;
  if (a3) {
LABEL_13:
  }
    *a3 = (char)MmappedBitmapContext;
LABEL_14:

  return v27;
}

- (void)assignImageColorsToAvatarBackgroundView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v33 = a3;
  uint64_t v6 = [MEMORY[0x1E4F5A670] colorArraySize];
  if ([v33 count] == v6)
  {
    objc_super v7 = v33;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = [v33 firstObject];
    id v10 = v9;
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4FB1618] clearColor];
    }
    uint64_t v11 = objc_msgSend(v8, "_cn_arrayWithObject:count:", v10, v6);

    if (!v9) {
    BOOL v4 = 0;
    }
    objc_super v7 = (void *)v11;
  }
  id v34 = v7;
  int v12 = objc_msgSend(v7, "_cn_map:", &__block_literal_global_11383);
  objc_msgSend(v12, "_cn_reversed");
  uint64_t v13 = (NSArray *)objc_claimAutoreleasedReturnValue();

  lastBackgroundColors = self->_lastBackgroundColors;
  if (lastBackgroundColors != v13 && (!lastBackgroundColors || !-[NSArray isEqualToArray:](v13, "isEqualToArray:")))
  {
    objc_storeStrong((id *)&self->_lastBackgroundColors, v13);
    CGAffineTransform v15 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
    [v15 removeAnimationForKey:@"gradientAnimation"];

    if (v4
      && ([(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer],
          double v16 = objc_claimAutoreleasedReturnValue(),
          [v16 colors],
          id v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          v17))
    {
      double v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"colors"];
      [v18 setToValue:v13];
      [v18 setDuration:0.2];
      [v18 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v18 setRemovedOnCompletion:0];
      double v19 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
      [v19 addAnimation:v18 forKey:@"gradientAnimation"];
    }
    else
    {
      double v18 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
      [v18 setColors:v13];
    }

    uint64_t v20 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v29 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
  }
  CGRect v30 = [(CNContactHeaderView *)self delegate];
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    uint64_t v32 = [(CNContactHeaderView *)self delegate];
    [v32 headerView:self didSetBackgroundAsGradientColors:v34];
  }
}

uint64_t __85__CNContactHeaderStaticDisplayView_assignImageColorsToAvatarBackgroundView_animated___block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 CGColor];
}

- (void)updateLabelColorsForImageColors:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (+[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:a3])
  {
    BOOL v4 = +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor];
    +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineTextColor];
  }
  else
  {
    BOOL v4 = +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultDarkTextColor];
    +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineDarkTextColor];
  id v5 = };
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v12[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v6];

  objc_super v7 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  [v7 setTextColor:v5];

  uint64_t v8 = [(CNContactHeaderView *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CNContactHeaderView *)self delegate];
    [v10 headerView:self didSetNameLabelColor:v4];
  }
}

- (void)updateAvatarBackgroundViewVisibility
{
  BOOL v3 = [(CNContactHeaderStaticDisplayView *)self shouldShowPoster];
  BOOL v4 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  [v4 setHidden:v3];

  if ([(CNContactHeaderView *)self isOrientationPhoneLandscape]) {
    float v5 = 0.0;
  }
  else {
    float v5 = 1.0;
  }
  uint64_t v6 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundGradientLayer];
  *(float *)&double v7 = v5;
  [v6 setOpacity:v7];

  if (![(CNContactHeaderStaticDisplayView *)self shouldShowPoster])
  {
    [(CNContactHeaderStaticDisplayView *)self setPosterViewHidden:1];
    uint64_t v8 = [(CNContactHeaderView *)self contacts];
    char v9 = [v8 firstObject];
    id v10 = [v9 backgroundColors];
    uint64_t v11 = [v10 contactImage];

    int v12 = [(CNContactHeaderView *)self contacts];
    uint64_t v13 = [v12 firstObject];
    uint64_t v14 = [v13 identifier];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke;
    aBlock[3] = &unk_1E5497568;
    aBlock[4] = self;
    id v15 = v14;
    id v42 = v15;
    double v16 = _Block_copy(aBlock);
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      char v40 = 0;
      id v39 = 0;
      id v17 = [(CNContactHeaderStaticDisplayView *)self imageDataForColorFetchingIsImageDataOrThumbnail:&v40 bitmapFormat:&v39];
      id v18 = v39;
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
      {
        objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
        double v19 = [(CNContactHeaderView *)self backgroundGradientDefaultGrayColors];
        (*((void (**)(void *, void *, void, void))v16 + 2))(v16, v19, 0, 0);
      }
      else
      {
        if (![(CNContactHeaderStaticDisplayView *)self identifierForBackgroundColorIsCurrent:v15])
        {
          objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
          uint64_t v20 = [(CNContactHeaderView *)self backgroundGradientDefaultGrayColors];
          (*((void (**)(void *, void *, void, uint64_t))v16 + 2))(v16, v20, 0, 1);
        }
        double v21 = [(CNContactHeaderView *)self contacts];
        double v19 = [v21 firstObject];

        if ([(id)objc_opt_class() _colorCachingEnabledForProcess] && v40)
        {
          uint64_t v29 = MEMORY[0x1E4F143A8];
          uint64_t v30 = 3221225472;
          char v31 = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_5;
          uint64_t v32 = &unk_1E5498C00;
          double v22 = &v33;
          id v33 = v16;
          double v23 = &v29;
          double v24 = self;
          double v25 = v17;
          id v26 = v18;
          double v27 = v19;
          uint64_t v28 = 1;
        }
        else
        {
          uint64_t v34 = MEMORY[0x1E4F143A8];
          uint64_t v35 = 3221225472;
          double v36 = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_4;
          double v37 = &unk_1E5498C00;
          double v22 = &v38;
          id v38 = v16;
          double v23 = &v34;
          double v24 = self;
          double v25 = v17;
          id v26 = v18;
          double v27 = v19;
          uint64_t v28 = 0;
        }
        -[CNContactHeaderView fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:](v24, "fetchColorsForContactImageData:bitmapFormat:isPoster:forContact:cacheResult:withCompletionHandler:", v25, v26, 0, v27, v28, v23, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastBackgroundColorsContactIdentifier, v14);
      (*((void (**)(void *, void *, void, uint64_t))v16 + 2))(v16, v11, 0, 1);
    }
  }
}

void __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) identifierForBackgroundColorIsCurrent:*(void *)(a1 + 40)])
  {
    if (a4)
    {
      id v8 = [MEMORY[0x1E4F5A670] tintedUIColorsFromUIColors:v7 isLight:0];
    }
    else
    {
      id v8 = v7;
    }
    char v9 = v8;
    [*(id *)(a1 + 32) assignImageColorsToAvatarBackgroundView:v8 animated:a3];
    id v10 = (void *)MEMORY[0x1E4FB1EB0];
    if (a3)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_2;
      v18[3] = &unk_1E549BF80;
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = &v19;
      v18[4] = v11;
      double v19 = v9;
      id v13 = v9;
      [v10 animateWithDuration:v18 animations:0.2];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_3;
      v16[3] = &unk_1E549BF80;
      uint64_t v14 = *(void *)(a1 + 32);
      int v12 = &v17;
      v16[4] = v14;
      id v17 = v9;
      id v15 = v9;
      [v10 performWithoutAnimation:v16];
    }
  }
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLabelColorsForImageColors:*(void *)(a1 + 40)];
}

uint64_t __72__CNContactHeaderStaticDisplayView_updateAvatarBackgroundViewVisibility__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLabelColorsForImageColors:*(void *)(a1 + 40)];
}

- (BOOL)identifierForBackgroundColorIsCurrent:(id)a3
{
  BOOL v4 = (NSString *)a3;
  lastBackgroundColorsContactIdentifier = self->_lastBackgroundColorsContactIdentifier;
  if (lastBackgroundColorsContactIdentifier == v4)
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(NSString *)lastBackgroundColorsContactIdentifier isEqualToString:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setUpAvatarBackgroundView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v10 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactHeaderStaticDisplayView *)self addSubview:v10];
  [(CNContactHeaderStaticDisplayView *)self sendSubviewToBack:v10];
  [(CNContactHeaderStaticDisplayView *)self setAvatarBackgroundView:v10];
  BOOL v4 = [MEMORY[0x1E4FB1618] clearColor];
  float v5 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  [v5 setBackgroundColor:v4];

  char v6 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  [v6 setHidden:1];

  id v7 = [MEMORY[0x1E4F39BD0] layer];
  id v8 = [(CNContactHeaderStaticDisplayView *)self avatarBackgroundView];
  char v9 = [v8 layer];
  [v9 addSublayer:v7];

  [(CNContactHeaderStaticDisplayView *)self setAvatarBackgroundGradientLayer:v7];
}

- (CGRect)layerContentsRectForConfiguration:(id)a3
{
  id v4 = a3;
  float v5 = [MEMORY[0x1E4F1BAE0] wallpaperTypeFromConfiguration:v4];
  char v6 = [(CNContactHeaderStaticDisplayView *)self window];
  +[CNIncomingCallSnapshotViewController horizontalNameLabelBoundingRectForName:&stru_1ED8AC728 window:v6];
  double v8 = v7;
  double v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 bounds];
  double v13 = (v8 + v10) * 0.125 / v12;

  if ([v5 isEqualToString:*MEMORY[0x1E4F1B888]])
  {
    uint64_t v14 = [[CNPhotosPosterConfigurationReader alloc] initWithPosterConfiguration:v4];
    if ([(CNPhotosPosterConfigurationReader *)v14 hasFaceRectInPosterSnapshot])
    {
      [(CNPhotosPosterConfigurationReader *)v14 faceRectInPosterSnapshotPercentFromTop];
      double v13 = v15 + -0.35;
    }
    double v16 = 1.0;

    goto LABEL_10;
  }
  if (([v5 isEqualToString:*MEMORY[0x1E4F1B878]] & 1) == 0)
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F1B880]])
    {
      double v13 = -v13;
      double v16 = 1.0;
    }
    else
    {
      double v16 = 1.0;
      double v13 = 0.0;
    }
LABEL_10:
    double v17 = 1.0;
    goto LABEL_11;
  }
  double v16 = 1.0;
  double v17 = 0.65;
  double v13 = 0.12;
LABEL_11:

  double v18 = 0.0;
  double v19 = v13;
  double v20 = v16;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.double y = v19;
  result.origin.x = v18;
  return result;
}

- (void)updateLabelColorsForPosterSnapshot:(id)a3
{
  id v4 = a3;
  float v5 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactHeaderStaticDisplayView_updateLabelColorsForPosterSnapshot___block_invoke;
  v7[3] = &unk_1E549BF80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __71__CNContactHeaderStaticDisplayView_updateLabelColorsForPosterSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F5A670] colorsForUIImage:*(void *)(a1 + 40)];
  [v1 updateLabelColorsForImageColors:v2];
}

- (void)assignSnapshotImageToPosterView:(id)a3 configuration:(id)a4 contentIsSensitive:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__CNContactHeaderStaticDisplayView_assignSnapshotImageToPosterView_configuration_contentIsSensitive___block_invoke;
  v13[3] = &unk_1E5497540;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  BOOL v16 = a5;
  id v11 = v8;
  id v12 = v9;
  [v10 performBlock:v13];
}

void __101__CNContactHeaderStaticDisplayView_assignSnapshotImageToPosterView_configuration_contentIsSensitive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) posterView];
  [v2 setContentMode:2];

  id v3 = [*(id *)(a1 + 32) posterView];
  [v3 setClipsToBounds:1];

  [*(id *)(a1 + 32) layerContentsRectForConfiguration:*(void *)(a1 + 40)];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [*(id *)(a1 + 32) posterView];
  double v13 = [v12 layer];
  objc_msgSend(v13, "setContentsRect:", v5, v7, v9, v11);

  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = [*(id *)(a1 + 32) posterView];
  [(id)v15 setImage:v14];

  [*(id *)(a1 + 32) updateSensitiveContentBlurVisibility:*(unsigned __int8 *)(a1 + 56)];
  BOOL v16 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v15) = objc_opt_respondsToSelector();

  if (v15)
  {
    id v17 = [*(id *)(a1 + 32) delegate];
    [v17 headerView:*(void *)(a1 + 32) didSetBackgroundAsPosterSnapshotImage:*(void *)(a1 + 48)];
  }
}

- (void)updateImageViewVisiblity
{
  [(CNContactHeaderStaticDisplayView *)self _updatePhotoView];
  [(CNContactHeaderStaticDisplayView *)self updateAvatarBackgroundViewVisibility];
  uint64_t v3 = [(CNContactHeaderStaticDisplayView *)self shouldShowPoster] ^ 1;
  [(CNContactHeaderStaticDisplayView *)self setPosterViewHidden:v3];
  if ((v3 & 1) == 0)
  {
    double v4 = [(CNContactHeaderView *)self posterView];
    double v5 = [v4 image];

    if (v5)
    {
      double v6 = [(CNContactHeaderView *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v10 = [(CNContactHeaderView *)self delegate];
        double v8 = [(CNContactHeaderView *)self posterView];
        double v9 = [v8 image];
        [v10 headerView:self didSetBackgroundAsPosterSnapshotImage:v9];
      }
    }
    else
    {
      [(CNContactHeaderStaticDisplayView *)self updatePosterViewImage];
    }
  }
}

- (void)setPosterViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CNContactHeaderView *)self posterView];
  [v5 setHidden:v3];

  double v6 = [(CNContactHeaderStaticDisplayView *)self blurView];
  [v6 setHidden:v3];

  if (v3)
  {
    char v7 = [(CNContactHeaderView *)self posterView];
    [v7 setImage:0];

    [(CNContactHeaderStaticDisplayView *)self updateSensitiveContentBlurVisibility:0];
  }
}

- (void)updatePosterViewImage
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([(CNContactHeaderStaticDisplayView *)self shouldShowPoster])
  {
    BOOL v3 = [(CNContactHeaderView *)self posterView];
    [v3 setHidden:0];

    double v4 = [(CNContactHeaderStaticDisplayView *)self blurView];
    [v4 setHidden:0];

    double v5 = [(CNContactHeaderView *)self contacts];
    double v6 = [v5 firstObject];

    char v7 = [v6 identifier];
    double v8 = [(CNContactHeaderStaticDisplayView *)self currentlyDisplayedPosterContactIdentifier];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [(CNContactHeaderView *)self posterView];
      [v10 setImage:0];
    }
    double v11 = [(CNContactHeaderStaticDisplayView *)self cachedPosterConfiguration];

    if (!v11)
    {
      id v12 = [v6 wallpaper];
      double v13 = [v12 posterArchiveData];
      id v40 = 0;
      uint64_t v14 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v13 error:&v40];
      id v15 = v40;
      cachedPosterConfiguration = self->_cachedPosterConfiguration;
      self->_cachedPosterConfiguration = v14;

      if (!self->_cachedPosterConfiguration)
      {
        id v17 = CNUILogPosters();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          char v31 = [v15 localizedDescription];
          *(_DWORD *)buf = 138412290;
          id v42 = v31;
          _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, "Unable to unarchive poster configuration from data, %@", buf, 0xCu);
        }
      }
    }
    double v18 = [(CNContactHeaderStaticDisplayView *)self cachedPosterConfiguration];
    if (!v18) {
      goto LABEL_26;
    }
    double v19 = [v6 identifier];
    [(CNContactHeaderStaticDisplayView *)self setCurrentlyDisplayedPosterContactIdentifier:v19];

    id v33 = [[CNPRUISIncomingCallPosterContext alloc] initWithContact:v6 showName:0];
    double v20 = +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:v33 attachmentIdentifiers:0];
    double v21 = +[CNPRUISPosterSnapshotRequest requestForConfiguration:v18 definition:v20 interfaceOrientation:1];
    double v22 = objc_alloc_init(CNPRUISPosterSnapshotController);
    id v39 = 0;
    double v23 = [(CNPRUISPosterSnapshotController *)v22 latestSnapshotBundleForRequest:v21 error:&v39];
    id v32 = v39;
    if (v23)
    {
      double v24 = objc_msgSend(v20, "levelSets", v32);
      double v25 = [v24 firstObject];
      id v26 = [v23 snapshotForLevelSet:v25];

      double v27 = CNUILogPosters();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18B625000, v27, OS_LOG_TYPE_DEBUG, "Returning cached snapshot", buf, 2u);
      }

      if (v26)
      {
        uint64_t v28 = [v6 wallpaper];
        -[CNContactHeaderStaticDisplayView assignSnapshotImageToPosterView:configuration:contentIsSensitive:](self, "assignSnapshotImageToPosterView:configuration:contentIsSensitive:", v26, v18, [v28 contentIsSensitive]);

        [(CNContactHeaderStaticDisplayView *)self updateLabelColorsForPosterSnapshot:v26];
LABEL_25:

LABEL_26:
        return;
      }
    }
    else
    {
      uint64_t v29 = CNUILogPosters();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v29, OS_LOG_TYPE_DEFAULT, "No snapshot found in cache", buf, 2u);
      }
    }
    uint64_t v30 = CNUILogPosters();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B625000, v30, OS_LOG_TYPE_DEFAULT, "Requesting poster snapshot", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__CNContactHeaderStaticDisplayView_updatePosterViewImage__block_invoke;
    v34[3] = &unk_1E5497518;
    objc_copyWeak(&v38, (id *)buf);
    id v35 = v20;
    id v36 = v18;
    id v37 = v6;
    [(CNPRUISPosterSnapshotController *)v22 executeSnapshotRequest:v21 completion:v34];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
    goto LABEL_25;
  }

  [(CNContactHeaderStaticDisplayView *)self setPosterViewHidden:1];
}

void __57__CNContactHeaderStaticDisplayView_updatePosterViewImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    double v6 = [v4 snapshotBundle];
    char v7 = [*(id *)(a1 + 32) levelSets];
    double v8 = [v7 firstObject];
    char v9 = [v6 snapshotForLevelSet:v8];

    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      double v11 = [*(id *)(a1 + 48) wallpaper];
      -[NSObject assignSnapshotImageToPosterView:configuration:contentIsSensitive:](WeakRetained, "assignSnapshotImageToPosterView:configuration:contentIsSensitive:", v9, v10, [v11 contentIsSensitive]);

      [WeakRetained updateLabelColorsForPosterSnapshot:v9];
    }
    else
    {
      id v12 = CNUILogPosters();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Snapshot result returned a nil image", buf, 2u);
      }
    }
  }
  else
  {
    id WeakRetained = CNUILogPosters();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      _os_log_error_impl(&dword_18B625000, WeakRetained, OS_LOG_TYPE_ERROR, "Snapshot request returned no result", v13, 2u);
    }
  }
}

- (void)setUpPosterView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v8 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setAccessibilityIdentifier:@"ContactPosterView"];
  [(CNContactHeaderStaticDisplayView *)self addSubview:v8];
  [(CNContactHeaderStaticDisplayView *)self sendSubviewToBack:v8];
  [(CNContactHeaderView *)self setPosterView:v8];
  id v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
  double v5 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v4 style:1];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v7 = [(CNContactHeaderView *)self nameLabel];
  [(CNContactHeaderStaticDisplayView *)self insertSubview:v6 belowSubview:v7];

  [(CNContactHeaderStaticDisplayView *)self setBlurView:v6];
}

- (void)setDefaultLabelColors
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor];
  id v4 = +[CNUIColorRepository contactCardStaticHeaderDefaultTaglineTextColor];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v8[0] = v3;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v5];

  double v6 = [(CNContactHeaderStaticDisplayView *)self taglineLabel];
  [v6 setTextColor:v4];
}

- (double)height
{
  [(CNContactHeaderStaticDisplayView *)self labelsHeight];
  if (v3 == 0.0) {
    [(CNContactHeaderStaticDisplayView *)self calculateLabelSizesIfNeeded];
  }
  BOOL v4 = [(CNContactHeaderView *)self isAXSize];
  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinTopMargin];
  double v6 = v5;
  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinHeight];
  double v8 = v7;
  [(CNContactHeaderStaticDisplayView *)self staticHeaderPhotoMinBottomMargin];
  double v10 = v9;
  [(CNContactHeaderStaticDisplayView *)self labelsHeight];
  double v12 = v11;
  double v13 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
  [v13 frame];
  double v15 = v14;

  BOOL v16 = [(CNContactHeaderStaticDisplayView *)self actionsWrapperView];
  if (v16) {
    int v17 = v4;
  }
  else {
    int v17 = 1;
  }
  if (v17) {
    double v18 = 0.0;
  }
  else {
    double v18 = v15;
  }

  double v19 = [(CNContactHeaderView *)self sizeAttributes];
  [v19 headerBottomMargin];
  double v21 = v20;

  return v6 + v8 + v10 + v12 + v18 + v21;
}

- (double)bottomMargin
{
  id v2 = [(CNContactHeaderView *)self sizeAttributes];
  [v2 headerBottomMargin];
  double v4 = v3;

  return v4;
}

- (void)updateWithContacts:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactHeaderStaticDisplayView;
  [(CNContactHeaderView *)&v5 updateWithContacts:a3];
  cachedPosterConfiguration = self->_cachedPosterConfiguration;
  self->_cachedPosterConfiguration = 0;
}

- (void)didFinishUsing
{
  if ((CNContactHeaderStaticDisplayView *)sStaticDisplayContactHeaderView == self)
  {
    sStaticDisplayContactHeaderView = 0;
  }
}

- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)CNContactHeaderStaticDisplayView;
  double v8 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v44, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, a5, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v8)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel_handleNameLabelTap_];
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v8 action:sel_handleNameLabelLongPress_];
    id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    BOOL v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    [(CNContactHeaderView *)v8 setNameLabel:v16];

    int v17 = [(CNContactHeaderView *)v8 nameLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v18 = [(CNContactHeaderView *)v8 nameLabel];
    [v18 setTextAlignment:1];

    if ([(CNContactHeaderView *)v8 isAXSize]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 2;
    }
    double v20 = [(CNContactHeaderView *)v8 nameLabel];
    [v20 setNumberOfLines:v19];

    double v21 = [(CNContactHeaderView *)v8 nameLabel];
    [v21 setUserInteractionEnabled:1];

    double v22 = [(CNContactHeaderStaticDisplayView *)v8 tintColor];
    double v23 = [(CNContactHeaderView *)v8 nameLabel];
    [v23 setHighlightedTextColor:v22];

    double v24 = [(CNContactHeaderView *)v8 nameLabel];
    [v24 addGestureRecognizer:v9];

    double v25 = [(CNContactHeaderView *)v8 nameLabel];
    [v25 addGestureRecognizer:v10];

    id v26 = [(CNContactHeaderView *)v8 nameLabel];
    objc_msgSend(v26, "_cnui_applyContactStyle");

    double v27 = [(CNContactHeaderView *)v8 nameLabel];
    [(CNContactHeaderStaticDisplayView *)v8 addSubview:v27];

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
    taglineLabel = v8->_taglineLabel;
    v8->_taglineLabel = (UILabel *)v28;

    [(UILabel *)v8->_taglineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_taglineLabel setTextAlignment:1];
    [(UILabel *)v8->_taglineLabel setNumberOfLines:0];
    [(UILabel *)v8->_taglineLabel setLineBreakMode:0];
    uint64_t v30 = [(CNContactHeaderView *)v8 contactStyle];
    char v31 = [v30 taglineTextColor];
    [(UILabel *)v8->_taglineLabel setTextColor:v31];

    [(UILabel *)v8->_taglineLabel _cnui_applyContactStyle];
    [(CNContactHeaderStaticDisplayView *)v8 addSubview:v8->_taglineLabel];
    [(CNContactHeaderStaticDisplayView *)v8 updateFontSizes];
    id v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v8 selector:sel_menuWillHide_ name:*MEMORY[0x1E4FB2CB8] object:0];

    id v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v8 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    v8->_allowsPickerActions = 1;
    [(CNContactHeaderStaticDisplayView *)v8 setUpPosterView];
    [(CNContactHeaderStaticDisplayView *)v8 setUpAvatarBackgroundView];
    [(CNContactHeaderStaticDisplayView *)v8 setDefaultLabelColors];
    v45[0] = objc_opt_class();
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    uint64_t v35 = [(CNContactHeaderStaticDisplayView *)v8 registerForTraitChanges:v34 withTarget:v8 action:sel_traitEnvironment_didChangeTraitCollection_];
    traitChangeRegistration = v8->_traitChangeRegistration;
    v8->_traitChangeRegistration = (UITraitChangeRegistration *)v35;

    id v37 = objc_alloc_init(CNContactGeminiIconProvider);
    geminiIconProvider = v8->_geminiIconProvider;
    v8->_geminiIconProvider = v37;

    id v39 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E4F5A598]);
    metricsReporter = v8->_metricsReporter;
    v8->_metricsReporter = v39;

    uint64_t v41 = +[CNSensitiveContentAnalysisManager defaultManager];
    sensitiveContentManager = v8->_sensitiveContentManager;
    v8->_sensitiveContentManager = (CNSensitiveContentAnalysisManager *)v41;
  }
  return v8;
}

- (CNContactHeaderStaticDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  return -[CNContactHeaderStaticDisplayView initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](self, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)descriptorForRequiredKeys
{
  double v3 = objc_opt_class();
  double v4 = [(CNContactHeaderStaticDisplayView *)self contactFormatter];
  objc_super v5 = [v3 descriptorForRequiredKeysForContactFormatter:v4];

  return v5;
}

@end