@interface AXMDataPointValue
+ (id)emptyValue;
+ (id)valueWithCategory:(id)a3;
+ (id)valueWithNumber:(double)a3;
- (BOOL)isEmptyValue;
- (NSString)category;
- (double)number;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCategory:(id)a3;
- (void)setIsEmptyValue:(BOOL)a3;
- (void)setNumber:(double)a3;
@end

@implementation AXMDataPointValue

+ (id)valueWithNumber:(double)a3
{
  v4 = objc_alloc_init(AXMDataPointValue);
  [(AXMDataPointValue *)v4 setNumber:a3];

  return v4;
}

+ (id)valueWithCategory:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(AXMDataPointValue);
  [(AXMDataPointValue *)v4 setCategory:v3];

  return v4;
}

+ (id)emptyValue
{
  v2 = objc_alloc_init(AXMDataPointValue);
  [(AXMDataPointValue *)v2 setIsEmptyValue:1];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(AXMDataPointValue *)self number];
  objc_msgSend(v4, "setNumber:");
  v5 = [(AXMDataPointValue *)self category];
  v6 = (void *)[v5 copy];
  [v4 setCategory:v6];

  objc_msgSend(v4, "setIsEmptyValue:", -[AXMDataPointValue isEmptyValue](self, "isEmptyValue"));
  return v4;
}

- (id)description
{
  id v3 = [(AXMDataPointValue *)self category];
  if (v3)
  {
    v4 = [(AXMDataPointValue *)self category];
  }
  else
  {
    v5 = NSString;
    v6 = NSNumber;
    [(AXMDataPointValue *)self number];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    v4 = [v5 stringWithFormat:@"%@ ", v7];
  }

  return v4;
}

- (void)setIsEmptyValue:(BOOL)a3
{
  self->_isEmptyValue = a3;
}

- (double)number
{
  return self->_number;
}

- (void)setNumber:(double)a3
{
  self->_number = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (BOOL)isEmptyValue
{
  return self->_isEmptyValue;
}

- (void).cxx_destruct
{
}

@end