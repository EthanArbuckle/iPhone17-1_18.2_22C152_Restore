@interface CRKFetchInstructorEndpointRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchInstructorEndpointRequest)initWithCoder:(id)a3;
- (NSString)instructordBundleIdentifier;
- (NSURL)classroomAppBundleURL;
- (void)encodeWithCoder:(id)a3;
- (void)setClassroomAppBundleURL:(id)a3;
- (void)setInstructordBundleIdentifier:(id)a3;
@end

@implementation CRKFetchInstructorEndpointRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchInstructorEndpointRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchInstructorEndpointRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"classroomAppBundleURL"];
    classroomAppBundleURL = v5->_classroomAppBundleURL;
    v5->_classroomAppBundleURL = (NSURL *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"instructordBundleIdentifier"];
    instructordBundleIdentifier = v5->_instructordBundleIdentifier;
    v5->_instructordBundleIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchInstructorEndpointRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchInstructorEndpointRequest *)self classroomAppBundleURL];
  [v4 encodeObject:v5 forKey:@"classroomAppBundleURL"];

  v6 = [(CRKFetchInstructorEndpointRequest *)self instructordBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"instructordBundleIdentifier"];
}

- (NSURL)classroomAppBundleURL
{
  return self->_classroomAppBundleURL;
}

- (void)setClassroomAppBundleURL:(id)a3
{
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void)setInstructordBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_classroomAppBundleURL, 0);
}

@end