@interface CKMacMenuToolbarItem
- (CKMacMenuToolbarItem)initWithItemIdentifier:(id)a3 menu:(id)a4;
- (UIMenu)menu;
- (void)setMenu:(id)a3;
@end

@implementation CKMacMenuToolbarItem

- (CKMacMenuToolbarItem)initWithItemIdentifier:(id)a3 menu:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKMacMenuToolbarItem;
  return [(CKMacToolbarItem *)&v5 init];
}

- (void)setMenu:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
}

@end