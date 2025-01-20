@interface CLMiLoPlace
+ (BOOL)supportsSecureCoding;
- (CLMiLoPlace)initWithCoder:(id)a3;
- (CLMiLoPlace)initWithPlaceIdentifier:(id)a3 score:(id)a4 confidence:(unint64_t)a5 placeMetadata:(id)a6;
- (CLMiLoPlaceMetadata)metadata;
- (NSNumber)score;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)confidence;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoPlace

- (CLMiLoPlace)initWithPlaceIdentifier:(id)a3 score:(id)a4 confidence:(unint64_t)a5 placeMetadata:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLMiLoPlace;
  v10 = [(CLMiLoPlace *)&v12 init];
  if (v10)
  {
    v10->_identifier = (NSUUID *)[a3 copy];
    v10->_score = (NSNumber *)[a4 copy];
    v10->_confidence = a5;
    v10->_metadata = (CLMiLoPlaceMetadata *)a6;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoPlace;
  [(CLMiLoPlace *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithPlaceIdentifier_score_confidence_placeMetadata_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlace)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyMiLoPlaceIdenfifier"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPlaceScore"];
  [a3 decodeIntegerForKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyPlaceMetadata"];

  return (CLMiLoPlace *)MEMORY[0x1F4181798](self, sel_initWithPlaceIdentifier_score_confidence_placeMetadata_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"kCLMiLoConnectionCodingKeyMiLoPlaceIdenfifier"];
  [a3 encodeObject:self->_score forKey:@"kCLMiLoConnectionCodingKeyPlaceScore"];
  [a3 encodeInteger:self->_confidence forKey:@"kCLMiLoConnectionCodingKeyPlaceConfidenceEnum"];
  metadata = self->_metadata;

  [a3 encodeObject:metadata forKey:@"kCLMiLoConnectionCodingKeyPlaceMetadata"];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSNumber)score
{
  return self->_score;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (CLMiLoPlaceMetadata)metadata
{
  return self->_metadata;
}

@end