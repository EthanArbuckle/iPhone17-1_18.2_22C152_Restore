@interface AAUIOBContactSelectorViewModel
- (AAUIOBContactSelectorViewModel)initWithFlow:(unint64_t)a3;
- (BOOL)adoptTableViewScrollView;
- (NSArray)suggestedContacts;
- (NSString)detailText;
- (NSString)helpLinkTitle;
- (NSString)helpLinkURL;
- (NSString)primaryButton;
- (NSString)secondaryButton;
- (NSString)title;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (id)_modelForFlow:(unint64_t)a3;
- (int64_t)contentViewLayout;
- (int64_t)tableViewStyle;
- (void)_prepareModelForFlow:(unint64_t)a3;
- (void)setAdoptTableViewScrollView:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setDetailText:(id)a3;
- (void)setHelpLinkTitle:(id)a3;
- (void)setHelpLinkURL:(id)a3;
- (void)setImage:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setSecondaryView:(id)a3;
- (void)setSuggestedContacts:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAUIOBContactSelectorViewModel

- (AAUIOBContactSelectorViewModel)initWithFlow:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAUIOBContactSelectorViewModel;
  v4 = [(AAUIOBContactSelectorViewModel *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_contentViewLayout = 2;
    [(AAUIOBContactSelectorViewModel *)v4 _prepareModelForFlow:a3];
    v5->_adoptTableViewScrollView = 1;
    v5->_tableViewStyle = 2;
  }
  return v5;
}

- (void)_prepareModelForFlow:(unint64_t)a3
{
  v4 = [(AAUIOBContactSelectorViewModel *)self _modelForFlow:a3];
  model = self->_model;
  self->_model = v4;

  v6 = [(AAOBWelcomeControllerModelProtocol *)self->_model primaryButton];
  primaryButton = self->_primaryButton;
  self->_primaryButton = v6;

  v8 = [(AAOBWelcomeControllerModelProtocol *)self->_model secondaryButton];
  secondaryButton = self->_secondaryButton;
  self->_secondaryButton = v8;

  v10 = [(AAOBWelcomeControllerModelProtocol *)self->_model title];
  title = self->_title;
  self->_title = v10;

  self->_detailText = [(AAOBWelcomeControllerModelProtocol *)self->_model detailText];
  MEMORY[0x270F9A758]();
}

- (id)_modelForFlow:(unint64_t)a3
{
  if (a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_new();
  }
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (BOOL)adoptTableViewScrollView
{
  return self->_adoptTableViewScrollView;
}

- (void)setAdoptTableViewScrollView:(BOOL)a3
{
  self->_adoptTableViewScrollView = a3;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end