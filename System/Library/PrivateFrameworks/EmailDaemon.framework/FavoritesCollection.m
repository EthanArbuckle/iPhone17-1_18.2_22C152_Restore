@interface FavoritesCollection
+ (id)accountsCollection;
+ (id)mailboxesCollection;
+ (id)outboxCollection;
- (BOOL)addExpandedItem:(id)a3;
- (BOOL)addItem:(id)a3;
- (BOOL)addItem:(id)a3 ordered:(BOOL)a4;
- (BOOL)addOrUpdateItem:(id)a3 replacedItem:(id *)a4;
- (BOOL)hidesHeader;
- (BOOL)isAccountsCollection;
- (BOOL)isEditing;
- (BOOL)isMailboxesCollection;
- (BOOL)isOutboxCollection;
- (BOOL)isShowingAllInboxes;
- (BOOL)isShowingSharedMailboxOfType:(unint64_t)a3;
- (BOOL)isVisible;
- (BOOL)transient;
- (FavoritesCollection)initWithDictionary:(id)a3;
- (NSArray)expandedItems;
- (NSArray)items;
- (NSArray)itemsIncludingSubItems;
- (NSArray)selectedItems;
- (NSArray)visibleItems;
- (NSString)displayName;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemWithSyncKey:(id)a3;
- (id)itemsContainingName:(id)a3;
- (id)itemsMatchingItemURLStrings:(id)a3;
- (id)itemsMatchingName:(id)a3;
- (id)itemsOfType:(int64_t)a3;
- (id)removeExpandedItem:(id)a3;
- (id)removeItem:(id)a3;
- (id)removeItemWithSyncKey:(id)a3;
- (id)uniqueId;
- (id)visibleItemsOfType:(int64_t)a3;
- (void)addExpandedItemsFromDictionaryRepresentations:(id)a3;
- (void)addOrUpdateExpandedItem:(id)a3 replacedItem:(id *)a4;
- (void)invalidateVisibleItems;
- (void)persistAllInboxesStateToMaild;
- (void)prepareForWriting;
- (void)setEditing:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setTransient:(BOOL)a3;
@end

@implementation FavoritesCollection

- (FavoritesCollection)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FavoritesCollection;
  v5 = [(FavoritesCollection *)&v24 init];
  if (!v5) {
    goto LABEL_20;
  }
  v6 = [v4 objectForKey:@"type"];
  id v23 = v4;
  v5->_uint64_t type = (unint64_t)[v6 integerValue];

  v7 = [v4 objectForKey:@"displayName"];
  v8 = v7;
  uint64_t type = v5->_type;
  if (type) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0;
  }
  v22 = v7;
  if (!v10)
  {
    if (objc_msgSend(v7, "isEqualToString:", @"__OUTBOX__", v7))
    {
      uint64_t type = 2;
LABEL_11:
      v5->_uint64_t type = type;
      goto LABEL_12;
    }
    if ([v8 isEqualToString:@"INBOXES"]
      || [v8 isEqualToString:@"MAILBOXES"])
    {
      uint64_t type = 1;
      goto LABEL_11;
    }
    if ([v8 isEqualToString:@"ACCOUNTS"]
      || ([v8 isEqualToString:@"SINGLE_ACCOUNT_MAILBOXES"] & 1) != 0)
    {
      uint64_t type = 3;
      goto LABEL_11;
    }
    uint64_t type = v5->_type;
  }
LABEL_12:
  sub_10001A6B8((uint64_t)v5, type);
  v11 = [v4 objectForKey:@"items"];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v13 = objc_opt_new();
  invalidItemDicts = v5->_invalidItemDicts;
  v5->_invalidItemDicts = (NSMutableDictionary *)v13;

  for (unint64_t i = 0; i < (unint64_t)objc_msgSend(v11, "count", v22); ++i)
  {
    v16 = [v11 objectAtIndexedSubscript:i];
    v17 = +[FavoriteItem itemFromDictionary:v16];
    v18 = v17;
    if (v17)
    {
      [v17 sourceType];
      if (_MSSourceTypeIsValid())
      {
        [v12 addObject:v18];
      }
      else
      {
        v19 = v5->_invalidItemDicts;
        v20 = +[NSNumber numberWithUnsignedInteger:i];
        [(NSMutableDictionary *)v19 setObject:v16 forKeyedSubscript:v20];
      }
    }
  }
  [(FavoritesCollection *)v5 setItems:v12];

  id v4 = v23;
LABEL_20:

  return v5;
}

+ (id)mailboxesCollection
{
  v2 = sub_10001A62C([FavoritesCollection alloc], 1);

  return v2;
}

+ (id)accountsCollection
{
  v2 = sub_10001A62C([FavoritesCollection alloc], 3);

  return v2;
}

+ (id)outboxCollection
{
  v2 = sub_10001A62C([FavoritesCollection alloc], 2);
  v3 = +[FavoriteItem itemForOutbox];
  [v2 addItem:v3];

  return v2;
}

- (BOOL)isMailboxesCollection
{
  return self->_type == 1;
}

- (BOOL)isAccountsCollection
{
  return self->_type == 3;
}

- (BOOL)isOutboxCollection
{
  return self->_type == 2;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithInteger:self->_type];
  [v3 setObject:v4 forKey:@"type"];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10001AF98;
  v32 = sub_10001AFA8;
  id v33 = 0;
  state = self->_state;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001AFB0;
  v27[3] = &unk_10013A4E0;
  v27[4] = &v28;
  [(EFLocked *)state performWhileLocked:v27];
  if ([(NSMutableDictionary *)self->_invalidItemDicts count])
  {
    v6 = self->_invalidItemDicts;
    v7 = [(NSMutableDictionary *)v6 allKeys];
    v8 = [v7 sortedArrayUsingSelector:"compare:"];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v14 = self->_invalidItemDicts;
          v15 = -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v13, (void)v23);

          id v16 = [v13 unsignedIntegerValue];
          id v17 = [(id)v29[5] count];
          v18 = (void *)v29[5];
          if (v16 >= v17)
          {
            v19 = [v18 objectForKeyedSubscript:@"items"];
            [v19 addObject:v15];
          }
          else
          {
            v19 = [v18 objectForKeyedSubscript:@"items"];
            [v19 insertObject:v15 atIndex:v16];
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v10);
    }
  }
  v20 = objc_msgSend((id)v29[5], "objectForKeyedSubscript:", @"items", (void)v23);
  [v3 setObject:v20 forKey:@"items"];

  if (_os_feature_enabled_impl())
  {
    v21 = [(id)v29[5] objectForKeyedSubscript:@"expandedItems"];
    [v3 setObject:v21 forKey:@"expandedItems"];
  }
  _Block_object_dispose(&v28, 8);

  return v3;
}

- (void)prepareForWriting
{
  if ([(FavoritesCollection *)self isAccountsCollection])
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    id v9 = sub_10001AF98;
    id v10 = sub_10001AFA8;
    id v11 = 0;
    if (self) {
      state = self->_state;
    }
    else {
      state = 0;
    }
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001B180;
    v5[3] = &unk_10013A4E0;
    v5[4] = &v6;
    [(EFLocked *)state performWhileLocked:v5];
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setObject:v7[5] forKey:@"MailAccountsOrder"];
    [v4 synchronize];

    _Block_object_dispose(&v6, 8);
  }
  if ([(FavoritesCollection *)self isMailboxesCollection]) {
    [(FavoritesCollection *)self persistAllInboxesStateToMaild];
  }
}

- (BOOL)isEditing
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B2B8;
  v4[3] = &unk_10013A4E0;
  v4[4] = &v5;
  [(FavoritesCollection *)self performWhileLocked:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setEditing:(BOOL)a3
{
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001B394;
  v3[3] = &unk_10013A500;
  BOOL v4 = a3;
  [(FavoritesCollection *)self performWhileLocked:v3];
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  uint64_t v6 = state;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B514;
  v8[3] = &unk_10013A528;
  id v7 = v4;
  id v9 = v7;
  [(EFLocked *)v6 performWhileLocked:v8];

  [v7 makeObjectsPerformSelector:"wasAddedToCollection:" withObject:self];
  [(FavoritesCollection *)self invalidateVisibleItems];
}

- (void)invalidateVisibleItems
{
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  [(FavoritesCollection *)self performWhileLocked:&stru_10013A568];
}

- (BOOL)addItem:(id)a3
{
  return [(FavoritesCollection *)self addItem:a3 ordered:0];
}

- (BOOL)addItem:(id)a3 ordered:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  char v8 = state;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B6A0;
  v12[3] = &unk_10013A590;
  v14 = &v16;
  id v9 = v6;
  id v13 = v9;
  BOOL v15 = a4;
  [(EFLocked *)v8 performWhileLocked:v12];

  if (*((unsigned char *)v17 + 24))
  {
    sub_10001B710(self, v9);
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)addExpandedItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  id v6 = state;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B894;
  v9[3] = &unk_10013A5B8;
  id v10 = v4;
  id v11 = &v12;
  id v7 = v4;
  [(EFLocked *)v6 performWhileLocked:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

- (BOOL)addOrUpdateItem:(id)a3 replacedItem:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_10001AF98;
  long long v24 = sub_10001AFA8;
  id v25 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  char v8 = state;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10001BB28;
  char v15 = &unk_10013A5E0;
  id v17 = &v20;
  id v9 = v6;
  id v16 = v9;
  uint64_t v18 = &v26;
  char v19 = &v30;
  [(EFLocked *)v8 performWhileLocked:&v12];

  if (a4) {
    *a4 = (id) v21[5];
  }
  if (*((unsigned char *)v31 + 24))
  {
    [(FavoritesCollection *)self invalidateVisibleItems];
  }
  else if (*((unsigned char *)v27 + 24))
  {
    sub_10001B710(self, v9);
  }
  if (*((unsigned char *)v27 + 24)) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = *((unsigned char *)v31 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v10;
}

- (void)addOrUpdateExpandedItem:(id)a3 replacedItem:(id *)a4
{
  id v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10001AF98;
  char v19 = sub_10001AFA8;
  id v20 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  char v8 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BD70;
  v10[3] = &unk_10013A5E0;
  uint64_t v12 = &v15;
  id v9 = v6;
  id v11 = v9;
  uint64_t v13 = v21;
  uint64_t v14 = v23;
  [(EFLocked *)v8 performWhileLocked:v10];

  if (a4) {
    *a4 = (id) v16[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

- (void)addExpandedItemsFromDictionaryRepresentations:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        char v8 = +[FavoriteItem itemFromDictionary:](FavoriteItem, "itemFromDictionary:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v7), (void)v10);
        id v9 = v8;
        if (v8)
        {
          [v8 sourceType];
          if (_MSSourceTypeIsValid()) {
            [(FavoritesCollection *)self addExpandedItem:v9];
          }
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)removeItem:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10001AF98;
  uint64_t v18 = sub_10001AFA8;
  id v19 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  uint64_t v6 = state;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C0E8;
  v11[3] = &unk_10013A5B8;
  long long v13 = &v14;
  id v7 = v4;
  id v12 = v7;
  [(EFLocked *)v6 performWhileLocked:v11];

  char v8 = (void *)v15[5];
  if (v8)
  {
    sub_10001C160(self, v7);
    char v8 = (void *)v15[5];
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)removeExpandedItem:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10001AF98;
  uint64_t v17 = sub_10001AFA8;
  id v18 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  uint64_t v6 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C330;
  v10[3] = &unk_10013A5B8;
  id v11 = v4;
  id v12 = &v13;
  id v7 = v4;
  [(EFLocked *)v6 performWhileLocked:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)removeItemWithSyncKey:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10001AF98;
  id v19 = sub_10001AFA8;
  id v20 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  uint64_t v6 = state;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001C534;
  v12[3] = &unk_10013A5B8;
  uint64_t v14 = &v15;
  id v7 = v4;
  id v13 = v7;
  [(EFLocked *)v6 performWhileLocked:v12];

  id v8 = (void *)v16[5];
  if (v8)
  {
    sub_10001C160(self, v8);
    id v9 = (void *)v16[5];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)itemWithSyncKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10001AF98;
  uint64_t v17 = sub_10001AFA8;
  id v18 = 0;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  uint64_t v6 = state;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C70C;
  v10[3] = &unk_10013A5B8;
  id v11 = v4;
  id v12 = &v13;
  id v7 = v4;
  [(EFLocked *)v6 performWhileLocked:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSArray)items
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10001AF98;
  id v9 = sub_10001AFA8;
  id v10 = 0;
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C894;
  v4[3] = &unk_10013A4E0;
  v4[4] = &v5;
  [(FavoritesCollection *)self performWhileLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (NSArray)expandedItems
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10001AF98;
  id v9 = sub_10001AFA8;
  id v10 = 0;
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CA30;
  v4[3] = &unk_10013A4E0;
  v4[4] = &v5;
  [(FavoritesCollection *)self performWhileLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (NSArray)visibleItems
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10001AF98;
  id v9 = sub_10001AFA8;
  id v10 = 0;
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CBCC;
  v4[3] = &unk_10013A4E0;
  v4[4] = &v5;
  [(FavoritesCollection *)self performWhileLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (NSArray)selectedItems
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10001AF98;
  id v9 = sub_10001AFA8;
  id v10 = 0;
  if (self) {
    self = (FavoritesCollection *)self->_state;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001CD50;
  v4[3] = &unk_10013A4E0;
  v4[4] = &v5;
  [(FavoritesCollection *)self performWhileLocked:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (id)itemsOfType:(int64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001CE44;
  v5[3] = &unk_10013A600;
  v5[4] = a3;
  id v3 = sub_10001CE78((id *)&self->super.isa, v5);

  return v3;
}

- (id)visibleItemsOfType:(int64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D054;
  v5[3] = &unk_10013A600;
  v5[4] = a3;
  id v3 = sub_10001CE78((id *)&self->super.isa, v5);

  return v3;
}

- (id)itemsMatchingName:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D180;
  v7[3] = &unk_10013A628;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = sub_10001D26C((id *)&self->super.isa, v7);

  return v5;
}

- (id)itemsContainingName:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D4A4;
  v7[3] = &unk_10013A628;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = sub_10001D26C((id *)&self->super.isa, v7);

  return v5;
}

- (id)itemsMatchingItemURLStrings:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D650;
  v7[3] = &unk_10013A628;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = sub_10001D26C((id *)&self->super.isa, v7);

  return v5;
}

- (NSArray)itemsIncludingSubItems
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10001AF98;
  id v11 = sub_10001AFA8;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DA88;
  v6[3] = &unk_10013A4E0;
  v6[4] = &v7;
  [(EFLocked *)state performWhileLocked:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (BOOL)isVisible
{
  return 1;
}

- (NSString)displayName
{
  id v3 = sub_10001DC78((uint64_t)self, self->_type);
  id v4 = +[DaemonAppController sharedController];
  uint64_t v5 = [v4 accountsProvider];
  uint64_t v6 = [v5 displayedAccounts];

  if (-[FavoritesCollection isMailboxesCollection](self, "isMailboxesCollection") && [v6 count] == (id)1)
  {
    uint64_t v7 = [v6 anyObject];
    uint64_t v8 = [v7 displayName];

    id v3 = (void *)v8;
  }
  else if ([(FavoritesCollection *)self isAccountsCollection])
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    state = self->_state;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001DFDC;
    v13[3] = &unk_10013A4E0;
    v13[4] = &v14;
    [(EFLocked *)state performWhileLocked:v13];
    if ((unint64_t)v15[3] <= 1)
    {
      id v10 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"SINGLE_ACCOUNT_MAILBOXES" value:&stru_10013ED08 table:@"Main"];

      id v3 = (void *)v11;
    }
    _Block_object_dispose(&v14, 8);
  }

  return (NSString *)v3;
}

- (BOOL)isShowingSharedMailboxOfType:(unint64_t)a3
{
  id v4 = [(FavoritesCollection *)self visibleItems];
  uint64_t v5 = +[FavoriteItem itemForSharedMailboxWithType:a3 selected:0];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)isShowingAllInboxes
{
  id v2 = [(FavoritesCollection *)self visibleItems];
  id v3 = +[FavoriteItem itemForUnifiedMailboxWithType:7 selected:0];
  unsigned __int8 v4 = [v2 containsObject:v3];

  return v4;
}

- (void)persistAllInboxesStateToMaild
{
  id v3 = +[NSNumber numberWithBool:[(FavoritesCollection *)self isShowingAllInboxes]];
  id v2 = +[NSUserDefaults em_userDefaults];
  [v2 setValue:v3 forKey:EMUserDefaultAllInboxesEnabled];
}

- (BOOL)hidesHeader
{
  if ([(FavoritesCollection *)self isMailboxesCollection]
    || [(FavoritesCollection *)self isOutboxCollection])
  {
    return 1;
  }

  return [(FavoritesCollection *)self isAccountsCollection];
}

- (id)uniqueId
{
  return +[NSString stringWithFormat:@"Collection-%d", self->_type];
}

- (id)description
{
  id v3 = sub_10001DC78((uint64_t)self, self->_type);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(FavoritesCollection *)self items];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; uint64_t type = %@; items = %@>",
    v4,
    self,
    v3,
  unsigned __int8 v6 = v5);

  return v6;
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_invalidItemDicts, 0);
}

@end