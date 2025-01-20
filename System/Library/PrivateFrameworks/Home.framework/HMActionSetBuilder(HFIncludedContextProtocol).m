@interface HMActionSetBuilder(HFIncludedContextProtocol)
- (void)hf_setValue:()HFIncludedContextProtocol forContextType:;
@end

@implementation HMActionSetBuilder(HFIncludedContextProtocol)

- (void)hf_setValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138413058;
    v12 = a1;
    __int16 v13 = 2080;
    v14 = "-[HMActionSetBuilder(HFIncludedContextProtocol) hf_setValue:forContextType:]";
    __int16 v15 = 1024;
    int v16 = a3;
    __int16 v17 = 2048;
    uint64_t v18 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", (uint8_t *)&v11, 0x26u);
  }

  switch(a4)
  {
    case 0:
      v8 = [a1 applicationData];
      v9 = [NSNumber numberWithBool:a3];
      v10 = @"HFApplicationDataActionSetIsFavoriteKey";
      goto LABEL_9;
    case 1:
      NSLog(&cfstr_ActionSetsCann.isa);
      break;
    case 2:
      NSLog(&cfstr_ActionSetsAreN.isa);
      break;
    case 3:
      v8 = [a1 applicationData];
      v9 = [NSNumber numberWithBool:a3];
      v10 = @"HFApplicationDataActionSetShowInHomeDashboard";
LABEL_9:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      return;
  }
}

@end