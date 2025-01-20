@interface _FEFocusGroup
+ (id)nullGroupWithCoordinateSpace:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFocusGroup:(id)a3;
- (CGRect)boundingBox;
- (CGRect)primaryRect;
- (NSArray)childGroups;
- (NSArray)items;
- (NSString)identifier;
- (_FECoordinateSpace)coordinateSpace;
- (_FEFocusEnvironment)owningEnvironment;
- (_FEFocusGroup)initWithIdentifier:(id)a3 parentGroup:(id)a4 coordinateSpace:(id)a5;
- (_FEFocusGroup)parentGroup;
- (_FEFocusItem)primaryItem;
- (id)_deepCopyWithNewIdentifierToGroupMap:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)_insertChildGroup:(id)a3;
- (void)_insertItem:(id)a3;
- (void)_invalidateChildGroupOrder;
- (void)_invalidateItemOrder;
- (void)_invalidatePrimaryItem;
- (void)_invalidatePrimaryRect;
- (void)_updateWithEnvironment:(id)a3;
- (void)_validateChildGroupOrderIfNecessary;
- (void)_validateItemOrderIfNecessary;
- (void)_validatePrimaryItemIfNecessary;
- (void)_validatePrimaryRectIfNeccessary;
@end

@implementation _FEFocusGroup

+ (id)nullGroupWithCoordinateSpace:(id)a3
{
  id v3 = a3;
  v4 = [(_FEFocusGroup *)[_FEFocusNullGroup alloc] initWithIdentifier:@"com.apple.UIKit.null" parentGroup:0 coordinateSpace:v3];

  return v4;
}

- (_FEFocusGroup)initWithIdentifier:(id)a3 parentGroup:(id)a4 coordinateSpace:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && [v9 length])
  {
    if (v11) {
      goto LABEL_4;
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_FEFocusGroup.m", 52, @"Invalid parameter not satisfying: %@", @"identifier && identifier.length > 0" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
  }
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"_FEFocusGroup.m", 53, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_FEFocusGroup;
  v12 = [(_FEFocusGroup *)&v24 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    v14 = (void *)*((void *)v12 + 5);
    *((void *)v12 + 5) = v13;

    uint64_t v15 = objc_opt_new();
    v16 = (void *)*((void *)v12 + 2);
    *((void *)v12 + 2) = v15;

    uint64_t v17 = objc_opt_new();
    v18 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = v17;

    objc_storeStrong((id *)v12 + 7, a5);
    long long v19 = *MEMORY[0x263F001A0];
    long long v20 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    *(_OWORD *)(v12 + 104) = *MEMORY[0x263F001A0];
    *(_OWORD *)(v12 + 120) = v20;
    *(_OWORD *)(v12 + 72) = v19;
    *(_OWORD *)(v12 + 88) = v20;
    objc_storeWeak((id *)v12 + 6, v10);
    [v10 _insertChildGroup:v12];
  }

  return (_FEFocusGroup *)v12;
}

- (id)_deepCopyWithNewIdentifierToGroupMap:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  }
  v5 = [(_FEFocusGroup *)self identifier];
  uint64_t v6 = [v4 objectForKey:v5];
  if (!v6)
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    v8 = [(_FEFocusGroup *)self coordinateSpace];
    uint64_t v6 = [v7 initWithIdentifier:v5 parentGroup:0 coordinateSpace:v8];

    uint64_t v9 = [(NSMutableArray *)self->_items mutableCopy];
    id v10 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v9;

    CGPoint origin = self->_boundingBox.origin;
    *(CGSize *)(v6 + 120) = self->_boundingBox.size;
    *(CGPoint *)(v6 + 104) = origin;
    objc_storeStrong((id *)(v6 + 32), self->_primaryItem);
    *($546F5FAF285445718FA5F4302CBDC21D *)(v6 + 8) = self->_flags;
    [v4 setObject:v6 forKey:v5];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(_FEFocusGroup *)self childGroups];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) _deepCopyWithNewIdentifierToGroupMap:v4];
          objc_storeWeak(v17 + 6, (id)v6);
          [(id)v6 _insertChildGroup:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  return (id)v6;
}

- (void)_insertChildGroup:(id)a3
{
  [(NSMutableArray *)self->_childGroups addObject:a3];
  [(_FEFocusGroup *)self _invalidateChildGroupOrder];
}

- (void)_insertItem:(id)a3
{
  [(NSMutableArray *)self->_items addObject:a3];
  [(_FEFocusGroup *)self _invalidateItemOrder];
}

- (void)_updateWithEnvironment:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!self->_owningEnvironment)
  {
    objc_storeStrong((id *)&self->_owningEnvironment, a3);
    id v5 = v11;
  }
  uint64_t v6 = _FEFocusItemSafeCast(v5);
  id v7 = v6;
  if (v6)
  {
    v13.origin.x = _FEFocusItemFrameInCoordinateSpace(v6, self->_coordinateSpace);
    v13.origin.y = v8;
    v13.size.width = v9;
    v13.size.height = v10;
    self->_boundingBox = CGRectUnion(self->_boundingBox, v13);
  }
}

- (NSArray)childGroups
{
  [(_FEFocusGroup *)self _validateChildGroupOrderIfNecessary];
  id v3 = (void *)[(NSMutableArray *)self->_childGroups copy];
  return (NSArray *)v3;
}

- (NSArray)items
{
  [(_FEFocusGroup *)self _validateItemOrderIfNecessary];
  id v3 = (void *)[(NSMutableArray *)self->_items copy];
  return (NSArray *)v3;
}

- (_FEFocusItem)primaryItem
{
  [(_FEFocusGroup *)self _validatePrimaryItemIfNecessary];
  primaryItem = self->_primaryItem;
  return primaryItem;
}

- (CGRect)primaryRect
{
  [(_FEFocusGroup *)self _validatePrimaryRectIfNeccessary];
  double x = self->_primaryRect.origin.x;
  double y = self->_primaryRect.origin.y;
  double width = self->_primaryRect.size.width;
  double height = self->_primaryRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_invalidateItemOrder
{
  *(unsigned char *)&self->_flags &= ~1u;
  [(_FEFocusGroup *)self _invalidatePrimaryItem];
}

- (void)_validateItemOrderIfNecessary
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    if ([(NSMutableArray *)self->_items count])
    {
      items = self->_items;
      [(NSMutableArray *)items sortUsingComparator:&__block_literal_global_4];
    }
  }
}

- (void)_invalidateChildGroupOrder
{
  *(unsigned char *)&self->_flags &= ~2u;
  [(_FEFocusGroup *)self _invalidatePrimaryRect];
}

- (void)_validateChildGroupOrderIfNecessary
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    *(unsigned char *)&self->_flags |= 2u;
    if ([(NSMutableArray *)self->_childGroups count])
    {
      childGroups = self->_childGroups;
      [(NSMutableArray *)childGroups sortUsingComparator:&__block_literal_global_19];
    }
  }
}

- (void)_invalidatePrimaryItem
{
  *(unsigned char *)&self->_flags &= ~4u;
  [(_FEFocusGroup *)self _invalidatePrimaryRect];
}

- (void)_validatePrimaryItemIfNecessary
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    *(unsigned char *)&self->_flags |= 4u;
    if ([(NSMutableArray *)self->_items count])
    {
      id v3 = [(NSMutableArray *)self->_items firstObject];
      id v4 = +[_FEFocusSystem focusSystemForEnvironment:v3];

      id v5 = [v4 focusedItem];
      long long v22 = v4;
      uint64_t v6 = [v4 _focusGroupHistory];
      id v7 = [(_FEFocusGroup *)self identifier];
      CGFloat v8 = [v6 lastFocusedItemForGroupIdentifier:v7];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v23 = self;
      CGFloat v9 = [(_FEFocusGroup *)self items];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v9);
            }
            v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v17 = _FEFocusGroupPriorityForItem(v16, v5, v8);
            if (v17 > v13)
            {
              uint64_t v18 = v17;
              id v19 = v16;

              v12 = v19;
              uint64_t v13 = v18;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      primaryItem = v23->_primaryItem;
      v23->_primaryItem = (_FEFocusItem *)v12;
    }
    else
    {
      long long v20 = self->_primaryItem;
      self->_primaryItem = 0;
    }
  }
}

- (void)_invalidatePrimaryRect
{
  *(unsigned char *)&self->_flags &= ~8u;
}

- (void)_validatePrimaryRectIfNeccessary
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return;
  }
  *(unsigned char *)&self->_flags |= 8u;
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_primaryRect.CGPoint origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_primaryRect.CGSize size = v3;
  [(_FEFocusGroup *)self _validatePrimaryItemIfNecessary];
  id v4 = self->_primaryItem;
  if (!v4)
  {
    [(_FEFocusGroup *)self _validateItemOrderIfNecessary];
    id v4 = [(NSMutableArray *)self->_items firstObject];
    if (!v4)
    {
      uint64_t v29 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v29 = v4;
  id v5 = [(_FEFocusGroup *)self coordinateSpace];
  double v6 = _FEFocusItemFrameInCoordinateSpace(v29, v5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v31.origin.double x = v6;
  v31.origin.double y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  if (CGRectIsNull(v31))
  {
LABEL_8:
    [(_FEFocusGroup *)self _validateChildGroupOrderIfNecessary];
    uint64_t v13 = [(NSMutableArray *)self->_childGroups firstObject];
    if (v13)
    {
      uint64_t v14 = [(_FEFocusGroup *)self coordinateSpace];
      [v13 primaryRect];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      v23 = [v13 coordinateSpace];
      objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
      self->_primaryRect.origin.double x = v24;
      self->_primaryRect.origin.double y = v25;
      self->_primaryRect.size.double width = v26;
      self->_primaryRect.size.double height = v27;
    }
    else
    {
      CGSize size = self->_boundingBox.size;
      self->_primaryRect.CGPoint origin = self->_boundingBox.origin;
      self->_primaryRect.CGSize size = size;
    }

    goto LABEL_12;
  }
  self->_primaryRect.origin.double x = v6;
  self->_primaryRect.origin.double y = v8;
  self->_primaryRect.size.double width = v10;
  self->_primaryRect.size.double height = v12;
LABEL_12:
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_FEFocusGroup *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_FEFocusGroup *)self isEqualToFocusGroup:v5];

  return v6;
}

- (BOOL)isEqualToFocusGroup:(id)a3
{
  return [(NSString *)self->_identifier isEqual:*((void *)a3 + 5)];
}

- (id)description
{
  CGSize v3 = NSString;
  identifier = self->_identifier;
  id v5 = _FEStringFromCGRect(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  BOOL v6 = _FEStringFromCGRect(self->_primaryRect.origin.x, self->_primaryRect.origin.y, self->_primaryRect.size.width, self->_primaryRect.size.height);
  double v7 = [v3 stringWithFormat:@"<%@; boundingBox: %@; primaryRect: %@>", identifier, v5, v6];

  return v7;
}

- (id)debugDescription
{
  CGSize v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  identifier = self->_identifier;
  double v7 = _FEStringFromCGRect(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  CGFloat v8 = _FEStringFromCGRect(self->_primaryRect.origin.x, self->_primaryRect.origin.y, self->_primaryRect.size.width, self->_primaryRect.size.height);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: %@; boundingBox: %@; primaryRect: %@; items: %@>",
    v5,
    self,
    identifier,
    v7,
    v8,
  double v9 = self->_items);

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_FEFocusGroup)parentGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentGroup);
  return (_FEFocusGroup *)WeakRetained;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_FECoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (_FEFocusEnvironment)owningEnvironment
{
  return self->_owningEnvironment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningEnvironment, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_parentGroup);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_primaryItem, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_childGroups, 0);
}

@end