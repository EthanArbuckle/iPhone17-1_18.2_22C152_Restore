@interface MTRUnitTestingClusterNullablesAndOptionalsStruct
- (MTRUnitTestingClusterNullablesAndOptionalsStruct)init;
- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStruct;
- (MTRUnitTestingClusterSimpleStruct)nullableStruct;
- (MTRUnitTestingClusterSimpleStruct)optionalStruct;
- (NSArray)nullableList;
- (NSArray)nullableOptionalList;
- (NSArray)optionalList;
- (NSNumber)nullableInt;
- (NSNumber)nullableOptionalInt;
- (NSNumber)optionalInt;
- (NSString)nullableOptionalString;
- (NSString)nullableString;
- (NSString)optionalString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNullableInt:(NSNumber *)nullableInt;
- (void)setNullableList:(NSArray *)nullableList;
- (void)setNullableOptionalInt:(NSNumber *)nullableOptionalInt;
- (void)setNullableOptionalList:(NSArray *)nullableOptionalList;
- (void)setNullableOptionalString:(NSString *)nullableOptionalString;
- (void)setNullableOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStruct;
- (void)setNullableString:(NSString *)nullableString;
- (void)setNullableStruct:(MTRUnitTestingClusterSimpleStruct *)nullableStruct;
- (void)setOptionalInt:(NSNumber *)optionalInt;
- (void)setOptionalList:(NSArray *)optionalList;
- (void)setOptionalString:(NSString *)optionalString;
- (void)setOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)optionalStruct;
@end

@implementation MTRUnitTestingClusterNullablesAndOptionalsStruct

- (MTRUnitTestingClusterNullablesAndOptionalsStruct)init
{
  v17.receiver = self;
  v17.super_class = (Class)MTRUnitTestingClusterNullablesAndOptionalsStruct;
  v2 = [(MTRUnitTestingClusterNullablesAndOptionalsStruct *)&v17 init];
  v3 = v2;
  if (v2)
  {
    nullableInt = v2->_nullableInt;
    v2->_nullableInt = 0;

    optionalInt = v3->_optionalInt;
    v3->_optionalInt = 0;

    nullableOptionalInt = v3->_nullableOptionalInt;
    v3->_nullableOptionalInt = 0;

    nullableString = v3->_nullableString;
    v3->_nullableString = 0;

    optionalString = v3->_optionalString;
    v3->_optionalString = 0;

    nullableOptionalString = v3->_nullableOptionalString;
    v3->_nullableOptionalString = 0;

    nullableStruct = v3->_nullableStruct;
    v3->_nullableStruct = 0;

    optionalStruct = v3->_optionalStruct;
    v3->_optionalStruct = 0;

    nullableOptionalStruct = v3->_nullableOptionalStruct;
    v3->_nullableOptionalStruct = 0;

    nullableList = v3->_nullableList;
    v3->_nullableList = 0;

    optionalList = v3->_optionalList;
    v3->_optionalList = 0;

    nullableOptionalList = v3->_nullableOptionalList;
    v3->_nullableOptionalList = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterNullablesAndOptionalsStruct);
  v7 = objc_msgSend_nullableInt(self, v5, v6);
  objc_msgSend_setNullableInt_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_optionalInt(self, v9, v10);
  objc_msgSend_setOptionalInt_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_nullableOptionalInt(self, v13, v14);
  objc_msgSend_setNullableOptionalInt_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_nullableString(self, v17, v18);
  objc_msgSend_setNullableString_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_optionalString(self, v21, v22);
  objc_msgSend_setOptionalString_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_nullableOptionalString(self, v25, v26);
  objc_msgSend_setNullableOptionalString_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_nullableStruct(self, v29, v30);
  objc_msgSend_setNullableStruct_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_optionalStruct(self, v33, v34);
  objc_msgSend_setOptionalStruct_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_nullableOptionalStruct(self, v37, v38);
  objc_msgSend_setNullableOptionalStruct_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_nullableList(self, v41, v42);
  objc_msgSend_setNullableList_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_optionalList(self, v45, v46);
  objc_msgSend_setOptionalList_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_nullableOptionalList(self, v49, v50);
  objc_msgSend_setNullableOptionalList_(v4, v52, (uint64_t)v51);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: nullableInt:%@; optionalInt:%@; nullableOptionalInt:%@; nullableString:%@; optionalString:%@; nullableOptionalString:%@; nullableStruct:%@; optionalStruct:%@; nullableOptionalStruct:%@; nullableList:%@; optionalList:%@; nullableOptionalList:%@; >",
    v5,
    self->_nullableInt,
    self->_optionalInt,
    self->_nullableOptionalInt,
    self->_nullableString,
    self->_optionalString,
    self->_nullableOptionalString,
    self->_nullableStruct,
    self->_optionalStruct,
    self->_nullableOptionalStruct,
    self->_nullableList,
    self->_optionalList,
  v7 = self->_nullableOptionalList);

  return v7;
}

- (NSNumber)nullableInt
{
  return self->_nullableInt;
}

- (void)setNullableInt:(NSNumber *)nullableInt
{
}

- (NSNumber)optionalInt
{
  return self->_optionalInt;
}

- (void)setOptionalInt:(NSNumber *)optionalInt
{
}

- (NSNumber)nullableOptionalInt
{
  return self->_nullableOptionalInt;
}

- (void)setNullableOptionalInt:(NSNumber *)nullableOptionalInt
{
}

- (NSString)nullableString
{
  return self->_nullableString;
}

- (void)setNullableString:(NSString *)nullableString
{
}

- (NSString)optionalString
{
  return self->_optionalString;
}

- (void)setOptionalString:(NSString *)optionalString
{
}

- (NSString)nullableOptionalString
{
  return self->_nullableOptionalString;
}

- (void)setNullableOptionalString:(NSString *)nullableOptionalString
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableStruct
{
  return self->_nullableStruct;
}

- (void)setNullableStruct:(MTRUnitTestingClusterSimpleStruct *)nullableStruct
{
}

- (MTRUnitTestingClusterSimpleStruct)optionalStruct
{
  return self->_optionalStruct;
}

- (void)setOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)optionalStruct
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStruct
{
  return self->_nullableOptionalStruct;
}

- (void)setNullableOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStruct
{
}

- (NSArray)nullableList
{
  return self->_nullableList;
}

- (void)setNullableList:(NSArray *)nullableList
{
}

- (NSArray)optionalList
{
  return self->_optionalList;
}

- (void)setOptionalList:(NSArray *)optionalList
{
}

- (NSArray)nullableOptionalList
{
  return self->_nullableOptionalList;
}

- (void)setNullableOptionalList:(NSArray *)nullableOptionalList
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nullableOptionalList, 0);
  objc_storeStrong((id *)&self->_optionalList, 0);
  objc_storeStrong((id *)&self->_nullableList, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStruct, 0);
  objc_storeStrong((id *)&self->_optionalStruct, 0);
  objc_storeStrong((id *)&self->_nullableStruct, 0);
  objc_storeStrong((id *)&self->_nullableOptionalString, 0);
  objc_storeStrong((id *)&self->_optionalString, 0);
  objc_storeStrong((id *)&self->_nullableString, 0);
  objc_storeStrong((id *)&self->_nullableOptionalInt, 0);
  objc_storeStrong((id *)&self->_optionalInt, 0);

  objc_storeStrong((id *)&self->_nullableInt, 0);
}

@end