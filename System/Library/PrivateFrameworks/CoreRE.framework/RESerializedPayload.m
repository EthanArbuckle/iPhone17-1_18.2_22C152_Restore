@interface RESerializedPayload
+ (BOOL)supportsSecureCoding;
- (NSString)typeName;
- (OS_dispatch_data)blobData;
- (OS_dispatch_data)serializedData;
- (RESerializedPayload)initWithCoder:(id)a3;
- (RESerializedPayload)initWithTypeName:(id)a3 serializedBytes:(const void *)a4 size:(unint64_t)a5 blobBytes:(const void *)a6 size:(unint64_t)a7;
- (id)description;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RESerializedPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESerializedPayload)initWithTypeName:(id)a3 serializedBytes:(const void *)a4 size:(unint64_t)a5 blobBytes:(const void *)a6 size:(unint64_t)a7
{
  id v13 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RESerializedPayload;
  v14 = [(RESharedResourcePayload *)&v23 init];
  if (v14)
  {
    dispatch_data_t v15 = (dispatch_data_t)MEMORY[0x263EF8388];
    id v16 = MEMORY[0x263EF8388];
    if (a4 && a5)
    {
      dispatch_data_t v15 = dispatch_data_create(a4, a5, 0, 0);
    }
    dispatch_data_t v17 = (dispatch_data_t)MEMORY[0x263EF8388];
    id v18 = MEMORY[0x263EF8388];
    if (a6 && a7)
    {
      dispatch_data_t v17 = dispatch_data_create(a6, a7, 0, 0);
    }
    objc_storeStrong((id *)&v14->_typeName, a3);
    serializedData = v14->_serializedData;
    v14->_serializedData = (OS_dispatch_data *)v15;
    v20 = v15;

    blobData = v14->_blobData;
    v14->_blobData = (OS_dispatch_data *)v17;
  }
  return v14;
}

- (RESerializedPayload)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RESerializedPayload;
  v5 = [(RESharedResourcePayload *)&v21 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeName"];
  typeName = v5->_typeName;
  v5->_typeName = (NSString *)v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedData"];
  uint64_t v9 = [v8 _createDispatchData];
  serializedData = v5->_serializedData;
  v5->_serializedData = (OS_dispatch_data *)v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blobData"];
  uint64_t v12 = [v11 _createDispatchData];
  blobData = v5->_blobData;
  v5->_blobData = (OS_dispatch_data *)v12;

  if (!v5->_serializedData)
  {
    id v16 = *re::foundationSerializationLogObjects(v14);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      dispatch_data_t v15 = 0;
      goto LABEL_9;
    }
    dispatch_data_t v17 = v5->_typeName;
    *(_DWORD *)buf = 138412290;
    objc_super v23 = v17;
    id v18 = "Failed to decode serialized data object for serialized payload of type %@";
LABEL_11:
    _os_log_fault_impl(&dword_233120000, v16, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_8;
  }
  if (!v5->_blobData)
  {
    id v16 = *re::foundationSerializationLogObjects(v14);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_8;
    }
    v20 = v5->_typeName;
    *(_DWORD *)buf = 138412290;
    objc_super v23 = v20;
    id v18 = "Failed to decode blob data object for serialized payload of type %@";
    goto LABEL_11;
  }
LABEL_4:
  dispatch_data_t v15 = v5;
LABEL_9:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  typeName = self->_typeName;
  id v5 = a3;
  [v5 encodeObject:typeName forKey:@"typeName"];
  [v5 encodeObject:self->_serializedData forKey:@"serializedData"];
  [v5 encodeObject:self->_blobData forKey:@"blobData"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<RESerializedPayload: %@: %@>", self->_typeName, self->_serializedData];
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<RESerializedPayload: %@>", self->_typeName];
}

- (NSString)typeName
{
  return self->_typeName;
}

- (OS_dispatch_data)serializedData
{
  return self->_serializedData;
}

- (OS_dispatch_data)blobData
{
  return self->_blobData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blobData, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
}

@end