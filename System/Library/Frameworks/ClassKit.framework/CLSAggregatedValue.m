@interface CLSAggregatedValue
+ (BOOL)supportsSecureCoding;
- (CLSAggregatedValue)initWithCoder:(id)a3;
- (double)normalized;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)aggregateType;
- (int64_t)compare:(id)a3;
- (int64_t)totalSampleCount;
- (void)add:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAggregateType:(int)a3;
- (void)setTotalSampleCount:(int64_t)a3;
- (void)setValue:(double)a3;
@end

@implementation CLSAggregatedValue

- (CLSAggregatedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSAggregatedValue;
  v6 = [(CLSAggregatedValue *)&v11 init];
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"value");
    v6->_value = v7;
    v6->_totalSampleCount = objc_msgSend_decodeIntegerForKey_(v4, v8, @"totalSampleCount");
    v6->_aggregateType = objc_msgSend_decodeIntForKey_(v4, v9, @"aggregateType");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double value = self->_value;
  id v8 = a3;
  objc_msgSend_encodeDouble_forKey_(v8, v5, @"value", value);
  objc_msgSend_encodeInteger_forKey_(v8, v6, self->_totalSampleCount, @"totalSampleCount");
  objc_msgSend_encodeInt_forKey_(v8, v7, self->_aggregateType, @"aggregateType");
}

- (double)normalized
{
  int64_t totalSampleCount = self->_totalSampleCount;
  if (totalSampleCount <= 1) {
    int64_t totalSampleCount = 1;
  }
  return self->_value / (double)totalSampleCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CLSAggregatedValue;
  id v4 = [(CLSReportItem *)&v18 copyWithZone:a3];
  objc_msgSend_value(self, v5, v6);
  objc_msgSend_setValue_(v4, v7, v8);
  uint64_t v11 = objc_msgSend_totalSampleCount(self, v9, v10);
  objc_msgSend_setTotalSampleCount_(v4, v12, v11);
  uint64_t v15 = objc_msgSend_aggregateType(self, v13, v14);
  objc_msgSend_setAggregateType_(v4, v16, v15);
  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  double v7 = v4;
  if (self->_totalSampleCount || objc_msgSend_totalSampleCount(v4, v5, v6) && self->_totalSampleCount)
  {
    if (objc_msgSend_totalSampleCount(v7, v5, v6))
    {
      objc_msgSend_normalized(self, v8, v9);
      double v11 = v10;
      objc_msgSend_normalized(v7, v12, v13);
      if (v11 < v14) {
        int64_t v15 = -1;
      }
      else {
        int64_t v15 = v11 > v14;
      }
    }
    else
    {
      int64_t v15 = 1;
    }
  }
  else
  {
    int64_t v15 = -1;
  }

  return v15;
}

- (void)add:(id)a3
{
  id v4 = a3;
  objc_msgSend_value(v4, v5, v6);
  self->_double value = v7 + self->_value;
  uint64_t v10 = objc_msgSend_totalSampleCount(v4, v8, v9);

  self->_totalSampleCount += v10;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_initWithFormat_(v3, v5, @"<%@ %p", v4, self);
  objc_msgSend_value(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v9, @" value: %.3f", v10);
  uint64_t v13 = objc_msgSend_totalSampleCount(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v14, @" samples: %ld", v13);
  objc_msgSend_appendString_(v6, v15, @">");

  return v6;
}

- (id)dictionaryRepresentation
{
  v19.receiver = self;
  v19.super_class = (Class)CLSAggregatedValue;
  id v3 = [(CLSReportItem *)&v19 dictionaryRepresentation];
  uint64_t v4 = NSNumber;
  objc_msgSend_value(self, v5, v6);
  uint64_t v9 = objc_msgSend_numberWithDouble_(v4, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"value");

  double v11 = NSNumber;
  uint64_t v14 = objc_msgSend_totalSampleCount(self, v12, v13);
  v16 = objc_msgSend_numberWithInteger_(v11, v15, v14);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"samples");

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

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void)setTotalSampleCount:(int64_t)a3
{
  self->_int64_t totalSampleCount = a3;
}

- (int)aggregateType
{
  return self->_aggregateType;
}

- (void)setAggregateType:(int)a3
{
  self->_aggregateType = a3;
}

@end