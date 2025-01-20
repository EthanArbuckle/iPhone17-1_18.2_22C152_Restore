@interface GDPersonEntityTagDirectFeedbackSet
- (GDPersonEntityTagDirectFeedbackSet)initWithFeedbackInference:(id)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)addFeedbackInference:(id)a3;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation GDPersonEntityTagDirectFeedbackSet

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

- (void)addFeedbackInference:(id)a3
{
  objc_msgSend_addObject_(self->_internalSet, a2, (uint64_t)a3, v3, v4);
}

- (GDPersonEntityTagDirectFeedbackSet)initWithFeedbackInference:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDPersonEntityTagDirectFeedbackSet;
  v5 = [(GDPersonEntityTagDirectFeedbackSet *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = objc_msgSend_initWithObjects_(v6, v7, (uint64_t)v4, v8, v9, 0);
    internalSet = v5->_internalSet;
    v5->_internalSet = (NSMutableSet *)v10;
  }
  return v5;
}

@end