@interface IMOrderedMutableDictionary
- (BOOL)containsKey:(id)a3;
- (BOOL)containsOrderedObject:(id)a3;
- (IMOrderedMutableDictionary)init;
- (id)orderedObjectForKey:(id)a3;
- (id)orderedObjects;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)removeOrderedObjectForKey:(id)a3;
- (void)setOrderedObject:(id)a3 forKey:(id)a4;
@end

@implementation IMOrderedMutableDictionary

- (IMOrderedMutableDictionary)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMOrderedMutableDictionary;
  v2 = [(IMOrderedMutableDictionary *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    mutableOrderedSet = v2->_mutableOrderedSet;
    v2->_mutableOrderedSet = v5;

    orderedItems = v2->_orderedItems;
    v2->_orderedItems = 0;
  }
  return v2;
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_mutableOrderedSet, a2, v2, v3);
}

- (void)setOrderedObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v11 = objc_msgSend_indexOfObject_(self->_mutableOrderedSet, v8, (uint64_t)v7, v9);
      mutableOrderedSet = self->_mutableOrderedSet;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend_addObject_(self->_mutableOrderedSet, v12, (uint64_t)v10, v13);
      }
      else
      {
        v33 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v12, v11, v13);
        uint64_t v37 = objc_msgSend_count(self->_mutableOrderedSet, v34, v35, v36);
        objc_msgSend_moveObjectsAtIndexes_toIndex_(mutableOrderedSet, v38, (uint64_t)v33, v37 - 1);
      }
      objc_msgSend_setObject_forKey_(self->_dictionary, v15, (uint64_t)v6, (uint64_t)v10);
      orderedItems = self->_orderedItems;
      self->_orderedItems = 0;

      goto LABEL_15;
    }
    goto LABEL_11;
  }
  long long v57 = xmmword_1E5724368;
  long long v58 = *(_OWORD *)off_1E5724378;
  uint64_t v59 = 40;
  v16 = NSString;
  v17 = IMFileLocationTrimFileName(&v57);
  uint64_t v18 = v59;
  v21 = objc_msgSend_stringWithFormat_(NSString, v19, (uint64_t)&stru_1EE231AD8, v20);
  v24 = objc_msgSend_stringWithFormat_(v16, v22, @"Unexpected nil '%@' in %s at %s:%d. %@", v23, @"object", "-[IMOrderedMutableDictionary setOrderedObject:forKey:]", v17, v18, v21);

  v25 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v25) {
    v25(v24);
  }
  else {
    _IMWarn(@"ASSERTION FAILED: %@", v26, v27, v28, v29, v30, v31, v32, (char)v24);
  }

  if (!v10)
  {
LABEL_11:
    long long v57 = xmmword_1E5724390;
    long long v58 = *(_OWORD *)off_1E57243A0;
    uint64_t v59 = 41;
    v40 = NSString;
    v41 = IMFileLocationTrimFileName(&v57);
    uint64_t v42 = v59;
    v45 = objc_msgSend_stringWithFormat_(NSString, v43, (uint64_t)&stru_1EE231AD8, v44);
    v48 = objc_msgSend_stringWithFormat_(v40, v46, @"Unexpected nil '%@' in %s at %s:%d. %@", v47, @"key", "-[IMOrderedMutableDictionary setOrderedObject:forKey:]", v41, v42, v45);

    v49 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v49) {
      v49(v48);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v50, v51, v52, v53, v54, v55, v56, (char)v48);
    }
  }
LABEL_15:
}

- (id)orderedObjectForKey:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v26[0] = xmmword_1E57243B8;
    v26[1] = *(_OWORD *)off_1E57243C8;
    uint64_t v27 = 56;
    id v7 = NSString;
    v8 = IMFileLocationTrimFileName(v26);
    uint64_t v9 = v27;
    v12 = objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)&stru_1EE231AD8, v11);
    v15 = objc_msgSend_stringWithFormat_(v7, v13, @"Unexpected nil '%@' in %s at %s:%d. %@", v14, @"key", "-[IMOrderedMutableDictionary orderedObjectForKey:]", v8, v9, v12);

    v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16) {
      v16(v15);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v17, v18, v19, v20, v21, v22, v23, (char)v15);
    }
  }
  v24 = objc_msgSend_objectForKey_(self->_dictionary, v4, (uint64_t)v6, v5);

  return v24;
}

- (void)removeOrderedObjectForKey:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_msgSend_removeObject_(self->_mutableOrderedSet, v4, (uint64_t)v6, v5);
    objc_msgSend_removeObjectForKey_(self->_dictionary, v7, (uint64_t)v6, v8);
    orderedItems = self->_orderedItems;
    self->_orderedItems = 0;
  }
  else
  {
    v27[0] = xmmword_1E57243E0;
    v27[1] = *(_OWORD *)off_1E57243F0;
    uint64_t v28 = 61;
    v10 = NSString;
    uint64_t v11 = IMFileLocationTrimFileName(v27);
    uint64_t v12 = v28;
    v15 = objc_msgSend_stringWithFormat_(NSString, v13, (uint64_t)&stru_1EE231AD8, v14);
    uint64_t v18 = objc_msgSend_stringWithFormat_(v10, v16, @"Unexpected nil '%@' in %s at %s:%d. %@", v17, @"key", "-[IMOrderedMutableDictionary removeOrderedObjectForKey:]", v11, v12, v15);

    uint64_t v19 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v19) {
      v19(v18);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v20, v21, v22, v23, v24, v25, v26, (char)v18);
    }
  }
}

- (id)orderedObjects
{
  orderedItems = self->_orderedItems;
  if (!orderedItems)
  {
    id v6 = objc_msgSend_array(self->_mutableOrderedSet, a2, v2, v3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1918CF830;
    v12[3] = &unk_1E5724410;
    v12[4] = self;
    objc_msgSend___imArrayByApplyingBlock_(v6, v7, (uint64_t)v12, v8);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_orderedItems;
    self->_orderedItems = v9;

    orderedItems = self->_orderedItems;
  }
  return orderedItems;
}

- (BOOL)containsOrderedObject:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v30[0] = xmmword_1E5724430;
    v30[1] = *(_OWORD *)off_1E5724440;
    uint64_t v31 = 79;
    uint64_t v8 = NSString;
    uint64_t v9 = IMFileLocationTrimFileName(v30);
    uint64_t v10 = v31;
    uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v11, (uint64_t)&stru_1EE231AD8, v12);
    v16 = objc_msgSend_stringWithFormat_(v8, v14, @"Unexpected nil '%@' in %s at %s:%d. %@", v15, @"anObject", "-[IMOrderedMutableDictionary containsOrderedObject:]", v9, v10, v13);

    uint64_t v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17) {
      v17(v16);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v18, v19, v20, v21, v22, v23, v24, (char)v16);
    }
  }
  uint64_t v25 = objc_msgSend_allValues(self->_dictionary, v4, v5, v6);
  char v28 = objc_msgSend_containsObject_(v25, v26, (uint64_t)v7, v27);

  return v28;
}

- (BOOL)containsKey:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v26[0] = xmmword_1E5724458;
    v26[1] = *(_OWORD *)off_1E5724468;
    uint64_t v27 = 84;
    id v7 = NSString;
    uint64_t v8 = IMFileLocationTrimFileName(v26);
    uint64_t v9 = v27;
    uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, (uint64_t)&stru_1EE231AD8, v11);
    uint64_t v15 = objc_msgSend_stringWithFormat_(v7, v13, @"Unexpected nil '%@' in %s at %s:%d. %@", v14, @"key", "-[IMOrderedMutableDictionary containsKey:]", v8, v9, v12);

    v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16) {
      v16(v15);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v17, v18, v19, v20, v21, v22, v23, (char)v15);
    }
  }
  char v24 = objc_msgSend_containsObject_(self->_mutableOrderedSet, v4, (uint64_t)v6, v5);

  return v24;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = objc_msgSend_orderedObjects(self, a2, (uint64_t)a3, (uint64_t)a4);
  unint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)a3, (uint64_t)a4, a5);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedItems, 0);
  objc_storeStrong((id *)&self->_mutableOrderedSet, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end