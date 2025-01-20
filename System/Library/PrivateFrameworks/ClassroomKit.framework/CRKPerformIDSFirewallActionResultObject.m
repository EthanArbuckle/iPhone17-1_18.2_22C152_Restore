@interface CRKPerformIDSFirewallActionResultObject
+ (BOOL)supportsSecureCoding;
- (CRKPerformIDSFirewallActionResultObject)initWithCoder:(id)a3;
- (NSSet)allowedAppleIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedAppleIDs:(id)a3;
@end

@implementation CRKPerformIDSFirewallActionResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKPerformIDSFirewallActionResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKPerformIDSFirewallActionResultObject *)self allowedAppleIDs];
  [v4 encodeObject:v5 forKey:@"allowedAppleIDs"];
}

- (CRKPerformIDSFirewallActionResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKPerformIDSFirewallActionResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"allowedAppleIDs"];
    allowedAppleIDs = v5->_allowedAppleIDs;
    v5->_allowedAppleIDs = (NSSet *)v9;
  }
  return v5;
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