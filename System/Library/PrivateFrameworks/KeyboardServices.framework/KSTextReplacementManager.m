@interface KSTextReplacementManager
@end

@implementation KSTextReplacementManager

void __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v3 = +[_KSUtilities userDefaultsSuiteName];
  v4 = (void *)[v2 initWithSuiteName:v3];

  if (([v4 BOOLForKey:@"KSDidPushMigrationStatusOnce-2"] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 32) ckStore];
    [v5 pushMigrationStatusToCloud:1];

    [v4 setBool:1 forKey:@"KSDidPushMigrationStatusOnce-2"];
  }
  if (([v4 BOOLForKey:@"KSDidPushAllLocalRecordsOnce-2"] & 1) == 0)
  {
    v6 = [*(id *)(a1 + 32) ckStore];
    [v6 pushAllLocalData];

    v7 = [*(id *)(a1 + 32) ckStore];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke_2;
    v8[3] = &unk_264890830;
    id v9 = v4;
    [v7 requestSync:4 withCompletionBlock:v8];
  }
}

uint64_t __60___KSTextReplacementManager_pushAllLocalRecordsOnceIfNeeded__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setBool:1 forKey:@"KSDidPushAllLocalRecordsOnce-2"];
  }
  return result;
}

@end