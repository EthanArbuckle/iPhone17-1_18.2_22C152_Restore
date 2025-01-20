@interface NSExtension(RPExtensions)
+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions activationRule:completion:;
+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:completion:;
+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:unwantedActivationRule:completion:;
+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions completion:;
+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions unwantedActivationRule:completion:;
+ (void)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:activationRule:unwantedActivationRule:completion:;
- (uint64_t)processMode;
@end

@implementation NSExtension(RPExtensions)

+ (void)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:activationRule:unwantedActivationRule:completion:
{
  v33[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x263EFF980];
  id v16 = a3;
  v17 = [v15 array];
  uint64_t v32 = *MEMORY[0x263F07FF8];
  v33[0] = v16;
  v18 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  v19 = (void *)[v18 mutableCopy];

  v20 = (void *)MEMORY[0x263F08800];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __125__NSExtension_RPExtensions__extensionsWithMatchingPointName_baseIdentifier_activationRule_unwantedActivationRule_completion___block_invoke;
  v26[3] = &unk_26451DC88;
  id v27 = v11;
  id v28 = v12;
  id v29 = v13;
  id v30 = v17;
  id v31 = v14;
  id v21 = v14;
  id v22 = v17;
  id v23 = v13;
  id v24 = v12;
  id v25 = v11;
  [v20 extensionsWithMatchingAttributes:v19 completion:v26];
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:completion:
{
  return [MEMORY[0x263F08800] extensionsWithMatchingPointName:a3 baseIdentifier:a4 activationRule:0 unwantedActivationRule:0 completion:a5];
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions baseIdentifier:unwantedActivationRule:completion:
{
  return [MEMORY[0x263F08800] extensionsWithMatchingPointName:a3 baseIdentifier:a4 activationRule:0 unwantedActivationRule:a5 completion:a6];
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions activationRule:completion:
{
  return [MEMORY[0x263F08800] extensionsWithMatchingPointName:a3 baseIdentifier:0 activationRule:a4 unwantedActivationRule:0 completion:a5];
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions unwantedActivationRule:completion:
{
  return [MEMORY[0x263F08800] extensionsWithMatchingPointName:a3 baseIdentifier:0 activationRule:0 unwantedActivationRule:a4 completion:a5];
}

+ (uint64_t)extensionsWithMatchingPointName:()RPExtensions completion:
{
  return [MEMORY[0x263F08800] extensionsWithMatchingPointName:a3 baseIdentifier:0 activationRule:0 unwantedActivationRule:0 completion:a4];
}

- (uint64_t)processMode
{
  v1 = [a1 infoDictionary];
  v2 = [v1 objectForKeyedSubscript:@"NSExtension"];
  v3 = [v2 objectForKeyedSubscript:@"RPBroadcastProcessMode"];

  uint64_t v4 = [v3 isEqualToString:@"RPBroadcastProcessModeSampleBuffer"];
  return v4;
}

@end