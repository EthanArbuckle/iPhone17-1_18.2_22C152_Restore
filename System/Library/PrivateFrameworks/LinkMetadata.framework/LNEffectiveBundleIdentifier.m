@interface LNEffectiveBundleIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEffectiveBundleIdentifier)initWithCoder:(id)a3;
- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4;
- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 url:(id)a5;
- (NSString)bundleIdentifier;
- (NSURL)url;
- (id)bundleMetadataForURLs:(id)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEffectiveBundleIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (LNEffectiveBundleIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    self = [(LNEffectiveBundleIdentifier *)self initWithType:v5 bundleIdentifier:v6 url:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4 url:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LNEffectiveBundleIdentifier;
  v10 = [(LNEffectiveBundleIdentifier *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNEffectiveBundleIdentifier *)a3;
  uint64_t v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [(LNEffectiveBundleIdentifier *)self bundleIdentifier];
    id v8 = [(LNEffectiveBundleIdentifier *)v6 bundleIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        BOOL v13 = 0;
        goto LABEL_15;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_14;
      }
    }
    int64_t v14 = [(LNEffectiveBundleIdentifier *)self type];
    BOOL v13 = v14 == [(LNEffectiveBundleIdentifier *)v6 type];
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNEffectiveBundleIdentifier type](self, "type"), @"type");
  uint64_t v5 = [(LNEffectiveBundleIdentifier *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = [(LNEffectiveBundleIdentifier *)self url];
  [v4 encodeObject:v6 forKey:@"url"];
}

- (unint64_t)hash
{
  int64_t v3 = [(LNEffectiveBundleIdentifier *)self type];
  id v4 = [(LNEffectiveBundleIdentifier *)self bundleIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  int64_t v3 = NSString;
  unint64_t v4 = [(LNEffectiveBundleIdentifier *)self type] - 1;
  if (v4 > 2) {
    unint64_t v5 = @"App";
  }
  else {
    unint64_t v5 = off_1E590D708[v4];
  }
  id v6 = [(LNEffectiveBundleIdentifier *)self bundleIdentifier];
  v7 = [(LNEffectiveBundleIdentifier *)self url];
  id v8 = [v3 stringWithFormat:@"%@ (%@ at %@)", v5, v6, v7];

  return v8;
}

- (LNEffectiveBundleIdentifier)initWithType:(int64_t)a3 bundleIdentifier:(id)a4
{
  return [(LNEffectiveBundleIdentifier *)self initWithType:a3 bundleIdentifier:a4 url:0];
}

- (id)bundleMetadataForURLs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__LNEffectiveBundleIdentifier_StaticExtraction__bundleMetadataForURLs___block_invoke;
  v5[3] = &unk_1E590D8C0;
  v5[4] = self;
  int64_t v3 = objc_msgSend(a3, "if_compactMap:", v5);
  return v3;
}

LNBundleMetadata *__71__LNEffectiveBundleIdentifier_StaticExtraction__bundleMetadataForURLs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v3 = a2;
  unint64_t v4 = [(__CFString *)v3 path];
  unint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 isReadableFileAtPath:v4];

  if (v6)
  {
    v7 = [objc_alloc(MEMORY[0x1E4F28B50]) _initUniqueWithURL:v3];
    if (v7)
    {
      id v8 = [LNBundleMetadata alloc];
      uint64_t v9 = *(void *)(a1 + 32);
      id v18 = 0;
      id v10 = [(LNBundleMetadata *)v8 initWithBundle:v7 usingEffectiveBundleIdentifier:v9 error:&v18];
      v11 = v18;
      if (v10)
      {
        int v12 = v10;
      }
      else
      {
        BOOL v13 = getLNLogCategoryMetadata();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v7 bundleIdentifier];
          v15 = (void *)v14;
          objc_super v16 = @"<missing bundle identifier>";
          if (v14) {
            objc_super v16 = (__CFString *)v14;
          }
          *(_DWORD *)buf = 138543618;
          v20 = v16;
          __int16 v21 = 2114;
          v22 = v3;
        }
      }
    }
    else
    {
      v11 = getLNLogCategoryMetadata();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v3;
        _os_log_impl(&dword_19C9AD000, v11, OS_LOG_TYPE_ERROR, "Unable to create bundle with URL '%{public}@'", buf, 0xCu);
      }
      id v10 = 0;
    }
  }
  else
  {
    v7 = getLNLogCategoryMetadata();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_impl(&dword_19C9AD000, v7, OS_LOG_TYPE_ERROR, "'%{public}@' is not readable or doesn't exist", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

@end