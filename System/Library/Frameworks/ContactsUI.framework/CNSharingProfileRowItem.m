@interface CNSharingProfileRowItem
- (BOOL)isSelected;
- (CNSharingProfileRowItem)initWithLabel:(id)a3 accessoryView:(id)a4;
- (NSString)label;
- (UIView)accessoryView;
- (void)setIsSelected:(BOOL)a3;
@end

@implementation CNSharingProfileRowItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);

  objc_storeStrong((id *)&self->_label, 0);
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

- (CNSharingProfileRowItem)initWithLabel:(id)a3 accessoryView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfileRowItem;
  v9 = [(CNSharingProfileRowItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_storeStrong((id *)&v10->_accessoryView, a4);
    v11 = v10;
  }

  return v10;
}

@end