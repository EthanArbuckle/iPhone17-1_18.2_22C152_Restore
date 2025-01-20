@interface CKSearchAvatarSupplementryView
+ (double)desiredZPosition;
+ (double)desiredZPositionForMode:(unint64_t)a3;
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (CKAvatarView)avatarView;
- (CKSearchAvatarSupplementryView)initWithFrame:(CGRect)a3;
- (CKSpotlightQueryResult)associatedResult;
- (CNContact)contact;
- (UIEdgeInsets)marginInsets;
- (unint64_t)parentContentType;
- (void)_parentPreviewDidChange:(id)a3;
- (void)_updateVisibilityIfNeeded;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAssociatedResult:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setContact:(id)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setParentContentType:(unint64_t)a3;
@end

@implementation CKSearchAvatarSupplementryView

+ (id)supplementaryViewType
{
  return @"SearchAvatarSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"SearchAvatarView";
}

+ (double)desiredZPosition
{
  return 0.0;
}

+ (double)desiredZPositionForMode:(unint64_t)a3
{
  if (CKIsRunningInMacCatalyst()) {
    BOOL v4 = a3 >= 3;
  }
  else {
    BOOL v4 = 0;
  }
  double result = 1.0;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (void)setContact:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(CKSearchAvatarSupplementryView *)self contact];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    if (v5)
    {
      v10[0] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v9 = [(CKSearchAvatarSupplementryView *)self avatarView];
    [v9 setContacts:v8];

    [(CKSearchAvatarSupplementryView *)self setNeedsLayout];
  }
}

- (void)setParentContentType:(unint64_t)a3
{
  if (self->_parentContentType != a3) {
    self->_parentContentType = a3;
  }
  [(CKSearchAvatarSupplementryView *)self _updateVisibilityIfNeeded];
}

- (CKSearchAvatarSupplementryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKSearchAvatarSupplementryView;
  char v7 = -[CKSearchAvatarSupplementryView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", x, y, width, height);
    [(CNAvatarView *)v8 setAsynchronousRendering:1];
    [(CKAvatarView *)v8 setUserInteractionEnabled:0];
    [(CNAvatarView *)v8 setShowsContactOnTap:0];
    [(CNAvatarView *)v8 setBypassActionValidation:1];
    [(CKSearchAvatarSupplementryView *)v7 setAvatarView:v8];
    [(CKSearchAvatarSupplementryView *)v7 addSubview:v8];
    v9 = [MEMORY[0x1E4F428B8] whiteColor];
    [(CKSearchAvatarSupplementryView *)v7 setBackgroundColor:v9];

    v10 = [(CKSearchAvatarSupplementryView *)v7 layer];
    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 searchResultAvatarSize];
    [v10 setCornerRadius:v12 * 0.5];

    v13 = [(CKSearchAvatarSupplementryView *)v7 layer];
    id v14 = [MEMORY[0x1E4F428B8] blackColor];
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    v15 = [(CKSearchAvatarSupplementryView *)v7 layer];
    LODWORD(v16) = 1051931443;
    [v15 setShadowOpacity:v16];

    v17 = [(CKSearchAvatarSupplementryView *)v7 layer];
    if (CKPixelWidth_once_10 != -1) {
      dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_140);
    }
    objc_msgSend(v17, "setShadowOffset:", 0.0, *(double *)&CKPixelWidth_sPixel_10);

    v18 = [(CKSearchAvatarSupplementryView *)v7 layer];
    if (CKPixelWidth_once_10 != -1) {
      dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_140);
    }
    [v18 setShadowRadius:*(double *)&CKPixelWidth_sPixel_10 * 4.0];

    v19 = [(CKSearchAvatarSupplementryView *)v7 layer];
    [v19 setShadowPathIsBounds:1];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v7 selector:sel__parentPreviewDidChange_ name:@"CKSearchThumbnailDidChange" object:0];
    [v20 addObserver:v7 selector:sel__parentPreviewDidChange_ name:@"CKSearchLPLinkMetadataDidChange" object:0];
  }
  return v7;
}

- (void)_parentPreviewDidChange:(id)a3
{
  id v9 = a3;
  if ([(CKSearchAvatarSupplementryView *)self parentContentType] != 3
    && [(CKSearchAvatarSupplementryView *)self parentContentType] != 1)
  {
    BOOL v4 = [v9 object];
    id v5 = [v4 identifier];
    v6 = [(CKSearchAvatarSupplementryView *)self associatedResult];
    char v7 = [v6 identifier];
    int v8 = [v5 isEqualToString:v7];

    if (v8) {
      [(CKSearchAvatarSupplementryView *)self _updateVisibilityIfNeeded];
    }
  }
}

- (void)_updateVisibilityIfNeeded
{
  if ([(CKSearchAvatarSupplementryView *)self parentContentType] == 3) {
    return;
  }
  if ([(CKSearchAvatarSupplementryView *)self parentContentType] == 1)
  {
    [(CKSearchAvatarSupplementryView *)self setHidden:0];
    return;
  }
  id v8 = +[CKSearchThumbnailPreviewGenerator sharedInstance];
  unint64_t v3 = [(CKSearchAvatarSupplementryView *)self parentContentType];
  if (v3 == 2)
  {
    BOOL v4 = [(CKSearchAvatarSupplementryView *)self associatedResult];
    int v5 = [v8 hasCachedLinkMetadataForQueryResult:v4];
  }
  else
  {
    if (v3 == 1)
    {
      BOOL v4 = [(CKSearchAvatarSupplementryView *)self associatedResult];
      char v7 = [(CKSearchAvatarSupplementryView *)self traitCollection];
      int v6 = [v8 hasCachedMapPreviewForQueryResult:v4 traitCollection:v7];

      goto LABEL_13;
    }
    if (v3)
    {
      int v6 = 1;
      goto LABEL_15;
    }
    BOOL v4 = [(CKSearchAvatarSupplementryView *)self associatedResult];
    int v5 = [v8 hasCachedPreviewForQueryResult:v4];
  }
  int v6 = v5;
LABEL_13:

LABEL_15:
  [(CKSearchAvatarSupplementryView *)self setHidden:v6 ^ 1u];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CKSearchAvatarSupplementryView;
  [(CKSearchAvatarSupplementryView *)&v26 layoutSubviews];
  [(CKSearchAvatarSupplementryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (CKPixelWidth_once_10 != -1) {
    dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_140);
  }
  double v11 = *(double *)&CKPixelWidth_sPixel_10;
  double v12 = *(double *)&CKPixelWidth_sPixel_10;
  double v13 = *(double *)&CKPixelWidth_sPixel_10;
  double v14 = *(double *)&CKPixelWidth_sPixel_10;
  if (CKMainScreenScale_once_54 != -1) {
    dispatch_once(&CKMainScreenScale_once_54, &__block_literal_global_134_1);
  }
  double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_54;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_54 == 0.0) {
    double v15 = 1.0;
  }
  double v16 = (v8 - (v12 + v14)) * v15;
  double v17 = (v10 - (v11 + v13)) * v15;
  double v18 = v4 * v15 + floor((v8 * v15 - v16) * 0.5);
  double v19 = v6 * v15 + floor((v10 * v15 - v17) * 0.5);
  double v20 = 1.0 / v15;
  double v21 = v20 * v18;
  double v22 = v20 * v19;
  double v23 = v16 * v20;
  double v24 = v17 * v20;
  v25 = [(CKSearchAvatarSupplementryView *)self avatarView];
  objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

  [(CKSearchAvatarSupplementryView *)self _updateVisibilityIfNeeded];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKSearchAvatarSupplementryView;
  [(CKSearchAvatarSupplementryView *)&v3 prepareForReuse];
  [(CKSearchAvatarSupplementryView *)self setAssociatedResult:0];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (unint64_t)parentContentType
{
  return self->_parentContentType;
}

- (CKSpotlightQueryResult)associatedResult
{
  return self->_associatedResult;
}

- (void)setAssociatedResult:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_associatedResult, 0);
}

@end