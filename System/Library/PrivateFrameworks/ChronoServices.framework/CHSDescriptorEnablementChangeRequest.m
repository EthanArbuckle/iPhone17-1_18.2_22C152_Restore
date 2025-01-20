@interface CHSDescriptorEnablementChangeRequest
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)enabled;
- (CHSDescriptorEnablementChangeRequest)initWithBSXPCCoder:(id)a3;
- (CHSDescriptorEnablementChangeRequest)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 enabled:(BOOL)a5;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHSDescriptorEnablementChangeRequest

- (CHSDescriptorEnablementChangeRequest)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 enabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSDescriptorEnablementChangeRequest;
  v11 = [(CHSDescriptorEnablementChangeRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extensionBundleIdentifier, a3);
    objc_storeStrong((id *)&v12->_kind, a4);
    v12->_enabled = a5;
  }

  return v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeBool:self->_enabled forKey:@"enabled"];
}

- (CHSDescriptorEnablementChangeRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  v7 = -[CHSDescriptorEnablementChangeRequest initWithExtensionBundleIdentifier:kind:enabled:](self, "initWithExtensionBundleIdentifier:kind:enabled:", v5, v6, [v4 decodeBoolForKey:@"enabled"]);

  return v7;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end