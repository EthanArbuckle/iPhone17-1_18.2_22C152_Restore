@interface CLFloor
+ (BOOL)supportsSecureCoding;
- (CLFloor)initWithCoder:(id)a3;
- (CLFloor)initWithLevel:(int64_t)a3;
- (NSInteger)level;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLFloor

- (CLFloor)initWithLevel:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLFloor;
  result = [(CLFloor *)&v5 init];
  if (result) {
    result->level = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  char v5 = [a3 allowsKeyedCoding];
  p_level = &self->level;
  if (v5)
  {
    int64_t v7 = *p_level;
    [a3 encodeInteger:v7 forKey:@"kCLLocationCodingKeyFloor"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"q" at:p_level];
  }
}

- (CLFloor)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLFloor;
  v4 = [(CLFloor *)&v6 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding]) {
      v4->level = [a3 decodeIntegerForKey:@"kCLLocationCodingKeyFloor"];
    }
    else {
      [a3 decodeValueOfObjCType:"q" at:&v4->level];
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t level = self->level;

  return (id)[v4 initWithLevel:level];
}

- (NSInteger)level
{
  return self->level;
}

@end