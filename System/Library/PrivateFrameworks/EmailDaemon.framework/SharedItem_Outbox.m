@interface SharedItem_Outbox
- (BOOL)_displayNameShouldBeRedacted;
- (SharedItem_Outbox)init;
- (id)displayName;
- (id)itemID;
- (id)itemURLString;
@end

@implementation SharedItem_Outbox

- (SharedItem_Outbox)init
{
  v3.receiver = self;
  v3.super_class = (Class)SharedItem_Outbox;
  return [(FavoriteItem *)&v3 initWithType:6];
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 0;
}

- (id)displayName
{
  return +[MFMailboxUid specialNameForType:6];
}

- (id)itemID
{
  itemID = self->super._itemID;
  if (!itemID)
  {
    if (self->super._collectionID) {
      CFStringRef collectionID = (const __CFString *)self->super._collectionID;
    }
    else {
      CFStringRef collectionID = &stru_10013ED08;
    }
    v5 = +[NSString stringWithFormat:@"%@-%ld", collectionID, [(FavoriteItem *)self type]];
    v6 = self->super._itemID;
    self->super._itemID = v5;

    itemID = self->super._itemID;
  }

  return itemID;
}

- (id)itemURLString
{
  v2 = [(SharedItem_Outbox *)self itemID];
  objc_super v3 = +[NSString stringWithFormat:@"favoriteitem://outbox/%@", v2];

  return v3;
}

@end