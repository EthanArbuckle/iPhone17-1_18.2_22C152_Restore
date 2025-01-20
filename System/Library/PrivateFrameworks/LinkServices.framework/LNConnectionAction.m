@interface LNConnectionAction
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (LNConnectionAction)initWithBSXPCCoder:(id)a3;
- (LNConnectionAction)initWithCoder:(id)a3;
- (LNConnectionAction)initWithIdentifier:(id)a3 metadataVersion:(int64_t)a4;
- (NSString)description;
- (NSUUID)identifier;
- (int64_t)metadataVersion;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConnectionAction

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  v4 = [(LNConnectionAction *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), @"metadataVersion");
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(LNConnectionAction *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)metadataVersion
{
  return self->_metadataVersion;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (LNConnectionAction)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    self = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, [v4 decodeInt64ForKey:@"metadataVersion"]);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNConnectionAction)initWithIdentifier:(id)a3 metadataVersion:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNConnectionAction.m", 92, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNConnectionAction;
  v9 = [(LNConnectionAction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_metadataVersion = a4;
    v11 = v10;
  }

  return v10;
}

- (LNConnectionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    self = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, [v4 decodeIntegerForKey:@"metadataVersion"]);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(LNConnectionAction *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), @"metadataVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end