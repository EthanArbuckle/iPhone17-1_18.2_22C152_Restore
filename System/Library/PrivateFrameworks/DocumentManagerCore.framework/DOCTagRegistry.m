@interface DOCTagRegistry
+ (DOCTagRegistry)sharedInstance;
+ (id)sanitizedTagName:(id)a3;
- (BOOL)_canAddTag:(id)a3;
- (BOOL)addTag:(id)a3;
- (BOOL)canReplaceTag:(id)a3 withTag:(id)a4;
- (BOOL)inBatchUpdate;
- (BOOL)insertTag:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)isValidNewTagName:(id)a3;
- (BOOL)moveTag:(id)a3 toIndex:(unint64_t)a4;
- (BOOL)replaceTag:(id)a3 withTag:(id)a4;
- (BOOL)shouldSynchronizeAfterBatchUpdate;
- (DOCTagCloudSource)iCloudDataSource;
- (DOCTagRegistry)init;
- (NSArray)tagsBeforeBatchUpdate;
- (NSMutableOrderedSet)discoveredTags;
- (NSMutableOrderedSet)userTags;
- (NSPointerArray)changeObservers;
- (id)_allTags;
- (id)_memberTag:(id)a3;
- (id)_setForTagType:(int64_t)a3;
- (id)_tagNameForComparing:(id)a3;
- (id)tagForName:(id)a3;
- (int64_t)inBatchUpdateCount;
- (int64_t)tagSerialNumber;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)_notifyDidRemoveTagIfNoLongPresentExistingTags:(id)a3;
- (void)addChangeObserver:(id)a3;
- (void)addTag:(id)a3 options:(int64_t)a4;
- (void)addTags:(id)a3 options:(int64_t)a4;
- (void)dealloc;
- (void)inBatchUpdateEnter;
- (void)inBatchUpdateLeave;
- (void)init;
- (void)notifyObserversDidRemoveTags:(id)a3;
- (void)notifyObserversDidReplaceTag:(id)a3 withTag:(id)a4;
- (void)performBatchUpdate:(id)a3;
- (void)removeAllTagsOfType:(int64_t)a3;
- (void)removeChangeObserver:(id)a3;
- (void)removeTags:(id)a3;
- (void)setDiscoveredTags:(id)a3;
- (void)setICloudDataSource:(id)a3;
- (void)setInBatchUpdateCount:(int64_t)a3;
- (void)setShouldSynchronizeAfterBatchUpdate:(BOOL)a3;
- (void)setTagSerialNumber:(int64_t)a3;
- (void)setTagsBeforeBatchUpdate:(id)a3;
- (void)setUserTags:(id)a3;
- (void)synchronize;
@end

@implementation DOCTagRegistry

+ (DOCTagRegistry)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_registry;
  return (DOCTagRegistry *)v2;
}

- (id)tagForName:(id)a3
{
  id v4 = a3;
  v5 = [[DOCTag alloc] initWithDisplayName:v4 labelIndex:0 type:1];

  v6 = [(DOCTagRegistry *)self _memberTag:v5];

  return v6;
}

- (id)_memberTag:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableOrderedSet *)self->_userTags set];
  v6 = [v5 member:v4];

  if (!v6)
  {
    v7 = [(NSMutableOrderedSet *)self->_discoveredTags set];
    v6 = [v7 member:v4];
  }
  return v6;
}

void __32__DOCTagRegistry_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DOCTagRegistry);
  v1 = (void *)sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v0;

  v2 = [DOCTagCloudSource alloc];
  v3 = [(DOCTagCloudSource *)v2 initWithTagRegistry:sharedInstance_registry];
  [(id)sharedInstance_registry setICloudDataSource:v3];
}

- (void)setICloudDataSource:(id)a3
{
}

- (DOCTagRegistry)init
{
  v22.receiver = self;
  v22.super_class = (Class)DOCTagRegistry;
  v2 = [(DOCTagRegistry *)&v22 init];
  uint64_t v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
  changeObservers = v2->_changeObservers;
  v2->_changeObservers = (NSPointerArray *)v3;

  v5 = +[DOCTagLocalStorage sharedAppGroupStorage];
  v6 = [v5 userTags];

  uint64_t v7 = [v6 mutableCopy];
  userTags = v2->_userTags;
  v2->_userTags = (NSMutableOrderedSet *)v7;

  v9 = +[DOCTagLocalStorage sharedAppGroupStorage];
  v10 = [v9 discoveredTags];

  uint64_t v11 = [v10 mutableCopy];
  discoveredTags = v2->_discoveredTags;
  v2->_discoveredTags = (NSMutableOrderedSet *)v11;

  v13 = +[DOCTagLocalStorage sharedAppGroupStorage];
  v2->_tagSerialNumber = [v13 tagSerialNumber];

  objc_initWeak(&location, v2);
  v14 = (const char *)[@"DOCTagRegistryLocalStorageDidChangeNotification" UTF8String];
  v15 = MEMORY[0x263EF83A0];
  id v16 = MEMORY[0x263EF83A0];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __22__DOCTagRegistry_init__block_invoke;
  v19[3] = &unk_2641B5428;
  objc_copyWeak(&v20, &location);
  LODWORD(v14) = notify_register_dispatch(v14, &v2->_localStorageDidUpdateNotifyToken, v15, v19);

  if (v14)
  {
    v17 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v17 = docLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DOCTagRegistry init](v17);
    }
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v2;
}

- (int64_t)tagSerialNumber
{
  return self->_tagSerialNumber;
}

- (void)addChangeObserver:(id)a3
{
  if (a3)
  {
    -[NSPointerArray addPointer:](self->_changeObservers, "addPointer:");
    changeObservers = self->_changeObservers;
    [(NSPointerArray *)changeObservers compact];
  }
}

- (NSMutableOrderedSet)userTags
{
  return self->_userTags;
}

void __22__DOCTagRegistry_init__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[2] == a2)
    {
      uint64_t v7 = WeakRetained;
      uint64_t v4 = [WeakRetained tagSerialNumber];
      v5 = +[DOCTagLocalStorage sharedAppGroupStorage];
      uint64_t v6 = [v5 tagSerialNumber];

      WeakRetained = v7;
      if (v4 < v6)
      {
        [v7 synchronize];
        WeakRetained = v7;
      }
    }
  }
}

- (void)dealloc
{
  notify_cancel(self->_localStorageDidUpdateNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)DOCTagRegistry;
  [(DOCTagRegistry *)&v3 dealloc];
}

- (void)removeChangeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSPointerArray *)self->_changeObservers allObjects];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __39__DOCTagRegistry_removeChangeObserver___block_invoke;
    v9 = &unk_2641B5450;
    id v10 = v4;
    uint64_t v11 = self;
    [v5 enumerateObjectsUsingBlock:&v6];

    [(NSPointerArray *)self->_changeObservers compact];
  }
}

uint64_t __39__DOCTagRegistry_removeChangeObserver___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 24), "removePointerAtIndex:");
    *a4 = 1;
  }
  return result;
}

- (void)notifyObserversDidRemoveTags:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke;
  v6[3] = &unk_2641B54A0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(DOCTagRegistry *)self _enumerateObserversWithBlock:v6];
}

void __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke_2;
  v7[3] = &unk_2641B5478;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __47__DOCTagRegistry_notifyObserversDidRemoveTags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) tagRegistry:*(void *)(a1 + 40) didRemoveTag:a2];
}

- (void)notifyObserversDidReplaceTag:(id)a3 withTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__DOCTagRegistry_notifyObserversDidReplaceTag_withTag___block_invoke;
  v10[3] = &unk_2641B54C8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCTagRegistry *)self _enumerateObserversWithBlock:v10];
}

uint64_t __55__DOCTagRegistry_notifyObserversDidReplaceTag_withTag___block_invoke(void *a1, void *a2)
{
  return [a2 tagRegistry:a1[4] didReplaceTag:a1[5] withTag:a1[6]];
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(NSPointerArray *)self->_changeObservers allObjects];
  id v6 = (void *)[v5 copy];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__DOCTagRegistry__enumerateObserversWithBlock___block_invoke;
  v8[3] = &unk_2641B54F0;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __47__DOCTagRegistry__enumerateObserversWithBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_notifyDidRemoveTagIfNoLongPresentExistingTags:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__DOCTagRegistry__notifyDidRemoveTagIfNoLongPresentExistingTags___block_invoke;
  v7[3] = &unk_2641B5518;
  void v7[4] = self;
  id v4 = a3;
  id v5 = [v4 indexesOfObjectsPassingTest:v7];
  id v6 = [v4 objectsAtIndexes:v5];

  if ([v6 count]) {
    [(DOCTagRegistry *)self notifyObserversDidRemoveTags:v6];
  }
}

BOOL __65__DOCTagRegistry__notifyDidRemoveTagIfNoLongPresentExistingTags___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 displayName];
  id v4 = [v2 tagForName:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

- (void)removeAllTagsOfType:(int64_t)a3
{
  id v4 = [(DOCTagRegistry *)self _setForTagType:a3];
  if ([v4 count])
  {
    [v4 removeAllObjects];
    [(DOCTagRegistry *)self synchronize];
  }
}

- (void)addTags:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__DOCTagRegistry_addTags_options___block_invoke;
    v7[3] = &unk_2641B5540;
    id v8 = v6;
    id v9 = self;
    int64_t v10 = a4;
    [(DOCTagRegistry *)self performBatchUpdate:v7];
  }
}

void __34__DOCTagRegistry_addTags_options___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addTag:options:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addTag:(id)a3 options:(int64_t)a4
{
  id v10 = a3;
  uint64_t v6 = [(NSMutableOrderedSet *)self->_userTags set];
  long long v7 = [v6 member:v10];

  if (v7)
  {
    [v7 mergeWithTag:v10 options:a4];
  }
  else
  {
    long long v8 = [(NSMutableOrderedSet *)self->_discoveredTags set];
    long long v9 = [v8 member:v10];

    if (v9) {
      [v9 mergeWithTag:v10 options:a4];
    }
    else {
      [(DOCTagRegistry *)self addTag:v10];
    }
  }
}

- (BOOL)_canAddTag:(id)a3
{
  uint64_t v4 = [a3 displayName];
  LOBYTE(self) = [(DOCTagRegistry *)self isValidNewTagName:v4];

  return (char)self;
}

+ (id)sanitizedTagName:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  uint64_t v5 = [v3 newlineCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  long long v7 = [v6 componentsJoinedByString:&stru_26C404058];

  long long v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  long long v9 = [v7 stringByTrimmingCharactersInSet:v8];

  id v10 = [v9 precomposedStringWithCanonicalMapping];

  if ([v10 length]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_tagNameForComparing:(id)a3
{
  return (id)[a3 localizedLowercaseString];
}

- (BOOL)isValidNewTagName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() sanitizedTagName:v4];
  uint64_t v6 = [(DOCTagRegistry *)self _tagNameForComparing:v5];

  if (v6)
  {
    long long v7 = [(NSMutableOrderedSet *)self->_userTags set];
    long long v8 = [(NSMutableOrderedSet *)self->_discoveredTags set];
    long long v9 = [v7 setByAddingObjectsFromSet:v8];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "displayName", (void)v20);
          id v16 = [(DOCTagRegistry *)self _tagNameForComparing:v15];
          char v17 = [v16 isEqualToString:v6];

          if (v17)
          {
            BOOL v18 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_12:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)addTag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DOCTagRegistry *)self _canAddTag:v4];
  if (v5)
  {
    uint64_t v6 = -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", [v4 type]);
    [v6 addObject:v4];

    [(DOCTagRegistry *)self synchronize];
  }

  return v5;
}

- (BOOL)insertTag:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(DOCTagRegistry *)self _canAddTag:v6])
  {
    long long v7 = -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", [v6 type]);
    unint64_t v8 = [v7 count];
    BOOL v9 = v8 >= a4;
    if (v8 >= a4)
    {
      [v7 insertObject:v6 atIndex:a4];
      [(DOCTagRegistry *)self synchronize];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_setForTagType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = 32;
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    uint64_t v4 = 40;
  }
  a2 = (SEL)*(id *)((char *)&self->super.isa + v4);
LABEL_6:
  return (id)(id)a2;
}

- (void)removeTags:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    long long v7 = __29__DOCTagRegistry_removeTags___block_invoke;
    unint64_t v8 = &unk_2641B5568;
    BOOL v9 = self;
    id v10 = v4;
    [(DOCTagRegistry *)self performBatchUpdate:&v5];
    [(DOCTagRegistry *)self synchronize];
  }
}

void __29__DOCTagRegistry_removeTags___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userTags];
  [v2 removeObjectsInArray:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) discoveredTags];
  [v3 removeObjectsInArray:*(void *)(a1 + 40)];
}

- (BOOL)canReplaceTag:(id)a3 withTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 type];
  if (v8 == [v7 type]
    && ([v7 displayName],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v10))
  {
    uint64_t v11 = [(DOCTagRegistry *)self _memberTag:v7];
    uint64_t v12 = v11;
    if (v11 && ![v11 isEqual:v6])
    {
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v13 = -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", [v6 type]);
      BOOL v14 = [v13 indexOfObject:v6] != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)replaceTag:(id)a3 withTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DOCTagRegistry *)self canReplaceTag:v6 withTag:v7];
  if (v8)
  {
    BOOL v9 = -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", [v6 type]);
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", objc_msgSend(v9, "indexOfObject:", v6), v7);
    [(DOCTagRegistry *)self notifyObserversDidReplaceTag:v6 withTag:v7];
    [(DOCTagRegistry *)self synchronize];
  }
  return v8;
}

- (BOOL)moveTag:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = -[DOCTagRegistry _setForTagType:](self, "_setForTagType:", [v6 type]);
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = 0;
  }
  else
  {
    unint64_t v10 = [v7 count];
    BOOL v9 = 0;
    if (v8 != a4 && v10 > a4)
    {
      uint64_t v11 = [MEMORY[0x263F088D0] indexSetWithIndex:v8];
      [v7 moveObjectsAtIndexes:v11 toIndex:a4];

      [(DOCTagRegistry *)self synchronize];
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)performBatchUpdate:(id)a3
{
  id v4 = (void (**)(id, DOCTagRegistry *))a3;
  [(DOCTagRegistry *)self inBatchUpdateEnter];
  v4[2](v4, self);

  [(DOCTagRegistry *)self inBatchUpdateLeave];
}

- (BOOL)inBatchUpdate
{
  return self->_inBatchUpdateCount > 0;
}

- (void)inBatchUpdateEnter
{
  int64_t inBatchUpdateCount = self->_inBatchUpdateCount;
  self->_int64_t inBatchUpdateCount = inBatchUpdateCount + 1;
  if (!inBatchUpdateCount)
  {
    id v4 = [(DOCTagRegistry *)self _allTags];
    tagsBeforeBatchUpdate = self->_tagsBeforeBatchUpdate;
    self->_tagsBeforeBatchUpdate = v4;
    MEMORY[0x270F9A758](v4, tagsBeforeBatchUpdate);
  }
}

- (void)inBatchUpdateLeave
{
  int64_t v2 = self->_inBatchUpdateCount - 1;
  self->_int64_t inBatchUpdateCount = v2;
  if (!v2)
  {
    uint64_t v5 = self->_tagsBeforeBatchUpdate;
    tagsBeforeBatchUpdate = self->_tagsBeforeBatchUpdate;
    self->_tagsBeforeBatchUpdate = 0;

    if (self->_shouldSynchronizeAfterBatchUpdate) {
      [(DOCTagRegistry *)self synchronize];
    }
    [(DOCTagRegistry *)self _notifyDidRemoveTagIfNoLongPresentExistingTags:v5];
  }
}

- (id)_allTags
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(NSMutableOrderedSet *)self->_userTags array];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(NSMutableOrderedSet *)self->_discoveredTags array];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)synchronize
{
  v33[2] = *MEMORY[0x263EF8340];
  if ([(DOCTagRegistry *)self inBatchUpdate])
  {
    self->_shouldSynchronizeAfterBatchUpdate = 1;
    return;
  }
  self->_shouldSynchronizeAfterBatchUpdate = 0;
  int64_t v3 = [(DOCTagRegistry *)self tagSerialNumber];
  id v4 = +[DOCTagLocalStorage sharedAppGroupStorage];
  uint64_t v5 = [v4 tagSerialNumber];

  if (v3 >= v5)
  {
    userTags = self->_userTags;
    uint64_t v8 = +[DOCTagLocalStorage sharedAppGroupStorage];
    BOOL v9 = [v8 userTags];
    uint64_t v6 = +[DOCTag areTags:userTags equalByNameAndColorTo:v9] ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }
  discoveredTags = self->_discoveredTags;
  uint64_t v11 = +[DOCTagLocalStorage sharedAppGroupStorage];
  uint64_t v12 = [v11 discoveredTags];
  BOOL v13 = +[DOCTag areTags:discoveredTags equalByNameAndColorTo:v12];

  if (v6)
  {
    BOOL v14 = +[DOCTagLocalStorage sharedAppGroupStorage];
    v15 = v14;
    if (v3 >= v5)
    {
      [v14 setUserTags:self->_userTags];

      long long v20 = self->_iCloudDataSource;
      iCloudDataSource = self->_iCloudDataSource;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __29__DOCTagRegistry_synchronize__block_invoke;
      v29[3] = &unk_2641B5590;
      v30 = v20;
      v31 = self;
      long long v22 = v20;
      [(DOCTagCloudSource *)iCloudDataSource isICloudAvailableWithCompletionBlock:v29];
    }
    else
    {
      id v16 = [v14 userTags];
      char v17 = (NSMutableOrderedSet *)[v16 mutableCopy];
      BOOL v18 = self->_userTags;
      self->_userTags = v17;

      v19 = +[DOCTagLocalStorage sharedAppGroupStorage];
      self->_tagSerialNumber = [v19 tagSerialNumber];
    }
  }
  BOOL v23 = !v13;
  if (!v13)
  {
    v24 = +[DOCTagLocalStorage sharedAppGroupStorage];
    [v24 setDiscoveredTags:self->_discoveredTags];

    goto LABEL_14;
  }
  if (v6 | v23)
  {
LABEL_14:
    uint64_t v25 = [MEMORY[0x263F08A00] defaultCenter];
    v32[0] = @"DOCTagRegistryChangeUserTagsDidChangeKey";
    v26 = [NSNumber numberWithBool:v6];
    v32[1] = @"DOCTagRegistryChangeDiscoveredTagsDidChangeKey";
    v33[0] = v26;
    v27 = [NSNumber numberWithBool:v23];
    v33[1] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v25 postNotificationName:@"DOCTagRegistryTagsDidChangeNotification" object:self userInfo:v28];
  }
}

uint64_t __29__DOCTagRegistry_synchronize__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) writeTagsToCloud];
  }
  else
  {
    int64_t v3 = +[DOCTagLocalStorage sharedAppGroupStorage];
    uint64_t v4 = [v3 tagSerialNumber];

    [*(id *)(a1 + 40) setTagSerialNumber:v4 + 1];
  }
  uint64_t v5 = (const char *)[@"DOCTagRegistryLocalStorageDidChangeNotification" UTF8String];
  return notify_post(v5);
}

- (void)setTagSerialNumber:(int64_t)a3
{
  if (self->_tagSerialNumber != a3)
  {
    self->_tagSerialNumber = a3;
    id v4 = +[DOCTagLocalStorage sharedAppGroupStorage];
    [v4 setTagSerialNumber:a3];
  }
}

- (NSPointerArray)changeObservers
{
  return self->_changeObservers;
}

- (void)setUserTags:(id)a3
{
}

- (NSMutableOrderedSet)discoveredTags
{
  return self->_discoveredTags;
}

- (void)setDiscoveredTags:(id)a3
{
}

- (DOCTagCloudSource)iCloudDataSource
{
  return self->_iCloudDataSource;
}

- (int64_t)inBatchUpdateCount
{
  return self->_inBatchUpdateCount;
}

- (void)setInBatchUpdateCount:(int64_t)a3
{
  self->_int64_t inBatchUpdateCount = a3;
}

- (NSArray)tagsBeforeBatchUpdate
{
  return self->_tagsBeforeBatchUpdate;
}

- (void)setTagsBeforeBatchUpdate:(id)a3
{
}

- (BOOL)shouldSynchronizeAfterBatchUpdate
{
  return self->_shouldSynchronizeAfterBatchUpdate;
}

- (void)setShouldSynchronizeAfterBatchUpdate:(BOOL)a3
{
  self->_shouldSynchronizeAfterBatchUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagsBeforeBatchUpdate, 0);
  objc_storeStrong((id *)&self->_iCloudDataSource, 0);
  objc_storeStrong((id *)&self->_discoveredTags, 0);
  objc_storeStrong((id *)&self->_userTags, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "Failed to register libnotify", v1, 2u);
}

@end