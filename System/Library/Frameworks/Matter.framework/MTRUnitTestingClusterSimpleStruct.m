@interface MTRUnitTestingClusterSimpleStruct
- (MTRUnitTestingClusterSimpleStruct)init;
- (NSData)d;
- (NSNumber)a;
- (NSNumber)b;
- (NSNumber)c;
- (NSNumber)f;
- (NSNumber)g;
- (NSNumber)h;
- (NSNumber)i;
- (NSString)e;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setA:(NSNumber *)a;
- (void)setB:(NSNumber *)b;
- (void)setC:(NSNumber *)c;
- (void)setD:(NSData *)d;
- (void)setE:(NSString *)e;
- (void)setF:(NSNumber *)f;
- (void)setG:(NSNumber *)g;
- (void)setH:(NSNumber *)h;
- (void)setI:(id)a3;
@end

@implementation MTRUnitTestingClusterSimpleStruct

- (MTRUnitTestingClusterSimpleStruct)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRUnitTestingClusterSimpleStruct;
  v2 = [(MTRUnitTestingClusterSimpleStruct *)&v17 init];
  v3 = v2;
  if (v2)
  {
    a = v2->_a;
    v2->_a = (NSNumber *)&unk_26F9C8620;

    b = v3->_b;
    v3->_b = (NSNumber *)&unk_26F9C8620;

    c = v3->_c;
    v3->_c = (NSNumber *)&unk_26F9C8620;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    d = v3->_d;
    v3->_d = (NSData *)v9;

    e = v3->_e;
    v3->_e = (NSString *)&stru_26F969DC8;

    f = v3->_f;
    v3->_f = (NSNumber *)&unk_26F9C8620;

    g = v3->_g;
    v3->_g = (NSNumber *)&unk_26F9C8620;

    h = v3->_h;
    v3->_h = (NSNumber *)&unk_26F9C8620;

    i = v3->_i;
    v3->_i = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterSimpleStruct);
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

  v35 = objc_msgSend_h(self, v33, v34);
  objc_msgSend_setH_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_i(self, v37, v38);
  objc_msgSend_setI_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  a = self->_a;
  b = self->_b;
  c = self->_c;
  uint64_t v10 = objc_msgSend_base64EncodedStringWithOptions_(self->_d, v9, 0);
  objc_msgSend_stringWithFormat_(v3, v11, @"<%@: a:%@; b:%@; c:%@; d:%@; e:%@; f:%@; g:%@; h:%@; i:%@; >",
    v5,
    a,
    b,
    c,
    v10,
    self->_e,
    self->_f,
    self->_g,
    self->_h,
  v12 = self->_i);

  return v12;
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

- (NSNumber)c
{
  return self->_c;
}

- (void)setC:(NSNumber *)c
{
}

- (NSData)d
{
  return self->_d;
}

- (void)setD:(NSData *)d
{
}

- (NSString)e
{
  return self->_e;
}

- (void)setE:(NSString *)e
{
}

- (NSNumber)f
{
  return self->_f;
}

- (void)setF:(NSNumber *)f
{
}

- (NSNumber)g
{
  return self->_g;
}

- (void)setG:(NSNumber *)g
{
}

- (NSNumber)h
{
  return self->_h;
}

- (void)setH:(NSNumber *)h
{
}

- (NSNumber)i
{
  return self->_i;
}

- (void)setI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_i, 0);
  objc_storeStrong((id *)&self->_h, 0);
  objc_storeStrong((id *)&self->_g, 0);
  objc_storeStrong((id *)&self->_f, 0);
  objc_storeStrong((id *)&self->_e, 0);
  objc_storeStrong((id *)&self->_d, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_b, 0);

  objc_storeStrong((id *)&self->_a, 0);
}

@end