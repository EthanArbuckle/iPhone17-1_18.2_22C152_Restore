@interface MapsSuggestionsFirstUnlock
- (BOOL)hasDeviceBeenUnlocked;
- (MapsSuggestionsFirstUnlock)init;
- (void)didAddFirstObserver;
@end

@implementation MapsSuggestionsFirstUnlock

- (BOOL)hasDeviceBeenUnlocked
{
  v2 = [MEMORY[0x1E4F64600] sharedObject];
  char v3 = [v2 canAccessFilesWithProtection:3];

  return v3;
}

- (MapsSuggestionsFirstUnlock)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsFirstUnlock;
  return [(MapsSuggestionsFirstUnlockBase *)&v3 initWithName:@"MapsSuggestionsFirstUnLock"];
}

- (void)didAddFirstObserver
{
  id v3 = [MEMORY[0x1E4F64600] sharedObject];
  [v3 addDataDidBecomeAvailableAfterFirstUnlockObserver:self];
}

@end