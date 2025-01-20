@interface MTRUnitTestingClusterTestFabricScoped
- (MTRUnitTestingClusterSimpleStruct)fabricSensitiveStruct;
- (MTRUnitTestingClusterTestFabricScoped)init;
- (NSArray)fabricSensitiveInt8uList;
- (NSNumber)fabricIndex;
- (NSNumber)fabricSensitiveInt8u;
- (NSNumber)nullableFabricSensitiveInt8u;
- (NSNumber)nullableOptionalFabricSensitiveInt8u;
- (NSNumber)optionalFabricSensitiveInt8u;
- (NSString)fabricSensitiveCharString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setFabricSensitiveCharString:(NSString *)fabricSensitiveCharString;
- (void)setFabricSensitiveInt8u:(NSNumber *)fabricSensitiveInt8u;
- (void)setFabricSensitiveInt8uList:(NSArray *)fabricSensitiveInt8uList;
- (void)setFabricSensitiveStruct:(MTRUnitTestingClusterSimpleStruct *)fabricSensitiveStruct;
- (void)setNullableFabricSensitiveInt8u:(NSNumber *)nullableFabricSensitiveInt8u;
- (void)setNullableOptionalFabricSensitiveInt8u:(NSNumber *)nullableOptionalFabricSensitiveInt8u;
- (void)setOptionalFabricSensitiveInt8u:(NSNumber *)optionalFabricSensitiveInt8u;
@end

@implementation MTRUnitTestingClusterTestFabricScoped

- (MTRUnitTestingClusterTestFabricScoped)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRUnitTestingClusterTestFabricScoped;
  v2 = [(MTRUnitTestingClusterTestFabricScoped *)&v17 init];
  v3 = v2;
  if (v2)
  {
    fabricSensitiveInt8u = v2->_fabricSensitiveInt8u;
    v2->_fabricSensitiveInt8u = (NSNumber *)&unk_26F9C8620;

    optionalFabricSensitiveInt8u = v3->_optionalFabricSensitiveInt8u;
    v3->_optionalFabricSensitiveInt8u = 0;

    nullableFabricSensitiveInt8u = v3->_nullableFabricSensitiveInt8u;
    v3->_nullableFabricSensitiveInt8u = 0;

    nullableOptionalFabricSensitiveInt8u = v3->_nullableOptionalFabricSensitiveInt8u;
    v3->_nullableOptionalFabricSensitiveInt8u = 0;

    fabricSensitiveCharString = v3->_fabricSensitiveCharString;
    v3->_fabricSensitiveCharString = (NSString *)&stru_26F969DC8;

    uint64_t v9 = objc_opt_new();
    fabricSensitiveStruct = v3->_fabricSensitiveStruct;
    v3->_fabricSensitiveStruct = (MTRUnitTestingClusterSimpleStruct *)v9;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF8C0], v11, v12);
    fabricSensitiveInt8uList = v3->_fabricSensitiveInt8uList;
    v3->_fabricSensitiveInt8uList = (NSArray *)v13;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestFabricScoped);
  v7 = objc_msgSend_fabricSensitiveInt8u(self, v5, v6);
  objc_msgSend_setFabricSensitiveInt8u_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_optionalFabricSensitiveInt8u(self, v9, v10);
  objc_msgSend_setOptionalFabricSensitiveInt8u_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_nullableFabricSensitiveInt8u(self, v13, v14);
  objc_msgSend_setNullableFabricSensitiveInt8u_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_nullableOptionalFabricSensitiveInt8u(self, v17, v18);
  objc_msgSend_setNullableOptionalFabricSensitiveInt8u_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_fabricSensitiveCharString(self, v21, v22);
  objc_msgSend_setFabricSensitiveCharString_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_fabricSensitiveStruct(self, v25, v26);
  objc_msgSend_setFabricSensitiveStruct_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_fabricSensitiveInt8uList(self, v29, v30);
  objc_msgSend_setFabricSensitiveInt8uList_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_fabricIndex(self, v33, v34);
  objc_msgSend_setFabricIndex_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: fabricSensitiveInt8u:%@; optionalFabricSensitiveInt8u:%@; nullableFabricSensitiveInt8u:%@; nullableOptionalFabricSensitiveInt8u:%@; fabricSensitiveCharString:%@; fabricSensitiveStruct:%@; fabricSensitiveInt8uList:%@; fabricIndex:%@; >",
    v5,
    self->_fabricSensitiveInt8u,
    self->_optionalFabricSensitiveInt8u,
    self->_nullableFabricSensitiveInt8u,
    self->_nullableOptionalFabricSensitiveInt8u,
    self->_fabricSensitiveCharString,
    self->_fabricSensitiveStruct,
    self->_fabricSensitiveInt8uList,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)fabricSensitiveInt8u
{
  return self->_fabricSensitiveInt8u;
}

- (void)setFabricSensitiveInt8u:(NSNumber *)fabricSensitiveInt8u
{
}

- (NSNumber)optionalFabricSensitiveInt8u
{
  return self->_optionalFabricSensitiveInt8u;
}

- (void)setOptionalFabricSensitiveInt8u:(NSNumber *)optionalFabricSensitiveInt8u
{
}

- (NSNumber)nullableFabricSensitiveInt8u
{
  return self->_nullableFabricSensitiveInt8u;
}

- (void)setNullableFabricSensitiveInt8u:(NSNumber *)nullableFabricSensitiveInt8u
{
}

- (NSNumber)nullableOptionalFabricSensitiveInt8u
{
  return self->_nullableOptionalFabricSensitiveInt8u;
}

- (void)setNullableOptionalFabricSensitiveInt8u:(NSNumber *)nullableOptionalFabricSensitiveInt8u
{
}

- (NSString)fabricSensitiveCharString
{
  return self->_fabricSensitiveCharString;
}

- (void)setFabricSensitiveCharString:(NSString *)fabricSensitiveCharString
{
}

- (MTRUnitTestingClusterSimpleStruct)fabricSensitiveStruct
{
  return self->_fabricSensitiveStruct;
}

- (void)setFabricSensitiveStruct:(MTRUnitTestingClusterSimpleStruct *)fabricSensitiveStruct
{
}

- (NSArray)fabricSensitiveInt8uList
{
  return self->_fabricSensitiveInt8uList;
}

- (void)setFabricSensitiveInt8uList:(NSArray *)fabricSensitiveInt8uList
{
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
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveInt8uList, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveStruct, 0);
  objc_storeStrong((id *)&self->_fabricSensitiveCharString, 0);
  objc_storeStrong((id *)&self->_nullableOptionalFabricSensitiveInt8u, 0);
  objc_storeStrong((id *)&self->_nullableFabricSensitiveInt8u, 0);
  objc_storeStrong((id *)&self->_optionalFabricSensitiveInt8u, 0);

  objc_storeStrong((id *)&self->_fabricSensitiveInt8u, 0);
}

@end