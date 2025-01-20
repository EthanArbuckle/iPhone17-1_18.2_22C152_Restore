@interface AFSyncInfo
+ (BOOL)supportsSecureCoding;
- (AFSyncInfo)initWithAnchor:(id)a3 forcingReset:(BOOL)a4;
- (AFSyncInfo)initWithCoder:(id)a3;
- (BOOL)forVerification;
- (BOOL)targetIsLocal;
- (NSSet)reasons;
- (NSString)anchor;
- (NSString)key;
- (NSString)validity;
- (SASyncAppMetaData)appMetadata;
- (id)description;
- (int64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setAppMetadata:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setForVerification:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setReasons:(id)a3;
- (void)setTargetIsLocal:(BOOL)a3;
- (void)setValidity:(id)a3;
@end

@implementation AFSyncInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_appMetadata, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)setReasons:(id)a3
{
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (void)setForVerification:(BOOL)a3
{
  self->_forVerification = a3;
}

- (BOOL)forVerification
{
  return self->_forVerification;
}

- (void)setTargetIsLocal:(BOOL)a3
{
  self->_targetIsLocal = a3;
}

- (BOOL)targetIsLocal
{
  return self->_targetIsLocal;
}

- (void)setAppMetadata:(id)a3
{
}

- (SASyncAppMetaData)appMetadata
{
  return self->_appMetadata;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setValidity:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)anchor
{
  return self->_anchor;
}

- (AFSyncInfo)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AFSyncInfo;
  v5 = [(AFSyncInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_validity"];
    validity = v5->_validity;
    v5->_validity = (NSString *)v8;

    v5->_count = [v4 decodeIntegerForKey:@"_count"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v5->_targetIsLocal = [v4 decodeBoolForKey:@"_targetIsLocal"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appMetadata"];
    appMetadata = v5->_appMetadata;
    v5->_appMetadata = (SASyncAppMetaData *)v12;

    v5->_forVerification = [v4 decodeBoolForKey:@"_forVerification"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_reasons"];
    reasons = v5->_reasons;
    v5->_reasons = (NSSet *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  anchor = self->_anchor;
  id v5 = a3;
  [v5 encodeObject:anchor forKey:@"_anchor"];
  [v5 encodeObject:self->_validity forKey:@"_validity"];
  [v5 encodeInteger:self->_count forKey:@"_count"];
  [v5 encodeObject:self->_key forKey:@"_key"];
  [v5 encodeBool:self->_targetIsLocal forKey:@"_targetIsLocal"];
  [v5 encodeObject:self->_appMetadata forKey:@"_appMetadata"];
  [v5 encodeBool:self->_forVerification forKey:@"_forVerification"];
  [v5 encodeObject:self->_reasons forKey:@"_reasons"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFSyncInfo;
  id v4 = [(AFSyncInfo *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ anchor: %@ validity: %@ count: %zd key: %@ targetIsLocal: %d appMetadata: %@ reasons: %@", v4, self->_anchor, self->_validity, self->_count, self->_key, self->_targetIsLocal, self->_appMetadata, self->_reasons];

  return v5;
}

- (AFSyncInfo)initWithAnchor:(id)a3 forcingReset:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSyncInfo;
  objc_super v7 = [(AFSyncInfo *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 key];
    [(AFSyncInfo *)v7 setKey:v8];

    v9 = [v6 appMetaData];
    [(AFSyncInfo *)v7 setAppMetadata:v9];

    if (!a4)
    {
      uint64_t v10 = [v6 generation];
      [(AFSyncInfo *)v7 setAnchor:v10];

      v11 = [v6 validity];
      [(AFSyncInfo *)v7 setValidity:v11];

      -[AFSyncInfo setCount:](v7, "setCount:", [v6 count]);
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end