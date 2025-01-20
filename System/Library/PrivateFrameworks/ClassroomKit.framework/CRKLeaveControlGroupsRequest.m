@interface CRKLeaveControlGroupsRequest
+ (BOOL)supportsSecureCoding;
- (CRKLeaveControlGroupsRequest)initWithCoder:(id)a3;
- (NSSet)groupIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifiers:(id)a3;
@end

@implementation CRKLeaveControlGroupsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKLeaveControlGroupsRequest)initWithCoder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CRKLeaveControlGroupsRequest.m", 22, @"Invalid parameter not satisfying: %@", @"aDecoder" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)CRKLeaveControlGroupsRequest;
  v6 = [(CATTaskRequest *)&v14 initWithCoder:v5];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v5 decodeObjectOfClasses:v9 forKey:@"groupIdentifiers"];
    groupIdentifiers = v6->_groupIdentifiers;
    v6->_groupIdentifiers = (NSSet *)v10;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CRKLeaveControlGroupsRequest.m", 33, @"Invalid parameter not satisfying: %@", @"aCoder" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)CRKLeaveControlGroupsRequest;
  [(CATTaskRequest *)&v8 encodeWithCoder:v5];
  v6 = [(CRKLeaveControlGroupsRequest *)self groupIdentifiers];
  [v5 encodeObject:v6 forKey:@"groupIdentifiers"];
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void)setGroupIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end