@interface HMSymptomsHandler
@end

@implementation HMSymptomsHandler

void __65__HMSymptomsHandler_HFAdditions__hf_symptomTypesSortedByPriority__block_invoke_2()
{
  v0 = (void *)qword_26AB2EF08;
  qword_26AB2EF08 = (uint64_t)&unk_26C0F8170;
}

void __44__HMSymptomsHandler_HFAdditions__initialize__block_invoke(uint64_t a1)
{
  InstanceMethod = class_getInstanceMethod(*(Class *)(a1 + 32), sel_symptoms);
  v3 = class_getInstanceMethod(*(Class *)(a1 + 32), sel_hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay);
  method_exchangeImplementations(InstanceMethod, v3);
}

uint64_t __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke_2;
  aBlock[3] = &unk_264091660;
  id v15 = *(id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  v7 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
  uint64_t v8 = v7[2](v7, v6);

  uint64_t v9 = v7[2](v7, v5);
  v10 = [NSNumber numberWithUnsignedInteger:v8];
  v11 = [NSNumber numberWithUnsignedInteger:v9];
  uint64_t v12 = [v10 compare:v11];

  return v12;
}

uint64_t __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "type"));
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = [v3 type] + 1000;
  }

  return v6;
}

@end