@interface HKDisplayTypeContextItemTitleAccessory
+ (HKDisplayTypeContextItemTitleAccessory)titleAccessoryWithImagedNamed:(id)a3 imageColor:(id)a4;
- (BOOL)_isEqualToTitleAccessory:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)systemImageName;
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HKDisplayTypeContextItemTitleAccessory

+ (HKDisplayTypeContextItemTitleAccessory)titleAccessoryWithImagedNamed:(id)a3 imageColor:(id)a4
{
  v5 = (NSString *)a3;
  v6 = (UIColor *)a4;
  v7 = objc_alloc_init(HKDisplayTypeContextItemTitleAccessory);
  systemImageName = v7->_systemImageName;
  v7->_systemImageName = v5;
  v9 = v5;

  color = v7->_color;
  v7->_color = v6;

  return v7;
}

- (BOOL)_isEqualToTitleAccessory:(id)a3
{
  id v4 = a3;
  systemImageName = self->_systemImageName;
  v6 = [v4 systemImageName];
  if ([(NSString *)systemImageName isEqualToString:v6])
  {
    color = self->_color;
    v8 = [v4 color];
    BOOL v9 = color == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKDisplayTypeContextItemTitleAccessory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKDisplayTypeContextItemTitleAccessory *)self _isEqualToTitleAccessory:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_systemImageName hash];
  return [(UIColor *)self->_color hash] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_systemImageName);
  objc_storeStrong(v4 + 2, self->_color);
  return v4;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

@end