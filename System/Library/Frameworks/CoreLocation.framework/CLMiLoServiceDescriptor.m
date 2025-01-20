@interface CLMiLoServiceDescriptor
+ (BOOL)supportsSecureCoding;
- (CLMiLoServiceDescriptor)initWithCoder:(id)a3;
- (CLMiLoServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5;
- (NSArray)locationTypes;
- (NSUUID)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)serviceType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoServiceDescriptor

- (CLMiLoServiceDescriptor)initWithServiceIdentifier:(id)a3 serviceType:(unint64_t)a4 locationTypes:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLMiLoServiceDescriptor;
  v8 = [(CLMiLoServiceDescriptor *)&v10 init];
  if (v8)
  {
    v8->_serviceIdentifier = (NSUUID *)[a3 copy];
    v8->_serviceType = a4;
    v8->_locationTypes = (NSArray *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceDescriptor;
  [(CLMiLoServiceDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithServiceIdentifier_serviceType_locationTypes_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceDescriptor)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyServiceIdentifier"];
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyServiceType"];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyLocationTypeArray");

  return (CLMiLoServiceDescriptor *)MEMORY[0x1F4181798](self, sel_initWithServiceIdentifier_serviceType_locationTypes_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_serviceIdentifier forKey:@"kCLMiLoConnectionCodingKeyServiceIdentifier"];
  [a3 encodeInteger:self->_serviceType forKey:@"kCLMiLoConnectionCodingKeyServiceType"];
  locationTypes = self->_locationTypes;

  [a3 encodeObject:locationTypes forKey:@"kCLMiLoConnectionCodingKeyLocationTypeArray"];
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)locationTypes
{
  return self->_locationTypes;
}

@end