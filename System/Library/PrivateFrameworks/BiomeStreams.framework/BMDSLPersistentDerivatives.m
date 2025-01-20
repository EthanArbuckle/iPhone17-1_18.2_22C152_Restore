@interface BMDSLPersistentDerivatives
+ (BOOL)supportsSecureCoding;
- (BMDSL)upstream;
- (BMDSLPersistentDerivatives)initWithCoder:(id)a3;
- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5;
- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (NSString)tableName;
- (NSURL)url;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLPersistentDerivatives

- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a7 == 1)
  {
    v25.receiver = self;
    v25.super_class = (Class)BMDSLPersistentDerivatives;
    v16 = [(BMDSLBaseCodable *)&v25 initWithName:a6 version:1];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a3);
      uint64_t v18 = [v14 copy];
      url = v17->_url;
      v17->_url = (NSURL *)v18;

      uint64_t v20 = [v15 copy];
      tableName = v17->_tableName;
      v17->_tableName = (NSString *)v20;
    }
    self = v17;
    v22 = self;
  }
  else
  {
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BMDSLPersistentDerivatives initWithUpstream:databaseURL:derivedTableName:name:version:](a7, v23);
    }

    v22 = 0;
  }

  return v22;
}

- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5
{
  return [(BMDSLPersistentDerivatives *)self initWithUpstream:a3 databaseURL:a4 derivedTableName:a5 name:@"persistentderivatives" version:1];
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLPersistentDerivatives *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)bpsPublisher
{
  v3 = [BMPersistentDerivatives alloc];
  v4 = [(BMDSLPersistentDerivatives *)self upstream];
  v5 = [v4 bpsPublisher];
  v6 = [(BMDSLPersistentDerivatives *)self url];
  v7 = [(BMDSLPersistentDerivatives *)self tableName];
  v8 = [(BMPersistentDerivatives *)v3 initWithUpstream:v5 derivativeDatabaseURL:v6 derivedTableName:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BMDSLPersistentDerivatives;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  v5 = [(BMDSLPersistentDerivatives *)self upstream];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F4FA70]];

  v6 = [(BMDSLPersistentDerivatives *)self url];
  [v4 encodeObject:v6 forKey:@"url"];

  v7 = [(BMDSLPersistentDerivatives *)self tableName];
  [v4 encodeObject:v7 forKey:@"tableName"];
}

- (BMDSLPersistentDerivatives)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLPersistentDerivatives;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4FA28] allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F4FA70]];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableName"];
    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLPersistentDerivatives *)v5 initWithUpstream:v7 databaseURL:v8 derivedTableName:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithUpstream:(int)a1 databaseURL:(NSObject *)a2 derivedTableName:name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLPersistentDerivatives", (uint8_t *)v2, 8u);
}

@end