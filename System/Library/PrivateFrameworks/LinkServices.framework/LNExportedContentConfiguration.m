@interface LNExportedContentConfiguration
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (LNContentType)contentType;
- (LNExportedContentConfiguration)configurationWithAuditToken:(id *)a3;
- (LNExportedContentConfiguration)initWithCoder:(id)a3;
- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4;
- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4 auditToken:(id *)a5;
- (id)description;
- (int64_t)preferredExtractionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id *)a3;
@end

@implementation LNExportedContentConfiguration

- (void).cxx_destruct
{
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (int64_t)preferredExtractionType
{
  return self->_preferredExtractionType;
}

- (LNContentType)contentType
{
  return self->_contentType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNExportedContentConfiguration *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [(LNExportedContentConfiguration *)self contentType];
    v8 = [(LNExportedContentConfiguration *)v6 contentType];
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
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_14;
      }
    }
    int64_t v14 = [(LNExportedContentConfiguration *)self preferredExtractionType];
    BOOL v13 = v14 == [(LNExportedContentConfiguration *)v6 preferredExtractionType];
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  long long v3 = [(LNExportedContentConfiguration *)self contentType];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(LNExportedContentConfiguration *)self preferredExtractionType] ^ v4;

  return v5;
}

- (LNExportedContentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"preferredExtractionType"];
  long long v11 = 0u;
  long long v12 = 0u;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];

  if (v7)
  {
    objc_msgSend(v7, "if_auditToken");
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  v10[0] = v11;
  v10[1] = v12;
  v8 = [(LNExportedContentConfiguration *)self initWithContentType:v5 preferredExtractionType:v6 auditToken:v10];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LNExportedContentConfiguration *)self contentType];
  [v4 encodeObject:v5 forKey:@"contentType"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType"), @"preferredExtractionType");
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9B8];
  [(LNExportedContentConfiguration *)self auditToken];
  v7 = objc_msgSend(v6, "if_dataWithAuditToken:", &v8);
  [v4 encodeObject:v7 forKey:@"auditToken"];
}

- (id)description
{
  long long v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNExportedContentConfiguration *)self contentType];
  v7 = [v6 description];
  int64_t v8 = [(LNExportedContentConfiguration *)self preferredExtractionType];
  id v9 = @"File";
  if (v8 == 1) {
    id v9 = @"Data";
  }
  id v10 = [v3 stringWithFormat:@"<%@: %p, contentType: %@, preferredExtractionType: %@>", v5, self, v7, v9];

  return v10;
}

- (LNExportedContentConfiguration)configurationWithAuditToken:(id *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(LNExportedContentConfiguration *)self contentType];
  int64_t v7 = [(LNExportedContentConfiguration *)self preferredExtractionType];
  long long v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  id v9 = (void *)[v5 initWithContentType:v6 preferredExtractionType:v7 auditToken:v11];

  return (LNExportedContentConfiguration *)v9;
}

- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4 auditToken:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNExportedContentConfiguration.m", 53, @"Invalid parameter not satisfying: %@", @"contentType" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNExportedContentConfiguration;
  id v10 = [(LNExportedContentConfiguration *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    long long v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    *((void *)v10 + 2) = a4;
    long long v13 = *(_OWORD *)a5->var0;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)(v10 + 24) = v13;
    int64_t v14 = v10;
  }

  return (LNExportedContentConfiguration *)v10;
}

- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNExportedContentConfiguration.m", 36, @"Invalid parameter not satisfying: %@", @"contentType" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNExportedContentConfiguration;
  long long v8 = [(LNExportedContentConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    id v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    *((void *)v8 + 2) = a4;
    *(void *)&long long v11 = -1;
    *((void *)&v11 + 1) = -1;
    *(_OWORD *)(v8 + 24) = v11;
    *(_OWORD *)(v8 + 40) = v11;
    long long v12 = v8;
  }

  return (LNExportedContentConfiguration *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end