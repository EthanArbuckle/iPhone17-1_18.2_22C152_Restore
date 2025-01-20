@interface FBSSceneIdentity
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)identityForIdentifier:(id)a3;
+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4;
+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4 internalWorkspaceIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (FBSSceneIdentity)initWithBSXPCCoder:(id)a3;
- (FBSSceneIdentity)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)internalWorkspaceIdentifier;
- (NSString)workspaceIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FBSSceneIdentity

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (id)identityForIdentifier:(id)a3
{
  return (id)[a1 identityForIdentifier:a3 workspaceIdentifier:0 internalWorkspaceIdentifier:0];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBSSceneIdentity *)a3;
  if (self != v4) {
    BSEqualStrings();
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalWorkspaceIdentifier, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (NSString)description
{
  workspaceIdentifier = self->_workspaceIdentifier;
  internalWorkspaceIdentifier = self->_internalWorkspaceIdentifier;
  if (internalWorkspaceIdentifier)
  {
    identifier = self->_identifier;
    if (workspaceIdentifier) {
      [NSString stringWithFormat:@"%@(%@):%@", workspaceIdentifier, internalWorkspaceIdentifier, identifier];
    }
    else {
      [NSString stringWithFormat:@"(%@):%@", internalWorkspaceIdentifier, identifier, v7];
    }
    goto LABEL_7;
  }
  if (workspaceIdentifier)
  {
    [NSString stringWithFormat:@"%@:%@", workspaceIdentifier, self->_identifier, v7];
LABEL_7:
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v5 = self->_identifier;
LABEL_8:

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"i"];
  [v5 encodeObject:self->_workspaceIdentifier forKey:@"w"];
  [v5 encodeObject:self->_internalWorkspaceIdentifier forKey:@"iw"];
}

- (FBSSceneIdentity)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneIdentity *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"i"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeStringForKey:@"w"];
    workspaceIdentifier = v5->_workspaceIdentifier;
    v5->_workspaceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"iw"];
    internalWorkspaceIdentifier = v5->_internalWorkspaceIdentifier;
    v5->_internalWorkspaceIdentifier = (NSString *)v10;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4 internalWorkspaceIdentifier:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    v11 = objc_alloc_init((Class)a1);
    uint64_t v12 = [v10 copy];

    v13 = (void *)v11[1];
    v11[1] = v12;

    uint64_t v14 = [v9 copy];
    v15 = (void *)v11[2];
    v11[2] = v14;

    uint64_t v16 = [v8 copy];
    v17 = (void *)v11[3];
    v11[3] = v16;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)identityForIdentifier:(id)a3 workspaceIdentifier:(id)a4
{
  return (id)[a1 identityForIdentifier:a3 workspaceIdentifier:a4 internalWorkspaceIdentifier:0];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)internalWorkspaceIdentifier
{
  internalWorkspaceIdentifier = self->_internalWorkspaceIdentifier;
  if (!internalWorkspaceIdentifier) {
    internalWorkspaceIdentifier = self->_workspaceIdentifier;
  }
  return internalWorkspaceIdentifier;
}

- (BOOL)isValid
{
  return self->_identifier != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"i"];
  [v5 encodeObject:self->_workspaceIdentifier forKey:@"w"];
  [v5 encodeObject:self->_internalWorkspaceIdentifier forKey:@"iw"];
}

- (FBSSceneIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSceneIdentity *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"w"];
    workspaceIdentifier = v5->_workspaceIdentifier;
    v5->_workspaceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iw"];
    internalWorkspaceIdentifier = v5->_internalWorkspaceIdentifier;
    v5->_internalWorkspaceIdentifier = (NSString *)v10;
  }
  return v5;
}

@end