@interface CKMacToolbarItem
- (CKMacToolbarItem)init;
- (NSString)itemIdentifier;
@end

@implementation CKMacToolbarItem

- (CKMacToolbarItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKMacToolbarItem;
  v2 = [(CKMacToolbarItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    itemIdentifier = v2->_itemIdentifier;
    v2->_itemIdentifier = (NSString *)&stru_1EDE4CA38;
  }
  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end