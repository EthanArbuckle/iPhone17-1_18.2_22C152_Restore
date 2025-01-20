@interface ISDecoratedIcon
+ (BOOL)supportsSecureCoding;
- (ISDecoratedIcon)iconWithDecorations:(id)a3;
- (ISDecoratedIcon)initWithCoder:(id)a3;
- (ISDecoratedIcon)initWithIcon:(id)a3 decorations:(id)a4;
- (ISIcon)icon;
- (NSArray)decorations;
- (id)description;
- (id)makeResourceProvider;
- (id)symbol;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISDecoratedIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISDecoratedIcon)initWithIcon:(id)a3 decorations:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v7 digest];
    [v9 addObject:v10];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v25 + 1) + 8 * i) uuid];
        [v9 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  v17 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDByXORingUUIDs:", v9);
  v24.receiver = self;
  v24.super_class = (Class)ISDecoratedIcon;
  v18 = [(ISConcreteIcon *)&v24 initWithDigest:v17];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_icon, a3);
    uint64_t v20 = [v11 copy];
    v21 = (void *)v20;
    if (v20) {
      v22 = (void *)v20;
    }
    else {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v19->_decorations, v22);
  }
  return v19;
}

- (ISDecoratedIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISDecoratedIcon;
  v5 = [(ISConcreteIcon *)&v11 initWithCoder:v4];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_14);
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (ISIcon *)v6;

    uint64_t v8 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"decorations"];
    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)v8;
  }
  return v5;
}

void __33__ISDecoratedIcon_initWithCoder___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__classes;
  initWithCoder__classes = v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ISDecoratedIcon;
  [(ISConcreteIcon *)&v5 encodeWithCoder:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 encodeObject:self->_icon forKey:@"icon"];
  }
  [v4 encodeObject:self->_decorations forKey:@"decorations"];
}

- (ISDecoratedIcon)iconWithDecorations:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[ISDecoratedIcon alloc] initWithIcon:self->_icon decorations:v4];

  uint64_t v6 = +[ISIconManager sharedInstance];
  id v7 = [v6 findOrRegisterIcon:v5];

  return (ISDecoratedIcon *)v7;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ISDecoratedIcon;
  id v4 = [(ISDecoratedIcon *)&v9 description];
  objc_super v5 = [(ISDecoratedIcon *)self icon];
  uint64_t v6 = [(ISDecoratedIcon *)self decorations];
  id v7 = [v3 stringWithFormat:@"%@ icon: %@ decorations: %@", v4, v5, v6];

  return v7;
}

- (NSArray)decorations
{
  uint64_t v3 = [(ISIcon *)self->_icon decorations];
  id v4 = (void *)v3;
  objc_super v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    objc_super v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = [v6 arrayByAddingObjectsFromArray:self->_decorations];

  return (NSArray *)v7;
}

- (id)makeResourceProvider
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ISDecoratedIcon *)self icon];
  objc_opt_class();
  long long v26 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 makeResourceProvider];
  }
  else
  {
    id v4 = 0;
  }
  long long v27 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F1CA58]);
  long long v25 = v4;
  id v6 = [v4 resourceToken];
  id v7 = (void *)[v5 initWithData:v6];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [(ISDecoratedIcon *)self decorations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 identifierKind];
          if (v14 == 1)
          {
            id v18 = objc_alloc(MEMORY[0x1E4F223C8]);
            v16 = [v13 identifier];
            uint64_t v17 = [v18 initWithBundleIdentifier:v16 allowPlaceholder:1 error:0];
LABEL_14:
            v19 = (void *)v17;
          }
          else
          {
            if (v14 == 2)
            {
              v15 = (void *)MEMORY[0x1E4F22490];
              v16 = [v13 identifier];
              uint64_t v17 = [v15 typeRecordWithIdentifier:v16];
              goto LABEL_14;
            }
            v19 = 0;
          }
          uint64_t v20 = +[ISResourceProvider resourceWithRecord:v19 options:0];
          if (v20)
          {
            v21 = [v19 persistentIdentifier];
            [v7 appendData:v21];

            v22 = [v13 uuid];
            [v27 setObject:v20 forKey:v22];
          }
          continue;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  [v25 setDecorationResources:v27];
  v23 = (void *)[v7 copy];
  [v25 setResourceToken:v23];

  return v25;
}

- (id)symbol
{
  return [(ISIcon *)self->_icon symbol];
}

- (ISIcon)icon
{
  return (ISIcon *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
}

@end