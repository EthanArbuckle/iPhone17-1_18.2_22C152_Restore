@interface PKStrokeGroupItem
- (void)refreshStrokesInDrawing:(id *)a1;
@end

@implementation PKStrokeGroupItem

- (void)refreshStrokesInDrawing:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = a1[2];
    v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = a1[2];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "_strokeUUID", (void)v15);
          v12 = [v3 _visibleStrokeForIdentifier:v11];

          if (v12) {
            [v6 addObject:v12];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v6 count];
    if (v13 == [a1[2] count]) {
      objc_setProperty_nonatomic_copy(a1, v14, v6, 16);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);

  objc_storeStrong((id *)&self->_strokeGroupItem, 0);
}

@end