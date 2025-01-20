@interface LSMacApplicationIdentityBookmark
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LSMacApplicationIdentityBookmark)initWithCoder:(id)a3;
- (id)initWithURL:(void *)a3 bundleIdentifier:;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSMacApplicationIdentityBookmark

- (id)initWithURL:(void *)a3 bundleIdentifier:
{
  unint64_t v6 = a2;
  unint64_t v7 = a3;
  v8 = (void *)v7;
  if (!a1)
  {
    v10 = 0;
    goto LABEL_9;
  }
  if (!(v6 | v7))
  {
    v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[LSMacApplicationIdentityBookmark initWithURL:bundleIdentifier:](v12, v13, v14, v15, v16, v17, v18, v19);
    }

    v10 = 0;
    goto LABEL_8;
  }
  v21.receiver = a1;
  v21.super_class = (Class)LSMacApplicationIdentityBookmark;
  v9 = (id *)objc_msgSendSuper2(&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a2);
    uint64_t v11 = [v8 copy];
    a1 = v10[2];
    v10[2] = (id)v11;
LABEL_8:
  }
LABEL_9:

  return v10;
}

- (LSMacApplicationIdentityBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleIdentifier");
  uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
  if (!(v5 | v6)) {
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)LSMacApplicationIdentityBookmark;
  unint64_t v7 = [(LSMacApplicationIdentityBookmark *)&v10 init];
  if (!v7)
  {
    self = 0;
LABEL_5:

    v8 = 0;
    goto LABEL_6;
  }
  v8 = (LSMacApplicationIdentityBookmark *)-[LSMacApplicationIdentityBookmark initWithURL:bundleIdentifier:](v7, (void *)v6, (void *)v5);
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v4 encodeObject:self->_URL forKey:@"URL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    if ([(NSURL *)self->_URL isEqual:v5[1]]) {
      char v6 = [(NSString *)self->_bundleIdentifier isEqual:v5[2]];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash] ^ __ROR8__([(NSURL *)self->_URL hash], 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)initWithURL:(uint64_t)a3 bundleIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end