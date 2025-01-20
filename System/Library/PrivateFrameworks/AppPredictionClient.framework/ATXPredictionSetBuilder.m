@interface ATXPredictionSetBuilder
- (ATXPredictionSetBuilder)init;
- (id)finish;
- (void)recordPrediction:(id)a3 score:(float)a4;
@end

@implementation ATXPredictionSetBuilder

- (ATXPredictionSetBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXPredictionSetBuilder;
  v2 = [(ATXPredictionSetBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8];
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    *(void *)[(NSMutableData *)v2->_data mutableBytes] = 4076071687;
    v2->_finished = 0;
  }
  return v2;
}

- (void)recordPrediction:(id)a3 score:(float)a4
{
  id v7 = a3;
  float v15 = a4;
  if (self->_finished)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ATXPredictionSet.m", 52, @"Invalid parameter not satisfying: %@", @"!_finished" object file lineNumber description];
  }
  ++self->_predictionCount;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)MEMORY[0x1AD0D3C30]();
  if (isKindOfClass)
  {
    v10 = [v7 dataUsingEncoding:4];
  }
  else
  {
    id v14 = 0;
    v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
    id v11 = v14;
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"ATXPredictionSet.m", 62, @"Archiving error: %@", v11 object file lineNumber description];
    }
  }
  ATXCacheAppendData(self->_data, v10);
  ATXCacheAppendFloats(self->_data, (const char *)&v15, 1);
}

- (id)finish
{
  if (self->_finished)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ATXPredictionSet.m", 70, @"Invalid parameter not satisfying: %@", @"!_finished" object file lineNumber description];
  }
  self->_finished = 1;
  int predictionCount = self->_predictionCount;
  *(_DWORD *)([(NSMutableData *)self->_data mutableBytes] + 4) = predictionCount;
  v4 = [MEMORY[0x1E4F93AE0] fastCompress:self->_data];
  data = self->_data;
  self->_data = 0;

  return v4;
}

- (void).cxx_destruct
{
}

@end