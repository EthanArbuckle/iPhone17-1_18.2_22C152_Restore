@interface BMDSLTableMap
+ (BOOL)supportsSecureCoding;
- (BMDSL)upstream;
- (BMDSLRowTransform)transform;
- (BMDSLTableMap)initWithCoder:(id)a3;
- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5;
- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (BMTableSchema)schema;
- (id)bpsPublisher;
- (id)select:(id)a3;
- (id)upstreams;
- (void)encodeWithCoder:(id)a3;
- (void)setSchema:(id)a3;
- (void)setTransform:(id)a3;
- (void)setUpstream:(id)a3;
@end

@implementation BMDSLTableMap

- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLTableMap;
  v16 = [(BMDSLBaseCodable *)&v19 initWithName:a6 version:v7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_upstream, a3);
    objc_storeStrong((id *)&v17->_transform, a4);
    objc_storeStrong((id *)&v17->_schema, a5);
  }

  return v17;
}

- (BMDSLTableMap)initWithUpstream:(id)a3 transform:(id)a4 schema:(id)a5
{
  return [(BMDSLTableMap *)self initWithUpstream:a3 transform:a4 schema:a5 name:@"tableMap" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableMap;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  v5 = [(BMDSLTableMap *)self upstream];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F4FA70]];

  v6 = [(BMDSLTableMap *)self transform];
  [v4 encodeObject:v6 forKey:@"transform"];

  uint64_t v7 = [(BMDSLTableMap *)self schema];
  [v4 encodeObject:v7 forKey:@"schema"];
}

- (BMDSLTableMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLTableMap;
  v5 = [(BMDSLBaseCodable *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4FA28] allowed];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F4FA70]];

    objc_super v8 = [MEMORY[0x1E4F4FA28] allowed];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transform"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
    v11 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLTableMap *)v5 initWithUpstream:v7 transform:v9 schema:v10 name:v11 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)upstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMDSLTableMap *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)bpsPublisher
{
  v3 = [(BMDSLTableMap *)self upstream];
  id v4 = [v3 bpsPublisher];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__BMDSLTableMap_bpsPublisher__block_invoke;
  v7[3] = &unk_1E55D7070;
  v7[4] = self;
  v5 = [v4 mapWithTransform:v7];

  return v5;
}

id __29__BMDSLTableMap_bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v5 = v3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v11 = [*(id *)(a1 + 32) transform];
          v12 = [v11 rowFromInput:v10];

          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F4FA98]);
    id v14 = (void *)[v4 copy];
    id v15 = [*(id *)(a1 + 32) schema];
    v16 = (void *)[v13 initWithRows:v14 schema:v15];
  }
  else
  {
    v17 = [*(id *)(a1 + 32) transform];
    id v4 = [v17 rowFromInput:v3];

    id v18 = objc_alloc(MEMORY[0x1E4F4FA98]);
    v24 = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v14 = [*(id *)(a1 + 32) schema];
    v16 = (void *)[v18 initWithRows:v5 schema:v14];
  }

  return v16;
}

- (id)select:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F4FA90];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = (void *)[v6 initWithChildren:MEMORY[0x1E4F1CBF0] columnNames:v5];

  uint64_t v8 = [[BMDSLTableStream alloc] initWithUpstream:self expression:v7];

  return v8;
}

- (BMDSLRowTransform)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void)setUpstream:(id)a3
{
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_upstream, 0);

  objc_storeStrong((id *)&self->_transform, 0);
}

@end