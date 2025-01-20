@interface NISpatialBrowsingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)responderConfigurationWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponder;
- (NISpatialBrowsingConfiguration)init;
- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3;
- (NSString)deviceIdentifier;
- (double)maxNearbyObjectAge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)updatesPolicy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setMaxNearbyObjectAge:(double)a3;
- (void)setResponder:(BOOL)a3;
- (void)setUpdatesPolicy:(int64_t)a3;
@end

@implementation NISpatialBrowsingConfiguration

+ (id)responderConfigurationWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"NISpatialBrowsingConfiguration.mm" lineNumber:24 description:@"deviceIdentifier cannot be nil."];
  }
  v6 = objc_alloc_init(NISpatialBrowsingConfiguration);
  [(NISpatialBrowsingConfiguration *)v6 setResponder:1];
  [(NISpatialBrowsingConfiguration *)v6 setDeviceIdentifier:v5];

  return v6;
}

- (NISpatialBrowsingConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  v2 = [(NIConfiguration *)&v6 initInternal];
  v3 = v2;
  if (v2)
  {
    v2->_responder = 0;
    v2->_updatesPolicy = 1;
    deviceIdentifier = v2->_deviceIdentifier;
    v2->_deviceIdentifier = 0;

    v3->_maxNearbyObjectAge = 10.0;
  }
  return v3;
}

+ (id)new
{
  return objc_alloc_init(NISpatialBrowsingConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  id v4 = [(NIConfiguration *)&v6 copyWithZone:a3];
  [v4 setResponder:self->_responder];
  [v4 setDeviceIdentifier:self->_deviceIdentifier];
  [v4 setUpdatesPolicy:self->_updatesPolicy];
  [v4 setMaxNearbyObjectAge:self->_maxNearbyObjectAge];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISpatialBrowsingConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_responder forKey:@"responder"];
  [v4 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v4 encodeInteger:self->_updatesPolicy forKey:@"updatesPolicy"];
  [v4 encodeDouble:@"maxNearbyObjectAge" forKey:self->_maxNearbyObjectAge];
}

- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NISpatialBrowsingConfiguration;
  objc_super v5 = [(NIConfiguration *)&v14 initWithCoder:v4];
  if (v5 && (unint64_t v6 = [v4 decodeIntegerForKey:@"updatesPolicy"], v6 < 2))
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    char v8 = [v4 decodeBoolForKey:@"responder"];
    [v4 decodeDoubleForKey:@"maxNearbyObjectAge"];
    double v10 = v9;
    v5->_responder = v8;
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v7;

    v5->_updatesPolicy = v6;
    v5->_maxNearbyObjectAge = v10;
    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NISpatialBrowsingConfiguration *)v4;
    unint64_t v6 = v5;
    if (v5 == self)
    {
      char v13 = 1;
    }
    else
    {
      int v7 = [(NISpatialBrowsingConfiguration *)v5 isResponder];
      int responder = self->_responder;
      uint64_t v9 = [(NISpatialBrowsingConfiguration *)v6 updatesPolicy];
      int64_t updatesPolicy = self->_updatesPolicy;
      v11 = [(NISpatialBrowsingConfiguration *)v6 deviceIdentifier];
      if (v11) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = self->_deviceIdentifier == 0;
      }

      objc_super v14 = [(NISpatialBrowsingConfiguration *)v6 deviceIdentifier];
      char v15 = [v14 isEqualToString:self->_deviceIdentifier];

      [(NISpatialBrowsingConfiguration *)v6 maxNearbyObjectAge];
      char v13 = 0;
      if (responder == v7 && v9 == updatesPolicy)
      {
        if (v16 == self->_maxNearbyObjectAge) {
          char v13 = v12 | v15;
        }
        else {
          char v13 = 0;
        }
      }
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceIdentifier hash];
  BOOL responder = self->_responder;
  int64_t updatesPolicy = self->_updatesPolicy;
  unint64_t v6 = [NSNumber numberWithDouble:self->_maxNearbyObjectAge];
  unint64_t v7 = v3 ^ responder ^ updatesPolicy ^ [v6 hash];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NISpatialBrowsingConfiguration *)self descriptionInternal];
  unint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  if (self->_responder) {
    v2 = @"Yes";
  }
  else {
    v2 = @"No";
  }
  if (self->_updatesPolicy == 1) {
    id v3 = @"SignificantChanges";
  }
  else {
    id v3 = @"Stream";
  }
  id v4 = [NSString stringWithFormat:@"<maxNearbyObjectAge: %0.2fsec, isResponder: %@, deviceIdentifier: %@, updatesPolicy: %@>", *(void *)&self->_maxNearbyObjectAge, v2, self->_deviceIdentifier, v3];

  return v4;
}

- (int64_t)updatesPolicy
{
  return self->_updatesPolicy;
}

- (void)setUpdatesPolicy:(int64_t)a3
{
  self->_int64_t updatesPolicy = a3;
}

- (BOOL)isResponder
{
  return self->_responder;
}

- (void)setResponder:(BOOL)a3
{
  self->_BOOL responder = a3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (double)maxNearbyObjectAge
{
  return self->_maxNearbyObjectAge;
}

- (void)setMaxNearbyObjectAge:(double)a3
{
  self->_maxNearbyObjectAge = a3;
}

- (void).cxx_destruct
{
}

@end