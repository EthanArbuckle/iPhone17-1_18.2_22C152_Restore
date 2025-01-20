@interface MLLayerPath
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMLLayerPath:(id)a3;
- (MLLayerPath)init;
- (MLLayerPath)initWithScopedModelAndLayerName:(id)a3 layerName:(id)a4;
- (NSArray)scopedModelNames;
- (NSString)layerName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendPathComponent:(id)a3;
- (void)setLayerName:(id)a3;
- (void)setScopedModelNames:(id)a3;
@end

@implementation MLLayerPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerName, 0);

  objc_storeStrong((id *)&self->_scopedModelNames, 0);
}

- (MLLayerPath)init
{
  return [(MLLayerPath *)self initWithScopedModelAndLayerName:MEMORY[0x1E4F1CBF0] layerName:&stru_1EF0E81D0];
}

- (MLLayerPath)initWithScopedModelAndLayerName:(id)a3 layerName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLLayerPath;
  v9 = [(MLLayerPath *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scopedModelNames, a3);
    objc_storeStrong((id *)&v10->_layerName, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MLLayerPath allocWithZone:a3] init];
  if (v4)
  {
    v5 = [(MLLayerPath *)self layerName];
    [(MLLayerPath *)v4 setLayerName:v5];

    v6 = [(MLLayerPath *)self scopedModelNames];
    [(MLLayerPath *)v4 setScopedModelNames:v6];
  }
  return v4;
}

- (void)setScopedModelNames:(id)a3
{
}

- (void)setLayerName:(id)a3
{
}

- (NSArray)scopedModelNames
{
  return self->_scopedModelNames;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(MLLayerPath *)self layerName];
  unint64_t v4 = [v3 hash];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(MLLayerPath *)self scopedModelNames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v4 ^= [*(id *)(*((void *)&v10 + 1) + 8 * v8++) hash];
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MLLayerPath *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MLLayerPath *)self isEqualToMLLayerPath:v4];
  }

  return v5;
}

- (BOOL)isEqualToMLLayerPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MLLayerPath *)self layerName];
  uint64_t v6 = [v4 layerName];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = [(MLLayerPath *)self scopedModelNames];
    uint64_t v8 = [v4 scopedModelNames];
    char v9 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)appendPathComponent:(id)a3
{
  id v6 = a3;
  id v4 = [(MLLayerPath *)self scopedModelNames];
  BOOL v5 = [v4 arrayByAddingObject:v6];
  [(MLLayerPath *)self setScopedModelNames:v5];
}

@end