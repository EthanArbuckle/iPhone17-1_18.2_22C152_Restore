@interface AVTUICapabilities
- (void)requestAccessForCameraWithCompletionHandler:(id)a3;
@end

@implementation AVTUICapabilities

- (void)requestAccessForCameraWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, BOOL))a3;
  uint64_t v4 = *MEMORY[0x263EF9D48];
  uint64_t v5 = [MEMORY[0x263EFA598] authorizationStatusForMediaType:*MEMORY[0x263EF9D48]];
  if (v5)
  {
    v3[2](v3, v5 == 3);
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFA598];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__AVTUICapabilities_requestAccessForCameraWithCompletionHandler___block_invoke;
    v7[3] = &unk_263FF0620;
    v8 = v3;
    [v6 requestAccessForMediaType:v4 completionHandler:v7];
  }
}

uint64_t __65__AVTUICapabilities_requestAccessForCameraWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end