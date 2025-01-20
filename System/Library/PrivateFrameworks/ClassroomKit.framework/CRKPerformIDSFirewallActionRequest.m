@interface CRKPerformIDSFirewallActionRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKPerformIDSFirewallActionRequest)initWithCoder:(id)a3;
- (NSSet)allowedAppleIDs;
- (int64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setAllowedAppleIDs:(id)a3;
@end

@implementation CRKPerformIDSFirewallActionRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKPerformIDSFirewallActionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKPerformIDSFirewallActionRequest action](self, "action", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"action"];

  v6 = [(CRKPerformIDSFirewallActionRequest *)self allowedAppleIDs];
  [v4 encodeObject:v6 forKey:@"allowedAppleIDs"];
}

- (CRKPerformIDSFirewallActionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKPerformIDSFirewallActionRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v5->_action = [v6 integerValue];

    objc_super v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"allowedAppleIDs"];
    allowedAppleIDs = v5->_allowedAppleIDs;
    v5->_allowedAppleIDs = (NSSet *)v10;
  }
  return v5;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSSet)allowedAppleIDs
{
  return self->_allowedAppleIDs;
}

- (void)setAllowedAppleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end