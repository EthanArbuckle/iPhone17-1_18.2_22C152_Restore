@interface BMDSLCollect
+ (BOOL)supportsSecureCoding;
- (BMDSL)upstream;
- (BMDSLCollect)initWithCoder:(id)a3;
- (BMDSLCollect)initWithUpstream:(id)a3;
- (BMDSLCollect)initWithUpstream:(id)a3 name:(id)a4 version:(unsigned int)a5;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLCollect

- (BMDSLCollect)initWithUpstream:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  id v9 = a3;
  if (a5 == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)BMDSLCollect;
    v10 = [(BMDSLBaseCodable *)&v15 initWithName:a4 version:1];
    v11 = v10;
    if (v10) {
      objc_storeStrong((id *)&v10->_upstream, a3);
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMDSLCollect initWithUpstream:name:version:](a5, v13);
    }

    v12 = 0;
  }

  return v12;
}

- (BMDSLCollect)initWithUpstream:(id)a3
{
  return [(BMDSLCollect *)self initWithUpstream:a3 name:@"collect" version:1];
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLCollect *)self upstream];
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
  v6.receiver = self;
  v6.super_class = (Class)BMDSLCollect;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  v5 = [(BMDSLCollect *)self upstream];
  [v4 encodeObject:v5 forKey:@"upstream"];
}

- (BMDSLCollect)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLCollect;
  v5 = [(BMDSLBaseCodable *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = +[BMDSLClasses allowed];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"upstream"];

    v8 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLCollect *)v5 initWithUpstream:v7 name:v8 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
}

- (id)bpsPublisher
{
  v2 = [(BMDSLCollect *)self upstream];
  v3 = [v2 bpsPublisher];

  id v4 = [v3 collect];

  return v4;
}

- (void)initWithUpstream:(int)a1 name:(NSObject *)a2 version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLCollect", (uint8_t *)v2, 8u);
}

@end