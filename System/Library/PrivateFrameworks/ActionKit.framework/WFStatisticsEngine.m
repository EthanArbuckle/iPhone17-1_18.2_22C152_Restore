@interface WFStatisticsEngine
- (OS_dispatch_queue)statisticsQueue;
- (WFStatisticsEngine)init;
- (void)applyOperation:(int64_t)a3 onNumbers:(id)a4 completion:(id)a5;
- (void)applyOperation:(int64_t)a3 onStatisticsSampleProviders:(id)a4 completion:(id)a5;
- (void)asyncApplyNSExpressionFunction:(id)a3 data:(id)a4 completion:(id)a5;
- (void)averageOfValues:(id)a3 completion:(id)a4;
- (void)maximumOfValues:(id)a3 completion:(id)a4;
- (void)medianOfValues:(id)a3 completion:(id)a4;
- (void)minimumOfValues:(id)a3 completion:(id)a4;
- (void)modeOfValues:(id)a3 completion:(id)a4;
- (void)rangeOfValues:(id)a3 completion:(id)a4;
- (void)setStatisticsQueue:(id)a3;
- (void)standardDeviationOfValues:(id)a3 completion:(id)a4;
- (void)sumOfValues:(id)a3 completion:(id)a4;
@end

@implementation WFStatisticsEngine

- (void).cxx_destruct
{
}

- (void)setStatisticsQueue:(id)a3
{
}

- (OS_dispatch_queue)statisticsQueue
{
  return self->_statisticsQueue;
}

- (void)standardDeviationOfValues:(id)a3 completion:(id)a4
{
}

- (void)rangeOfValues:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke;
  v10[3] = &unk_264E5DD80;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WFStatisticsEngine *)self minimumOfValues:v9 completion:v10];
}

void __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke_2;
  v7[3] = &unk_264E5DD58;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 maximumOfValues:v5 completion:v7];
}

void __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3;
  [*(id *)(a1 + 32) doubleValue];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v7 = [NSNumber numberWithDouble:v4 - v5];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

- (void)modeOfValues:(id)a3 completion:(id)a4
{
}

- (void)medianOfValues:(id)a3 completion:(id)a4
{
}

- (void)sumOfValues:(id)a3 completion:(id)a4
{
}

- (void)maximumOfValues:(id)a3 completion:(id)a4
{
}

- (void)minimumOfValues:(id)a3 completion:(id)a4
{
}

- (void)averageOfValues:(id)a3 completion:(id)a4
{
}

- (void)asyncApplyNSExpressionFunction:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    id v11 = [(WFStatisticsEngine *)self statisticsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke;
    block[3] = &unk_264E5DD30;
    id v13 = v9;
    id v14 = v8;
    id v15 = v10;
    dispatch_async(v11, block);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, MEMORY[0x263EFFA68]);
  }
}

void __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F087F0] expressionForConstantValue:*(void *)(a1 + 32)];
  double v3 = (void *)MEMORY[0x263F087F0];
  uint64_t v4 = *(void *)(a1 + 40);
  v13[0] = v2;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  uint64_t v6 = [v3 expressionForFunction:v4 arguments:v5];

  id v7 = [v6 expressionValueWithObject:0 context:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke_2;
  v10[3] = &unk_264E5EE18;
  id v8 = *(id *)(a1 + 48);
  id v11 = v7;
  id v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)applyOperation:(int64_t)a3 onStatisticsSampleProviders:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 firstObject];
  char v11 = [v10 conformsToProtocol:&unk_26F080BF8];

  if (v11)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke;
    v15[3] = &unk_264E5DD08;
    v15[4] = self;
    v15[5] = a3;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_3;
    v12[3] = &unk_264E5E980;
    id v14 = v9;
    id v13 = v8;
    objc_msgSend(v13, "if_enumerateAsynchronously:completionHandler:", v15, v12);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v6 dataSamples];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_2;
  v14[3] = &unk_264E5DCE0;
  uint64_t v11 = *(void *)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v11;
  id v15 = v6;
  id v12 = v7;
  id v13 = v6;
  [v8 applyOperation:v9 onNumbers:v10 completion:v14];
}

uint64_t __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateValue:a2 fromStatisticsOperation:*(void *)(a1 + 48)];
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)applyOperation:(int64_t)a3 onNumbers:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  switch(a3)
  {
    case 1:
      [(WFStatisticsEngine *)self averageOfValues:v10 completion:v8];
      break;
    case 2:
      [(WFStatisticsEngine *)self minimumOfValues:v10 completion:v8];
      break;
    case 3:
      [(WFStatisticsEngine *)self maximumOfValues:v10 completion:v8];
      break;
    case 4:
      [(WFStatisticsEngine *)self sumOfValues:v10 completion:v8];
      break;
    case 5:
      [(WFStatisticsEngine *)self medianOfValues:v10 completion:v8];
      break;
    case 6:
      [(WFStatisticsEngine *)self modeOfValues:v10 completion:v8];
      break;
    case 7:
      [(WFStatisticsEngine *)self rangeOfValues:v10 completion:v8];
      break;
    case 8:
      [(WFStatisticsEngine *)self standardDeviationOfValues:v10 completion:v8];
      break;
    default:
      if (v8) {
        (*((void (**)(id, void))v8 + 2))(v8, 0);
      }
      break;
  }
}

- (WFStatisticsEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFStatisticsEngine;
  v2 = [(WFStatisticsEngine *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("is.workflow.health.statistics", MEMORY[0x263EF83A8]);
    [(WFStatisticsEngine *)v2 setStatisticsQueue:v3];

    uint64_t v4 = v2;
  }

  return v2;
}

@end