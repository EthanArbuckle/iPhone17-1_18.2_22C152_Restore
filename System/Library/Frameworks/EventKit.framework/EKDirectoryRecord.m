@interface EKDirectoryRecord
+ (id)recordFromSearchResult:(id)a3;
- (NSDictionary)userInfo;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)preferredAddress;
- (NSString)principalPath;
- (id)description;
- (void)setDisplayName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPreferredAddress:(id)a3;
- (void)setPrincipalPath:(id)a3;
@end

@implementation EKDirectoryRecord

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v11.receiver = self;
  v11.super_class = (Class)EKDirectoryRecord;
  v4 = [(EKDirectoryRecord *)&v11 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  v6 = [(EKDirectoryRecord *)self displayName];
  [v5 setKey:@"displayName" withString:v6];

  v7 = [(EKDirectoryRecord *)self preferredAddress];
  [v5 setKey:@"preferredAddress" withString:v7];

  v8 = [(EKDirectoryRecord *)self principalPath];
  [v5 setKey:@"principalPath" withString:v8];

  v9 = [v5 build];

  return v9;
}

- (NSDictionary)userInfo
{
  id v3 = objc_opt_new();
  v4 = [(EKDirectoryRecord *)self principalPath];

  if (v4)
  {
    v5 = [(EKDirectoryRecord *)self principalPath];
    [v3 setObject:v5 forKeyedSubscript:EKDirectoryRecordPrincipalPathKey];
  }

  return (NSDictionary *)v3;
}

+ (id)recordFromSearchResult:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 displayName];
  [v4 setDisplayName:v5];

  v6 = [v3 firstName];
  [v4 setFirstName:v6];

  v7 = [v3 lastName];
  [v4 setLastName:v7];

  v8 = [v3 preferredAddress];

  [v4 setPreferredAddress:v8];

  return v4;
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