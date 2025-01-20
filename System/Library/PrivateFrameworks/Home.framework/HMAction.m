@interface HMAction
@end

@implementation HMAction

uint64_t __53__HMAction_HFAdditions__hf_affectedAccessoryProfiles__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2FAF8;
  qword_26AB2FAF8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __54__HMAction_HFAdditions__hf_isServiceLikeItemInvolved___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a2 characteristics];
  v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __59__HMAction_HFAdditions__hf_affectedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2FB08;
  qword_26AB2FB08 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end