@interface GEORequestCounterProactiveTileDownloadInfo
+ (BOOL)supportsSecureCoding;
- (GEORequestCounterProactiveTileDownloadInfo)initWithCoder:(id)a3;
- (GEORequestCounterProactiveTileDownloadInfo)initWithIdentifier:(id)a3 policies:(id)a4;
- (NSArray)policies;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEORequestCounterProactiveTileDownloadInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORequestCounterProactiveTileDownloadInfo)initWithIdentifier:(id)a3 policies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterProactiveTileDownloadInfo;
  v8 = [(GEORequestCounterProactiveTileDownloadInfo *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    policies = v8->_policies;
    v8->_policies = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (GEORequestCounterProactiveTileDownloadInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterProactiveTileDownloadInfo;
  v5 = [(GEORequestCounterProactiveTileDownloadInfo *)&v15 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        v5->_identifier))
  {
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"policies"];
    policies = v5->_policies;
    v5->_policies = (NSArray *)v11;

    v13 = v5;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_policies forKey:@"policies"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)policies
{
  return self->_policies;
}

@end