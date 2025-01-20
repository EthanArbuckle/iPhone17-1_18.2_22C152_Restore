@interface AXOnboardingTeachableItemBridge
- (NSString)itemDescription;
- (NSString)itemTitle;
- (void)setItemDescription:(id)a3;
- (void)setItemTitle:(id)a3;
@end

@implementation AXOnboardingTeachableItemBridge

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

@end