@interface HMTrigger
@end

@implementation HMTrigger

uint64_t __57__HMTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous") ^ 1;
}

uint64_t __57__HMTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

uint64_t __66__HMTrigger_NaturalLanguage__hf_naturalLangugeDetailsWithOptions___block_invoke_2()
{
  v0 = objc_alloc_init(HFListFormatter);
  uint64_t v1 = qword_26AB2EF18;
  qword_26AB2EF18 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __84__HMTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithOptions___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFF9D8] orderedSet];
  uint64_t v1 = qword_26AB2EF28;
  qword_26AB2EF28 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __44__HMTrigger_HFAdditions__hf_isShortcutOwned__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isShortcutOwned");
}

uint64_t __45__HMTrigger_HFAdditions__hf_anonymousActions__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2F458;
  qword_26AB2F458 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __45__HMTrigger_HFAdditions__hf_anonymousActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend(v2, "hf_isAnonymous"))
  {
    v3 = [v2 actions];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __49__HMTrigger_HFAdditions__hf_shouldDisplayTrigger__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HMTrigger_HFAdditions__hf_shouldDisplayTrigger__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    v6 = [v5 characteristic];
    v7 = [v6 service];
    uint64_t v8 = objc_msgSend(v7, "hf_isProgrammableSwitch") ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

id __48__HMTrigger_HFAdditions__hf_forceDisableReasons__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 authorizationStatus] != 2;
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 homeManager];
  int v5 = [v4 isAccessAllowedWhenLocked];

  if (v5) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = v2 | 2;
  }
  v7 = (void *)MEMORY[0x263F58190];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  v9 = [v7 futureWithResult:v8];

  return v9;
}

uint64_t __54__HMTrigger_HFAdditions__hf_sanitizeTriggerName_home___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __50__HMTrigger_HFAdditions__hf_affectsHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

uint64_t __50__HMTrigger_HFAdditions__hf_affectsHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

uint64_t __52__HMTrigger_HFAdditions__hf_affectsCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_affectedCharacteristics");
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __45__HMTrigger_HFAdditions__hf_affectsProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_affectedProfiles");
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

@end