@interface BMDSLTableAggregator
+ (BOOL)supportsSecureCoding;
- (BMDSLTableAggregator)initWithCoder:(id)a3;
- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4;
- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5;
- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (NSArray)classKeyPaths;
- (NSArray)classNames;
- (NSArray)transforms;
- (id)bpsAggregator;
- (void)encodeWithCoder:(id)a3;
- (void)setTransforms:(id)a3;
@end

@implementation BMDSLTableAggregator

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a7 == 1)
  {
    v25.receiver = self;
    v25.super_class = (Class)BMDSLTableAggregator;
    v16 = [(BMDSLBaseCodable *)&v25 initWithName:a6 version:1];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_transforms, a3);
      uint64_t v18 = [v14 copy];
      classNames = v17->_classNames;
      v17->_classNames = (NSArray *)v18;

      uint64_t v20 = [v15 copy];
      classKeyPaths = v17->_classKeyPaths;
      v17->_classKeyPaths = (NSArray *)v20;
    }
    self = v17;
    v22 = self;
  }
  else
  {
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BMDSLTableAggregator initWithTableTransforms:classNames:classKeyPaths:name:version:](a7, v23);
    }

    v22 = 0;
  }

  return v22;
}

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4
{
  return [(BMDSLTableAggregator *)self initWithTableTransforms:a3 classNames:a4 classKeyPaths:0 name:@"tableAggregator" version:1];
}

- (BMDSLTableAggregator)initWithTableTransforms:(id)a3 classNames:(id)a4 classKeyPaths:(id)a5
{
  return [(BMDSLTableAggregator *)self initWithTableTransforms:a3 classNames:a4 classKeyPaths:a5 name:@"tableAggregator" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLTableAggregator;
  [(BMDSLBaseCodable *)&v9 encodeWithCoder:v4];
  v5 = [(BMDSLTableAggregator *)self transforms];
  [v4 encodeObject:v5 forKey:@"transforms"];

  v6 = [(BMDSLTableAggregator *)self classNames];
  [v4 encodeObject:v6 forKey:@"classNames"];

  v7 = [(BMDSLTableAggregator *)self classKeyPaths];

  if (v7)
  {
    v8 = [(BMDSLTableAggregator *)self classKeyPaths];
    [v4 encodeObject:v8 forKey:@"classKeyPaths"];
  }
}

- (BMDSLTableAggregator)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BMDSLTableAggregator;
  v5 = [(BMDSLBaseCodable *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v8 = [v6 setWithArray:v7];

    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transforms"];
    v10 = [MEMORY[0x1E4F4FA28] allowed];
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"classNames"];

    v12 = [MEMORY[0x1E4F4FA28] allowed];
    id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"classKeyPaths"];

    classNames = v5->_classNames;
    v5->_classNames = v11;
    id v15 = v11;

    v16 = [(BMDSLBaseCodable *)v5 name];
    v17 = [(BMDSLTableAggregator *)v5 initWithTableTransforms:v9 classNames:v15 classKeyPaths:v13 name:v16 version:[(BMDSLBaseCodable *)v5 version]];

    v5 = v17;
  }

  return v5;
}

- (id)bpsAggregator
{
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v4 = [(BMDSLTableAggregator *)self transforms];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [(BMDSLTableAggregator *)self classNames];
      v8 = [v7 objectAtIndexedSubscript:v6];

      objc_super v9 = [NSNumber numberWithInteger:v6];
      [v3 setObject:v9 forKeyedSubscript:v8];

      ++v6;
      v10 = [(BMDSLTableAggregator *)self transforms];
      unint64_t v11 = [v10 count];
    }
    while (v6 < v11);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F501F0]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__BMDSLTableAggregator_bpsAggregator__block_invoke;
  v16[3] = &unk_1E55D8060;
  v16[4] = self;
  id v17 = v3;
  id v13 = v3;
  id v14 = (void *)[v12 initWithAccumulator:0 closure:v16];

  return v14;
}

id __37__BMDSLTableAggregator_bpsAggregator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v5 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v7 = [*(id *)(a1 + 32) transforms];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = MEMORY[0x1E4F1CBF0];
      do
      {
        unint64_t v11 = [*(id *)(a1 + 32) transforms];
        id v12 = [v11 objectAtIndexedSubscript:v9];

        id v13 = objc_alloc(MEMORY[0x1E4F4FA98]);
        id v14 = [v12 schema];
        id v15 = (void *)[v13 initWithRows:v10 schema:v14];
        [v5 setObject:v15 atIndexedSubscript:v9];

        ++v9;
        v16 = [*(id *)(a1 + 32) transforms];
        unint64_t v17 = [v16 count];
      }
      while (v9 < v17);
    }
  }
  uint64_t v18 = (objc_class *)objc_opt_class();
  objc_super v19 = NSStringFromClass(v18);
  uint64_t v20 = [*(id *)(a1 + 32) classKeyPaths];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_super v25 = *(NSString **)(*((void *)&v40 + 1) + 8 * i);
        NSSelectorFromString(v25);
        if (objc_opt_respondsToSelector())
        {
          v26 = [v6 valueForKey:v25];
          if (v26)
          {
            v27 = (objc_class *)objc_opt_class();
            uint64_t v28 = NSStringFromClass(v27);

            objc_super v19 = (void *)v28;
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v22);
  }
  v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:v19];
  uint64_t v30 = [v29 integerValue];

  v31 = [v5 objectAtIndexedSubscript:v30];
  v32 = [*(id *)(a1 + 32) transforms];
  v33 = [v32 objectAtIndexedSubscript:v30];

  v34 = [v33 rowTransform];
  v35 = [v34 rowFromInput:v6];

  v36 = [v31 rows];
  v37 = [v36 arrayByAddingObject:v35];
  [v31 setRows:v37];

  [v5 setObject:v31 atIndexedSubscript:v30];
  id v38 = v5;

  return v38;
}

- (NSArray)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
}

- (NSArray)classNames
{
  return self->_classNames;
}

- (NSArray)classKeyPaths
{
  return self->_classKeyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classKeyPaths, 0);
  objc_storeStrong((id *)&self->_classNames, 0);

  objc_storeStrong((id *)&self->_transforms, 0);
}

- (void)initWithTableTransforms:(int)a1 classNames:(NSObject *)a2 classKeyPaths:name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLTableAggregator", (uint8_t *)v2, 8u);
}

@end