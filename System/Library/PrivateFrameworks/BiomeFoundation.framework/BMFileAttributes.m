@interface BMFileAttributes
+ (BOOL)supportsSecureCoding;
- (BMFileAttributes)initWithCoder:(id)a3;
- (BMFileAttributes)initWithPath:(id)a3 mode:(unint64_t)a4 protectionClass:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)filename;
- (NSString)path;
- (unint64_t)hash;
- (unint64_t)mode;
- (unint64_t)protectionClass;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMFileAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (NSString)path
{
  return self->_path;
}

- (BMFileAttributes)initWithPath:(id)a3 mode:(unint64_t)a4 protectionClass:(unint64_t)a5
{
  id v9 = a3;
  if (![v9 length])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BMFileHandle.m", 72, @"Invalid parameter not satisfying: %@", @"path.length" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)BMFileAttributes;
  v10 = [(BMFileAttributes *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    path = v10->_path;
    v10->_path = (NSString *)v11;

    uint64_t v13 = [(NSString *)v10->_path lastPathComponent];
    filename = v10->_filename;
    v10->_filename = (NSString *)v13;

    v10->_mode = a4;
    v10->_protectionClass = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMFileAttributes *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)v6->_path isEqual:self->_path]
      && v6->_mode == self->_mode;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_mode];
  [v5 encodeObject:v6 forKey:@"mode"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_protectionClass];
  [v5 encodeObject:v7 forKey:@"prot"];
}

- (unint64_t)hash
{
  return self->_mode ^ [(NSString *)self->_path hash];
}

- (BMFileAttributes)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  path = self->_path;
  self->_path = v5;

  id v7 = [(NSString *)self->_path lastPathComponent];
  filename = self->_filename;
  self->_filename = v7;

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
  v10 = v9;
  if (!v9 || (unint64_t)[v9 unsignedIntegerValue] >= 4)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"Invalid access mode";
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    objc_super v17 = (__CFString **)v25;
    v18 = &v24;
LABEL_8:
    v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
    v20 = [v15 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v19];
    [v4 failWithError:v20];

    v14 = 0;
    goto LABEL_9;
  }
  unint64_t v11 = [v10 unsignedIntegerValue];

  self->_mode = v11;
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
  v10 = v12;
  if (!v12 || (unint64_t)[v12 unsignedIntegerValue] >= 7)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23 = @"Invalid protection class";
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    objc_super v17 = &v23;
    v18 = &v22;
    goto LABEL_8;
  }
  unint64_t v13 = [v10 unsignedIntegerValue];

  self->_protectionClass = v13;
  v14 = self;
LABEL_9:

  return v14;
}

- (NSString)filename
{
  return self->_filename;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)protectionClass
{
  return self->_protectionClass;
}

@end