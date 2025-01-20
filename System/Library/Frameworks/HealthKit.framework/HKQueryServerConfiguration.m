@interface HKQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldDeactivateAfterInitialResults;
- (BOOL)shouldSuppressDataCollection;
- (HKObjectType)objectType;
- (HKQueryServerConfiguration)init;
- (HKQueryServerConfiguration)initWithCoder:(id)a3;
- (NSString)debugIdentifier;
- (_HKFilter)filter;
- (double)activationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationTime:(double)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setFilter:(id)a3;
- (void)setObjectType:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setShouldDeactivateAfterInitialResults:(BOOL)a3;
- (void)setShouldSuppressDataCollection:(BOOL)a3;
@end

@implementation HKQueryServerConfiguration

- (HKQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKQueryServerConfiguration;
  v5 = [(HKTaskConfiguration *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    objectType = v5->_objectType;
    v5->_objectType = (HKObjectType *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugID"];
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v8;

    v5->_shouldDeactivateAfterInitialResults = [v4 decodeBoolForKey:@"deactivate"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filter"];
    filter = v5->_filter;
    v5->_filter = (_HKFilter *)v10;

    v5->_qualityOfService = [v4 decodeIntegerForKey:@"qos"];
    v5->_shouldSuppressDataCollection = [v4 decodeBoolForKey:@"suppress"];
    [v4 decodeDoubleForKey:@"activationDate"];
    v5->_activationTime = v12;
  }

  return v5;
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (BOOL)shouldSuppressDataCollection
{
  return self->_shouldSuppressDataCollection;
}

- (BOOL)shouldDeactivateAfterInitialResults
{
  return self->_shouldDeactivateAfterInitialResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_objectType, 0);

  objc_storeStrong((id *)&self->_debugIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryServerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKQueryServerConfiguration;
  result = [(HKQueryServerConfiguration *)&v3 init];
  if (result) {
    result->_qualityOfService = -1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKQueryServerConfiguration;
  id v4 = [(HKTaskConfiguration *)&v6 copyWithZone:a3];
  [v4 setObjectType:self->_objectType];
  [v4 setDebugIdentifier:self->_debugIdentifier];
  [v4 setFilter:self->_filter];
  [v4 setQualityOfService:self->_qualityOfService];
  [v4 setShouldDeactivateAfterInitialResults:self->_shouldDeactivateAfterInitialResults];
  [v4 setShouldSuppressDataCollection:self->_shouldSuppressDataCollection];
  [v4 setActivationTime:self->_activationTime];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKQueryServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectType, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_debugIdentifier forKey:@"debugID"];
  [v4 encodeBool:self->_shouldDeactivateAfterInitialResults forKey:@"deactivate"];
  [v4 encodeObject:self->_filter forKey:@"filter"];
  [v4 encodeInteger:self->_qualityOfService forKey:@"qos"];
  [v4 encodeBool:self->_shouldSuppressDataCollection forKey:@"suppress"];
  [v4 encodeDouble:@"activationDate" forKey:self->_activationTime];
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (void)setShouldDeactivateAfterInitialResults:(BOOL)a3
{
  self->_shouldDeactivateAfterInitialResults = a3;
}

- (void)setObjectType:(id)a3
{
}

- (void)setFilter:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setShouldSuppressDataCollection:(BOOL)a3
{
  self->_shouldSuppressDataCollection = a3;
}

- (double)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(double)a3
{
  self->_activationTime = a3;
}

@end