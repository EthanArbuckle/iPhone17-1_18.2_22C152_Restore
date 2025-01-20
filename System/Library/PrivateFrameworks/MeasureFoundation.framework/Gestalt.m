@interface Gestalt
+ (BOOL)hasAppleNeuralEngine;
+ (BOOL)internalInstall;
+ (BOOL)jasperAvailable;
+ (id)stringAnswerToQuestion:(__CFString *)a3;
@end

@implementation Gestalt

uint64_t __26__Gestalt_jasperAvailable__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) stringAnswerToQuestion:@"dJvRNnysMoubdy0ZCK2aRQ"];
  if (v1) {
    LOBYTE(v1) = [MEMORY[0x263F20F58] supportsFrameSemantics:8];
  }
  jasperAvailable_jasperAvailable = v1;
  return MEMORY[0x270F9A758]();
}

+ (id)stringAnswerToQuestion:(__CFString *)a3
{
  v3 = (void *)MGGetStringAnswer();
  return v3;
}

+ (BOOL)internalInstall
{
  if (internalInstall_onceToken != -1) {
    dispatch_once(&internalInstall_onceToken, &__block_literal_global);
  }
  return internalInstall_internalInstall;
}

uint64_t __26__Gestalt_internalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  internalInstall_internalInstall = result;
  return result;
}

+ (BOOL)jasperAvailable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__Gestalt_jasperAvailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (jasperAvailable_onceToken != -1) {
    dispatch_once(&jasperAvailable_onceToken, block);
  }
  return jasperAvailable_jasperAvailable;
}

+ (BOOL)hasAppleNeuralEngine
{
  if (hasAppleNeuralEngine_onceToken != -1) {
    dispatch_once(&hasAppleNeuralEngine_onceToken, &__block_literal_global_6);
  }
  return hasAppleNeuralEngine_hasAppleNeuralEngine;
}

uint64_t __31__Gestalt_hasAppleNeuralEngine__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasAppleNeuralEngine_hasAppleNeuralEngine = result;
  return result;
}

@end