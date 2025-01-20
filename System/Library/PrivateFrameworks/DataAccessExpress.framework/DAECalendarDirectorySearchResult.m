@interface DAECalendarDirectorySearchResult
+ (BOOL)supportsSecureCoding;
- (DAECalendarDirectorySearchResult)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)preferredAddress;
- (NSString)principalPath;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPreferredAddress:(id)a3;
- (void)setPrincipalPath:(id)a3;
@end

@implementation DAECalendarDirectorySearchResult

- (id)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)DAECalendarDirectorySearchResult;
  v4 = [(DAECalendarDirectorySearchResult *)&v10 description];
  v5 = [(DAECalendarDirectorySearchResult *)self displayName];
  v6 = [(DAECalendarDirectorySearchResult *)self preferredAddress];
  v7 = [(DAECalendarDirectorySearchResult *)self principalPath];
  v8 = (void *)[v3 initWithFormat:@"[%@] displayName: [%@] preferredAddress: [%@] principalPath: [%@]", v4, v5, v6, v7];

  return v8;
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

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    [(DAECalendarDirectorySearchResult *)v5 setFirstName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    [(DAECalendarDirectorySearchResult *)v5 setLastName:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredAddress"];
    [(DAECalendarDirectorySearchResult *)v5 setPreferredAddress:v9];

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"principalPath"];
    [(DAECalendarDirectorySearchResult *)v5 setPrincipalPath:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAECalendarDirectorySearchResult *)self displayName];
  [v4 encodeObject:v5 forKey:@"displayName"];

  v6 = [(DAECalendarDirectorySearchResult *)self firstName];
  [v4 encodeObject:v6 forKey:@"firstName"];

  v7 = [(DAECalendarDirectorySearchResult *)self lastName];
  [v4 encodeObject:v7 forKey:@"lastName"];

  v8 = [(DAECalendarDirectorySearchResult *)self preferredAddress];
  [v4 encodeObject:v8 forKey:@"preferredAddress"];

  id v9 = [(DAECalendarDirectorySearchResult *)self principalPath];
  [v4 encodeObject:v9 forKey:@"principalPath"];
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)preferredAddress
{
  return self->_preferredAddress;
}

- (void)setPreferredAddress:(id)a3
{
}

- (NSString)principalPath
{
  return self->_principalPath;
}

- (void)setPrincipalPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principalPath, 0);
  objc_storeStrong((id *)&self->_preferredAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end