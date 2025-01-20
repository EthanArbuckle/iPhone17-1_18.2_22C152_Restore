@interface KCSharingGroupCreateRequest
+ (BOOL)supportsSecureCoding;
- (KCSharingGroup)group;
- (KCSharingGroupCreateRequest)initWithCoder:(id)a3;
- (KCSharingGroupCreateRequest)initWithNewGroup:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation KCSharingGroupCreateRequest

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
  id v5 = [(KCSharingGroupCreateRequest *)self group];
  [v4 encodeObject:v5 forKey:@"group"];
}

- (KCSharingGroupCreateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupCreateRequest;
  id v5 = [(KCSharingGroupCreateRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = v5->_group;
    v5->_group = (KCSharingGroup *)v6;
  }
  return v5;
}

- (KCSharingGroupCreateRequest)initWithNewGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupCreateRequest;
  uint64_t v6 = [(KCSharingGroupCreateRequest *)&v9 init];
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