@interface CRKSetActiveControlGroupRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetActiveControlGroupRequest)initWithCoder:(id)a3;
- (DMFControlGroupIdentifier)groupIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupIdentifier:(id)a3;
@end

@implementation CRKSetActiveControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetActiveControlGroupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSetActiveControlGroupRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSetActiveControlGroupRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKSetActiveControlGroupRequest *)self groupIdentifier];
  [v4 encodeObject:v5 forKey:@"groupIdentifier"];
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end