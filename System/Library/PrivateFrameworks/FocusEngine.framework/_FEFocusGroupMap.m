@interface _FEFocusGroupMap
- (NSArray)focusGroups;
- (NSArray)focusItems;
- (_FECoordinateSpace)coordinateSpace;
- (_FEFocusGroupMap)initWithItems:(id)a3 coordinateSpace:(id)a4;
- (_FEFocusGroupMap)initWithItems:(id)a3 standInItemsMap:(id)a4 coordinateSpace:(id)a5;
- (id)_indexEnvironment:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)focusGroupForItem:(id)a3;
- (id)visualDescription;
- (void)_indexItems:(id)a3;
@end

@implementation _FEFocusGroupMap

- (_FEFocusGroupMap)initWithItems:(id)a3 coordinateSpace:(id)a4
{
  return [(_FEFocusGroupMap *)self initWithItems:a3 standInItemsMap:0 coordinateSpace:a4];
}

- (_FEFocusGroupMap)initWithItems:(id)a3 standInItemsMap:(id)a4 coordinateSpace:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"_FEFocusGroupMap.m", 40, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"_FEFocusGroupMap.m", 41, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_FEFocusGroupMap;
  v13 = [(_FEFocusGroupMap *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_coordinateSpace, a5);
    uint64_t v15 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    environmentToGroupMap = v14->_environmentToGroupMap;
    v14->_environmentToGroupMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    identifierToGroupMap = v14->_identifierToGroupMap;
    v14->_identifierToGroupMap = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    identifierToPrimaryItemMap = v14->_identifierToPrimaryItemMap;
    v14->_identifierToPrimaryItemMap = (NSMapTable *)v19;

    uint64_t v21 = +[_FEFocusGroup nullGroupWithCoordinateSpace:v12];
    nullGroup = v14->_nullGroup;
    v14->_nullGroup = (_FEFocusGroup *)v21;

    objc_storeStrong((id *)&v14->_standInItemsMap, a4);
    [(_FEFocusGroupMap *)v14 _indexItems:v9];
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 56), self->_coordinateSpace);
  uint64_t v5 = +[_FEFocusGroup nullGroupWithCoordinateSpace:self->_coordinateSpace];
  v6 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v5;

  uint64_t v7 = [(NSMapTable *)self->_standInItemsMap copy];
  v8 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v7;

  uint64_t v9 = [(NSMapTable *)self->_identifierToPrimaryItemMap copy];
  id v10 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v9;

  id v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  v12 = [(NSMapTable *)self->_identifierToGroupMap keyEnumerator];
  uint64_t v13 = [v12 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      uint64_t v15 = [(NSMapTable *)self->_identifierToGroupMap objectForKey:v14];
      id v16 = (id)[v15 _deepCopyWithNewIdentifierToGroupMap:v11];

      uint64_t v17 = [v12 nextObject];

      v14 = (void *)v17;
    }
    while (v17);
  }

  objc_storeStrong((id *)(v4 + 16), v11);
  v18 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v19 = [(NSMapTable *)self->_environmentToGroupMap keyEnumerator];
  uint64_t v20 = [v19 nextObject];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    do
    {
      v22 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v21];
      v23 = [v22 identifier];
      v24 = [v11 objectForKey:v23];

      [v18 setObject:v24 forKey:v21];
      uint64_t v25 = [v19 nextObject];

      uint64_t v21 = (void *)v25;
    }
    while (v25);
  }

  objc_super v26 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v18;

  return (id)v4;
}

- (void)_indexItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        if (!v7)
        {
          uint64_t v7 = +[_FEFocusSystem focusSystemForEnvironment:*(void *)(*((void *)&v17 + 1) + 8 * v9)];
        }
        id v11 = +[_FEFocusSystem focusSystemForEnvironment:v10];

        if (v7 != v11)
        {
          v14 = logger();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)id v16 = 0;
            _os_log_fault_impl(&dword_24F3F0000, v14, OS_LOG_TYPE_FAULT, "Indexing focus items of different focus systems in a single focus group map is unsupported and leads to undefined behavior. This is a UIKit bug.", v16, 2u);
          }
        }
        v12 = [(_FEFocusGroupMap *)self _indexEnvironment:v10];
        uint64_t v13 = [(NSMapTable *)self->_standInItemsMap objectForKey:v10];

        if (!v13) {
          [v12 _insertItem:v10];
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v15 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v15;
    }
    while (v15);
  }
  else
  {
    uint64_t v7 = 0;
  }
}

- (id)_indexEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_FEFocusGroupMap.m", 125, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  if (self->_focusGroups)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"_FEFocusGroupMap.m" lineNumber:126 description:@"This map has already calculated its focus groups. Later changes in this map are not allowed. This is a UIKit bug."];
  }
  uint64_t v6 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v5];
  if (!v6)
  {
    unsigned __int8 v7 = objc_msgSend(v5, sel_allowsWeakReference);
    if (!v5 || (v7 & 1) == 0)
    {
      uint64_t v6 = self->_nullGroup;
      goto LABEL_24;
    }
    uint64_t v8 = _FEFocusGroupUnresolvedIdentifierForEnvironment(v5);
    if (v8)
    {
      uint64_t v9 = [(NSMapTable *)self->_identifierToGroupMap objectForKey:v8];
      if (v9)
      {
        uint64_t v10 = (_FEFocusGroup *)v9;
        [(NSMapTable *)self->_environmentToGroupMap setObject:v9 forKey:v5];
LABEL_23:
        [(_FEFocusGroup *)v10 _updateWithEnvironment:v5];
        uint64_t v6 = v10;

        goto LABEL_24;
      }
    }
    id v11 = [v5 _parentFocusEnvironment];
    if (!v11)
    {
      if (!v8)
      {
        uint64_t v10 = self->_nullGroup;
        goto LABEL_22;
      }
      id v16 = [_FEFocusGroup alloc];
      v12 = [(_FEFocusGroupMap *)self coordinateSpace];
      uint64_t v15 = [(_FEFocusGroup *)v16 initWithIdentifier:v8 parentGroup:0 coordinateSpace:v12];
      goto LABEL_19;
    }
    v12 = [(_FEFocusGroupMap *)self _indexEnvironment:v11];
    if (v12)
    {
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      v24 = [MEMORY[0x263F08690] currentHandler];
      [v24 handleFailureInMethod:a2 object:self file:@"_FEFocusGroupMap.m" lineNumber:166 description:@"Found a parent environment but could not create a parent group. This is a UIKit bug."];

      if (v8)
      {
LABEL_15:
        uint64_t v13 = [v12 identifier];
        int v14 = [v8 isEqualToString:v13];

        if (!v14)
        {
          long long v17 = [_FEFocusGroup alloc];
          long long v18 = [(_FEFocusGroupMap *)self coordinateSpace];
          uint64_t v10 = [(_FEFocusGroup *)v17 initWithIdentifier:v8 parentGroup:v12 coordinateSpace:v18];

          goto LABEL_21;
        }
      }
    }
    uint64_t v15 = v12;
LABEL_19:
    uint64_t v10 = v15;
LABEL_21:

LABEL_22:
    [(NSMapTable *)self->_environmentToGroupMap setObject:v10 forKey:v5];
    identifierToGroupMap = self->_identifierToGroupMap;
    long long v20 = [(_FEFocusGroup *)v10 identifier];
    [(NSMapTable *)identifierToGroupMap setObject:v10 forKey:v20];

    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

- (NSArray)focusGroups
{
  focusGroups = self->_focusGroups;
  if (!focusGroups)
  {
    id v4 = objc_opt_new();
    __addChildFocusGroupsRecursively(self->_nullGroup, v4);
    id v5 = (NSArray *)[v4 copy];
    uint64_t v6 = self->_focusGroups;
    self->_focusGroups = v5;

    focusGroups = self->_focusGroups;
  }
  return focusGroups;
}

- (NSArray)focusItems
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(_FEFocusGroupMap *)self focusGroups];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "primaryItem", (void)v14);
        if (!v10)
        {
          id v11 = [v9 items];
          uint64_t v10 = [v11 firstObject];

          if (!v10) {
            continue;
          }
        }
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return (NSArray *)v12;
}

- (id)focusGroupForItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_FEFocusGroupMap.m", 227, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  uint64_t v6 = [(NSMapTable *)self->_environmentToGroupMap objectForKey:v5];

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(_FEFocusGroupMap *)self focusGroups];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p; focusGroups: %@>", v5, self, v6];

  return v7;
}

- (id)visualDescription
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(_FEFocusGroupMap *)self focusGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)MEMORY[0x263F08D40];
        [*(id *)(*((void *)&v12 + 1) + 8 * v8) boundingBox];
        uint64_t v10 = objc_msgSend(v9, "valueWithCGRect:");
        [v3 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return @"Visual description unavailable";
}

- (_FECoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_focusGroups, 0);
  objc_storeStrong((id *)&self->_standInItemsMap, 0);
  objc_storeStrong((id *)&self->_nullGroup, 0);
  objc_storeStrong((id *)&self->_identifierToPrimaryItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToGroupMap, 0);
  objc_storeStrong((id *)&self->_environmentToGroupMap, 0);
}

@end