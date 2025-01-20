@interface GDRoadTypeValue
+ (BOOL)supportsSecureCoding;
- (GDRoadTypeValue)initWithCoder:(id)a3;
- (GDRoadTypeValue)initWithType:(int64_t)a3 typeValue:(double)a4;
- (double)typeValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDRoadTypeValue

- (double)typeValue
{
  return self->_typeValue;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 4) {
    v4 = 0;
  }
  else {
    v4 = off_1E60138C8[type];
  }
  id v5 = [NSString alloc];
  v9 = objc_msgSend_initWithFormat_(v5, v6, @"GDRoadTypeValue<type: %@, typeValue: %lf>", v7, v8, v4, *(void *)&self->_typeValue);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(GDRoadTypeValue, a2, (uint64_t)a3, v3, v4);
  int64_t type = self->_type;

  return (id)MEMORY[0x1F4181798](v6, sel_initWithType_typeValue_, type, v7, v8);
}

- (GDRoadTypeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_type);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);
  uint64_t v14 = (int)objc_msgSend_intValue(v9, v10, v11, v12, v13);

  uint64_t v15 = objc_opt_class();
  v16 = NSStringFromSelector(sel_typeValue);
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16, v18);

  objc_msgSend_doubleValue(v19, v20, v21, v22, v23);

  return (GDRoadTypeValue *)MEMORY[0x1F4181798](self, sel_initWithType_typeValue_, v14, v24, v25);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  v10 = objc_msgSend_numberWithInteger_(v4, v7, type, v8, v9);
  uint64_t v11 = NSStringFromSelector(sel_type);
  objc_msgSend_encodeObject_forKey_(v6, v12, (uint64_t)v10, (uint64_t)v11, v13);

  objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, v17, self->_typeValue);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = NSStringFromSelector(sel_typeValue);
  objc_msgSend_encodeObject_forKey_(v6, v19, (uint64_t)v21, (uint64_t)v18, v20);
}

- (GDRoadTypeValue)initWithType:(int64_t)a3 typeValue:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GDRoadTypeValue;
  result = [(GDRoadTypeValue *)&v7 init];
  if (result)
  {
    result->_int64_t type = a3;
    result->_typeValue = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end