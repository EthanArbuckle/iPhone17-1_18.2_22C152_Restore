@interface DNDAppInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DNDAppInfo)initWithCoder:(id)a3;
- (DNDAppInfo)initWithSource:(int64_t)a3 applicationIdentifier:(id)a4 displayName:(id)a5 storeIconURL:(id)a6 cachedIconURL:(id)a7;
- (DNDApplicationIdentifier)applicationIdentifier;
- (NSString)displayName;
- (NSURL)cachedIconURL;
- (NSURL)storeIconURL;
- (id)_initWithAppInfo:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDAppInfo

- (DNDAppInfo)initWithSource:(int64_t)a3 applicationIdentifier:(id)a4 displayName:(id)a5 storeIconURL:(id)a6 cachedIconURL:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DNDAppInfo;
  v16 = [(DNDAppInfo *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_source = a3;
    uint64_t v18 = [v12 copy];
    applicationIdentifier = v17->_applicationIdentifier;
    v17->_applicationIdentifier = (DNDApplicationIdentifier *)v18;

    uint64_t v20 = [v13 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    storeIconURL = v17->_storeIconURL;
    v17->_storeIconURL = (NSURL *)v22;

    uint64_t v24 = [v15 copy];
    cachedIconURL = v17->_cachedIconURL;
    v17->_cachedIconURL = (NSURL *)v24;
  }
  return v17;
}

- (id)_initWithAppInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 source];
  v6 = [v4 applicationIdentifier];
  v7 = [v4 displayName];
  v8 = [v4 storeIconURL];
  v9 = [v4 cachedIconURL];

  v10 = [(DNDAppInfo *)self initWithSource:v5 applicationIdentifier:v6 displayName:v7 storeIconURL:v8 cachedIconURL:v9];
  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(DNDAppInfo *)self source];
  id v4 = [(DNDAppInfo *)self applicationIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(DNDAppInfo *)self displayName];
  uint64_t v7 = [v6 hash];
  v8 = [(DNDAppInfo *)self storeIconURL];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(DNDAppInfo *)self cachedIconURL];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDAppInfo *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(DNDAppInfo *)self source];
      if (v6 != [(DNDAppInfo *)v5 source])
      {
        char v15 = 0;
LABEL_53:

        goto LABEL_54;
      }
      uint64_t v7 = [(DNDAppInfo *)self applicationIdentifier];
      v8 = [(DNDAppInfo *)v5 applicationIdentifier];
      if (v7 != v8)
      {
        uint64_t v9 = [(DNDAppInfo *)self applicationIdentifier];
        if (!v9)
        {
          char v15 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        uint64_t v11 = [(DNDAppInfo *)v5 applicationIdentifier];
        if (!v11)
        {
          char v15 = 0;
LABEL_51:

          goto LABEL_52;
        }
        id v12 = (void *)v11;
        id v13 = [(DNDAppInfo *)self applicationIdentifier];
        id v14 = [(DNDAppInfo *)v5 applicationIdentifier];
        if (![v13 isEqual:v14])
        {
          char v15 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v51 = v14;
        v52 = v13;
        v53 = v12;
        v54 = v10;
      }
      v16 = [(DNDAppInfo *)self displayName];
      v17 = [(DNDAppInfo *)v5 displayName];
      if (v16 != v17)
      {
        uint64_t v18 = [(DNDAppInfo *)self displayName];
        if (v18)
        {
          v19 = (void *)v18;
          uint64_t v20 = [(DNDAppInfo *)v5 displayName];
          if (v20)
          {
            v21 = (void *)v20;
            v50 = v16;
            uint64_t v22 = [(DNDAppInfo *)self displayName];
            v23 = [(DNDAppInfo *)v5 displayName];
            if (([v22 isEqual:v23] & 1) == 0)
            {

              goto LABEL_40;
            }
            v45 = v22;
            v46 = v21;
            v47 = v19;
            v16 = v23;
            goto LABEL_19;
          }
        }
        goto LABEL_40;
      }
      v50 = v16;
LABEL_19:
      uint64_t v24 = [(DNDAppInfo *)self storeIconURL];
      v49 = [(DNDAppInfo *)v5 storeIconURL];
      if (v24 == v49)
      {
        v48 = v24;
        goto LABEL_27;
      }
      uint64_t v25 = [(DNDAppInfo *)self storeIconURL];
      if (v25)
      {
        v26 = (void *)v25;
        objc_super v27 = [(DNDAppInfo *)v5 storeIconURL];
        if (v27)
        {
          v42 = v16;
          v44 = v27;
          v28 = [(DNDAppInfo *)self storeIconURL];
          v29 = [(DNDAppInfo *)v5 storeIconURL];
          if ([v28 isEqual:v29])
          {
            v39 = v29;
            v40 = v28;
            v41 = v26;
            v48 = v24;
            v16 = v42;
LABEL_27:
            v30 = [(DNDAppInfo *)self cachedIconURL];
            uint64_t v31 = [(DNDAppInfo *)v5 cachedIconURL];
            if (v30 == (void *)v31)
            {

              char v15 = 1;
            }
            else
            {
              v32 = (void *)v31;
              uint64_t v33 = [(DNDAppInfo *)self cachedIconURL];
              if (v33)
              {
                v43 = (void *)v33;
                v34 = [(DNDAppInfo *)v5 cachedIconURL];
                if (v34)
                {
                  v38 = v34;
                  v37 = [(DNDAppInfo *)self cachedIconURL];
                  v35 = [(DNDAppInfo *)v5 cachedIconURL];
                  char v15 = [v37 isEqual:v35];

                  v34 = v38;
                }
                else
                {
                  char v15 = 0;
                }
              }
              else
              {

                char v15 = 0;
              }
            }
            if (v48 != v49)
            {
            }
            if (v50 != v17)
            {
            }
LABEL_49:
            id v12 = v53;
            v10 = v54;
            id v13 = v52;
            id v14 = v51;
            if (v7 != v8) {
              goto LABEL_50;
            }
LABEL_52:

            goto LABEL_53;
          }

          v16 = v42;
          objc_super v27 = v44;
        }
      }
      if (v50 != v17)
      {
      }
LABEL_40:
      char v15 = 0;
      goto LABEL_49;
    }
    char v15 = 0;
  }
LABEL_54:

  return v15;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDAppInfo source](self, "source"));
  int64_t v6 = [(DNDAppInfo *)self applicationIdentifier];
  uint64_t v7 = [(DNDAppInfo *)self displayName];
  v8 = [(DNDAppInfo *)self storeIconURL];
  uint64_t v9 = [v8 absoluteString];
  v10 = [(DNDAppInfo *)self cachedIconURL];
  uint64_t v11 = [v10 path];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; source: %@; applicationIdentifier: %@; displayName: %@; storeIconURL: %@; cachedIconURL: %@>",
    v4,
    self,
    v5,
    v6,
    v7,
    v9,
  id v12 = v11);

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[DNDMutableAppInfo allocWithZone:a3];
  return [(DNDAppInfo *)v4 _initWithAppInfo:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDAppInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"source"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeIconURL"];
  v10 = [v8 URLWithString:v9];

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cachedIconURL"];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [(DNDAppInfo *)self initWithSource:v5 applicationIdentifier:v6 displayName:v7 storeIconURL:v10 cachedIconURL:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDAppInfo source](self, "source"), @"source");
  uint64_t v5 = [(DNDAppInfo *)self applicationIdentifier];
  [v4 encodeObject:v5 forKey:@"applicationIdentifier"];

  int64_t v6 = [(DNDAppInfo *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  uint64_t v7 = [(DNDAppInfo *)self storeIconURL];
  v8 = [v7 absoluteString];
  [v4 encodeObject:v8 forKey:@"storeIconURL"];

  id v10 = [(DNDAppInfo *)self cachedIconURL];
  uint64_t v9 = [v10 path];
  [v4 encodeObject:v9 forKey:@"cachedIconURL"];
}

- (int64_t)source
{
  return self->_source;
}

- (DNDApplicationIdentifier)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)storeIconURL
{
  return self->_storeIconURL;
}

- (NSURL)cachedIconURL
{
  return self->_cachedIconURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIconURL, 0);
  objc_storeStrong((id *)&self->_storeIconURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end