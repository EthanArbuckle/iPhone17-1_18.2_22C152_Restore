@interface GEOResultRefinementSort
- (GEOResultRefinementSort)initWithDisplayName:(id)a3 sorts:(id)a4 selectedElementIndex:(id)a5 defaultSelectedElementIndex:(id)a6;
- (GEOResultRefinementSort)initWithResultRefinementSort:(id)a3;
- (NSArray)sorts;
- (NSNumber)defaultSelectedElementIndex;
- (NSNumber)selectedElementIndex;
- (NSString)displayName;
- (id)convertToGEOPDResultRefinementSort;
- (void)setDefaultSelectedElementIndex:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setSelectedElementIndex:(id)a3;
- (void)setSorts:(id)a3;
@end

@implementation GEOResultRefinementSort

- (GEOResultRefinementSort)initWithDisplayName:(id)a3 sorts:(id)a4 selectedElementIndex:(id)a5 defaultSelectedElementIndex:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    v21.receiver = self;
    v21.super_class = (Class)GEOResultRefinementSort;
    v14 = [(GEOResultRefinementSort *)&v21 init];
    if (v14)
    {
      uint64_t v15 = [v10 copy];
      displayName = v14->_displayName;
      v14->_displayName = (NSString *)v15;

      uint64_t v17 = [v11 copy];
      sorts = v14->_sorts;
      v14->_sorts = (NSArray *)v17;

      objc_storeStrong((id *)&v14->_selectedElementIndex, a5);
      objc_storeStrong((id *)&v14->_defaultSelectedElementIndex, a6);
    }
    self = v14;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (GEOResultRefinementSort)initWithResultRefinementSort:(id)a3
{
  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementSort sorts](v4);
  v6 = objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_27);

  if (v4 && (*((unsigned char *)v4 + 60) & 2) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v4 + 14)];
  }
  else
  {
    v7 = 0;
  }
  v8 = -[GEOPDResultRefinementSort displayName](v4);
  if (v4) {
    uint64_t v9 = *((unsigned int *)v4 + 13);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [NSNumber numberWithUnsignedInt:v9];
  id v11 = [(GEOResultRefinementSort *)self initWithDisplayName:v8 sorts:v6 selectedElementIndex:v7 defaultSelectedElementIndex:v10];

  return v11;
}

GEOResultRefinementSortElement *__56__GEOResultRefinementSort_initWithResultRefinementSort___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinementSortElement alloc] initWithResultRefinementSortElement:v2];

  return v3;
}

- (id)convertToGEOPDResultRefinementSort
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOPDResultRefinementSort);
  v4 = [(GEOResultRefinementSort *)self displayName];
  -[GEOPDResultRefinementSort setDisplayName:]((uint64_t)v3, v4);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(GEOResultRefinementSort *)self sorts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) convertToGEOPDResultRefinementSortElement];
        -[GEOPDResultRefinementSort addSort:]((uint64_t)v3, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v11 = [(GEOResultRefinementSort *)self selectedElementIndex];

  if (v11)
  {
    id v12 = [(GEOResultRefinementSort *)self selectedElementIndex];
    unsigned int v13 = [v12 unsignedIntValue];
    if (v3)
    {
      *(unsigned char *)&v3->_flags |= 0x20u;
      *(unsigned char *)&v3->_flags |= 2u;
      v3->_selectedElementIndex = v13;
    }
  }
  v14 = [(GEOResultRefinementSort *)self defaultSelectedElementIndex];
  unsigned int v15 = [v14 unsignedIntValue];
  if (v3)
  {
    *(unsigned char *)&v3->_flags |= 0x20u;
    *(unsigned char *)&v3->_flags |= 1u;
    v3->_defaultSelectedElementIndex = v15;
  }

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)sorts
{
  return self->_sorts;
}

- (void)setSorts:(id)a3
{
}

- (NSNumber)selectedElementIndex
{
  return self->_selectedElementIndex;
}

- (void)setSelectedElementIndex:(id)a3
{
}

- (NSNumber)defaultSelectedElementIndex
{
  return self->_defaultSelectedElementIndex;
}

- (void)setDefaultSelectedElementIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSelectedElementIndex, 0);
  objc_storeStrong((id *)&self->_selectedElementIndex, 0);
  objc_storeStrong((id *)&self->_sorts, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end