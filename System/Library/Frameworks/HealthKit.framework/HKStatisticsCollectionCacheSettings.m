@interface HKStatisticsCollectionCacheSettings
+ (BOOL)supportsSecureCoding;
- (HKStatisticsCollectionCacheSettings)initWithCoder:(id)a3;
- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3;
- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3 mode:(int64_t)a4;
- (NSString)identifier;
- (int64_t)mode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKStatisticsCollectionCacheSettings

- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3
{
  return [(HKStatisticsCollectionCacheSettings *)self initWithIdentifier:a3 mode:0];
}

- (HKStatisticsCollectionCacheSettings)initWithIdentifier:(id)a3 mode:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HKStatisticsCollectionQuery.m", 776, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKStatisticsCollectionCacheSettings;
  v8 = [(HKStatisticsCollectionCacheSettings *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_mode = a4;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKStatisticsCollectionCacheSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKStatisticsCollectionCacheSettings;
  v5 = [(HKStatisticsCollectionCacheSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_mode = [v4 decodeIntegerForKey:@"mode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
}

@end