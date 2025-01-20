@interface CMLUseCaseConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUseCaseConfig:(id)a3;
- (CMLUseCaseConfig)initWithCoder:(id)a3;
- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5;
- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5 cacheEntryMinutesToLive:(int64_t)a6;
- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5 cacheEntryMinutesToLive:(int64_t)a6 shardingDependsOn:(id)a7;
- (NSString)shardingDependsOn;
- (int64_t)cacheElementCount;
- (int64_t)cacheEntryMinutesToLive;
- (int64_t)maxShards;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMLUseCaseConfig

- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5
{
  return [(CMLUseCaseConfig *)self initWithType:a3 maxShards:a4 cacheElementCount:a5 cacheEntryMinutesToLive:10080];
}

- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5 cacheEntryMinutesToLive:(int64_t)a6
{
  return [(CMLUseCaseConfig *)self initWithType:a3 maxShards:a4 cacheElementCount:a5 cacheEntryMinutesToLive:a6 shardingDependsOn:0];
}

- (CMLUseCaseConfig)initWithType:(int64_t)a3 maxShards:(int64_t)a4 cacheElementCount:(int64_t)a5 cacheEntryMinutesToLive:(int64_t)a6 shardingDependsOn:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)CMLUseCaseConfig;
  v13 = [(CMLUseCaseConfig *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_maxShards = a4;
    v13->_cacheElementCount = a5;
    v13->_cacheEntryMinutesToLive = a6;
    uint64_t v15 = [v12 copy];
    shardingDependsOn = v14->_shardingDependsOn;
    v14->_shardingDependsOn = (NSString *)v15;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMLUseCaseConfig *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLUseCaseConfig *)self isEqualToUseCaseConfig:v5];

  return v6;
}

- (BOOL)isEqualToUseCaseConfig:(id)a3
{
  id v4 = a3;
  v5 = [(CMLUseCaseConfig *)self shardingDependsOn];
  BOOL v6 = [v4 shardingDependsOn];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    v7 = [(CMLUseCaseConfig *)self shardingDependsOn];
    v8 = [v4 shardingDependsOn];
    char v9 = [v7 isEqual:v8];
  }
  int64_t v10 = [(CMLUseCaseConfig *)self type];
  if (v10 == [v4 type]
    && (int64_t v11 = -[CMLUseCaseConfig maxShards](self, "maxShards"), v11 == [v4 maxShards])
    && (int64_t v12 = [(CMLUseCaseConfig *)self cacheElementCount],
        v12 == [v4 cacheElementCount]))
  {
    int64_t v13 = [(CMLUseCaseConfig *)self cacheEntryMinutesToLive];
    if (v13 == [v4 cacheEntryMinutesToLive]) {
      BOOL v14 = v9;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[CMLUseCaseConfig type](self, "type"));
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CMLUseCaseConfig maxShards](self, "maxShards"));
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CMLUseCaseConfig cacheElementCount](self, "cacheElementCount"));
  uint64_t v8 = [v7 hash];
  char v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CMLUseCaseConfig cacheEntryMinutesToLive](self, "cacheEntryMinutesToLive"));
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int64_t v11 = [(CMLUseCaseConfig *)self shardingDependsOn];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLUseCaseConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"maxShards"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"cacheElementCount"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"cacheEntryMinutesToLive"];
  char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shardingDependsOn"];

  uint64_t v10 = [(CMLUseCaseConfig *)self initWithType:v5 maxShards:v6 cacheElementCount:v7 cacheEntryMinutesToLive:v8 shardingDependsOn:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig type](self, "type"), @"type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig maxShards](self, "maxShards"), @"maxShards");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig cacheElementCount](self, "cacheElementCount"), @"cacheElementCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CMLUseCaseConfig cacheEntryMinutesToLive](self, "cacheEntryMinutesToLive"), @"cacheEntryMinutesToLive");
  id v5 = [(CMLUseCaseConfig *)self shardingDependsOn];
  [v4 encodeObject:v5 forKey:@"shardingDependsOn"];
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)maxShards
{
  return self->_maxShards;
}

- (int64_t)cacheElementCount
{
  return self->_cacheElementCount;
}

- (int64_t)cacheEntryMinutesToLive
{
  return self->_cacheEntryMinutesToLive;
}

- (NSString)shardingDependsOn
{
  return self->_shardingDependsOn;
}

- (void).cxx_destruct
{
}

@end