@interface BBBulletinRequestParameters
+ (BOOL)supportsSecureCoding;
+ (id)requestParametersForDestination:(unint64_t)a3 withSinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6;
- (BBBulletinRequestParameters)initWithCoder:(id)a3;
- (BBBulletinRequestParameters)initWithDestination:(unint64_t)a3 sinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6;
- (NSDate)sinceDate;
- (NSSet)enabledSectionIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)maximumCount;
- (unint64_t)publisherDestination;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabledSectionIDs:(id)a3;
- (void)setSinceDate:(id)a3;
@end

@implementation BBBulletinRequestParameters

+ (id)requestParametersForDestination:(unint64_t)a3 withSinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDestination:a3 sinceDate:v10 maximumCount:a5 enabledSectionIDs:v9];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBBulletinRequestParameters)initWithDestination:(unint64_t)a3 sinceDate:(id)a4 maximumCount:(int64_t)a5 enabledSectionIDs:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  if (a3 != 2)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BBDataProvider.m", 56, @"Invalid parameter not satisfying: %@", @"IsSingleListTypeDestination(destination)" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)BBBulletinRequestParameters;
  v13 = [(BBBulletinRequestParameters *)&v21 init];
  v14 = v13;
  if (v13)
  {
    v13->_publisherDestination = a3;
    uint64_t v15 = [v11 copy];
    sinceDate = v14->_sinceDate;
    v14->_sinceDate = (NSDate *)v15;

    v14->_maximumCount = a5;
    uint64_t v17 = [v12 copy];
    enabledSectionIDs = v14->_enabledSectionIDs;
    v14->_enabledSectionIDs = (NSSet *)v17;
  }
  return v14;
}

- (BBBulletinRequestParameters)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"BBPublisherDestination"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BBSinceDate"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"BBMaximumCount"];
  v8 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  id v10 = [v8 setWithArray:v9];
  id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"BBEnabledSectionIDs"];

  id v12 = [(BBBulletinRequestParameters *)self initWithDestination:v5 sinceDate:v6 maximumCount:v7 enabledSectionIDs:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_publisherDestination forKey:@"BBPublisherDestination"];
  [v5 encodeObject:self->_sinceDate forKey:@"BBSinceDate"];
  [v5 encodeInteger:self->_maximumCount forKey:@"BBMaximumCount"];
  enabledSectionIDs = self->_enabledSectionIDs;
  if (enabledSectionIDs) {
    [v5 encodeObject:enabledSectionIDs forKey:@"BBEnabledSectionIDs"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t publisherDestination = self->_publisherDestination;
  int64_t maximumCount = self->_maximumCount;
  sinceDate = self->_sinceDate;
  enabledSectionIDs = self->_enabledSectionIDs;
  return (id)[v4 initWithDestination:publisherDestination sinceDate:sinceDate maximumCount:maximumCount enabledSectionIDs:enabledSectionIDs];
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (NSSet)enabledSectionIDs
{
  enabledSectionIDs = self->_enabledSectionIDs;
  if (enabledSectionIDs)
  {
    v3 = enabledSectionIDs;
  }
  else
  {
    v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = @"[Invalid destination]";
  if (self->_publisherDestination == 2) {
    id v5 = @"BBPublisherDestinationNotices";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; publisherDestination:%@; sinceDate:%@; maxCount:%ld; enabledSectionIDs:%@>",
               v4,
               self,
               v5,
               self->_sinceDate,
               self->_maximumCount,
               self->_enabledSectionIDs);
}

- (unint64_t)publisherDestination
{
  return self->_publisherDestination;
}

- (NSDate)sinceDate
{
  return self->_sinceDate;
}

- (void)setSinceDate:(id)a3
{
}

- (void)setEnabledSectionIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSectionIDs, 0);
  objc_storeStrong((id *)&self->_sinceDate, 0);
}

@end