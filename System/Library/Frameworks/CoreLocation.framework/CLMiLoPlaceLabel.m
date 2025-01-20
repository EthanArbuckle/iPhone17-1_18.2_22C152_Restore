@interface CLMiLoPlaceLabel
+ (BOOL)supportsSecureCoding;
- (CLMiLoPlaceLabel)initWithCoder:(id)a3;
- (CLMiLoPlaceLabel)initWithPlaceIdentifier:(id)a3 placeAdditionalInformation:(id)a4;
- (NSString)placeAdditionalInformation;
- (NSUUID)placeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPlaceLabel

- (CLMiLoPlaceLabel)initWithPlaceIdentifier:(id)a3 placeAdditionalInformation:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLMiLoPlaceLabel;
  v6 = [(CLMiLoPlaceLabel *)&v8 init];
  if (v6)
  {
    v6->_placeIdentifier = (NSUUID *)[a3 copy];
    v6->_placeAdditionalInformation = (NSString *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPlaceLabel;
  [(CLMiLoPlaceLabel *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithPlaceIdentifier_placeAdditionalInformation_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceLabel)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyLocationPlaceIdentifier"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyLocationPlaceAdditionalInformation"];

  return (CLMiLoPlaceLabel *)MEMORY[0x1F4181798](self, sel_initWithPlaceIdentifier_placeAdditionalInformation_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_placeIdentifier forKey:@"kCLMiLoConnectionCodingKeyLocationPlaceIdentifier"];
  placeAdditionalInformation = self->_placeAdditionalInformation;

  [a3 encodeObject:placeAdditionalInformation forKey:@"kCLMiLoConnectionCodingKeyLocationPlaceAdditionalInformation"];
}

- (NSUUID)placeIdentifier
{
  return self->_placeIdentifier;
}

- (NSString)placeAdditionalInformation
{
  return self->_placeAdditionalInformation;
}

@end