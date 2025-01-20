@interface DNDAccountFeatureSupport
+ (BOOL)supportsSecureCoding;
+ (id)accountFeaturesWithCloud:(unint64_t)a3 hasCloudDevices:(BOOL)a4 paired:(unint64_t)a5 hasPairedDevices:(BOOL)a6;
- (BOOL)hasCloudDevices;
- (BOOL)hasPairedDevices;
- (DNDAccountFeatureSupport)initWithCoder:(id)a3;
- (id)_initWithCloud:(unint64_t)a3 hasCloud:(BOOL)a4 paired:(unint64_t)a5 hasPaired:(BOOL)a6;
- (id)description;
- (unint64_t)cloudFeatures;
- (unint64_t)pairedFeatures;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDAccountFeatureSupport

- (id)_initWithCloud:(unint64_t)a3 hasCloud:(BOOL)a4 paired:(unint64_t)a5 hasPaired:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)DNDAccountFeatureSupport;
  id result = [(DNDAccountFeatureSupport *)&v11 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a4;
    *((void *)result + 2) = a3;
    *((void *)result + 3) = a5;
    *((unsigned char *)result + 9) = a6;
  }
  return result;
}

+ (id)accountFeaturesWithCloud:(unint64_t)a3 hasCloudDevices:(BOOL)a4 paired:(unint64_t)a5 hasPairedDevices:(BOOL)a6
{
  v6 = (void *)[objc_alloc((Class)a1) _initWithCloud:a3 hasCloud:a4 paired:a5 hasPaired:a6];
  return v6;
}

- (id)description
{
  v3 = NSString;
  BOOL hasCloudDevices = self->_hasCloudDevices;
  if (self->_hasCloudDevices)
  {
    DNDStringFromSupportedAccountFeatures(self->_cloudFeatures);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = @"<N/A>";
  }
  if (self->_hasPairedDevices)
  {
    v6 = DNDStringFromSupportedAccountFeatures(self->_pairedFeatures);
    v7 = [v3 stringWithFormat:@"cloud: %@; paired: %@;", v5, v6];

    if (!hasCloudDevices) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v7 = [v3 stringWithFormat:@"cloud: %@; paired: %@;", v5, @"<N/A>"];
  if (hasCloudDevices) {
LABEL_6:
  }

LABEL_7:
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAccountFeatureSupport)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloud"];
  uint64_t v6 = [v4 decodeBoolForKey:@"hasCloud"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paired"];
  uint64_t v8 = [v4 decodeBoolForKey:@"hasPaired"];

  v9 = -[DNDAccountFeatureSupport _initWithCloud:hasCloud:paired:hasPaired:](self, "_initWithCloud:hasCloud:paired:hasPaired:", [v5 unsignedIntegerValue], v6, objc_msgSend(v7, "unsignedIntegerValue"), v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t cloudFeatures = self->_cloudFeatures;
  id v8 = a3;
  uint64_t v6 = [v4 numberWithUnsignedInteger:cloudFeatures];
  [v8 encodeObject:v6 forKey:@"cloud"];

  [v8 encodeBool:self->_hasCloudDevices forKey:@"hasCloud"];
  v7 = [NSNumber numberWithUnsignedInteger:self->_pairedFeatures];
  [v8 encodeObject:v7 forKey:@"paired"];

  [v8 encodeBool:self->_hasPairedDevices forKey:@"hasPaired"];
}

- (unint64_t)cloudFeatures
{
  return self->_cloudFeatures;
}

- (BOOL)hasCloudDevices
{
  return self->_hasCloudDevices;
}

- (unint64_t)pairedFeatures
{
  return self->_pairedFeatures;
}

- (BOOL)hasPairedDevices
{
  return self->_hasPairedDevices;
}

@end