@interface _SWMutableCollaborationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_SWMutableCollaborationMetadata)initWithCoder:(id)a3;
- (_SWMutableCollaborationMetadata)initWithCollaborationIdentifier:(id)a3;
- (_SWMutableCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SWMutableCollaborationMetadata

- (_SWMutableCollaborationMetadata)initWithCollaborationIdentifier:(id)a3
{
  return [(SWCollaborationMetadata *)self initWithCollaborationIdentifier:a3 title:0 defaultShareOptions:0 initiatorHandle:0 initiatorNameComponents:0];
}

- (_SWMutableCollaborationMetadata)initWithLocalIdentifier:(id)a3 collaborationIdentifier:(id)a4
{
  return [(SWCollaborationMetadata *)self initWithLocalIdentifier:a3 collaborationIdentifier:a4 title:0 defaultShareOptions:0 initiatorHandle:0 initiatorNameComponents:0];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SWMutableCollaborationMetadata;
  if ([(SWCollaborationMetadata *)&v11 isEqual:v5])
  {
    v6 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
    if (v6 || ([v5 ckAppBundleIDs], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
      v8 = [v5 ckAppBundleIDs];
      char v9 = [v7 isEqual:v8];

      if (v6)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v9 = 1;
    }

    goto LABEL_9;
  }
  char v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_SWMutableCollaborationMetadata;
  unint64_t v3 = [(SWCollaborationMetadata *)&v7 hash];
  v4 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SWMutableCollaborationMetadata;
  id v4 = [(SWCollaborationMetadata *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SWCollaborationMetadata *)self ckAppBundleIDs];

  if (v5)
  {
    v6 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
    [v4 setCkAppBundleIDs:v6];
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SWMutableCollaborationMetadata;
  id v4 = [(SWCollaborationMetadata *)&v8 mutableCopyWithZone:a3];
  unint64_t v5 = [(SWCollaborationMetadata *)self ckAppBundleIDs];

  if (v5)
  {
    v6 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
    [v4 setCkAppBundleIDs:v6];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SWMutableCollaborationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SWMutableCollaborationMetadata;
  unint64_t v5 = [(SWCollaborationMetadata *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    char v9 = NSStringFromSelector(sel_ckAppBundleIDs);
    v10 = [v4 decodeObjectOfClasses:v8 forKey:v9];
    [(SWCollaborationMetadata *)v5 setCkAppBundleIDs:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SWMutableCollaborationMetadata;
  id v4 = a3;
  [(SWCollaborationMetadata *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(SWCollaborationMetadata *)self ckAppBundleIDs];
  v6 = NSStringFromSelector(sel_ckAppBundleIDs);
  [v4 encodeObject:v5 forKey:v6];
}

@end