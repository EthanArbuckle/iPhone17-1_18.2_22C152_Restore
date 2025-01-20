@interface DAECalendarDirectorySearchResult
+ (BOOL)supportsSecureCoding;
- (DAECalendarDirectorySearchResult)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)preferredAddress;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPreferredAddress:(id)a3;
@end

@implementation DAECalendarDirectorySearchResult

- (id)description
{
  id v3 = [NSString alloc];
  v9.receiver = self;
  v9.super_class = (Class)DAECalendarDirectorySearchResult;
  v4 = [(DAECalendarDirectorySearchResult *)&v9 description];
  v5 = [(DAECalendarDirectorySearchResult *)self displayName];
  v6 = [(DAECalendarDirectorySearchResult *)self preferredAddress];
  v7 = (void *)[v3 initWithFormat:@"[%@] displayName: [%@] preferredAddress: [%@]", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAECalendarDirectorySearchResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAECalendarDirectorySearchResult *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(DAECalendarDirectorySearchResult *)v5 setDisplayName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredAddress"];
    [(DAECalendarDirectorySearchResult *)v5 setPreferredAddress:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAECalendarDirectorySearchResult *)self displayName];
  [v4 encodeObject:v5 forKey:@"displayName"];

  id v6 = [(DAECalendarDirectorySearchResult *)self preferredAddress];
  [v4 encodeObject:v6 forKey:@"preferredAddress"];
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)preferredAddress
{
  return self->_preferredAddress;
}

- (void)setPreferredAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAddress, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end