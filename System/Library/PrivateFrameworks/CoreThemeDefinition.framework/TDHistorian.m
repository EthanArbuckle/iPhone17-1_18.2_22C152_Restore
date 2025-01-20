@interface TDHistorian
- (BOOL)foundDataChangesSinceDate:(id)a3;
- (TDHistorian)initWithDocument:(id)a3;
- (id)_updateRecordsWithName:(id)a3 sinceDate:(id)a4;
- (id)colorsChangedSinceDate:(id)a3;
- (id)facetDefinitionsChangedSinceDate:(id)a3;
- (id)fontSizesChangedSinceDate:(id)a3;
- (id)fontsChangedSinceDate:(id)a3;
- (id)keySpecsForRenditionsRemovedSinceDate:(id)a3;
- (id)namedElementsChangedSinceDate:(id)a3;
- (id)productionsChangedSinceDate:(id)a3 uuidNeedsReset:(BOOL *)a4;
- (id)productionsWithModifiedAssets;
- (void)_updateEntryForManagedObject:(id)a3;
- (void)updateEntriesForManagedObjects:(id)a3;
@end

@implementation TDHistorian

- (id)_updateRecordsWithName:(id)a3 sinceDate:(id)a4
{
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"dateOfLastChange > %@", a4];
  document = self->document;

  return [(CoreThemeDocument *)document objectsForEntity:a3 withPredicate:v6 sortDescriptors:0];
}

- (void)_updateEntryForManagedObject:(id)a3
{
  v4 = (void *)[MEMORY[0x263EFF910] date];
  uint64_t v5 = [a3 dateOfLastChange];
  if (!v5 || ([v4 timeIntervalSinceDate:v5], v6 > 5.0))
  {
    [a3 setDateOfLastChange:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[a3 production];
      [v7 setDateOfLastChange:v4];
    }
  }
}

- (void)updateEntriesForManagedObjects:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [a3 objectAtIndex:v5];
      if (objc_opt_respondsToSelector()) {
        [(TDHistorian *)self _updateEntryForManagedObject:v6];
      }
      ++v5;
    }
    while (v5 < [a3 count]);
  }
}

- (BOOL)foundDataChangesSinceDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(CoreThemeDocument *)self->document allObjectsForEntity:@"ElementProduction" withSortDescriptors:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(a3, "compare:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "associatedFileModificationDateWithDocument:", self->document)) == -1)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (id)productionsWithModifiedAssets
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v27 = (void *)[MEMORY[0x263EFF980] array];
  id v3 = [(CoreThemeDocument *)self->document allObjectsForEntity:@"PhotoshopElementProduction" withSortDescriptors:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
        uint64_t v9 = (void *)[v8 associatedFileModificationDateWithDocument:self->document];
        if (v9 && objc_msgSend(v9, "compare:", objc_msgSend(v8, "dateOfLastChange")) == 1)
        {
          v10 = -[CTDPSDPreviewRef initWithPath:]([CTDPSDPreviewRef alloc], "initWithPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "asset"), "fileURLWithDocument:", self->document), "path"));
          long long v11 = (void *)[v8 valueForKey:@"renditions"];
          if ([v11 count])
          {
            uint64_t v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"layer" ascending:1];
            long long v13 = (void *)[v11 allObjects];
            long long v14 = objc_msgSend(v13, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v12));
            uint64_t v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "lastObject"), "valueForKey:", @"layer"), "integerValue");
          }
          else
          {
            long long v14 = 0;
            uint64_t v15 = -1;
          }
          uint64_t v16 = [(CUIPSDImageRef *)v10 numberOfLayers] - 1;
          if (v14 && v15 == v16)
          {
            uint64_t v17 = objc_msgSend((id)objc_msgSend(v14, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"layer == %d", 0)), "count");
            unsigned int v18 = objc_msgSend((id)objc_msgSend(v8, "renditionType"), "identifier");
            if (v18 == 8 || v18 == 5)
            {
              uint64_t v19 = [(CTDPSDPreviewRef *)v10 sliceRowCount];
              if (!(v19 % (int)objc_msgSend((id)objc_msgSend(v8, "rowCount"), "intValue")))
              {
                uint64_t v20 = [(CTDPSDPreviewRef *)v10 sliceColumnCount];
                if (!(v20 % (int)objc_msgSend((id)objc_msgSend(v8, "columnCount"), "intValue"))) {
                  goto LABEL_20;
                }
              }
            }
            else
            {
              uint64_t v21 = v18;
              [(CTDPSDPreviewRef *)v10 evaluateSliceGrid];
              if (v21 == 6)
              {
                unsigned int v22 = 1;
                unsigned int v23 = 1;
              }
              else
              {
                unsigned int v22 = +[TDPhotoshopElementProduction sliceRowsPerRendition:v21];
                unsigned int v23 = +[TDPhotoshopElementProduction sliceColumnsPerRendition:v21];
              }
              uint64_t v24 = (uint64_t)(double)([(CTDPSDPreviewRef *)v10 sliceRowCount] / v22);
              if (v17 == (uint64_t)(double)([(CTDPSDPreviewRef *)v10 sliceColumnCount] / v23) * v24) {
                goto LABEL_20;
              }
            }
LABEL_19:
            NSLog(&cfstr_NeedToUpdatePr.isa, objc_msgSend((id)objc_msgSend(v8, "asset"), "path"));
            [v27 addObject:v8];
          }
          else if (v15 != v16)
          {
            goto LABEL_19;
          }
LABEL_20:
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v5 = v25;
    }
    while (v25);
  }
  return v27;
}

- (id)productionsChangedSinceDate:(id)a3 uuidNeedsReset:(BOOL *)a4
{
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  id v8 = objc_alloc_init(MEMORY[0x263F086B0]);
  objc_msgSend(v7, "addObjectsFromArray:", -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", @"ElementProduction", a3));
  if (a4)
  {
    BOOL v9 = *a4 || [v7 count] != 0;
    *a4 = v9;
  }
  v10 = objc_msgSend(-[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->document, "allObjectsForEntity:withSortDescriptors:", @"ElementProduction", 0), "objectEnumerator");
  uint64_t v11 = [v10 nextObject];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    do
    {
      if ([v7 containsObject:v12]) {
        break;
      }
      id v13 = objc_alloc_init(MEMORY[0x263F086B0]);
      long long v14 = (void *)[v12 associatedFileModificationDateWithDocument:self->document];
      [a3 timeIntervalSinceReferenceDate];
      if (v14)
      {
        double v16 = v15;
        [v14 timeIntervalSinceReferenceDate];
        if (v17 > v16) {
          [v7 addObject:v12];
        }
      }
      [v13 drain];
      uint64_t v12 = (void *)[v10 nextObject];
    }
    while (v12);
  }
  [v8 drain];
  return v7;
}

- (id)colorsChangedSinceDate:(id)a3
{
  return [(TDHistorian *)self _updateRecordsWithName:@"ColorDefinition" sinceDate:a3];
}

- (id)fontsChangedSinceDate:(id)a3
{
  return [(TDHistorian *)self _updateRecordsWithName:@"FontDefinition" sinceDate:a3];
}

- (id)fontSizesChangedSinceDate:(id)a3
{
  return [(TDHistorian *)self _updateRecordsWithName:@"FontSizeDefinition" sinceDate:a3];
}

- (id)namedElementsChangedSinceDate:(id)a3
{
  return [(TDHistorian *)self _updateRecordsWithName:@"NamedElement" sinceDate:a3];
}

- (id)facetDefinitionsChangedSinceDate:(id)a3
{
  return [(TDHistorian *)self _updateRecordsWithName:@"FacetDefinition" sinceDate:a3];
}

- (id)keySpecsForRenditionsRemovedSinceDate:(id)a3
{
  id v3 = [(TDHistorian *)self _updateRecordsWithName:@"RenditionSpec" sinceDate:a3];

  return (id)[v3 valueForKey:@"keySpec"];
}

- (TDHistorian)initWithDocument:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TDHistorian;
  result = [(TDHistorian *)&v5 init];
  result->document = (CoreThemeDocument *)a3;
  return result;
}

@end