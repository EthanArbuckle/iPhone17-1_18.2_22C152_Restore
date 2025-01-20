@interface CLSScoreReportItem
+ (BOOL)supportsSecureCoding;
- (CLSScoreReportItem)initWithCoder:(id)a3;
- (double)maxValue;
- (double)normalized;
- (double)value;
- (id)convertToItemCompatibleWithItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (void)add:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)scalarMultiply:(double)a3;
- (void)setMaxValue:(double)a3;
- (void)setValue:(double)a3;
@end

@implementation CLSScoreReportItem

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CLSScoreReportItem;
  id v4 = [(CLSActivityReportItem *)&v14 copyWithZone:a3];
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v7, v8);
  objc_msgSend_maxValue(self, v9, v10);
  objc_msgSend_setMaxValue_(v4, v11, v12);
  return v4;
}

- (id)convertToItemCompatibleWithItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_opt_new();
    v7 = v5;
    double value = self->_value;
    if (value > 2.22044605e-16) {
      objc_msgSend_setValue_(v5, v6, 1);
    }
    else {
      objc_msgSend_setValue_(v5, v6, value < 0.0);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = objc_opt_new();
      objc_msgSend_setQuantity_(v7, v9, v10, self->_value);
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)CLSScoreReportItem;
      v7 = [(CLSReportItem *)&v12 convertToItemCompatibleWithItem:v4];
    }
  }

  return v7;
}

- (CLSScoreReportItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSScoreReportItem;
  uint64_t v6 = [(CLSActivityReportItem *)&v11 initWithCoder:v4];
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"value");
    v6->_double value = v7;
    objc_msgSend_decodeDoubleForKey_(v4, v8, @"maxValue");
    v6->_maxValue = v9;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSScoreReportItem;
  id v4 = a3;
  [(CLSActivityReportItem *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeDouble_forKey_(v4, v5, @"value", self->_value, v7.receiver, v7.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v6, @"maxValue", self->_maxValue);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)normalized
{
  double maxValue = self->_maxValue;
  if (maxValue < 1.0) {
    double maxValue = 1.0;
  }
  return self->_value / maxValue;
}

- (int64_t)compare:(id)a3
{
  id v4 = objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  objc_super v7 = v4;
  double maxValue = self->_maxValue;
  if (maxValue == 0.0)
  {
    objc_msgSend_maxValue(v4, v5, v6);
    if (v9 == 0.0)
    {
      int64_t v10 = 0;
      goto LABEL_12;
    }
    double maxValue = self->_maxValue;
  }
  if (maxValue == 0.0)
  {
    int64_t v10 = -1;
  }
  else
  {
    objc_msgSend_maxValue(v7, v5, v6);
    if (v13 == 0.0)
    {
      int64_t v10 = 1;
    }
    else
    {
      objc_msgSend_normalized(self, v11, v12);
      double v15 = v14;
      objc_msgSend_normalized(v7, v16, v17);
      if (v15 < v18) {
        int64_t v10 = -1;
      }
      else {
        int64_t v10 = v15 > v18;
      }
    }
  }
LABEL_12:

  return v10;
}

- (void)add:(id)a3
{
  objc_msgSend_convertToItemCompatibleWithItem_(a3, a2, (uint64_t)self);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double value = self->_value;
  objc_msgSend_value(v12, v5, v6);
  self->_double value = value + v7;
  double maxValue = self->_maxValue;
  objc_msgSend_maxValue(v12, v9, v10);
  self->_double maxValue = maxValue + v11;
}

- (void)scalarMultiply:(double)a3
{
  self->_double value = self->_value * a3;
  self->_double maxValue = self->_maxValue * a3;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_initWithFormat_(v3, v5, @"<%@ %p", v4, self);
  double v9 = objc_msgSend_title(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v10, @" title: %@", v9);

  double v13 = objc_msgSend_identifier(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v14, @" identifier: %@", v13);

  objc_msgSend_value(self, v15, v16);
  objc_msgSend_appendFormat_(v6, v17, @" value: %.3f", v18);
  objc_msgSend_maxValue(self, v19, v20);
  objc_msgSend_appendFormat_(v6, v21, @" maxValue: %.3f", v22);
  objc_msgSend_appendString_(v6, v23, @">");

  return v6;
}

- (id)dictionaryRepresentation
{
  v19.receiver = self;
  v19.super_class = (Class)CLSScoreReportItem;
  id v3 = [(CLSActivityReportItem *)&v19 dictionaryRepresentation];
  uint64_t v4 = NSNumber;
  objc_msgSend_value(self, v5, v6);
  double v9 = objc_msgSend_numberWithDouble_(v4, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"value");

  double v11 = NSNumber;
  objc_msgSend_maxValue(self, v12, v13);
  uint64_t v16 = objc_msgSend_numberWithDouble_(v11, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"maxValue");

  return v3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_double value = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_double maxValue = a3;
}

@end