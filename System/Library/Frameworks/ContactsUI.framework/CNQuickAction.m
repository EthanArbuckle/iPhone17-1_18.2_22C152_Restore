@interface CNQuickAction
+ (BOOL)reallyPerform;
+ (id)actionWithTitle:(id)a3 image:(id)a4 block:(id)a5;
+ (id)defaultTitleForActionInCategory:(id)a3 context:(int64_t)a4;
+ (id)possibleTitlesForActionsInCategories:(id)a3 context:(int64_t)a4;
- (BOOL)cached;
- (BOOL)dismissesWithAnimation;
- (BOOL)enabled;
- (BOOL)isBackAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLongPress;
- (BOOL)matchesDuetInteraction:(id)a3;
- (BOOL)useDuetIfAvailable;
- (CNContactStyle)previousStyle;
- (CNQuickAction)init;
- (CNQuickActionsManager)manager;
- (NSString)category;
- (NSString)globalIdentifier;
- (NSString)identifier;
- (NSString)title;
- (UIColor)imageTintColor;
- (UIImage)image;
- (UIView)sourceView;
- (id)_coreDuetInteractionMechanisms;
- (id)_coreDuetValue;
- (id)defaultTitleForContext:(int64_t)a3;
- (id)description;
- (id)imageForContext:(int64_t)a3;
- (id)outlinedImage;
- (id)performBlock;
- (id)subtitleForContext:(int64_t)a3;
- (id)titleForContext:(int64_t)a3;
- (id)userActionType;
- (unint64_t)hash;
- (unint64_t)score;
- (void)perform;
- (void)performWithCompletionBlock:(id)a3;
- (void)setBackAction:(BOOL)a3;
- (void)setCached:(BOOL)a3;
- (void)setCategory:(id)a3;
- (void)setDismissesWithAnimation:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setIsLongPress:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setPerformBlock:(id)a3;
- (void)setPreviousStyle:(id)a3;
- (void)setScore:(unint64_t)a3;
- (void)setSourceView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseDuetIfAvailable:(BOOL)a3;
@end

@implementation CNQuickAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStyle, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setPreviousStyle:(id)a3
{
}

- (CNContactStyle)previousStyle
{
  return self->_previousStyle;
}

- (void)setPerformBlock:(id)a3
{
}

- (id)performBlock
{
  return self->_performBlock;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setDismissesWithAnimation:(BOOL)a3
{
  self->_dismissesWithAnimation = a3;
}

- (BOOL)dismissesWithAnimation
{
  return self->_dismissesWithAnimation;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setManager:(id)a3
{
}

- (CNQuickActionsManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (CNQuickActionsManager *)WeakRetained;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setImageTintColor:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setIsLongPress:(BOOL)a3
{
  self->_isLongPress = a3;
}

- (BOOL)isLongPress
{
  return self->_isLongPress;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImage:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CNQuickAction *)self title];
  v6 = [(CNQuickAction *)self globalIdentifier];
  v7 = [v3 stringWithFormat:@"<%@ %p> %@ - %@ - score: %lu", v4, self, v5, v6, -[CNQuickAction score](self, "score")];

  return v7;
}

- (void)performWithCompletionBlock:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CNQuickAction *)self performBlock];

  if (v4)
  {
    v5 = [(CNQuickAction *)self performBlock];
    v5[2]();
  }
  else
  {
    v5 = [(CNQuickAction *)self globalIdentifier];
    NSLog(&cfstr_PerformAction.isa, v5);
  }

  v6 = [(CNQuickAction *)self manager];

  if (v6)
  {
    v7 = [(CNQuickAction *)self manager];
    [v7 actionPerformed:self];
  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }
}

- (void)perform
{
}

- (id)subtitleForContext:(int64_t)a3
{
  return 0;
}

- (id)titleForContext:(int64_t)a3
{
  v5 = [(CNQuickAction *)self title];
  if (!v5)
  {
    v5 = [(CNQuickAction *)self defaultTitleForContext:a3];
  }

  return v5;
}

- (id)defaultTitleForContext:(int64_t)a3
{
  v5 = objc_opt_class();
  v6 = [(CNQuickAction *)self category];
  v7 = [v5 defaultTitleForActionInCategory:v6 context:a3];

  return v7;
}

- (id)imageForContext:(int64_t)a3
{
  uint64_t v4 = [(CNQuickAction *)self category];
  char v5 = [v4 isEqualToString:CNQuickActionCategoryAudioCall];

  if (v5)
  {
    v6 = (id *)MEMORY[0x1E4F1AD20];
  }
  else
  {
    v7 = [(CNQuickAction *)self category];
    char v8 = [v7 isEqualToString:CNQuickActionCategoryVideoCall];

    if (v8)
    {
      v6 = (id *)MEMORY[0x1E4F1AD78];
    }
    else
    {
      id v9 = [(CNQuickAction *)self category];
      char v10 = [v9 isEqualToString:CNQuickActionCategoryInstantMessage];

      if (v10)
      {
        v6 = (id *)MEMORY[0x1E4F1AD48];
      }
      else
      {
        v11 = [(CNQuickAction *)self category];
        int v12 = [v11 isEqualToString:CNQuickActionCategoryMail];

        if (!v12) {
          goto LABEL_11;
        }
        v6 = (id *)MEMORY[0x1E4F1AD38];
      }
    }
  }
  id v13 = *v6;
  if (v13)
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1E4FB1818];
    v16 = [(CNQuickAction *)self imageTintColor];
    v17 = objc_msgSend(v15, "cnui_userActionSymbolImageForActionType:scale:withColor:", v14, 3, v16);

LABEL_14:
    goto LABEL_15;
  }
LABEL_11:
  v18 = [(CNQuickAction *)self category];
  int v19 = [v18 isEqualToString:CNQuickActionCategoryInfo];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4FB1818];
    v14 = [(CNQuickAction *)self imageTintColor];
    v21 = @"info.circle.fill";
LABEL_13:
    v17 = objc_msgSend(v20, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", v21, 3, v14, 1);
    goto LABEL_14;
  }
  v23 = [(CNQuickAction *)self category];
  int v24 = [v23 isEqualToString:CNQuickActionCategoryAddToContacts];

  if (v24)
  {
    v25 = [(CNQuickAction *)self identifier];
    int v26 = [v25 isEqualToString:@"create-new"];

    v20 = (void *)MEMORY[0x1E4FB1818];
    v14 = [(CNQuickAction *)self imageTintColor];
    if (v26) {
      v21 = @"person.crop.circle";
    }
    else {
      v21 = @"person.crop.circle.badge.plus";
    }
    goto LABEL_13;
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (id)outlinedImage
{
  v3 = [(CNQuickAction *)self userActionType];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB1818];
    char v5 = [(CNQuickAction *)self imageTintColor];
    v6 = objc_msgSend(v4, "cnui_userActionOutlinedSymbolImageForActionType:scale:withColor:", v3, 3, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIImage)image
{
  image = self->_image;
  if (image)
  {
    v3 = image;
  }
  else
  {
    char v5 = [(CNQuickAction *)self userActionType];
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4FB1818];
      v7 = [(CNQuickAction *)self imageTintColor];
      objc_msgSend(v6, "cnui_userActionSymbolImageForActionType:scale:withColor:", v5, 3, v7);
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = [(CNQuickAction *)self imageForContext:0];
    }
  }

  return v3;
}

- (BOOL)matchesDuetInteraction:(id)a3
{
  id v4 = a3;
  char v5 = [(CNQuickAction *)self _coreDuetInteractionMechanisms];
  if (objc_msgSend(v5, "containsIndex:", objc_msgSend(v4, "mechanism")))
  {
    v6 = [v4 contact];
    v7 = [v6 identifier];

    char v8 = [(CNQuickAction *)self _coreDuetValue];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v9 = [v7 compare:v8 options:385] == 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v10 = (void *)MEMORY[0x1E4F1BA70];
          id v11 = v8;
          int v12 = [v10 phoneNumberWithStringValue:v7];
          char v9 = [v11 isLikePhoneNumber:v12];
        }
        else
        {
          char v9 = 0;
        }
      }
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_coreDuetInteractionMechanisms
{
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  id v4 = [(CNQuickAction *)self category];
  char v5 = [v4 isEqualToString:CNQuickActionCategoryAudioCall];

  if (v5)
  {
    uint64_t v6 = 16;
  }
  else
  {
    v7 = [(CNQuickAction *)self category];
    char v8 = [v7 isEqualToString:CNQuickActionCategoryVideoCall];

    if (v8)
    {
      uint64_t v6 = 17;
    }
    else
    {
      char v9 = [(CNQuickAction *)self category];
      int v10 = [v9 isEqualToString:CNQuickActionCategoryInstantMessage];

      if (v10)
      {
        [v3 addIndex:2];
        [v3 addIndex:3];
        uint64_t v6 = 4;
      }
      else
      {
        id v11 = [(CNQuickAction *)self category];
        int v12 = [v11 isEqualToString:CNQuickActionCategoryMail];

        if (!v12) {
          goto LABEL_10;
        }
        uint64_t v6 = 1;
      }
    }
  }
  [v3 addIndex:v6];
LABEL_10:

  return v3;
}

- (id)_coreDuetValue
{
  return 0;
}

- (NSString)globalIdentifier
{
  v3 = NSString;
  id v4 = [(CNQuickAction *)self category];
  char v5 = [(CNQuickAction *)self identifier];
  uint64_t v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CNQuickAction *)self globalIdentifier];
    v7 = [v5 globalIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CNQuickAction *)self globalIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (CNQuickAction)init
{
  v5.receiver = self;
  v5.super_class = (Class)CNQuickAction;
  v2 = [(CNQuickAction *)&v5 init];
  [(CNQuickAction *)v2 setEnabled:1];
  [(CNQuickAction *)v2 setDismissesWithAnimation:1];
  unint64_t v3 = +[CNUIColorRepository contactStyleDefaultTextColor];
  [(CNQuickAction *)v2 setImageTintColor:v3];

  return v2;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setImage:v9];

  [v11 setTitle:v10];
  [v11 setPerformBlock:v8];

  return v11;
}

+ (id)defaultTitleForActionInCategory:(id)a3 context:(int64_t)a4
{
  id v5 = a3;
  int v6 = [v5 isEqualToString:CNQuickActionCategoryAudioCall];
  if (a4 == 5)
  {
    if (v6)
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_BUTTON_AUDIO_CALL";
LABEL_22:
      id v10 = [v7 localizedStringForKey:v9 value:&stru_1ED8AC728 table:@"Localized"];

      goto LABEL_23;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryVideoCall])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_BUTTON_VIDEO_CALL";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryInstantMessage])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_BUTTON_MESSAGE";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryMail])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_BUTTON_MAIL";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryInfo])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_BUTTON_INFO";
      goto LABEL_22;
    }
  }
  else
  {
    if (v6)
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_AUDIO_CALL";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryVideoCall])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_VIDEO_CALL";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryInstantMessage])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_MESSAGE";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryMail])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_MAIL";
      goto LABEL_22;
    }
    if ([v5 isEqualToString:CNQuickActionCategoryInfo])
    {
      v7 = CNContactsUIBundle();
      id v8 = v7;
      id v9 = @"ACTION_INFO";
      goto LABEL_22;
    }
  }
  id v10 = 0;
LABEL_23:

  return v10;
}

+ (id)possibleTitlesForActionsInCategories:(id)a3 context:(int64_t)a4
{
  int v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = [v6 array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CNQuickAction_possibleTitlesForActionsInCategories_context___block_invoke;
  v12[3] = &unk_1E5497118;
  id v13 = v8;
  id v14 = a1;
  int64_t v15 = a4;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v10 = (void *)[v9 copy];

  return v10;
}

void __62__CNQuickAction_possibleTitlesForActionsInCategories_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) defaultTitleForActionInCategory:v8 context:*(void *)(a1 + 48)];
  [v3 addObject:v4];

  if ([v8 isEqualToString:CNQuickActionCategoryAudioCall])
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = +[CNQuickFaceTimeAction defaultFaceTimeAudioTitle];
  }
  else
  {
    if (![v8 isEqualToString:CNQuickActionCategoryVideoCall]) {
      goto LABEL_6;
    }
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = +[CNQuickFaceTimeAction defaultFaceTimeTitle];
  }
  id v7 = (void *)v6;
  [v5 addObject:v6];

LABEL_6:
}

+ (BOOL)reallyPerform
{
  if (reallyPerform_onceToken != -1) {
    dispatch_once(&reallyPerform_onceToken, &__block_literal_global_7203);
  }
  return reallyPerform_enabled;
}

uint64_t __30__CNQuickAction_reallyPerform__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"CNEnablePerformQuickActions", (CFStringRef)*MEMORY[0x1E4F1D3B8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = !v1;
  reallyPerform_enabled = v2;
  return result;
}

- (void)setBackAction:(BOOL)a3
{
}

- (BOOL)isBackAction
{
  char v2 = [(CNQuickAction *)self identifier];
  char v3 = [v2 isEqualToString:@"back"];

  return v3;
}

- (id)userActionType
{
  if (userActionType_cn_once_token_1 != -1) {
    dispatch_once(&userActionType_cn_once_token_1, &__block_literal_global_18962);
  }
  id v3 = (id)userActionType_cn_once_object_1;
  uint64_t v4 = [(CNQuickAction *)self category];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = CNQuickActionCategoryMail;
  }
  id v7 = [v3 objectForKey:v6];

  return v7;
}

void __51__CNQuickAction_CNUIUserActionItem__userActionType__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AD38];
  v6[0] = CNQuickActionCategoryMail;
  v6[1] = CNQuickActionCategoryInstantMessage;
  uint64_t v1 = *MEMORY[0x1E4F1AD48];
  v7[0] = v0;
  v7[1] = v1;
  v6[2] = CNQuickActionCategoryAudioCall;
  v6[3] = CNQuickActionCategoryVideoCall;
  uint64_t v2 = *MEMORY[0x1E4F1AD78];
  v7[2] = *MEMORY[0x1E4F1AD20];
  v7[3] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  uint64_t v4 = [v3 copy];
  id v5 = (void *)userActionType_cn_once_object_1;
  userActionType_cn_once_object_1 = v4;
}

@end