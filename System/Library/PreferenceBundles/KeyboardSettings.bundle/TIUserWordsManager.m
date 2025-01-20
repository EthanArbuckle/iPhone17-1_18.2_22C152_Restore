@interface TIUserWordsManager
- (NSArray)cache;
- (NSArray)entries;
- (TIUserWordsManager)init;
- (id)addObserver:(id)a3;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)notifyObserversOfChange;
- (void)removeObserver:(id)a3;
- (void)requestSync;
- (void)setCache:(id)a3;
@end

@implementation TIUserWordsManager

- (TIUserWordsManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)TIUserWordsManager;
  v2 = [(TIUserWordsManager *)&v5 init];
  if (v2)
  {
    v2->_textReplacementStore = (_KSTextReplacementClientStore *)objc_alloc_init(MEMORY[0x263F50F58]);
    v2->_observers = (NSMutableArray *)(id)[MEMORY[0x263EFF980] array];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)ShortcutsDidChange, (CFStringRef)*MEMORY[0x263F50F50], 0, (CFNotificationSuspensionBehavior)0);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F50F50], 0);

  v4.receiver = self;
  v4.super_class = (Class)TIUserWordsManager;
  [(TIUserWordsManager *)&v4 dealloc];
}

- (NSArray)entries
{
  result = self->_cache;
  if (!result)
  {
    [(TIUserWordsManager *)self setCache:[(_KSTextReplacementClientStore *)self->_textReplacementStore textReplacementEntries]];
    return self->_cache;
  }
  return result;
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  textReplacementStore = self->_textReplacementStore;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v6[3] = &unk_264A01338;
  v6[4] = self;
  v6[5] = a5;
  [(_KSTextReplacementClientStore *)textReplacementStore addEntries:a3 removeEntries:a4 withCompletionHandler:v6];
}

void __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke_2;
  block[3] = &unk_264A01310;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__TIUserWordsManager_addEntries_removeEntries_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyObserversOfChange];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)requestSync
{
}

- (void)notifyObserversOfChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TIUserWordsManager *)self setCache:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  observers = self->_observers;
  uint64_t v4 = [(NSMutableArray *)observers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(observers);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)observers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)addObserver:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  [(NSMutableArray *)self->_observers addObject:v4];

  return v4;
}

- (void)removeObserver:(id)a3
{
}

- (NSArray)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

@end