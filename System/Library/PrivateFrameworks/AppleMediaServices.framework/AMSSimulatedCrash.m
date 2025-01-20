@interface AMSSimulatedCrash
+ (void)throwSimulatedCrashWithFormat:(id)a3;
@end

@implementation AMSSimulatedCrash

+ (void)throwSimulatedCrashWithFormat:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    v4 = (void *)[[NSString alloc] initWithFormat:v3 arguments:&v14];
    uint64_t v5 = getpid();
    id v6 = v4;
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    v7 = (void (*)(uint64_t, uint64_t, id))_MergedGlobals_142;
    v13 = _MergedGlobals_142;
    if (!_MergedGlobals_142)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getSimulateCrashSymbolLoc_block_invoke;
      v9[3] = &unk_1E559EC70;
      v9[4] = &v10;
      __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v9);
      v7 = (void (*)(uint64_t, uint64_t, id))v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v7)
    {
      dlerror();
      v8 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v10, 8);
      _Unwind_Resume(v8);
    }
    v7(v5, 195939070, v6);
  }
}

@end