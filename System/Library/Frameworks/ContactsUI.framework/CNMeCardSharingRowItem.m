@interface CNMeCardSharingRowItem
- (BOOL)isSelected;
- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4;
- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4 confirmationHandler:(id)a5;
- (NSString)label;
- (UIView)accessoryView;
- (id)confirmationHandler;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CNMeCardSharingRowItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmationHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (id)confirmationHandler
{
  return self->_confirmationHandler;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSString)label
{
  return self->_label;
}

- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4 confirmationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNMeCardSharingRowItem;
  v12 = [(CNMeCardSharingRowItem *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_label, a3);
    objc_storeStrong((id *)&v13->_accessoryView, a4);
    uint64_t v14 = [v11 copy];
    id confirmationHandler = v13->_confirmationHandler;
    v13->_id confirmationHandler = (id)v14;

    v16 = v13;
  }

  return v13;
}

- (CNMeCardSharingRowItem)initWithLabel:(id)a3 accessoryView:(id)a4
{
  return [(CNMeCardSharingRowItem *)self initWithLabel:a3 accessoryView:a4 confirmationHandler:0];
}

@end