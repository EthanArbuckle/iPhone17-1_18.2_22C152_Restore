@interface CNContactHeaderDisplayView
+ (id)contactHeaderViewWithContact:(id)a3 allowsPhotoDrops:(BOOL)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7;
+ (id)contactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6;
+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3;
+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5;
+ (id)sizeAttributesShowingNavBar:(BOOL)a3;
- (BOOL)allowsPickerActions;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isDowntimeContact;
- (BOOL)isEmergencyContact;
- (BOOL)isRestrictedContact;
- (BOOL)shouldShowGemini;
- (BOOL)usesBrandedCallFormat;
- (CNContactDowntimeView)downtimeView;
- (CNContactFormatter)contactFormatter;
- (CNContactGeminiIconProvider)geminiIconProvider;
- (CNContactGeminiView)geminiView;
- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8;
- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7;
- (CNGeminiPickerController)geminiPicker;
- (CNGeminiResult)geminiResult;
- (CNMetricsUIReporter)metricsReporter;
- (NSDictionary)importantTextAttributes;
- (NSDictionary)taglineTextAttributes;
- (NSLayoutConstraint)avatarNameSpacingConstraint;
- (NSString)alternateName;
- (NSString)importantMessage;
- (NSString)message;
- (UILabel)importantLabel;
- (UILabel)taglineLabel;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)personHeaderView;
- (double)defaultMaxHeight;
- (double)maxHeight;
- (double)maxLabelsHeight;
- (double)minHeight;
- (double)minLabelsHeight;
- (id)_headerStringForContacts:(id)a3;
- (id)_importantString;
- (id)_taglinesForContacts:(id)a3;
- (id)_unknownContactActionForGeminiView;
- (id)descriptorForRequiredKeys;
- (id)downtimeTextAttributes;
- (id)geminiTextAttributes;
- (unint64_t)avatarStyle;
- (void)_assignActionToGeminiView;
- (void)_geminiViewBehaviorForSavedContact;
- (void)_geminiViewBehaviorForUnknownContact;
- (void)_presentViewControllerForGemini;
- (void)_updateDowntimeView;
- (void)_updateImportantLabel;
- (void)_updatePhotoView;
- (void)calculateLabelSizes;
- (void)calculateLabelSizesIfNeeded;
- (void)copy:(id)a3;
- (void)createGeminiViewIfNeeded;
- (void)dealloc;
- (void)didFinishUsing;
- (void)disablePhotoTapGesture;
- (void)geminiViewDidPickPreferredChannel:(id)a3;
- (void)handleGeminiViewTouch:(id)a3;
- (void)handleNameLabelLongPress:(id)a3;
- (void)handleNameLabelTap:(id)a3;
- (void)layoutSubviews;
- (void)menuWillHide:(id)a3;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)setAllowsPickerActions:(BOOL)a3;
- (void)setAlternateName:(id)a3;
- (void)setAvatarNameSpacingConstraint:(id)a3;
- (void)setAvatarStyle:(unint64_t)a3;
- (void)setContactFormatter:(id)a3;
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
- (void)setMaxLabelsHeight:(double)a3;
- (void)setMessage:(id)a3;
- (void)setMinLabelsHeight:(double)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setShouldShowGemini:(BOOL)a3;
- (void)setTaglineLabel:(id)a3;
- (void)setTaglineTextAttributes:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setUsesBrandedCallFormat:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateConstraints;
- (void)updateFontSizes;
- (void)updateGeminiResult:(id)a3;
- (void)updateSizeDependentAttributes;
@end

@implementation CNContactHeaderDisplayView

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CNContactHeaderDisplayView;
  v6 = objc_msgSendSuper2(&v13, sel_descriptorForRequiredKeys);
  v7 = [v5 arrayWithObject:v6];

  if (v4)
  {
    v8 = [v4 descriptorForRequiredKeys];
    [v7 addObject:v8];
  }
  v9 = (void *)MEMORY[0x1E4F1B8F8];
  v10 = [NSString stringWithUTF8String:"+[CNContactHeaderDisplayView descriptorForRequiredKeysForContactFormatter:]"];
  v11 = [v9 descriptorWithKeyDescriptors:v7 description:v10];

  return v11;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3) {
    +[CNContactHeaderViewSizeAttributes displayAttributesWithNavBar];
  }
  else {
  v3 = +[CNContactHeaderViewSizeAttributes displayAttributes];
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
  v14 = [(id)sDisplayContactHeaderView delegate];
  if (v14)
  {

LABEL_4:
    id v15 = objc_alloc((Class)a1);
    id v16 = (id)objc_msgSend(v15, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_5:
    id v17 = v16;
    goto LABEL_6;
  }
  if ([(id)sDisplayContactHeaderView showMonogramsOnly] != v8) {
    goto LABEL_4;
  }
  if (!sDisplayContactHeaderView)
  {
    id v19 = objc_alloc((Class)a1);
    uint64_t v20 = objc_msgSend(v19, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", v12, v10, v9, v8, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v21 = (void *)sDisplayContactHeaderView;
    sDisplayContactHeaderView = v20;

    id v16 = (id)sDisplayContactHeaderView;
    goto LABEL_5;
  }
  id v17 = (id)sDisplayContactHeaderView;
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
  v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v13, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", v7, 1, v9, v6, v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsReporter, 0);
  objc_storeStrong((id *)&self->_geminiIconProvider, 0);
  objc_storeStrong((id *)&self->_geminiPicker, 0);
  objc_storeStrong((id *)&self->_geminiResult, 0);
  objc_storeStrong((id *)&self->_geminiView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_avatarNameSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_downtimeView, 0);
  objc_storeStrong((id *)&self->_importantLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_importantTextAttributes, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_geminiTextAttributes, 0);
  objc_storeStrong((id *)&self->_downtimeTextAttributes, 0);

  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
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
  return (CNGeminiResult *)objc_getProperty(self, a2, 720, 1);
}

- (void)setGeminiView:(id)a3
{
}

- (CNContactGeminiView)geminiView
{
  return (CNContactGeminiView *)objc_getProperty(self, a2, 712, 1);
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return (UITraitChangeRegistration *)objc_getProperty(self, a2, 704, 1);
}

- (void)setAvatarNameSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)avatarNameSpacingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 696, 1);
}

- (void)setMaxLabelsHeight:(double)a3
{
  self->_maxLabelsHeight = a3;
}

- (double)maxLabelsHeight
{
  return self->_maxLabelsHeight;
}

- (void)setMinLabelsHeight:(double)a3
{
  self->_minLabelsHeight = a3;
}

- (double)minLabelsHeight
{
  return self->_minLabelsHeight;
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
  return (UILabel *)objc_getProperty(self, a2, 656, 1);
}

- (void)setPersonHeaderView:(id)a3
{
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
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

- (void)dealloc
{
  v3 = [(CNContactHeaderDisplayView *)self traitChangeRegistration];
  [(CNContactHeaderDisplayView *)self unregisterForTraitChanges:v3];

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v4 dealloc];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CNContactHeaderDisplayView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    BOOL v9 = [(CNContactHeaderView *)self contacts];
    BOOL v10 = [v9 firstObject];
    char v11 = [v10 hasBeenPersisted];

    if ((v11 & 1) == 0)
    {
      id v12 = [(CNContactHeaderDisplayView *)self geminiView];
      id v13 = [v12 contextMenuInteraction];
      [v13 dismissMenu];

      v14 = [(CNContactHeaderDisplayView *)self geminiIconProvider];
      [v14 updateGeminiIcons];

      [(CNContactHeaderDisplayView *)self _geminiViewBehaviorForUnknownContact];
    }
  }
}

- (void)_presentViewControllerForGemini
{
  v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  objc_super v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:7];

  if (!v5
    || ([(CNContactHeaderView *)self contacts],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        [v6 firstObject],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasBeenPersisted],
        v7,
        v6,
        v8))
  {
    BOOL v9 = [CNGeminiPickerController alloc];
    BOOL v10 = [(CNContactHeaderDisplayView *)self geminiResult];
    id v12 = [(CNGeminiPickerController *)v9 initWithGeminiResult:v10];

    [(CNContactHeaderDisplayView *)self setGeminiPicker:v12];
    [(CNGeminiPickerController *)v12 setDelegate:self];
    char v11 = [(CNContactHeaderView *)self presenterDelegate];
    [v11 sender:self presentViewController:v12];
  }
}

- (void)handleGeminiViewTouch:(id)a3
{
  id v4 = a3;
  int v5 = [(CNContactHeaderDisplayView *)self geminiView];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  BOOL v10 = [(CNContactHeaderDisplayView *)self geminiView];
  [v10 bounds];
  v22.x = v7;
  v22.y = v9;
  uint64_t v11 = CGRectContainsPoint(v23, v22);

  uint64_t v12 = [v4 state];
  switch(v12)
  {
    case 4:
LABEL_12:
      id v16 = [(CNContactHeaderDisplayView *)self geminiView];
      id v20 = v16;
      uint64_t v17 = 0;
      goto LABEL_13;
    case 3:
      if (v11)
      {
        v18 = [(CNContactHeaderDisplayView *)self geminiView];
        int v19 = [v18 allowsPickerActions];

        if (v19) {
          [(CNContactHeaderDisplayView *)self _presentViewControllerForGemini];
        }
      }
      goto LABEL_12;
    case 2:
      if (v11)
      {
        id v13 = [(CNContactHeaderDisplayView *)self geminiView];
        uint64_t v11 = [v13 allowsPickerActions];
      }
      v14 = [(CNContactHeaderDisplayView *)self geminiView];
      int v15 = [v14 isHighlighted];

      if (v11 != v15)
      {
        id v16 = [(CNContactHeaderDisplayView *)self geminiView];
        id v20 = v16;
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
  int v5 = [(CNContactHeaderDisplayView *)self geminiView];
  [v5 setNeedsCalculateLayout];

  double v6 = [(CNContactHeaderDisplayView *)self geminiView];
  [v6 calculateLayoutIfNeeded];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderDisplayView *)self setNeedsLayout];
  id v7 = [(CNContactHeaderView *)self delegate];
  [v7 headerViewDidPickPreferredChannel:v4];
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  int v5 = [(CNContactHeaderView *)self presenterDelegate];
  [v5 sender:self dismissViewController:v4];

  double v6 = [(CNContactHeaderDisplayView *)self geminiView];
  [v6 setHighlighted:0];

  [(CNContactHeaderDisplayView *)self setGeminiPicker:0];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CNContactHeaderDisplayView *)self geminiView];
  [v8 setNeedsCalculateLayout];

  CGFloat v9 = [(CNContactHeaderDisplayView *)self geminiView];
  [v9 calculateLayoutIfNeeded];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderDisplayView *)self setNeedsLayout];
  id v13 = [MEMORY[0x1E4F1B9F8] channelStringFromSenderIdentity:v6];

  BOOL v10 = [(CNContactHeaderView *)self delegate];
  [v10 headerViewDidPickPreferredChannel:v13];

  uint64_t v11 = [(CNContactHeaderView *)self presenterDelegate];
  [v11 sender:self dismissViewController:v7];

  uint64_t v12 = [(CNContactHeaderDisplayView *)self geminiView];
  [v12 setHighlighted:0];

  [(CNContactHeaderDisplayView *)self setGeminiPicker:0];
}

- (id)_unknownContactActionForGeminiView
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactHeaderDisplayView *)self geminiResult];
  id v4 = [v3 availableChannels];

  CGPoint v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
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
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__CNContactHeaderDisplayView__unknownContactActionForGeminiView__block_invoke;
        aBlock[3] = &unk_1E54974F0;
        objc_copyWeak(&v25, &location);
        aBlock[4] = v6;
        id v7 = _Block_copy(aBlock);
        double v8 = (void *)MEMORY[0x1E4FB13F0];
        CGFloat v9 = [v6 localizedLabel];
        BOOL v10 = [v8 actionWithTitle:v9 image:0 identifier:0 handler:v7];

        uint64_t v11 = [v6 senderIdentity];
        uint64_t v12 = [(CNContactHeaderDisplayView *)self geminiResult];
        id v13 = [v12 channel];
        v14 = [v13 senderIdentity];
        [v10 setState:v11 == v14];

        int v15 = [(CNContactHeaderDisplayView *)self geminiIconProvider];
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

  v18 = (void *)[v22 copy];

  return v18;
}

void __64__CNContactHeaderDisplayView__unknownContactActionForGeminiView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained metricsReporter];
  v3 = [WeakRetained geminiResult];
  id v4 = [v3 channel];
  objc_msgSend(v2, "logUnknownContactGeminiViewDifferentChannelSelected:", objc_msgSend(v4, "isEqual:", *(void *)(a1 + 32)) ^ 1);

  int v5 = [*(id *)(a1 + 32) senderIdentity];
  id v6 = [MEMORY[0x1E4F1B9F8] channelStringFromSenderIdentity:v5];
  [WeakRetained geminiViewDidPickPreferredChannel:v6];
}

- (void)_geminiViewBehaviorForUnknownContact
{
  v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:7];

  if (v5)
  {
    id v9 = [(CNContactHeaderDisplayView *)self _unknownContactActionForGeminiView];
    id v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v9];
    id v7 = [(CNContactHeaderDisplayView *)self geminiView];
    [v7 setMenu:v6];

    double v8 = [(CNContactHeaderDisplayView *)self geminiView];
    [v8 setShowsMenuAsPrimaryAction:1];
  }
}

- (void)_geminiViewBehaviorForSavedContact
{
  v3 = [(CNContactHeaderDisplayView *)self geminiView];
  [v3 setMenu:0];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_handleGeminiViewTouch_];
  [v5 setMinimumPressDuration:0.001];
  id v4 = [(CNContactHeaderDisplayView *)self geminiView];
  [v4 addGestureRecognizer:v5];
}

- (void)_assignActionToGeminiView
{
  v3 = [(CNContactHeaderView *)self contacts];
  id v4 = [v3 firstObject];
  int v5 = [v4 hasBeenPersisted];

  if (v5)
  {
    [(CNContactHeaderDisplayView *)self _geminiViewBehaviorForSavedContact];
  }
  else
  {
    [(CNContactHeaderDisplayView *)self _geminiViewBehaviorForUnknownContact];
  }
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
    && [(CNContactHeaderDisplayView *)self becomeFirstResponder])
  {
    id v7 = [MEMORY[0x1E4FB1978] sharedMenuController];
    double v8 = [(CNContactHeaderView *)self nameLabel];
    id v9 = [(CNContactHeaderView *)self nameLabel];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [(CNContactHeaderView *)self nameLabel];
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
  id v3 = [(CNContactHeaderDisplayView *)self importantMessage];
  if ([(CNContactHeaderDisplayView *)self isEmergencyContact])
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

- (id)_taglinesForContacts:(id)a3
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
    [v5 addObject:v12];

    uint64_t v13 = *MEMORY[0x1E4F5A2A0];
    goto LABEL_39;
  }
  id v6 = [v4 firstObject];

  if ([v6 contactType] == 1)
  {
    if ([(CNContactHeaderDisplayView *)self usesBrandedCallFormat]) {
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
      [v5 addObject:v17];
    }
    v18 = [v6 nickname];
    if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v18))
    {
      double v19 = [(CNContactHeaderView *)self delegate];
      char v20 = [v19 isNicknameProhibited];

      if (v20) {
        goto LABEL_19;
      }
      double v21 = NSString;
      v18 = CNContactsUIBundle();
      double v22 = [v18 localizedStringForKey:@"CARD_NAME_NICKNAME_FORMAT-%@" value:&stru_1ED8AC728 table:@"Localized"];
      double v23 = [v6 nickname];
      double v24 = objc_msgSend(v21, "stringWithFormat:", v22, v23);
      [v5 addObject:v24];
    }
LABEL_19:
    double v25 = [v6 previousFamilyName];
    int v26 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

    if (v26)
    {
      long long v27 = [v6 previousFamilyName];
      [v5 addObject:v27];
    }
    long long v28 = [v6 jobTitle];
    int v29 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v28);

    long long v30 = [v6 departmentName];
    int v31 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v30);

    if (v29)
    {
      if (v31)
      {
        uint64_t v32 = NSString;
        v33 = [v6 jobTitle];
        v51 = CNContactsUIBundle();
        v34 = [v51 localizedStringForKey:@"CARD_NAME_JOB_TITLE_DEPARTMENT_SEPARATOR" value:&stru_1ED8AC728 table:@"Localized"];
        v35 = [v6 departmentName];
        v36 = [v32 stringWithFormat:@"%@%@%@", v33, v34, v35];
        [v5 addObject:v36];

LABEL_28:
LABEL_29:
        v38 = [v6 organizationName];
        int v39 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v38);

        if (v39)
        {
          v40 = [v6 organizationName];
          [v5 addObject:v40];
        }
        v41 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        v42 = [v41 featureFlags];
        if ([v42 isFeatureEnabled:12]
          && ([v6 isKeyAvailable:*MEMORY[0x1E4F1AD88]] & 1) != 0)
        {
          uint64_t v43 = *MEMORY[0x1E4F5A258];
          v44 = [v6 termsOfAddress];
          LOBYTE(v43) = (*(uint64_t (**)(uint64_t, void *))(v43 + 16))(v43, v44);

          if (v43) {
            goto LABEL_38;
          }
          v45 = (void *)MEMORY[0x1E4F29040];
          v46 = [v6 termsOfAddress];
          v41 = [v45 localizedDescriptionForAddressingGrammars:v46];

          if ((*(unsigned int (**)(uint64_t, void *))(v13 + 16))(v13, v41)) {
            [v5 addObject:v41];
          }
        }
        else
        {
        }
        goto LABEL_38;
      }
      uint64_t v37 = [v6 jobTitle];
    }
    else
    {
      if (!v31) {
        goto LABEL_29;
      }
      uint64_t v37 = [v6 departmentName];
    }
    v33 = (void *)v37;
    [v5 addObject:v37];
    goto LABEL_28;
  }
  double v15 = [(CNContactHeaderDisplayView *)self alternateName];
  int v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

  if (!v16) {
    goto LABEL_13;
  }
  double v17 = [(CNContactHeaderDisplayView *)self alternateName];
LABEL_11:
  [v5 addObject:v17];
LABEL_38:

LABEL_39:
  v47 = [(CNContactHeaderDisplayView *)self message];
  int v48 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v47);

  if (v48)
  {
    v49 = [(CNContactHeaderDisplayView *)self message];
    [v5 addObject:v49];
  }

  return v5;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    if ([(CNContactHeaderDisplayView *)self usesBrandedCallFormat])
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
    double v15 = [(CNContactHeaderDisplayView *)self contactFormatter];
    int v16 = [v4 firstObject];
    double v14 = [v15 stringFromContact:v16];
  }
  else
  {
    double v14 = 0;
  }
  if (![v14 length])
  {
    uint64_t v17 = [(CNContactHeaderDisplayView *)self alternateName];

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
  v25.receiver = self;
  v25.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v25 reloadDataPreservingChanges:a3];
  [(CNContactHeaderDisplayView *)self _assignActionToGeminiView];
  id v4 = [(CNContactHeaderView *)self contacts];
  uint64_t v5 = [(CNContactHeaderDisplayView *)self _headerStringForContacts:v4];

  id v6 = [(CNContactHeaderView *)self contacts];
  uint64_t v7 = [(CNContactHeaderDisplayView *)self _taglinesForContacts:v6];

  char v8 = [v7 componentsJoinedByString:@"\n"];
  id v9 = [(CNContactHeaderDisplayView *)self _importantString];
  [(CNContactHeaderDisplayView *)self _updateImportantLabel];
  [(CNContactHeaderDisplayView *)self _updateDowntimeView];
  id v10 = [(CNContactHeaderDisplayView *)self message];
  if ([v8 isEqualToString:v10])
  {
    uint64_t v11 = [v5 length];

    if (v11) {
      goto LABEL_5;
    }
    id v10 = v5;
    uint64_t v5 = v8;
    char v8 = 0;
  }

LABEL_5:
  if (![v8 length])
  {

    char v8 = 0;
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
  double v15 = [(CNContactHeaderDisplayView *)self taglineLabel];
  int v16 = [v15 text];
  uint64_t v17 = v16;
  if (!v8)
  {
    if (!v16)
    {
LABEL_18:
      double v24 = v7;
      double v19 = [(CNContactHeaderDisplayView *)self importantLabel];
      char v20 = [v19 text];
      if (v9)
      {
        if (v20)
        {

          BOOL v18 = 0;
        }
        else
        {

          BOOL v18 = 1;
        }
      }
      else
      {
        BOOL v18 = v20 != 0;
      }
      uint64_t v7 = v24;
      if (!v8) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }

    if (!v5)
    {
LABEL_17:

LABEL_28:
      [(CNContactHeaderDisplayView *)self setNeedsUpdateConstraints];
      goto LABEL_29;
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v16) {
    goto LABEL_18;
  }
  BOOL v18 = 1;
LABEL_24:

LABEL_25:
  if (v5) {

  }
  if (v18) {
    goto LABEL_28;
  }
LABEL_29:
  double v21 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v21, "setAb_text:", v5);

  double v22 = [(CNContactHeaderDisplayView *)self taglineLabel];
  objc_msgSend(v22, "setAb_text:", v8);

  double v23 = [(CNContactHeaderDisplayView *)self importantLabel];
  objc_msgSend(v23, "setAb_text:", v9);

  [(CNContactHeaderDisplayView *)self _updatePhotoView];
  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderDisplayView *)self calculateLabelSizes];
  [(CNContactHeaderDisplayView *)self setNeedsLayout];
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
  id v17 = a3;
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v5 = [v4 featureFlags];
  id v6 = (void *)[v5 isFeatureEnabled:7];

  BOOL v7 = [(CNContactHeaderDisplayView *)self allowsPickerActions];
  BOOL v8 = v7;
  if (v6)
  {
    uint64_t v5 = [(CNContactHeaderDisplayView *)self geminiView];
    [v5 setAllowsPickerActions:v8];
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    uint64_t v5 = [(CNContactHeaderView *)self contacts];
    id v6 = [v5 firstObject];
    uint64_t v9 = [v6 hasBeenPersisted];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [(CNContactHeaderDisplayView *)self geminiView];
  [v10 setAllowsPickerActions:v9];

  if (v8)
  {

    goto LABEL_8;
  }
LABEL_9:
  [(CNContactHeaderDisplayView *)self setGeminiResult:v17];
  uint64_t v11 = [(CNContactHeaderDisplayView *)self geminiView];
  [v11 setGeminiResult:v17];

  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  double v12 = [(CNContactHeaderView *)self contacts];
  uint64_t v13 = [v12 firstObject];
  int v14 = [v13 hasBeenPersisted];

  if (v14)
  {
    double v15 = [(CNContactHeaderDisplayView *)self geminiPicker];
    [v15 setGeminiResult:v17];
  }
  else
  {
    int v16 = [(CNContactHeaderDisplayView *)self geminiIconProvider];
    [v16 setGeminiResult:v17];

    [(CNContactHeaderDisplayView *)self _geminiViewBehaviorForUnknownContact];
  }
}

- (void)_updateDowntimeView
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactHeaderDisplayView *)self downtimeView];
  if (v3)
  {
    id v4 = [(CNContactHeaderDisplayView *)self downtimeView];
    int v5 = [v4 isHidden];
  }
  else
  {
    int v5 = 1;
  }

  if ([(CNContactHeaderDisplayView *)self isDowntimeContact]
    || [(CNContactHeaderDisplayView *)self isRestrictedContact])
  {
    id v6 = [(CNContactHeaderDisplayView *)self downtimeView];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (![(CNContactHeaderDisplayView *)self isDowntimeContact])
  {
    uint64_t v8 = [(CNContactHeaderDisplayView *)self isRestrictedContact] ^ 1;
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v8 = 0;
  if (v7)
  {
LABEL_12:
    uint64_t v9 = [CNContactDowntimeView alloc];
    id v10 = -[CNContactDowntimeView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNContactHeaderDisplayView *)self setDowntimeView:v10];

    uint64_t v11 = [(CNContactHeaderDisplayView *)self downtimeView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22[0] = *MEMORY[0x1E4FB2950];
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v21[0] = @"ABTextStyleAttributeName";
    v21[1] = v12;
    uint64_t v13 = [(CNContactHeaderView *)self contactStyle];
    int v14 = [v13 taglineTextColor];
    v22[1] = v14;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [(CNContactHeaderDisplayView *)self setDowntimeTextAttributes:v15];

    int v16 = [(CNContactHeaderDisplayView *)self downtimeView];
    [(CNContactHeaderDisplayView *)self addSubview:v16];
  }
LABEL_13:
  if ([(CNContactHeaderDisplayView *)self isDowntimeContact]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v17 | [(CNContactHeaderDisplayView *)self isRestrictedContact];
  double v19 = [(CNContactHeaderDisplayView *)self downtimeView];
  [v19 setElements:v18];

  char v20 = [(CNContactHeaderDisplayView *)self downtimeView];
  [v20 setHidden:v8];

  if (v5) {
    [(CNContactHeaderDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateImportantLabel
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactHeaderDisplayView *)self importantLabel];
  if (v3)
  {
    id v4 = [(CNContactHeaderDisplayView *)self importantLabel];
    int v5 = [v4 isHidden];
  }
  else
  {
    int v5 = 1;
  }

  id v6 = [(CNContactHeaderDisplayView *)self _importantString];
  if (v6)
  {
    BOOL v7 = [(CNContactHeaderDisplayView *)self importantLabel];

    if (!v7)
    {
      uint64_t v8 = *MEMORY[0x1E4FB2950];
      uint64_t v9 = *MEMORY[0x1E4FB0700];
      v22[0] = @"ABTextStyleAttributeName";
      v22[1] = v9;
      v23[0] = v8;
      id v10 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
      v23[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      [(CNContactHeaderDisplayView *)self setImportantTextAttributes:v11];

      id v12 = objc_alloc(MEMORY[0x1E4FB1930]);
      uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CNContactHeaderDisplayView *)self setImportantLabel:v13];

      int v14 = [(CNContactHeaderDisplayView *)self importantLabel];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v15 = [(CNContactHeaderDisplayView *)self importantLabel];
      [v15 setTextAlignment:1];

      int v16 = [(CNContactHeaderDisplayView *)self importantLabel];
      [v16 setNumberOfLines:0];

      uint64_t v17 = [(CNContactHeaderDisplayView *)self importantLabel];
      [v17 _setUseShortcutIntrinsicContentSize:1];

      uint64_t v18 = [(CNContactHeaderDisplayView *)self importantLabel];
      objc_msgSend(v18, "_cnui_applyContactStyle");

      double v19 = [(CNContactHeaderDisplayView *)self importantLabel];
      [(CNContactHeaderDisplayView *)self addSubview:v19];
    }
  }
  char v20 = [(CNContactHeaderDisplayView *)self importantLabel];
  [v20 setHidden:v6 == 0];

  double v21 = [(CNContactHeaderDisplayView *)self importantLabel];
  LODWORD(v20) = [v21 isHidden];

  if (v5 != v20) {
    [(CNContactHeaderDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updatePhotoView
{
  id v8 = [(CNContactHeaderView *)self photoView];
  int v3 = [v8 isHidden];
  id v4 = [(CNContactHeaderView *)self contacts];
  if ((unint64_t)[v4 count] > 1)
  {
    [v8 setHidden:0];
  }
  else
  {
    int v5 = [(CNContactHeaderView *)self contacts];
    id v6 = [v5 firstObject];
    if ([v6 imageDataAvailable]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(CNContactHeaderView *)self alwaysShowsMonogram] ^ 1;
    }
    [v8 setHidden:v7];
  }
  if (v3 != [v8 isHidden]) {
    [(CNContactHeaderDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (id)geminiTextAttributes
{
  return self->_geminiTextAttributes;
}

- (void)setGeminiTextAttributes:(id)a3
{
  id v6 = (NSDictionary *)a3;
  if (self->_geminiTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_geminiTextAttributes, a3);
    int v5 = [(CNContactHeaderDisplayView *)self geminiView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (id)downtimeTextAttributes
{
  return self->_downtimeTextAttributes;
}

- (void)setDowntimeTextAttributes:(id)a3
{
  id v6 = (NSDictionary *)a3;
  if (self->_downtimeTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_downtimeTextAttributes, a3);
    int v5 = [(CNContactHeaderDisplayView *)self downtimeView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (void)setImportantTextAttributes:(id)a3
{
  id v6 = (NSDictionary *)a3;
  if (self->_importantTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_importantTextAttributes, a3);
    int v5 = [(CNContactHeaderDisplayView *)self importantLabel];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (void)setTaglineTextAttributes:(id)a3
{
  id v6 = (NSDictionary *)a3;
  if (self->_taglineTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_taglineTextAttributes, a3);
    int v5 = [(CNContactHeaderDisplayView *)self taglineLabel];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (void)setNameTextAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderDisplayView;
  id v4 = a3;
  [(CNContactHeaderView *)&v6 setNameTextAttributes:v4];
  int v5 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v5, "setAb_textAttributes:", v4);
}

- (void)updateSizeDependentAttributes
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v31 updateSizeDependentAttributes];
  int v3 = [MEMORY[0x1E4FB1978] sharedMenuController];
  if ([v3 isMenuVisible]) {
    [v3 hideMenu];
  }
  [(CNContactHeaderDisplayView *)self bounds];
  if (v4 > 0.0)
  {
    [(CNContactHeaderView *)self currentHeightPercentMaximized];
    double v6 = v5;
    uint64_t v7 = [(CNContactHeaderView *)self sizeAttributes];
    [v7 photoBottomMarginWithPercentMax:v6];
    double v9 = v8;
    id v10 = [(CNContactHeaderDisplayView *)self avatarNameSpacingConstraint];
    [v10 setConstant:v9];

    uint64_t v11 = [(CNContactHeaderDisplayView *)self importantLabel];
    [v11 setAlpha:v6 * v6];

    id v12 = [(CNContactHeaderDisplayView *)self downtimeView];
    [v12 setAlpha:v6 * v6];

    uint64_t v13 = [(CNContactHeaderDisplayView *)self geminiView];
    [v13 setAlpha:v6 * v6];

    int v14 = [(CNContactHeaderDisplayView *)self taglineLabel];
    [v14 setAlpha:v6 * v6];

    [(id)sCurrentNameFont _scaledValueForValue:30.0];
    double v16 = v15;
    [(id)sCurrentNameFont _scaledValueForValue:16.0];
    double v18 = v16 - v17;
    [(id)sCurrentNameFont _scaledValueForValue:16.0];
    double v20 = v19 + v6 * v18;
    [(id)sCurrentTaglineFont _scaledValueForValue:17.0];
    double v22 = v6 * v21;
    double v23 = [(id)sCurrentNameFont fontWithSize:v20];
    double v24 = [(id)sCurrentTaglineFont fontWithSize:v22];
    uint64_t v40 = *MEMORY[0x1E4FB06F8];
    uint64_t v25 = v40;
    v41[0] = v23;
    int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v26];

    uint64_t v38 = v25;
    int v39 = v24;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [self cn_updateDictionaryForKey:@"importantTextAttributes" withChanges:v27];

    uint64_t v36 = v25;
    uint64_t v37 = v24;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [self cn_updateDictionaryForKey:@"downtimeTextAttributes" withChanges:v28];

    uint64_t v34 = v25;
    v35 = v24;
    int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    [self cn_updateDictionaryForKey:@"geminiTextAttributes" withChanges:v29];

    uint64_t v32 = v25;
    v33 = v24;
    long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [self cn_updateDictionaryForKey:@"taglineTextAttributes" withChanges:v30];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v3 layoutSubviews];
  [(CNContactHeaderDisplayView *)self calculateLabelSizes];
}

- (void)calculateLabelSizes
{
  v51[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactHeaderView *)self needsLabelSizeCalculation])
  {
    [(CNContactHeaderDisplayView *)self frame];
    double v4 = v3;
    if (v3 == 0.0)
    {
      double v5 = [(CNContactHeaderDisplayView *)self superview];

      if (v5)
      {
        double v6 = [(CNContactHeaderDisplayView *)self superview];
        [v6 frame];
        double v4 = v7;
      }
    }
    if (v4 != 0.0)
    {
      [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:0];
      [(CNContactHeaderDisplayView *)self layoutMargins];
      double v9 = v8;
      [(CNContactHeaderDisplayView *)self layoutMargins];
      double v11 = v4 - (v9 + v10);
      [(CNContactHeaderDisplayView *)self updateFontSizes];
      id v12 = [(CNContactHeaderView *)self nameLabel];
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      double v14 = v13;

      double v15 = [(CNContactHeaderDisplayView *)self taglineLabel];
      objc_msgSend(v15, "sizeThatFits:", v11, 1000.0);
      double v17 = v16;

      double v18 = [(CNContactHeaderDisplayView *)self importantLabel];
      objc_msgSend(v18, "sizeThatFits:", v11, 1000.0);
      double v20 = v19;

      double v21 = [(CNContactHeaderDisplayView *)self downtimeView];
      int v22 = [v21 isHidden];
      uint64_t v23 = MEMORY[0x1E4F1DB30];
      if (v22)
      {
        double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      else
      {
        uint64_t v25 = [(CNContactHeaderDisplayView *)self downtimeView];
        objc_msgSend(v25, "sizeThatFits:", v11, 1000.0);
        double v24 = v26;
      }
      long long v27 = [(CNContactHeaderDisplayView *)self geminiView];
      [v27 calculateLayoutIfNeeded];

      if ([(CNContactHeaderDisplayView *)self shouldShowGemini])
      {
        long long v28 = [(CNContactHeaderDisplayView *)self geminiView];
        objc_msgSend(v28, "sizeThatFits:", v11, 1000.0);
        double v30 = v29;
      }
      else
      {
        double v30 = *(double *)(v23 + 8);
      }
      double v31 = v14 + v17 + v20 + v24 + v30;
      uint64_t v32 = [(CNContactHeaderDisplayView *)self _screen];
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

      [(CNContactHeaderDisplayView *)self setMaxLabelsHeight:v37];
      id v38 = objc_alloc_init(MEMORY[0x1E4FB0860]);
      [v38 setMaximumNumberOfLines:2];
      int v39 = [(CNContactHeaderView *)self nameLabel];
      uint64_t v40 = [v39 text];
      uint64_t v50 = *MEMORY[0x1E4FB06F8];
      v41 = (void *)sCurrentNameFont;
      [(id)sCurrentNameFont _scaledValueForValue:16.0];
      v42 = objc_msgSend(v41, "fontWithSize:");
      v51[0] = v42;
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      objc_msgSend(v40, "boundingRectWithSize:options:attributes:context:", 33, v43, v38, v11, 1.79769313e308);
      double v45 = v44;

      v46 = [(CNContactHeaderDisplayView *)self _screen];
      [v46 scale];
      if (v47 == 0.0)
      {
        if (RoundToScale_onceToken != -1) {
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
        }
        double v47 = *(double *)&RoundToScale___s;
      }
      double v48 = ceil(v45);
      if (v47 != 1.0) {
        double v48 = round(v47 * v48) / v47;
      }

      [(CNContactHeaderDisplayView *)self setMinLabelsHeight:v48];
      v49 = [(CNContactHeaderView *)self delegate];
      [v49 headerViewDidUpdateLabelSizes];
    }
  }
}

- (void)calculateLabelSizesIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v3 calculateLabelSizesIfNeeded];
  [(CNContactHeaderDisplayView *)self calculateLabelSizes];
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

- (void)updateConstraints
{
  v48.receiver = self;
  v48.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v48 updateConstraints];
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  double v4 = [(CNContactHeaderView *)self activatedConstraints];
  double v5 = [v3 arrayWithArray:v4];

  double v6 = [(CNContactHeaderView *)self photoView];
  double v7 = [v6 centerXAnchor];
  double v8 = [(CNContactHeaderDisplayView *)self centerXAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  [v5 addObject:v9];

  double v10 = [(CNContactHeaderView *)self nameLabel];
  double v11 = [v10 topAnchor];
  id v12 = [(CNContactHeaderView *)self photoView];
  double v13 = [v12 bottomAnchor];
  double v14 = [(CNContactHeaderView *)self sizeAttributes];
  [v14 photoMinBottomMargin];
  double v15 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13);
  [(CNContactHeaderDisplayView *)self setAvatarNameSpacingConstraint:v15];

  double v16 = [(CNContactHeaderDisplayView *)self avatarNameSpacingConstraint];
  [v5 addObject:v16];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CNContactHeaderDisplayView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E54974A0;
  id v17 = v5;
  id v46 = v17;
  double v47 = self;
  double v18 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v19 = [(CNContactHeaderView *)self nameLabel];
  v18[2](v18, v19);

  double v20 = [(CNContactHeaderDisplayView *)self taglineLabel];
  v18[2](v18, v20);

  double v21 = [(CNContactHeaderDisplayView *)self importantLabel];
  if (v21)
  {
    int v22 = [(CNContactHeaderDisplayView *)self importantLabel];
    int v23 = [v22 isHidden] ^ 1;
  }
  else
  {
    int v23 = 0;
  }

  double v24 = [(CNContactHeaderDisplayView *)self downtimeView];
  if (v24)
  {
    uint64_t v25 = [(CNContactHeaderDisplayView *)self downtimeView];
    int v26 = [v25 isHidden] ^ 1;
  }
  else
  {
    int v26 = 0;
  }

  BOOL v27 = [(CNContactHeaderDisplayView *)self shouldShowGemini];
  long long v28 = [MEMORY[0x1E4F1CA48] array];
  if (!v23)
  {
    if (!v26) {
      goto LABEL_9;
    }
LABEL_13:
    id v38 = [(CNContactHeaderDisplayView *)self downtimeView];
    [v28 addObject:v38];

    if (!v27) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double v37 = [(CNContactHeaderDisplayView *)self importantLabel];
  [v28 addObject:v37];

  if (v26) {
    goto LABEL_13;
  }
LABEL_9:
  if (v27)
  {
LABEL_10:
    double v29 = [(CNContactHeaderDisplayView *)self geminiView];
    [v28 addObject:v29];
  }
LABEL_11:
  double v30 = [(CNContactHeaderView *)self nameLabel];
  double v31 = [v30 bottomAnchor];

  uint64_t v39 = MEMORY[0x1E4F143A8];
  uint64_t v40 = 3221225472;
  v41 = __47__CNContactHeaderDisplayView_updateConstraints__block_invoke_2;
  v42 = &unk_1E54974C8;
  uint64_t v43 = self;
  id v44 = v17;
  id v32 = v17;
  double v33 = objc_msgSend(v28, "_cn_reduce:initialValue:", &v39, v31);
  BOOL v34 = [(CNContactHeaderDisplayView *)self taglineLabel];
  double v35 = [v34 topAnchor];
  double v36 = [v33 constraintEqualToAnchor:v35];
  [v32 addObject:v36];

  [MEMORY[0x1E4F28DC8] activateConstraints:v32];
  [(CNContactHeaderView *)self setActivatedConstraints:v32];
}

void __47__CNContactHeaderDisplayView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v4 centerXAnchor];
  double v6 = [*(id *)(a1 + 40) centerXAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  double v8 = [v4 leadingAnchor];
  double v9 = [*(id *)(a1 + 40) layoutMarginsGuide];
  double v10 = [v9 leadingAnchor];
  id v18 = [v8 constraintEqualToAnchor:v10];

  LODWORD(v11) = 1148829696;
  [v18 setPriority:v11];
  [*(id *)(a1 + 32) addObject:v18];
  id v12 = [v4 trailingAnchor];
  double v13 = [*(id *)(a1 + 40) layoutMarginsGuide];
  double v14 = [v13 trailingAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14];

  LODWORD(v16) = 1148829696;
  [v15 setPriority:v16];
  [*(id *)(a1 + 32) addObject:v15];
  LODWORD(v17) = 1112014848;
  [v4 setContentHuggingPriority:0 forAxis:v17];
}

id __47__CNContactHeaderDisplayView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  [v5 leadingAnchor];
  double v19 = v18 = a1;
  double v20 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v7 = [v20 leadingAnchor];
  double v8 = [v19 constraintEqualToAnchor:v7];
  v21[0] = v8;
  double v9 = [v5 trailingAnchor];
  double v10 = [*(id *)(a1 + 32) layoutMarginsGuide];
  double v11 = [v10 trailingAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11];
  v21[1] = v12;
  double v13 = [v5 topAnchor];
  double v14 = [v6 constraintEqualToAnchor:v13];

  void v21[2] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];

  [*(id *)(v18 + 40) addObjectsFromArray:v15];
  double v16 = [v5 bottomAnchor];

  return v16;
}

- (void)updateFontSizes
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v16 updateFontSizes];
  BOOL v3 = [(CNContactHeaderView *)self isAXSize];
  id v4 = [(CNContactHeaderView *)self nameLabel];
  [v4 setAdjustsFontSizeToFitWidth:!v3];

  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 0.7;
  }
  id v6 = [(CNContactHeaderView *)self nameLabel];
  [v6 setMinimumScaleFactor:v5];

  double v7 = (void *)sCurrentTaglineFont;
  [(id)sCurrentTaglineFont _scaledValueForValue:17.0];
  double v8 = objc_msgSend(v7, "fontWithSize:");
  uint64_t v23 = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = v23;
  v24[0] = v8;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [self cn_updateDictionaryForKey:@"taglineTextAttributes" withChanges:v10];

  uint64_t v21 = v9;
  int v22 = v8;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  [self cn_updateDictionaryForKey:@"importantTextAttributes" withChanges:v11];

  uint64_t v19 = v9;
  double v20 = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [self cn_updateDictionaryForKey:@"downtimeTextAttributes" withChanges:v12];

  uint64_t v17 = v9;
  uint64_t v18 = v8;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [self cn_updateDictionaryForKey:@"geminiTextAttributes" withChanges:v13];

  double v14 = [(CNContactHeaderDisplayView *)self geminiIconProvider];
  [v14 updateGeminiIcons];

  double v15 = [(CNContactHeaderDisplayView *)self geminiView];
  [v15 setNeedsCalculateLayout];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderDisplayView *)&v7 tintColorDidChange];
  BOOL v3 = [(CNContactHeaderDisplayView *)self tintColor];
  id v4 = [(CNContactHeaderView *)self nameLabel];
  [v4 setHighlightedTextColor:v3];

  double v5 = [(CNContactHeaderDisplayView *)self tintColor];
  id v6 = [(CNContactHeaderDisplayView *)self geminiView];
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

- (void)setShouldShowGemini:(BOOL)a3
{
  if (self->_shouldShowGemini != a3)
  {
    if (a3)
    {
      [(CNContactHeaderDisplayView *)self createGeminiViewIfNeeded];
      id v5 = [(CNContactHeaderDisplayView *)self geminiView];
      [(CNContactHeaderDisplayView *)self addSubview:v5];
    }
    else
    {
      id v5 = [(CNContactHeaderDisplayView *)self geminiView];
      [v5 removeFromSuperview];
    }

    [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
    self->_shouldShowGeminuint64_t i = a3;
    [(CNContactHeaderDisplayView *)self setNeedsUpdateConstraints];
  }
}

- (void)createGeminiViewIfNeeded
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (!self->_geminiView)
  {
    BOOL v3 = [CNContactGeminiView alloc];
    unint64_t v4 = -[CNContactGeminiView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    geminiView = self->_geminiView;
    self->_geminiView = v4;

    [(CNContactGeminiView *)self->_geminiView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactGeminiView *)self->_geminiView setUserInteractionEnabled:1];
    id v6 = [(CNContactHeaderDisplayView *)self tintColor];
    [(CNContactGeminiView *)self->_geminiView setHighlightedColor:v6];

    v12[0] = *MEMORY[0x1E4FB2950];
    uint64_t v7 = *MEMORY[0x1E4FB0700];
    v11[0] = @"ABTextStyleAttributeName";
    v11[1] = v7;
    double v8 = [(CNContactHeaderView *)self contactStyle];
    uint64_t v9 = [v8 taglineTextColor];
    v12[1] = v9;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(CNContactHeaderDisplayView *)self setGeminiTextAttributes:v10];
  }
}

- (double)defaultMaxHeight
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v7 defaultMaxHeight];
  double v4 = v3;
  [(CNContactHeaderDisplayView *)self maxLabelsHeight];
  return v4 + v5;
}

- (double)maxHeight
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v7 maxHeight];
  double v4 = v3;
  [(CNContactHeaderDisplayView *)self maxLabelsHeight];
  return v4 + v5;
}

- (double)minHeight
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactHeaderDisplayView;
  [(CNContactHeaderView *)&v7 minHeight];
  double v4 = v3;
  [(CNContactHeaderDisplayView *)self minLabelsHeight];
  return v4 + v5;
}

- (void)didFinishUsing
{
  if ((CNContactHeaderDisplayView *)sDisplayContactHeaderView == self)
  {
    sDisplayContactHeaderView = 0;
  }
}

- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 shouldAllowImageDrops:(BOOL)a5 showingNavBar:(BOOL)a6 monogramOnly:(BOOL)a7 delegate:(id)a8
{
  v45[2] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)CNContactHeaderDisplayView;
  double v8 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v42, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, a5, a6, a7, a8, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel_handleNameLabelTap_];
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v8 action:sel_handleNameLabelLongPress_];
    id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    objc_super v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
    [(CNContactHeaderView *)v8 setNameLabel:v16];

    uint64_t v17 = [(CNContactHeaderView *)v8 nameLabel];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v18 = [(CNContactHeaderView *)v8 nameLabel];
    [v18 setTextAlignment:1];

    uint64_t v19 = [(CNContactHeaderView *)v8 nameLabel];
    [v19 setNumberOfLines:2];

    double v20 = [(CNContactHeaderView *)v8 nameLabel];
    [v20 setUserInteractionEnabled:1];

    uint64_t v21 = [(CNContactHeaderDisplayView *)v8 tintColor];
    int v22 = [(CNContactHeaderView *)v8 nameLabel];
    [v22 setHighlightedTextColor:v21];

    uint64_t v23 = [(CNContactHeaderView *)v8 nameLabel];
    [v23 addGestureRecognizer:v9];

    double v24 = [(CNContactHeaderView *)v8 nameLabel];
    [v24 addGestureRecognizer:v10];

    uint64_t v25 = [(CNContactHeaderView *)v8 nameLabel];
    objc_msgSend(v25, "_cnui_applyContactStyle");

    int v26 = [(CNContactHeaderView *)v8 nameLabel];
    [(CNContactHeaderDisplayView *)v8 addSubview:v26];

    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
    taglineLabel = v8->_taglineLabel;
    v8->_taglineLabel = (UILabel *)v27;

    [(UILabel *)v8->_taglineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_taglineLabel setTextAlignment:1];
    [(UILabel *)v8->_taglineLabel setNumberOfLines:0];
    [(UILabel *)v8->_taglineLabel _cnui_applyContactStyle];
    [(CNContactHeaderDisplayView *)v8 addSubview:v8->_taglineLabel];
    v45[0] = *MEMORY[0x1E4FB2950];
    uint64_t v29 = *MEMORY[0x1E4FB0700];
    v44[0] = @"ABTextStyleAttributeName";
    v44[1] = v29;
    double v30 = [(CNContactHeaderView *)v8 contactStyle];
    double v31 = [v30 taglineTextColor];
    v45[1] = v31;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    [(CNContactHeaderDisplayView *)v8 setTaglineTextAttributes:v32];

    [(CNContactHeaderDisplayView *)v8 updateFontSizes];
    double v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v8 selector:sel_menuWillHide_ name:*MEMORY[0x1E4FB2CB8] object:0];

    v8->_allowsPickerActions = 1;
    uint64_t v43 = objc_opt_class();
    BOOL v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    uint64_t v35 = [(CNContactHeaderDisplayView *)v8 registerForTraitChanges:v34 withTarget:v8 action:sel_traitEnvironment_didChangeTraitCollection_];
    traitChangeRegistration = v8->_traitChangeRegistration;
    v8->_traitChangeRegistration = (UITraitChangeRegistration *)v35;

    double v37 = objc_alloc_init(CNContactGeminiIconProvider);
    geminiIconProvider = v8->_geminiIconProvider;
    v8->_geminiIconProvider = v37;

    uint64_t v39 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E4F5A598]);
    metricsReporter = v8->_metricsReporter;
    v8->_metricsReporter = v39;
  }
  return v8;
}

- (CNContactHeaderDisplayView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  return -[CNContactHeaderDisplayView initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](self, "initWithContact:frame:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:", a3, 1, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)descriptorForRequiredKeys
{
  double v3 = objc_opt_class();
  double v4 = [(CNContactHeaderDisplayView *)self contactFormatter];
  double v5 = [v3 descriptorForRequiredKeysForContactFormatter:v4];

  return v5;
}

@end