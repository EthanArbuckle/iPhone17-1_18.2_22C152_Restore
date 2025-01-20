@interface _ATXPredictionModelDetails
+ (BOOL)supportsSecureCoding;
- (NSString)abGroup;
- (_ATXPredictionModelDetails)initWithAssetCompatibilityVersion:(int64_t)a3 assetVersion:(int64_t)a4 abGroup:(id)a5;
- (_ATXPredictionModelDetails)initWithCoder:(id)a3;
- (int64_t)assetCompatibilityVersion;
- (int64_t)assetVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ATXPredictionModelDetails

- (_ATXPredictionModelDetails)initWithAssetCompatibilityVersion:(int64_t)a3 assetVersion:(int64_t)a4 abGroup:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_ATXPredictionModelDetails;
  v9 = [(_ATXPredictionModelDetails *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_assetCompatibilityVersion = a3;
    v9->_assetVersion = a4;
    uint64_t v11 = [v8 copy];
    abGroup = v10->_abGroup;
    v10->_abGroup = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXPredictionModelDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"assetCompatibilityVersion"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"assetVersion"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abGroup"];

  id v8 = [(_ATXPredictionModelDetails *)self initWithAssetCompatibilityVersion:v5 assetVersion:v6 abGroup:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t assetCompatibilityVersion = self->_assetCompatibilityVersion;
  id v5 = a3;
  [v5 encodeInteger:assetCompatibilityVersion forKey:@"assetCompatibilityVersion"];
  [v5 encodeInteger:self->_assetVersion forKey:@"assetVersion"];
  [v5 encodeObject:self->_abGroup forKey:@"abGroup"];
}

- (int64_t)assetCompatibilityVersion
{
  return self->_assetCompatibilityVersion;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void).cxx_destruct
{
}

@end