@interface CLSBinaryReportItem
+ (BOOL)supportsSecureCoding;
- (BOOL)value;
- (CLSBinaryReportItem)initWithCoder:(id)a3;
- (id)convertToItemCompatibleWithItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (int64_t)valueType;
- (void)add:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(BOOL)a3;
- (void)setValueType:(int64_t)a3;
@end

@implementation CLSBinaryReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLSBinaryReportItem;
  id v4 = [(CLSActivityReportItem *)&v14 copyWithZone:a3];
  uint64_t v7 = objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v8, v7);
  uint64_t v11 = objc_msgSend_valueType(self, v9, v10);
  objc_msgSend_setValueType_(v4, v12, v11);
  return v4;
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    v8 = v5;
    double v9 = 0.0;
    if (self->_value) {
      double v9 = 1.0;
    }
    objc_msgSend_setQuantity_(v5, v6, v7, v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_opt_new();
      objc_msgSend_maxValue(v4, v10, v11);
      objc_msgSend_setMaxValue_(v8, v12, v13);
      if (self->_value) {
        double v16 = 1.0;
      }
      else {
        double v16 = 0.0;
      }
      objc_msgSend_maxValue(v8, v14, v15);
      objc_msgSend_setValue_(v8, v18, v19, v17 * v16);
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)CLSBinaryReportItem;
      v8 = [(CLSReportItem *)&v21 convertToItemCompatibleWithItem:v4];
    }
  }

  return v8;
}

- (CLSBinaryReportItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSBinaryReportItem;
  uint64_t v6 = [(CLSActivityReportItem *)&v9 initWithCoder:v4];
  if (v6)
  {
    v6->_value = objc_msgSend_decodeBoolForKey_(v4, v5, @"value");
    v6->_valueType = (int)objc_msgSend_decodeIntForKey_(v4, v7, @"valueType");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSBinaryReportItem;
  id v4 = a3;
  [(CLSActivityReportItem *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeBool_forKey_(v4, v5, self->_value, @"value", v7.receiver, v7.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v6, LODWORD(self->_valueType), @"valueType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  int value = self->_value;
  if (value == objc_msgSend_value(v4, v6, v7))
  {
    int64_t v10 = 0;
  }
  else if (self->_value || (objc_msgSend_value(v4, v8, v9) & 1) == 0)
  {
    int64_t v10 = 1;
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (void)add:(id)a3
{
  id v4 = objc_msgSend_convertToItemCompatibleWithItem_(a3, a2, (uint64_t)self);
  id v7 = v4;
  if (self->_value)
  {
    self->_int value = objc_msgSend_value(v4, v5, v6);
    id v4 = v7;
  }
  self->_valueType = objc_msgSend_valueType(v4, v5, v6);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_initWithFormat_(v3, v5, @"<%@ %p", v4, self);
  uint64_t v9 = objc_msgSend_title(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v10, @" title: %@", v9);

  uint64_t v13 = objc_msgSend_identifier(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v14, @" identifier: %@", v13);

  uint64_t v15 = NSNumber;
  uint64_t v18 = objc_msgSend_value(self, v16, v17);
  v20 = objc_msgSend_numberWithBool_(v15, v19, v18);
  objc_msgSend_appendFormat_(v6, v21, @" value: %@", v20);

  unint64_t v24 = objc_msgSend_valueType(self, v22, v23);
  v25 = NSStringFromBinaryValueType(v24);
  objc_msgSend_appendFormat_(v6, v26, @" valueType: %@", v25);

  objc_msgSend_appendString_(v6, v27, @">");

  return v6;
}

- (id)dictionaryRepresentation
{
  v17.receiver = self;
  v17.super_class = (Class)CLSBinaryReportItem;
  id v3 = [(CLSActivityReportItem *)&v17 dictionaryRepresentation];
  uint64_t v4 = NSNumber;
  uint64_t v7 = objc_msgSend_value(self, v5, v6);
  uint64_t v9 = objc_msgSend_numberWithBool_(v4, v8, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"value");

  unint64_t v13 = objc_msgSend_valueType(self, v11, v12);
  objc_super v14 = NSStringFromBinaryValueType(v13);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, @"valueType");

  return v3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_int value = a3;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(int64_t)a3
{
  self->_valueType = a3;
}

@end