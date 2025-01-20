@interface CLMiLoServicePlacePrediction
+ (BOOL)supportsSecureCoding;
- (CLMiLoServicePlacePrediction)initWithCoder:(id)a3;
- (CLMiLoServicePlacePrediction)initWithPlaces:(id)a3 serviceType:(unint64_t)a4;
- (NSArray)places;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)serviceType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServicePlacePrediction

- (CLMiLoServicePlacePrediction)initWithPlaces:(id)a3 serviceType:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLMiLoServicePlacePrediction;
  v6 = [(CLMiLoServicePlacePrediction *)&v8 init];
  if (v6)
  {
    v6->_places = (NSArray *)a3;
    v6->_serviceType = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServicePlacePrediction;
  [(CLMiLoServicePlacePrediction *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithPlaces_serviceType_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServicePlacePrediction)initWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyPlacePredictionPlaces");
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyPlacePredictionServiceType"];

  return (CLMiLoServicePlacePrediction *)MEMORY[0x1F4181798](self, sel_initWithPlaces_serviceType_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_places forKey:@"kCLMiLoConnectionCodingKeyPlacePredictionPlaces"];
  unint64_t serviceType = self->_serviceType;

  [a3 encodeInteger:serviceType forKey:@"kCLMiLoConnectionCodingKeyPlacePredictionServiceType"];
}

- (NSArray)places
{
  return self->_places;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

@end