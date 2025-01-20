@interface MTRUnitTestingClusterTestFabricScopedEventEvent
- (MTRUnitTestingClusterTestFabricScopedEventEvent)init;
- (NSNumber)fabricIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
@end

@implementation MTRUnitTestingClusterTestFabricScopedEventEvent

- (MTRUnitTestingClusterTestFabricScopedEventEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRUnitTestingClusterTestFabricScopedEventEvent;
  v2 = [(MTRUnitTestingClusterTestFabricScopedEventEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    fabricIndex = v2->_fabricIndex;
    v2->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestFabricScopedEventEvent);
  v7 = objc_msgSend_fabricIndex(self, v5, v6);
  objc_msgSend_setFabricIndex_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: fabricIndex:%@ >", v5, self->_fabricIndex);;

  return v7;
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (void).cxx_destruct
{
}

@end