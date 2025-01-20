@interface ATXFeedbackStateReader
+ (id)numberKeyWithData:(id)a3;
+ (id)stringKeyWithData:(id)a3;
- (ATXFeedbackStateReader)initWithData:(id)a3 predictedItemKeyClass:(Class)a4;
- (NSString)abGroup;
- (int64_t)assetVersion;
- (void)enumerateApps:(id)a3;
@end

@implementation ATXFeedbackStateReader

+ (id)stringKeyWithData:(id)a3
{
  id v3 = a3;
  v4 = [[ATXFeedbackStateReader alloc] initWithData:v3 predictedItemKeyClass:objc_opt_class()];

  return v4;
}

+ (id)numberKeyWithData:(id)a3
{
  id v3 = a3;
  v4 = [[ATXFeedbackStateReader alloc] initWithData:v3 predictedItemKeyClass:objc_opt_class()];

  return v4;
}

- (ATXFeedbackStateReader)initWithData:(id)a3 predictedItemKeyClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"ATXFeedbackState.m", 125, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)ATXFeedbackStateReader;
  v8 = [(ATXFeedbackStateReader *)&v25 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_17;
  }
  v8->_predictedItemKeyClass = a4;
  uint64_t v10 = [MEMORY[0x1E4F93AE0] decompress:v7];
  data = v9->_data;
  v9->_data = (NSData *)v10;

  if ([(NSData *)v9->_data length] < 0x20) {
    goto LABEL_5;
  }
  uint64_t v13 = [(NSData *)v9->_data bytes];
  uint64_t v14 = [(NSData *)v9->_data bytes];
  if (*(_DWORD *)v13 == 2146895485) {
    goto LABEL_15;
  }
  if (*(_DWORD *)v13 != 466107951)
  {
    v21 = __atxlog_handle_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:]((int *)v13, v21);
    }

LABEL_15:
    v20 = 0;
    v9->_predictionCount = 0;
    goto LABEL_16;
  }
  if (*(_DWORD *)(v13 + 20) == 817)
  {
    int v15 = *(_DWORD *)(v13 + 16);
    v9->_predictionCount = v15;
    if (v15 < 0)
    {
      v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ATXFeedbackStateReader initWithData:predictedItemKeyClass:](&v9->_predictionCount, v23);
      }

      goto LABEL_5;
    }
    uint64_t v16 = v14;
    v9->_assetVersion = *(void *)(v13 + 8);
    if ([(NSData *)v9->_data length] >= *(int *)(v13 + 24) + 32)
    {
      uint64_t v17 = v16 + 32;
      uint64_t v18 = [[NSString alloc] initWithBytes:v17 length:*(int *)(v13 + 24) encoding:4];
      abGroup = v9->_abGroup;
      v9->_abGroup = (NSString *)v18;

      v20 = (const char *)(v17 + *(int *)(v13 + 24));
LABEL_16:
      v9->_perPredictionDataStart = v20;
LABEL_17:
      v12 = v9;
      goto LABEL_18;
    }
  }
LABEL_5:
  v12 = 0;
LABEL_18:

  return v12;
}

- (void)enumerateApps:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, unsigned __int8 *, void *, unint64_t *, unsigned char *, unint64_t *, unint64_t *, float))a3;
  data = self->_data;
  perPredictionDataStart = self->_perPredictionDataStart;
  uint64_t v6 = [(NSData *)data bytes];
  NSUInteger v7 = [(NSData *)self->_data length];
  float __dst = 0.0;
  unsigned __int8 v19 = 0;
  if (self->_predictionCount >= 1)
  {
    int v8 = 0;
    unint64_t v9 = v6 + v7;
    while (1)
    {
      uint64_t v10 = (void *)MEMORY[0x1AD0D3C30]();
      Class predictedItemKeyClass = self->_predictedItemKeyClass;
      if (predictedItemKeyClass == (Class)objc_opt_class()) {
        break;
      }
      Class v12 = self->_predictedItemKeyClass;
      if (v12 == (Class)objc_opt_class())
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", ATXCacheReadInteger((unint64_t *)&perPredictionDataStart, v9));
        goto LABEL_8;
      }
      uint64_t v13 = 0;
LABEL_9:
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v9, &__dst, 1);
      ATXCacheReadFloats((const void **)&perPredictionDataStart, v9, v22, 817);
      UnsignedInteger = ATXCacheReadUnsignedInteger((unint64_t *)&perPredictionDataStart, v9);
      Boolean = ATXCacheReadBoolean((unint64_t *)&perPredictionDataStart, v9);
      uint64_t v17 = ATXCacheReadBoolean((unint64_t *)&perPredictionDataStart, v9);
      if (v13) {
        v4[2](v4, &v19, v13, UnsignedInteger, v22, Boolean, v17, __dst);
      }
      int v18 = v19;

      if (!v18 && ++v8 < self->_predictionCount) {
        continue;
      }
      goto LABEL_13;
    }
    uint64_t v14 = ATXCacheReadString((unint64_t *)&perPredictionDataStart, v9);
LABEL_8:
    uint64_t v13 = (void *)v14;
    goto LABEL_9;
  }
LABEL_13:
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithData:(int *)a1 predictedItemKeyClass:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Feedback: Unrecognized magic number: %u", (uint8_t *)v3, 8u);
}

- (void)initWithData:(int *)a1 predictedItemKeyClass:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Feedback: Invalid app count: %i", (uint8_t *)v3, 8u);
}

@end