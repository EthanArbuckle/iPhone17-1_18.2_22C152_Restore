@interface CNContactGridCell
+ (double)actionsLeftMargin;
- (BOOL)showsContactOnTap;
- (CGSize)avatarSize;
- (CNAvatarView)avatarView;
- (CNAvatarViewDelegate)delegate;
- (CNContact)contact;
- (CNContactFormatter)contactFormatter;
- (CNContactGridClippingView)actionsClippingView;
- (CNQuickActionsManager)actionsManager;
- (CNQuickActionsView)actionsView;
- (NSArray)actionCategories;
- (NSDictionary)nameTextAttributes;
- (UIEdgeInsets)avatarMargins;
- (UILabel)nameLabel;
- (UIView)actionsContainerView;
- (double)maximumActionsWidth;
- (id)animationBlockForPreparingToShowActions;
- (id)completionBlockForHidingActions;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_createViewsIfNeeded;
- (void)_updateActionsMask;
- (void)setActionCategories:(id)a3;
- (void)setActionsClippingView:(id)a3;
- (void)setActionsContainerView:(id)a3;
- (void)setActionsManager:(id)a3;
- (void)setActionsView:(id)a3;
- (void)setAvatarMargins:(UIEdgeInsets)a3;
- (void)setAvatarSize:(CGSize)a3;
- (void)setAvatarView:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setShowsContactOnTap:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation CNContactGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_actionsContainerView, 0);
  objc_storeStrong((id *)&self->_actionsClippingView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setActionsView:(id)a3
{
}

- (CNQuickActionsView)actionsView
{
  return self->_actionsView;
}

- (void)setActionsContainerView:(id)a3
{
}

- (UIView)actionsContainerView
{
  return self->_actionsContainerView;
}

- (void)setActionsClippingView:(id)a3
{
}

- (CNContactGridClippingView)actionsClippingView
{
  return self->_actionsClippingView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setActionsManager:(id)a3
{
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionCategories:(id)a3
{
}

- (NSArray)actionCategories
{
  return self->_actionCategories;
}

- (void)setShowsContactOnTap:(BOOL)a3
{
  self->_showsContactOnTap = a3;
}

- (BOOL)showsContactOnTap
{
  return self->_showsContactOnTap;
}

- (void)setNameTextAttributes:(id)a3
{
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (void)setAvatarMargins:(UIEdgeInsets)a3
{
  self->_avatarMargins = a3;
}

- (UIEdgeInsets)avatarMargins
{
  double top = self->_avatarMargins.top;
  double left = self->_avatarMargins.left;
  double bottom = self->_avatarMargins.bottom;
  double right = self->_avatarMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAvatarSize:(CGSize)a3
{
  self->_avatarSize = a3;
}

- (CGSize)avatarSize
{
  double width = self->_avatarSize.width;
  double height = self->_avatarSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CNAvatarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarViewDelegate *)WeakRetained;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (double)maximumActionsWidth
{
  v2 = [(CNContactGridCell *)self actionsView];
  [v2 maximumWidth];
  double v4 = v3;

  return v4;
}

- (void)_updateActionsMask
{
  double v3 = [(CNContactGridCell *)self contact];
  if (v3)
  {
    double v4 = [(CNContactGridCell *)self contact];
    BOOL v5 = +[CNMonogrammer monogramTypeForContact:v4] != 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  id v6 = [(CNContactGridCell *)self actionsClippingView];
  [v6 setMasksToAvatar:v5];
}

- (id)completionBlockForHidingActions
{
  double v3 = [(CNContactGridCell *)self actionsView];
  [(CNContactGridCell *)self setActionsView:0];
  [v3 setAlpha:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CNContactGridCell_completionBlockForHidingActions__block_invoke;
  v7[3] = &unk_1E549B488;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = (void *)[v7 copy];

  return v5;
}

uint64_t __52__CNContactGridCell_completionBlockForHidingActions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)animationBlockForPreparingToShowActions
{
  v29[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(CNContactGridCell *)self actionsView];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    BOOL v5 = [CNQuickActionsView alloc];
    id v6 = -[CNQuickActionsView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNQuickActionsView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(CNContactGridCell *)self delegate];
    [(CNQuickActionsView *)v6 setDelegate:v7];

    id v8 = [(CNContactGridCell *)self nameTextAttributes];
    [(CNQuickActionsView *)v6 setTitleTextAttributes:v8];

    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v9 userInterfaceIdiom])
    {
      [(CNQuickActionsView *)v6 setInterspace:24.0];
    }
    else
    {
      v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v10 _referenceBounds];
      if (CGRectGetHeight(v31) <= 568.0)
      {
        [(CNQuickActionsView *)v6 setInterspace:24.0];
      }
      else
      {
        v11 = [MEMORY[0x1E4FB16C8] currentDevice];
        if ([v11 userInterfaceIdiom])
        {
          [(CNQuickActionsView *)v6 setInterspace:35.0];
        }
        else
        {
          v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
          [v12 _referenceBounds];
          BOOL v13 = CGRectGetHeight(v32) <= 667.0;
          double v14 = 35.0;
          if (!v13) {
            double v14 = 24.0;
          }
          [(CNQuickActionsView *)v6 setInterspace:v14];
        }
      }
    }
    v15 = [(CNContactGridCell *)self actionCategories];
    [(CNQuickActionsView *)v6 setCategories:v15];

    v16 = [(CNContactGridCell *)self actionsManager];
    [(CNQuickActionsView *)v6 setActionsManager:v16];

    v17 = [(CNContactGridCell *)self contact];
    [(CNQuickActionsView *)v6 setContact:v17];

    [(CNQuickActionsView *)v6 setSortsWithDuet:1];
    [(CNQuickActionsView *)v6 setAlpha:0.0];
    v18 = [(CNContactGridCell *)self actionsContainerView];
    [v18 addSubview:v6];

    [(CNContactGridCell *)self setActionsView:v6];
    v28[0] = @"avatar";
    v19 = [(CNContactGridCell *)self avatarView];
    v28[1] = @"actionsView";
    v29[0] = v19;
    v29[1] = v6;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

    v21 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-0-[actionsView]-0-|" options:0 metrics:0 views:v20];
    [v4 addObjectsFromArray:v21];

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(CNContactGridCell *)self avatarView];
    v24 = [v22 constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v23 attribute:10 multiplier:1.0 constant:10.0];
    [v4 addObject:v24];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__CNContactGridCell_animationBlockForPreparingToShowActions__block_invoke;
  v27[3] = &unk_1E549B488;
  v27[4] = self;
  v25 = (void *)[v27 copy];

  return v25;
}

void __60__CNContactGridCell_animationBlockForPreparingToShowActions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) actionsView];
  [v1 setAlpha:1.0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    BOOL v5 = [(CNContactGridCell *)self avatarView];
    [v5 setDelegate:obj];

    id v6 = [(CNContactGridCell *)self actionsView];
    [v6 setDelegate:obj];
  }
}

- (CNContact)contact
{
  v2 = [(CNContactGridCell *)self avatarView];
  double v3 = [v2 contact];

  return (CNContact *)v3;
}

- (void)setContact:(id)a3
{
  id v14 = a3;
  [(CNContactGridCell *)self _createViewsIfNeeded];
  id v4 = v14;
  if (!v14) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  }
  id v15 = v4;
  BOOL v5 = [(CNContactGridCell *)self avatarView];
  [v5 setContact:v15];

  id v6 = [(CNContactGridCell *)self contactFormatter];
  v7 = [v6 stringFromContact:v15];

  if (![v7 length])
  {
    id v8 = CNContactsUIBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];

    v7 = (void *)v9;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11 = [(CNContactGridCell *)self nameTextAttributes];
  v12 = (void *)[v10 initWithString:v7 attributes:v11];
  BOOL v13 = [(CNContactGridCell *)self nameLabel];
  [v13 setAttributedText:v12];

  [(CNContactGridCell *)self _updateActionsMask];
}

- (void)updateConstraints
{
  v50[8] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)CNContactGridCell;
  [(CNContactGridCell *)&v46 updateConstraints];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  v49[0] = @"top";
  id v4 = NSNumber;
  [(CNContactGridCell *)self avatarMargins];
  v45 = objc_msgSend(v4, "numberWithDouble:");
  v50[0] = v45;
  v49[1] = @"left";
  BOOL v5 = NSNumber;
  [(CNContactGridCell *)self avatarMargins];
  v7 = [v5 numberWithDouble:v6];
  v50[1] = v7;
  v49[2] = @"bottom";
  id v8 = NSNumber;
  [(CNContactGridCell *)self avatarMargins];
  id v10 = [v8 numberWithDouble:v9];
  v50[2] = v10;
  v49[3] = @"right";
  v11 = NSNumber;
  [(CNContactGridCell *)self avatarMargins];
  BOOL v13 = [v11 numberWithDouble:v12];
  v50[3] = v13;
  v49[4] = @"width";
  id v14 = NSNumber;
  [(CNContactGridCell *)self avatarSize];
  id v15 = objc_msgSend(v14, "numberWithDouble:");
  v50[4] = v15;
  v49[5] = @"height";
  v16 = NSNumber;
  [(CNContactGridCell *)self avatarSize];
  v18 = [v16 numberWithDouble:v17];
  v50[5] = v18;
  v49[6] = @"labelWidth";
  v19 = NSNumber;
  [(CNContactGridCell *)self avatarSize];
  double v21 = v20;
  [(CNContactGridCell *)self avatarMargins];
  double v23 = v21 + v22;
  [(CNContactGridCell *)self avatarMargins];
  v25 = [v19 numberWithDouble:v23 + v24];
  v50[6] = v25;
  v49[7] = @"actionsLeftMargin";
  v26 = NSNumber;
  +[CNContactGridCell actionsLeftMargin];
  v27 = objc_msgSend(v26, "numberWithDouble:");
  v50[7] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:8];

  v47[0] = @"avatar";
  v29 = [(CNContactGridCell *)self avatarView];
  v48[0] = v29;
  v47[1] = @"nameLabel";
  v30 = [(CNContactGridCell *)self nameLabel];
  v48[1] = v30;
  v47[2] = @"actionsClippingView";
  CGRect v31 = [(CNContactGridCell *)self actionsClippingView];
  v48[2] = v31;
  v47[3] = @"actionsContainerView";
  CGRect v32 = [(CNContactGridCell *)self actionsContainerView];
  v48[3] = v32;
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];

  v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-(left)-[avatar(width)]-(>=right)-|" options:0 metrics:v28 views:v33];
  [v3 addObjectsFromArray:v34];

  v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|-0-[nameLabel(labelWidth)]" options:0 metrics:v28 views:v33];
  [v3 addObjectsFromArray:v35];

  v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(top)-[avatar(height)]-(bottom)-[nameLabel]-0-|" options:0 metrics:v28 views:v33];
  [v3 addObjectsFromArray:v36];

  v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"[actionsClippingView]-(right)-|" options:0 metrics:v28 views:v33];
  [v3 addObjectsFromArray:v37];

  v38 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[actionsClippingView]-0-|" options:0 metrics:0 views:v33];
  [v3 addObjectsFromArray:v38];

  v39 = (void *)MEMORY[0x1E4F28DC8];
  v40 = [(CNContactGridCell *)self actionsClippingView];
  v41 = [(CNContactGridCell *)self avatarView];
  v42 = [v39 constraintWithItem:v40 attribute:5 relatedBy:0 toItem:v41 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v42];

  v43 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"[avatar]-<=actionsLeftMargin-[actionsContainerView]->=0-|" options:0 metrics:v28 views:v33];
  [v3 addObjectsFromArray:v43];

  v44 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[actionsContainerView]-0-|" options:0 metrics:0 views:v33];
  [v3 addObjectsFromArray:v44];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (void)_createViewsIfNeeded
{
  double v3 = [(CNContactGridCell *)self avatarView];

  if (!v3)
  {
    id v4 = [CNContactGridClippingView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v17 = -[CNContactGridClippingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(CNContactGridClippingView *)v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactGridClippingView *)v17 setClipsToBounds:1];
    double v9 = [(CNContactGridCell *)self contentView];
    [v9 addSubview:v17];

    [(CNContactGridCell *)self setActionsClippingView:v17];
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNContactGridClippingView *)v17 addSubview:v10];
    [(CNContactGridCell *)self setActionsContainerView:v10];
    v11 = [CNAvatarView alloc];
    [(CNContactGridCell *)self bounds];
    double v12 = -[CNAvatarView initWithFrame:](v11, "initWithFrame:");
    BOOL v13 = [(CNContactGridCell *)self delegate];
    [(CNAvatarView *)v12 setDelegate:v13];

    [(CNAvatarView *)v12 setAutoUpdateContact:0];
    [(CNAvatarView *)v12 setShowsContactOnTap:[(CNContactGridCell *)self showsContactOnTap]];
    [(CNAvatarView *)v12 setAsynchronousRendering:1];
    [(CNAvatarView *)v12 setForcePressView:v12];
    [(CNAvatarView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v14 = [(CNContactGridCell *)self contentView];
    [v14 addSubview:v12];

    [(CNContactGridCell *)self setAvatarView:v12];
    [(CNContactGridClippingView *)v17 setAvatarView:v12];
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setTextAlignment:1];
    v16 = [(CNContactGridCell *)self contentView];
    [v16 addSubview:v15];

    [(CNContactGridCell *)self setNameLabel:v15];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (double)actionsLeftMargin
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v2 userInterfaceIdiom])
  {
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 _referenceBounds];
    double Height = CGRectGetHeight(v9);

    double result = 20.0;
    if (Height > 667.0) {
      return result;
    }
  }
  double v6 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v6 userInterfaceIdiom])
  {

    return 16.0;
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 _referenceBounds];
    double v8 = CGRectGetHeight(v10);

    double result = 16.0;
    if (v8 > 568.0) {
      return 27.0;
    }
  }
  return result;
}

@end