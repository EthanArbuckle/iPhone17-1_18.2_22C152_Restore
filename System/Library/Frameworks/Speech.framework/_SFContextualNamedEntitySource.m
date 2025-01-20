@interface _SFContextualNamedEntitySource
+ (BOOL)supportsSecureCoding;
- (NSArray)sourceApplications;
- (NSDate)fromDate;
- (NSDate)toDate;
- (_SFContextualNamedEntitySource)initWithCoder:(id)a3;
- (_SFContextualNamedEntitySource)initWithSourceApplications:(id)a3 fromDate:(id)a4 toDate:(id)a5 limit:(int64_t)a6;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFContextualNamedEntitySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);

  objc_storeStrong((id *)&self->_sourceApplications, 0);
}

- (int64_t)limit
{
  return self->_limit;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSArray)sourceApplications
{
  return self->_sourceApplications;
}

- (_SFContextualNamedEntitySource)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFContextualNamedEntitySource;
  v5 = [(_SFContextualNamedEntitySource *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_sourceApplications"];
    sourceApplications = v5->_sourceApplications;
    v5->_sourceApplications = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fromDate"];
    fromDate = v5->_fromDate;
    v5->_fromDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_toDate"];
    toDate = v5->_toDate;
    v5->_toDate = (NSDate *)v10;

    v5->_limit = [v4 decodeIntegerForKey:@"_limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceApplications = self->_sourceApplications;
  id v5 = a3;
  [v5 encodeObject:sourceApplications forKey:@"_sourceApplications"];
  [v5 encodeObject:self->_fromDate forKey:@"_fromDate"];
  [v5 encodeObject:self->_toDate forKey:@"_toDate"];
  [v5 encodeInteger:self->_limit forKey:@"_limit"];
}

- (_SFContextualNamedEntitySource)initWithSourceApplications:(id)a3 fromDate:(id)a4 toDate:(id)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_SFContextualNamedEntitySource;
  objc_super v13 = [(_SFContextualNamedEntitySource *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    sourceApplications = v13->_sourceApplications;
    v13->_sourceApplications = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    fromDate = v13->_fromDate;
    v13->_fromDate = (NSDate *)v16;

    uint64_t v18 = [v12 copy];
    toDate = v13->_toDate;
    v13->_toDate = (NSDate *)v18;

    v13->_limit = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end