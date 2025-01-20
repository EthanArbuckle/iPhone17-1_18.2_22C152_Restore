@interface _SFContextualRankedContactSource
+ (BOOL)supportsSecureCoding;
- (BOOL)contactOnly;
- (NSDate)rankDate;
- (NSString)sourceApplication;
- (_SFContextualRankedContactSource)initWithCoder:(id)a3;
- (_SFContextualRankedContactSource)initWithSourceApplication:(id)a3 rankDate:(id)a4 contactOnly:(BOOL)a5 limit:(int64_t)a6;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFContextualRankedContactSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankDate, 0);

  objc_storeStrong((id *)&self->_sourceApplication, 0);
}

- (int64_t)limit
{
  return self->_limit;
}

- (BOOL)contactOnly
{
  return self->_contactOnly;
}

- (NSDate)rankDate
{
  return self->_rankDate;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (_SFContextualRankedContactSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFContextualRankedContactSource;
  v5 = [(_SFContextualRankedContactSource *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceApplication"];
    sourceApplication = v5->_sourceApplication;
    v5->_sourceApplication = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rankDate"];
    rankDate = v5->_rankDate;
    v5->_rankDate = (NSDate *)v8;

    v5->_contactOnly = [v4 decodeBoolForKey:@"_contactOnly"];
    v5->_limit = [v4 decodeIntegerForKey:@"_limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceApplication = self->_sourceApplication;
  id v5 = a3;
  [v5 encodeObject:sourceApplication forKey:@"_sourceApplication"];
  [v5 encodeObject:self->_rankDate forKey:@"_rankDate"];
  [v5 encodeBool:self->_contactOnly forKey:@"_contactOnly"];
  [v5 encodeInteger:self->_limit forKey:@"_limit"];
}

- (_SFContextualRankedContactSource)initWithSourceApplication:(id)a3 rankDate:(id)a4 contactOnly:(BOOL)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFContextualRankedContactSource;
  v12 = [(_SFContextualRankedContactSource *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    sourceApplication = v12->_sourceApplication;
    v12->_sourceApplication = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    rankDate = v12->_rankDate;
    v12->_rankDate = (NSDate *)v15;

    v12->_contactOnly = a5;
    v12->_limit = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end