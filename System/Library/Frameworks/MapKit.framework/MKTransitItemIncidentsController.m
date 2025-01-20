@interface MKTransitItemIncidentsController
- (MKTransitItemIncidentsController)initWithLineItem:(id)a3;
- (MKTransitItemIncidentsController)initWithMapItem:(id)a3;
- (NSDate)referenceDate;
- (id)_incidentsAffectingMuid:(unint64_t)a3;
- (id)blockedIncidentEntities;
- (id)incidentsForDepartureSequence:(id)a3;
- (id)incidentsForLine:(id)a3;
- (id)incidentsForLinesInSystem:(id)a3;
- (id)incidentsForMapItem:(id)a3;
- (id)incidentsForSystem:(id)a3;
- (id)validIncidents;
- (void)resetCache;
- (void)setReferenceDate:(id)a3;
@end

@implementation MKTransitItemIncidentsController

- (MKTransitItemIncidentsController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKTransitItemIncidentsController;
  v6 = [(MKTransitItemIncidentsController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForDepartureSequence = v7->_incidentsForDepartureSequence;
    v7->_incidentsForDepartureSequence = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForSystem = v7->_incidentsForSystem;
    v7->_incidentsForSystem = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForLinesInSystem = v7->_incidentsForLinesInSystem;
    v7->_incidentsForLinesInSystem = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForLine = v7->_incidentsForLine;
    v7->_incidentsForLine = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForMapItem = v7->_incidentsForMapItem;
    v7->_incidentsForMapItem = v16;
  }
  return v7;
}

- (MKTransitItemIncidentsController)initWithLineItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKTransitItemIncidentsController;
  v6 = [(MKTransitItemIncidentsController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    incidentsForLine = v7->_incidentsForLine;
    v7->_incidentsForLine = v8;
  }
  return v7;
}

- (void)setReferenceDate:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  referenceDate = self->_referenceDate;
  self->_referenceDate = v4;

  [(MKTransitItemIncidentsController *)self resetCache];
}

- (void)resetCache
{
  mapItem = self->_mapItem;
  if (mapItem)
  {
    v4 = [(MKMapItem *)mapItem _transitInfo];
    id v5 = [v4 incidents];
  }
  else
  {
    id v5 = [(GEOTransitLineItem *)self->_lineItem incidents];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__MKTransitItemIncidentsController_resetCache__block_invoke;
  v10[3] = &unk_1E54B94F0;
  v10[4] = self;
  v6 = [v5 indexesOfObjectsPassingTest:v10];
  v7 = [v5 objectsAtIndexes:v6];
  v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_17];
  validIncidents = self->_validIncidents;
  self->_validIncidents = v8;

  [(NSMutableDictionary *)self->_incidentsForDepartureSequence removeAllObjects];
  [(NSMutableDictionary *)self->_incidentsForSystem removeAllObjects];
  [(NSMutableDictionary *)self->_incidentsForLine removeAllObjects];
  [(NSMutableDictionary *)self->_incidentsForMapItem removeAllObjects];
}

uint64_t __46__MKTransitItemIncidentsController_resetCache__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 startDate];
  id v5 = [v3 endDate];

  if (!v4)
  {
    BOOL v7 = 1;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v9 = 1;
    goto LABEL_6;
  }
  [*(id *)(*(void *)(a1 + 32) + 80) timeIntervalSinceDate:v4];
  BOOL v7 = v6 >= 0.0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 80)];
  BOOL v9 = v8 >= 0.0;
LABEL_6:
  uint64_t v10 = v7 & v9;

  return v10;
}

uint64_t __46__MKTransitItemIncidentsController_resetCache__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isBlockingIncident];
  if (v6 == [v5 isBlockingIncident])
  {
    uint64_t v8 = [v4 startDate];
    if (v8
      && (BOOL v9 = (void *)v8,
          [v5 startDate],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_super v11 = [v5 startDate];
      v12 = [v4 startDate];
      [v11 timeIntervalSinceDate:v12];
      if (v13 < 0.0) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = -1;
      }
    }
    else
    {
      v14 = [v5 startDate];
      if (v14) {
        uint64_t v7 = -1;
      }
      else {
        uint64_t v7 = 1;
      }
    }
  }
  else if ([v4 isBlockingIncident])
  {
    uint64_t v7 = -1;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)validIncidents
{
  return self->_validIncidents;
}

- (id)_incidentsAffectingMuid:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  validIncidents = self->_validIncidents;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__MKTransitItemIncidentsController__incidentsAffectingMuid___block_invoke;
  v10[3] = &unk_1E54B94F0;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)validIncidents indexesOfObjectsPassingTest:v10];
  uint64_t v8 = [(NSArray *)self->_validIncidents objectsAtIndexes:v7];

  return v8;
}

uint64_t __60__MKTransitItemIncidentsController__incidentsAffectingMuid___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "affectedEntities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "muid"));
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [v4 containsObject:*(void *)(a1 + 32)];
  return v11;
}

- (id)incidentsForLinesInSystem:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  uint64_t v6 = [(NSMutableDictionary *)self->_incidentsForLinesInSystem objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = [(MKMapItem *)self->_mapItem _transitInfo];
    uint64_t v9 = [v8 lines];
    uint64_t v10 = v9;
    v28 = v5;
    v29 = self;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      lineItem = self->_lineItem;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&lineItem count:1];
    }
    v12 = v11;

    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v18 = [v17 system];
          uint64_t v19 = [v18 muid];
          uint64_t v20 = [v4 muid];

          if (v19 == v20)
          {
            v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid"));
            [v7 addObject:v21];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    self = v29;
    validIncidents = v29->_validIncidents;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__MKTransitItemIncidentsController_incidentsForLinesInSystem___block_invoke;
    v30[3] = &unk_1E54B94F0;
    id v31 = v7;
    id v23 = v7;
    v24 = [(NSArray *)validIncidents indexesOfObjectsPassingTest:v30];
    v25 = [(NSArray *)v29->_validIncidents objectsAtIndexes:v24];
    id v5 = v28;
    [(NSMutableDictionary *)v29->_incidentsForLinesInSystem setObject:v25 forKeyedSubscript:v28];
  }
  v26 = [(NSMutableDictionary *)self->_incidentsForLinesInSystem objectForKeyedSubscript:v5];

  return v26;
}

uint64_t __62__MKTransitItemIncidentsController_incidentsForLinesInSystem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a2, "affectedEntities", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "muid"));
        LOBYTE(v8) = [v8 containsObject:v9];

        if (v8)
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)incidentsForSystem:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  uint64_t v6 = [(NSMutableDictionary *)self->_incidentsForSystem objectForKeyedSubscript:v5];

  if (!v6)
  {
    v29 = -[MKTransitItemIncidentsController _incidentsAffectingMuid:](self, "_incidentsAffectingMuid:", [v4 muid]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v8 = [(MKMapItem *)self->_mapItem _transitInfo];
    uint64_t v9 = [v8 lines];
    uint64_t v10 = v9;
    v30 = v5;
    id v31 = self;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      lineItem = self->_lineItem;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&lineItem count:1];
    }
    long long v12 = v11;

    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v17, "system", v29);
          uint64_t v19 = [v18 muid];
          uint64_t v20 = [v4 muid];

          if (v19 == v20)
          {
            v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid"));
            [v7 addObject:v21];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    self = v31;
    validIncidents = v31->_validIncidents;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__MKTransitItemIncidentsController_incidentsForSystem___block_invoke;
    v32[3] = &unk_1E54B94F0;
    id v33 = v7;
    id v23 = v7;
    v24 = [(NSArray *)validIncidents indexesOfObjectsPassingTest:v32];
    v25 = [(NSArray *)v31->_validIncidents objectsAtIndexes:v24];
    v26 = [v25 arrayByAddingObjectsFromArray:v29];
    uint64_t v5 = v30;
    [(NSMutableDictionary *)v31->_incidentsForSystem setObject:v26 forKeyedSubscript:v30];
  }
  v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_incidentsForSystem, "objectForKeyedSubscript:", v5, v29);

  return v27;
}

uint64_t __55__MKTransitItemIncidentsController_incidentsForSystem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isBlockingIncident])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(v3, "affectedEntities", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(a1 + 32);
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "muid"));
          LOBYTE(v9) = [v9 containsObject:v10];

          if (v9)
          {
            uint64_t v11 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)incidentsForLine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  uint64_t v6 = [(NSMutableDictionary *)self->_incidentsForLine objectForKeyedSubscript:v5];

  if (!v6)
  {
    uint64_t v7 = -[MKTransitItemIncidentsController _incidentsAffectingMuid:](self, "_incidentsAffectingMuid:", [v4 muid]);
    [(NSMutableDictionary *)self->_incidentsForLine setObject:v7 forKeyedSubscript:v5];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_incidentsForLine objectForKeyedSubscript:v5];

  return v8;
}

- (id)incidentsForMapItem:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "_muid"));
  uint64_t v6 = [(NSMutableDictionary *)self->_incidentsForMapItem objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v8 = [v4 _transitInfo];
    uint64_t v9 = [v8 systems];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [(MKTransitItemIncidentsController *)self incidentsForSystem:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          [v7 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v11);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v15 = [v4 _transitInfo];
    long long v16 = [v15 lines];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(MKTransitItemIncidentsController *)self incidentsForLine:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          [v7 addObjectsFromArray:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v18);
    }

    validIncidents = self->_validIncidents;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__MKTransitItemIncidentsController_incidentsForMapItem___block_invoke;
    v28[3] = &unk_1E54B94F0;
    id v29 = v7;
    id v23 = v7;
    v24 = [(NSArray *)validIncidents indexesOfObjectsPassingTest:v28];
    v25 = [(NSArray *)self->_validIncidents objectsAtIndexes:v24];
    [(NSMutableDictionary *)self->_incidentsForMapItem setObject:v25 forKeyedSubscript:v5];
  }
  v26 = [(NSMutableDictionary *)self->_incidentsForMapItem objectForKeyedSubscript:v5];

  return v26;
}

uint64_t __56__MKTransitItemIncidentsController_incidentsForMapItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)incidentsForDepartureSequence:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = NSNumber;
  id v7 = [v4 line];
  uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "muid"));
  uint64_t v9 = [v5 stringWithFormat:@"%@", v8];

  uint64_t v10 = [v4 nextStopIDs];
  uint64_t v11 = [v10 allObjects];
  uint64_t v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_9];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        [v9 appendFormat:@"_%@", *(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(NSMutableDictionary *)self->_incidentsForDepartureSequence objectForKeyedSubscript:v9];

  if (!v18)
  {
    validIncidents = self->_validIncidents;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke_2;
    v24[3] = &unk_1E54B94F0;
    id v25 = v4;
    uint64_t v20 = [(NSArray *)validIncidents indexesOfObjectsPassingTest:v24];
    v21 = [(NSArray *)self->_validIncidents objectsAtIndexes:v20];
    [(NSMutableDictionary *)self->_incidentsForDepartureSequence setObject:v21 forKeyedSubscript:v9];
  }
  v22 = [(NSMutableDictionary *)self->_incidentsForDepartureSequence objectForKeyedSubscript:v9];

  return v22;
}

uint64_t __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __66__MKTransitItemIncidentsController_incidentsForDepartureSequence___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(a2, "affectedEntities", 0, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (GEOTransitIncidentEntityAffectsSequence())
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (id)blockedIncidentEntities
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  blockedIncidentEntities = self->_blockedIncidentEntities;
  if (!blockedIncidentEntities)
  {
    uint64_t v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = self->_validIncidents;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v10 isBlockingIncident])
          {
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v11 = objc_msgSend(v10, "affectedEntities", 0);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v19;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v19 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  [(NSSet *)v4 addObject:*(void *)(*((void *)&v18 + 1) + 8 * j)];
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              }
              while (v13);
            }
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    uint64_t v16 = self->_blockedIncidentEntities;
    self->_blockedIncidentEntities = v4;

    blockedIncidentEntities = self->_blockedIncidentEntities;
  }

  return blockedIncidentEntities;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_blockedIncidentEntities, 0);
  objc_storeStrong((id *)&self->_incidentsForLinesInSystem, 0);
  objc_storeStrong((id *)&self->_incidentsForMapItem, 0);
  objc_storeStrong((id *)&self->_incidentsForLine, 0);
  objc_storeStrong((id *)&self->_incidentsForSystem, 0);
  objc_storeStrong((id *)&self->_incidentsForDepartureSequence, 0);
  objc_storeStrong((id *)&self->_validIncidents, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end