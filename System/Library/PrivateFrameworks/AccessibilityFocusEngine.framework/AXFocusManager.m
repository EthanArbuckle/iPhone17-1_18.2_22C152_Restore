@interface AXFocusManager
- (AXElement)currentApplication;
- (AXElement)focusContainerForSuccessfulTypeaheadMovement;
- (AXFocusManager)init;
- (BOOL)_focusOnFocusContainer:(id)a3;
- (BOOL)_moveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5;
- (BOOL)_moveFocusInRemoteElement:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5;
- (BOOL)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 shouldWrap:(BOOL)a5;
- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5;
- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5;
- (NSHashTable)observers;
- (NSString)typeaheadString;
- (OS_dispatch_queue)movementQueue;
- (OS_dispatch_queue)observersQueue;
- (id)_currentFocusContainers;
- (id)_moveFocusContainerFocusInDirection:(int64_t)a3;
- (id)currentElement;
- (id)currentFocusContainer;
- (os_unfair_lock_s)observersLock;
- (unint64_t)_indexOfTypeaheadPIDInFocusContainers:(id)a3;
- (void)_currentFocusContainers;
- (void)_enumerateObservers:(id)a3;
- (void)_handleFailedFocusMovementWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 queryString:(id)a5 shouldWrap:(BOOL)a6;
- (void)_moveToElementWithHeading:(unint64_t)a3 queryString:(id)a4;
- (void)_verifyPIDForTypeahead;
- (void)addObserver:(id)a3;
- (void)focusOnSceneForTypeahead;
- (void)moveFocusInsideForward:(BOOL)a3;
- (void)moveFocusInsideForward:(BOOL)a3 shouldWrap:(BOOL)a4;
- (void)moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setFocusContainerForSuccessfulTypeaheadMovement:(id)a3;
- (void)setMovementQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObserversLock:(os_unfair_lock_s)a3;
- (void)setObserversQueue:(id)a3;
- (void)setTypeaheadString:(id)a3;
@end

@implementation AXFocusManager

- (AXFocusManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXFocusManager;
  v2 = [(AXFocusManager *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("AXFocusMovementQueue", v3);
    [(AXFocusManager *)v2 setMovementQueue:v4];

    v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(AXFocusManager *)v2 setObservers:v5];

    [(AXFocusManager *)v2 setObserversLock:0];
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.AXFocusManager.ObserversQueue", v3);
    [(AXFocusManager *)v2 setObserversQueue:v6];
  }
  return v2;
}

- (id)_moveFocusContainerFocusInDirection:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = [(AXFocusManager *)self currentFocusContainer];
  dispatch_queue_t v6 = [(AXFocusManager *)self _currentFocusContainers];
  v7 = AXLogFocusEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(AXFocusManager *)a3 _moveFocusContainerFocusInDirection:v7];
  }

  if ((unint64_t)[v6 count] < 2)
  {
    v9 = AXLogFocusEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_230C8D000, v9, OS_LOG_TYPE_INFO, "Not able to switch native focused container because we didn't have more than 1: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v8 = [v6 indexOfObject:v5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = AXLogFocusEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AXFocusManager _moveFocusContainerFocusInDirection:]();
    }
LABEL_9:
    v10 = v5;
    goto LABEL_34;
  }
  uint64_t v11 = v8;
  uint64_t v12 = v8;
  while (1)
  {
    v13 = v6;
    v14 = v13;
    if (a3 == 1)
    {
      if ([v13 count] - 1 == v12) {
        uint64_t v12 = 0;
      }
      else {
        ++v12;
      }
    }
    else if (v12)
    {
      --v12;
    }
    else
    {
      uint64_t v12 = [v13 count] - 1;
    }

    v9 = [v14 objectAtIndexedSubscript:v12];
    if ([(AXFocusManager *)self _focusOnFocusContainer:v9]) {
      break;
    }
    v15 = AXLogFocusEngine();
    v16 = v15;
    if (v12 == v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230C8D000, v16, OS_LOG_TYPE_DEFAULT, "Giving up on switching focus containers, because we wrapped around to our original.", buf, 2u);
      }
      v10 = v5;
      goto LABEL_33;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_debug_impl(&dword_230C8D000, v16, OS_LOG_TYPE_DEBUG, "Skipping empty focus container: %@", buf, 0xCu);
    }
  }
  if (([v5 isEqual:v9] & 1) == 0)
  {
    v17 = AXLogFocusEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AXFocusManager _moveFocusContainerFocusInDirection:]();
    }

    [v5 disableFocus];
  }
  v18 = AXLogFocusEngine();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[AXFocusManager _moveFocusContainerFocusInDirection:]();
  }

  v10 = v9;
  v16 = v5;
LABEL_33:

LABEL_34:
  return v10;
}

- (void)moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  v7 = [(AXFocusManager *)self movementQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AXFocusManager_moveFocusWithHeading_byGroup___block_invoke;
  block[3] = &unk_264BB2948;
  block[4] = self;
  block[5] = a3;
  BOOL v9 = a4;
  dispatch_async(v7, block);
}

uint64_t __47__AXFocusManager_moveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = [v2 typeaheadString];
  [v2 _moveFocusWithHeading:v3 byGroup:v4 queryString:v5 shouldWrap:1];

  return MEMORY[0x270F09948]();
}

- (void)moveFocusInsideForward:(BOOL)a3
{
}

- (void)moveFocusInsideForward:(BOOL)a3 shouldWrap:(BOOL)a4
{
  if (a3) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 32;
  }
  v7 = [(AXFocusManager *)self movementQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AXFocusManager_moveFocusInsideForward_shouldWrap___block_invoke;
  block[3] = &unk_264BB2948;
  block[4] = self;
  block[5] = v6;
  BOOL v9 = a4;
  dispatch_async(v7, block);
}

uint64_t __52__AXFocusManager_moveFocusInsideForward_shouldWrap___block_invoke(uint64_t a1)
{
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 typeaheadString];
  [v2 _moveFocusWithHeading:v3 byGroup:0 queryString:v4 shouldWrap:*(unsigned __int8 *)(a1 + 48)];

  return MEMORY[0x270F09948]();
}

- (void)moveFocusWithHeading:(unint64_t)a3 queryString:(id)a4
{
}

- (void)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 queryString:(id)a5 shouldWrap:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  id v10 = a5;
  uint64_t v11 = [(AXFocusManager *)self currentElement];
  if ([v11 hasRemoteFocusSystem]) {
    [v11 elementForRemoteFocusSystem];
  }
  else {
  uint64_t v12 = [(AXFocusManager *)self currentFocusContainer];
  }
  if ([v10 length])
  {
    [(AXFocusManager *)self setTypeaheadString:v10];
    if ((a3 & 0x100) != 0) {
      [(AXFocusManager *)self setFocusContainerForSuccessfulTypeaheadMovement:0];
    }
    [(AXFocusManager *)self _moveToElementWithHeading:a3 queryString:v10];
  }
  else
  {
    [(AXFocusManager *)self _moveFocusWithHeading:a3 byGroup:v7 shouldWrap:v6];
  }
  v13 = [(AXFocusManager *)self currentElement];
  if ([v13 hasRemoteFocusSystem]) {
    [v13 elementForRemoteFocusSystem];
  }
  else {
  v14 = [(AXFocusManager *)self currentFocusContainer];
  }
  if ([v11 hasRemoteFocusSystem]
    && ([v11 isEqual:v13] & 1) == 0
    && ([v12 isEqual:v14] & 1) == 0)
  {
    v15 = AXLogFocusEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AXFocusManager _moveFocusWithHeading:byGroup:queryString:shouldWrap:]();
    }

    [v12 disableFocus];
  }
  if ([v11 isEqual:v13])
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke;
    v18[3] = &unk_264BB2970;
    v18[4] = self;
    v18[5] = a3;
    [(AXFocusManager *)self _enumerateObservers:v18];
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke_2;
    v16[3] = &unk_264BB2998;
    v16[4] = self;
    id v17 = v13;
    [(AXFocusManager *)self _enumerateObservers:v16];
  }
}

void __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 focusManager:*(void *)(a1 + 32) didHitBoundaryWithHeading:*(void *)(a1 + 40)];
  }
}

void __71__AXFocusManager__moveFocusWithHeading_byGroup_queryString_shouldWrap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 focusManager:*(void *)(a1 + 32) didMoveToElement:*(void *)(a1 + 40)];
  }
}

- (void)focusOnSceneForTypeahead
{
  [(AXFocusManager *)self setTypeaheadString:0];
  [(AXFocusManager *)self _verifyPIDForTypeahead];
  id v3 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];

  if (v3)
  {
    id v4 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];
    [(AXFocusManager *)self _focusOnFocusContainer:v4];
  }
}

- (BOOL)_focusOnFocusContainer:(id)a3
{
  id v3 = a3;
  if (![v3 hasNativeFocusElements]) {
    goto LABEL_7;
  }
  id v4 = [MEMORY[0x263F21668] systemWideElement];
  v5 = [v4 systemApplication];
  BOOL v6 = (void *)MEMORY[0x263EFF8C0];
  BOOL v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "pid"));
  uint64_t v8 = [v3 fbSceneIdentifier];
  BOOL v9 = objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);
  int v10 = [v5 performAction:5303 withValue:v9];

  if (v10)
  {
    uint64_t v11 = [v3 currentFocusElement];
    if ([v11 hasRemoteFocusSystem])
    {
      uint64_t v12 = [v11 elementForRemoteFocusSystem];
      int v13 = [v12 hasNativeFocusElements];
      if (v13) {
        [v11 focusOnApplication];
      }
    }
    else
    {
      [v3 didFocus];
      LOBYTE(v13) = 1;
    }
  }
  else
  {
LABEL_7:
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)_indexOfTypeaheadPIDInFocusContainers:(id)a3
{
  id v4 = a3;
  v5 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];

  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__AXFocusManager__indexOfTypeaheadPIDInFocusContainers___block_invoke;
    v8[3] = &unk_264BB29C0;
    v8[4] = self;
    unint64_t v6 = [v4 indexOfObjectPassingTest:v8];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __56__AXFocusManager__indexOfTypeaheadPIDInFocusContainers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 focusContainerForSuccessfulTypeaheadMovement];
  uint64_t v5 = [v4 isEqual:v3];

  return v5;
}

- (void)_verifyPIDForTypeahead
{
  id v3 = [(AXFocusManager *)self _currentFocusContainers];
  id v4 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    [(AXFocusManager *)self setFocusContainerForSuccessfulTypeaheadMovement:0];
  }
}

- (id)_currentFocusContainers
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F21668] systemWideElement];
  id v4 = [v3 systemApplication];
  char v5 = [v4 currentApplications];

  unint64_t v6 = [MEMORY[0x263F21668] systemWideElement];
  BOOL v7 = [v6 elementForAttribute:1006 shouldFetchAttributes:0];

  if (v7 && [v7 pid])
  {
    uint64_t v8 = [v5 arrayByAddingObject:v7];

    char v5 = (void *)v8;
  }
  BOOL v9 = [MEMORY[0x263F21668] systemWideElement];
  int v10 = [v9 elementForAttribute:1010 shouldFetchAttributes:0];

  if (v10 && [v10 pid])
  {
    uint64_t v11 = [v5 arrayByAddingObject:v10];

    char v5 = (void *)v11;
  }
  uint64_t v12 = [MEMORY[0x263F21668] systemWideElement];
  int v13 = [v12 elementForAttribute:1005 shouldFetchAttributes:0];

  if (v13 && [v13 pid])
  {
    uint64_t v14 = [v5 arrayByAddingObject:v13];

    char v5 = (void *)v14;
  }
  v15 = [MEMORY[0x263F21668] systemWideElement];
  uint64_t v16 = [v15 elementForAttribute:1000 shouldFetchAttributes:0];

  v36 = v10;
  v37 = v7;
  uint64_t v33 = v16;
  v35 = v13;
  if (([v5 containsObject:v16] & 1) == 0)
  {
    id v17 = objc_msgSend(MEMORY[0x263F22968], "server", v16, v13, v10, v7);
    int v18 = [v17 isPIPWindowVisible];

    if (v18)
    {
      uint64_t v19 = [v5 arrayByAddingObject:v16];

      char v5 = (void *)v19;
    }
  }
  v20 = [(AXFocusManager *)self currentFocusContainer];
  v21 = [v20 windowSceneIdentifier];

  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = [*(id *)(*((void *)&v42 + 1) + 8 * i) focusContainersForCurrentSceneIdentifier:v21];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __41__AXFocusManager__currentFocusContainers__block_invoke;
        v40[3] = &unk_264BB29E8;
        id v41 = v22;
        [v28 enumerateKeysAndObjectsUsingBlock:v40];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v25);
  }

  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __41__AXFocusManager__currentFocusContainers__block_invoke_2;
  v38[3] = &unk_264BB2A10;
  id v30 = v29;
  id v39 = v30;
  [v22 enumerateKeysAndObjectsUsingBlock:v38];
  v31 = AXLogFocusEngine();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[AXFocusManager _currentFocusContainers]();
  }

  return v30;
}

void __41__AXFocusManager__currentFocusContainers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  unint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];

  if (v6)
  {
    BOOL v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
    [v7 axSafelyAddObjectsFromArray:v5];
  }
  else
  {
    BOOL v7 = [MEMORY[0x263EFF980] arrayWithArray:v5];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

uint64_t __41__AXFocusManager__currentFocusContainers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObjectsFromArray:");
}

- (void)_moveToElementWithHeading:(unint64_t)a3 queryString:(id)a4
{
  id v27 = a4;
  [(AXFocusManager *)self _verifyPIDForTypeahead];
  unint64_t v6 = [(AXFocusManager *)self _currentFocusContainers];
  BOOL v7 = v6;
  if ((a3 & 0x110) == 0)
  {
    id v8 = [v6 reverseObjectEnumerator];
    uint64_t v9 = [v8 allObjects];

    BOOL v7 = (void *)v9;
  }
  unint64_t v10 = [(AXFocusManager *)self _indexOfTypeaheadPIDInFocusContainers:v7];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = v10;
  }
  uint64_t v12 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];
  [(AXFocusManager *)self setFocusContainerForSuccessfulTypeaheadMovement:0];
  if (v11 < [v7 count])
  {
    if ((a3 & 0x110) != 0) {
      uint64_t v13 = 256;
    }
    else {
      uint64_t v13 = 512;
    }
    if ((a3 & 0x300) != 0) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = a3;
    }
    unint64_t v15 = v11;
    while (1)
    {
      uint64_t v16 = [v7 objectAtIndex:v15];
      id v17 = [v16 currentFocusElement];
      BOOL v18 = [(AXFocusManager *)self _moveFocusInFocusContainer:v16 withHeading:v14 queryString:v27];
      uint64_t v19 = [v16 currentFocusElement];
      if (v18
        && (![v17 isEqual:v19] || objc_msgSend(v19, "hasRemoteFocusSystem")))
      {
        break;
      }

      ++v15;
      unint64_t v14 = v13;
      if (v15 >= [v7 count]) {
        goto LABEL_20;
      }
    }
    [(AXFocusManager *)self setFocusContainerForSuccessfulTypeaheadMovement:v16];
  }
LABEL_20:
  uint64_t v20 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];
  v21 = (void *)v20;
  if (v20) {
    id v22 = (void *)v20;
  }
  else {
    id v22 = v12;
  }
  [(AXFocusManager *)self setFocusContainerForSuccessfulTypeaheadMovement:v22];

  while (v11 < [v7 count])
  {
    id v23 = [v7 objectAtIndex:v11];
    int v24 = [v23 pid];
    uint64_t v25 = [(AXFocusManager *)self focusContainerForSuccessfulTypeaheadMovement];
    int v26 = [v25 pid];

    if (v24 != v26) {
      [v23 disableFocus];
    }

    ++v11;
  }
}

- (BOOL)_moveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 currentFocusElement];
  if (![v10 hasRemoteFocusSystem]) {
    goto LABEL_5;
  }
  [v10 focusOnRemoteSceneID];
  unint64_t v11 = [v10 elementForRemoteFocusSystem];
  if (![(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v11 withHeading:a4 queryString:v9])
  {

LABEL_5:
    BOOL v12 = [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v8 withHeading:a4 queryString:v9];
    goto LABEL_6;
  }
  [v10 focusOnApplication];

  BOOL v12 = 1;
LABEL_6:

  return v12;
}

- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 queryString:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [v8 currentFocusElement];
  int v11 = [v8 moveFocusWithHeading:a4 withQueryString:v9];
  BOOL v12 = [v8 currentFocusElement];
  if (v11)
  {
    if (([v10 isEqual:v12] & 1) != 0 || !objc_msgSend(v12, "hasRemoteFocusSystem"))
    {
      BOOL v16 = 1;
    }
    else
    {
      unint64_t v13 = a4 & 0x220;
      if ((a4 & 0x220) != 0) {
        uint64_t v14 = 512;
      }
      else {
        uint64_t v14 = 256;
      }
      unint64_t v15 = [v12 elementForRemoteFocusSystem];
      [v12 focusOnRemoteSceneID];
      if ([v15 moveFocusWithHeading:v14 withQueryString:v9])
      {
        BOOL v16 = 1;
      }
      else
      {
        id v17 = [v15 currentFocusElement];

        if (v17)
        {
          BOOL v16 = 0;
        }
        else
        {
          if (v13) {
            uint64_t v18 = 32;
          }
          else {
            uint64_t v18 = 16;
          }
          BOOL v16 = [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v8 withHeading:v18 queryString:v9];
        }
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_moveFocusInRemoteElement:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = (unint64_t)a3;
  id v9 = AXLogFocusEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXFocusManager _moveFocusInRemoteElement:withHeading:byGroup:]();
  }

  unint64_t v10 = [(id)v8 elementForRemoteFocusSystem];
  uint64_t v11 = [v10 currentFocusElement];
  BOOL v12 = [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v10 withHeading:a4 byGroup:v5];
  uint64_t v13 = [v10 currentFocusElement];
  uint64_t v14 = [(AXFocusManager *)self currentElement];
  if (v11 | v13) {
    int v15 = [(id)v11 isEqual:v13] ^ 1;
  }
  else {
    int v15 = 0;
  }
  int v16 = v8 | v14;
  if (v8 | v14) {
    int v16 = [(id)v8 isEqual:v14] ^ 1;
  }
  int v17 = v12 & (v15 | v16);
  if (v17 == 1)
  {
    uint64_t v18 = AXLogFocusEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[AXFocusManager _moveFocusInRemoteElement:withHeading:byGroup:]();
    }

    [(id)v8 focusOnApplication];
  }

  return v17;
}

- (BOOL)_moveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4 shouldWrap:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = AXLogFocusEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v21 = [NSNumber numberWithUnsignedInteger:a3];
    id v22 = [NSNumber numberWithBool:v6];
    id v23 = [NSNumber numberWithBool:v5];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v34 = v23;
    _os_log_debug_impl(&dword_230C8D000, v9, OS_LOG_TYPE_DEBUG, "Attempting to move focus with heading: %@, grouped: %@, shouldWrap: %@", buf, 0x20u);
  }
  unint64_t v10 = [(AXFocusManager *)self currentElement];
  if ([v10 hasRemoteFocusSystem]
    && [(AXFocusManager *)self _moveFocusInRemoteElement:v10 withHeading:a3 byGroup:v6])
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    BOOL v12 = [(AXFocusManager *)self currentElement];

    uint64_t v13 = [(AXFocusManager *)self currentFocusContainer];
    if (a3 == 512 || a3 == 256)
    {
      uint64_t v14 = [(AXFocusManager *)self _currentFocusContainers];
      if ((unint64_t)[v14 count] >= 2)
      {
        int v15 = AXLogFocusEngine();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:].cold.4(a3 == 256, (uint64_t)v14, v15);
        }

        uint64_t v16 = [v14 indexOfObject:v13];
        int v17 = AXLogFocusEngine();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:]((uint64_t)v13, v16, v17);
        }

        if (a3 == 256) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = [v14 count] - 1;
        }
        if (v16 != v18)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v34 = __Block_byref_object_copy_;
          v35 = __Block_byref_object_dispose_;
          id v36 = 0;
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke;
          v30[3] = &unk_264BB2A38;
          v30[4] = self;
          v30[5] = buf;
          [v14 enumerateObjectsWithOptions:2 * (a3 == 512) usingBlock:v30];
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            if ((-[NSObject isEqual:](v13, "isEqual:") & 1) == 0)
            {
              uint64_t v19 = AXLogFocusEngine();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:]();
              }

              [v13 disableFocus];
            }
            uint64_t v20 = v13;
            uint64_t v13 = *(id *)(*(void *)&buf[8] + 40);
          }
          else
          {
            uint64_t v20 = AXLogFocusEngine();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = @"last";
              if (a3 == 256) {
                int v24 = @"first";
              }
              *(_DWORD *)v31 = 138412290;
              v32 = v24;
              _os_log_impl(&dword_230C8D000, v20, OS_LOG_TYPE_DEFAULT, "Unable to move to %@ focus container.", v31, 0xCu);
            }
          }

          _Block_object_dispose(buf, 8);
        }
      }
    }
    BOOL v11 = [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v13 withHeading:a3 byGroup:v6];
    uint64_t v25 = [(AXFocusManager *)self currentElement];
    int v26 = [v12 isEqual:v25];
    if ((v26 & v11) == 1) {
      int v27 = [v12 hasRemoteFocusSystem];
    }
    else {
      int v27 = v26 ^ 1;
    }

    if (!(v27 | !v5))
    {
      v28 = AXLogFocusEngine();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[AXFocusManager _moveFocusWithHeading:byGroup:shouldWrap:]();
      }

      [(AXFocusManager *)self _handleFailedFocusMovementWithHeading:a3 byGroup:v6];
      LOBYTE(v11) = 1;
    }

    unint64_t v10 = v12;
  }

  return v11;
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) _focusOnFocusContainer:v7])
  {
    unint64_t v8 = AXLogFocusEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_2();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
  id v9 = AXLogFocusEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_1();
  }
}

- (void)_handleFailedFocusMovementWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  BOOL v4 = a4;
  char v5 = a3;
  id v7 = [(AXFocusManager *)self currentFocusContainer];
  unint64_t v8 = [v7 application];
  int v9 = [v8 applicationIsExtension];

  if (!v9) {
    goto LABEL_3;
  }
  unint64_t v10 = [(AXFocusManager *)self currentElement];
  BOOL v11 = [v10 applicationForHostFocusSystem];
  [v11 currentFocusElement];

  BOOL v12 = [(AXFocusManager *)self currentFocusContainer];
  LODWORD(v11) = [v12 isEqual:v7];

  if (v11)
  {
LABEL_3:
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__AXFocusManager__handleFailedFocusMovementWithHeading_byGroup___block_invoke;
    v22[3] = &unk_264BB2A60;
    v22[4] = self;
    uint64_t v13 = MEMORY[0x230FCA230](v22);
    uint64_t v14 = (void *)v13;
    if ((v5 & 0x10) != 0)
    {
      uint64_t v19 = 256;
      if ((*(uint64_t (**)(uint64_t))(v13 + 16))(v13))
      {
        uint64_t v20 = 1;
LABEL_11:
        uint64_t v21 = [(AXFocusManager *)self _moveFocusContainerFocusInDirection:v20];

        id v7 = (void *)v21;
      }
    }
    else
    {
      if ((v5 & 0x20) == 0)
      {
        int v15 = [(AXFocusManager *)self currentElement];
        int v16 = [v15 hasRemoteFocusSystem];

        if (v16)
        {
          int v17 = [(AXFocusManager *)self currentElement];
          uint64_t v18 = [v17 elementForRemoteFocusSystem];

          [v18 focusOnApplication];
        }
        goto LABEL_13;
      }
      uint64_t v19 = 512;
      if ((*(uint64_t (**)(uint64_t))(v13 + 16))(v13))
      {
        uint64_t v20 = 2;
        goto LABEL_11;
      }
    }
    [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v7 withHeading:v19 byGroup:v4];
LABEL_13:
  }
}

BOOL __64__AXFocusManager__handleFailedFocusMovementWithHeading_byGroup___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _currentFocusContainers];
  BOOL v2 = (unint64_t)[v1 count] > 1;

  return v2;
}

- (BOOL)_recursiveMoveFocusInFocusContainer:(id)a3 withHeading:(unint64_t)a4 byGroup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int v9 = AXLogFocusEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:]();
  }

  unint64_t v10 = [v8 currentFocusElement];
  int v11 = [v8 moveFocusWithHeading:a4 byGroup:v5];
  BOOL v12 = [v8 currentFocusElement];
  if (v11)
  {
    if (([v10 isEqual:v12] & 1) != 0 || !objc_msgSend(v12, "hasRemoteFocusSystem"))
    {
      char v16 = 1;
    }
    else
    {
      uint64_t v13 = AXLogFocusEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:]();
      }

      if ((a4 & 0x220) != 0) {
        uint64_t v14 = 512;
      }
      else {
        uint64_t v14 = 256;
      }
      [v12 focusOnRemoteSceneID];
      int v15 = [v12 elementForRemoteFocusSystem];
      char v16 = [v15 moveFocusWithHeading:v14 byGroup:v5];
      if ((v16 & 1) != 0
        || ([v15 currentFocusElement],
            int v17 = objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        [v12 focusOnApplication];
      }
      else
      {
        uint64_t v19 = AXLogFocusEngine();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[AXFocusManager _recursiveMoveFocusInFocusContainer:withHeading:byGroup:]();
        }

        char v16 = [(AXFocusManager *)self _recursiveMoveFocusInFocusContainer:v8 withHeading:a4 byGroup:v5];
      }
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)currentElement
{
  BOOL v2 = [(AXFocusManager *)self currentApplication];
  id v3 = [v2 currentFocusElement];

  return v3;
}

- (AXElement)currentApplication
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  BOOL v2 = [MEMORY[0x263F21668] systemWideElement];
  id v3 = [v2 elementForAttribute:1007 shouldFetchAttributes:0];
  BOOL v4 = [v2 systemApplication];
  BOOL v5 = [v4 uiElement];

  BOOL v6 = [MEMORY[0x263F22968] server];
  int v7 = [v6 isContinuitySessionActive];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFF980];
    int v9 = [v5 arrayWithAXAttribute:1109];
    unint64_t v10 = [v8 arrayWithArray:v9];

    int v11 = [v5 arrayWithAXAttribute:1111];
    if (([v10 isEqualToArray:v11] & 1) == 0) {
      [v10 removeObjectsInArray:v11];
    }
    BOOL v12 = [v10 firstObject];
    [v12 intValue];
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    id v14 = [MEMORY[0x263F21668] elementWithAXUIElement:AppElementWithPid];
    if (AppElementWithPid) {
      CFRelease(AppElementWithPid);
    }
LABEL_15:

    goto LABEL_16;
  }
  int v15 = [v2 uiElement];
  unint64_t v10 = [v15 numberWithAXAttribute:1110];

  char v16 = [v5 arrayWithAXAttribute:1108];
  int v11 = [v16 firstObject];

  if (([v11 isEqualToString:*MEMORY[0x263F22648]] & 1) != 0
    || (int v17 = [v3 pid], v17 == objc_msgSend(v10, "intValue")) && v10)
  {
LABEL_9:
    uint64_t v18 = [v5 arrayWithAXAttribute:1109];
    BOOL v12 = [v18 firstObject];

    [v12 intValue];
    uint64_t v19 = (const void *)_AXUIElementCreateAppElementWithPid();
    uint64_t v20 = [MEMORY[0x263F21668] elementWithAXUIElement:v19];
    if (v19) {
      CFRelease(v19);
    }
    [v20 enableFocus];
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v3;
    }
    id v14 = v21;

    goto LABEL_15;
  }
  id v23 = [v3 bundleId];
  uint64_t v24 = *MEMORY[0x263F226C0];
  if ([v23 isEqualToString:*MEMORY[0x263F226C0]])
  {
    char v25 = [v11 isEqualToString:v24];

    if ((v25 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  int v26 = [v3 bundleId];
  int v27 = [v26 isEqualToString:@"com.apple.AccessibilityUIServer"];

  if (v27)
  {
    uint64_t v37 = v10;
    char v42 = 0;
    objc_opt_class();
    v28 = [v3 safeValueForKey:@"pid"];
    id v29 = __UIAccessibilityCastAsClass();

    [v5 arrayWithAXAttribute:1109];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (([v35 isEqual:v29] & 1) == 0)
          {
            [v35 intValue];
            id v36 = (const void *)_AXUIElementCreateAppElementWithPid();
            id v14 = [MEMORY[0x263F21668] elementWithAXUIElement:v36];
            if (v36) {
              CFRelease(v36);
            }

            unint64_t v10 = v37;
            goto LABEL_16;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    unint64_t v10 = v37;
  }
  id v14 = v3;
LABEL_16:

  return (AXElement *)v14;
}

- (id)currentFocusContainer
{
  BOOL v2 = [(AXFocusManager *)self currentApplication];
  id v3 = [v2 currentFocusContainer];

  return v3;
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)_enumerateObservers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AXFocusManager *)self observersQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__AXFocusManager__enumerateObservers___block_invoke;
    v6[3] = &unk_264BB2A88;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __38__AXFocusManager__enumerateObservers___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  BOOL v2 = [*(id *)(a1 + 32) observers];
  id v3 = [v2 allObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSString)typeaheadString
{
  return self->_typeaheadString;
}

- (void)setTypeaheadString:(id)a3
{
}

- (AXElement)focusContainerForSuccessfulTypeaheadMovement
{
  return self->_focusContainerForSuccessfulTypeaheadMovement;
}

- (void)setFocusContainerForSuccessfulTypeaheadMovement:(id)a3
{
}

- (OS_dispatch_queue)movementQueue
{
  return self->_movementQueue;
}

- (void)setMovementQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)observersQueue
{
  return self->_observersQueue;
}

- (void)setObserversQueue:(id)a3
{
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObserversLock:(os_unfair_lock_s)a3
{
  self->_observersLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_movementQueue, 0);
  objc_storeStrong((id *)&self->_focusContainerForSuccessfulTypeaheadMovement, 0);
  objc_storeStrong((id *)&self->_typeaheadString, 0);
}

- (void)_moveFocusContainerFocusInDirection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_230C8D000, v0, OS_LOG_TYPE_ERROR, "Could not find currently focus container %@ in list %@", v1, 0x16u);
}

- (void)_moveFocusContainerFocusInDirection:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Moved focus to focus container: %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusContainerFocusInDirection:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Disable focus in old focus container: %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusContainerFocusInDirection:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithLong:a1];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_230C8D000, a3, OS_LOG_TYPE_DEBUG, "Moving to focus container in direction %@ in focus containers: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_moveFocusWithHeading:byGroup:queryString:shouldWrap:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Moved to new element, disabling focus in previous remote focus container %@", v2, v3, v4, v5, v6);
}

- (void)_currentFocusContainers
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_230C8D000, v0, v1, "Current apps: %@\nCurrent focus containers: %@");
}

- (void)_moveFocusInRemoteElement:withHeading:byGroup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Moved focus in remote element %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusInRemoteElement:withHeading:byGroup:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Moving focus in remote element %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusWithHeading:byGroup:shouldWrap:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Handling failed focus movement in focusContainer: %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusWithHeading:byGroup:shouldWrap:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Updated focusContainer, disabling focus in previous focusContainer %@", v2, v3, v4, v5, v6);
}

- (void)_moveFocusWithHeading:(uint64_t)a1 byGroup:(uint64_t)a2 shouldWrap:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2(&dword_230C8D000, a2, a3, "Current focusContainer at %lu: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_moveFocusWithHeading:(char)a1 byGroup:(uint64_t)a2 shouldWrap:(NSObject *)a3 .cold.4(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = @"first";
  if ((a1 & 1) == 0) {
    uint64_t v3 = @"last";
  }
  *(_DWORD *)uint64_t v4 = 138412546;
  *(void *)&v4[4] = v3;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = a2;
  OUTLINED_FUNCTION_2(&dword_230C8D000, a2, a3, "Moving to %@ element with multiple focusContainers: %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x263EF8340]);
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Skipping empty focusContainer: %@", v2, v3, v4, v5, v6);
}

void __59__AXFocusManager__moveFocusWithHeading_byGroup_shouldWrap___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Moved focus to focusContainer: %@", v2, v3, v4, v5, v6);
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Did not hand off to remote process, staying in focusContainer: %@", v2, v3, v4, v5, v6);
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Handing off to remote process, new element is a remote element: %@", v2, v3, v4, v5, v6);
}

- (void)_recursiveMoveFocusInFocusContainer:withHeading:byGroup:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_230C8D000, v0, v1, "Trying to move focus in focusContainer: %@", v2, v3, v4, v5, v6);
}

@end