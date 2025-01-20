@interface BMDSLMerge
+ (BOOL)supportsSecureCoding;
- (BMDSL)a;
- (BMDSL)b;
- (BMDSLMerge)initWithA:(id)a3 b:(id)a4;
- (BMDSLMerge)initWithA:(id)a3 b:(id)a4 name:(id)a5 version:(unsigned int)a6;
- (BMDSLMerge)initWithCoder:(id)a3;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLMerge

- (id)bpsPublisher
{
  v3 = [(BMDSLMerge *)self a];
  v4 = [v3 bpsPublisher];

  v5 = [(BMDSLMerge *)self b];
  v6 = [v5 bpsPublisher];

  v7 = [v4 mergeWithOther:v6];

  return v7;
}

- (BMDSLMerge)initWithA:(id)a3 b:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLMerge;
    v13 = [(BMDSLBaseCodable *)&v18 initWithName:a5 version:1];
    p_isa = (id *)&v13->super.super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_a, a3);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BMDSLMerge initWithA:b:name:version:](a6, v16);
    }

    v15 = 0;
  }

  return v15;
}

- (BMDSLMerge)initWithA:(id)a3 b:(id)a4
{
  return [(BMDSLMerge *)self initWithA:a3 b:a4 name:@"merge" version:1];
}

- (id)upstreams
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDSLMerge *)self a];
  v7[0] = v3;
  v4 = [(BMDSLMerge *)self b];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLMerge;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  v5 = [(BMDSLMerge *)self a];
  [v4 encodeObject:v5 forKey:@"first"];

  v6 = [(BMDSLMerge *)self b];
  [v4 encodeObject:v6 forKey:@"second"];
}

- (BMDSLMerge)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMerge;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = +[BMDSLClasses allowed];
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:@"first"];

    v8 = +[BMDSLClasses allowed];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"second"];

    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLMerge *)v5 initWithA:v7 b:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (BMDSL)a
{
  return self->_a;
}

- (BMDSL)b
{
  return self->_b;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

- (void)initWithA:(int)a1 b:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Unexpected version %u. Failed to initialize BMDSLMerge", (uint8_t *)v2, 8u);
}

@end