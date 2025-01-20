@interface MTRUnitTestingClusterNestedStruct
- (MTRDataTypeTestGlobalStruct)d;
- (MTRUnitTestingClusterNestedStruct)init;
- (MTRUnitTestingClusterSimpleStruct)c;
- (NSNumber)a;
- (NSNumber)b;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setA:(NSNumber *)a;
- (void)setB:(NSNumber *)b;
- (void)setC:(MTRUnitTestingClusterSimpleStruct *)c;
- (void)setD:(id)a3;
@end

@implementation MTRUnitTestingClusterNestedStruct

- (MTRUnitTestingClusterNestedStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterNestedStruct;
  v2 = [(MTRUnitTestingClusterNestedStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    a = v2->_a;
    v2->_a = (NSNumber *)&unk_26F9C8620;

    b = v3->_b;
    v3->_b = (NSNumber *)&unk_26F9C8620;

    uint64_t v6 = objc_opt_new();
    c = v3->_c;
    v3->_c = (MTRUnitTestingClusterSimpleStruct *)v6;

    d = v3->_d;
    v3->_d = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterNestedStruct);
  v7 = objc_msgSend_a(self, v5, v6);
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_b(self, v9, v10);
  objc_msgSend_setB_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_c(self, v13, v14);
  objc_msgSend_setC_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_d(self, v17, v18);
  objc_msgSend_setD_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: a:%@; b:%@; c:%@; d:%@; >",
    v5,
    self->_a,
    self->_b,
    self->_c,
  v7 = self->_d);

  return v7;
}

- (NSNumber)a
{
  return self->_a;
}

- (void)setA:(NSNumber *)a
{
}

- (NSNumber)b
{
  return self->_b;
}

- (void)setB:(NSNumber *)b
{
}

- (MTRUnitTestingClusterSimpleStruct)c
{
  return self->_c;
}

- (void)setC:(MTRUnitTestingClusterSimpleStruct *)c
{
}

- (MTRDataTypeTestGlobalStruct)d
{
  return self->_d;
}

- (void)setD:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);

  objc_storeStrong((id *)&self->_a, 0);
}

@end