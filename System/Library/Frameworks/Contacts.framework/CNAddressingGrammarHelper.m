@interface CNAddressingGrammarHelper
+ (BOOL)addNoisyValueToContact:(id)a3;
+ (BOOL)isNoiseValue:(id)a3;
+ (id)noiseAddressingGrammars;
+ (id)noiseValue;
+ (id)os_log;
@end

@implementation CNAddressingGrammarHelper

+ (id)os_log
{
  if (os_log_cn_once_token_0_18 != -1) {
    dispatch_once(&os_log_cn_once_token_0_18, &__block_literal_global_124);
  }
  v2 = (void *)os_log_cn_once_object_0_18;

  return v2;
}

uint64_t __35__CNAddressingGrammarHelper_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNAddressingGrammarHelper");
  uint64_t v1 = os_log_cn_once_object_0_18;
  os_log_cn_once_object_0_18 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)addNoisyValueToContact:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v6 = [v5 probabilityUtility];
  int v7 = [v6 trueWithProbability:0.1];

  if (!v7 || ![v4 isKeyAvailable:@"addressingGrammars"]) {
    goto LABEL_10;
  }
  uint64_t v8 = *MEMORY[0x1E4F5A258];
  v9 = [v4 addressingGrammars];
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if (v8)
  {
    v10 = [a1 noiseAddressingGrammars];
    [v4 setAddressingGrammars:v10];

LABEL_8:
    LOBYTE(v15) = 1;
    goto LABEL_11;
  }
  v11 = [v4 addressingGrammars];
  if ([v11 count] != 1)
  {

LABEL_10:
    LOBYTE(v15) = 0;
    goto LABEL_11;
  }
  v12 = [v4 addressingGrammars];
  v13 = [v12 firstObject];
  v14 = [v13 value];
  int v15 = [a1 isNoiseValue:v14];

  if (v15)
  {
    [v4 setAddressingGrammars:MEMORY[0x1E4F1CBF0]];
    goto LABEL_8;
  }
LABEL_11:

  return v15;
}

+ (id)noiseAddressingGrammars
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 noiseValue];
  v3 = +[CNLabeledValue labeledValueWithLabel:0 value:v2];

  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)noiseValue
{
  return (id)[MEMORY[0x1E4F29040] unspecified];
}

+ (BOOL)isNoiseValue:(id)a3
{
  return [a3 isUnspecified];
}

@end