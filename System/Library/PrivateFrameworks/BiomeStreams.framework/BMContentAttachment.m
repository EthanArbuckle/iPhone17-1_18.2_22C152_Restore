@interface BMContentAttachment
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMContentAttachment)initWithCoder:(id)a3;
- (BMContentAttachment)initWithProto:(id)a3;
- (BMContentAttachment)initWithProtoData:(id)a3;
- (BMContentAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)filename;
- (NSString)path;
- (NSString)type;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMContentAttachment

- (BMContentAttachment)initWithType:(id)a3 filename:(id)a4 path:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BMContentAttachment.m", 29, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BMContentAttachment.m", 30, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BMContentAttachment;
  v13 = [(BMContentAttachment *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    objc_storeStrong((id *)&v14->_filename, a4);
    objc_storeStrong((id *)&v14->_path, a5);
  }

  return v14;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMContentAttachment eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"type";
  v7[1] = @"filename";
  filename = self->_filename;
  v8[0] = self->_type;
  v8[1] = filename;
  v7[2] = @"path";
  path = self->_path;
  v4 = path;
  if (!path)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  if (!path) {

  }
  return v5;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMContentAttachment *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMContentAttachment *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMContentAttachment *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMContentAttachment)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMContentAttachment *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMContentAttachment *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMContentAttachment)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if [v5 hasType] && ([v5 hasFilename])
      {
        id v6 = [v5 type];
        v7 = [v5 filename];
        id v8 = [v5 path];
        self = [(BMContentAttachment *)self initWithType:v6 filename:v7 path:v8];

        v9 = self;
LABEL_13:

        goto LABEL_14;
      }
      id v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMContentAttachment initWithProto:](v10);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMContentAttachment initWithProto:](v5);
      }
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BMContentAttachment)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBContentAttachment alloc] initWithData:v4];

    self = [(BMContentAttachment *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMContentAttachment *)self type];
  [v3 setType:v4];

  id v5 = [(BMContentAttachment *)self filename];
  [v3 setFilename:v5];

  id v6 = [(BMContentAttachment *)self path];
  [v3 setPath:v6];

  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_filename hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    type = self->_type;
    v7 = [v5 type];
    if (![(NSString *)type isEqualToString:v7])
    {
      char v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    filename = self->_filename;
    v9 = [v5 filename];
    if ([filename isEqualToString:v9])
    {
      path = self->_path;
      id v11 = path;
      if (!path)
      {
        filename = [v5 path];
        if (!filename)
        {
          char v13 = 1;
LABEL_13:

          goto LABEL_14;
        }
        id v11 = self->_path;
      }
      id v12 = [v5 path];
      char v13 = [(NSString *)v11 isEqualToString:v12];

      if (!path) {
        goto LABEL_13;
      }
    }
    else
    {
      char v13 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  char v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_type && self->_filename)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMContentAttachment: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMContentAttachment: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMContentAttachment: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMContentAttachment: tried to initialize with a non-BMContentAttachment proto", v1, 2u);
}

@end