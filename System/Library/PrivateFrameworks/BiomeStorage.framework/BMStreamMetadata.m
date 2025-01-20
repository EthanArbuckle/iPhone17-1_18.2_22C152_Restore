@interface BMStreamMetadata
+ (BOOL)supportsSecureCoding;
- (BMAccount)account;
- (BMPruningPolicy)pruningPolicy;
- (BMStreamMetadata)initWithCoder:(id)a3;
- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 account:(id)a5 remoteStreamName:(id)a6 pruningPolicy:(id)a7;
- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 remoteStreamName:(id)a5 pruningPolicy:(id)a6;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemote;
- (Class)eventDataClass;
- (NSString)remoteStreamName;
- (NSString)streamId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setRemoteStreamName:(id)a3;
@end

@implementation BMStreamMetadata

- (Class)eventDataClass
{
  return self->_eventDataClass;
}

- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 account:(id)a5 remoteStreamName:(id)a6 pruningPolicy:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BMStreamMetadata;
  v16 = [(BMStreamMetadata *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    streamId = v16->_streamId;
    v16->_streamId = (NSString *)v17;

    objc_storeStrong((id *)&v16->_eventDataClass, a4);
    objc_storeStrong((id *)&v16->_account, a5);
    uint64_t v19 = [v14 copy];
    remoteStreamName = v16->_remoteStreamName;
    v16->_remoteStreamName = (NSString *)v19;

    objc_storeStrong((id *)&v16->_pruningPolicy, a7);
  }

  return v16;
}

- (void)setRemoteStreamName:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteStreamName, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_eventDataClass, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
}

- (BMStreamMetadata)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamId"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventType"];
  if (![(BMStreamMetadata *)self checkAndReportDecodingFailureIfNeededForid:v6 key:@"eventType" coder:v4 errorDomain:@"com.apple.biome.BMStreamMetadata" errorCode:-1])
  {
    Class v8 = NSClassFromString(v6);
    if (!v8)
    {
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BMStreamMetadata initWithCoder:]((uint64_t)v6, v15);
      }
      v7 = 0;
      goto LABEL_26;
    }
    Class v9 = v8;
    if (objc_opt_respondsToSelector())
    {
      v10 = [v4 allowedClasses];
      char v11 = [v10 containsObject:v9];

      if (v11) {
        goto LABEL_19;
      }
      id v12 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v38 = 16;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __34__BMStreamMetadata_initWithCoder___block_invoke_39;
      v35[3] = &unk_1E5E78708;
      v35[4] = buf;
      if (initWithCoder__onceToken_38 != -1) {
        dispatch_once(&initWithCoder__onceToken_38, v35);
      }
      os_log_type_t v13 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1AD076000, v12, v13, "Event class '%@' missing from %@ allowedClasses", buf, 0x16u);
      }
    }
    else
    {
      id v12 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v38 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__BMStreamMetadata_initWithCoder___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (initWithCoder__onceToken_0 != -1) {
        dispatch_once(&initWithCoder__onceToken_0, block);
      }
      os_log_type_t v16 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v12, v16))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl(&dword_1AD076000, v12, v16, "Class \"%@\" doesn't conform to BMStoreData", buf, 0xCu);
      }
      Class v9 = 0;
    }

LABEL_19:
    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v15 = objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v15 forKey:@"pruningPolicy"];
    if (v20)
    {
      if ([(BMStreamMetadata *)self checkAndReportDecodingFailureIfNeededForid:v20 key:@"pruningPolicy" coder:v4 errorDomain:@"com.apple.biome.BMStreamMetadata" errorCode:-1])
      {
        v7 = 0;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      v32 = [BMPruningPolicy alloc];
      v33 = [v20 objectForKeyedSubscript:@"pruneOnAccess"];
      BOOL v31 = [v33 unsignedIntegerValue] != 0;
      [v20 objectForKeyedSubscript:@"filterByAgeOnRead"];
      objc_super v22 = v34 = v5;
      uint64_t v23 = [v22 BOOLValue];
      v24 = [v20 objectForKeyedSubscript:@"maxAge"];
      [v24 doubleValue];
      double v26 = v25;
      v27 = [v20 objectForKeyedSubscript:@"maxStreamSize"];
      id v21 = -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:](v32, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", v31, v23, [v27 unsignedIntValue], v26);

      v5 = v34;
    }
    else
    {
      id v21 = 0;
    }
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteName"];
    self = [(BMStreamMetadata *)self initWithStreamId:v5 eventType:v9 account:v28 remoteStreamName:v29 pruningPolicy:v21];

    v7 = self;
    goto LABEL_25;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      os_log_type_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BMStreamMetadata *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      streamId = self->_streamId;
      if ((streamId == v5->_streamId || -[NSString isEqual:](streamId, "isEqual:"))
        && (Class eventDataClass = self->_eventDataClass,
            eventDataClass == [(BMStreamMetadata *)v5 eventDataClass])
        && ((account = self->_account, account == v5->_account)
         || -[BMAccount isEqual:](account, "isEqual:"))
        && ((remoteStreamName = self->_remoteStreamName, remoteStreamName == v5->_remoteStreamName)
         || -[NSString isEqual:](remoteStreamName, "isEqual:")))
      {
        pruningPolicy = self->_pruningPolicy;
        id v13 = [(BMStreamMetadata *)v5 pruningPolicy];
        if (pruningPolicy == v13)
        {
          char v8 = 1;
        }
        else
        {
          BOOL v14 = self->_pruningPolicy;
          id v15 = [(BMStreamMetadata *)v5 pruningPolicy];
          char v8 = [(BMPruningPolicy *)v14 isEqual:v15];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 remoteStreamName:(id)a5 pruningPolicy:(id)a6
{
  return [(BMStreamMetadata *)self initWithStreamId:a3 eventType:a4 account:0 remoteStreamName:a5 pruningPolicy:a6];
}

- (BOOL)isRemote
{
  return self->_remoteStreamName != 0;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_streamId hash];
  uint64_t v4 = [(objc_class *)self->_eventDataClass hash] ^ v3;
  uint64_t v5 = [(BMAccount *)self->_account hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_remoteStreamName hash];
  return v6 ^ [(BMPruningPolicy *)self->_pruningPolicy hash];
}

- (void)encodeWithCoder:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_streamId forKey:@"streamId"];
  uint64_t v5 = NSStringFromClass(self->_eventDataClass);
  if (!v5)
  {
    NSUInteger v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMStreamMetadata encodeWithCoder:](v6);
    }
  }
  [v4 encodeObject:v5 forKey:@"eventType"];
  pruningPolicy = self->_pruningPolicy;
  if (pruningPolicy)
  {
    v14[0] = @"pruneOnAccess";
    char v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[BMPruningPolicy pruneOnAccess](pruningPolicy, "pruneOnAccess"));
    v15[0] = v8;
    v14[1] = @"maxAge";
    Class v9 = (void *)MEMORY[0x1E4F28ED0];
    [(BMPruningPolicy *)self->_pruningPolicy maxAge];
    v10 = objc_msgSend(v9, "numberWithDouble:");
    v15[1] = v10;
    v14[2] = @"maxStreamSize";
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[BMPruningPolicy maxStreamSize](self->_pruningPolicy, "maxStreamSize"));
    v15[2] = v11;
    v14[3] = @"filterByAgeOnRead";
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[BMPruningPolicy filterByAgeOnRead](self->_pruningPolicy, "filterByAgeOnRead"));
    v15[3] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

    [v4 encodeObject:v13 forKey:@"pruningPolicy"];
  }
  [v4 encodeObject:self->_account forKey:@"account"];
  [v4 encodeObject:self->_remoteStreamName forKey:@"remoteName"];
}

uint64_t __34__BMStreamMetadata_initWithCoder___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __34__BMStreamMetadata_initWithCoder___block_invoke_39(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (NSString)remoteStreamName
{
  return self->_remoteStreamName;
}

- (BMAccount)account
{
  return self->_account;
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AD076000, log, OS_LOG_TYPE_ERROR, "Can't get class string", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Can't get class from class string - %@", (uint8_t *)&v2, 0xCu);
}

@end