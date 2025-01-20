@interface GEOComposedRouteAnchorPointList
+ (BOOL)supportsSecureCoding;
+ (GEOComposedRouteAnchorPointList)listWithAnchorPoints:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOutAndBackAllowed;
- (BOOL)startAndEndAreTheSame;
- (BOOL)updateWithRoute:(id *)a1;
- (GEOComposedRouteAnchorPoint)firstObject;
- (GEOComposedRouteAnchorPoint)lastObject;
- (GEOComposedRouteAnchorPointList)init;
- (GEOComposedRouteAnchorPointList)initWithAnchorPoints:(id)a3;
- (GEOComposedRouteAnchorPointList)initWithCoder:(id)a3;
- (NSArray)anchorPoints;
- (id)_elementsCopy;
- (id)_existingConjunctElementAtAnchorPointPosition:(id)a3;
- (id)_isolatedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nextAnchorPointAfter:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfAnchorPoint:(id)a3;
- (unint64_t)nextAnchorPointIndexAfter:(id)a3;
- (void)_eraseSequentialDuplicateAnchors;
- (void)_removeElementAtIndex:(unint64_t)a3;
- (void)_removeFirstAnchorSharingPositionWith:(id)a3 enumerationOptions:(unint64_t)a4;
- (void)appendAnchorPoint:(id)a3;
- (void)appendAnchorPoints:(id)a3;
- (void)closeLoop;
- (void)createOutAndBack;
- (void)encodeWithCoder:(id)a3;
- (void)removeAnchorPointAtIndex:(unint64_t)a3;
- (void)removeAnchorPointWithID:(id)a3;
- (void)removeFirstAnchorSharingPositionWith:(id)a3;
- (void)removeLastAnchorSharingPositionWith:(id)a3;
- (void)reverse;
@end

@implementation GEOComposedRouteAnchorPointList

- (GEOComposedRouteAnchorPointList)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedRouteAnchorPointList;
  v2 = [(GEOComposedRouteAnchorPointList *)&v9 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    anchorPointsIsolater = v2->_anchorPointsIsolater;
    v2->_anchorPointsIsolater = (geo_isolater *)v3;

    uint64_t v5 = objc_opt_new();
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (GEOComposedRouteAnchorPointList)initWithAnchorPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOComposedRouteAnchorPointList *)self init];
  v6 = v5;
  if (v5)
  {
    [(GEOComposedRouteAnchorPointList *)v5 appendAnchorPoints:v4];
    v7 = v6;
  }

  return v6;
}

+ (GEOComposedRouteAnchorPointList)listWithAnchorPoints:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithAnchorPoints:v4];

  return (GEOComposedRouteAnchorPointList *)v5;
}

- (NSArray)anchorPoints
{
  return (NSArray *)[(NSMutableArray *)self->_elements _geo_map:&__block_literal_global_79];
}

id __47__GEOComposedRouteAnchorPointList_anchorPoints__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 8);
  }
  else {
    return 0;
  }
}

- (BOOL)startAndEndAreTheSame
{
  v7 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ([(NSMutableArray *)self->_elements count])
  {
    if ((unint64_t)[(NSMutableArray *)self->_elements count] < 2)
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v3 = [(NSMutableArray *)self->_elements firstObject];
      id v4 = [(NSMutableArray *)self->_elements lastObject];
      char v5 = [v3 isInConjunctionWith:v4];
    }
  }
  else
  {
    char v5 = 0;
  }
  _geo_isolate_unlock();

  return v5;
}

- (BOOL)isOutAndBackAllowed
{
  objc_super v9 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)[(NSMutableArray *)self->_elements count] >= 2)
  {
    uint64_t v4 = [(NSMutableArray *)self->_elements lastObject];
    char v5 = (void *)v4;
    if (v4) {
      v6 = *(void **)(v4 + 24);
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    BOOL v3 = (unint64_t)[v7 count] < 2;
  }
  else
  {
    BOOL v3 = 0;
  }
  _geo_isolate_unlock();

  return v3;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_elements count];
}

- (GEOComposedRouteAnchorPoint)firstObject
{
  v2 = [(NSMutableArray *)self->_elements firstObject];
  BOOL v3 = v2;
  if (v2) {
    v2 = (void *)v2[1];
  }
  uint64_t v4 = v2;

  return v4;
}

- (GEOComposedRouteAnchorPoint)lastObject
{
  v2 = [(NSMutableArray *)self->_elements lastObject];
  BOOL v3 = v2;
  if (v2) {
    v2 = (void *)v2[1];
  }
  uint64_t v4 = v2;

  return v4;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  BOOL v3 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:a3];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v3 = (void *)v3[1];
  }
  char v5 = v3;

  return v5;
}

- (unint64_t)nextAnchorPointIndexAfter:(id)a3
{
  float var1 = a3.var1;
  if (a3.var1 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int var0 = a3.var0;
  if (![(NSMutableArray *)self->_elements count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = [(NSMutableArray *)self->_elements count] - 1;
  uint64_t v7 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:v6];
  v8 = (void *)v7;
  if (v7) {
    objc_super v9 = *(void **)(v7 + 8);
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 routeCoordinate];
  if (var0 != v11)
  {
    if (var0 >= v11) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }
  if (var1 < *((float *)&v11 + 1))
  {
LABEL_9:
    if (v6 < 2) {
      goto LABEL_24;
    }
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:(v6 + v12) >> 1];
      v14 = (void *)v13;
      if (v13) {
        v15 = *(void **)(v13 + 8);
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      uint64_t v17 = [v16 routeCoordinate];
      if (var0 == v17)
      {
        if (var1 != *((float *)&v17 + 1) && var1 < *((float *)&v17 + 1))
        {
LABEL_20:
          unint64_t v6 = (v6 + v12) >> 1;
          goto LABEL_21;
        }
      }
      else if (var0 < v17)
      {
        goto LABEL_20;
      }
      unint64_t v12 = (v6 + v12) >> 1;
LABEL_21:
      if (v12 + 1 >= v6) {
        goto LABEL_24;
      }
    }
  }
LABEL_7:
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  return v6;
}

- (id)nextAnchorPointAfter:(id)a3
{
  unint64_t v4 = [(GEOComposedRouteAnchorPointList *)self nextAnchorPointIndexAfter:a3];
  if (v4 >= [(NSMutableArray *)self->_elements count])
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:v4];
    unint64_t v6 = (void *)v5;
    if (v5) {
      uint64_t v7 = *(void **)(v5 + 8);
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
  }

  return v8;
}

- (void)appendAnchorPoint:(id)a3
{
  id v4 = a3;
  unint64_t v6 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  uint64_t v5 = [[_GEOAnchorPointListElement alloc] initWithAnchorPoint:v4];
  [(NSMutableArray *)self->_elements addObject:v5];

  _geo_isolate_unlock();
}

- (void)appendAnchorPoints:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = -[GEOComposedRouteAnchorPointList _existingConjunctElementAtAnchorPointPosition:](self, "_existingConjunctElementAtAnchorPointPosition:", v9, (void)v14);
        uint64_t v11 = v10;
        if (v10)
        {
          unint64_t v12 = [v10 duplicateWithExistingAnchorPoint:v9];
        }
        else
        {
          unint64_t v12 = [[_GEOAnchorPointListElement alloc] initWithAnchorPoint:v9];
        }
        uint64_t v13 = v12;
        [(NSMutableArray *)self->_elements addObject:v12];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  _geo_isolate_unlock();
}

- (unint64_t)indexOfAnchorPoint:(id)a3
{
  id v4 = a3;
  id v10 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    elements = self->_elements;
    if (elements)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __54__GEOComposedRouteAnchorPointList_indexOfAnchorPoint___block_invoke;
      v8[3] = &unk_1E53E1DC0;
      id v9 = v4;
      unint64_t v5 = [(NSMutableArray *)elements indexOfObjectPassingTest:v8];
    }
  }
  _geo_isolate_unlock();

  return v5;
}

uint64_t __54__GEOComposedRouteAnchorPointList_indexOfAnchorPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 8);
  }
  else {
    v2 = 0;
  }
  return [v2 isEqual:*(void *)(a1 + 32)];
}

- (void)removeAnchorPointAtIndex:(unint64_t)a3
{
  unint64_t v5 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  [(GEOComposedRouteAnchorPointList *)self _removeElementAtIndex:a3];
  [(GEOComposedRouteAnchorPointList *)self _eraseSequentialDuplicateAnchors];
  _geo_isolate_unlock();
}

- (void)removeAnchorPointWithID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  elements = self->_elements;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__GEOComposedRouteAnchorPointList_removeAnchorPointWithID___block_invoke;
  uint64_t v11 = &unk_1E53E1DC0;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)elements indexOfObjectPassingTest:&v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOComposedRouteAnchorPointList _removeElementAtIndex:](self, "_removeElementAtIndex:", v7, v8, v9, v10, v11);
    [(GEOComposedRouteAnchorPointList *)self _eraseSequentialDuplicateAnchors];
  }

  _geo_isolate_unlock();
}

uint64_t __59__GEOComposedRouteAnchorPointList_removeAnchorPointWithID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2) {
    id v6 = *(void **)(a2 + 8);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v7 uniqueID];
  uint64_t v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if (v9) {
    *a4 = 1;
  }
  return v9;
}

- (void)removeFirstAnchorSharingPositionWith:(id)a3
{
}

- (void)removeLastAnchorSharingPositionWith:(id)a3
{
}

- (void)reverse
{
  uint64_t v8 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  BOOL v3 = [(GEOComposedRouteAnchorPointList *)self _elementsCopy];
  id v4 = [v3 reverseObjectEnumerator];
  unint64_t v5 = [v4 allObjects];
  id v6 = (NSMutableArray *)[v5 mutableCopy];

  elements = self->_elements;
  self->_elements = v6;

  _geo_isolate_unlock();
}

- (void)createOutAndBack
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v27 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)[(NSMutableArray *)self->_elements count] > 1)
  {
    uint64_t v4 = [(NSMutableArray *)self->_elements count];
    unint64_t v5 = [(NSMutableArray *)self->_elements reverseObjectEnumerator];
    id v6 = [v5 allObjects];
    id v7 = objc_msgSend(v6, "subarrayWithRange:", 1, v4 - 1);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v3 = v7;
    uint64_t v8 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v10), "duplicateWithExistingAnchorPoint:", 0, (void)v23);
          [(NSMutableArray *)self->_elements addObject:v11];
          if (v11) {
            id v12 = (void *)v11[3];
          }
          else {
            id v12 = 0;
          }
          id v13 = v12;
          BOOL v14 = (unint64_t)[v13 count] < 3;

          if (!v14)
          {
            if (v11) {
              long long v16 = (void *)v11[1];
            }
            else {
              long long v16 = 0;
            }
            id v17 = v16;
            [v17 locationCoordinate];
            uint64_t v19 = v18;
            uint64_t v21 = v20;

            v22 = GEOGetGEOComposedRouteAnchorPointListLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v29 = v19;
              __int16 v30 = 2048;
              uint64_t v31 = v21;
              _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_INFO, "End of a previous loop or outAndBack was found at %f, %f. Stopping outAndBack here.", buf, 0x16u);
            }

            goto LABEL_22;
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
        uint64_t v8 = v15;
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    BOOL v3 = GEOGetGEOComposedRouteAnchorPointListLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Must have at least two anchor points to create out and back route.", buf, 2u);
    }
  }

  _geo_isolate_unlock();
}

- (void)closeLoop
{
  id v7 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  if ((unint64_t)[(NSMutableArray *)self->_elements count] > 1)
  {
    uint64_t v4 = [(NSMutableArray *)self->_elements firstObject];
    unint64_t v5 = [v4 duplicateWithExistingAnchorPoint:0];
    [(NSMutableArray *)self->_elements addObject:v5];
  }
  else
  {
    BOOL v3 = GEOGetGEOComposedRouteAnchorPointListLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_ERROR, "Must have at least two anchor points to close loop.", v6, 2u);
    }
  }
  _geo_isolate_unlock();
}

- (id)_existingConjunctElementAtAnchorPointPosition:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [a3 locationCoordinate];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = self->_elements;
  uint64_t v11 = (void *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v13);
        if (v14) {
          uint64_t v15 = (void *)v14[1];
        }
        else {
          uint64_t v15 = 0;
        }
        objc_msgSend(v15, "locationCoordinate", (void)v21);
        if (vabdd_f64(v5, v18) < 0.00000000999999994
          && vabdd_f64(v7, v16) < 0.00000000999999994
          && vabdd_f64(v9, v17) < 0.00000000999999994)
        {
          uint64_t v11 = v14;
          goto LABEL_17;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      uint64_t v19 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v11 = (void *)v19;
    }
    while (v19);
  }
LABEL_17:

  return v11;
}

- (void)_removeElementAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_elements count] > a3)
  {
    uint64_t v5 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:a3];
    double v8 = (void *)v5;
    if (v5)
    {
      id v6 = *(id *)(v5 + 24);
      uint64_t v7 = v8[2];
    }
    else
    {
      id v6 = 0;
      uint64_t v7 = 0;
    }
    [v6 removeObject:v7];

    [(NSMutableArray *)self->_elements removeObjectAtIndex:a3];
  }
}

- (void)_removeFirstAnchorSharingPositionWith:(id)a3 enumerationOptions:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v24 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  elements = self->_elements;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke;
  v22[3] = &unk_1E53E1DC0;
  id v8 = v6;
  id v23 = v8;
  unint64_t v9 = [(NSMutableArray *)elements indexOfObjectWithOptions:0 passingTest:v22];
  if (v9 >= [(NSMutableArray *)self->_elements count])
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:v9];
  }
  uint64_t v11 = self->_elements;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  double v18 = __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke_2;
  uint64_t v19 = &unk_1E53E1DE8;
  id v12 = v8;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  uint64_t v14 = [(NSMutableArray *)v11 indexOfObjectWithOptions:a4 passingTest:&v16];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = GEOGetGEOComposedRouteAnchorPointListLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Could not find matching anchor point for removal: %@", buf, 0xCu);
    }
  }
  else
  {
    -[GEOComposedRouteAnchorPointList _removeElementAtIndex:](self, "_removeElementAtIndex:", v14, v16, v17, v18, v19, v20);
    [(GEOComposedRouteAnchorPointList *)self _eraseSequentialDuplicateAnchors];
  }

  _geo_isolate_unlock();
}

uint64_t __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v3 = *(void **)(a2 + 8);
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;
  uint64_t v5 = [v4 uniqueID];
  id v6 = [*(id *)(a1 + 32) uniqueID];

  uint64_t v7 = [v5 isEqual:v6];
  return v7;
}

uint64_t __92__GEOComposedRouteAnchorPointList__removeFirstAnchorSharingPositionWith_enumerationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (void *)v3[1];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 uniqueID];
  id v8 = [*(id *)(a1 + 32) uniqueID];

  LOBYTE(v6) = [v7 isEqual:v8];
  if (v6)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if (v4) {
      uint64_t v10 = (void *)v4[3];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      uint64_t v12 = *(void *)(v11 + 16);
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v10;
    uint64_t v9 = [v13 containsObject:v12];
  }
  return v9;
}

- (void)_eraseSequentialDuplicateAnchors
{
  if ((unint64_t)[(NSMutableArray *)self->_elements count] >= 2)
  {
    long long v22 = [(NSMutableArray *)self->_elements firstObject];
    BOOL v3 = [MEMORY[0x1E4F28E60] indexSet];
    if ((unint64_t)[(NSMutableArray *)self->_elements count] >= 2)
    {
      for (unint64_t i = 1; i < [(NSMutableArray *)self->_elements count]; ++i)
      {
        uint64_t v5 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:i];
        if (v22) {
          id v6 = (void *)v22[1];
        }
        else {
          id v6 = 0;
        }
        id v7 = v6;
        [v7 locationCoordinate];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        if (v5) {
          uint64_t v14 = *(void **)(v5 + 8);
        }
        else {
          uint64_t v14 = 0;
        }
        [v14 locationCoordinate];
        if (vabdd_f64(v9, v17) >= 0.000000999999997 || vabdd_f64(v11, v15) >= 0.000000999999997)
        {
        }
        else
        {
          double v18 = vabdd_f64(v13, v16);

          if (v18 < 0.000000999999997)
          {
            if (v5)
            {
              id v19 = *(id *)(v5 + 24);
              uint64_t v20 = *(void *)(v5 + 16);
            }
            else
            {
              id v19 = 0;
              uint64_t v20 = 0;
            }
            [v19 removeObject:v20];

            [v3 addIndex:i];
            goto LABEL_16;
          }
        }
        id v21 = (id)v5;

        long long v22 = v21;
LABEL_16:
      }
    }
    [(NSMutableArray *)self->_elements removeObjectsAtIndexes:v3];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(GEOComposedRouteAnchorPointList *)self _elementsCopy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)_elementsCopy
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  id v4 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = self->_elements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        double v11 = (id *)objc_opt_new();
        if (v10)
        {
          double v12 = (void *)[*(id *)(v10 + 8) copy];
          -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v11, v12);

          double v13 = *(void **)(v10 + 16);
          if (!v11) {
            goto LABEL_9;
          }
LABEL_8:
          objc_storeStrong(v11 + 2, v13);
          goto LABEL_9;
        }
        double v18 = objc_msgSend(0, "copy", (void)v21);
        -[_GEOAnchorPointListElement setAnchorPoint:]((uint64_t)v11, v18);

        double v13 = 0;
        if (v11) {
          goto LABEL_8;
        }
LABEL_9:
        if (v10) {
          uint64_t v14 = *(void *)(v10 + 24);
        }
        else {
          uint64_t v14 = 0;
        }
        double v15 = objc_msgSend(v4, "objectForKey:", v14, (void)v21);
        if (!v15)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F1CA80]);
          if (v10)
          {
            double v15 = (void *)[v16 initWithSet:*(void *)(v10 + 24)];
            uint64_t v17 = *(void *)(v10 + 24);
          }
          else
          {
            double v15 = (void *)[v16 initWithSet:0];
            uint64_t v17 = 0;
          }
          [v4 setObject:v15 forKey:v17];
        }
        -[_GEOAnchorPointListElement setConjunctElements:]((uint64_t)v11, v15);
        [v3 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  double v15 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  unint64_t var0 = a3->var0;
  if (var0 >= [(NSMutableArray *)self->_elements count])
  {
    a5 = 0;
  }
  else
  {
    if ([(NSMutableArray *)self->_elements count] - var0 <= a5) {
      a5 = [(NSMutableArray *)self->_elements count] - var0;
    }
    if (a5)
    {
      uint64_t v10 = a4;
      unint64_t v11 = a5;
      do
      {
        double v12 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:var0];
        if (v12) {
          double v13 = (void *)v12[1];
        }
        else {
          double v13 = 0;
        }
        *v10++ = v13;

        ++var0;
        --v11;
      }
      while (v11);
    }
    a3->var0 += a5;
    a3->float var1 = a4;
    a3->var2 = &self->_mutationsCount;
  }
  _geo_isolate_unlock();

  return a5;
}

- (id)description
{
  geo_assert_not_isolated();
  uint64_t v5 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  BOOL v3 = [(GEOComposedRouteAnchorPointList *)self _isolatedDescription];
  _geo_isolate_unlock();

  return v3;
}

- (id)_isolatedDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  geo_assert_isolated();
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_elements, "count") + 1);
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%p list with %d anchor points:", self, -[NSMutableArray count](self->_elements, "count"));
  [v3 addObject:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_elements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (v10) {
          unint64_t v11 = *(void **)(v10 + 8);
        }
        else {
          unint64_t v11 = 0;
        }
        double v12 = [v11 description];
        [v3 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v13 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v7 = v13;
    }
    while (v13);
  }

  uint64_t v14 = [v3 componentsJoinedByString:@"\n\t"];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSMutableArray *)self->_elements isEqualToArray:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v20 = self->_anchorPointsIsolater;
  _geo_isolate_lock_data();
  char v5 = self->_elements;
  [v4 encodeObject:v5 forKey:@"elements"];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  uint64_t v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  for (unint64_t i = 0; i < [(NSMutableArray *)self->_elements count]; ++i)
  {
    uint64_t v10 = [(NSMutableArray *)self->_elements objectAtIndexedSubscript:i];
    unint64_t v11 = (void *)v10;
    if (v10) {
      double v12 = *(void **)(v10 + 24);
    }
    else {
      double v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [v8 objectForKey:v13];

    if (!v14)
    {
      if (v11) {
        double v15 = (void *)v11[3];
      }
      else {
        double v15 = 0;
      }
      id v16 = v15;
      [v6 addObject:v16];

      uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - 1);
      if (v11) {
        long long v17 = (void *)v11[3];
      }
      else {
        long long v17 = 0;
      }
      id v18 = v17;
      [v8 setObject:v14 forKey:v18];
    }
    long long v19 = [NSNumber numberWithUnsignedInteger:i];
    [v7 setObject:v14 forKeyedSubscript:v19];
  }
  [v4 encodeObject:v6 forKey:@"conjunctElements"];
  [v4 encodeObject:v7 forKey:@"lookup"];

  _geo_isolate_unlock();
}

- (GEOComposedRouteAnchorPointList)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [(GEOComposedRouteAnchorPointList *)self init];
  if (v5)
  {
    v28 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"elements"];
    uint64_t v6 = [v28 mutableCopy];
    elements = v5->_elements;
    v5->_elements = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableArray count](v5->_elements, "count"));
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"conjunctElements"];

    uint64_t v15 = objc_opt_class();
    id v16 = [v4 decodeDictionaryWithKeysOfClass:v15 objectsOfClass:objc_opt_class() forKey:@"lookup"];

    if ([(NSMutableArray *)v5->_elements count])
    {
      unint64_t v17 = 0;
      do
      {
        id v18 = [(NSMutableArray *)v5->_elements objectAtIndexedSubscript:v17];
        long long v19 = [NSNumber numberWithUnsignedInteger:v17];
        uint64_t v20 = [v16 objectForKeyedSubscript:v19];

        unint64_t v21 = [v20 unsignedIntegerValue];
        if (v21 >= [v14 count])
        {
          long long v23 = GEOGetGEOComposedRouteAnchorPointListLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_FAULT, "Error finding conjunct elements when deserializing.", buf, 2u);
          }

          if (v18) {
            uint64_t v24 = v18[2];
          }
          else {
            uint64_t v24 = 0;
          }
          long long v22 = [MEMORY[0x1E4F1CA80] setWithObject:v24];
        }
        else
        {
          long long v22 = [v14 objectAtIndexedSubscript:v21];
        }
        long long v25 = v22;
        -[_GEOAnchorPointListElement setConjunctElements:]((uint64_t)v18, v22);

        ++v17;
      }
      while (v17 < [(NSMutableArray *)v5->_elements count]);
    }
    uint64_t v26 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPointsIsolater, 0);

  objc_storeStrong((id *)&self->_elements, 0);
}

- (BOOL)updateWithRoute:(id *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BOOL v3 = [a2 coordinates];
  uint64_t v4 = [v3 pathsCount];
  BOOL v5 = v4 == 1;
  if (v4 == 1)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[1], "count"));
    id v15 = v3;
    uint64_t v9 = v6;
    geo_isolate_sync_data();
    [a1 appendAnchorPoints:v9];
    uint64_t v7 = GEOGetGEOComposedRouteAnchorPointListLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v17 = a1;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "Anchor points for route: %@", buf, 0xCu);
    }

    goto LABEL_13;
  }
  uint64_t v8 = [v3 pathsCount];
  uint64_t v9 = GEOGetGEOComposedRouteAnchorPointListLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = [v3 pathsCount];
      uint64_t v11 = "User created routes only support 1 leg, but %d were found.";
      uint64_t v12 = v9;
      uint32_t v13 = 8;
LABEL_12:
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "No legs found when trying to set anchor points for user created route.";
    uint64_t v12 = v9;
    uint32_t v13 = 2;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

void __61__GEOComposedRouteAnchorPointList_Internal__updateWithRoute___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v62;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v62 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v61 + 1) + 8 * v7);
        if (v8) {
          uint64_t v9 = *(void **)(v8 + 8);
        }
        else {
          uint64_t v9 = 0;
        }
        BOOL v10 = [v9 uniqueID];

        if (v10)
        {
          if (v8) {
            uint64_t v11 = *(void **)(v8 + 8);
          }
          else {
            uint64_t v11 = 0;
          }
          id v12 = v11;
          uint32_t v13 = [v12 uniqueID];
          [v2 setObject:v8 forKeyedSubscript:v13];
        }
        else
        {
          uint32_t v13 = GEOGetGEOComposedRouteAnchorPointListLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            if (v8) {
              uint64_t v14 = *(GEOComposedRouteAnchorPoint **)(v8 + 8);
            }
            else {
              uint64_t v14 = 0;
            }
            *(_DWORD *)buf = 138412290;
            v68 = v14;
            _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Skipping anchor point with no unique ID: %@", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v15 = [v3 countByEnumeratingWithState:&v61 objects:v69 count:16];
      uint64_t v5 = v15;
    }
    while (v15);
  }

  id v16 = [*(id *)(a1 + 40) supportPointsForPathAtIndex:0];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v52 = *(void *)v58;
    *(void *)&long long v18 = 138412290;
    long long v51 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v58 != v52) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        long long v22 = objc_msgSend(v21, "anchorPointID", v51);

        if (v22)
        {
          uint64_t v23 = [v21 routeCoordinate];
          [*(id *)(a1 + 40) coordinateForRouteCoordinate:v23];
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          __int16 v30 = [v21 anchorPointID];
          uint64_t v31 = [v2 objectForKeyedSubscript:v30];

          if (v31)
          {
            v32 = [v21 anchorPointID];
            [v2 removeObjectForKey:v32];

            objc_msgSend(v31[1], "updatedAnchorPointWithLocationCoordinate:routeCoordinate:", v23, v25, v27, v29);
            uint64_t v33 = (GEOComposedRouteAnchorPoint *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = [GEOComposedRouteAnchorPoint alloc];
            v35 = [v21 anchorPointID];
            uint64_t v33 = -[GEOComposedRouteAnchorPoint initWithUniqueID:locationCoordinate:routeCoordinate:](v34, "initWithUniqueID:locationCoordinate:routeCoordinate:", v35, v23, v25, v27, v29);

            v36 = GEOGetGEOComposedRouteAnchorPointListLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v51;
              v68 = v33;
              _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_DEFAULT, "New anchor point was found in directions response but not in original list: %@", buf, 0xCu);
            }
          }
          v37 = [v16 firstObject];

          v38 = [v16 lastObject];

          if (v21 == v37)
          {
            uint64_t v39 = 1;
          }
          else if (v21 == v38)
          {
            uint64_t v39 = 2;
          }
          else if ([v21 isUTurn])
          {
            uint64_t v39 = 4;
          }
          else
          {
            uint64_t v39 = 3;
          }
          [(GEOComposedRouteAnchorPoint *)v33 setAnchorPointType:v39];
          [*(id *)(a1 + 48) addObject:v33];
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v19);
  }
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v40 = v2;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v54;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = [v40 objectForKeyedSubscript:*(void *)(*((void *)&v53 + 1) + 8 * v44)];
        v46 = (void *)v45;
        if (v45) {
          v47 = *(void **)(v45 + 8);
        }
        else {
          v47 = 0;
        }
        v48 = v47;

        v49 = GEOGetGEOComposedRouteAnchorPointListLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v48;
          _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_DEFAULT, "Dropping anchor point because it was not found in the directions response: %@", buf, 0xCu);
        }

        ++v44;
      }
      while (v42 != v44);
      uint64_t v50 = [v40 countByEnumeratingWithState:&v53 objects:v65 count:16];
      uint64_t v42 = v50;
    }
    while (v50);
  }
}

@end