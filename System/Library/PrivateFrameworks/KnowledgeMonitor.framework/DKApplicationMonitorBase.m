@interface DKApplicationMonitorBase
@end

@implementation DKApplicationMonitorBase

uint64_t __33___DKApplicationMonitorBase_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7
    || ([v6 stringValue],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v7 stringValue],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqual:v9],
        v9,
        v8,
        v10))
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = -1;
  }

  return v11;
}

BOOL __33___DKApplicationMonitorBase_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 stringValue];

  if (v3) {
    BOOL v4 = [v3 length] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

void __33___DKApplicationMonitorBase_init__block_invoke(uint64_t a1)
{
  BiomeLibrary();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v6 App];
  v3 = [v2 InFocus];
  BOOL v4 = [v3 source];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAppInFocusSource:v4];
}

@end