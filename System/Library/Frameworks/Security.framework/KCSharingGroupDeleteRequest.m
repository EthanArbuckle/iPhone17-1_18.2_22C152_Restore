@interface KCSharingGroupDeleteRequest
+ (BOOL)supportsSecureCoding;
- (KCSharingGroupDeleteRequest)initWithCoder:(id)a3;
- (KCSharingGroupDeleteRequest)initWithGroupID:(id)a3;
- (NSString)groupID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupDeleteRequest

- (void).cxx_destruct
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingGroupDeleteRequest *)self groupID];
  [v4 encodeObject:v5 forKey:@"groupID"];
}

- (KCSharingGroupDeleteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupDeleteRequest;
  id v5 = [(KCSharingGroupDeleteRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;
  }
  return v5;
}

- (KCSharingGroupDeleteRequest)initWithGroupID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupDeleteRequest;
  uint64_t v6 = [(KCSharingGroupDeleteRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end