@interface MonzaV4
@end

@implementation MonzaV4

void __63__MonzaV4_1_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[MonzaV4_1 alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __54__MonzaV4_1_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    v6 = [MonzaV4_1Output alloc];
    v7 = [v12 featureValueForName:@"angle"];
    v8 = [v7 multiArrayValue];
    v9 = [(MonzaV4_1Output *)v6 initWithAngle:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void (**)(uint64_t, void, MonzaV4_1Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }
}

void __62__MonzaV4_1_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    v6 = [MonzaV4_1Output alloc];
    v7 = [v12 featureValueForName:@"angle"];
    v8 = [v7 multiArrayValue];
    v9 = [(MonzaV4_1Output *)v6 initWithAngle:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void (**)(uint64_t, void, MonzaV4_1Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }
}

@end