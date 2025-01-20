@interface MTRUnitTestingClusterNestedStructList
- (MTRUnitTestingClusterNestedStructList)init;
- (MTRUnitTestingClusterSimpleStruct)c;
- (NSArray)d;
- (NSArray)e;
- (NSArray)f;
- (NSArray)g;
- (NSNumber)a;
- (NSNumber)b;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setA:(NSNumber *)a;
- (void)setB:(NSNumber *)b;
- (void)setC:(MTRUnitTestingClusterSimpleStruct *)c;
- (void)setD:(NSArray *)d;
- (void)setE:(NSArray *)e;
- (void)setF:(NSArray *)f;
- (void)setG:(NSArray *)g;
@end

@implementation MTRUnitTestingClusterNestedStructList

- (MTRUnitTestingClusterNestedStructList)init
{
  v25.receiver = self;
  v25.super_class = (Class)MTRUnitTestingClusterNestedStructList;
  v2 = [(MTRUnitTestingClusterNestedStructList *)&v25 init];
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

    uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v8, v9);
    d = v3->_d;
    v3->_d = (NSArray *)v10;

    uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF8C0], v12, v13);
    e = v3->_e;
    v3->_e = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_array(MEMORY[0x263EFF8C0], v16, v17);
    f = v3->_f;
    v3->_f = (NSArray *)v18;

    uint64_t v22 = objc_msgSend_array(MEMORY[0x263EFF8C0], v20, v21);
    g = v3->_g;
    v3->_g = (NSArray *)v22;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterNestedStructList);
  v7 = objc_msgSend_a(self, v5, v6);
  objc_msgSend_setA_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_b(self, v9, v10);
  objc_msgSend_setB_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_c(self, v13, v14);
  objc_msgSend_setC_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_d(self, v17, v18);
  objc_msgSend_setD_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_e(self, v21, v22);
  objc_msgSend_setE_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_f(self, v25, v26);
  objc_msgSend_setF_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_g(self, v29, v30);
  objc_msgSend_setG_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: a:%@; b:%@; c:%@; d:%@; e:%@; f:%@; g:%@; >",
    v5,
    self->_a,
    self->_b,
    self->_c,
    self->_d,
    self->_e,
    self->_f,
  v7 = self->_g);

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

- (NSArray)d
{
  return self->_d;
}

- (void)setD:(NSArray *)d
{
}

- (NSArray)e
{
  return self->_e;
}

- (void)setE:(NSArray *)e
{
}

- (NSArray)f
{
  return self->_f;
}

- (void)setF:(NSArray *)f
{
}

- (NSArray)g
{
  return self->_g;
}

- (void)setG:(NSArray *)g
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_g, 0);
  objc_storeStrong((id *)&self->_f, 0);
  objc_storeStrong((id *)&self->_e, 0);
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);

  objc_storeStrong((id *)&self->_a, 0);
}

@end