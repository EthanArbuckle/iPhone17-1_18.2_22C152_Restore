@interface HMMediaProfile(HFIncludedContextProtocol)
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol;
@end

@implementation HMMediaProfile(HFIncludedContextProtocol)

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 accessory];
  uint64_t v5 = objc_msgSend(v4, "hf_isOnForContextType:", a3);

  return v5;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  v4 = [a1 accessory];
  uint64_t v5 = objc_msgSend(v4, "hf_hasSetForContextType:", a3);

  return v5;
}

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  v4 = a1;
  if (a2 < 2)
  {
    if ((objc_msgSend(a1, "hf_isOnForContextType:", a2) & 1) == 0)
    {
      a3 = objc_msgSend(v4, "hf_hasSetForContextType:", a2) ^ 1;
      return a3 & 1;
    }
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    uint64_t v5 = 2;
    goto LABEL_9;
  }
  if (a2 != 3) {
    return a3 & 1;
  }
  if (!objc_msgSend(a1, "hf_hasSetForContextType:", 3))
  {
LABEL_7:
    a3 = 1;
    return a3 & 1;
  }
  a1 = v4;
  uint64_t v5 = 3;
LABEL_9:
  return objc_msgSend(a1, "hf_isOnForContextType:", v5);
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  if ((unint64_t)(a3 - 2) < 2) {
    goto LABEL_4;
  }
  if (a3 == 1)
  {
    uint64_t v5 = [a1 accessory];
    uint64_t v6 = objc_msgSend(v5, "hf_shouldHideForContextType:", 1);

    return v6;
  }
  if (a3) {
    return 0;
  }
LABEL_4:
  return [a1 isContainedWithinItemGroup];
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138413058;
    v12 = a1;
    __int16 v13 = 2080;
    v14 = "-[HMMediaProfile(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    __int16 v15 = 1024;
    int v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", (uint8_t *)&v11, 0x26u);
  }

  v8 = [a1 accessory];
  v9 = objc_msgSend(v8, "hf_updateValue:forContextType:", a3, a4);

  return v9;
}

@end