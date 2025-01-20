@interface BMDSLWindower
+ (BOOL)supportsSecureCoding;
+ (id)name;
- (BMDSL)upstream;
- (BMDSLWindowAssigner)assigner;
- (BMDSLWindower)initWithCoder:(id)a3;
- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5;
- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (NSString)keyedPath;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLWindower

+ (id)name
{
  return @"windower";
}

- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a7 == 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)BMDSLWindower;
    v16 = [(BMDSLBaseCodable *)&v23 initWithName:a6 version:1];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a3);
      uint64_t v18 = [v14 copy];
      keyedPath = v17->_keyedPath;
      v17->_keyedPath = (NSString *)v18;

      objc_storeStrong((id *)&v17->_assigner, a5);
    }
    self = v17;
    v20 = self;
  }
  else
  {
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[BMDSLWindower initWithUpstream:keyedPath:assigner:name:version:](a7, v21);
    }

    v20 = 0;
  }

  return v20;
}

- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5
{
  return [(BMDSLWindower *)self initWithUpstream:a3 keyedPath:a4 assigner:a5 name:@"windower" version:1];
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLWindower *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLWindower;
  [(BMDSLBaseCodable *)&v9 encodeWithCoder:v4];
  v5 = [(BMDSLWindower *)self upstream];
  [v4 encodeObject:v5 forKey:@"upstream"];

  v6 = [(BMDSLWindower *)self assigner];
  [v4 encodeObject:v6 forKey:@"assigner"];

  v7 = [(BMDSLWindower *)self keyedPath];

  if (v7)
  {
    v8 = [(BMDSLWindower *)self keyedPath];
    [v4 encodeObject:v8 forKey:@"keyedPath"];
  }
}

- (BMDSLWindower)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLWindower;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"upstream"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyedPath"];
    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assigner"];
    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLWindower *)v5 initWithUpstream:v7 keyedPath:v8 assigner:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (NSString)keyedPath
{
  return self->_keyedPath;
}

- (BMDSLWindowAssigner)assigner
{
  return self->_assigner;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong((id *)&self->_keyedPath, 0);
}

- (id)bpsPublisher
{
  v3 = [(BMDSLWindower *)self upstream];
  id v4 = [v3 bpsPublisher];

  v5 = [(BMDSLWindower *)self assigner];
  v6 = [v5 bpsWindowAssigner];

  v7 = [(BMDSLWindower *)self keyedPath];

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__BMDSLWindower_BPSPubSub__bpsPublisher__block_invoke;
    v11[3] = &unk_1E6021708;
    v11[4] = self;
    uint64_t v8 = [v4 windowByKey:v11 assigner:v6];
  }
  else
  {
    uint64_t v8 = [v4 windowWithAssigner:v6];
  }
  objc_super v9 = (void *)v8;

  return v9;
}

id __40__BMDSLWindower_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 keyedPath];
  v5 = BMDSLValueForKeyPath(v3, v4);

  return v5;
}

- (void)initWithUpstream:(int)a1 keyedPath:(NSObject *)a2 assigner:name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLWindower", (uint8_t *)v2, 8u);
}

@end