@interface CPZoneFilter
+ (void)filterZonesInPage:(id)a3;
- (CPZoneFilter)initWithPage:(id)a3;
- (void)filterZonesInZone:(id)a3;
- (void)findBackgroundGraphicsInZone:(id)a3;
- (void)findUsedGraphicsInZone:(id)a3;
@end

@implementation CPZoneFilter

- (void)findUsedGraphicsInZone:(id)a3
{
  v5 = (void *)[a3 zoneBorders];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = (void *)[v5 objectAtIndex:i];
      v9 = (void *)[v8 graphicObjects];
      uint64_t v10 = [v9 count];
      if (v10)
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          v12 = (void *)[v9 objectAtIndex:j];
          if ([v12 parent] && !objc_msgSend(v12, "user")) {
            [v12 setUser:a3];
          }
        }
      }
      int v13 = [v8 neighborCount];
      if (v13)
      {
        int v14 = v13;
        uint64_t v15 = 0;
        do
        {
          v16 = objc_msgSend((id)objc_msgSend(v8, "neighborAtIndex:", v15), "neighborShape");
          if (![v16 user]) {
            [v16 setUser:a3];
          }
          uint64_t v15 = (v15 + 1);
        }
        while (v14 != v15);
      }
    }
  }
  id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  [a3 childrenOfClass:objc_opt_class() into:v19];
  uint64_t v17 = [v19 count];
  if (v17)
  {
    for (uint64_t k = 0; k != v17; ++k)
      -[CPZoneFilter findUsedGraphicsInZone:](self, "findUsedGraphicsInZone:", [v19 objectAtIndex:k]);
  }
}

- (void)findBackgroundGraphicsInZone:(id)a3
{
  v5 = (void *)[a3 backgroundGraphics];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = (void *)[v5 objectAtIndex:i];
      if (![v8 user]) {
        [v8 setUser:a3];
      }
    }
  }
  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  [a3 childrenOfClass:objc_opt_class() into:v11];
  uint64_t v9 = [v11 count];
  if (v9)
  {
    for (uint64_t j = 0; j != v9; ++j)
      -[CPZoneFilter findBackgroundGraphicsInZone:](self, "findBackgroundGraphicsInZone:", [v11 objectAtIndex:j]);
  }
}

- (void)filterZonesInZone:(id)a3
{
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  [a3 childrenOfClass:objc_opt_class() into:v5];
  unsigned int v6 = [v5 count];
  unsigned int v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  uint64_t v8 = 0;
  unsigned int v9 = 0;
  unsigned int v15 = 0;
  uint64_t v10 = v6;
  do
  {
    id v11 = (void *)[v5 objectAtIndex:v8];
    if ([v11 hasRotatedCharacters]) {
      goto LABEL_10;
    }
    if (![v11 firstDescendantOfClass:objc_opt_class()])
    {
      deZoneDescendantsOf(v11);
LABEL_9:
      [v11 promoteChildren];
      [v11 remove];
      goto LABEL_10;
    }
    [v11 area];
    if (v12 >= self->minArea)
    {
      ++v9;
      [(CPZoneFilter *)self filterZonesInZone:v11];
    }
    else
    {
      deZoneDescendantsOf(v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 promoteChildren];
        [v11 remove];
      }
      else
      {
        ++v15;
      }
    }
    if (v7 == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unsigned int v15 = 0;
          goto LABEL_9;
        }
      }
    }
LABEL_10:
    ++v8;
  }
  while (v10 != v8);
  if (v9 < v15)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      int v14 = (void *)[v5 objectAtIndex:i];
      if ([v14 parent] && (objc_msgSend(v14, "hasRotatedCharacters") & 1) == 0)
      {
        [v14 promoteChildren];
        [v14 remove];
      }
    }
  }
LABEL_24:

  deZoneTablesIn(a3);
}

- (CPZoneFilter)initWithPage:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPZoneFilter;
  v4 = [(CPZoneFilter *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->page = (CPPage *)a3;
    [a3 pageCropBox];
    v5->minArea = v6 * v7 * 0.04;
  }
  return v5;
}

+ (void)filterZonesInPage:(id)a3
{
  uint64_t v4 = [a3 firstDescendantOfClass:objc_opt_class()];
  if (v4)
  {
    uint64_t v5 = v4;
    double v6 = [[CPZoneFilter alloc] initWithPage:a3];
    [(CPZoneFilter *)v6 filterZonesInZone:v5];
    [(CPZoneFilter *)v6 findBackgroundGraphicsInZone:v5];
    [(CPZoneFilter *)v6 findUsedGraphicsInZone:v5];
  }
}

@end