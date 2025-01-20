@interface BMDSLOrderedMerge
+ (BOOL)supportsSecureCoding;
- (BMDSL)a;
- (BMDSL)b;
- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6;
- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6 name:(id)a7 version:(unsigned int)a8;
- (BMDSLOrderedMerge)initWithCoder:(id)a3;
- (NSString)key;
- (NSString)selectorName;
- (id)bpsPublisher;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLOrderedMerge

- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6 name:(id)a7 version:(unsigned int)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (a8 != 1)
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:](a8, v24);
    }

    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)BMDSLOrderedMerge;
  v18 = [(BMDSLBaseCodable *)&v27 initWithName:a7 version:1];
  self = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_a, a3);
    objc_storeStrong((id *)&self->_b, a4);
    objc_storeStrong((id *)&self->_key, a5);
    NSStringFromSelector(a6);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectorName = self->_selectorName;
    self->_selectorName = v19;

    v21 = +[BMDSLTransforms allowedTransforms];
    char v22 = [v21 containsObject:self->_selectorName];

    if ((v22 & 1) == 0)
    {
      v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:]((uint64_t *)&self->_selectorName, v25);
      }

LABEL_11:
      v23 = 0;
      goto LABEL_12;
    }
  }
  self = self;
  v23 = self;
LABEL_12:

  return v23;
}

- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6
{
  return [(BMDSLOrderedMerge *)self initWithA:a3 b:a4 key:a5 selector:a6 name:@"orderedMerge" version:1];
}

- (id)upstreams
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMDSLOrderedMerge *)self a];
  v7[0] = v3;
  v4 = [(BMDSLOrderedMerge *)self b];
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
  v9.receiver = self;
  v9.super_class = (Class)BMDSLOrderedMerge;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v9 encodeWithCoder:v4];
  v5 = [(BMDSLOrderedMerge *)self a];
  [v4 encodeObject:v5 forKey:@"first"];

  v6 = [(BMDSLOrderedMerge *)self b];
  [v4 encodeObject:v6 forKey:@"second"];

  v7 = [(BMDSLOrderedMerge *)self key];
  [v4 encodeObject:v7 forKey:@"key"];

  v8 = [(BMDSLOrderedMerge *)self selectorName];
  [v4 encodeObject:v8 forKey:@"selector"];
}

- (BMDSLOrderedMerge)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLOrderedMerge;
  v5 = [(BMDSLBaseCodable *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = v5;
    v7 = +[BMDSLClasses allowed];
    v8 = [v4 decodeObjectOfClasses:v7 forKey:@"first"];

    objc_super v9 = +[BMDSLClasses allowed];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"second"];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selector"];
    v13 = +[BMDSLTransforms allowedTransforms];
    char v14 = [v13 containsObject:v12];

    if (v14)
    {
      SEL v15 = NSSelectorFromString(v12);
      id v16 = [(BMDSLBaseCodable *)v6 name];
      v6 = [(BMDSLOrderedMerge *)v6 initWithA:v8 b:v10 key:v11 selector:v15 name:v16 version:[(BMDSLBaseCodable *)v6 version]];
      id v17 = v6;
    }
    else
    {
      id v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BMDSLOrderedMerge initWithCoder:]((uint64_t)v12, v16);
      }
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BMDSL)a
{
  return self->_a;
}

- (BMDSL)b
{
  return self->_b;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)selectorName
{
  return self->_selectorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

- (id)bpsPublisher
{
  v3 = [(BMDSLOrderedMerge *)self a];
  id v4 = [v3 bpsPublisher];

  v5 = [(BMDSLOrderedMerge *)self b];
  v6 = [v5 bpsPublisher];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__BMDSLOrderedMerge_BPSPubSub__bpsPublisher__block_invoke;
  v9[3] = &unk_1E60217A8;
  v9[4] = self;
  v7 = [v4 orderedMergeWithOther:v6 comparator:v9];

  return v7;
}

uint64_t __44__BMDSLOrderedMerge_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  v8 = [v5 selectorName];
  SEL v9 = NSSelectorFromString(v8);

  v10 = [*(id *)(a1 + 32) key];
  v11 = BMDSLValueForKeyPath(v7, v10);

  v12 = [*(id *)(a1 + 32) key];
  v13 = BMDSLValueForKeyPath(v6, v12);

  uint64_t v14 = ((uint64_t (*)(void *, SEL, void *))[v11 methodForSelector:v9])(v11, v9, v13);
  return v14;
}

- (void)initWithA:(uint64_t *)a1 b:(NSObject *)a2 key:selector:name:version:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Init: Selector name not in allow list (%@)", (uint8_t *)&v3, 0xCu);
}

- (void)initWithA:(int)a1 b:(NSObject *)a2 key:selector:name:version:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Unexpected version %u. Failed to initialize BMDSLOrderedMerge", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B3086000, a2, OS_LOG_TYPE_FAULT, "Decoded selector name not in allow list for ordered merge (%@)", (uint8_t *)&v2, 0xCu);
}

@end