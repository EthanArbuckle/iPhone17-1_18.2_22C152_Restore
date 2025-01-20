@interface MTRDataTypeTestGlobalStruct
- (MTRDataTypeTestGlobalStruct)init;
- (NSNumber)myBitmap;
- (NSNumber)myEnum;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMyBitmap:(id)a3;
- (void)setMyEnum:(id)a3;
- (void)setName:(id)a3;
@end

@implementation MTRDataTypeTestGlobalStruct

- (MTRDataTypeTestGlobalStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDataTypeTestGlobalStruct;
  v2 = [(MTRDataTypeTestGlobalStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26F969DC8;

    myBitmap = v3->_myBitmap;
    v3->_myBitmap = 0;

    myEnum = v3->_myEnum;
    v3->_myEnum = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDataTypeTestGlobalStruct);
  v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_myBitmap(self, v9, v10);
  objc_msgSend_setMyBitmap_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_myEnum(self, v13, v14);
  objc_msgSend_setMyEnum_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: name:%@; myBitmap:%@; myEnum:%@; >",
    v5,
    self->_name,
    self->_myBitmap,
  v7 = self->_myEnum);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)myBitmap
{
  return self->_myBitmap;
}

- (void)setMyBitmap:(id)a3
{
}

- (NSNumber)myEnum
{
  return self->_myEnum;
}

- (void)setMyEnum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myEnum, 0);
  objc_storeStrong((id *)&self->_myBitmap, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end