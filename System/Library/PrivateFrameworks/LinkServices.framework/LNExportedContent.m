@interface LNExportedContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INFile)content;
- (LNContentType)contentType;
- (LNExportedContent)initWithCoder:(id)a3;
- (LNExportedContent)initWithContentType:(id)a3 content:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNExportedContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (INFile)content
{
  return self->_content;
}

- (LNContentType)contentType
{
  return self->_contentType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNExportedContent *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNExportedContent *)self contentType];
    v8 = [(LNExportedContent *)v6 contentType];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNExportedContent *)self content];
    v16 = [(LNExportedContent *)v6 content];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNExportedContent *)self contentType];
  uint64_t v4 = [v3 hash];
  v5 = [(LNExportedContent *)self content];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (LNExportedContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNExportedContent *)self initWithContentType:v5 content:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNExportedContent *)self contentType];
  [v4 encodeObject:v5 forKey:@"contentType"];

  id v6 = [(LNExportedContent *)self content];
  [v4 encodeObject:v6 forKey:@"content"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(LNExportedContent *)self contentType];
  v5 = [v4 contentType];
  id v6 = [(LNExportedContent *)self content];
  BOOL v7 = [v6 filename];
  v8 = [v3 stringWithFormat:@"<%@> <%@>", v5, v7];

  return v8;
}

- (LNExportedContent)initWithContentType:(id)a3 content:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNExportedContentConfiguration.m", 128, @"Invalid parameter not satisfying: %@", @"contentType" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNExportedContentConfiguration.m", 129, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNExportedContent;
  id v10 = [(LNExportedContent *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    contentType = v10->_contentType;
    v10->_contentType = (LNContentType *)v11;

    uint64_t v13 = [v9 copy];
    content = v10->_content;
    v10->_content = (INFile *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end