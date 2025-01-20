@interface MTRScenesManagementClusterAttributeValuePairStruct
- (MTRScenesManagementClusterAttributeValuePairStruct)init;
- (NSNumber)attributeID;
- (NSNumber)valueSigned16;
- (NSNumber)valueSigned32;
- (NSNumber)valueSigned64;
- (NSNumber)valueSigned8;
- (NSNumber)valueUnsigned16;
- (NSNumber)valueUnsigned32;
- (NSNumber)valueUnsigned64;
- (NSNumber)valueUnsigned8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeID:(id)a3;
- (void)setValueSigned16:(id)a3;
- (void)setValueSigned32:(id)a3;
- (void)setValueSigned64:(id)a3;
- (void)setValueSigned8:(id)a3;
- (void)setValueUnsigned16:(id)a3;
- (void)setValueUnsigned32:(id)a3;
- (void)setValueUnsigned64:(id)a3;
- (void)setValueUnsigned8:(id)a3;
@end

@implementation MTRScenesManagementClusterAttributeValuePairStruct

- (MTRScenesManagementClusterAttributeValuePairStruct)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRScenesManagementClusterAttributeValuePairStruct;
  v2 = [(MTRScenesManagementClusterAttributeValuePairStruct *)&v14 init];
  v3 = v2;
  if (v2)
  {
    attributeID = v2->_attributeID;
    v2->_attributeID = (NSNumber *)&unk_26F9C8620;

    valueUnsigned8 = v3->_valueUnsigned8;
    v3->_valueUnsigned8 = 0;

    valueSigned8 = v3->_valueSigned8;
    v3->_valueSigned8 = 0;

    valueUnsigned16 = v3->_valueUnsigned16;
    v3->_valueUnsigned16 = 0;

    valueSigned16 = v3->_valueSigned16;
    v3->_valueSigned16 = 0;

    valueUnsigned32 = v3->_valueUnsigned32;
    v3->_valueUnsigned32 = 0;

    valueSigned32 = v3->_valueSigned32;
    v3->_valueSigned32 = 0;

    valueUnsigned64 = v3->_valueUnsigned64;
    v3->_valueUnsigned64 = 0;

    valueSigned64 = v3->_valueSigned64;
    v3->_valueSigned64 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterAttributeValuePairStruct);
  v7 = objc_msgSend_attributeID(self, v5, v6);
  objc_msgSend_setAttributeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_valueUnsigned8(self, v9, v10);
  objc_msgSend_setValueUnsigned8_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_valueSigned8(self, v13, v14);
  objc_msgSend_setValueSigned8_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_valueUnsigned16(self, v17, v18);
  objc_msgSend_setValueUnsigned16_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_valueSigned16(self, v21, v22);
  objc_msgSend_setValueSigned16_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_valueUnsigned32(self, v25, v26);
  objc_msgSend_setValueUnsigned32_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_valueSigned32(self, v29, v30);
  objc_msgSend_setValueSigned32_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_valueUnsigned64(self, v33, v34);
  objc_msgSend_setValueUnsigned64_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_valueSigned64(self, v37, v38);
  objc_msgSend_setValueSigned64_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: attributeID:%@; valueUnsigned8:%@; valueSigned8:%@; valueUnsigned16:%@; valueSigned16:%@; valueUnsigned32:%@; valueSigned32:%@; valueUnsigned64:%@; valueSigned64:%@; >",
    v5,
    self->_attributeID,
    self->_valueUnsigned8,
    self->_valueSigned8,
    self->_valueUnsigned16,
    self->_valueSigned16,
    self->_valueUnsigned32,
    self->_valueSigned32,
    self->_valueUnsigned64,
  v7 = self->_valueSigned64);

  return v7;
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (void)setAttributeID:(id)a3
{
}

- (NSNumber)valueUnsigned8
{
  return self->_valueUnsigned8;
}

- (void)setValueUnsigned8:(id)a3
{
}

- (NSNumber)valueSigned8
{
  return self->_valueSigned8;
}

- (void)setValueSigned8:(id)a3
{
}

- (NSNumber)valueUnsigned16
{
  return self->_valueUnsigned16;
}

- (void)setValueUnsigned16:(id)a3
{
}

- (NSNumber)valueSigned16
{
  return self->_valueSigned16;
}

- (void)setValueSigned16:(id)a3
{
}

- (NSNumber)valueUnsigned32
{
  return self->_valueUnsigned32;
}

- (void)setValueUnsigned32:(id)a3
{
}

- (NSNumber)valueSigned32
{
  return self->_valueSigned32;
}

- (void)setValueSigned32:(id)a3
{
}

- (NSNumber)valueUnsigned64
{
  return self->_valueUnsigned64;
}

- (void)setValueUnsigned64:(id)a3
{
}

- (NSNumber)valueSigned64
{
  return self->_valueSigned64;
}

- (void)setValueSigned64:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSigned64, 0);
  objc_storeStrong((id *)&self->_valueUnsigned64, 0);
  objc_storeStrong((id *)&self->_valueSigned32, 0);
  objc_storeStrong((id *)&self->_valueUnsigned32, 0);
  objc_storeStrong((id *)&self->_valueSigned16, 0);
  objc_storeStrong((id *)&self->_valueUnsigned16, 0);
  objc_storeStrong((id *)&self->_valueSigned8, 0);
  objc_storeStrong((id *)&self->_valueUnsigned8, 0);

  objc_storeStrong((id *)&self->_attributeID, 0);
}

@end