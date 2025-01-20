@interface MADEmbeddingResult
+ (BOOL)supportsSecureCoding;
- (MADEmbeddingResult)initWithCoder:(id)a3;
- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5;
- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 shape:(id)a6;
- (NSArray)shape;
- (NSData)data;
- (id)description;
- (unint64_t)count;
- (unint64_t)type;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5 shape:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MADEmbeddingResult;
  v13 = [(MADEmbeddingResult *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_version = a3;
    objc_storeStrong((id *)&v13->_data, a4);
    v14->_type = a5;
    objc_storeStrong((id *)&v14->_shape, a6);
  }

  return v14;
}

- (MADEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (a5 == 2)
  {
    unint64_t v10 = (unint64_t)[v8 length] >> 2;
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    unint64_t v10 = (unint64_t)[v8 length] >> 1;
LABEL_5:
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v10, &unk_1F382BBF0);
    v16[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    self = [(MADEmbeddingResult *)self initWithVersion:a3 data:v9 type:a5 shape:v12];

    v13 = self;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t type = self->_type;
    *(_DWORD *)buf = 67109120;
    int v18 = type;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      buf,
      8u);
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (MADEmbeddingResult)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MADEmbeddingResult;
  v5 = [(MADEmbeddingResult *)&v14 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"Version"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"Type"];
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    unint64_t v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Shape"];
    shape = v5->_shape;
    v5->_shape = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_version forKey:@"Version"];
  [v4 encodeObject:self->_data forKey:@"Data"];
  [v4 encodeInteger:self->_type forKey:@"Type"];
  [v4 encodeObject:self->_shape forKey:@"Shape"];
}

- (unint64_t)count
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type == 2) {
    return [(NSData *)self->_data length] >> 2;
  }
  if (type == 1) {
    return [(NSData *)self->_data length] >> 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = self->_type;
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v6,
      8u);
  }
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"version: %d, ", self->_version];
  [v3 appendFormat:@"type: %d, ", self->_type];
  [v3 appendFormat:@"shape: %@, ", self->_shape];
  [v3 appendFormat:@"data: %@>", self->_data];
  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)data
{
  return self->_data;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end