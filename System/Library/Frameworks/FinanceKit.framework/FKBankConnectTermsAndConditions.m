@interface FKBankConnectTermsAndConditions
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldNotifyAboutChanges;
- (FKBankConnectTermsAndConditions)initWithIdentifier:(id)a3 publishedAt:(id)a4 reviewedAt:(id)a5 inEffectOn:(id)a6;
- (NSDate)inEffectOn;
- (NSDate)publishedAt;
- (NSDate)reviewedAt;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKBankConnectTermsAndConditions

- (FKBankConnectTermsAndConditions)initWithIdentifier:(id)a3 publishedAt:(id)a4 reviewedAt:(id)a5 inEffectOn:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKBankConnectTermsAndConditions;
  v14 = [(FKBankConnectTermsAndConditions *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    publishedAt = v14->_publishedAt;
    v14->_publishedAt = (NSDate *)v17;

    uint64_t v19 = [v12 copy];
    reviewedAt = v14->_reviewedAt;
    v14->_reviewedAt = (NSDate *)v19;

    uint64_t v21 = [v13 copy];
    inEffectOn = v14->_inEffectOn;
    v14->_inEffectOn = (NSDate *)v21;
  }
  return v14;
}

- (BOOL)shouldNotifyAboutChanges
{
  inEffectOn = self->_inEffectOn;
  v4 = [MEMORY[0x263EFF910] now];
  uint64_t v5 = [(NSDate *)inEffectOn compare:v4];

  if (v5 == -1) {
    return 0;
  }
  publishedAt = self->_publishedAt;
  v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = [(NSDate *)publishedAt compare:v7];

  if (v8 != -1) {
    return 0;
  }
  if (self->_reviewedAt) {
    return -[NSDate compare:](self->_publishedAt, "compare:") == NSOrderedDescending;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(FKBankConnectTermsAndConditions);
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSDate *)self->_publishedAt copyWithZone:a3];
  publishedAt = v5->_publishedAt;
  v5->_publishedAt = (NSDate *)v8;

  uint64_t v10 = [(NSDate *)self->_reviewedAt copyWithZone:a3];
  reviewedAt = v5->_reviewedAt;
  v5->_reviewedAt = (NSDate *)v10;

  uint64_t v12 = [(NSDate *)self->_inEffectOn copyWithZone:a3];
  inEffectOn = v5->_inEffectOn;
  v5->_inEffectOn = (NSDate *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_publishedAt];
  [v3 safelyAddObject:self->_reviewedAt];
  [v3 safelyAddObject:self->_inEffectOn];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKBankConnectTermsAndConditions *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_identifier, v6[1])
      && FKEqualObjects(self->_publishedAt, v6[2])
      && FKEqualObjects(self->_reviewedAt, v6[3]))
    {
      char v7 = FKEqualObjects(self->_inEffectOn, v6[4]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)publishedAt
{
  return self->_publishedAt;
}

- (NSDate)reviewedAt
{
  return self->_reviewedAt;
}

- (NSDate)inEffectOn
{
  return self->_inEffectOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inEffectOn, 0);
  objc_storeStrong((id *)&self->_reviewedAt, 0);
  objc_storeStrong((id *)&self->_publishedAt, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end