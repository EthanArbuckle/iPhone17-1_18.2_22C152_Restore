@interface BAGFile
+ (BOOL)supportsSecureCoding;
- (BAGFile)initWithCoder:(id)a3;
- (BAGFile)initWithData:(id)a3 contentType:(id)a4 options:(id)a5;
- (BAGResourceOptions)options;
- (BOOL)isEqual:(id)a3;
- (NSData)resource;
- (NSString)contentType;
- (NSString)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setContentType:(id)a3;
- (void)setOptions:(id)a3;
- (void)setResource:(id)a3;
@end

@implementation BAGFile

- (BAGFile)initWithData:(id)a3 contentType:(id)a4 options:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"BAGFile.m", 24, @"Invalid parameter not satisfying: %@", @"contentType" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"BAGFile.m", 23, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"BAGFile.m", 25, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)BAGFile;
  v13 = [(BAGFile *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_resource, a3);
    objc_storeStrong((id *)&v14->_contentType, a4);
    objc_storeStrong((id *)&v14->_options, a5);
  }

  return v14;
}

- (unint64_t)type
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resource"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];

  v8 = [(BAGFile *)self initWithData:v5 contentType:v6 options:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BAGFile *)self resource];
  [v4 encodeObject:v5 forKey:@"resource"];

  v6 = [(BAGFile *)self contentType];
  [v4 encodeObject:v6 forKey:@"contentType"];

  id v7 = [(BAGFile *)self options];
  [v4 encodeObject:v7 forKey:@"options"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v6 = [v5 resource];
    id v7 = [(BAGFile *)self resource];
    if ([v6 isEqualToData:v7])
    {
      v8 = [v5 options];
      v9 = [(BAGFile *)self options];
      if ([v8 isEqual:v9])
      {
        id v10 = [v5 contentType];
        id v11 = [(BAGFile *)self contentType];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(BAGFile *)self resource];
  uint64_t v4 = [v3 hash];
  id v5 = [(BAGFile *)self options];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(BAGFile *)self contentType];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BAGFile *)self options];
  uint64_t v6 = [(BAGFile *)self contentType];
  id v7 = [v3 stringWithFormat:@"<%@ : %p options: %@ contentType: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (BAGResourceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSData)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_resource, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end