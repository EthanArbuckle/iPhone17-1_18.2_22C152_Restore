@interface ISAliasIcon
+ (BOOL)supportsSecureCoding;
+ (id)_iconForBookmarkData:(id)a3;
+ (id)_iconForValues:(id)a3;
+ (id)aliasUUID;
- (ISAliasIcon)initWithAliasURL:(id)a3;
- (ISAliasIcon)initWithBookmarkData:(id)a3;
- (ISAliasIcon)initWithBookmarkData:(id)a3 decorations:(id)a4;
- (ISAliasIcon)initWithCoder:(id)a3;
- (ISConcreteIcon)icon;
- (ISConcreteIcon)resolvedIcon;
- (id)alias;
- (id)decorations;
- (id)description;
- (id)makeResourceProvider;
- (void)encodeWithCoder:(id)a3;
- (void)resolve;
@end

@implementation ISAliasIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)aliasUUID
{
  if (aliasUUID_onceToken != -1) {
    dispatch_once(&aliasUUID_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)aliasUUID_aliasUUID;
  return v2;
}

uint64_t __24__ISAliasIcon_aliasUUID__block_invoke()
{
  aliasUUID_aliasUUID = objc_msgSend(MEMORY[0x1E4F29128], "_IS_UUIDWithString:", @"com.apple.icon-decoration.system.alias");
  return MEMORY[0x1F41817F8]();
}

- (ISAliasIcon)initWithAliasURL:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend(v5, "__is__isSymLink"))
  {
    v6 = (void *)MEMORY[0x1E4F29128];
    v7 = [v5 absoluteString];
    v8 = objc_msgSend(v6, "_IF_UUIDWithString:", v7);

    v9 = +[ISURLResourcePropertySpecification sharedInstance];
    v10 = [v9 iconInitWithURLProperties];
    objc_msgSend(v5, "__is_resourceValuesForKeys:error:", v10, 0);
    v11 = (ISIconDecoration *)objc_claimAutoreleasedReturnValue();

    v12 = +[ISAliasIcon _iconForValues:v11];
    v20.receiver = self;
    v20.super_class = (Class)ISAliasIcon;
    v13 = [(ISConcreteIcon *)&v20 initWithDigest:v8];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_icon, v12);
      objc_storeStrong(&v14->_alias, a3);
      v15 = [[ISIconDecoration alloc] initWithType:@"com.apple.icon-decoration.system.alias"];
      v24[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      decorations = v14->_decorations;
      v14->_decorations = (NSArray *)v16;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CB10] bookmarkDataWithContentsOfURL:v5 error:0];
    if (!v8)
    {
      v18 = _ISDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = 0;
        _os_log_impl(&dword_1AE771000, v18, OS_LOG_TYPE_DEFAULT, "Could not read bookmark from alias file with error: %@", buf, 0xCu);
      }
    }
    v11 = [[ISIconDecoration alloc] initWithType:@"com.apple.icon-decoration.system.alias"];
    v21 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v14 = [(ISAliasIcon *)self initWithBookmarkData:v8 decorations:v12];
  }

  return v14;
}

- (ISAliasIcon)initWithBookmarkData:(id)a3
{
  return [(ISAliasIcon *)self initWithBookmarkData:a3 decorations:MEMORY[0x1E4F1CBF0]];
}

- (ISAliasIcon)initWithBookmarkData:(id)a3 decorations:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = +[ISURLResourcePropertySpecification sharedInstance];
  v11 = [v10 iconInitWithURLProperties];
  v12 = [v9 resourceValuesForKeys:v11 fromBookmarkData:v7];

  v13 = +[ISAliasIcon _iconForValues:v12];
  v14 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:", v7);
  v15 = (void *)MEMORY[0x1E4F29128];
  v26[0] = v14;
  uint64_t v16 = [v13 digest];
  v26[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v18 = objc_msgSend(v15, "_IF_UUIDByXORingUUIDs:", v17);

  if ((objc_msgSend(v12, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C610]) & 1) != 0
    || objc_msgSend(v12, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C680]))
  {
    v19 = _ISDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[ISAliasIcon initWithBookmarkData:decorations:]();
    }

    if (v8) {
      objc_super v20 = v8;
    }
    else {
      objc_super v20 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v21 = [[ISIconDecoration alloc] initWithType:@"com.apple.icon-decoration.system.alias"];
    id v8 = [v20 arrayByAddingObject:v21];
  }
  v25.receiver = self;
  v25.super_class = (Class)ISAliasIcon;
  v22 = [(ISConcreteIcon *)&v25 initWithDigest:v18];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_icon, v13);
    objc_storeStrong(&v23->_alias, a3);
    objc_storeStrong((id *)&v23->_decorations, v8);
  }

  return v23;
}

- (ISAliasIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISAliasIcon;
  id v5 = [(ISConcreteIcon *)&v11 initWithCoder:v4];
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_9);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__classes_0 forKey:@"alias"];
    id alias = v5->_alias;
    v5->_id alias = (id)v6;

    uint64_t v8 = [v4 decodeObjectOfClasses:initWithCoder__classes_0 forKey:@"decorations"];
    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)v8;
  }
  return v5;
}

void __29__ISAliasIcon_initWithCoder___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__classes_0;
  initWithCoder__classes_0 = v2;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ISAliasIcon;
  id v4 = a3;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_alias, @"alias", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_decorations forKey:@"decorations"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ISAliasIcon;
  v3 = [(ISAliasIcon *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@"Icon: %@, Alias: %@", self->_icon, self->_alias];

  return v4;
}

- (void)resolve
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_2_1();
  uint64_t v8 = a2;
}

- (ISConcreteIcon)icon
{
  v3 = [(ISAliasIcon *)self resolvedIcon];
  icon = v3;
  if (!v3) {
    icon = self->_icon;
  }
  objc_super v5 = icon;

  return v5;
}

- (id)makeResourceProvider
{
  [(ISAliasIcon *)self resolve];
  v3 = [(ISAliasIcon *)self icon];
  id v4 = [v3 makeResourceProvider];

  return v4;
}

- (id)decorations
{
  return self->_decorations;
}

- (id)alias
{
  return objc_getProperty(self, a2, 56, 1);
}

- (ISConcreteIcon)resolvedIcon
{
  return (ISConcreteIcon *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIcon, 0);
  objc_storeStrong(&self->_alias, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

+ (id)_iconForBookmarkData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  objc_super v5 = +[ISURLResourcePropertySpecification sharedInstance];
  objc_super v6 = [v5 iconInitWithURLProperties];
  id v7 = [v3 resourceValuesForKeys:v6 fromBookmarkData:v4];

  uint64_t v8 = +[ISAliasIcon _iconForValues:v7];

  return v8;
}

+ (id)_iconForValues:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C618]))
  {
    id v4 = _ISDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[ISAliasIcon(Factory) _iconForValues:]();
    }

    objc_super v5 = objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E4F1C520]);
    if (!v5)
    {
      objc_super v5 = objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E4F1C700]);
    }
    objc_super v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v7 = [[ISBundleIcon alloc] initWithBundleURL:v6];
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C658]))
  {
    objc_super v5 = objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E4F1C700]);
    objc_super v6 = [v5 pathExtension];
    uint64_t v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[ISAliasIcon(Factory) _iconForValues:]((uint64_t)v6, v8);
    }

    uint64_t v9 = [ISTagIcon alloc];
    v10 = (void *)MEMORY[0x1E4F22680];
LABEL_15:
    id v7 = [(ISTagIcon *)v9 initWithFileExtension:v6 baseType:*v10];
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C670]))
  {
    objc_super v5 = objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E4F1C700]);
    objc_super v6 = [v5 pathExtension];
    objc_super v11 = _ISDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ISAliasIcon(Factory) _iconForValues:].cold.4((uint64_t)v6, v11);
    }

    uint64_t v9 = [ISTagIcon alloc];
    v10 = (void *)MEMORY[0x1E4F22608];
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "_IF_BOOLForKey:", *MEMORY[0x1E4F1C628]))
  {
    uint64_t v16 = _ISDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[ISAliasIcon(Factory) _iconForValues:].cold.6();
    }

    objc_super v6 = objc_msgSend(v3, "_IF_stringForKey:", *MEMORY[0x1E4F1C700]);
    if (v6)
    {
      objc_super v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
      v17 = +[ISCustomIconManager sharedInstance];
      v18 = [v17 specialFolderTypeForURL:v5];

      if (v18)
      {
        v19 = _ISDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          +[ISAliasIcon(Factory) _iconForValues:].cold.5();
        }

        v12 = [[ISTypeIcon alloc] initWithType:v18];
LABEL_17:

        if (v12) {
          goto LABEL_21;
        }
        goto LABEL_18;
      }
    }
    else
    {
      objc_super v5 = 0;
    }
    objc_super v20 = [ISTypeIcon alloc];
    id v7 = [(ISTypeIcon *)v20 initWithType:*MEMORY[0x1E4F225C8]];
LABEL_16:
    v12 = (ISTypeIcon *)v7;
    goto LABEL_17;
  }
LABEL_18:
  v13 = _ISDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[ISAliasIcon(Factory) _iconForValues:]();
  }

  v14 = [ISTypeIcon alloc];
  v12 = [(ISTypeIcon *)v14 initWithType:*MEMORY[0x1E4F22608]];
LABEL_21:

  return v12;
}

- (void)initWithBookmarkData:decorations:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AE771000, v0, v1, "Adding alias decoration for bookmark icon", v2, v3, v4, v5, v6);
}

@end