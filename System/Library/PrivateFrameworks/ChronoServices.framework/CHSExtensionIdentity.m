@interface CHSExtensionIdentity
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemote;
- (CHSExtensionIdentity)init;
- (CHSExtensionIdentity)initWithBSXPCCoder:(id)a3;
- (CHSExtensionIdentity)initWithCoder:(id)a3;
- (CHSExtensionIdentity)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 deviceIdentifier:(id)a5;
- (CHSExtensionIdentity)initWithXPCDictionary:(id)a3;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)tokenString;
- (int64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation CHSExtensionIdentity

- (BOOL)isRemote
{
  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_deviceIdentifier;
  swift_beginAccess();
  return *((void *)v2 + 1) != 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CHSExtensionIdentity *)self extensionBundleIdentifier];
  [v7 encodeObject:v4 forKey:@"extensionBundleIdentifier"];

  v5 = [(CHSExtensionIdentity *)self containerBundleIdentifier];
  [v7 encodeObject:v5 forKey:@"containerBundleIdentifier"];

  v6 = [(CHSExtensionIdentity *)self deviceIdentifier];
  [v7 encodeObject:v6 forKey:@"deviceIdentifier"];
}

- (CHSExtensionIdentity)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    self = [(CHSExtensionIdentity *)self initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v9 = a3;
  id v4 = [(CHSExtensionIdentity *)self extensionBundleIdentifier];
  BSSerializeStringToXPCDictionaryWithKey();

  v5 = [(CHSExtensionIdentity *)self containerBundleIdentifier];

  if (v5)
  {
    v6 = [(CHSExtensionIdentity *)self containerBundleIdentifier];
    BSSerializeStringToXPCDictionaryWithKey();
  }
  id v7 = [(CHSExtensionIdentity *)self deviceIdentifier];

  if (v7)
  {
    v8 = [(CHSExtensionIdentity *)self deviceIdentifier];
    BSSerializeStringToXPCDictionaryWithKey();
  }
}

- (CHSExtensionIdentity)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  if (v5)
  {
    v6 = BSDeserializeStringFromXPCDictionaryWithKey();
    id v7 = BSDeserializeStringFromXPCDictionaryWithKey();
    self = [(CHSExtensionIdentity *)self initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CHSExtensionIdentity *)self extensionBundleIdentifier];
  [v7 encodeObject:v4 forKey:@"extensionBundleIdentifier"];

  v5 = [(CHSExtensionIdentity *)self containerBundleIdentifier];
  [v7 encodeObject:v5 forKey:@"containerBundleIdentifier"];

  v6 = [(CHSExtensionIdentity *)self deviceIdentifier];
  [v7 encodeObject:v6 forKey:@"deviceIdentifier"];
}

- (CHSExtensionIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    self = [(CHSExtensionIdentity *)self initWithExtensionBundleIdentifier:v5 containerBundleIdentifier:v6 deviceIdentifier:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)tokenString
{
  v2 = self;
  CHSExtensionIdentity.tokenString.getter();

  v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)extensionBundleIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)containerBundleIdentifier
{
  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_containerBundleIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)deviceIdentifier
{
  v2 = (char *)self + OBJC_IVAR___CHSExtensionIdentity_deviceIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (CHSExtensionIdentity)init
{
  return (CHSExtensionIdentity *)sub_190CFE168();
}

- (CHSExtensionIdentity)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  uint64_t v7 = sub_190D41978();
  uint64_t v9 = v8;
  if (!a4)
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    return (CHSExtensionIdentity *)sub_190CFE240(v7, v9, (uint64_t)a4, v11, v12, v14);
  }
  a4 = (id)sub_190D41978();
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = sub_190D41978();
  uint64_t v14 = v13;
  return (CHSExtensionIdentity *)sub_190CFE240(v7, v9, (uint64_t)a4, v11, v12, v14);
}

- (NSString)description
{
  v2 = self;
  CHSExtensionIdentity.token.getter(&v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92AAAA0);
  sub_190CD4928((unint64_t *)&qword_1E92AAAB0, (uint64_t *)&unk_1E92AAAA0);
  sub_190D418E8();

  swift_bridgeObjectRelease_n();
  v3 = (void *)sub_190D41948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_190D41E78();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = CHSExtensionIdentity.isEqual(_:)((uint64_t)v8);

  sub_190CCE544((uint64_t)v8);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = CHSExtensionIdentity.hash.getter();

  return v3;
}

@end