@interface CIContext
@end

@implementation CIContext

void __67__CIContext_IconServicesAdditions___IS_sharedIconCompositorContext__block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1E208];
  v7[0] = *MEMORY[0x1E4F1E1E0];
  v7[1] = v0;
  v8[0] = MEMORY[0x1E4F1CC28];
  v8[1] = @"IconServices-Compositor";
  uint64_t v1 = *MEMORY[0x1E4F1E1F0];
  v7[2] = *MEMORY[0x1E4F1E200];
  v7[3] = v1;
  v8[2] = &unk_1F064AC48;
  v8[3] = MEMORY[0x1E4F1CC38];
  v8[4] = &unk_1F064AC60;
  uint64_t v2 = *MEMORY[0x1E4F1E240];
  v7[4] = *MEMORY[0x1E4F1E238];
  v7[5] = v2;
  v3 = [MEMORY[0x1E4F1CA98] null];
  v8[5] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:v4];
  v6 = (void *)_IS_sharedIconCompositorContext_sharedContext;
  _IS_sharedIconCompositorContext_sharedContext = v5;
}

@end