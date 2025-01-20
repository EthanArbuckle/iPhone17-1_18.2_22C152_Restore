@interface CKDMMCSItemGroupSet
- (CKDMMCSItemGroupSet)init;
- (CKDMMCSItemGroupSet)initWithItems:(id)a3;
- (NSError)error;
- (NSMutableDictionary)itemsByGroupTuple;
- (id)CKPropertiesDescription;
- (id)allItemGroups;
- (id)description;
- (void)addItem:(id)a3;
- (void)setCloneContext:(id)a3;
- (void)setItemsByGroupTuple:(id)a3;
@end

@implementation CKDMMCSItemGroupSet

- (CKDMMCSItemGroupSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKDMMCSItemGroupSet;
  v2 = [(CKDMMCSItemGroupSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    itemsByGroupTuple = v2->_itemsByGroupTuple;
    v2->_itemsByGroupTuple = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKDMMCSItemGroupSet)initWithItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = (CKDMMCSItemGroupSet *)objc_msgSend_init(self, v5, v6);
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v4;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, v20, 16);
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend_addItem_(v7, v11, *(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16);
        }
        while (v12 != v14);
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, v20, 16);
      }
      while (v12);
    }
  }
  return v7;
}

- (id)CKPropertiesDescription
{
  uint64_t v3 = NSString;
  id v4 = objc_msgSend_allItemGroups(self, a2, v2);
  uint64_t v6 = objc_msgSend_stringWithFormat_(v3, v5, @"itemGroups=%@", v4);

  return v6;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItemGroupSet *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (NSError)error
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = objc_msgSend_allItemGroups(self, v4, v5, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, v28, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v15 = objc_msgSend_error(v14, v9, v10);

        if (v15)
        {
          long long v16 = objc_msgSend_error(v14, v9, v10);
          objc_msgSend_addObject_(v3, v17, (uint64_t)v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, v28, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v3, v18, v19))
  {
    v22 = objc_msgSend_anyObject(v3, v20, v21);
  }
  else
  {
    v22 = 0;
  }

  return (NSError *)v22;
}

- (id)allItemGroups
{
  uint64_t v3 = objc_msgSend_itemsByGroupTuple(self, a2, v2);
  uint64_t v6 = objc_msgSend_allValues(v3, v4, v5);

  return v6;
}

- (void)addItem:(id)a3
{
  id v18 = a3;
  uint64_t v5 = objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v4, (uint64_t)v18);
  uint64_t v8 = objc_msgSend_itemsByGroupTuple(self, v6, v7);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v5);

  if (!v10)
  {
    uint64_t v12 = [CKDMMCSItemGroup alloc];
    uint64_t v10 = objc_msgSend_initWithTuple_(v12, v13, (uint64_t)v5);
    long long v16 = objc_msgSend_itemsByGroupTuple(self, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v10, v5);
  }
  objc_msgSend_addItem_(v10, v11, (uint64_t)v18);
}

- (void)setCloneContext:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_itemsByGroupTuple(self, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1C4F3EBAC;
    v9[3] = &unk_1E64F68F8;
    id v10 = v6;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v8, (uint64_t)v9);
  }
}

- (NSMutableDictionary)itemsByGroupTuple
{
  return self->_itemsByGroupTuple;
}

- (void)setItemsByGroupTuple:(id)a3
{
}

- (void).cxx_destruct
{
}

@end