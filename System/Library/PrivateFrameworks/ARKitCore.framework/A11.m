@interface A11
@end

@implementation A11

void __71__gan_model_pre_A11_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = [[gan_model_pre_A11 alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __62__gan_model_pre_A11_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    v6 = [gan_model_pre_A11Output alloc];
    v7 = [v12 featureValueForName:@"output"];
    v8 = [v7 multiArrayValue];
    v9 = [(gan_model_pre_A11Output *)v6 initWithOutput:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void (**)(uint64_t, void, gan_model_pre_A11Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }
}

void __70__gan_model_pre_A11_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = a3;
    v6 = [gan_model_pre_A11Output alloc];
    v7 = [v12 featureValueForName:@"output"];
    v8 = [v7 multiArrayValue];
    v9 = [(gan_model_pre_A11Output *)v6 initWithOutput:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void (**)(uint64_t, void, gan_model_pre_A11Output *))(v10 + 16);
    v9 = a3;
    v11(v10, 0, v9);
  }
}

@end