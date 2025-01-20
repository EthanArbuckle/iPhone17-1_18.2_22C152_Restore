@interface CLMiLoPredictionDeviceDistanceIndication
+ (BOOL)supportsSecureCoding;
- (CLMiLoPredictionDeviceDistanceIndication)initWithCoder:(id)a3;
- (CLMiLoPredictionDeviceDistanceIndication)initWithDeviceIdentifier:(id)a3 uwbRange:(id)a4 bleRSSI:(id)a5;
- (NSNumber)bleRSSI;
- (NSNumber)uwbRange;
- (NSString)deviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPredictionDeviceDistanceIndication

- (CLMiLoPredictionDeviceDistanceIndication)initWithDeviceIdentifier:(id)a3 uwbRange:(id)a4 bleRSSI:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CLMiLoPredictionDeviceDistanceIndication;
  v8 = [(CLMiLoPredictionDeviceDistanceIndication *)&v10 init];
  if (v8)
  {
    v8->_deviceIdentifier = (NSString *)[a3 copy];
    v8->_uwbRange = (NSNumber *)[a4 copy];
    v8->_bleRSSI = (NSNumber *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPredictionDeviceDistanceIndication;
  [(CLMiLoPredictionDeviceDistanceIndication *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithDeviceIdentifier_uwbRange_bleRSSI_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPredictionDeviceDistanceIndication)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationDeviceIdentifier"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationUwbRange"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationBleRSSI"];

  return (CLMiLoPredictionDeviceDistanceIndication *)MEMORY[0x1F4181798](self, sel_initWithDeviceIdentifier_uwbRange_bleRSSI_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_deviceIdentifier forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationDeviceIdentifier"];
  [a3 encodeObject:self->_uwbRange forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationUwbRange"];
  bleRSSI = self->_bleRSSI;

  [a3 encodeObject:bleRSSI forKey:@"kCLMiLoConnectionCodingKeyDeviceDistanceIndicationBleRSSI"];
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSNumber)uwbRange
{
  return self->_uwbRange;
}

- (NSNumber)bleRSSI
{
  return self->_bleRSSI;
}

@end