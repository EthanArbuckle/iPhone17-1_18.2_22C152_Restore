@interface CNVisualIdentityEditablePrimaryAvatarViewController
- (BOOL)exceedsMaxCharacterCount:(int64_t)a3 containsEmoji:(BOOL)a4;
- (BOOL)hasValidInputTypeForText:(id)a3;
- (BOOL)isEmojiProviderItemType;
- (BOOL)isMonogramProviderItemType;
- (BOOL)primaryAvatarShouldDisplay;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CAShapeLayer)clippingLayer;
- (CNPhotoPickerProviderItem)providerItem;
- (CNPhotoPickerVariantsManager)variantsManager;
- (CNVisualIdentityEditablePrimaryAvatarTextField)textField;
- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4;
- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithVariantsManager:(id)a3;
- (CNVisualIdentityEditablePrimaryAvatarViewControllerDelegate)delegate;
- (NSString)text;
- (UIFont)originalFont;
- (UIImageView)imageContainerView;
- (UIView)imageContentView;
- (double)desiredFontSize;
- (double)maxTextFieldSize;
- (id)updatedProviderItem;
- (id)updatedProviderItemWithText:(id)a3;
- (void)adjustFontSizeToFitWidthForText:(id)a3;
- (void)beginEditing;
- (void)endEditing;
- (void)populateViewWithTextEditableProviderItem:(id)a3 imageType:(unint64_t)a4;
- (void)setClippingLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDesiredFontSize:(double)a3;
- (void)setImageContainerView:(id)a3;
- (void)setImageContentView:(id)a3;
- (void)setOriginalFont:(id)a3;
- (void)setProviderItem:(id)a3;
- (void)setTextField:(id)a3;
- (void)setUpFirstResponderForProviderItem:(id)a3;
- (void)setVariantsManager:(id)a3;
- (void)setupImageContainerView;
- (void)setupTextField;
- (void)textViewDidEndEditing:(id)a3;
- (void)trimTextFieldTextIfNeeded:(id)a3;
- (void)trimTextFieldTextIfNeeded:(id)a3 containsEmoji:(BOOL)a4;
- (void)updateContainerViewMask;
- (void)updatePrimaryAvatarForVisualIdentity:(id)a3;
- (void)updateTextFieldFontSize:(double)a3;
- (void)updateViewWithProviderItem:(id)a3;
- (void)updateWithProviderItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNVisualIdentityEditablePrimaryAvatarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_imageContentView, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_originalFont, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_providerItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setVariantsManager:(id)a3
{
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setImageContentView:(id)a3
{
}

- (UIView)imageContentView
{
  return self->_imageContentView;
}

- (void)setClippingLayer:(id)a3
{
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setOriginalFont:(id)a3
{
}

- (UIFont)originalFont
{
  return self->_originalFont;
}

- (void)setTextField:(id)a3
{
}

- (CNVisualIdentityEditablePrimaryAvatarTextField)textField
{
  return self->_textField;
}

- (void)setImageContainerView:(id)a3
{
}

- (UIImageView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setDesiredFontSize:(double)a3
{
  self->_desiredFontSize = a3;
}

- (double)desiredFontSize
{
  return self->_desiredFontSize;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityEditablePrimaryAvatarViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityEditablePrimaryAvatarViewControllerDelegate *)WeakRetained;
}

- (BOOL)primaryAvatarShouldDisplay
{
  v2 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)updatePrimaryAvatarForVisualIdentity:(id)a3
{
  id v10 = a3;
  v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  if (!v4)
  {
    v5 = [v10 imageData];

    if (!v5) {
      goto LABEL_5;
    }
    v6 = [CNPhotoPickerProviderItem alloc];
    v7 = [v10 imageData];
    v8 = [v10 thumbnailImageData];
    v9 = [v10 fullscreenImageData];
    [v10 cropRect];
    v4 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v6, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v7, v8, v9);

    [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updateWithProviderItem:v4];
  }

LABEL_5:
}

- (double)maxTextFieldSize
{
  v2 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v2 bounds];
  double v4 = v3 + -20.0;

  return v4;
}

- (BOOL)exceedsMaxCharacterCount:(int64_t)a3 containsEmoji:(BOOL)a4
{
  int64_t v4 = 1;
  if (!a4) {
    int64_t v4 = 2;
  }
  return v4 < a3;
}

- (BOOL)hasValidInputTypeForText:(id)a3
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    BOOL v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self isEmojiProviderItemType];
    BOOL v6 = +[CNUIStringUtilities stringContainsEmoji:v4];
    char v7 = v5 && v6 || !v5 && !v6;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)trimTextFieldTextIfNeeded:(id)a3 containsEmoji:(BOOL)a4
{
  if (!a4)
  {
    objc_msgSend(a3, "_cn_take:", 2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
    [v6 setText:v7];
  }
}

- (void)trimTextFieldTextIfNeeded:(id)a3
{
  id v4 = a3;
  unsigned __int8 v6 = 0;
  int64_t v5 = +[CNUIStringUtilities composedCharacterCountForString:v4 containsEmoji:&v6];
  if ([(CNVisualIdentityEditablePrimaryAvatarViewController *)self exceedsMaxCharacterCount:v5 containsEmoji:v6])
  {
    [(CNVisualIdentityEditablePrimaryAvatarViewController *)self trimTextFieldTextIfNeeded:v4 containsEmoji:v6];
  }
}

- (void)adjustFontSizeToFitWidthForText:(id)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB1910];
  id v5 = a3;
  unsigned __int8 v6 = [v4 sharedInputModeController];
  id v7 = [v6 currentInputMode];
  unsigned int v8 = [v7 isDefaultRightToLeft];

  id v9 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  [v9 setMaximumNumberOfLines:1];
  uint64_t v10 = v8;
  v11 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  v40[0] = *MEMORY[0x1E4FB06F8];
  v16 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self originalFont];
  v41[0] = v16;
  v40[1] = *MEMORY[0x1E4FB0818];
  v17 = [NSNumber numberWithInteger:v10];
  v39 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v41[1] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 33, v19, v9, v13, v15);
  double v21 = v20;
  double v23 = v22;

  v24 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v24 contentOffset];
  double v26 = v25;

  v27 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v27 bounds];
  double v29 = v28 + -20.0;
  v30 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v30 zoomScale];
  double v32 = (v29 - v23 * v31) * 0.5;

  v33 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  objc_msgSend(v33, "setContentOffset:", v26, -fmax(v32, 0.0));

  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self maxTextFieldSize];
  if (v21 <= v34)
  {
    v35 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self originalFont];
    v37 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
    [v37 setFont:v35];
  }
  else
  {
    v35 = +[CNUIFontRepository visualIdentityEditorTextFont];
    [(CNVisualIdentityEditablePrimaryAvatarViewController *)self desiredFontSize];
    v37 = [v35 fontWithSize:v36 * 0.8];
    v38 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
    [v38 setFont:v37];
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self delegate];
    [v6 editableAvatarViewControllerDidEndEditing:self];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  char v12 = objc_msgSend(v10, "_cn_containsCharacterInSet:", v11);

  if (v12)
  {
    char v13 = 0;
  }
  else
  {
    double v14 = [v9 markedTextRange];
    double v15 = [v9 beginningOfDocument];
    v16 = [v14 start];
    uint64_t v17 = [v9 offsetFromPosition:v15 toPosition:v16];

    v18 = [v14 start];
    v19 = [v14 end];
    uint64_t v20 = [v9 offsetFromPosition:v18 toPosition:v19];

    BOOL v22 = v17 == location && v20 == length;
    if (!v14 || v22)
    {
      double v23 = [v9 text];
      v24 = objc_msgSend(v23, "stringByReplacingCharactersInRange:withString:", location, length, v10);

      if ([(CNVisualIdentityEditablePrimaryAvatarViewController *)self hasValidInputTypeForText:v24])
      {
        unsigned __int8 v30 = 0;
        int64_t v25 = +[CNUIStringUtilities composedCharacterCountForString:v24 containsEmoji:&v30];
        BOOL v26 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self exceedsMaxCharacterCount:v25 containsEmoji:v30];
        char v13 = !v26;
        if (v26 && !v30) {
          [(CNVisualIdentityEditablePrimaryAvatarViewController *)self trimTextFieldTextIfNeeded:v24 containsEmoji:0];
        }
        if (!v26)
        {
          [(CNVisualIdentityEditablePrimaryAvatarViewController *)self adjustFontSizeToFitWidthForText:v24];
          v27 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self delegate];
          double v28 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updatedProviderItemWithText:v24];
          [v27 editableAvatarViewController:self didUpdateWithProviderItem:v28];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 1;
    }
  }
  return v13;
}

- (id)updatedProviderItemWithText:(id)a3
{
  id v4 = a3;
  char v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  if ([v5 conformsToProtocol:&unk_1ED9A0450]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unsigned int v8 = [v7 updatedProviderItemWithText:v4];
  }
  else
  {
    id v9 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
    unsigned int v8 = (void *)[v9 copy];
  }

  return v8;
}

- (id)updatedProviderItem
{
  double v3 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  id v4 = [v3 text];
  char v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updatedProviderItemWithText:v4];

  return v5;
}

- (void)updateContainerViewMask
{
  double v3 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v3 bounds];
  double v5 = v4;

  id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v6 bounds];
  double v8 = v7;

  if (v5 >= v8) {
    double v5 = v8;
  }
  id v9 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v9 bounds];
  double v11 = v10;
  char v12 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v12 bounds];
  double v14 = v13;

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v11, v14, v5, v5);
  id v17 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v17 CGPath];
  v16 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self clippingLayer];
  [v16 setPath:v15];
}

- (BOOL)isMonogramProviderItemType
{
  v2 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  BOOL v3 = [v2 imageType] == 2;

  return v3;
}

- (BOOL)isEmojiProviderItemType
{
  v2 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  BOOL v3 = [v2 imageType] == 4;

  return v3;
}

- (void)updateTextFieldFontSize:(double)a3
{
  double v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  id v6 = [v5 font];
  [v6 pointSize];
  double v8 = v7;

  if (v8 != a3)
  {
    id v9 = +[CNUIFontRepository visualIdentityEditorTextFont];
    double v10 = [v9 fontWithSize:a3];
    [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setOriginalFont:v10];

    double v11 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self originalFont];
    char v12 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
    [v12 setFont:v11];

    [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setDesiredFontSize:a3];
  }
}

- (void)setupTextField
{
  v33[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [CNVisualIdentityEditablePrimaryAvatarTextField alloc];
  double v4 = -[CNVisualIdentityEditablePrimaryAvatarTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setTextField:v4];

  double v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  double v7 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v6 addSubview:v7];

  unsigned __int8 v30 = (void *)MEMORY[0x1E4F28DC8];
  double v32 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  double v31 = [v32 centerXAnchor];
  double v8 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  id v9 = [v8 centerXAnchor];
  double v10 = [v31 constraintEqualToAnchor:v9];
  v33[0] = v10;
  double v11 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  char v12 = [v11 centerYAnchor];
  double v13 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  double v14 = [v13 centerYAnchor];
  uint64_t v15 = [v12 constraintEqualToAnchor:v14];
  v33[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v30 activateConstraints:v16];

  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self desiredFontSize];
  -[CNVisualIdentityEditablePrimaryAvatarViewController updateTextFieldFontSize:](self, "updateTextFieldFontSize:");
  id v17 = +[CNUIColorRepository visualIdentityEditorMonogramTextColor];
  v18 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v18 setTextColor:v17];

  v19 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v20 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v20 setBackgroundColor:v19];

  double v21 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v21 setScrollEnabled:0];

  BOOL v22 = +[CNUIColorRepository visualIdentityEditorMonogramTextColor];
  double v23 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v23 setTintColor:v22];

  v24 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v24 setTextAlignment:1];

  int64_t v25 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v25 setAutocapitalizationType:3];

  BOOL v26 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v26 setDelegate:self];

  if ([(CNVisualIdentityEditablePrimaryAvatarViewController *)self isEmojiProviderItemType]) {
    uint64_t v27 = 124;
  }
  else {
    uint64_t v27 = 13;
  }
  double v28 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v28 setKeyboardType:v27];

  double v29 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v29 setAutocorrectionType:1];
}

- (void)setupImageContainerView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self view];
  [v4 bounds];
  double v5 = objc_msgSend(v3, "initWithFrame:");
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setImageContainerView:v5];

  id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v6 setAutoresizingMask:18];

  double v7 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self view];
  double v8 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v7 addSubview:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setClippingLayer:v9];

  id v12 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self clippingLayer];
  double v10 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  double v11 = [v10 layer];
  [v11 setMask:v12];
}

- (void)populateViewWithTextEditableProviderItem:(id)a3 imageType:(unint64_t)a4
{
  id v22 = a3;
  id v6 = [v22 backgroundColor];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self variantsManager];
    double v10 = [v9 avatarBackgrounds];
    double v11 = [v10 firstObject];
    id v8 = [v11 color];
  }
  id v12 = [v22 itemText];
  double v13 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v13 setText:v12];

  double v14 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  uint64_t v15 = [v14 text];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self adjustFontSizeToFitWidthForText:v15];

  if (a4 == 2)
  {
    v16 = +[CNPhotoPickerVariantsManager monogramColorGradientBackground:v8];
    id v17 = [v22 itemText];
    BOOL v18 = +[CNUIStringUtilities stringIsSingleEmoji:v17];

    if (v18)
    {
      v19 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
      [v19 setText:0];
    }
  }
  else
  {
    v16 = +[CNPhotoPickerVariantsManager colorGradientBackground:v8];
  }
  uint64_t v20 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  double v21 = v20;
  if (v16)
  {
    [v20 setImage:v16];
  }
  else
  {
    [v20 setImage:0];

    double v21 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
    [v21 setBackgroundColor:v8];
  }
}

- (void)updateViewWithProviderItem:(id)a3
{
  id v4 = a3;
  double v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  if ([v5 conformsToProtocol:&unk_1ED9A0450]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContentView];
    [v8 removeFromSuperview];

    -[CNVisualIdentityEditablePrimaryAvatarViewController populateViewWithTextEditableProviderItem:imageType:](self, "populateViewWithTextEditableProviderItem:imageType:", v7, [v4 imageType]);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__CNVisualIdentityEditablePrimaryAvatarViewController_updateViewWithProviderItem___block_invoke;
    v9[3] = &unk_1E549A038;
    v9[4] = self;
    [v4 fullSizeViewWithCompletion:v9];
  }
}

void __82__CNVisualIdentityEditablePrimaryAvatarViewController_updateViewWithProviderItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 imageContentView];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) imageContentView];
    [v6 removeFromSuperview];
  }
  id v7 = [*(id *)(a1 + 32) imageContainerView];
  id v8 = [v7 image];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) imageContainerView];
    [v9 setImage:0];
  }
  [*(id *)(a1 + 32) setImageContentView:v4];
  double v10 = [*(id *)(a1 + 32) imageContainerView];
  [v10 bounds];
  objc_msgSend(v4, "setFrame:");

  id v11 = [*(id *)(a1 + 32) imageContainerView];
  [v11 addSubview:v4];
}

- (void)setUpFirstResponderForProviderItem:(id)a3
{
  id v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  if ([v4 conformsToProtocol:&unk_1ED9A0450]) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }

  if (v5)
  {
    id v6 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0
      || ([(CNVisualIdentityEditablePrimaryAvatarViewController *)self delegate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 editableAvatarViewControllerShouldBecomeFirstResponder:self],
          v8,
          v9))
    {
      id v10 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
      [v10 becomeFirstResponder];
    }
  }
}

- (void)endEditing
{
  id v3 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  id v4 = [v3 text];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self trimTextFieldTextIfNeeded:v4];

  id v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v5 resignFirstResponder];
}

- (void)beginEditing
{
  id v2 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v2 becomeFirstResponder];
}

- (void)updateWithProviderItem:(id)a3
{
  id v4 = a3;
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setProviderItem:v4];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updateViewWithProviderItem:v4];
}

- (NSString)text
{
  id v3 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  id v4 = [v3 text];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self trimTextFieldTextIfNeeded:v4];

  id v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  id v6 = [v5 text];

  return (NSString *)v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)&v5 viewDidAppear:a3];
  id v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setUpFirstResponderForProviderItem:v4];
}

- (void)viewDidLayoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)&v27 viewDidLayoutSubviews];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updateContainerViewMask];
  id v3 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v3 frame];
  if (CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28])) {
    goto LABEL_4;
  }
  id v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v4 frame];
  if (CGRectEqualToRect(v29, *MEMORY[0x1E4F1DB20]))
  {

LABEL_4:
LABEL_5:
    objc_super v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    goto LABEL_6;
  }
  id v17 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  id v22 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self imageContainerView];
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;

  if (v19 != v24 || v21 != v26) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v15 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self textField];
  v16 = [v15 text];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self adjustFontSizeToFitWidthForText:v16];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)&v8 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  id v4 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setupImageContainerView];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self setupTextField];
  objc_super v5 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self providerItem];
  [(CNVisualIdentityEditablePrimaryAvatarViewController *)self updateViewWithProviderItem:v5];

  double v6 = +[CNUIColorRepository visualIdentityEditorBackgroundColor];
  double v7 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)self view];
  [v7 setBackgroundColor:v6];
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarViewController;
  double v9 = [(CNVisualIdentityEditablePrimaryAvatarViewController *)&v13 initWithNibName:0 bundle:0];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    double v11 = v10;
  }

  return v10;
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)initWithVariantsManager:(id)a3
{
  return [(CNVisualIdentityEditablePrimaryAvatarViewController *)self initWithProviderItem:0 variantsManager:a3];
}

@end