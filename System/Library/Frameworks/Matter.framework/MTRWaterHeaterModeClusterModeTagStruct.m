@interface MTRWaterHeaterModeClusterModeTagStruct
- (MTRWaterHeaterModeClusterModeTagStruct)init;
- (NSNumber)mfgCode;
- (NSNumber)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMfgCode:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTRWaterHeaterModeClusterModeTagStruct

- (MTRWaterHeaterModeClusterModeTagStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRWaterHeaterModeClusterModeTagStruct;
  v2 = [(MTRWaterHeaterModeClusterModeTagStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    mfgCode = v2->_mfgCode;
    v2->_mfgCode = 0;

    value = v3->_value;
    v3->_value = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWaterHeaterModeClusterModeTagStruct);
  objc_super v7 = objc_msgSend_mfgCode(self, v5, v6);
  objc_msgSend_setMfgCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_value(self, v9, v10);
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: mfgCode:%@; value:%@; >",
    v5,
    self->_mfgCode,
  objc_super v7 = self->_value);

  return v7;
}

- (NSNumber)mfgCode
{
  return self->_mfgCode;
}

- (void)setMfgCode:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_mfgCode, 0);
}

@end