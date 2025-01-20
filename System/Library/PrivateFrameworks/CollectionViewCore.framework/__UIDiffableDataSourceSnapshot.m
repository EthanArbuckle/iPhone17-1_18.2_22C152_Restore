@interface __UIDiffableDataSourceSnapshot
- (BOOL)containsItemIdentifier:(id)a3;
- (BOOL)containsSectionIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)itemIdentifiers;
- (NSArray)pendingSnapshotUpdates;
- (NSArray)reconfiguredItemIdentifiers;
- (NSArray)reloadedItemIdentifiers;
- (NSArray)reloadedSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (NSString)description;
- (_UIDiffableDataSourceState)state;
- (__UIDiffableDataSourceSnapshot)init;
- (__UIDiffableDataSourceSnapshot)initWithState:(id)a3;
- (id)_identifiersForSectionsOrItems:(BOOL)a3 reconfiguredOrReloaded:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexPathForItemIdentifier:(id)a3;
- (id)itemIdentifierForIndexPath:(id)a3;
- (id)itemIdentifiersInSectionWithIdentifier:(id)a3;
- (id)sectionIdentifierForIndex:(int64_t)a3;
- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3;
- (int64_t)indexForSectionIdentifier:(id)a3;
- (int64_t)indexOfItemIdentifier:(id)a3;
- (int64_t)indexOfSectionIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfItemsInSection:(id)a3;
- (int64_t)numberOfSections;
- (void)_commitUpdateAtomic:(id)a3;
- (void)_prepareForApplyToDataSource;
- (void)_validateReloadUpdateThrowingIfNeeded:(id)a3;
- (void)appendItemsWithIdentifiers:(id)a3;
- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4;
- (void)appendSectionWithIdentifier:(id)a3;
- (void)appendSectionsWithIdentifiers:(id)a3;
- (void)deleteAllItems;
- (void)deleteItemsWithIdentifiers:(id)a3;
- (void)deleteSectionsWithIdentifiers:(id)a3;
- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4;
- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4;
- (void)reconfigureItemsWithIdentifiers:(id)a3;
- (void)reloadItemsWithIdentifiers:(id)a3;
- (void)reloadSectionsWithIdentifiers:(id)a3;
@end

@implementation __UIDiffableDataSourceSnapshot

- (NSArray)sectionIdentifiers
{
  return [(_UIDiffableDataSourceState *)self->_state sectionIdentifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSnapshotUpdates, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (NSArray)itemIdentifiers
{
  return [(_UIDiffableDataSourceState *)self->_state itemIdentifiers];
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfItemsInSection:a3];
}

- (id)itemIdentifiersInSectionWithIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state itemIdentifiersInSectionWithIdentifier:a3];
}

- (int64_t)indexOfSectionIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexOfSectionIdentifier:a3];
}

- (NSArray)pendingSnapshotUpdates
{
  return (NSArray *)self->_pendingSnapshotUpdates;
}

- (void)deleteSectionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDiffableDataSourceUpdate alloc] initWithSectionIdentifiers:v4 action:1];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (void)reloadSectionsWithIdentifiers:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 255, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];
  }
  v5 = [[_UIDiffableDataSourceUpdate alloc] initWithSectionIdentifiers:v7 action:2];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (void)reconfigureItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDiffableDataSourceUpdate alloc] initWithReconfiguredItemIdentifiers:v4];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (NSArray)reloadedSectionIdentifiers
{
  v2 = [(__UIDiffableDataSourceSnapshot *)self _identifiersForSectionsOrItems:1 reconfiguredOrReloaded:0];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)reconfiguredItemIdentifiers
{
  v2 = [(__UIDiffableDataSourceSnapshot *)self _identifiersForSectionsOrItems:0 reconfiguredOrReloaded:1];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (NSArray)reloadedItemIdentifiers
{
  v2 = [(__UIDiffableDataSourceSnapshot *)self _identifiersForSectionsOrItems:0 reconfiguredOrReloaded:0];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)reloadItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v4 action:2];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (void)appendItemsWithIdentifiers:(id)a3 intoSectionWithIdentifier:(id)a4
{
  state = self->_state;
  id v8 = a4;
  id v9 = a3;
  v10 = [(_UIDiffableDataSourceState *)state dataSourceSnapshot];
  uint64_t v11 = [v10 numberOfSections];

  if (v11 <= 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"__UIDiffableDataSourceSnapshot.m" lineNumber:169 description:@"There are currently no sections in the data source. Please add a section first."];
  }
  v13 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v9 appendingToDestinationSectionIdentifier:v8];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v13];
}

- (void)appendSectionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [[_UIDiffableDataSourceUpdate alloc] initWithSectionIdentifiers:v4 appendingToDestinationSectionIdentifier:0];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (void)_validateReloadUpdateThrowingIfNeeded:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([v5 action] != 2)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 366, @"Invalid parameter not satisfying: %@", @"update.action == _CVCCollectionUpdateActionReload" object file lineNumber description];
  }
  int v6 = [v5 isSectionOperation];
  id v7 = [v5 identifiers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0x263F08000uLL;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        state = self->_state;
        if (v6)
        {
          if ([(_UIDiffableDataSourceState *)state containsSectionIdentifier:v13]) {
            goto LABEL_14;
          }
          v15 = [*(id *)(v10 + 1680) currentHandler];
          int v16 = [v5 shouldReconfigure];
          v17 = @"reload";
          if (v16) {
            v17 = @"reconfigure";
          }
          uint64_t v23 = v13;
          v18 = a2;
          [v15 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 374, @"Attempted to %@ section identifier that does not exist in the snapshot: %@", v17, v23 object file lineNumber description];
        }
        else
        {
          if ([(_UIDiffableDataSourceState *)state containsItemIdentifier:v13]) {
            goto LABEL_14;
          }
          v15 = [*(id *)(v10 + 1680) currentHandler];
          int v19 = [v5 shouldReconfigure];
          v20 = @"reload";
          if (v19) {
            v20 = @"reconfigure";
          }
          uint64_t v24 = v13;
          v18 = a2;
          [v15 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 377, @"Attempted to %@ item identifier that does not exist in the snapshot: %@", v20, v24 object file lineNumber description];
        }

        unint64_t v10 = 0x263F08000;
        a2 = v18;
LABEL_14:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v21 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }
}

- (id)_identifiersForSectionsOrItems:(BOOL)a3 reconfiguredOrReloaded:(BOOL)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_pendingSnapshotUpdates;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSectionOperation", (void)v16) == v5
          && [v13 action] == 2
          && [v13 shouldReconfigure] == v4)
        {
          v14 = [v13 identifiers];
          [v7 unionOrderedSet:v14];
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (__UIDiffableDataSourceSnapshot)initWithState:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)__UIDiffableDataSourceSnapshot;
  int v5 = [(__UIDiffableDataSourceSnapshot *)&v11 init];
  if (v5)
  {
    int v6 = [[_UIDiffableDataSourceState alloc] initWithState:v4];
    state = v5->_state;
    v5->_state = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingSnapshotUpdates = v5->_pendingSnapshotUpdates;
    v5->_pendingSnapshotUpdates = v8;
  }
  return v5;
}

- (void)_commitUpdateAtomic:(id)a3
{
  id v5 = a3;
  pendingSnapshotUpdates = self->_pendingSnapshotUpdates;
  id v23 = v5;
  if (!pendingSnapshotUpdates)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 323, @"Invalid parameter not satisfying: %@", @"_pendingSnapshotUpdates" object file lineNumber description];

    id v5 = v23;
    pendingSnapshotUpdates = self->_pendingSnapshotUpdates;
  }
  [(NSMutableArray *)pendingSnapshotUpdates addObject:v5];
  uint64_t v7 = [v23 action];
  if (v7 == 2)
  {
    [(__UIDiffableDataSourceSnapshot *)self _validateReloadUpdateThrowingIfNeeded:v23];
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(_UIDiffableDataSourceState *)self->_state identifiers];
    uint64_t v10 = (void *)[v9 mutableCopy];

    objc_super v11 = [(_UIDiffableDataSourceState *)self->_state sections];
    uint64_t v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
    v14 = +[_UIDataSourceSnapshotter snapshotterForSnapshot:v13];

    switch(v8)
    {
      case 3:
        id v16 = _UIDiffableDataSourceApplyMoveUpdate(v23, v12, v10, v14, 0);
        break;
      case 1:
        id v17 = _UIDiffableDataSourceApplyDeleteUpdate(v23, v12, v10, v14, 0);
        break;
      case 0:
        id v15 = _UIDiffableDataSourceApplyInsertUpdate(v23, v12, v10, v14, 0);
        break;
    }
    long long v18 = [_UIDiffableDataSourceState alloc];
    long long v19 = [(_UIDiffableDataSourceState *)self->_state generationID];
    v20 = [(_UIDiffableDataSourceState *)v18 initWithGenerationID:v19 identifiers:v10 sections:v12 dataSourceSnapshot:v14];
    state = self->_state;
    self->_state = v20;
  }
}

- (__UIDiffableDataSourceSnapshot)init
{
  v3 = objc_alloc_init(_UIDiffableDataSourceState);
  id v4 = [(__UIDiffableDataSourceSnapshot *)self initWithState:v3];

  return v4;
}

- (void)_prepareForApplyToDataSource
{
}

- (int64_t)indexOfItemIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexOfItemIdentifier:a3];
}

- (id)sectionIdentifierForSectionContainingItemIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state sectionIdentifierForSectionContainingItemIdentifier:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (__UIDiffableDataSourceSnapshot *)a3;
  if (self == v4)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(__UIDiffableDataSourceSnapshot *)self numberOfItems];
      if (v6 == [(__UIDiffableDataSourceSnapshot *)v5 numberOfItems]
        && (int64_t v7 = [(__UIDiffableDataSourceSnapshot *)self numberOfSections],
            v7 == [(__UIDiffableDataSourceSnapshot *)v5 numberOfSections]))
      {
        uint64_t v8 = [(__UIDiffableDataSourceSnapshot *)self state];
        uint64_t v9 = [(__UIDiffableDataSourceSnapshot *)v5 state];
        uint64_t v10 = [v8 dataSourceSnapshot];
        objc_super v11 = [v9 dataSourceSnapshot];
        int v12 = [v10 isEqual:v11];

        if (v12
          && ([v8 sections],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              [v9 sections],
              v14 = objc_claimAutoreleasedReturnValue(),
              int v15 = [v13 isEqualToOrderedSet:v14],
              v14,
              v13,
              v15))
        {
          id v16 = [v8 identifiers];
          id v17 = [v9 identifiers];
          char v18 = [v16 isEqualToOrderedSet:v17];
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (int64_t)numberOfSections
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfSections];
}

- (int64_t)numberOfItems
{
  return [(_UIDiffableDataSourceState *)self->_state numberOfItems];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(__UIDiffableDataSourceSnapshot *)self state];
  int64_t v6 = (void *)[v4 initWithState:v5];

  if (v6)
  {
    uint64_t v7 = [(NSMutableArray *)self->_pendingSnapshotUpdates mutableCopy];
    uint64_t v8 = (void *)v6[2];
    v6[2] = v7;
  }
  return v6;
}

- (_UIDiffableDataSourceState)state
{
  return self->_state;
}

- (void)appendItemsWithIdentifiers:(id)a3
{
}

- (void)deleteItemsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v4 action:1];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v5];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(_UIDiffableDataSourceState *)self->_state dataSourceSnapshot];
  uint64_t v7 = [(_UIDiffableDataSourceState *)self->_state sections];
  uint64_t v8 = [(_UIDiffableDataSourceState *)self->_state identifiers];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: sectionCounts=%@; sections=[%p]; identifiers=[%p]>",
    v5,
    self,
    v6,
    v7,
  uint64_t v9 = v8);

  return (NSString *)v9;
}

- (void)insertItemsWithIdentifiers:(id)a3 beforeItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 175, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 176, @"Invalid parameter not satisfying: %@", @"destinationIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v8 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v11 action:0 destinationIdentifier:v7 relativePosition:0];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v8];
}

- (void)insertItemsWithIdentifiers:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 182, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 183, @"Invalid parameter not satisfying: %@", @"destinationIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v8 = [[_UIDiffableDataSourceUpdate alloc] initWithItemIdentifiers:v11 action:0 destinationIdentifier:v7 relativePosition:1];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v8];
}

- (void)deleteAllItems
{
  id v3 = +[_UIDiffableDataSourceUpdate updateDeleteAll];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v3];
}

- (void)moveItemWithIdentifier:(id)a3 beforeItemWithIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [_UIDiffableDataSourceUpdate alloc];
  v11[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  uint64_t v10 = [(_UIDiffableDataSourceUpdate *)v8 initWithItemIdentifiers:v9 action:3 destinationIdentifier:v6 relativePosition:0];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v10];
}

- (void)moveItemWithIdentifier:(id)a3 afterItemWithIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [_UIDiffableDataSourceUpdate alloc];
  v11[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  uint64_t v10 = [(_UIDiffableDataSourceUpdate *)v8 initWithItemIdentifiers:v9 action:3 destinationIdentifier:v6 relativePosition:1];
  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v10];
}

- (void)insertSectionsWithIdentifiers:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_UIDiffableDataSourceUpdate alloc] initWithSectionIdentifiers:v7 action:0 destinationIdentifier:v6 relativePosition:0];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v8];
}

- (void)insertSectionsWithIdentifiers:(id)a3 afterSectionWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_UIDiffableDataSourceUpdate alloc] initWithSectionIdentifiers:v7 action:0 destinationIdentifier:v6 relativePosition:1];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v8];
}

- (void)moveSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 241, @"Invalid parameter not satisfying: %@", @"fromSectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 242, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v12 = [(_UIDiffableDataSourceUpdate *)v10 initWithSectionIdentifiers:v11 action:3 destinationIdentifier:v9 relativePosition:0];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v12];
}

- (void)moveSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 248, @"Invalid parameter not satisfying: %@", @"fromSectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 249, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v12 = [(_UIDiffableDataSourceUpdate *)v10 initWithSectionIdentifiers:v11 action:3 destinationIdentifier:v9 relativePosition:1];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v12];
}

- (void)appendSectionWithIdentifier:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 263, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  id v6 = [_UIDiffableDataSourceUpdate alloc];
  v10[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v8 = [(_UIDiffableDataSourceUpdate *)v6 initWithSectionIdentifiers:v7 appendingToDestinationSectionIdentifier:0];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v8];
}

- (void)insertSectionWithIdentifier:(id)a3 beforeSectionWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 269, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 270, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v12 = [(_UIDiffableDataSourceUpdate *)v10 initWithSectionIdentifiers:v11 action:0 destinationIdentifier:v9 relativePosition:0];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v12];
}

- (void)insertSectionWithIdentifier:(id)a3 afterSectionWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 276, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"__UIDiffableDataSourceSnapshot.m", 277, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = [_UIDiffableDataSourceUpdate alloc];
  v15[0] = v7;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  int v12 = [(_UIDiffableDataSourceUpdate *)v10 initWithSectionIdentifiers:v11 action:0 destinationIdentifier:v9 relativePosition:1];

  [(__UIDiffableDataSourceSnapshot *)self _commitUpdateAtomic:v12];
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  return [(_UIDiffableDataSourceState *)self->_state sectionIdentifierForIndex:a3];
}

- (int64_t)indexForSectionIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexForSectionIdentifier:a3];
}

- (id)itemIdentifierForIndexPath:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state itemIdentifierForIndexPath:a3];
}

- (id)indexPathForItemIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state indexPathForItemIdentifier:a3];
}

- (BOOL)containsItemIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state containsItemIdentifier:a3];
}

- (BOOL)containsSectionIdentifier:(id)a3
{
  return [(_UIDiffableDataSourceState *)self->_state containsSectionIdentifier:a3];
}

@end