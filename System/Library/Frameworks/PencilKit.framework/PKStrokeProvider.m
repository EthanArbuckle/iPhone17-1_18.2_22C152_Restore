@interface PKStrokeProvider
+ (id)_identifiersForStrokes:(id)a3;
+ (id)slicesForStrokes:(id)a3;
- (BOOL)enumerateChangesSinceVersion:(id)a3 usingBlock:(id)a4;
- (BOOL)isStroke:(id)a3 versionOfStrokeWithIdentifier:(id)a4;
- (BOOL)isValidStrokeIdentifier:(id)a3;
- (CGSize)drawingCanvasSize;
- (CHStrokeProviderVersion)strokeProviderVersion;
- (NSArray)orderedStrokes;
- (NSOrderedSet)visibleStrokeEncodedIdentifiers;
- (NSString)description;
- (PKDrawing)drawing;
- (PKStrokeProvider)initWithDrawing:(id)a3;
- (PKStrokeProvider)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 shouldProcessVisibleStrokes:(BOOL)a5 transcriptionCache:(id)a6;
- (id)_cachedStrokeIdentifier:(id)a3;
- (id)cachedTranscriptionForStrokeGroup:(id)a3;
- (id)cachedTranscriptionsIntersectingStrokeGroup:(id)a3;
- (id)encodedStrokeIdentifier:(id)a3;
- (id)sliceForIdentifier:(id)a3;
- (id)slices;
- (id)strokeForIdentifier:(id)a3;
- (id)strokeIdentifierFromData:(id)a3;
- (int64_t)compareOrderOfStroke:(id)a3 toStroke:(id)a4;
- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4;
- (int64_t)groupingPriority;
- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4;
- (void)_cacheStrokeIdentifier:(id)a3 withEncodedStrokeIdentifier:(id)a4;
- (void)updateTranscriptionCache:(id)a3;
@end

@implementation PKStrokeProvider

- (PKStrokeProvider)initWithDrawing:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKStrokeProvider;
  v5 = [(PKStrokeProvider *)&v14 init];
  uint64_t v6 = [v4 copy];
  drawing = v5->_drawing;
  v5->_drawing = (PKDrawing *)v6;

  v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5->_disabled = [v8 BOOLForKey:@"PKDrawingRecognitionDisableUpdates"];

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  strokeIdsByEncoding = v5->_strokeIdsByEncoding;
  v5->_strokeIdsByEncoding = v9;

  v11 = objc_alloc_init(PKHandwritingTranscriptionCache);
  transcriptionCache = v5->_transcriptionCache;
  v5->_transcriptionCache = v11;

  return v5;
}

- (PKStrokeProvider)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 shouldProcessVisibleStrokes:(BOOL)a5 transcriptionCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(PKStrokeProvider *)self initWithDrawing:v10];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    visibleOnscreenStrokes = v13->_visibleOnscreenStrokes;
    v13->_visibleOnscreenStrokes = (NSArray *)v14;

    v13->_shouldProcessVisibleStrokes = a5;
    uint64_t v16 = [v12 copy];
    transcriptionCache = v13->_transcriptionCache;
    v13->_transcriptionCache = (PKHandwritingTranscriptionCache *)v16;
  }
  return v13;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)PKStrokeProvider;
  v3 = [(PKStrokeProvider *)&v8 description];
  id v4 = [(PKStrokeProvider *)self strokeProviderVersion];
  v5 = [(PKStrokeProvider *)self orderedStrokes];
  uint64_t v6 = [v3 stringByAppendingFormat:@" version: %@, strokes: %ld", v4, objc_msgSend(v5, "count")];

  return (NSString *)v6;
}

- (id)cachedTranscriptionForStrokeGroup:(id)a3
{
  v3 = [(PKHandwritingTranscriptionCache *)self->_transcriptionCache cachedTranscriptionForStrokeGroup:a3];

  return v3;
}

- (id)cachedTranscriptionsIntersectingStrokeGroup:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v4 = [(PKHandwritingTranscriptionCache *)self->_transcriptionCache allCachedGroups];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__PKStrokeProvider_cachedTranscriptionsIntersectingStrokeGroup___block_invoke;
  v21[3] = &unk_1E64C8080;
  id v5 = v16;
  id v22 = v5;
  uint64_t v6 = [v4 indexesOfObjectsPassingTest:v21];

  if ([v6 count])
  {
    v7 = [(PKHandwritingTranscriptionCache *)self->_transcriptionCache allCachedGroups];
    objc_super v8 = [v7 objectsAtIndexes:v6];

    v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [(PKHandwritingTranscriptionCache *)self->_transcriptionCache cachedTranscriptionForStrokeGroup:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v14) {
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __64__PKStrokeProvider_cachedTranscriptionsIntersectingStrokeGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 intersectsSet:*(void *)(a1 + 32)];
}

- (void)updateTranscriptionCache:(id)a3
{
  id v6 = a3;
  id v4 = (PKHandwritingTranscriptionCache *)[v6 copy];
  transcriptionCache = self->_transcriptionCache;
  self->_transcriptionCache = v4;
}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  v2 = [(PKStrokeProvider *)self drawing];
  v3 = [v2 version];

  return (CHStrokeProviderVersion *)v3;
}

- (id)slices
{
  v2 = self;
  objc_sync_enter(v2);
  strokeSlices = v2->_strokeSlices;
  if (strokeSlices)
  {
    id v4 = strokeSlices;
  }
  else
  {
    if (v2->_shouldProcessVisibleStrokes)
    {
      id v5 = v2->_visibleOnscreenStrokes;
    }
    else
    {
      id v6 = [(PKStrokeProvider *)v2 drawing];
      id v5 = [v6 strokes];
    }
    uint64_t v7 = [(id)objc_opt_class() slicesForStrokes:v5];
    objc_super v8 = v2->_strokeSlices;
    v2->_strokeSlices = (NSMutableOrderedSet *)v7;

    id v4 = v2->_strokeSlices;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (id)slicesForStrokes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v18, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v18;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 = [v8 _strokeMask];
        BOOL v10 = v9 == 0;

        if (v10)
        {
          id v16 = -[PKStrokeProviderSlice initWithStroke:tStart:tEnd:]([PKStrokeProviderSlice alloc], "initWithStroke:tStart:tEnd:", v8, 0.0, (double)(unint64_t)[v8 _pointsCount]);
          [v3 addObject:v16];
        }
        else
        {
          uint64_t v11 = [v8 _strokeMask];
          uint64_t v12 = (double **)[v11 centerlineSlices];

          v13 = *v12;
          uint64_t v14 = v12[1];
          while (v13 != v14)
          {
            v15 = [[PKStrokeProviderSlice alloc] initWithStroke:v8 tStart:*v13 tEnd:v13[1]];
            [v3 addObject:v15];

            v13 += 2;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSArray)orderedStrokes
{
  if (self->_disabled)
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKStrokeProvider *)self slices];
    v2 = [v3 array];
  }

  return (NSArray *)v2;
}

- (BOOL)enumerateChangesSinceVersion:(id)a3 usingBlock:(id)a4
{
  return 0;
}

- (int64_t)compareOrderOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(PKStrokeProvider *)self slices];
  v9 = [[PKStrokeProviderSlice alloc] initWithIdentifier:v6];
  unint64_t v10 = [v8 indexOfObject:v9];

  uint64_t v11 = [[PKStrokeProviderSlice alloc] initWithIdentifier:v7];
  unint64_t v12 = [v8 indexOfObject:v11];

  if (v10 < v12) {
    int64_t v13 = -1;
  }
  else {
    int64_t v13 = v10 != v12;
  }

  return v13;
}

- (unint64_t)compareStyleOfStrokeWithIdentifier:(id)a3 toStrokeWithIdentifier:(id)a4
{
  id v6 = a4;
  v25 = [(PKStrokeProvider *)self strokeForIdentifier:a3];
  id v7 = [(PKStrokeProvider *)self strokeForIdentifier:v6];
  objc_super v8 = [v25 stroke];
  v9 = [v7 stroke];
  unint64_t v10 = [v8 ink];
  uint64_t v11 = [v9 ink];
  unint64_t v12 = [v10 identifier];
  int64_t v13 = [v11 identifier];
  LODWORD(v17) = [v12 isEqual:v13];

  id v14 = [v10 color];
  v15 = (CGColor *)[v14 CGColor];
  id v16 = [v11 color];
  LODWORD(v15) = CGColorEqualToColor(v15, (CGColorRef)[v16 CGColor]);
  unint64_t v17 = v17;

  if (v15) {
    unint64_t v17 = v17 | 2;
  }
  [v8 _maxWidthForStroke];
  double v19 = v18;
  [v9 _maxWidthForStroke];
  if (vabdd_f64(v19, v20) < 3.0)
  {
    [v10 weight];
    double v22 = v21;
    [v11 weight];
    if (v22 == v23) {
      v17 |= 4uLL;
    }
  }

  return v17;
}

- (CGSize)drawingCanvasSize
{
  [(PKDrawing *)self->_drawing bounds];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (int64_t)compareOrderOfStroke:(id)a3 toStroke:(id)a4
{
  return [a3 compareTo:a4];
}

- (BOOL)isStroke:(id)a3 versionOfStrokeWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [a3 identifier];
  id v7 = v5;
  objc_super v8 = [v7 strokeUUID];
  if (v8)
  {
    v9 = [v6 strokeUUID];
    unint64_t v10 = [v7 strokeUUID];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isValidStrokeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKStrokeProvider *)self slices];
  id v6 = [[PKStrokeProviderSlice alloc] initWithIdentifier:v4];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (id)strokeForIdentifier:(id)a3
{
  double v3 = [(PKStrokeProvider *)self sliceForIdentifier:a3];

  return v3;
}

- (void)_cacheStrokeIdentifier:(id)a3 withEncodedStrokeIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  char v7 = self;
  objc_sync_enter(v7);
  if (v9)
  {
    if (v6)
    {
      objc_super v8 = [(NSMutableDictionary *)v7->_strokeIdsByEncoding objectForKey:v6];

      if (!v8) {
        [(NSMutableDictionary *)v7->_strokeIdsByEncoding setObject:v9 forKey:v6];
      }
    }
  }
  objc_sync_exit(v7);
}

- (id)_cachedStrokeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id v6 = [(NSMutableDictionary *)v5->_strokeIdsByEncoding objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)strokeIdentifierFromData:(id)a3
{
  id v4 = a3;
  id v5 = [(PKStrokeProvider *)self _cachedStrokeIdentifier:v4];
  if (!v5)
  {
    if (_MergedGlobals_135 != -1) {
      dispatch_once(&_MergedGlobals_135, &__block_literal_global_42);
    }
    id v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = qword_1EB3C5FB0;
    objc_super v8 = [v4 encodedStrokeIdentifier];
    id v11 = 0;
    id v5 = [v6 unarchivedObjectOfClasses:v7 fromData:v8 error:&v11];
    id v9 = v11;

    [(PKStrokeProvider *)self _cacheStrokeIdentifier:v5 withEncodedStrokeIdentifier:v4];
  }

  return v5;
}

void __45__PKStrokeProvider_strokeIdentifierFromData___block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  Class v0 = NSClassFromString(&cfstr_Pkstrokeprovid.isa);
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  if (v0)
  {
    v8[0] = v2;
    v8[1] = v0;
    double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    uint64_t v4 = [v1 setWithArray:v3];
    id v5 = (void *)qword_1EB3C5FB0;
    qword_1EB3C5FB0 = v4;
  }
  else
  {
    uint64_t v6 = [v1 setWithObject:v2];
    uint64_t v7 = (void *)qword_1EB3C5FB0;
    qword_1EB3C5FB0 = v6;
  }
}

- (id)encodedStrokeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKStrokeProvider *)self strokeForIdentifier:v4];
  uint64_t v6 = v5;
  if (!v5 || ([v5 encodedStrokeIdentifier], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v14 = 0;
    objc_super v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v14];
    id v9 = v14;
    if (v8) {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F5C048]) initWithData:v8];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  [(PKStrokeProvider *)self _cacheStrokeIdentifier:v4 withEncodedStrokeIdentifier:v7];
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F5C048]);
    unint64_t v12 = [MEMORY[0x1E4F1C9B8] data];
    id v10 = (id)[v11 initWithData:v12];
  }

  return v10;
}

- (NSOrderedSet)visibleStrokeEncodedIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:self->_visibleOnscreenStrokes];
  id v4 = (void *)MEMORY[0x1E4F1CAA0];
  id v5 = [(PKStrokeProvider *)self drawing];
  uint64_t v6 = [v5 strokes];
  uint64_t v7 = [v4 orderedSetWithArray:v6];
  [v3 intersectOrderedSet:v7];

  objc_super v8 = +[PKStrokeProvider _identifiersForStrokes:v3];
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v8, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = -[PKStrokeProvider encodedStrokeIdentifier:](self, "encodedStrokeIdentifier:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v9 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (NSOrderedSet *)v9;
}

- (id)sliceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKStrokeProvider *)self slices];
  uint64_t v6 = [[PKStrokeProviderSlice alloc] initWithIdentifier:v4];
  uint64_t v7 = [v5 indexOfObject:v6];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = 0;
  }
  else
  {
    objc_super v8 = [v5 objectAtIndexedSubscript:v7];
  }

  return v8;
}

+ (id)_identifiersForStrokes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [a3 array];
  id v4 = +[PKStrokeProvider slicesForStrokes:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "strokeIdentifier", (void)v12);
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (int64_t)groupingPriority
{
  return self->groupingPriority;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_transcriptionCache, 0);
  objc_storeStrong((id *)&self->_strokeIdsByEncoding, 0);
  objc_storeStrong((id *)&self->_visibleOnscreenStrokes, 0);

  objc_storeStrong((id *)&self->_strokeSlices, 0);
}

@end