@interface MDLObjectContainer
- (MDLObjectContainer)init;
- (NSArray)objects;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation MDLObjectContainer

- (MDLObjectContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLObjectContainer;
  v2 = [(MDLObjectContainer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    objects = v2->_objects;
    v2->_objects = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addObject:(id)a3
{
}

- (void)removeObject:(id)a3
{
}

- (NSArray)objects
{
  return (NSArray *)self->_objects;
}

- (unint64_t)count
{
  return objc_msgSend_count(self->_objects, a2, v2);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return objc_msgSend_countByEnumeratingWithState_objects_count_(self->_objects, a2, (uint64_t)a3, a4, a5);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_objects, a2, a3);
}

- (void).cxx_destruct
{
}

@end