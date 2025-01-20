@interface HKGradient
+ (id)defaultGradient;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHKGradient:(id)a3;
- (HKGradient)initWithColors:(id)a3 locations:(id)a4;
- (HKGradient)initWithTopColor:(id)a3 bottomColor:(id)a4;
- (NSArray)colors;
- (NSArray)locations;
- (UIColor)bottomColor;
- (UIColor)topColor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setColors:(id)a3;
- (void)setLocations:(id)a3;
@end

@implementation HKGradient

- (HKGradient)initWithColors:(id)a3 locations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKGradient;
  v9 = [(HKGradient *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_colors, a3);
    objc_storeStrong((id *)&v10->_locations, a4);
  }

  return v10;
}

- (HKGradient)initWithTopColor:(id)a3 bottomColor:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:v12 count:2];

  v10 = [(HKGradient *)self initWithColors:v9 locations:&unk_1F3C1F0C0];
  return v10;
}

+ (id)defaultGradient
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4FB1618] redColor];
  v4 = [MEMORY[0x1E4FB1618] blueColor];
  v5 = (void *)[v2 initWithTopColor:v3 bottomColor:v4];

  return v5;
}

- (UIColor)topColor
{
  id v2 = [(HKGradient *)self colors];
  v3 = [v2 firstObject];

  return (UIColor *)v3;
}

- (UIColor)bottomColor
{
  id v2 = [(HKGradient *)self colors];
  v3 = [v2 lastObject];

  return (UIColor *)v3;
}

- (BOOL)isEqualToHKGradient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(HKGradient *)self colors];
    v6 = [v4 colors];
    if ([v5 isEqualToArray:v6])
    {
      id v7 = [(HKGradient *)self locations];
      id v8 = [v4 locations];
      char v9 = [v7 isEqualToArray:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKGradient *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HKGradient *)self isEqualToHKGradient:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(HKGradient *)self colors];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(HKGradient *)self locations];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    unint64_t v6 = [(HKGradient *)self colors];
    id v7 = (void *)[v6 copyWithZone:a3];
    [v5 setColors:v7];

    id v8 = [(HKGradient *)self locations];
    char v9 = (void *)[v8 copyWithZone:a3];
    [v5 setLocations:v9];
  }
  return v5;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end