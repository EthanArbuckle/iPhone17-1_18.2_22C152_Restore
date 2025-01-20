@interface NEAOVPNException
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isLimitedToUDP;
- (NEAOVPNException)initWithCoder:(id)a3;
- (NSArray)limitToProtocols;
- (NSString)bundleIdentifier;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int64_t)action;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLimitToProtocols:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NEAOVPNException

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitToProtocols, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setLimitToProtocols:(id)a3
{
}

- (NSArray)limitToProtocols
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isLimitedToUDP
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NEAOVPNException *)self limitToProtocols];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isEqualToString:@"UDP"])
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8 = [(NEAOVPNException *)self serviceName];
  [v7 appendPrettyObject:v8 withName:@"service-name" andIndent:v5 options:a4];

  long long v9 = [(NEAOVPNException *)self bundleIdentifier];
  [v7 appendPrettyObject:v9 withName:@"bundle-identifier" andIndent:v5 options:a4];

  long long v10 = [(NEAOVPNException *)self limitToProtocols];
  [v7 appendPrettyObject:v10 withName:@"limit-to-protocols" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEAOVPNException action](self, "action"), @"action", v5, a4);

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAOVPNException *)self serviceName];

  if (!v5) {
    goto LABEL_8;
  }
  v6 = [(NEAOVPNException *)self serviceName];
  if ([v6 isEqualToString:@"AirPrint"]) {
    goto LABEL_7;
  }
  id v7 = [(NEAOVPNException *)self serviceName];
  if ([v7 isEqualToString:@"VoiceMail"])
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v8 = [(NEAOVPNException *)self serviceName];
  if ([v8 isEqualToString:@"CellularServices"])
  {

    goto LABEL_6;
  }
  long long v11 = [(NEAOVPNException *)self serviceName];
  char v12 = [v11 isEqualToString:@"DeviceCommunication"];

  if ((v12 & 1) == 0)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid service name for service exception", v4);
    BOOL v9 = 0;
    goto LABEL_9;
  }
LABEL_8:
  BOOL v9 = 1;
LABEL_9:
  if ([(NEAOVPNException *)self action] != 1 && [(NEAOVPNException *)self action] != 2)
  {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid action for service exception", v4);
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEAOVPNException allocWithZone:a3] init];
  uint64_t v5 = [(NEAOVPNException *)self serviceName];
  [(NEAOVPNException *)v4 setServiceName:v5];

  v6 = [(NEAOVPNException *)self bundleIdentifier];
  [(NEAOVPNException *)v4 setBundleIdentifier:v6];

  id v7 = [(NEAOVPNException *)self limitToProtocols];
  [(NEAOVPNException *)v4 setLimitToProtocols:v7];

  [(NEAOVPNException *)v4 setAction:[(NEAOVPNException *)self action]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(NEAOVPNException *)self serviceName];
  [v7 encodeObject:v4 forKey:@"ServiceName"];

  uint64_t v5 = [(NEAOVPNException *)self bundleIdentifier];
  [v7 encodeObject:v5 forKey:@"BundleIdentifier"];

  v6 = [(NEAOVPNException *)self limitToProtocols];
  [v7 encodeObject:v6 forKey:@"LimitToProtocols"];

  objc_msgSend(v7, "encodeInt32:forKey:", -[NEAOVPNException action](self, "action"), @"Action");
}

- (NEAOVPNException)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NEAOVPNException;
  uint64_t v5 = [(NEAOVPNException *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServiceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    long long v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    char v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"LimitToProtocols"];
    limitToProtocols = v5->_limitToProtocols;
    v5->_limitToProtocols = (NSArray *)v13;

    v5->_action = (int)[v4 decodeInt32ForKey:@"Action"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end