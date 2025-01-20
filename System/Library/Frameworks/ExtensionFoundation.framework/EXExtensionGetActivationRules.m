@interface EXExtensionGetActivationRules
@end

@implementation EXExtensionGetActivationRules

void ___EXExtensionGetActivationRules_block_invoke()
{
  if (_EXExtensionUseAlternateRules)
  {
    id v31 = 0;
    v0 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:_EXExtensionUseAlternateRules options:2 error:&v31];
    id v1 = v31;
    if (v0)
    {
      id v30 = 0;
      v2 = [MEMORY[0x1E4F28F98] propertyListWithData:v0 options:0 format:0 error:&v30];
      id v3 = v30;

      id v1 = v3;
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    if (_EXExtensionKitBundle_onceToken[0] != -1) {
      dispatch_once(_EXExtensionKitBundle_onceToken, &__block_literal_global_246);
    }
    v4 = [(id)_EXExtensionKitBundle_bundle URLForResource:@"activation_rules" withExtension:@"plist"];
    v5 = (void *)MEMORY[0x1E4F28F98];
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
    v2 = [v5 propertyListWithData:v6 options:0 format:0 error:0];

    id v1 = 0;
  }
  uint64_t v7 = [v2 objectForKey:@"RULES"];
  v8 = (void *)qword_1E92FDEB8;
  qword_1E92FDEB8 = v7;

  v9 = [v2 objectForKey:@"GENERIC_ACCEPT"];
  uint64_t v10 = _EXPredicateWithString(v9);
  v11 = (void *)_EXExtensionGetActivationRules__activation_rules;
  *(void *)&_EXExtensionGetActivationRules__activation_rules = v10;

  v12 = [v2 objectForKey:@"GENERIC_REJECT_EXCEPT_ONE_OTHER_TYPE"];
  uint64_t v13 = _EXPredicateWithString(v12);
  v14 = (void *)*((void *)&_EXExtensionGetActivationRules__activation_rules + 1);
  *((void *)&_EXExtensionGetActivationRules__activation_rules + 1) = v13;

  v15 = [v2 objectForKey:@"GENERIC_REJECT_EXCEPT_MULTIPLE_OTHER_TYPES"];
  uint64_t v16 = _EXPredicateWithString(v15);
  v17 = (void *)qword_1E92FDE90;
  qword_1E92FDE90 = v16;

  v18 = [v2 objectForKey:@"GENERIC_ENFORCE_ALL_TYPES"];
  uint64_t v19 = _EXPredicateWithString(v18);
  v20 = (void *)qword_1E92FDE98;
  qword_1E92FDE98 = v19;

  v21 = [v2 objectForKey:@"GENERIC_ENFORCE_ANY_TYPE"];
  uint64_t v22 = _EXPredicateWithString(v21);
  v23 = (void *)xmmword_1E92FDEA0;
  *(void *)&xmmword_1E92FDEA0 = v22;

  v24 = [v2 objectForKey:@"GENERIC_ENFORCE_ALL_TYPES_WITH_EXCEPTIONS"];
  uint64_t v25 = _EXPredicateWithString(v24);
  v26 = (void *)*((void *)&xmmword_1E92FDEA0 + 1);
  *((void *)&xmmword_1E92FDEA0 + 1) = v25;

  v27 = [v2 objectForKey:@"GENERIC_ENFORCE_ANY_TYPE_WITH_EXCEPTIONS"];
  uint64_t v28 = _EXPredicateWithString(v27);
  v29 = (void *)qword_1E92FDEB0;
  qword_1E92FDEB0 = v28;

  if (vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)_EXExtensionGetActivationRules__activation_rules), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_1E92FDE90)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)xmmword_1E92FDEA0), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_1E92FDEB0))))))___EXExtensionGetActivationRules_block_invoke_cold_1(v1); {
}
  }

void ___EXExtensionGetActivationRules_block_invoke_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  NSLog(&cfstr_UnableToLoadRu.isa, v1);

  abort();
}

@end