@interface KCSharingGroupUpdateRequest
+ (BOOL)supportsSecureCoding;
- (KCSharingGroup)group;
- (KCSharingGroupUpdateRequest)initWithCoder:(id)a3;
- (KCSharingGroupUpdateRequest)initWithUpdatedGroup:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupUpdateRequest

- (void).cxx_destruct
{
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KCSharingGroupUpdateRequest *)self group];
  [v4 encodeObject:v5 forKey:@"group"];
}

- (KCSharingGroupUpdateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupUpdateRequest;
  id v5 = [(KCSharingGroupUpdateRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = v5->_group;
    v5->_group = (KCSharingGroup *)v6;
  }
  return v5;
}

- (KCSharingGroupUpdateRequest)initWithUpdatedGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupUpdateRequest;
  uint64_t v6 = [(KCSharingGroupUpdateRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_group, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end