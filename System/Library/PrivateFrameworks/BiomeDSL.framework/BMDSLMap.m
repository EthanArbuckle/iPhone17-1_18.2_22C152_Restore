@interface BMDSLMap
+ (BOOL)supportsSecureCoding;
+ (id)name;
- (BMDSL)upstream;
- (BMDSLMap)initWithCoder:(id)a3;
- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4;
- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4 name:(id)a5 version:(unsigned int)a6;
- (BMDSLTransform)transform;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLMap

- (id)bpsPublisher
{
  v3 = [(BMDSLMap *)self upstream];
  v4 = [v3 bpsPublisher];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__BMDSLMap_BPSPubSub__bpsPublisher__block_invoke;
  v7[3] = &unk_1E6021688;
  v7[4] = self;
  v5 = [v4 mapWithTransform:v7];

  return v5;
}

id __35__BMDSLMap_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)BMDSLMap;
  id v3 = a2;
  v4 = objc_msgSendSuper2(&v8, sel_combinedState);
  v5 = objc_msgSend(*(id *)(a1 + 32), "transform", v8.receiver, v8.super_class);
  v6 = [v5 transformInput:v3 combinedState:v4];

  return v6;
}

+ (id)name
{
  return @"map";
}

- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLMap;
    v13 = [(BMDSLBaseCodable *)&v18 initWithName:a5 version:1];
    p_isa = (id *)&v13->super.super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_upstream, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMDSLMap initWithUpstream:transform:name:version:](a6, v16);
    }

    v15 = 0;
  }

  return v15;
}

- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4
{
  return [(BMDSLMap *)self initWithUpstream:a3 transform:a4 name:@"map" version:1];
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLMap *)self upstream];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLMap;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  v5 = [(BMDSLMap *)self upstream];
  [v4 encodeObject:v5 forKey:@"upstream"];

  v6 = [(BMDSLMap *)self transform];
  [v4 encodeObject:v6 forKey:@"transform"];
}

- (BMDSLMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMap;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = +[BMDSLClasses allowed];
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:@"upstream"];

    objc_super v8 = +[BMDSLClasses allowed];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transform"];

    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLMap *)v5 initWithUpstream:v7 transform:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (BMDSLTransform)transform
{
  return self->_transform;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_transform, 0);
}

- (void)initWithUpstream:(int)a1 transform:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLMap", (uint8_t *)v2, 8u);
}

@end