@interface _BRContainerItem
+ (BOOL)supportsSecureCoding;
- (BOOL)fp_isContainer;
- (BOOL)fp_isContainerPristine;
- (BOOL)isHidden;
- (BOOL)respondsToSelector:(SEL)a3;
- (_BRContainerItem)initWithCoder:(id)a3;
- (_BRContainerItem)initWithQueryItem:(id)a3 container:(id)a4 zoneRowID:(id)a5;
- (id)containerDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayName;
- (id)filename;
- (id)fp_cloudContainerClientBundleIdentifiers;
- (id)fp_cloudContainerIdentifier;
- (id)itemIdentifier;
- (id)parentItemIdentifier;
- (id)subclassDescription;
- (id)typeIdentifier;
- (unint64_t)capabilities;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _BRContainerItem

- (_BRContainerItem)initWithQueryItem:(id)a3 container:(id)a4 zoneRowID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v30.receiver = self;
    v30.super_class = (Class)_BRContainerItem;
    v11 = [(BRQueryItem *)&v30 initWithQueryItem:v8];
    if (v11)
    {
      uint64_t v12 = [v9 bundleIdentifiers];
      containerClientIDs = v11->_containerClientIDs;
      v11->_containerClientIDs = (NSSet *)v12;

      uint64_t v14 = [v9 identifier];
      containerID = v11->_containerID;
      v11->_containerID = (NSString *)v14;

      uint64_t v16 = [v9 localizedName];
      displayName = v11->_displayName;
      v11->_displayName = (NSString *)v16;

      if (BRIsFPFSEnabled(v18, v19))
      {
        uint64_t v20 = [v8 filename];
        localizedName = v11->_localizedName;
        v11->_localizedName = (NSString *)v20;

        if ([v9 isInInitialState]) {
          LOBYTE(v22) = 1;
        }
        else {
          int v22 = [v9 isDocumentScopePublic] ^ 1;
        }
        v11->_isPristine = v22;
        int v26 = [v9 isDocumentScopePublic];
        int v27 = 0x4000000;
        if (v26) {
          int v27 = 0;
        }
        unint64_t v28 = *(_DWORD *)&v11->super._flags.var0 & 0xFBFFFFFF | ((unint64_t)BYTE4(v11->super._flags.value) << 32);
        *(_DWORD *)&v11->super._flags.var0 = *(_DWORD *)&v11->super._flags.var0 & 0xFBFFFFFF | v27;
        BYTE4(v11->super._flags.value) = BYTE4(v28);
      }
      else
      {
        objc_storeStrong((id *)&v11->_localizedName, v11->_displayName);
        v11->_isPristine = [v9 isInInitialState];
        if (!v11->super._zoneRowID)
        {
          objc_storeStrong((id *)&v11->super._zoneRowID, a5);
          if (!v10)
          {
            v24 = brc_bread_crumbs((uint64_t)"-[_BRContainerItem initWithQueryItem:container:zoneRowID:]", 2619);
            v25 = brc_default_log(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
              -[_BRContainerItem initWithQueryItem:container:zoneRowID:]();
            }
          }
        }
      }
    }
    self = v11;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_BRContainerItem;
  id v4 = a3;
  [(BRQueryItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerID, @"cContainerID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_containerClientIDs forKey:@"cContainerClientIDs"];
  [v4 encodeObject:self->_localizedName forKey:@"cLocalizedName"];
  [v4 encodeBool:self->_isPristine forKey:@"cPristine"];
  [v4 encodeObject:self->_displayName forKey:@"cDisplayName"];
}

- (_BRContainerItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_BRContainerItem;
  objc_super v5 = [(BRQueryItem *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cContainerID"];
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"cContainerClientIDs"];
    containerClientIDs = v5->_containerClientIDs;
    v5->_containerClientIDs = (NSSet *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cLocalizedName"];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v13;

    v5->_isPristine = [v4 decodeBoolForKey:@"cPristine"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cDisplayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithQueryItem:self];
  objc_storeStrong((id *)(v4 + 280), self->_containerID);
  objc_storeStrong((id *)(v4 + 288), self->_containerClientIDs);
  objc_storeStrong((id *)(v4 + 296), self->_localizedName);
  *(unsigned char *)(v4 + 304) = self->_isPristine;
  objc_storeStrong((id *)(v4 + 312), self->_displayName);
  return (id)v4;
}

- (id)itemIdentifier
{
  if ((BRIsFPFSEnabled(self, a2) & 1) != 0
    || ![(NSString *)self->_containerID isEqualToString:@"com.apple.CloudDocs"])
  {
    v5.receiver = self;
    v5.super_class = (Class)_BRContainerItem;
    id v3 = [(BRQueryItem *)&v5 itemIdentifier];
  }
  else
  {
    id v3 = (id)*MEMORY[0x1E4F25C68];
  }

  return v3;
}

- (id)filename
{
  return self->_localizedName;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)fp_cloudContainerIdentifier
{
  return self->_containerID;
}

- (id)fp_cloudContainerClientBundleIdentifiers
{
  return self->_containerClientIDs;
}

- (BOOL)fp_isContainer
{
  return 1;
}

- (BOOL)fp_isContainerPristine
{
  return self->_isPristine;
}

- (BOOL)isHidden
{
  return self->_isPristine;
}

- (id)parentItemIdentifier
{
  return (id)*MEMORY[0x1E4F25C68];
}

- (id)typeIdentifier
{
  return (id)[(id)*MEMORY[0x1E4F443C8] identifier];
}

- (id)containerDisplayName
{
  return self->_displayName;
}

- (unint64_t)capabilities
{
  return 35;
}

- (id)subclassDescription
{
  if (self->_isPristine) {
    return @" pristine";
  }
  else {
    return 0;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (BRIsFPFSEnabled(self, a2))
  {
    if (sel_contentModificationDate == a3 || sel_creationDate == a3) {
      return 0;
    }
  }
  uint64_t v6 = objc_opt_class();

  return [v6 instancesRespondToSelector:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_containerClientIDs, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

- (void)initWithQueryItem:container:zoneRowID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: zoneRowID%@", v2, v3, v4, v5, v6);
}

@end