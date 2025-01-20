@interface IMPeople
- (BOOL)addIMHandle:(id)a3;
- (BOOL)addPeopleFromArray:(id)a3;
- (BOOL)addPeopleFromArray:(id)a3 skipMe:(BOOL)a4;
- (BOOL)coalescingChanges;
- (BOOL)containsIMHandle:(id)a3;
- (BOOL)hidePeople;
- (BOOL)removeIMHandle:(id)a3;
- (BOOL)removePeopleFromArray:(id)a3;
- (NSArray)groups;
- (NSMutableArray)people;
- (int64_t)coalesceCount;
- (unint64_t)count;
- (void)_addedPeople:(id)a3;
- (void)addedIMHandle:(id)a3;
- (void)beginCoalescedChanges;
- (void)dealloc;
- (void)endCoalescedChanges;
- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4;
- (void)removeNotificationObserver:(id)a3;
- (void)removedIMHandle:(id)a3;
- (void)setCoalesceCount:(int64_t)a3;
- (void)setPeople:(id)a3;
- (void)setShouldHidePeople:(BOOL)a3;
@end

@implementation IMPeople

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)IMPeople;
  [(IMPeople *)&v7 dealloc];
}

- (void)setShouldHidePeople:(BOOL)a3
{
  if (self->_hidePeople != a3)
  {
    self->_hidePeople = a3;
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, v3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v6, v5, @"__kIMPeopleChangedNotification", (uint64_t)self);
  }
}

- (void)removeNotificationObserver:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  v9 = objc_msgSend_defaultCenter(v4, v6, v7, v8);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)v5, @"__kIMPeopleAddedNotification", self);

  v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
  objc_msgSend_removeObserver_name_object_(v14, v15, (uint64_t)v5, @"__kIMPeopleRemovedNotification", self);

  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v20, v19, (uint64_t)v5, @"__kIMPeopleChangedNotification", self);
}

- (unint64_t)count
{
  if (objc_msgSend_hidePeople(self, a2, v2, v3)) {
    return 0;
  }
  people = self->_people;

  return objc_msgSend_count(people, v5, v6, v7);
}

- (BOOL)containsIMHandle:(id)a3
{
  return objc_msgSend_containsObjectIdenticalTo_(self->_people, a2, (uint64_t)a3, v3);
}

- (NSArray)groups
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = self->_people;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend_isBuddy(v13, v7, v8, v9))
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v14 = objc_msgSend_groupsArray(v13, v7, v8, v9, 0);
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, (uint64_t)v32, 16);
          if (v16)
          {
            uint64_t v19 = v16;
            uint64_t v20 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v25 != v20) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                if ((objc_msgSend_containsObject_(v3, v17, v22, v18) & 1) == 0) {
                  objc_msgSend_addObject_(v3, v17, v22, v18);
                }
              }
              uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, (uint64_t)v32, 16);
            }
            while (v19);
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v10);
  }

  return (NSArray *)v3;
}

- (NSMutableArray)people
{
  if (objc_msgSend_hidePeople(self, a2, v2, v3))
  {
    objc_msgSend_array(MEMORY[0x1E4F1C978], v5, v6, v7);
    uint64_t v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = self->_people;
  }

  return v8;
}

- (void)addedIMHandle:(id)a3
{
  id v16 = a3;
  if ((objc_msgSend_hidePeople(self, v4, v5, v6) & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = IMSingleObjectArray();
    uint64_t v10 = objc_msgSend_dictionaryWithObject_forKey_(v7, v9, (uint64_t)v8, @"__kIMPeopleChangedUserInfoKey");

    v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v14, v15, @"__kIMPeopleAddedNotification", (uint64_t)self, v10);
  }
}

- (void)_addedPeople:(id)a3
{
  id v14 = a3;
  if ((objc_msgSend_hidePeople(self, v4, v5, v6) & 1) == 0)
  {
    uint64_t v8 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v14, @"__kIMPeopleChangedUserInfoKey");
    uint64_t v12 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10, v11);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v12, v13, @"__kIMPeopleAddedNotification", (uint64_t)self, v8);
  }
}

- (void)removedIMHandle:(id)a3
{
  id v16 = a3;
  if ((objc_msgSend_hidePeople(self, v4, v5, v6) & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v8 = IMSingleObjectArray();
    uint64_t v10 = objc_msgSend_dictionaryWithObject_forKey_(v7, v9, (uint64_t)v8, @"__kIMPeopleChangedUserInfoKey");

    id v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v14, v15, @"__kIMPeopleRemovedNotification", (uint64_t)self, v10);
  }
}

- (void)beginCoalescedChanges
{
}

- (void)endCoalescedChanges
{
  int64_t coalesceCount = self->_coalesceCount;
  if (!coalesceCount)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, @"IMPeople.m", 129, @"Unbalanced calls to beginCoalescedChanges and endCoalescedChanges");

    int64_t coalesceCount = self->_coalesceCount;
  }
  int64_t v6 = coalesceCount - 1;
  self->_int64_t coalesceCount = v6;
  if (!v6 && (objc_msgSend_hidePeople(self, a2, v2, v3) & 1) == 0)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___mainThreadPostNotificationName_object_(v14, v10, @"__kIMPeopleChangedNotification", (uint64_t)self);
  }
}

- (BOOL)coalescingChanges
{
  return self->_coalesceCount > 0;
}

- (BOOL)addIMHandle:(id)a3
{
  id v4 = a3;
  char v9 = objc_msgSend_containsObjectIdenticalTo_(self->_people, v5, (uint64_t)v4, v6);
  if ((v9 & 1) == 0)
  {
    people = self->_people;
    if (!people)
    {
      uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = self->_people;
      self->_people = v11;

      people = self->_people;
    }
    objc_msgSend_addObject_(people, v7, (uint64_t)v4, v8);
    if ((objc_msgSend_coalescingChanges(self, v13, v14, v15) & 1) == 0) {
      objc_msgSend_addedIMHandle_(self, v16, (uint64_t)v4, v17);
    }
  }

  return v9 ^ 1;
}

- (BOOL)removeIMHandle:(id)a3
{
  id v4 = a3;
  int v9 = objc_msgSend_containsObjectIdenticalTo_(self->_people, v5, (uint64_t)v4, v6);
  if (v9)
  {
    objc_msgSend_removeObject_(self->_people, v7, (uint64_t)v4, v8);
    if ((objc_msgSend_coalescingChanges(self, v10, v11, v12) & 1) == 0) {
      objc_msgSend_removedIMHandle_(self, v13, (uint64_t)v4, v15);
    }
    if (!objc_msgSend_count(self->_people, v13, v14, v15))
    {
      people = self->_people;
      self->_people = 0;
    }
  }

  return v9;
}

- (BOOL)removePeopleFromArray:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v8 = objc_msgSend_count(self->_people, v5, v6, v7);
  objc_msgSend_removeObjectsInArray_(self->_people, v9, (uint64_t)v4, v10);
  unint64_t v17 = objc_msgSend_count(v4, v11, v12, v13);
  if (v17 < v8)
  {
    if ((objc_msgSend_coalescingChanges(self, v14, v15, v16) & 1) == 0)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v4;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v31, (uint64_t)v35, 16);
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v27 = *(void *)v32;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v32 != v27) {
              objc_enumerationMutation(v21);
            }
            objc_msgSend_removedIMHandle_(self, v24, *(void *)(*((void *)&v31 + 1) + 8 * v28++), v25, (void)v31);
          }
          while (v26 != v28);
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v31, (uint64_t)v35, 16);
        }
        while (v26);
      }
    }
    if (!objc_msgSend_count(self->_people, v18, v19, v20, (void)v31))
    {
      people = self->_people;
      self->_people = 0;
    }
  }

  return v17 < v8;
}

- (BOOL)addPeopleFromArray:(id)a3 skipMe:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v11, v12, v10, v13);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = v6;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ((objc_msgSend_containsObjectIdenticalTo_(self->_people, v18, (uint64_t)v23, v19, (void)v40) & 1) == 0
          && (!v4 || (objc_msgSend_isLoginIMHandle(v23, v18, v24, v19) & 1) == 0))
        {
          objc_msgSend_addObject_(v14, v18, (uint64_t)v23, v19);
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v20);
  }

  uint64_t v30 = objc_msgSend_count(v14, v25, v26, v27);
  if (v30)
  {
    people = self->_people;
    if (!people)
    {
      long long v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v33 = self->_people;
      self->_people = v32;

      people = self->_people;
    }
    objc_msgSend_addObjectsFromArray_(people, v28, (uint64_t)v14, v29, (void)v40);
    if ((objc_msgSend_coalescingChanges(self, v34, v35, v36) & 1) == 0) {
      objc_msgSend__addedPeople_(self, v37, (uint64_t)v14, v38);
    }
  }

  return v30 != 0;
}

- (BOOL)addPeopleFromArray:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_addPeopleFromArray_skipMe_, a3, 0);
}

- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ((objc_msgSend_isLoginIMHandle(v11, v6, v7, v8) & 1) == 0)
  {
    if (v4) {
      objc_msgSend_addIMHandle_(self, v9, (uint64_t)v11, v10);
    }
    else {
      objc_msgSend_removeIMHandle_(self, v9, (uint64_t)v11, v10);
    }
  }
}

- (BOOL)hidePeople
{
  return self->_hidePeople;
}

- (void)setPeople:(id)a3
{
}

- (int64_t)coalesceCount
{
  return self->_coalesceCount;
}

- (void)setCoalesceCount:(int64_t)a3
{
  self->_int64_t coalesceCount = a3;
}

- (void).cxx_destruct
{
}

@end