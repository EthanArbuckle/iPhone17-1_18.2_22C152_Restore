@interface HKOnboardingSequence(Electrocardiogram)
+ (id)firstTimeElectrocardiogramAvailabilitySequence;
+ (id)firstTimeElectrocardiogramOnboardingSequenceWithAlgorithmVersion:()Electrocardiogram;
+ (id)upgradingElectrocardiogramAvailabilitySequence;
+ (id)upgradingElectrocardiogramSequenceFromAlgorithmVersion:()Electrocardiogram toAlgorithmVersion:;
@end

@implementation HKOnboardingSequence(Electrocardiogram)

+ (id)firstTimeElectrocardiogramAvailabilitySequence
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:0];
  v4[0] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  v2 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v1];
  return v2;
}

+ (id)firstTimeElectrocardiogramOnboardingSequenceWithAlgorithmVersion:()Electrocardiogram
{
  v13[5] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:3];
    v12[0] = v3;
    v4 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:4];
    v12[1] = v4;
    v5 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:5];
    v12[2] = v5;
    v6 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:6];
    v12[3] = v6;
    v7 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:7];
    v12[4] = v7;
    v8 = v12;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:3];
    v13[0] = v3;
    v4 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:4];
    v13[1] = v4;
    v5 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:5];
    v13[2] = v5;
    v6 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:6];
    v13[3] = v6;
    v7 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:7];
    v13[4] = v7;
    v8 = v13;
LABEL_5:
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:5];

    v10 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v9];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  return v10;
}

+ (id)upgradingElectrocardiogramAvailabilitySequence
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:1];
  v4[0] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  v2 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v1];
  return v2;
}

+ (id)upgradingElectrocardiogramSequenceFromAlgorithmVersion:()Electrocardiogram toAlgorithmVersion:
{
  v13[3] = *MEMORY[0x263EF8340];
  if (a3 == 1 && a4 == 2)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:4];
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263F46890]), "initWithViewControllerClass:sequencePage:", objc_opt_class(), 5, v6);
    v13[1] = v7;
    v8 = (void *)[objc_alloc(MEMORY[0x263F46890]) initWithViewControllerClass:objc_opt_class() sequencePage:8];
    v13[2] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

    v10 = (void *)[objc_alloc(MEMORY[0x263F46898]) initWithPages:v9];
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      +[HKOnboardingSequence(Electrocardiogram) upgradingElectrocardiogramSequenceFromAlgorithmVersion:toAlgorithmVersion:](a3, a4, v11);
    }
    v10 = 0;
  }
  return v10;
}

+ (void)upgradingElectrocardiogramSequenceFromAlgorithmVersion:()Electrocardiogram toAlgorithmVersion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_220CA3000, log, OS_LOG_TYPE_ERROR, "Electrocardiogram upgrading from %ld to %ld is not supported", (uint8_t *)&v3, 0x16u);
}

@end