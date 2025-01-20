@interface ATXFeedbackStateBuilder
- (ATXFeedbackStateBuilder)initWithABGroup:(id)a3 assetVersion:(int64_t)a4;
- (id)finish;
- (void)recordPrediction:(id)a3 actionHash:(unint64_t)a4 totalScore:(float)a5 scoreInputs:(const float *)a6 isMediumConfidenceForBlendingLayer:(BOOL)a7 isHighConfidenceForBlendingLayer:(BOOL)a8;
@end

@implementation ATXFeedbackStateBuilder

- (ATXFeedbackStateBuilder)initWithABGroup:(id)a3 assetVersion:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXFeedbackState.m", 43, @"Invalid parameter not satisfying: %@", @"abGroup" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)ATXFeedbackStateBuilder;
  v8 = [(ATXFeedbackStateBuilder *)&v16 init];
  if (v8)
  {
    v9 = (const char *)[v7 UTF8String];
    int v10 = strlen(v9);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v10 + 32];
    data = v8->_data;
    v8->_data = (NSMutableData *)v11;

    uint64_t v13 = [(NSMutableData *)v8->_data mutableBytes];
    *(void *)uint64_t v13 = 466107951;
    *(void *)(v13 + 8) = a4;
    *(void *)(v13 + 16) = 0x33100000000;
    *(_DWORD *)(v13 + 24) = v10;
    *(_DWORD *)(v13 + 28) = 0;
    memcpy([(NSMutableData *)v8->_data mutableBytes] + 32, v9, v10);
    v8->_finished = 0;
  }

  return v8;
}

- (void)recordPrediction:(id)a3 actionHash:(unint64_t)a4 totalScore:(float)a5 scoreInputs:(const float *)a6 isMediumConfidenceForBlendingLayer:(BOOL)a7 isHighConfidenceForBlendingLayer:(BOOL)a8
{
  id v15 = a3;
  float v18 = a5;
  if (self->_finished)
  {
    objc_super v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXFeedbackState.m", 73, @"Invalid parameter not satisfying: %@", @"!_finished" object file lineNumber description];

    if (a6) {
      goto LABEL_3;
    }
  }
  else if (a6)
  {
    goto LABEL_3;
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ATXFeedbackState.m", 74, @"Invalid parameter not satisfying: %@", @"scoreInputs" object file lineNumber description];

LABEL_3:
  ++self->_predictionCount;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ATXCacheAppendString(self->_data, v15);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[ATXFeedbackStateBuilder recordPrediction:actionHash:totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:]((uint64_t)a2, (uint64_t)self);
    }
    ATXCacheAppendInteger(self->_data, [v15 integerValue]);
  }
  ATXCacheAppendFloats(self->_data, (const char *)&v18, 1);
  ATXCacheAppendFloats(self->_data, (const char *)a6, 817);
  ATXCacheAppendUnsignedInteger(self->_data, a4);
  ATXCacheAppendBoolean(self->_data, a7);
  ATXCacheAppendBoolean(self->_data, a8);
}

- (id)finish
{
  if (self->_finished)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ATXFeedbackState.m", 95, @"Invalid parameter not satisfying: %@", @"!_finished" object file lineNumber description];
  }
  self->_finished = 1;
  int predictionCount = self->_predictionCount;
  *(_DWORD *)([(NSMutableData *)self->_data mutableBytes] + 16) = predictionCount;
  v4 = [MEMORY[0x1E4F93AE0] fastCompress:self->_data];
  data = self->_data;
  self->_data = 0;

  return v4;
}

- (void).cxx_destruct
{
}

- (void)recordPrediction:(uint64_t)a1 actionHash:(uint64_t)a2 totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:.cold.1(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a1 object:a2 file:@"ATXFeedbackState.m" lineNumber:83 description:@"ATXFeedbackStateBuilder only supports NSNumber and NSString"];

  __break(1u);
}

@end