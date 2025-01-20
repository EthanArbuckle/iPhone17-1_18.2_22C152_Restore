@interface CRKClassKitPersonaAdopter
+ (id)currentUserProviderObservedKeyPaths;
- (BOOL)personaFetched;
- (CRKClassKitCurrentUserProvider)currentUserProvider;
- (CRKClassKitPersonaAdopter)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4;
- (CRKPersonaBlockPerforming)personaBlockPerformer;
- (NSMutableArray)stashedBlocks;
- (NSString)currentPersonaUniqueString;
- (id)captureStashedBlocks;
- (void)callStashedBlocks;
- (void)callStashedBlocksIfPersonaFetched;
- (void)currentUserChanged;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performBlockWithClassKitPersona:(id)a3;
- (void)setCurrentPersonaUniqueString:(id)a3;
@end

@implementation CRKClassKitPersonaAdopter

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(id)objc_opt_class() currentUserProviderObservedKeyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(CRKClassKitCurrentUserProvider *)self->_currentUserProvider removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:@"CRKClassKitPersonaAdopterKVOContext"];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(CRKClassKitPersonaAdopter *)self callStashedBlocks];
  v8.receiver = self;
  v8.super_class = (Class)CRKClassKitPersonaAdopter;
  [(CRKClassKitPersonaAdopter *)&v8 dealloc];
}

- (CRKClassKitPersonaAdopter)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CRKClassKitPersonaAdopter;
  objc_super v8 = [(CRKClassKitPersonaAdopter *)&v23 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    stashedBlocks = v8->_stashedBlocks;
    v8->_stashedBlocks = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_personaBlockPerformer, a4);
    long long v11 = [[CRKClassKitCurrentUserProvider alloc] initWithClassKitFacade:v6];
    currentUserProvider = v8->_currentUserProvider;
    v8->_currentUserProvider = v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v13 = objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          [(CRKClassKitCurrentUserProvider *)v8->_currentUserProvider addObserver:v8 forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * v17++) options:0 context:@"CRKClassKitPersonaAdopterKVOContext"];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }

    [(CRKClassKitPersonaAdopter *)v8 currentUserChanged];
  }

  return v8;
}

- (void)performBlockWithClassKitPersona:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x263F08B88];
  id v6 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    long long v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKClassKitPersonaAdopter.m", 71, @"%@ must be called from the main thread", v10 object file lineNumber description];
  }
  id v7 = [(CRKClassKitPersonaAdopter *)self stashedBlocks];
  objc_super v8 = (void *)MEMORY[0x22A620AF0](v6);

  [v7 addObject:v8];

  [(CRKClassKitPersonaAdopter *)self callStashedBlocksIfPersonaFetched];
}

- (void)callStashedBlocksIfPersonaFetched
{
  if ([(CRKClassKitPersonaAdopter *)self personaFetched])
  {
    [(CRKClassKitPersonaAdopter *)self callStashedBlocks];
  }
}

- (void)callStashedBlocks
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(CRKClassKitPersonaAdopter *)self stashedBlocks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(CRKClassKitPersonaAdopter *)self currentPersonaUniqueString];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(CRKClassKitPersonaAdopter *)self captureStashedBlocks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          long long v12 = [(CRKClassKitPersonaAdopter *)self personaBlockPerformer];
          [v12 adoptPersonaWithUniqueString:v5 andPerformBlock:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)personaFetched
{
  v2 = [(CRKClassKitPersonaAdopter *)self currentUserProvider];
  char v3 = [v2 currentUserFetched];

  return v3;
}

- (id)captureStashedBlocks
{
  char v3 = [(CRKClassKitPersonaAdopter *)self stashedBlocks];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [(CRKClassKitPersonaAdopter *)self stashedBlocks];
  [v5 removeAllObjects];

  return v4;
}

+ (id)currentUserProviderObservedKeyPaths
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"currentUserFetched";
  v4[1] = @"currentUser";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKClassKitPersonaAdopterKVOContext")
  {
    [(CRKClassKitPersonaAdopter *)self currentUserChanged];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKClassKitPersonaAdopter;
    -[CRKClassKitPersonaAdopter observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)currentUserChanged
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKClassKitPersonaAdopter.m", 129, @"%@ must be called from the main thread", v10 object file lineNumber description];
  }
  uint64_t v4 = [(CRKClassKitPersonaAdopter *)self currentUserProvider];
  uint64_t v5 = [v4 currentUser];
  uint64_t v11 = [v5 accountPersonaUniqueIdentifier];

  uint64_t v6 = [(CRKClassKitPersonaAdopter *)self currentPersonaUniqueString];
  if (v6 | v11)
  {
    uint64_t v7 = [(CRKClassKitPersonaAdopter *)self currentPersonaUniqueString];
    char v8 = [v7 isEqual:v11];

    if ((v8 & 1) == 0) {
      [(CRKClassKitPersonaAdopter *)self setCurrentPersonaUniqueString:v11];
    }
  }
  [(CRKClassKitPersonaAdopter *)self callStashedBlocksIfPersonaFetched];
}

- (NSString)currentPersonaUniqueString
{
  return self->_currentPersonaUniqueString;
}

- (void)setCurrentPersonaUniqueString:(id)a3
{
}

- (CRKPersonaBlockPerforming)personaBlockPerformer
{
  return self->_personaBlockPerformer;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (NSMutableArray)stashedBlocks
{
  return self->_stashedBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedBlocks, 0);
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
  objc_storeStrong((id *)&self->_personaBlockPerformer, 0);

  objc_storeStrong((id *)&self->_currentPersonaUniqueString, 0);
}

@end