@interface ADNotificationOrderedDictionary
- (ADNotificationOrderedDictionary)init;
- (id)allBulletins;
- (id)appendItemWithBulletin:(id)a3;
- (id)bulletinForInternalID:(id)a3;
- (id)bulletinWithNotificationID:(id)a3;
- (void)enumerateBulletinsAfterBulletinWithNotificationID:(id)a3 usingBlock:(id)a4;
- (void)removeBulletinItem:(id)a3;
- (void)removeBulletinWithInternalID:(id)a3;
- (void)setBulletin:(id)a3 forInternalID:(id)a4;
@end

@implementation ADNotificationOrderedDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedBulletinsTail, 0);
  objc_storeStrong((id *)&self->_orderedBulletinsHead, 0);
  objc_storeStrong((id *)&self->_allBulletins, 0);
}

- (void)removeBulletinItem:(id)a3
{
  v4 = (AFLinkedListItem *)a3;
  v9 = v4;
  if (self->_orderedBulletinsHead == v4)
  {
    v5 = [(AFLinkedListItem *)v4 nextItem];
    orderedBulletinsHead = self->_orderedBulletinsHead;
    self->_orderedBulletinsHead = v5;

    v4 = v9;
  }
  if (self->_orderedBulletinsTail == v4)
  {
    v7 = [(AFLinkedListItem *)v9 previousItem];
    orderedBulletinsTail = self->_orderedBulletinsTail;
    self->_orderedBulletinsTail = v7;

    v4 = v9;
  }
  [(AFLinkedListItem *)v4 removeFromList];
}

- (id)appendItemWithBulletin:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)AFLinkedListItem) initWithObject:v4];

  if (self->_orderedBulletinsHead) {
    [v5 insertAfterItem:self->_orderedBulletinsTail];
  }
  else {
    objc_storeStrong((id *)&self->_orderedBulletinsHead, v5);
  }
  objc_storeStrong((id *)&self->_orderedBulletinsTail, v5);
  return v5;
}

- (void)enumerateBulletinsAfterBulletinWithNotificationID:(id)a3 usingBlock:(id)a4
{
  id v14 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    v7 = self->_orderedBulletinsHead;
    if (v7)
    {
      v8 = v7;
      unsigned __int8 v9 = 0;
      do
      {
        v10 = [v8 object];
        v11 = v10;
        if (v9)
        {
          v6[2](v6, v10);
          unsigned __int8 v9 = 1;
        }
        else
        {
          v12 = [v10 publisherBulletinID];
          unsigned __int8 v9 = [v12 isEqualToString:v14];
        }
        uint64_t v13 = [v8 nextItem];

        v8 = (void *)v13;
      }
      while (v13);
    }
  }
}

- (void)removeBulletinWithInternalID:(id)a3
{
  id v5 = a3;
  id v4 = -[NSMutableDictionary objectForKey:](self->_allBulletins, "objectForKey:");
  if (v4) {
    [(ADNotificationOrderedDictionary *)self removeBulletinItem:v4];
  }
  [(NSMutableDictionary *)self->_allBulletins removeObjectForKey:v5];
}

- (void)setBulletin:(id)a3 forInternalID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ADNotificationOrderedDictionary *)self bulletinForInternalID:v6];

  if (v7) {
    [(ADNotificationOrderedDictionary *)self removeBulletinWithInternalID:v6];
  }
  v8 = [(ADNotificationOrderedDictionary *)self appendItemWithBulletin:v9];
  [(NSMutableDictionary *)self->_allBulletins setObject:v8 forKey:v6];
}

- (id)allBulletins
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableDictionary count](self->_allBulletins, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_allBulletins allValues];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) object];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)bulletinWithNotificationID:(id)a3
{
  id v4 = a3;
  id v5 = self->_orderedBulletinsHead;
  if (v5)
  {
    id v6 = v5;
    while (1)
    {
      uint64_t v7 = [(AFLinkedListItem *)v6 object];
      v8 = [v7 publisherBulletinID];
      unsigned int v9 = [v8 isEqualToString:v4];

      if (v9) {
        break;
      }
      v10 = [(AFLinkedListItem *)v6 nextItem];

      id v6 = v10;
      if (!v10) {
        goto LABEL_8;
      }
    }
    v10 = [(AFLinkedListItem *)v6 object];
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)bulletinForInternalID:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_allBulletins objectForKey:a3];
  id v4 = [v3 object];

  return v4;
}

- (ADNotificationOrderedDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADNotificationOrderedDictionary;
  v2 = [(ADNotificationOrderedDictionary *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    allBulletins = v2->_allBulletins;
    v2->_allBulletins = v3;
  }
  return v2;
}

@end