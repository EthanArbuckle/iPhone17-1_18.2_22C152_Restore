@interface FavoriteItem
+ (BOOL)_defaultShouldExpand;
+ (BOOL)_defaultShouldSync;
+ (OS_os_log)log;
+ (id)itemForAccount:(id)a3;
+ (id)itemForInboxWithAccount:(id)a3 selected:(BOOL)a4;
+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4;
+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4 shouldSync:(BOOL)a5;
+ (id)itemForOutbox;
+ (id)itemForSharedMailboxWithType:(unint64_t)a3 selected:(BOOL)a4;
+ (id)itemForUnifiedMailboxWithType:(int64_t)a3 selected:(BOOL)a4;
+ (id)itemForVIP:(id)a3 selected:(BOOL)a4;
+ (id)itemFromDictionary:(id)a3;
- (BOOL)_displayNameShouldBeRedacted;
- (BOOL)acceptsMessageTransfers;
- (BOOL)isExpandable;
- (BOOL)isExpandableInEditMode;
- (BOOL)isExpanded;
- (BOOL)isSelected;
- (BOOL)isVisible;
- (BOOL)shouldSync;
- (BOOL)showUnreadCount;
- (FavoriteItem)initWithDictionary:(id)a3;
- (FavoriteItem)initWithType:(int64_t)a3;
- (MFMessageCriterion)criterion;
- (NSArray)subItems;
- (NSDictionary)scrollableHint;
- (NSNumber)badgeCount;
- (NSPredicate)additionalPredicate;
- (NSString)analyticsKey;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)itemID;
- (NSString)itemURLString;
- (NSString)itemUUID;
- (NSString)parentItemID;
- (id)_descriptionFullyRedacted:(BOOL)a3;
- (id)account;
- (id)badgeCountString;
- (id)countQueryPredicate;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationRemovingSyncKeys;
- (id)displayName;
- (id)persistentIDForMigration;
- (id)representingMailbox;
- (id)representingMailboxes;
- (id)serverCountMailboxScope;
- (id)syncKey;
- (id)syncValue;
- (int64_t)type;
- (unint64_t)sourceType;
- (void)setBadgeCount:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setScrollableHint:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldSync:(BOOL)a3;
- (void)setShowUnreadCount:(BOOL)a3;
- (void)setSubItems:(id)a3;
- (void)wasAddedToCollection:(id)a3;
- (void)wasRemovedFromCollecion:(id)a3;
@end

@implementation FavoriteItem

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014970;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B790 != -1) {
    dispatch_once(&qword_10016B790, block);
  }
  v2 = (void *)qword_10016B788;

  return (OS_os_log *)v2;
}

+ (id)itemForAccount:(id)a3
{
  id v3 = a3;
  v4 = [[FavoriteItem_Account alloc] initWithAccount:v3];

  return v4;
}

+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4
{
  v4 = [a1 itemForMailbox:a3 selected:a4 shouldSync:1];

  return v4;
}

+ (id)itemForMailbox:(id)a3 selected:(BOOL)a4 shouldSync:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[FavoriteItem_Mailbox alloc] initWithMailbox:v7];
  [(FavoriteItem *)v8 setSelected:v6];
  [(FavoriteItem *)v8 setShouldSync:v5];

  return v8;
}

+ (id)itemForInboxWithAccount:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[FavoriteItem_Inbox alloc] initWithAccount:v5];
  [(FavoriteItem *)v6 setSelected:v4];

  return v6;
}

+ (id)itemForUnifiedMailboxWithType:(int64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [[FavoriteItem_UnifiedMailbox alloc] initWithMailboxType:a3];
  [(FavoriteItem *)v5 setSelected:v4];

  return v5;
}

+ (id)itemForSharedMailboxWithType:(unint64_t)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [[FavoriteItem_SharedMailbox alloc] initWithSourceType:a3];
  [(FavoriteItem *)v5 setSelected:v4];

  return v5;
}

+ (id)itemForVIP:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[FavoriteItem_VIPMailbox alloc] initWithVIP:v5];
  [(FavoriteItem *)v6 setSelected:v4];

  return v6;
}

+ (id)itemForOutbox
{
  v2 = objc_alloc_init(SharedItem_Outbox);

  return v2;
}

+ (BOOL)_defaultShouldSync
{
  return 0;
}

+ (BOOL)_defaultShouldExpand
{
  return 1;
}

- (FavoriteItem)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FavoriteItem;
  BOOL v4 = [(FavoriteItem *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_shouldSync = [(id)objc_opt_class() _defaultShouldSync];
    v5->_showUnreadCount = 1;
  }
  return v5;
}

- (FavoriteItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FavoriteItem;
  id v5 = [(FavoriteItem *)&v14 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKey:@"type"];
    v5->_type = (int64_t)[v6 integerValue];

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_showUnreadCount = 1;
    objc_super v7 = [v4 valueForKey:@"selected"];
    if (v7) {
      [(FavoriteItem *)v5 setSelected:NSBOOLFromString()];
    }
    else {
      [(FavoriteItem *)v5 setSelected:1];
    }
    v8 = [v4 valueForKey:@"shouldSync"];

    if (v8) {
      unsigned __int8 v9 = NSBOOLFromString();
    }
    else {
      unsigned __int8 v9 = [(id)objc_opt_class() _defaultShouldSync];
    }
    v5->_shouldSync = v9;
    v10 = [v4 valueForKey:@"expanded"];

    if (v10) {
      unsigned __int8 v11 = NSBOOLFromString();
    }
    else {
      unsigned __int8 v11 = [(id)objc_opt_class() _defaultShouldExpand];
    }
    v5->_expanded = v11;
    v12 = [v4 valueForKey:@"scrollableHint"];

    if (v12) {
      [(FavoriteItem *)v5 setScrollableHint:v12];
    }
    else {
      [(FavoriteItem *)v5 setScrollableHint:0];
    }
  }
  return v5;
}

+ (id)itemFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"type"];
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = (char *)[v4 integerValue];
    if ((unint64_t)(v6 - 7) <= 0xFFFFFFFFFFFFFFF9) {
      __assert_rtn("+[FavoriteItem itemFromDictionary:]", "FavoriteItem.m", 174, "type > 0 && type < FavoriteItemTypeMaxValue");
    }
    if ((unint64_t)(v6 - 1) < 6)
    {
      id v7 = [objc_alloc(*off_10013A3C0[(void)(v6 - 1)]) initWithDictionary:v3];
      goto LABEL_9;
    }
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning unsupported type", v10, 2u);
    }
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (id)dictionaryRepresentation
{
  [(FavoriteItem *)self sourceType];
  if (_MSSourceTypeIsValid())
  {
    if ((unint64_t)(self->_type - 1) >= 6) {
      sub_1000C0520();
    }
    id v3 = +[NSMutableDictionary dictionary];
    id v4 = +[NSNumber numberWithInteger:self->_type];
    [v3 setObject:v4 forKey:@"type"];

    [(FavoriteItem *)self isSelected];
    id v5 = NSStringFromBOOL();
    [v3 setValue:v5 forKey:@"selected"];

    [(FavoriteItem *)self isExpanded];
    BOOL v6 = NSStringFromBOOL();
    [v3 setValue:v6 forKey:@"expanded"];

    id v7 = [(FavoriteItem *)self scrollableHint];
    objc_msgSend(v3, "ef_setOptionalObject:forKey:", v7, @"scrollableHint");

    if (![(FavoriteItem *)self shouldSync])
    {
      [(FavoriteItem *)self shouldSync];
      v8 = NSStringFromBOOL();
      [v3 setObject:v8 forKey:@"shouldSync"];
    }
    unsigned __int8 v9 = +[EFDevice currentDevice];
    if ([v9 isInternal])
    {
      v10 = [(FavoriteItem *)self displayName];

      if (!v10) {
        goto LABEL_10;
      }
      unsigned __int8 v9 = [(FavoriteItem *)self displayName];
      [v3 setObject:v9 forKey:@"displayName"];
    }
  }
  else
  {
    id v3 = 0;
  }
LABEL_10:
  return v3;
}

- (id)dictionaryRepresentationRemovingSyncKeys
{
  v2 = [(FavoriteItem *)self dictionaryRepresentation];
  id v3 = [v2 mutableCopy];

  id v4 = NSStringFromBOOL();
  [v3 setObject:v4 forKeyedSubscript:@"shouldSync"];

  [v3 setObject:0 forKeyedSubscript:@"syncKey"];

  return v3;
}

- (NSString)itemID
{
  itemID = self->_itemID;
  if (!itemID)
  {
    if (self->_collectionID) {
      CFStringRef collectionID = (const __CFString *)self->_collectionID;
    }
    else {
      CFStringRef collectionID = &stru_10013ED08;
    }
    id v5 = [(FavoriteItem *)self itemUUID];
    BOOL v6 = +[NSString stringWithFormat:@"%@-%@", collectionID, v5];
    id v7 = self->_itemID;
    self->_itemID = v6;

    itemID = self->_itemID;
  }

  return itemID;
}

- (NSString)itemUUID
{
  itemUUID = self->_itemUUID;
  if (!itemUUID)
  {
    id v4 = +[NSString ef_UUID];
    id v5 = self->_itemUUID;
    self->_itemUUID = v4;

    itemUUID = self->_itemUUID;
  }

  return itemUUID;
}

- (NSString)itemURLString
{
  v2 = [(FavoriteItem *)self representingMailbox];
  id v3 = [v2 URLString];

  return (NSString *)v3;
}

- (NSString)parentItemID
{
  return 0;
}

- (BOOL)_displayNameShouldBeRedacted
{
  return 1;
}

- (id)displayName
{
}

- (id)badgeCountString
{
  id v3 = +[NSBundle bundleWithIdentifier:@"com.apple.Message"];
  id v4 = [v3 localizedStringForKey:@"UNREAD_COUNT_FORMAT%1$lu" value:&stru_10013ED08 table:@"Main"];
  id v5 = [(FavoriteItem *)self badgeCount];
  BOOL v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 integerValue]);

  return v6;
}

- (id)countQueryPredicate
{
  v2 = [(FavoriteItem *)self representingMailboxes];
  id v3 = objc_msgSend(v2, "ef_mapSelector:", "objectID");

  id v4 = +[EMMessageListItemPredicates predicateForMessagesInMailboxesWithObjectIDs:v3];
  id v5 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  v9[0] = v4;
  v9[1] = v5;
  BOOL v6 = +[NSArray arrayWithObjects:v9 count:2];
  id v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)serverCountMailboxScope
{
  v2 = [(FavoriteItem *)self representingMailboxes];
  id v3 = objc_msgSend(v2, "ef_mapSelector:", "objectID");
  id v4 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v3 forExclusion:0];

  return v4;
}

- (NSPredicate)additionalPredicate
{
  return 0;
}

- (id)account
{
  return 0;
}

- (id)representingMailbox
{
  return 0;
}

- (id)representingMailboxes
{
  uint64_t v2 = [(FavoriteItem *)self representingMailbox];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)isVisible
{
  return 1;
}

- (id)syncKey
{
  return 0;
}

- (id)syncValue
{
  return 0;
}

- (void)wasAddedToCollection:(id)a3
{
  id v6 = a3;
  id v4 = [v6 uniqueId];
  CFStringRef collectionID = self->_collectionID;
  self->_CFStringRef collectionID = v4;
}

- (void)wasRemovedFromCollecion:(id)a3
{
  CFStringRef collectionID = self->_collectionID;
  self->_CFStringRef collectionID = 0;
}

- (id)persistentIDForMigration
{
  return 0;
}

- (BOOL)acceptsMessageTransfers
{
  return 0;
}

- (BOOL)isExpandable
{
  uint64_t v2 = [(FavoriteItem *)self representingMailbox];
  if ([v2 hasChildren]) {
    char v3 = _os_feature_enabled_impl();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isExpandableInEditMode
{
  return 0;
}

- (BOOL)isExpanded
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_expanded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(FavoriteItem *)self isExpandable] && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000C054C();
    }
    LOBYTE(v3) = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  self->_expanded = v3;
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)ef_publicDescription
{
  BOOL v3 = +[EFDevice currentDevice];
  unsigned int v4 = [v3 isInternal];

  if (v4) {
    [(FavoriteItem *)self debugDescription];
  }
  else {
  id v5 = [(FavoriteItem *)self _descriptionFullyRedacted:1];
  }

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(FavoriteItem *)self _descriptionFullyRedacted:0];
}

- (id)_descriptionFullyRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(FavoriteItem *)self _displayNameShouldBeRedacted];
  unint64_t v6 = (unint64_t)[(FavoriteItem *)self type] - 1;
  if (v6 <= 6)
  {
    id v7 = off_10013A3F0[v6];
    if (v5) {
      goto LABEL_6;
    }
LABEL_5:
    v8 = [(FavoriteItem *)self displayName];
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  id v7 = 0;
  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_6:
  unsigned __int8 v9 = [(FavoriteItem *)self displayName];
  if (v3) {
    +[EFPrivacy fullyRedactedStringForString:v9];
  }
  else {
  uint64_t v10 = +[EFPrivacy partiallyRedactedStringForString:v9];
  }

  v8 = (void *)v10;
LABEL_10:
  unsigned __int8 v11 = &stru_10013ED08;
  if (objc_opt_respondsToSelector())
  {
    v12 = [(FavoriteItem *)self unreadCountToken];
    unsigned __int8 v11 = +[NSString stringWithFormat:@"unreadCountToken:%@", v12];
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; type = %@; visible:%d selected:%d expanded:%d displayName:%@ %@>",
    objc_opt_class(),
    self,
    v7,
    [(FavoriteItem *)self isVisible],
    [(FavoriteItem *)self isSelected],
    [(FavoriteItem *)self isExpanded],
    v8,
  v13 = v11);

  return v13;
}

- (unint64_t)sourceType
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (MFMessageCriterion)criterion
{
  return (MFMessageCriterion *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)badgeCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBadgeCount:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

- (NSDictionary)scrollableHint
{
  return self->_scrollableHint;
}

- (void)setScrollableHint:(id)a3
{
}

- (NSArray)subItems
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSubItems:(id)a3
{
}

- (BOOL)showUnreadCount
{
  return self->_showUnreadCount;
}

- (void)setShowUnreadCount:(BOOL)a3
{
  self->_showUnreadCount = a3;
}

- (NSString)analyticsKey
{
  return self->_analyticsKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsKey, 0);
  objc_storeStrong((id *)&self->_subItems, 0);
  objc_storeStrong((id *)&self->_scrollableHint, 0);
  objc_storeStrong((id *)&self->_badgeCount, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_itemUUID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);

  objc_storeStrong((id *)&self->_syncKey, 0);
}

@end