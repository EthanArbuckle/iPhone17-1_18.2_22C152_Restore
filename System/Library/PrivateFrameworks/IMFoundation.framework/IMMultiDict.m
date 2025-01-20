@interface IMMultiDict
- (IMMultiDict)init;
- (NSArray)allKeys;
- (NSMutableDictionary)dictionary;
- (id)dequeueObjectForKey:(id)a3;
- (id)description;
- (id)headObjectForKey:(id)a3;
- (id)objectsForKey:(id)a3;
- (id)peekObjectForKey:(id)a3;
- (id)popObjectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countForKey:(id)a3;
- (void)enqueueObject:(id)a3 forKey:(id)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)pushObject:(id)a3 forKey:(id)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3 forKey:(id)a4;
- (void)removeObjectsForKey:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDictionary:(id)a3;
@end

@implementation IMMultiDict

- (IMMultiDict)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMMultiDict;
  v2 = [(IMMultiDict *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;
  }
  return v2;
}

- (id)description
{
  v4 = objc_msgSend_dictionary(self, a2, v2, v3);
  v8 = objc_msgSend_description(v4, v5, v6, v7);

  return v8;
}

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  ++self->_count;
  v10 = objc_msgSend_dictionary(self, v7, v8, v9);
  v16 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v6, v12);
  if (!v16)
  {
    v16 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15);
    objc_msgSend_setObject_forKey_(v10, v17, (uint64_t)v16, (uint64_t)v6);
  }
  objc_msgSend_addObject_(v16, v13, (uint64_t)v18, v15);
}

- (id)peekObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  uint64_t v15 = objc_msgSend_lastObject(v11, v12, v13, v14);

  return v15;
}

- (id)popObjectForKey:(id)a3
{
  unint64_t count = self->_count;
  if (count) {
    self->_unint64_t count = count - 1;
  }
  id v5 = a3;
  uint64_t v9 = objc_msgSend_dictionary(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v5, v11);

  v19 = objc_msgSend_lastObject(v12, v13, v14, v15);
  if (v19) {
    objc_msgSend_removeLastObject(v12, v16, v17, v18);
  }

  return v19;
}

- (void)enqueueObject:(id)a3 forKey:(id)a4
{
}

- (id)headObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  if (objc_msgSend_count(v11, v12, v13, v14))
  {
    uint64_t v17 = objc_msgSend_objectAtIndex_(v11, v15, 0, v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)dequeueObjectForKey:(id)a3
{
  --self->_count;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  if (objc_msgSend_count(v11, v12, v13, v14))
  {
    uint64_t v17 = objc_msgSend_objectAtIndex_(v11, v15, 0, v16);
    objc_msgSend_removeObjectAtIndex_(v11, v18, 0, v19);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)objectsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)removeObjectsForKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKey_(v16, v8, (uint64_t)v4, v9);
  self->_count -= objc_msgSend_count(v10, v11, v12, v13);

  objc_msgSend_removeObjectForKey_(v16, v14, (uint64_t)v4, v15);
}

- (void)removeAllObjects
{
  self->_unint64_t count = 0;
  objc_msgSend_dictionary(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v4, v5, v6);
}

- (void)removeObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_dictionary(self, v8, v9, v10);
  objc_msgSend_objectForKey_(v11, v12, (uint64_t)v6, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v16, v14, (uint64_t)v7, v15);
}

- (unint64_t)countForKey:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  unint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);
  return v15;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_dictionary(self, v5, v6, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1918E00D8;
  v12[3] = &unk_1E5724830;
  id v13 = v4;
  id v9 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v10, (uint64_t)v12, v11);
}

- (NSArray)allKeys
{
  uint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  id v9 = objc_msgSend_dictionary(self, v6, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1918E02C0;
  v14[3] = &unk_1E5724858;
  id v10 = v5;
  id v15 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v14, v12);

  return (NSArray *)v10;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end