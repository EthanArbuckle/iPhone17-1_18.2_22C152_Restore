@interface DMFMDMv1InstallAppResultObject
+ (BOOL)supportsSecureCoding;
- (DMFMDMv1InstallAppResultObject)initWithBundleIdentifier:(id)a3 state:(unint64_t)a4;
- (DMFMDMv1InstallAppResultObject)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFMDMv1InstallAppResultObject

- (DMFMDMv1InstallAppResultObject)initWithBundleIdentifier:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFMDMv1InstallAppResultObject;
  v7 = [(CATTaskResultObject *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_state = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFMDMv1InstallAppResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFMDMv1InstallAppResultObject;
  v5 = [(CATTaskResultObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = [v9 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFMDMv1InstallAppResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(DMFMDMv1InstallAppResultObject *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFMDMv1InstallAppResultObject state](self, "state"));
  [v4 encodeObject:v6 forKey:@"state"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {", objc_opt_class(), self];
  id v4 = [(DMFMDMv1InstallAppResultObject *)self bundleIdentifier];
  [v3 appendFormat:@"\n\tBundle Identifier : %@", v4];

  v5 = +[DMFAppManagementInformation stringForState:[(DMFMDMv1InstallAppResultObject *)self state]];
  [v3 appendFormat:@"\n\tState             : %@", v5];

  [v3 appendString:@"\n}>"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end