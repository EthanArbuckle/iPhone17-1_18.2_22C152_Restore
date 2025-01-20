@interface _FEFocusUpdateContext
+ (_FEDebugIssueReportFormatter)_defaultValidationReportFormatter;
- (BOOL)_focusRedirectedByGuide;
- (BOOL)_isDeferredUpdate;
- (BOOL)_isFilteredToGroup;
- (BOOL)_isValidInFocusSystem:(id)a3;
- (BOOL)_validate;
- (CGVector)_focusVelocity;
- (NSArray)_regionMapSnapshots;
- (NSString)_nextFocusedGroupIdentifier;
- (NSString)_previouslyFocusedGroupIdentifier;
- (UIImage)_regionMapSnapshotsVisualRepresentation;
- (_FEDebugIssueReport)_validationReport;
- (_FEDebugLogReport)_preferredFocusReport;
- (_FEFocusBehavior)focusBehavior;
- (_FEFocusEnvironment)_commonAncestorEnvironment;
- (_FEFocusEnvironment)_initialDestinationEnvironment;
- (_FEFocusEnvironmentScrollableContainerTuple)_commonEnvironmentScrollableContainer;
- (_FEFocusGuide)_focusedGuide;
- (_FEFocusItem)nextFocusedItem;
- (_FEFocusItem)previouslyFocusedItem;
- (_FEFocusItemInfo)_destinationItemInfo;
- (_FEFocusItemInfo)_sourceItemInfo;
- (_FEFocusMapSearchInfo)_focusMapSearchInfo;
- (_FEFocusMovementInfo)_focusMovement;
- (_FEFocusUpdateContext)init;
- (_FEFocusUpdateRequesting)_request;
- (_UIDynamicFocusGroupMap)_focusGroupMap;
- (double)_destinationViewDistanceOffscreen;
- (id)_focusMapSnapshotDebugInfoArray;
- (id)_initWithContext:(id)a3;
- (id)_initWithFocusMovementRequest:(id)a3 nextFocusedItem:(id)a4;
- (id)_initWithFocusUpdateRequest:(id)a3;
- (id)debugQuickLookObject;
- (id)description;
- (int64_t)_groupFilter;
- (unint64_t)focusHeading;
- (void)_cacheFocusBehavior;
- (void)_didUpdateFocus;
- (void)_restoreRestrictedFocusMovementWithMovement:(id)a3;
- (void)_setCommonEnvironmentScrollableContainer:(id)a3;
- (void)_setDeferredUpdate:(BOOL)a3;
- (void)_setDestinationViewDistanceOffscreen:(double)a3;
- (void)_setFocusGroupMap:(id)a3;
- (void)_setFocusMapSearchInfo:(id)a3;
- (void)_setFocusRedirectedByGuide:(BOOL)a3;
- (void)_setFocusedGuide:(id)a3;
- (void)_setInitialDestinationEnvironment:(id)a3;
- (void)_setPreferredFocusReport:(id)a3;
- (void)_setRegionMapSnapshots:(id)a3;
- (void)_setSourceItemInfo:(id)a3;
- (void)_setValidationReport:(id)a3;
- (void)_updateDestinationItemIfNeeded;
- (void)_updateWithFocusGroupMap:(id)a3;
- (void)_willUpdateFocusFromFocusedItem:(id)a3;
@end

@implementation _FEFocusUpdateContext

- (_FEFocusUpdateContext)init
{
  v3 = logger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_24F3F0000, v3, OS_LOG_TYPE_FAULT, "-init is not a useful initializer for this class. Use one of the designated initializers instead.", v8, 2u);
  }

  v4 = [[_FEFocusSystem alloc] initWithFocusBehavior:0];
  v5 = +[_FEFocusUpdateRequest requestForRemovingFocusInFocusSystem:v4];
  v6 = [(_FEFocusUpdateContext *)self _initWithFocusUpdateRequest:v5];

  return v6;
}

- (id)_initWithFocusUpdateRequest:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_FEFocusUpdateContext.m", 71, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)_FEFocusUpdateContext;
  v7 = [(_FEFocusUpdateContext *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_request, a3);
    v9 = [v6 focusSystem];
    v10 = [v9 focusedItem];
    uint64_t v11 = +[_FEFocusItemInfo infoWithItem:v10];
    sourceItemInfo = v8->_sourceItemInfo;
    v8->_sourceItemInfo = (_FEFocusItemInfo *)v11;

    if ([v6 isFocusRemovalRequest])
    {
      objc_storeWeak((id *)&v8->_initialDestinationEnvironment, 0);
    }
    else
    {
      v13 = [v6 destinationEnvironment];
      if (v13)
      {
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v13);
      }
      else
      {
        v14 = [v6 environment];
        objc_storeWeak((id *)&v8->_initialDestinationEnvironment, v14);
      }
    }
    *(unsigned char *)&v8->_flags |= 4u;
    [v6 cacheCurrentFocusSystem];
    [(_FEFocusUpdateContext *)v8 _cacheFocusBehavior];
  }

  return v8;
}

- (id)_initWithFocusMovementRequest:(id)a3 nextFocusedItem:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_FEFocusUpdateContext.m", 89, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_FEFocusUpdateContext;
  v10 = [(_FEFocusUpdateContext *)&v19 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    uint64_t v12 = [v8 movementInfo];
    focusMovement = v11->_focusMovement;
    v11->_focusMovement = (_FEFocusMovementInfo *)v12;

    uint64_t v14 = [v8 focusedItemInfo];
    sourceItemInfo = v11->_sourceItemInfo;
    v11->_sourceItemInfo = (_FEFocusItemInfo *)v14;

    objc_storeWeak((id *)&v11->_initialDestinationEnvironment, v9);
    *(unsigned char *)&v11->_flags |= 4u;
    v16 = [v8 movementInfo];
    *(unsigned char *)&v11->_flags = *(unsigned char *)&v11->_flags & 0xF7 | (8 * (([v16 heading] & 0x300) != 0));

    [(_FEFocusUpdateContext *)v11 _cacheFocusBehavior];
  }

  return v11;
}

- (id)_initWithContext:(id)a3
{
  v4 = (id *)a3;
  v16.receiver = self;
  v16.super_class = (Class)_FEFocusUpdateContext;
  v5 = [(_FEFocusUpdateContext *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_request, v4[9]);
    objc_storeStrong((id *)&v6->_sourceItemInfo, v4[10]);
    objc_storeStrong((id *)&v6->_destinationItemInfo, v4[2]);
    objc_storeStrong((id *)&v6->_focusMovement, v4[11]);
    id WeakRetained = objc_loadWeakRetained(v4 + 13);
    objc_storeWeak((id *)&v6->_initialDestinationEnvironment, WeakRetained);

    id v8 = objc_loadWeakRetained(v4 + 19);
    objc_storeWeak((id *)&v6->_focusedGuide, v8);

    v6->_focusRedirectedByGuide = *((unsigned char *)v4 + 13);
    objc_storeStrong((id *)&v6->_regionMapSnapshots, v4[16]);
    objc_storeStrong((id *)&v6->_regionMapSnapshotsVisualRepresentation, v4[6]);
    int v9 = *(unsigned char *)&v6->_flags & 0xFE | (_BYTE)v4[1] & 1;
    *(unsigned char *)&v6->_flags = v9;
    unsigned int v10 = v9 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)v4 + 8) >> 1) & 1));
    *(unsigned char *)&v6->_flags = v10;
    unsigned int v11 = v10 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)v4 + 8) >> 2) & 1));
    *(unsigned char *)&v6->_flags = v11;
    *(unsigned char *)&v6->_flags = v11 & 0xF7 | (_BYTE)v4[1] & 8;
    id v12 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)&v6->_commonAncestorEnvironment, v12);

    *(unsigned char *)&v6->_flags = *(unsigned char *)&v6->_flags & 0xEF | (_BYTE)v4[1] & 0x10;
    uint64_t v13 = [v4 focusBehavior];
    focusBehavior = v6->_focusBehavior;
    v6->_focusBehavior = (_FEFocusBehavior *)v13;
  }
  return v6;
}

- (void)_cacheFocusBehavior
{
  v3 = [(_FEFocusUpdateContext *)self _request];
  id v6 = [v3 focusSystem];

  v4 = [v6 behavior];
  focusBehavior = self->_focusBehavior;
  self->_focusBehavior = v4;
}

- (BOOL)_isValidInFocusSystem:(id)a3
{
  request = self->_request;
  id v5 = a3;
  id v6 = [(_FEFocusUpdateRequesting *)request focusSystem];

  if (v6 != v5) {
    return 0;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    char flags = *(unsigned char *)&self->_flags & 0xFC | [(_FEFocusUpdateContext *)self _validate] | 2;
    *(unsigned char *)&self->_char flags = flags;
  }
  return flags & 1;
}

- (BOOL)_validate
{
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  v3 = [(_FEFocusUpdateContext *)self previouslyFocusedItem];
  v4 = [(_FEFocusUpdateContext *)self nextFocusedItem];
  id v5 = [(_FEFocusUpdateContext *)self _request];
  id v6 = self->_validationReport;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __34___FEFocusUpdateContext__validate__block_invoke;
  v41[3] = &unk_2653286C8;
  v43 = &v44;
  v7 = v6;
  v42 = v7;
  id v8 = (unsigned int (**)(void))MEMORY[0x25335DA10](v41);
  if (v3 != v4) {
    goto LABEL_9;
  }
  if (([v5 allowsFocusingCurrentItem] & 1) == 0)
  {
    $7E0C05635123E2A0FF21903DA08D55EC flags = self->_flags;
    int v11 = (*(unsigned int *)&flags >> 3) & 1;
    *((unsigned char *)v45 + 24) = (*(unsigned char *)&flags & 8) != 0;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
      BOOL v12 = [(_FEFocusUpdateContext *)self _focusRedirectedByGuide];
      int v9 = v45 + 3;
      if (v12) {
        goto LABEL_4;
      }
      int v11 = *v9;
    }
    if (v11) {
      goto LABEL_9;
    }
    v31 = [(_FEFocusUpdateContext *)self _focusMovement];
    if (!v31) {
      goto LABEL_9;
    }
    v32 = [(_FEFocusUpdateContext *)self _initialDestinationEnvironment];

    if (v3 == v32) {
      goto LABEL_9;
    }
  }
  int v9 = v45 + 3;
LABEL_4:
  unsigned char *v9 = 1;
LABEL_9:
  if (v8[2](v8))
  {
    int v13 = [v5 requiresNextFocusedItem];
    int v14 = v4 ? 0 : v13;
    if (v14 == 1)
    {
      *((unsigned char *)v45 + 24) = 0;
      if (v7)
      {
        if (v3)
        {
          v15 = +[_FEDebugIssue issueWithDescription:@"There is no next focused item, but updating focus to nil is not allowed."];
          [(_FEDebugIssueReport *)v7 addIssue:v15];
        }
      }
    }
  }
  unsigned int v16 = v8[2](v8);
  if (v4) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = 0;
  }
  if (v17 == 1)
  {
    v18 = [(_FEFocusUpdateRequesting *)self->_request focusSystem];
    objc_super v19 = +[_FEFocusSystem focusSystemForEnvironment:v4];

    if (v18 != v19) {
      *((unsigned char *)v45 + 24) = 0;
    }
  }
  if (v8[2](v8) && [v5 requiresEnvironmentValidation])
  {
    if (v7)
    {
      v20 = +[_FEDebugIssue issueWithDescription:@"The following ancestor environments of the previously focused item prevented the focus update from occurring:"];
      v21 = +[_FEDebugIssue issueWithDescription:@"The following ancestor environments of the next focused item prevented the focus update from occurring:"];
    }
    else
    {
      v20 = 0;
      v21 = 0;
    }
    v22 = [v5 focusSystem];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __34___FEFocusUpdateContext__validate__block_invoke_2;
    v33[3] = &unk_2653286F0;
    id v34 = v3;
    v40 = &v44;
    id v35 = v4;
    v36 = self;
    id v23 = v20;
    id v37 = v23;
    v39 = v8;
    id v24 = v21;
    id v38 = v24;
    [v22 _performWithoutFocusUpdates:v33];

    if (v7)
    {
      v25 = [v23 subissues];
      uint64_t v26 = [v25 count];

      if (v26) {
        [(_FEDebugIssueReport *)v7 addIssue:v23];
      }
      v27 = [v24 subissues];
      uint64_t v28 = [v27 count];

      if (v28) {
        [(_FEDebugIssueReport *)v7 addIssue:v24];
      }
    }
  }
  char v29 = *((unsigned char *)v45 + 24);

  _Block_object_dispose(&v44, 8);
  return v29;
}

- (_FEFocusItem)previouslyFocusedItem
{
  v2 = [(_FEFocusUpdateContext *)self _sourceItemInfo];
  v3 = [v2 item];

  return (_FEFocusItem *)v3;
}

- (_FEFocusItem)nextFocusedItem
{
  v2 = [(_FEFocusUpdateContext *)self _destinationItemInfo];
  v3 = [v2 item];

  return (_FEFocusItem *)v3;
}

- (void)_setSourceItemInfo:(id)a3
{
  if (self->_sourceItemInfo != a3)
  {
    v4 = (_FEFocusItemInfo *)[a3 copy];
    sourceItemInfo = self->_sourceItemInfo;
    self->_sourceItemInfo = v4;

    *(unsigned char *)&self->_flags &= ~2u;
  }
}

- (_FEFocusItemInfo)_destinationItemInfo
{
  [(_FEFocusUpdateContext *)self _updateDestinationItemIfNeeded];
  destinationItemInfo = self->_destinationItemInfo;
  return destinationItemInfo;
}

- (void)_setInitialDestinationEnvironment:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_initialDestinationEnvironment, obj);
    id v5 = obj;
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void)_updateDestinationItemIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)&self->_flags &= ~4u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
    if (WeakRetained)
    {
      v3 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
      v4 = [(_FEFocusUpdateContext *)self _request];
      -[_UIDeepestPreferredEnvironmentSearch setAllowsOverridingPreferedFocusEnvironments:](v3, "setAllowsOverridingPreferedFocusEnvironments:", [v4 allowsOverridingPreferedFocusEnvironments]);

      if (self->_preferredFocusReport)
      {
        id v5 = +[_FEDebugLogNode rootNode];
        [(_UIDeepestPreferredEnvironmentSearch *)v3 setDebugLog:v5];
      }
      id v6 = [(_FEFocusUpdateContext *)self _request];
      v7 = [(_UIDeepestPreferredEnvironmentSearch *)v3 deepestPreferredFocusableItemForEnvironment:WeakRetained withRequest:v6];

      id v8 = +[_FEFocusItemInfo infoWithItem:v7];
      destinationItemInfo = self->_destinationItemInfo;
      self->_destinationItemInfo = v8;

      preferredFocusReport = self->_preferredFocusReport;
      if (preferredFocusReport)
      {
        int v11 = [(_UIDeepestPreferredEnvironmentSearch *)v3 debugLog];
        BOOL v12 = [v11 description];
        [(_FEDebugLogReport *)preferredFocusReport addMessage:v12];
      }
    }
    else
    {
      int v13 = +[_FEFocusItemInfo infoWithItem:0];
      v3 = (_UIDeepestPreferredEnvironmentSearch *)self->_destinationItemInfo;
      self->_destinationItemInfo = v13;
    }
  }
}

- (_FEFocusEnvironment)_commonAncestorEnvironment
{
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    v3 = [(_FEFocusUpdateContext *)self previouslyFocusedItem];
    v4 = [(_FEFocusUpdateContext *)self nextFocusedItem];
    id v5 = _FEFocusEnvironmentFirstCommonAncestor(v3, v4);
    objc_storeWeak((id *)&self->_commonAncestorEnvironment, v5);

    *(unsigned char *)&self->_flags |= 0x10u;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commonAncestorEnvironment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (unint64_t)focusHeading
{
  v2 = [(_FEFocusUpdateContext *)self _focusMovement];
  unint64_t v3 = [v2 heading];

  return v3;
}

- (CGVector)_focusVelocity
{
  [(_FEFocusUpdateContext *)self _destinationViewDistanceOffscreen];
  if (v3 == 0.0)
  {
    v4 = [(_FEFocusUpdateContext *)self _focusMovement];
    [v4 _velocity];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v9 = v6;
  double v10 = v8;
  result.dy = v10;
  result.dx = v9;
  return result;
}

- (void)_setFocusedGuide:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedGuide);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)&self->_focusedGuide, obj);
  }
  id v5 = objc_loadWeakRetained((id *)&self->_focusedGuide);
  [(_FEFocusUpdateContext *)self _setFocusRedirectedByGuide:v5 != 0];
}

- (void)_setFocusRedirectedByGuide:(BOOL)a3
{
  self->_focusRedirectedByGuide = a3;
}

- (void)_setFocusMapSearchInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = (_FEFocusMapSearchInfo *)a3;
  p_focusMapSearchInfo = &self->_focusMapSearchInfo;
  if (self->_focusMapSearchInfo != v5)
  {
    objc_storeStrong((id *)&self->_focusMapSearchInfo, a3);
    double v7 = *p_focusMapSearchInfo;
    if (*p_focusMapSearchInfo)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v8 = [(_FEFocusMapSearchInfo *)v7 destinationRegions];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _willParticipateAsDestinationRegionInFocusUpdate:self];
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_willUpdateFocusFromFocusedItem:(id)a3
{
  id v7 = a3;
  id v4 = [(_FEFocusUpdateContext *)self previouslyFocusedItem];

  id v5 = v7;
  if (v4 != v7)
  {
    double v6 = +[_FEFocusItemInfo infoWithItem:v7];
    [(_FEFocusUpdateContext *)self _setSourceItemInfo:v6];

    id v5 = v7;
  }
}

- (void)_didUpdateFocus
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(_FEFocusUpdateContext *)self _focusMapSearchInfo];
  id v4 = [v3 destinationRegions];

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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _didParticipateAsDestinationRegionInFocusUpdate:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_restoreRestrictedFocusMovementWithMovement:(id)a3
{
}

- (void)_updateWithFocusGroupMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_UIDynamicFocusGroupMap alloc] initWithBackingFocusGroupMap:v4];

  [(_FEFocusUpdateContext *)self _setFocusGroupMap:v5];
  previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
  self->_previouslyFocusedGroupIdentifier = 0;

  nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
  self->_nextFocusedGroupIdentifier = 0;
}

- (_UIDynamicFocusGroupMap)_focusGroupMap
{
  if (!self->_focusGroupMap && [(_FEFocusUpdateContext *)self _isFilteredToGroup])
  {
    double v3 = [_UIDynamicFocusGroupMap alloc];
    id v4 = [(_FEFocusUpdateContext *)self _request];
    uint64_t v5 = [v4 focusSystem];
    uint64_t v6 = [v5 _focusItemContainer];
    uint64_t v7 = [v6 _focusCoordinateSpace];
    uint64_t v8 = [(_UIDynamicFocusGroupMap *)v3 initWithCoordinateSpace:v7];
    focusGroupMap = self->_focusGroupMap;
    self->_focusGroupMap = v8;
  }
  long long v10 = self->_focusGroupMap;
  return v10;
}

- (NSString)_previouslyFocusedGroupIdentifier
{
  if (!self->_previouslyFocusedGroupIdentifier
    && [(_FEFocusUpdateContext *)self _isFilteredToGroup])
  {
    double v3 = [(_FEFocusUpdateContext *)self previouslyFocusedItem];
    if (v3)
    {
      id v4 = [(_FEFocusUpdateContext *)self _focusGroupMap];
      uint64_t v5 = [v4 focusGroupIdentifierForItem:v3];
      previouslyFocusedGroupIdentifier = self->_previouslyFocusedGroupIdentifier;
      self->_previouslyFocusedGroupIdentifier = v5;
    }
  }
  uint64_t v7 = self->_previouslyFocusedGroupIdentifier;
  return v7;
}

- (NSString)_nextFocusedGroupIdentifier
{
  if (!self->_nextFocusedGroupIdentifier && [(_FEFocusUpdateContext *)self _isFilteredToGroup])
  {
    double v3 = [(_FEFocusUpdateContext *)self nextFocusedItem];
    if (v3)
    {
      id v4 = [(_FEFocusUpdateContext *)self _focusGroupMap];
      uint64_t v5 = [v4 focusGroupIdentifierForItem:v3];
      nextFocusedGroupIdentifier = self->_nextFocusedGroupIdentifier;
      self->_nextFocusedGroupIdentifier = v5;
    }
  }
  uint64_t v7 = self->_nextFocusedGroupIdentifier;
  return v7;
}

- (int64_t)_groupFilter
{
  v2 = [(_FEFocusUpdateContext *)self _focusMovement];
  int64_t v3 = [v2 _groupFilter];

  return v3;
}

- (BOOL)_isFilteredToGroup
{
  return [(_FEFocusUpdateContext *)self _groupFilter] != 0;
}

+ (_FEDebugIssueReportFormatter)_defaultValidationReportFormatter
{
  v2 = objc_alloc_init(_FEDebugIssueReportFormatter);
  [(_FEDebugIssueReportFormatter *)v2 setHeader:@"The following issues were found that will prevent this focus update from being committed:"];
  [(_FEDebugIssueReportFormatter *)v2 setNoIssuesDescription:@"There are no issues that would prevent this focus update from occurring."];
  return v2;
}

- (NSArray)_regionMapSnapshots
{
  regionMapSnapshots = self->_regionMapSnapshots;
  if (!regionMapSnapshots)
  {
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    uint64_t v5 = self->_regionMapSnapshots;
    self->_regionMapSnapshots = v4;

    regionMapSnapshots = self->_regionMapSnapshots;
  }
  return regionMapSnapshots;
}

- (id)_focusMapSnapshotDebugInfoArray
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int64_t v3 = [(_FEFocusUpdateContext *)self _focusMapSearchInfo];

  if (v3)
  {
    id v4 = [(_FEFocusUpdateContext *)self _focusMapSearchInfo];
    uint64_t v5 = [v4 snapshots];

    if (v5)
    {
      uint64_t v6 = objc_getAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray);
      if (!v6)
      {
        uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v8 = v5;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
              uint64_t v14 = [(_FEFocusUpdateContext *)self _focusMapSearchInfo];
              long long v15 = [v13 _debugInfoWithFocusMapSearchInfo:v14];

              [v7 addObject:v15];
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }

        uint64_t v6 = (void *)[v7 copy];
        objc_setAssociatedObject(self, sel__focusMapSnapshotDebugInfoArray, v6, (void *)1);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6) {
    long long v16 = v6;
  }
  else {
    long long v16 = (void *)MEMORY[0x263EFFA68];
  }
  id v17 = v16;

  return v17;
}

- (UIImage)_regionMapSnapshotsVisualRepresentation
{
  regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  if (!regionMapSnapshotsVisualRepresentation)
  {
    id v4 = [(_FEFocusUpdateContext *)self _focusMapSnapshotDebugInfoArray];
    if (v4)
    {
      uint64_t v5 = [(_FEFocusUpdateContext *)self _focusMovement];
      uint64_t v6 = +[_FEFocusMapSnapshotDebugInfo _summaryImageForDebugInfoArray:v4 forFocusMovementWithInfo:v5 scaleFactor:1.0];
      uint64_t v7 = self->_regionMapSnapshotsVisualRepresentation;
      self->_regionMapSnapshotsVisualRepresentation = v6;
    }
    regionMapSnapshotsVisualRepresentation = self->_regionMapSnapshotsVisualRepresentation;
  }
  return regionMapSnapshotsVisualRepresentation;
}

- (id)debugQuickLookObject
{
  int64_t v3 = [(_FEFocusUpdateContext *)self _focusMovement];

  if (v3)
  {
    uint64_t v4 = [(_FEFocusUpdateContext *)self _regionMapSnapshotsVisualRepresentation];
    uint64_t v5 = (void *)v4;
    uint64_t v6 = @"Quick Look is unavailable for this focus update.";
    if (v4) {
      uint64_t v6 = (__CFString *)v4;
    }
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = @"Quick Look is only available for focus updates that represent a user-initiated focus movement.";
  }
  return v7;
}

- (id)description
{
  int64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(_FEFocusUpdateContext *)self previouslyFocusedItem];
  if (v4)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    id v8 = @"(nil)";
  }
  id v9 = (id)[v3 appendObject:v8 withName:@"previouslyFocusedItem"];

  uint64_t v10 = [(_FEFocusUpdateContext *)self nextFocusedItem];
  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
  }
  else
  {
    uint64_t v14 = @"(nil)";
  }
  id v15 = (id)[v3 appendObject:v14 withName:@"nextFocusedItem"];

  long long v16 = _FEStringFromFocusHeading([(_FEFocusUpdateContext *)self focusHeading]);
  id v17 = (id)[v3 appendObject:v16 withName:@"focusHeading"];

  if ([(_FEFocusUpdateContext *)self _groupFilter])
  {
    uint64_t v18 = _FEStringFromGroupFilter([(_FEFocusUpdateContext *)self _groupFilter]);
    id v19 = (id)[v3 appendObject:v18 withName:@"groupFilter"];
  }
  long long v20 = [v3 build];

  return v20;
}

- (void)_setFocusGroupMap:(id)a3
{
}

- (_FEFocusBehavior)focusBehavior
{
  return self->_focusBehavior;
}

- (_FEFocusUpdateRequesting)_request
{
  return self->_request;
}

- (_FEFocusItemInfo)_sourceItemInfo
{
  return self->_sourceItemInfo;
}

- (_FEFocusMovementInfo)_focusMovement
{
  return self->_focusMovement;
}

- (_FEFocusMapSearchInfo)_focusMapSearchInfo
{
  return self->_focusMapSearchInfo;
}

- (_FEFocusEnvironment)_initialDestinationEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initialDestinationEnvironment);
  return (_FEFocusEnvironment *)WeakRetained;
}

- (_FEFocusEnvironmentScrollableContainerTuple)_commonEnvironmentScrollableContainer
{
  return self->_commonEnvironmentScrollableContainer;
}

- (void)_setCommonEnvironmentScrollableContainer:(id)a3
{
}

- (double)_destinationViewDistanceOffscreen
{
  return self->_destinationViewDistanceOffscreen;
}

- (void)_setDestinationViewDistanceOffscreen:(double)a3
{
  self->_destinationViewDistanceOffscreen = a3;
}

- (BOOL)_isDeferredUpdate
{
  return self->_deferredUpdate;
}

- (void)_setDeferredUpdate:(BOOL)a3
{
  self->_deferredUpdate = a3;
}

- (void)_setRegionMapSnapshots:(id)a3
{
}

- (_FEDebugLogReport)_preferredFocusReport
{
  return self->_preferredFocusReport;
}

- (void)_setPreferredFocusReport:(id)a3
{
}

- (_FEDebugIssueReport)_validationReport
{
  return self->_validationReport;
}

- (void)_setValidationReport:(id)a3
{
}

- (_FEFocusGuide)_focusedGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedGuide);
  return (_FEFocusGuide *)WeakRetained;
}

- (BOOL)_focusRedirectedByGuide
{
  return self->_focusRedirectedByGuide;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusedGuide);
  objc_storeStrong((id *)&self->_validationReport, 0);
  objc_storeStrong((id *)&self->_preferredFocusReport, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshots, 0);
  objc_storeStrong((id *)&self->_commonEnvironmentScrollableContainer, 0);
  objc_destroyWeak((id *)&self->_initialDestinationEnvironment);
  objc_storeStrong((id *)&self->_focusMapSearchInfo, 0);
  objc_storeStrong((id *)&self->_focusMovement, 0);
  objc_storeStrong((id *)&self->_sourceItemInfo, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_focusBehavior, 0);
  objc_storeStrong((id *)&self->_focusGroupMap, 0);
  objc_storeStrong((id *)&self->_regionMapSnapshotsVisualRepresentation, 0);
  objc_storeStrong((id *)&self->_nextFocusedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_previouslyFocusedGroupIdentifier, 0);
  objc_destroyWeak((id *)&self->_commonAncestorEnvironment);
  objc_storeStrong((id *)&self->_destinationItemInfo, 0);
}

@end