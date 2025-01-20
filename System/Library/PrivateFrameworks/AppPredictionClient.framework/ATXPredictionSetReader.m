@interface ATXPredictionSetReader
+ (id)actionReader:(id)a3;
+ (id)bundleIdReader:(id)a3;
- (ATXPredictionSetReader)initWithData:(id)a3 predictedItemClass:(Class)a4;
- (id)_scoredPredictionFromData:(id)a3 score:(float)a4;
- (id)readScoredPredictionsWithLimit:(int)a3;
- (id)readScoredPredictionsWithLimit:(int)a3 filterPredicate:(id)a4;
@end

@implementation ATXPredictionSetReader

- (ATXPredictionSetReader)initWithData:(id)a3 predictedItemClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ATXPredictionSet.m", 89, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)ATXPredictionSetReader;
  v8 = [(ATXPredictionSetReader *)&v22 init];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = [MEMORY[0x1E4F93AE0] decompress:v7];
  data = v8->_data;
  v8->_data = (NSData *)v9;

  if ([(NSData *)v8->_data length] >= 8)
  {
    v8->_predictedItemClass = a4;
    v12 = [(NSData *)v8->_data bytes];
    v13 = v12;
    int v14 = *v12;
    if (*v12 > -362938750)
    {
      if (v14 != -362938749)
      {
        if (v14 == -218895609)
        {
          int v16 = v12[1];
          v8->_predictionCount = v16;
          if (v16 < 0)
          {
            v20 = __atxlog_handle_default();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              -[ATXPredictionSetReader initWithData:predictedItemClass:](&v8->_predictionCount, v20);
            }

            goto LABEL_5;
          }
          v17 = (const char *)(v12 + 2);
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
    else if (v14 != -1813681383 && v14 != -1789354849)
    {
LABEL_16:
      v18 = __atxlog_handle_default();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXPredictionSetReader initWithData:predictedItemClass:](v13, v18);
      }
    }
    v17 = 0;
    v8->_predictionCount = 0;
LABEL_20:
    v8->_perPredictionDataStart = v17;
LABEL_21:
    v11 = v8;
    goto LABEL_22;
  }
LABEL_5:
  v11 = 0;
LABEL_22:

  return v11;
}

+ (id)bundleIdReader:(id)a3
{
  id v3 = a3;
  v4 = [[ATXPredictionSetReader alloc] initWithData:v3 predictedItemClass:objc_opt_class()];

  return v4;
}

+ (id)actionReader:(id)a3
{
  id v3 = a3;
  v4 = [[ATXPredictionSetReader alloc] initWithData:v3 predictedItemClass:objc_opt_class()];

  return v4;
}

- (id)_scoredPredictionFromData:(id)a3 score:(float)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  Class predictedItemClass = self->_predictedItemClass;
  if (predictedItemClass == (Class)objc_opt_class())
  {
    v11 = [[NSString alloc] initWithData:v6 encoding:4];
    if (v11) {
      goto LABEL_5;
    }
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionSetReader _scoredPredictionFromData:score:]((uint64_t)self, (uint64_t)v6, v11);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1AD0D3C30]();
    Class v9 = self->_predictedItemClass;
    id v20 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v9 fromData:v6 error:&v20];
    v11 = v20;
    if (v10)
    {

      v11 = v10;
LABEL_5:
      v12 = [ATXScoredPrediction alloc];
      *(float *)&double v13 = a4;
      int v14 = [(ATXScoredPrediction *)v12 initWithPredictedItem:v11 score:v13];
      goto LABEL_12;
    }
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = NSStringFromClass(self->_predictedItemClass);
      *(_DWORD *)buf = 138412802;
      objc_super v22 = v18;
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_fault_impl(&dword_1A790D000, v15, OS_LOG_TYPE_FAULT, "%@ - error unarchiving action with predictedItemClass: %@, err: %@", buf, 0x20u);
    }
  }
  int v14 = 0;
LABEL_12:

  return v14;
}

- (id)readScoredPredictionsWithLimit:(int)a3
{
  return [(ATXPredictionSetReader *)self readScoredPredictionsWithLimit:*(void *)&a3 filterPredicate:0];
}

- (id)readScoredPredictionsWithLimit:(int)a3 filterPredicate:(id)a4
{
  id v6 = a4;
  perPredictionDataStart = self->_perPredictionDataStart;
  id v7 = [(NSData *)self->_data bytes];
  NSUInteger v8 = [(NSData *)self->_data length];
  if (self->_predictionCount >= a3) {
    int predictionCount = a3;
  }
  else {
    int predictionCount = self->_predictionCount;
  }
  unint64_t v10 = predictionCount & ~(predictionCount >> 31);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  if (predictionCount >= 1 && self->_predictionCount >= 1)
  {
    int v12 = 0;
    unint64_t v13 = (unint64_t)v7 + v8;
    while (1)
    {
      int v14 = (void *)MEMORY[0x1AD0D3C30]();
      v15 = ATXCacheReadData((unint64_t *)&perPredictionDataStart, v13);
      int __dst = 0;
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v13, &__dst, 1);
      LODWORD(v16) = __dst;
      v17 = [(ATXPredictionSetReader *)self _scoredPredictionFromData:v15 score:v16];
      if (v17)
      {
        if (!v6 || [v6 evaluateWithObject:v17])
        {
          [v11 addObject:v17];
          if ([v11 count] >= v10) {
            break;
          }
        }
      }

      if (++v12 >= self->_predictionCount) {
        goto LABEL_14;
      }
    }
  }
LABEL_14:

  return v11;
}

- (void).cxx_destruct
{
}

- (void)initWithData:(int *)a1 predictedItemClass:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Unrecognized magic number: %u", (uint8_t *)v3, 8u);
}

- (void)initWithData:(int *)a1 predictedItemClass:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Invalid prediction count: %i", (uint8_t *)v3, 8u);
}

- (void)_scoredPredictionFromData:(NSObject *)a3 score:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  NSUInteger v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_1A790D000, a3, OS_LOG_TYPE_FAULT, "%@ - error decoding app UTF-8 data: %@", (uint8_t *)&v7, 0x16u);
}

@end