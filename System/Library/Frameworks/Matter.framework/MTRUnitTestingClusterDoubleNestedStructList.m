@interface MTRUnitTestingClusterDoubleNestedStructList
- (MTRUnitTestingClusterDoubleNestedStructList)init;
- (NSArray)a;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setA:(NSArray *)a;
@end

@implementation MTRUnitTestingClusterDoubleNestedStructList

- (MTRUnitTestingClusterDoubleNestedStructList)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterDoubleNestedStructList;
  v4 = [(MTRUnitTestingClusterDoubleNestedStructList *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    a = v4->_a;
    v4->_a = (NSArray *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterDoubleNestedStructList);
  v7 = objc_msgSend_a(self, v5, v6);
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: a:%@ >", v5, self->_a);;

  return v7;
}

- (NSArray)a
{
  return self->_a;
}

- (void)setA:(NSArray *)a
{
}

- (void).cxx_destruct
{
}

@end