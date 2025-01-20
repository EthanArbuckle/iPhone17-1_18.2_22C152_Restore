@interface CLMiLoFingerprintMetaInfo
+ (BOOL)supportsSecureCoding;
- (CLMiLoFingerprintMetaInfo)initWithCoder:(id)a3;
- (CLMiLoFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7;
- (NSArray)errors;
- (NSNumber)numberOfBLESources;
- (NSNumber)numberOfUWBSources;
- (NSNumber)numberOfWiFiAccessPoints;
- (NSUUID)requestIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMiLoFingerprintMetaInfo

- (CLMiLoFingerprintMetaInfo)initWithNumWiFiAccessPoints:(id)a3 numBLESources:(id)a4 numUWBSources:(id)a5 requestIdentifier:(id)a6 errors:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)CLMiLoFingerprintMetaInfo;
  v12 = [(CLMiLoFingerprintMetaInfo *)&v14 init];
  if (v12)
  {
    v12->_numberOfWiFiAccessPoints = (NSNumber *)[a3 copy];
    v12->_numberOfBLESources = (NSNumber *)[a4 copy];
    v12->_numberOfUWBSources = (NSNumber *)[a5 copy];
    v12->_requestIdentifier = (NSUUID *)[a6 copy];
    v12->_errors = (NSArray *)a7;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLMiLoFingerprintMetaInfo;
  [(CLMiLoFingerprintMetaInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(id)objc_opt_class() allocWithZone:a3];

  return (id)MEMORY[0x1F4181798](v3, sel_initWithNumWiFiAccessPoints_numBLESources_numUWBSources_requestIdentifier_errors_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoFingerprintMetaInfo)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfBLESources"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyNumberOfUWBSources"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLMiLoConnectionCodingKeyObservationMetaInfoRequestIdentifier"];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"kCLMiLoConnectionCodingKeyFingerprintErrors");

  return (CLMiLoFingerprintMetaInfo *)MEMORY[0x1F4181798](self, sel_initWithNumWiFiAccessPoints_numBLESources_numUWBSources_requestIdentifier_errors_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_numberOfWiFiAccessPoints forKey:@"kCLMiLoConnectionCodingKeyNumberOfWiFiAccessPoints"];
  [a3 encodeObject:self->_numberOfBLESources forKey:@"kCLMiLoConnectionCodingKeyNumberOfBLESources"];
  [a3 encodeObject:self->_numberOfUWBSources forKey:@"kCLMiLoConnectionCodingKeyNumberOfUWBSources"];
  [a3 encodeObject:self->_requestIdentifier forKey:@"kCLMiLoConnectionCodingKeyObservationMetaInfoRequestIdentifier"];
  errors = self->_errors;

  [a3 encodeObject:errors forKey:@"kCLMiLoConnectionCodingKeyFingerprintErrors"];
}

- (NSNumber)numberOfWiFiAccessPoints
{
  return self->_numberOfWiFiAccessPoints;
}

- (NSNumber)numberOfBLESources
{
  return self->_numberOfBLESources;
}

- (NSNumber)numberOfUWBSources
{
  return self->_numberOfUWBSources;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSArray)errors
{
  return self->_errors;
}

@end