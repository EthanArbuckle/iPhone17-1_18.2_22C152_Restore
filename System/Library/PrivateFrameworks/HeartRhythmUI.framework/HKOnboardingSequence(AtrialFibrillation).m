@interface HKOnboardingSequence(AtrialFibrillation)
+ (id)firstTimeAtrialFibrillationAvailabilitySequence;
+ (id)firstTimeAtrialFibrillationOnboardingSequence;
@end

@implementation HKOnboardingSequence(AtrialFibrillation)

+ (id)firstTimeAtrialFibrillationAvailabilitySequence
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:0];
  v4[0] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  v2 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v1];
  return v2;
}

+ (id)firstTimeAtrialFibrillationOnboardingSequence
{
  v7[4] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:1];
  v7[0] = v0;
  v1 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:2];
  v7[1] = v1;
  v2 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:3];
  v7[2] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:4];
  v7[3] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];

  v5 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v4];
  return v5;
}

@end