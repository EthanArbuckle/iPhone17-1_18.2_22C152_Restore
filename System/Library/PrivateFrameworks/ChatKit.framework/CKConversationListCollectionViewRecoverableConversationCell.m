@interface CKConversationListCollectionViewRecoverableConversationCell
+ (id)reuseIdentifier;
+ (id)reuseIdentifierForAXFontSize:(BOOL)a3;
+ (id)reuseIdentifiers;
- (BOOL)shouldAlwaysHideAvatar;
- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3;
- (BOOL)shouldAppearAsRecoverableConversation;
- (unint64_t)_daysUntilDeletion:(id)a3;
- (void)updateDateLabel:(id)a3 conversation:(id)a4;
@end

@implementation CKConversationListCollectionViewRecoverableConversationCell

+ (id)reuseIdentifiers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [a1 reuseIdentifierForAXFontSize:0];
  v4 = [a1 reuseIdentifierForAXFontSize:1];
  v7[0] = v3;
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)reuseIdentifierForAXFontSize:(BOOL)a3
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@+%@", v4, v7];

  return v8;
}

+ (id)reuseIdentifier
{
  v3 = +[CKUIBehavior sharedBehaviors];
  uint64_t v4 = [v3 isAccessibilityPreferredContentSizeCategory];

  return (id)[a1 reuseIdentifierForAXFontSize:v4];
}

- (void)updateDateLabel:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(CKConversationListCollectionViewRecoverableConversationCell *)self _daysUntilDeletion:a4];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = NSString;
  v10 = CKFrameworkBundle();
  v11 = [v10 localizedStringForKey:@"COUNT_DAYS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);

  v13 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v14 = [v13 userInterfaceLayoutDirection];

  if (v14 == 1) {
    v15 = @"\u200F";
  }
  else {
    v15 = @"\u200E";
  }
  id v16 = [(__CFString *)v15 stringByAppendingString:v12];

  [v6 setTextForOverride:v16];
}

- (unint64_t)_daysUntilDeletion:(id)a3
{
  return 0;
}

- (BOOL)shouldAppearAsRecoverableConversation
{
  return 1;
}

- (BOOL)shouldAlwaysHideUnreadIndicatorForConversation:(id)a3
{
  return 0;
}

- (BOOL)shouldAlwaysHideAvatar
{
  return 0;
}

@end