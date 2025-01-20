@interface CRKSetCoursePermissionRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetCoursePermissionRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSNumber)permission;
- (NSString)feature;
- (void)encodeWithCoder:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setFeature:(id)a3;
- (void)setPermission:(id)a3;
@end

@implementation CRKSetCoursePermissionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCoursePermissionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKSetCoursePermissionRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"feature"];
    feature = v5->_feature;
    v5->_feature = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"permission"];
    permission = v5->_permission;
    v5->_permission = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKSetCoursePermissionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(CRKSetCoursePermissionRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKSetCoursePermissionRequest *)self feature];
  [v4 encodeObject:v6 forKey:@"feature"];

  uint64_t v7 = [(CRKSetCoursePermissionRequest *)self permission];
  [v4 encodeObject:v7 forKey:@"permission"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (NSNumber)permission
{
  return self->_permission;
}

- (void)setPermission:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permission, 0);
  objc_storeStrong((id *)&self->_feature, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end