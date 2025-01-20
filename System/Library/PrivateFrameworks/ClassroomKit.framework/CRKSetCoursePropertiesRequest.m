@interface CRKSetCoursePropertiesRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetCoursePropertiesRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSArray)anchorCertificates;
- (NSString)courseDescription;
- (NSString)courseName;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorCertificates:(id)a3;
- (void)setCourseDescription:(id)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setCourseName:(id)a3;
@end

@implementation CRKSetCoursePropertiesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCoursePropertiesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKSetCoursePropertiesRequest;
  v5 = [(CATTaskRequest *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"courseIdentifier"];
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"courseName"];
    courseName = v5->_courseName;
    v5->_courseName = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"courseDescription"];
    courseDescription = v5->_courseDescription;
    v5->_courseDescription = (NSString *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"anchorCertificates"];
    anchorCertificates = v5->_anchorCertificates;
    v5->_anchorCertificates = (NSArray *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKSetCoursePropertiesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(CRKSetCoursePropertiesRequest *)self courseIdentifier];
  [v4 encodeObject:v5 forKey:@"courseIdentifier"];

  v6 = [(CRKSetCoursePropertiesRequest *)self courseName];
  [v4 encodeObject:v6 forKey:@"courseName"];

  uint64_t v7 = [(CRKSetCoursePropertiesRequest *)self courseDescription];
  [v4 encodeObject:v7 forKey:@"courseDescription"];

  v8 = [(CRKSetCoursePropertiesRequest *)self anchorCertificates];
  [v4 encodeObject:v8 forKey:@"anchorCertificates"];
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)courseName
{
  return self->_courseName;
}

- (void)setCourseName:(id)a3
{
}

- (NSString)courseDescription
{
  return self->_courseDescription;
}

- (void)setCourseDescription:(id)a3
{
}

- (NSArray)anchorCertificates
{
  return self->_anchorCertificates;
}

- (void)setAnchorCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificates, 0);
  objc_storeStrong((id *)&self->_courseDescription, 0);
  objc_storeStrong((id *)&self->_courseName, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end