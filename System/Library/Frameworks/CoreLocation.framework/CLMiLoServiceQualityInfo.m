@interface CLMiLoServiceQualityInfo
+ (BOOL)supportsSecureCoding;
- (CLMiLoServiceQualityInfo)initWithCoder:(id)a3;
- (CLMiLoServiceQualityInfo)initWithQuality:(unint64_t)a3 andReasons:(id)a4;
- (NSArray)serviceQualityReasons;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)serviceQuality;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceQualityInfo

- (CLMiLoServiceQualityInfo)initWithQuality:(unint64_t)a3 andReasons:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLMiLoServiceQualityInfo;
  v6 = [(CLMiLoServiceQualityInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_serviceQuality = a3;
    v6->_serviceQualityReasons = (NSArray *)[a4 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceQualityInfo;
  [(CLMiLoServiceQualityInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithQuality_andReasons_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceQualityInfo)initWithCoder:(id)a3
{
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyServiceQuality"];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyServiceQualityReasons");

  return (CLMiLoServiceQualityInfo *)MEMORY[0x1F4181798](self, sel_initWithQuality_andReasons_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_serviceQuality forKey:@"kCLMiLoConnectionCodingKeyServiceQuality"];
  serviceQualityReasons = self->_serviceQualityReasons;

  [a3 encodeObject:serviceQualityReasons forKey:@"kCLMiLoConnectionCodingKeyServiceQualityReasons"];
}

- (unint64_t)serviceQuality
{
  return self->_serviceQuality;
}

- (NSArray)serviceQualityReasons
{
  return self->_serviceQualityReasons;
}

@end