@interface BCSItemCache
- (BCSItemCache)init;
- (id)itemMatching:(id)a3;
- (void)beginBatch;
- (void)deleteExpiredItemsOfType:(int64_t)a3;
- (void)deleteItemMatching:(id)a3;
- (void)deleteItemsOfType:(int64_t)a3;
- (void)deleteLinkItemsWithBundleID:(id)a3;
- (void)endBatch;
- (void)updateItem:(id)a3 withItemIdentifier:(id)a4;
@end

@implementation BCSItemCache

- (BCSItemCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)BCSItemCache;
  v2 = [(BCSItemCache *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(BCSLinkItemPersistentStore);
    linkItemStore = v2->_linkItemStore;
    v2->_linkItemStore = v3;

    uint64_t v5 = +[BCSBusinessItemMemoryCache sharedCache]();
    chatSuggestItemStore = v2->_chatSuggestItemStore;
    v2->_chatSuggestItemStore = (BCSBusinessItemMemoryCache *)v5;

    v7 = objc_alloc_init(BCSBusinessCallerPersistentStore);
    businessCallerStore = v2->_businessCallerStore;
    v2->_businessCallerStore = v7;

    v9 = objc_alloc_init(BCSBusinessEmailPersistentStore);
    businessEmailStore = v2->_businessEmailStore;
    v2->_businessEmailStore = v9;

    uint64_t v11 = +[BCSUserDefaults sharedDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (BCSUserDefaultsProviding *)v11;
  }
  return v2;
}

- (id)itemMatching:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 1:
      if (!self) {
        goto LABEL_16;
      }
      uint64_t v5 = 8;
      goto LABEL_11;
    case 2:
      if (!self) {
        goto LABEL_16;
      }
      uint64_t v5 = 16;
      goto LABEL_11;
    case 3:
      if (!self) {
        goto LABEL_16;
      }
      uint64_t v5 = 24;
      goto LABEL_11;
    case 4:
      if (self)
      {
        uint64_t v5 = 32;
LABEL_11:
        v7 = *(Class *)((char *)&self->super.isa + v5);
      }
      else
      {
LABEL_16:
        v7 = 0;
      }
      v6 = [v7 itemMatching:v4];
LABEL_13:

      return v6;
    default:
      v6 = 0;
      goto LABEL_13;
  }
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  switch([v6 type])
  {
    case 1:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v7 = 8;
      goto LABEL_10;
    case 2:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v7 = 16;
      goto LABEL_10;
    case 3:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v7 = 24;
      goto LABEL_10;
    case 4:
      if (self)
      {
        uint64_t v7 = 32;
LABEL_10:
        v8 = *(Class *)((char *)&self->super.isa + v7);
      }
      else
      {
LABEL_15:
        v8 = 0;
      }
      [v8 updateItem:v9 withItemIdentifier:v6];
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)deleteItemMatching:(id)a3
{
  id v6 = a3;
  switch([v6 type])
  {
    case 1:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v4 = 8;
      goto LABEL_10;
    case 2:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v4 = 16;
      goto LABEL_10;
    case 3:
      if (!self) {
        goto LABEL_15;
      }
      uint64_t v4 = 24;
      goto LABEL_10;
    case 4:
      if (self)
      {
        uint64_t v4 = 32;
LABEL_10:
        uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
      }
      else
      {
LABEL_15:
        uint64_t v5 = 0;
      }
      [v5 deleteItemMatching:v6];
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)deleteItemsOfType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      if (self) {
        self = (BCSItemCache *)self->_chatSuggestItemStore;
      }
      uint64_t v3 = 1;
      goto LABEL_5;
    case 2:
      if (self) {
        self = (BCSItemCache *)self->_linkItemStore;
      }
      uint64_t v3 = 2;
      goto LABEL_5;
    case 3:
      if (self) {
        self = (BCSItemCache *)self->_businessCallerStore;
      }
      uint64_t v3 = 3;
      goto LABEL_5;
    case 4:
      if (self) {
        self = (BCSItemCache *)self->_businessEmailStore;
      }
      uint64_t v3 = 4;
LABEL_5:
      [(BCSItemCache *)self deleteItemsOfType:v3];
      break;
    default:
      return;
  }
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      if (self) {
        self = (BCSItemCache *)self->_chatSuggestItemStore;
      }
      uint64_t v3 = 1;
      goto LABEL_5;
    case 2:
      if (self) {
        self = (BCSItemCache *)self->_linkItemStore;
      }
      uint64_t v3 = 2;
      goto LABEL_5;
    case 3:
      if (self) {
        self = (BCSItemCache *)self->_businessCallerStore;
      }
      uint64_t v3 = 3;
      goto LABEL_5;
    case 4:
      if (self) {
        self = (BCSItemCache *)self->_businessEmailStore;
      }
      uint64_t v3 = 4;
LABEL_5:
      [(BCSItemCache *)self deleteExpiredItemsOfType:v3];
      break;
    default:
      return;
  }
}

- (void)deleteLinkItemsWithBundleID:(id)a3
{
  if (self) {
    self = (BCSItemCache *)self->_linkItemStore;
  }
  [(BCSItemCache *)self deleteLinkItemsWithBundleID:a3];
}

- (void)beginBatch
{
  if (self) {
    self = (BCSItemCache *)self->_linkItemStore;
  }
  [(BCSItemCache *)self beginBatch];
}

- (void)endBatch
{
  if (self) {
    self = (BCSItemCache *)self->_linkItemStore;
  }
  [(BCSItemCache *)self endBatch];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_businessEmailStore, 0);
  objc_storeStrong((id *)&self->_businessCallerStore, 0);
  objc_storeStrong((id *)&self->_linkItemStore, 0);

  objc_storeStrong((id *)&self->_chatSuggestItemStore, 0);
}

@end