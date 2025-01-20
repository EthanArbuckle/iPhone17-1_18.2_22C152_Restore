@interface PredictorUtils
+ (id)getInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5;
+ (id)getPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5;
+ (int64_t)handleInitException:(exception_ptr)a3;
+ (int64_t)handlePredictException:(exception_ptr)a3;
+ (void)reportInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6;
+ (void)reportPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6;
@end

@implementation PredictorUtils

+ (id)getPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    v10 = [NSString stringWithFormat:@"Prediction failed with %@", v7, *MEMORY[0x1E4F28568]];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    a5 = [v9 initWithDomain:v8 code:a5 userInfo:v11];
  }
  return (id)a5;
}

+ (id)getInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    v10 = [NSString stringWithFormat:@"Failed to intialize %@", v7, *MEMORY[0x1E4F28568]];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    a5 = [v9 initWithDomain:v8 code:a5 userInfo:v11];
  }
  return (id)a5;
}

+ (void)reportPredictStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6
{
  id v8 = a6;
  id v9 = [NSString stringWithFormat:@"%@.%@.Prediction", a4, a3];
  id v10 = v8;
  AnalyticsSendEventLazy();
}

id __74__PredictorUtils_reportPredictStatusWithPredictorName_domain_code_locale___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = @"failed";
  if (!*(void *)(a1 + 40)) {
    v2 = @"success";
  }
  v9[0] = v2;
  v8[0] = @"outcome";
  v8[1] = @"statusCode";
  v3 = objc_msgSend(NSNumber, "numberWithInt:");
  v4 = [v3 stringValue];
  v8[2] = @"locale";
  uint64_t v5 = *(void *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (void)reportInitStatusWithPredictorName:(id)a3 domain:(id)a4 code:(int64_t)a5 locale:(id)a6
{
  id v8 = a6;
  id v9 = [NSString stringWithFormat:@"%@.%@.Initialization", a4, a3];
  id v10 = v8;
  AnalyticsSendEventLazy();
}

id __71__PredictorUtils_reportInitStatusWithPredictorName_domain_code_locale___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = @"failed";
  if (!*(void *)(a1 + 40)) {
    v2 = @"success";
  }
  v9[0] = v2;
  v8[0] = @"outcome";
  v8[1] = @"statusCode";
  v3 = objc_msgSend(NSNumber, "numberWithInt:");
  v4 = [v3 stringValue];
  v8[2] = @"locale";
  uint64_t v5 = *(void *)(a1 + 32);
  v9[1] = v4;
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (int64_t)handlePredictException:(exception_ptr)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)a3.var0)
  {
    std::exception_ptr::exception_ptr(&v5, (const std::exception_ptr *)a3.var0);
    v4.__ptr_ = &v5;
    std::rethrow_exception(v4);
    __break(1u);
  }
  return 0;
}

+ (int64_t)handleInitException:(exception_ptr)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)a3.var0)
  {
    std::exception_ptr::exception_ptr(&v5, (const std::exception_ptr *)a3.var0);
    v4.__ptr_ = &v5;
    std::rethrow_exception(v4);
    __break(1u);
  }
  return 0;
}

@end