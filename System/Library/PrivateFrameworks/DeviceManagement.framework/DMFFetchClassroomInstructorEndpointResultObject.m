@interface DMFFetchClassroomInstructorEndpointResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchClassroomInstructorEndpointResultObject)initWithCoder:(id)a3;
- (DMFFetchClassroomInstructorEndpointResultObject)initWithEndpoint:(id)a3;
- (NSXPCListenerEndpoint)endpoint;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchClassroomInstructorEndpointResultObject

- (DMFFetchClassroomInstructorEndpointResultObject)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  v6 = [(CATTaskResultObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchClassroomInstructorEndpointResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  id v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchClassroomInstructorEndpointResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  id v5 = [(DMFFetchClassroomInstructorEndpointResultObject *)self endpoint];
  [v4 encodeObject:v5 forKey:@"endpoint"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DMFFetchClassroomInstructorEndpointResultObject *)self endpoint];
  objc_super v6 = [v3 stringWithFormat:@"<%@: %p {\n\tEndpoint: %@\n}>", v4, self, v5];

  return v6;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
}

@end