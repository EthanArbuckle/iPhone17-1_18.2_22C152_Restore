@interface MTRDataTypeAtomicAttributeStatusStruct
- (MTRDataTypeAtomicAttributeStatusStruct)init;
- (NSNumber)attributeID;
- (NSNumber)statusCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeID:(id)a3;
- (void)setStatusCode:(id)a3;
@end

@implementation MTRDataTypeAtomicAttributeStatusStruct

- (MTRDataTypeAtomicAttributeStatusStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRDataTypeAtomicAttributeStatusStruct;
  v2 = [(MTRDataTypeAtomicAttributeStatusStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    attributeID = v2->_attributeID;
    v2->_attributeID = (NSNumber *)&unk_26F9C8620;

    statusCode = v3->_statusCode;
    v3->_statusCode = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDataTypeAtomicAttributeStatusStruct);
  objc_super v7 = objc_msgSend_attributeID(self, v5, v6);
  objc_msgSend_setAttributeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_statusCode(self, v9, v10);
  objc_msgSend_setStatusCode_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: attributeID:%@; statusCode:%@; >",
    v5,
    self->_attributeID,
  objc_super v7 = self->_statusCode);

  return v7;
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (void)setAttributeID:(id)a3
{
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);

  objc_storeStrong((id *)&self->_attributeID, 0);
}

@end