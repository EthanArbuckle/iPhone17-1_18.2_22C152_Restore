@interface BMNamedHandle
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMNamedHandle)initWithCoder:(id)a3;
- (BMNamedHandle)initWithName:(id)a3 handleType:(id)a4 handle:(id)a5 contactIdentifier:(id)a6;
- (BMNamedHandle)initWithProto:(id)a3;
- (BMNamedHandle)initWithProtoData:(id)a3;
- (BMNamedHandle)initWithString:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)contactIdentifier;
- (NSString)handle;
- (NSString)handleType;
- (NSString)name;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMNamedHandle

- (BMNamedHandle)initWithName:(id)a3 handleType:(id)a4 handle:(id)a5 contactIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v14)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BMNamedHandle.m", 30, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)BMNamedHandle;
  v16 = [(BMNamedHandle *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_handleType, a4);
    objc_storeStrong((id *)&v17->_handle, a5);
    objc_storeStrong((id *)&v17->_contactIdentifier, a6);
  }

  return v17;
}

- (BMNamedHandle)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" <>"];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];
  if (![v6 count])
  {
    id v8 = v4;
    goto LABEL_5;
  }
  uint64_t v7 = [v6 count];
  id v8 = [v6 objectAtIndexedSubscript:0];
  if (v7 == 1)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  [v6 objectAtIndexedSubscript:1];
  v9 = v8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = [(BMNamedHandle *)self initWithName:v9 handleType:0 handle:v8 contactIdentifier:0];

  return v10;
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
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMNamedHandle eventWithData:dataVersion:](a4, v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"name";
  name = self->_name;
  id v4 = name;
  if (!name)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"handleType";
  handleType = self->_handleType;
  id v6 = handleType;
  if (!handleType)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  handle = self->_handle;
  contactIdentifier = self->_contactIdentifier;
  v13[1] = v6;
  v13[2] = handle;
  v12[2] = @"handle";
  v12[3] = @"contactIdentfier";
  v9 = contactIdentifier;
  if (!contactIdentifier)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  if (contactIdentifier)
  {
    if (handleType) {
      goto LABEL_9;
    }
LABEL_14:

    if (name) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!handleType) {
    goto LABEL_14;
  }
LABEL_9:
  if (name) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v10;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMNamedHandle *)self jsonDict];
  id v8 = 0;
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMNamedHandle *)(uint64_t)v5 json];
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
  id v5 = [(BMNamedHandle *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMNamedHandle)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMNamedHandle *)self initWithProtoData:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMNamedHandle *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMNamedHandle)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 handle];

      if (v6)
      {
        uint64_t v7 = [v5 name];
        id v8 = [v5 handleType];
        v9 = [v5 handle];
        v10 = [v5 contactIdentifier];
        self = [(BMNamedHandle *)self initWithName:v7 handleType:v8 handle:v9 contactIdentifier:v10];

        v11 = self;
LABEL_12:

        goto LABEL_13;
      }
      id v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BMNamedHandle initWithProto:](v12);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMNamedHandle initWithProto:](v5);
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BMNamedHandle)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBNamedHandle alloc] initWithData:v4];

    self = [(BMNamedHandle *)self initWithProto:v5];
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
  id v4 = [(BMNamedHandle *)self name];
  [v3 setName:v4];

  id v5 = [(BMNamedHandle *)self handleType];
  [v3 setHandleType:v5];

  id v6 = [(BMNamedHandle *)self handle];
  [v3 setHandle:v6];

  uint64_t v7 = [(BMNamedHandle *)self contactIdentifier];
  [v3 setContactIdentifier:v7];

  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_handle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_34;
  }
  id v7 = v6;
  id v8 = v7;
  name = self->_name;
  v10 = name;
  if (!name)
  {
    uint64_t v11 = [v7 name];
    if (!v11)
    {
      v31 = 0;
      int v12 = 0;
      goto LABEL_10;
    }
    v31 = (void *)v11;
    v10 = self->_name;
  }
  v3 = [v8 name];
  if (![(NSString *)v10 isEqualToString:v3])
  {

    char v13 = 0;
    goto LABEL_31;
  }
  int v12 = 1;
LABEL_10:
  handleType = self->_handleType;
  id v15 = handleType;
  if (!handleType)
  {
    uint64_t v16 = [v8 handleType];
    if (!v16)
    {
      v28 = 0;
      int v29 = 0;
      goto LABEL_19;
    }
    v28 = (void *)v16;
    id v15 = self->_handleType;
  }
  id v4 = [v8 handleType];
  if (![(NSString *)v15 isEqualToString:v4])
  {

    char v13 = 0;
    if (handleType) {
      goto LABEL_29;
    }
LABEL_16:

    if ((v12 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  int v29 = 1;
LABEL_19:
  handle = self->_handle;
  v18 = [v8 handle];
  int v30 = v12;
  if (![(NSString *)handle isEqualToString:v18])
  {
    char v13 = 0;
    int v24 = v29;
    goto LABEL_26;
  }
  contactIdentifier = self->_contactIdentifier;
  objc_super v20 = contactIdentifier;
  if (!contactIdentifier)
  {
    uint64_t v21 = [v8 contactIdentifier];
    if (!v21)
    {
      v27 = 0;
      char v13 = 1;
      LOBYTE(v24) = v29;
      goto LABEL_36;
    }
    uint64_t v26 = v21;
    objc_super v20 = self->_contactIdentifier;
  }
  v22 = v20;
  v23 = objc_msgSend(v8, "contactIdentifier", v26, v28);
  char v13 = [(NSString *)v22 isEqualToString:v23];

  int v24 = v29;
  if (contactIdentifier)
  {
LABEL_26:

    if (!v24) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_36:

  if (v24) {
LABEL_27:
  }

LABEL_28:
  int v12 = v30;
  if (!handleType) {
    goto LABEL_16;
  }
LABEL_29:
  if (v12) {
LABEL_30:
  }

LABEL_31:
  if (!name) {

  }
LABEL_34:
  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  handle = self->_handle;
  if (a4 && !handle)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return handle != 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)handleType
{
  return self->_handleType;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handleType, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNamedHandle: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMNamedHandle: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNamedHandle: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMNamedHandle: tried to initialize with a non-BMNamedHandle proto", v1, 2u);
}

@end