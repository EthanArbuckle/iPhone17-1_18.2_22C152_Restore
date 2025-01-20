@interface MTRUnitTestingClusterTestDifferentVendorMeiEventEvent
- (MTRUnitTestingClusterTestDifferentVendorMeiEventEvent)init;
- (NSNumber)arg1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(id)a3;
@end

@implementation MTRUnitTestingClusterTestDifferentVendorMeiEventEvent

- (MTRUnitTestingClusterTestDifferentVendorMeiEventEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRUnitTestingClusterTestDifferentVendorMeiEventEvent;
  v2 = [(MTRUnitTestingClusterTestDifferentVendorMeiEventEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    arg1 = v2->_arg1;
    v2->_arg1 = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestDifferentVendorMeiEventEvent);
  v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@ >", v5, self->_arg1);;

  return v7;
}

- (NSNumber)arg1
{
  return self->_arg1;
}

- (void)setArg1:(id)a3
{
}

- (void).cxx_destruct
{
}

@end