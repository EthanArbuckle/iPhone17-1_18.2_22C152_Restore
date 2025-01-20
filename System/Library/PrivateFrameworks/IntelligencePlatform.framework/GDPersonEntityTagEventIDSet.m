@interface GDPersonEntityTagEventIDSet
- (GDPersonEntityTagEventIDSet)initWithEventId:(int64_t)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)addEventId:(int64_t)a3;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation GDPersonEntityTagEventIDSet

- (void).cxx_destruct
{
}

- (id)objectEnumerator
{
  return (id)((uint64_t (*)(NSMutableSet *, char *))MEMORY[0x1F4181798])(self->_internalSet, sel_objectEnumerator);
}

- (id)member:(id)a3
{
  return (id)((uint64_t (*)(NSMutableSet *, char *, id))MEMORY[0x1F4181798])(self->_internalSet, sel_member_, a3);
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_internalSet, a2, v2, v3, v4);
}

- (void)removeObject:(id)a3
{
}

- (void)addObject:(id)a3
{
  objc_msgSend_addObject_(self->_internalSet, a2, (uint64_t)a3, v3, v4);
}

- (void)addEventId:(int64_t)a3
{
  internalSet = self->_internalSet;
  objc_msgSend_numberWithLongLong_(NSNumber, a2, a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(internalSet, v6, (uint64_t)v9, v7, v8);
}

- (GDPersonEntityTagEventIDSet)initWithEventId:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GDPersonEntityTagEventIDSet;
  uint64_t v4 = [(GDPersonEntityTagEventIDSet *)&v16 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v9 = objc_msgSend_numberWithLongLong_(NSNumber, v6, a3, v7, v8);
    uint64_t v13 = objc_msgSend_initWithObjects_(v5, v10, (uint64_t)v9, v11, v12, 0);
    internalSet = v4->_internalSet;
    v4->_internalSet = (NSMutableSet *)v13;
  }
  return v4;
}

@end