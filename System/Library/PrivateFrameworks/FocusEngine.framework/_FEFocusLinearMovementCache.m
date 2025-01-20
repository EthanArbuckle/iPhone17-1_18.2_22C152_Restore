@interface _FEFocusLinearMovementCache
- (_FEFocusLinearMovementCache)initWithFocusBehavior:(id)a3;
- (id)nextItemForRequest:(id)a3;
- (void)_invalidate;
- (void)_invalidateOnTimeout;
- (void)_updateParentEnvironmentIfNecessary;
- (void)environmentDidAppear:(id)a3;
- (void)environmentWillDisappear:(id)a3;
- (void)updateCacheWithContext:(id)a3;
@end

@implementation _FEFocusLinearMovementCache

- (_FEFocusLinearMovementCache)initWithFocusBehavior:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FEFocusLinearMovementCache;
  v5 = [(_FEFocusLinearMovementCache *)&v8 init];
  if (v5)
  {
    [v4 stabilizedLinearFocusMovementTimeout];
    v5->_cooldownThreshold = v6;
  }

  return v5;
}

- (void)_invalidate
{
  *(unsigned char *)&self->_flags |= 1u;
}

- (void)_invalidateOnTimeout
{
  if (self->_cooldownThreshold <= 0.0) {
    [(_FEFocusLinearMovementCache *)self _invalidate];
  }
  else {
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (id)nextItemForRequest:(id)a3
{
  id v4 = a3;
  linearItems = self->_linearItems;
  if (linearItems && [(NSArray *)linearItems count] && (*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0
      || CFAbsoluteTimeGetCurrent() - self->_lastUpdate <= self->_cooldownThreshold)
    {
      double v6 = [v4 focusedItemInfo];
      v7 = [v6 item];

      objc_super v8 = self->_linearItems;
      v9 = [v4 movementInfo];
      __int16 v10 = [v9 heading];
      v11 = [v4 movementInfo];
      v12 = _FEFocusGetNextItemFromList(v7, v8, v10, [v11 _isLooping]);

      goto LABEL_9;
    }
    [(_FEFocusLinearMovementCache *)self _invalidate];
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)updateCacheWithContext:(id)a3
{
  id v17 = a3;
  id v4 = [v17 _request];
  int v5 = [v4 isMovementRequest];

  if (!v5) {
    goto LABEL_13;
  }
  double v6 = [v17 _request];
  v7 = [v6 movementInfo];
  int v8 = [v7 _linearHeading];
  uint64_t v9 = ([v7 heading] | v8) & 0x330;

  if (v9)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    __int16 v10 = [v17 _focusMapSearchInfo];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 linearSortedFocusItems];

      if (v12)
      {
        if ([v11 hasOnlyStaticContent]) {
          char v13 = 0;
        }
        else {
          char v13 = 2;
        }
        *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | v13;
        v14 = [v11 linearSortedFocusItems];
        v15 = v14;
        if (!self->_linearItems || (objc_msgSend(v14, "isEqual:") & 1) == 0)
        {
          objc_storeStrong((id *)&self->_linearItems, v15);
          parentEnvironments = self->_parentEnvironments;
          self->_parentEnvironments = 0;
        }
      }
    }
  }
  else
  {
LABEL_13:
    [(_FEFocusLinearMovementCache *)self _invalidate];
  }
}

- (void)_updateParentEnvironmentIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_parentEnvironments)
  {
    v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    parentEnvironments = self->_parentEnvironments;
    self->_parentEnvironments = v3;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = self->_linearItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v13 + 1) + 8 * v9);
          if (v10)
          {
            v11 = v10;
            do
            {
              if (-[NSHashTable containsObject:](self->_parentEnvironments, "containsObject:", v11, (void)v13)) {
                break;
              }
              [(NSHashTable *)self->_parentEnvironments addObject:v11];
              uint64_t v12 = [v11 _parentFocusEnvironment];

              v11 = (void *)v12;
            }
            while (v12);
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
}

- (void)environmentWillDisappear:(id)a3
{
  id v4 = a3;
  [(_FEFocusLinearMovementCache *)self _updateParentEnvironmentIfNecessary];
  BOOL v5 = [(NSHashTable *)self->_parentEnvironments containsObject:v4];

  if (v5)
  {
    [(_FEFocusLinearMovementCache *)self _invalidate];
    linearItems = self->_linearItems;
    self->_linearItems = 0;
  }
}

- (void)environmentDidAppear:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[_FEFocusSystem focusSystemForEnvironment:v4];
  if (![v5 _isEnvironmentLocked:v4])
  {
    uint64_t v6 = _FEFocusItemSafeCast(v4);
    uint64_t v7 = v6;
    if (v6 && _FEFocusItemIsFocusedOrFocusable(v6))
    {
      [(_FEFocusLinearMovementCache *)self _invalidateOnTimeout];
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v8 = [v4 _parentFocusEnvironment];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      do
      {
        id v10 = _FEFocusItemSafeCast(v9);
        v11 = v10;
        if (v10) {
          int IsFocusedOrFocusable = _FEFocusItemIsFocusedOrFocusable(v10);
        }
        else {
          int IsFocusedOrFocusable = 0;
        }
        long long v13 = [v9 _parentFocusEnvironment];

        if (!v13) {
          break;
        }
        uint64_t v9 = v13;
      }
      while (!IsFocusedOrFocusable);
      if (IsFocusedOrFocusable) {
        goto LABEL_28;
      }
      if (v7)
      {
LABEL_15:
        long long v14 = _UIParentCoordinateSpaceForFocusItem(v7);
        [v7 _focusFrame];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v23 = self->_linearItems;
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v29 != v26) {
                objc_enumerationMutation(v23);
              }
              v34.origin.x = _FEFocusItemFrameInCoordinateSpace(*(void **)(*((void *)&v28 + 1) + 8 * i), v14);
              v35.origin.x = v16;
              v35.origin.y = v18;
              v35.size.width = v20;
              v35.size.height = v22;
              if (CGRectContainsRect(v34, v35))
              {

                [(_FEFocusLinearMovementCache *)self _invalidateOnTimeout];
                goto LABEL_27;
              }
            }
            uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {
      long long v13 = 0;
      if (v7) {
        goto LABEL_15;
      }
    }
    [(_FEFocusLinearMovementCache *)self _invalidateOnTimeout];
LABEL_28:

    goto LABEL_29;
  }
  [(_FEFocusLinearMovementCache *)self _invalidateOnTimeout];
LABEL_30:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentEnvironments, 0);
  objc_storeStrong((id *)&self->_linearItems, 0);
}

@end