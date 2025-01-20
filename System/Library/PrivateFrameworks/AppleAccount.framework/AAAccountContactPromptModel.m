@interface AAAccountContactPromptModel
- (AAAccountContactPromptModel)init;
- (AALocalContactInfo)contact;
- (BOOL)destructiveActionRequiresAuth;
- (BOOL)primaryActionRequiresAuth;
- (NSString)destructiveActionSheetCancelText;
- (NSString)destructiveActionSheetDetails;
- (NSString)destructiveActionSheetTitle;
- (NSString)destructiveActionText;
- (NSString)detailsLabel;
- (NSString)detailsSubtitle;
- (NSString)doneButtonTitle;
- (NSString)primaryActionText;
- (NSString)secondaryActionText;
- (NSString)title;
- (void)setContact:(id)a3;
- (void)setDestructiveActionRequiresAuth:(BOOL)a3;
- (void)setDestructiveActionSheetCancelText:(id)a3;
- (void)setDestructiveActionSheetDetails:(id)a3;
- (void)setDestructiveActionSheetTitle:(id)a3;
- (void)setDestructiveActionText:(id)a3;
- (void)setDetailsLabel:(id)a3;
- (void)setDetailsSubtitle:(id)a3;
- (void)setDoneButtonTitle:(id)a3;
- (void)setPrimaryActionRequiresAuth:(BOOL)a3;
- (void)setPrimaryActionText:(id)a3;
- (void)setSecondaryActionText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAAccountContactPromptModel

- (AAAccountContactPromptModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)AAAccountContactPromptModel;
  v2 = [(AAAccountContactPromptModel *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    uint64_t v4 = [v3 localizedStringForKey:@"DONE" value:0 table:@"Localizable"];
    doneButtonTitle = v2->_doneButtonTitle;
    v2->_doneButtonTitle = (NSString *)v4;
  }
  return v2;
}

- (AALocalContactInfo)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
}

- (NSString)detailsSubtitle
{
  return self->_detailsSubtitle;
}

- (void)setDetailsSubtitle:(id)a3
{
}

- (NSString)primaryActionText
{
  return self->_primaryActionText;
}

- (void)setPrimaryActionText:(id)a3
{
}

- (NSString)secondaryActionText
{
  return self->_secondaryActionText;
}

- (void)setSecondaryActionText:(id)a3
{
}

- (NSString)destructiveActionText
{
  return self->_destructiveActionText;
}

- (void)setDestructiveActionText:(id)a3
{
}

- (NSString)destructiveActionSheetTitle
{
  return self->_destructiveActionSheetTitle;
}

- (void)setDestructiveActionSheetTitle:(id)a3
{
}

- (NSString)destructiveActionSheetDetails
{
  return self->_destructiveActionSheetDetails;
}

- (void)setDestructiveActionSheetDetails:(id)a3
{
}

- (NSString)destructiveActionSheetCancelText
{
  return self->_destructiveActionSheetCancelText;
}

- (void)setDestructiveActionSheetCancelText:(id)a3
{
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
}

- (BOOL)primaryActionRequiresAuth
{
  return self->_primaryActionRequiresAuth;
}

- (void)setPrimaryActionRequiresAuth:(BOOL)a3
{
  self->_primaryActionRequiresAuth = a3;
}

- (BOOL)destructiveActionRequiresAuth
{
  return self->_destructiveActionRequiresAuth;
}

- (void)setDestructiveActionRequiresAuth:(BOOL)a3
{
  self->_destructiveActionRequiresAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetCancelText, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetDetails, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetTitle, 0);
  objc_storeStrong((id *)&self->_destructiveActionText, 0);
  objc_storeStrong((id *)&self->_secondaryActionText, 0);
  objc_storeStrong((id *)&self->_primaryActionText, 0);
  objc_storeStrong((id *)&self->_detailsSubtitle, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end