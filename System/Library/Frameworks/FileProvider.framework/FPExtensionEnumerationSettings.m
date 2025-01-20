@interface FPExtensionEnumerationSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)buildAndFilterAppLibraries;
- (BOOL)isPresenterEnumeration;
- (BOOL)isUnbounded;
- (BOOL)requireSandboxAccess;
- (BOOL)wantsDirectExtensionEnumeration;
- (FPExtensionEnumerationSettings)initWithCoder:(id)a3;
- (FPItemID)enumeratedItemID;
- (FPItemID)nullableEnumeratedItemID;
- (NSURL)enumeratedURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBuildAndFilterAppLibraries:(BOOL)a3;
- (void)setEnumeratedItemID:(id)a3;
- (void)setEnumeratedURL:(id)a3;
- (void)setNullableEnumeratedItemID:(id)a3;
- (void)setPresenterEnumeration:(BOOL)a3;
- (void)setRequireSandboxAccess:(BOOL)a3;
- (void)setUnbounded:(BOOL)a3;
- (void)setWantsDirectExtensionEnumeration:(BOOL)a3;
@end

@implementation FPExtensionEnumerationSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FPExtensionEnumerationSettings;
  v4 = [(FPEnumerationSettings *)&v11 copyWithZone:a3];
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(FPItemID *)v5->_enumeratedItemID copy];
  v7 = (void *)v4[3];
  v4[3] = v6;

  objc_sync_exit(v5);
  uint64_t v8 = [(NSURL *)v5->_enumeratedURL copy];
  v9 = (void *)v4[5];
  v4[5] = v8;

  *((unsigned char *)v4 + 33) = v5->_wantsDirectExtensionEnumeration;
  *((unsigned char *)v4 + 34) = v5->_requireSandboxAccess;
  *((unsigned char *)v4 + 36) = v5->_buildAndFilterAppLibraries;
  *((unsigned char *)v4 + 35) = v5->_unbounded;
  *((unsigned char *)v4 + 32) = v5->_presenterEnumeration;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FPExtensionEnumerationSettings;
  [(FPEnumerationSettings *)&v6 encodeWithCoder:v4];
  v5 = self;
  objc_sync_enter(v5);
  [v4 encodeObject:v5->_enumeratedItemID forKey:@"enumeratedItemID"];
  objc_sync_exit(v5);

  [v4 encodeObject:v5->_enumeratedURL forKey:@"enumeratedURL"];
  [v4 encodeBool:v5->_presenterEnumeration forKey:@"presenterEnumeration"];
  [v4 encodeBool:v5->_requireSandboxAccess forKey:@"requireSandboxAccess"];
  [v4 encodeBool:v5->_unbounded forKey:@"unbounded"];
  [v4 encodeBool:v5->_buildAndFilterAppLibraries forKey:@"buildAndFilterAppLibraries"];
  [v4 encodeBool:v5->_wantsDirectExtensionEnumeration forKey:@"wantsDirectExtensionEnumeration"];
}

- (FPExtensionEnumerationSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPExtensionEnumerationSettings;
  v5 = [(FPEnumerationSettings *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumeratedItemID"];
    enumeratedItemID = v5->_enumeratedItemID;
    v5->_enumeratedItemID = (FPItemID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enumeratedURL"];
    enumeratedURL = v5->_enumeratedURL;
    v5->_enumeratedURL = (NSURL *)v8;

    v5->_presenterEnumeration = [v4 decodeBoolForKey:@"presenterEnumeration"];
    v5->_requireSandboxAccess = [v4 decodeBoolForKey:@"requireSandboxAccess"];
    v5->_unbounded = [v4 decodeBoolForKey:@"unbounded"];
    v5->_buildAndFilterAppLibraries = [v4 decodeBoolForKey:@"buildAndFilterAppLibraries"];
    v5->_wantsDirectExtensionEnumeration = [v4 decodeBoolForKey:@"wantsDirectExtensionEnumeration"];
  }

  return v5;
}

- (FPItemID)nullableEnumeratedItemID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setNullableEnumeratedItemID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  enumeratedItemID = v4->_enumeratedItemID;
  v4->_enumeratedItemID = (FPItemID *)v5;

  objc_sync_exit(v4);
}

- (FPItemID)enumeratedItemID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  return v3;
}

- (void)setEnumeratedItemID:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  enumeratedItemID = v4->_enumeratedItemID;
  v4->_enumeratedItemID = (FPItemID *)v5;

  objc_sync_exit(v4);
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_enumeratedItemID;
  objc_sync_exit(v2);

  enumeratedURL = v2->_enumeratedURL;
  if (v2->_buildAndFilterAppLibraries) {
    uint64_t v5 = @"y";
  }
  else {
    uint64_t v5 = @"n";
  }
  if (enumeratedURL) {
    [NSString stringWithFormat:@"url:%@ s:%@, al:%@", enumeratedURL, v3, v5];
  }
  else {
  uint64_t v6 = [NSString stringWithFormat:@"s:%@, al:%@", v3, v5, v8];
  }

  return v6;
}

- (NSURL)enumeratedURL
{
  return self->_enumeratedURL;
}

- (void)setEnumeratedURL:(id)a3
{
}

- (BOOL)isPresenterEnumeration
{
  return self->_presenterEnumeration;
}

- (void)setPresenterEnumeration:(BOOL)a3
{
  self->_presenterEnumeration = a3;
}

- (BOOL)wantsDirectExtensionEnumeration
{
  return self->_wantsDirectExtensionEnumeration;
}

- (void)setWantsDirectExtensionEnumeration:(BOOL)a3
{
  self->_wantsDirectExtensionEnumeration = a3;
}

- (BOOL)requireSandboxAccess
{
  return self->_requireSandboxAccess;
}

- (void)setRequireSandboxAccess:(BOOL)a3
{
  self->_requireSandboxAccess = a3;
}

- (BOOL)isUnbounded
{
  return self->_unbounded;
}

- (void)setUnbounded:(BOOL)a3
{
  self->_unbounded = a3;
}

- (BOOL)buildAndFilterAppLibraries
{
  return self->_buildAndFilterAppLibraries;
}

- (void)setBuildAndFilterAppLibraries:(BOOL)a3
{
  self->_buildAndFilterAppLibraries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedURL, 0);

  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
}

@end