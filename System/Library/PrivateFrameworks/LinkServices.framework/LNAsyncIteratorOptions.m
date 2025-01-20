@interface LNAsyncIteratorOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAsyncIteratorOptions)initWithCoder:(id)a3;
- (LNAsyncIteratorOptions)initWithPageSize:(id)a3;
- (LNExportedContentConfiguration)exportConfiguration;
- (NSNumber)pageSize;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExportConfiguration:(id)a3;
@end

@implementation LNAsyncIteratorOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageSize, 0);
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
}

- (NSNumber)pageSize
{
  return self->_pageSize;
}

- (void)setExportConfiguration:(id)a3
{
}

- (LNExportedContentConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAsyncIteratorOptions *)a3;
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
    v7 = [(LNAsyncIteratorOptions *)self exportConfiguration];
    v8 = [(LNAsyncIteratorOptions *)v6 exportConfiguration];
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
    v15 = [(LNAsyncIteratorOptions *)self pageSize];
    v16 = [(LNAsyncIteratorOptions *)v6 pageSize];
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
  v3 = [(LNAsyncIteratorOptions *)self exportConfiguration];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAsyncIteratorOptions *)self pageSize];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (LNAsyncIteratorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pageSize"];
  if (v5)
  {
    self = [(LNAsyncIteratorOptions *)self initWithPageSize:v5];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exportConfiguration"];
    [(LNAsyncIteratorOptions *)self setExportConfiguration:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAsyncIteratorOptions *)self exportConfiguration];
  [v4 encodeObject:v5 forKey:@"exportConfiguration"];

  id v6 = [(LNAsyncIteratorOptions *)self pageSize];
  [v4 encodeObject:v6 forKey:@"pageSize"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(LNAsyncIteratorOptions *)self exportConfiguration];
  v7 = [(LNAsyncIteratorOptions *)self pageSize];
  v8 = [v3 stringWithFormat:@"<%@: %p, exportConfiguration: %@, pageSize: %@>", v5, self, v6, v7];

  return v8;
}

- (LNAsyncIteratorOptions)initWithPageSize:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNAsyncIteratorOptions.m", 17, @"Invalid parameter not satisfying: %@", @"pageSize" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNAsyncIteratorOptions;
  v7 = [(LNAsyncIteratorOptions *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pageSize, a3);
    id v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end