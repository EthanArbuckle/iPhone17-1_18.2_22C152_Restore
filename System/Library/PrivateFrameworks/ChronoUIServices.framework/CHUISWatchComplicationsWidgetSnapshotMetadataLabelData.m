@interface CHUISWatchComplicationsWidgetSnapshotMetadataLabelData
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithBSXPCCoder:(id)a3;
- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithData:(id)a3;
- (NSData)data;
- (id)copyForEncodingAtUrlDirectory:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataFileHandle;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation CHUISWatchComplicationsWidgetSnapshotMetadataLabelData

- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadataLabelData;
  v6 = [(CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (id)copyForEncodingAtUrlDirectory:(id)a3
{
  id v4 = a3;
  if (self->_data)
  {
    id v5 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v6 = [v5 UUIDString];
    v7 = [v4 URLByAppendingPathComponent:v6];

    data = self->_data;
    id v20 = 0;
    LOBYTE(v6) = [(NSData *)data writeToURL:v7 options:1 error:&v20];
    id v9 = v20;
    if (v6)
    {
      id v19 = v9;
      uint64_t v10 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v7 error:&v19];
      id v11 = v19;

      if (v10)
      {
        id v9 = v11;
        uint64_t v12 = v10;
LABEL_12:
        v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v14 removeItemAtURL:v7 error:0];

        goto LABEL_13;
      }
      v13 = CHUISLogViewController();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData copyForEncodingAtUrlDirectory:]();
      }
      id v9 = v11;
    }
    else
    {
      v13 = CHUISLogViewController();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData copyForEncodingAtUrlDirectory:]();
      }
    }

    uint64_t v12 = 0;
    goto LABEL_12;
  }
  uint64_t v12 = 0;
LABEL_13:
  v15 = (void *)[(CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *)self copy];
  v16 = (void *)v15[1];
  v15[1] = 0;

  v17 = (void *)v15[2];
  v15[2] = v12;

  return v15;
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    dataFileHandle = self->_dataFileHandle;
    if (!dataFileHandle) {
      goto LABEL_5;
    }
    id v5 = [(NSFileHandle *)dataFileHandle readDataToEndOfFile];
    uint64_t v6 = self->_data;
    self->_data = v5;

    v7 = self->_dataFileHandle;
    self->_dataFileHandle = 0;

    data = self->_data;
  }
  dataFileHandle = data;
LABEL_5:

  return (NSData *)dataFileHandle;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_data];
  id v5 = (id)[v3 appendObject:self->_dataFileHandle];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builder];
  data = self->_data;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke;
  v18[3] = &unk_1E62AF708;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:data counterpart:v18];
  dataFileHandle = self->_dataFileHandle;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke_2;
  v16 = &unk_1E62AF708;
  id v10 = v7;
  id v17 = v10;
  id v11 = (id)[v5 appendObject:dataFileHandle counterpart:&v13];
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)v7;
}

id __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __66__CHUISWatchComplicationsWidgetSnapshotMetadataLabelData_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_data, self->_data);
  objc_storeStrong((id *)&v4->_dataFileHandle, self->_dataFileHandle);
  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  if (self->_data)
  {
    id v5 = CHUISLogViewController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[CHUISWatchComplicationsWidgetSnapshotMetadataLabelData encodeWithBSXPCCoder:](v5);
    }
  }
  [v4 encodeObject:self->_dataFileHandle forKey:@"dataFileHandle"];
}

- (CHUISWatchComplicationsWidgetSnapshotMetadataLabelData)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetSnapshotMetadataLabelData;
  id v5 = [(CHUISWatchComplicationsWidgetSnapshotMetadataLabelData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataFileHandle"];
    dataFileHandle = v5->_dataFileHandle;
    v5->_dataFileHandle = (NSFileHandle *)v6;
  }
  return v5;
}

- (id)dataFileHandle
{
  return self->_dataFileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileHandle, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)copyForEncodingAtUrlDirectory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BC3F1000, v0, OS_LOG_TYPE_ERROR, "%s: failed to create file handle: %@", (uint8_t *)v1, 0x16u);
}

- (void)copyForEncodingAtUrlDirectory:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BC3F1000, v0, OS_LOG_TYPE_ERROR, "%s: failed to encode: %@", (uint8_t *)v1, 0x16u);
}

- (void)encodeWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BC3F1000, log, OS_LOG_TYPE_FAULT, "Shouldn't be encoded with data", v1, 2u);
}

@end