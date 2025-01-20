@interface AXDataPointValue
+ (AXDataPointValue)valueWithCategory:(NSString *)category;
+ (AXDataPointValue)valueWithNumber:(double)number;
- (NSString)category;
- (double)number;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCategory:(NSString *)category;
- (void)setNumber:(double)number;
@end

@implementation AXDataPointValue

+ (AXDataPointValue)valueWithNumber:(double)number
{
  v4 = objc_alloc_init(AXDataPointValue);
  [(AXDataPointValue *)v4 setNumber:number];

  return v4;
}

+ (AXDataPointValue)valueWithCategory:(NSString *)category
{
  v3 = category;
  v4 = objc_alloc_init(AXDataPointValue);
  [(AXDataPointValue *)v4 setCategory:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(AXDataPointValue *)self number];
  objc_msgSend(v4, "setNumber:");
  v5 = [(AXDataPointValue *)self category];
  v6 = (void *)[v5 copy];
  [v4 setCategory:v6];

  return v4;
}

- (id)description
{
  v3 = [(AXDataPointValue *)self category];
  if (v3)
  {
    v4 = [(AXDataPointValue *)self category];
  }
  else
  {
    v5 = NSString;
    v6 = NSNumber;
    [(AXDataPointValue *)self number];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    v4 = [v5 stringWithFormat:@"%@", v7];
  }

  return v4;
}

- (double)number
{
  return self->_number;
}

- (void)setNumber:(double)number
{
  self->_number = number;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(NSString *)category
{
}

- (void).cxx_destruct
{
}

@end