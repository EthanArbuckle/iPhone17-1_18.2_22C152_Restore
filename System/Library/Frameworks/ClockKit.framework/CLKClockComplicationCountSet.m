@interface CLKClockComplicationCountSet
- (BOOL)isEqual:(id)a3;
- (CLKClockComplicationCountSet)init;
- (NSOrderedSet)orderedSet;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendCount:(id)a3;
- (void)mergeSet:(id)a3;
@end

@implementation CLKClockComplicationCountSet

- (CLKClockComplicationCountSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKClockComplicationCountSet;
  v2 = [(CLKClockComplicationCountSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    orderedSet = v2->_orderedSet;
    v2->_orderedSet = (NSMutableOrderedSet *)v3;
  }
  return v2;
}

- (void)appendCount:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  orderedSet = self->_orderedSet;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__CLKClockComplicationCountSet_appendCount___block_invoke;
  v9[3] = &unk_26440E9F0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v13;
  v12 = &v19;
  [(NSMutableOrderedSet *)orderedSet enumerateObjectsUsingBlock:v9];
  v7 = (void *)v14[5];
  if (v7)
  {
    v8 = [v7 mergedWith:v6];
    [(NSMutableOrderedSet *)self->_orderedSet replaceObjectAtIndex:v20[3] withObject:v8];
  }
  else
  {
    [(NSMutableOrderedSet *)self->_orderedSet addObject:v6];
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __44__CLKClockComplicationCountSet_appendCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v8 = [*(id *)(a1 + 32) applicationIdentifier];
  v9 = [v11 applicationIdentifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)mergeSet:(id)a3
{
  id v4 = [a3 orderedSet];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__CLKClockComplicationCountSet_mergeSet___block_invoke;
  v5[3] = &unk_26440EA18;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

uint64_t __41__CLKClockComplicationCountSet_mergeSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendCount:a2];
}

- (NSOrderedSet)orderedSet
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_orderedSet copy];

  return (NSOrderedSet *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSMutableOrderedSet *)self->_orderedSet isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableOrderedSet *)self->_orderedSet hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[CLKClockComplicationCountSet allocWithZone:a3] init];
  uint64_t v5 = [(NSMutableOrderedSet *)self->_orderedSet mutableCopy];
  orderedSet = v4->_orderedSet;
  v4->_orderedSet = (NSMutableOrderedSet *)v5;

  return v4;
}

- (void).cxx_destruct
{
}

@end