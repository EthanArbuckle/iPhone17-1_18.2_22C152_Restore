@interface CUIKSingleDayTimelineOccurrenceBucket
+ (CGRect)roundRectToScreenScaleForRect:(CGRect)a3 screenUtilsDelegate:(id)a4;
- (BOOL)isOnlyBucket;
- (CUIKSingleDayTimelineGeometryDelegate)geometryDelegate;
- (CUIKSingleDayTimelineLayoutPartition)correspondingPartition;
- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5;
- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5 geometryDelegate:(id)a6;
- (NSArray)occurrences;
- (NSMutableArray)currentOccurrences;
- (id)_occurrencesForFitnessLevel;
- (id)earliestOccurrence;
- (void)addOccurrenceTemporarilyToBeginning:(id)a3;
- (void)addOccurrenceTemporarilyToEnd:(id)a3;
- (void)makeTemporaryChangesPermanent;
- (void)removeOccurrenceAtBeginningTemporarily;
- (void)removeOccurrenceAtEndTemporarily;
- (void)revertTemporaryChanges;
- (void)setCorrespondingPartition:(id)a3;
- (void)setCurrentOccurrences:(id)a3;
- (void)setGeometryDelegate:(id)a3;
- (void)setIsOnlyBucket:(BOOL)a3;
- (void)stampFramesOntoOccurrences;
@end

@implementation CUIKSingleDayTimelineOccurrenceBucket

void __68__CUIKSingleDayTimelineOccurrenceBucket__occurrencesForFitnessLevel__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if ((a3 || !*(unsigned char *)(v6 + 64)) && (!*(unsigned char *)(v6 + 65) || *(void *)(a1 + 48) != a3))
  {
    id v7 = v5;
    [*(id *)(a1 + 40) addObject:v5];
    id v5 = v7;
  }
}

- (void)setIsOnlyBucket:(BOOL)a3
{
  self->_isOnlyBucket = a3;
}

- (NSArray)occurrences
{
  v2 = (void *)[(NSMutableArray *)self->_currentOccurrences copy];

  return (NSArray *)v2;
}

- (void)stampFramesOntoOccurrences
{
  v3 = [(CUIKSingleDayTimelineOccurrenceBucket *)self correspondingPartition];
  [v3 freeSpaceWidth];
  double v5 = v4;
  uint64_t v6 = [(CUIKSingleDayTimelineOccurrenceBucket *)self _occurrencesForFitnessLevel];
  unint64_t v7 = [v6 count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  if (WeakRetained
    && (v9 = WeakRetained,
        id v10 = objc_loadWeakRetained((id *)&self->_geometryDelegate),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
    int v13 = [v12 shouldReverseLayoutDirection];
  }
  else
  {
    int v13 = 0;
  }
  id v14 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
  [v14 RoundToScreenScale:v5 / (double)v7];
  uint64_t v16 = v15;

  [v3 freeSpaceStartBoundary];
  uint64_t v18 = v17;
  BOOL v19 = [(CUIKSingleDayTimelineOccurrenceBucket *)self isOnlyBucket];
  BOOL v20 = [(CUIKSingleDayTimelineOccurrenceBucket *)self isOnlyBucket];
  if (v13)
  {
    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
      [v3 initialStartBoundary];
      double v23 = v22;
      [v3 totalWidth];
      double v25 = -0.5;
LABEL_10:
      [v21 RoundToScreenScale:v23 + v24 * v25];
      double v5 = v27;
    }
  }
  else
  {
    double v5 = 0.0;
    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
      [v3 initialStartBoundary];
      double v23 = v26;
      [v3 totalWidth];
      double v25 = 0.5;
      goto LABEL_10;
    }
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__7;
  v41[4] = __Block_byref_object_dispose__7;
  id v42 = 0;
  currentOccurrences = self->_currentOccurrences;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__CUIKSingleDayTimelineOccurrenceBucket_stampFramesOntoOccurrences__block_invoke;
  v30[3] = &unk_1E636A9D8;
  v33 = v41;
  uint64_t v34 = v18;
  BOOL v39 = v19;
  unint64_t v35 = v7;
  double v36 = v5;
  unint64_t v37 = v7 - 1;
  id v29 = v3;
  id v31 = v29;
  v32 = self;
  uint64_t v38 = v16;
  char v40 = v13;
  [(NSMutableArray *)currentOccurrences enumerateObjectsUsingBlock:v30];

  _Block_object_dispose(v41, 8);
}

- (CUIKSingleDayTimelineLayoutPartition)correspondingPartition
{
  return self->_correspondingPartition;
}

- (BOOL)isOnlyBucket
{
  return self->_isOnlyBucket;
}

- (id)earliestOccurrence
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  id v10 = __Block_byref_object_dispose__7;
  id v11 = 0;
  v2 = [(CUIKSingleDayTimelineOccurrenceBucket *)self _occurrencesForFitnessLevel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__CUIKSingleDayTimelineOccurrenceBucket_earliestOccurrence__block_invoke;
  v5[3] = &unk_1E636A9B0;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_occurrencesForFitnessLevel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = v3;
  if (self->_temporaryOccurrenceAtBeginning) {
    objc_msgSend(v3, "addObject:");
  }
  uint64_t v5 = [(NSMutableArray *)self->_currentOccurrences count];
  uint64_t v6 = v5 - 1;
  currentOccurrences = self->_currentOccurrences;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CUIKSingleDayTimelineOccurrenceBucket__occurrencesForFitnessLevel__block_invoke;
  v12[3] = &unk_1E636A988;
  if (!v5) {
    uint64_t v6 = 0;
  }
  v12[4] = self;
  uint64_t v14 = v6;
  id v8 = v4;
  id v13 = v8;
  [(NSMutableArray *)currentOccurrences enumerateObjectsUsingBlock:v12];
  if (self->_temporaryOccurrenceAtEnd) {
    objc_msgSend(v8, "addObject:");
  }
  v9 = v13;
  id v10 = v8;

  return v10;
}

- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5 geometryDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CUIKSingleDayTimelineOccurrenceBucket;
  uint64_t v14 = [(CUIKSingleDayTimelineOccurrenceBucket *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 mutableCopy];
    currentOccurrences = v14->_currentOccurrences;
    v14->_currentOccurrences = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_correspondingPartition, a4);
    v14->_temporaryFitnessLevelRequiresCalculation = 1;
    v14->_originalFitnessLevelRequiresCalculation = 1;
    objc_storeWeak((id *)&v14->_screenUtilsDelegate, v12);
    objc_storeWeak((id *)&v14->_geometryDelegate, v13);
  }

  return v14;
}

void __67__CUIKSingleDayTimelineOccurrenceBucket_stampFramesOntoOccurrences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v30 = a2;
  [v30 stagedFrame];
  double v6 = v5;
  double v8 = v7;
  v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v9)
  {
    [v9 floatValue];
    double v11 = v10;
    if (a3) {
      goto LABEL_8;
    }
  }
  else
  {
    double v11 = *(double *)(a1 + 56);
    if (a3) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)(a1 + 96) && *(void *)(a1 + 64) == 2)
  {
    double v12 = *(double *)(a1 + 72);
    goto LABEL_10;
  }
LABEL_8:
  if (*(void *)(a1 + 80) == a3)
  {
    [*(id *)(a1 + 32) endBoundary];
LABEL_10:
    double v13 = v12 - v11;
    if (v13 >= 0.0) {
      double v14 = v13;
    }
    else {
      double v14 = -v13;
    }
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [WeakRetained RoundToScreenScale:*(double *)(a1 + 88)];
  double v14 = v16;

LABEL_14:
  int v17 = *(unsigned __int8 *)(a1 + 97);
  id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  BOOL v19 = v18;
  if (v17)
  {
    [v18 RoundToScreenScale:v11 - v14];
    double v21 = v20;

    double v22 = NSNumber;
    v32.origin.x = v21;
    v32.origin.y = v6;
    v32.size.width = v14;
    v32.size.height = v8;
    double MinX = CGRectGetMinX(v32);
  }
  else
  {
    [v18 RoundToScreenScale:v11];
    double v21 = v24;

    double v22 = NSNumber;
    v33.origin.x = v21;
    v33.origin.y = v6;
    v33.size.width = v14;
    v33.size.height = v8;
    double MinX = CGRectGetMaxX(v33);
  }
  uint64_t v25 = [v22 numberWithDouble:MinX];
  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
  double v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  v28 = objc_opt_class();
  id v29 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  objc_msgSend(v28, "roundRectToScreenScaleForRect:screenUtilsDelegate:", v29, v21, v6, v14, v8);
  objc_msgSend(v30, "setStagedFrame:");

  [v30 stagedFrame];
  objc_msgSend(v30, "setUnPinnedViewFrame:");
}

+ (CGRect)roundRectToScreenScaleForRect:(CGRect)a3 screenUtilsDelegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  [v8 RoundToScreenScale:x];
  double v10 = v9;
  [v8 RoundToScreenScale:y];
  double v12 = v11;
  [v8 RoundToScreenScale:width];
  double v14 = v13;
  [v8 RoundToScreenScale:height];
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOccurrences, 0);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_correspondingPartition, 0);
  objc_destroyWeak((id *)&self->_screenUtilsDelegate);
  objc_storeStrong((id *)&self->_temporaryOccurrenceAtEnd, 0);

  objc_storeStrong((id *)&self->_temporaryOccurrenceAtBeginning, 0);
}

void __59__CUIKSingleDayTimelineOccurrenceBucket_earliestOccurrence__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  double v6 = (id *)(v5 + 40);
  id v11 = v4;
  if (v7)
  {
    id v8 = [v4 start];
    double v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) start];
    uint64_t v10 = [v8 compare:v9];

    if (v10 != -1) {
      goto LABEL_5;
    }
    double v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5
{
  return [(CUIKSingleDayTimelineOccurrenceBucket *)self initWithOccurrences:a3 correspondingPartition:a4 screenUtilsDelegate:a5 geometryDelegate:0];
}

- (void)addOccurrenceTemporarilyToBeginning:(id)a3
{
  id v5 = a3;
  if (!self->_temporaryOccurrenceAtBeginning)
  {
    *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
    id v6 = v5;
    objc_storeStrong((id *)&self->_temporaryOccurrenceAtBeginning, a3);
    id v5 = v6;
  }
}

- (void)addOccurrenceTemporarilyToEnd:(id)a3
{
  id v5 = a3;
  if (!self->_temporaryOccurrenceAtBeginning)
  {
    *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
    id v6 = v5;
    objc_storeStrong((id *)&self->_temporaryOccurrenceAtEnd, a3);
    id v5 = v6;
  }
}

- (void)removeOccurrenceAtBeginningTemporarily
{
  *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
  self->_ignoreFirstOccurrenceInFitnessCalculations = 1;
}

- (void)removeOccurrenceAtEndTemporarily
{
  *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
  self->_ignoreLastOccurrenceInFitnessCalculations = 1;
}

- (void)revertTemporaryChanges
{
  self->_useTemporaryFitnessLevel = 0;
  temporaryOccurrenceAtBeginning = self->_temporaryOccurrenceAtBeginning;
  self->_temporaryOccurrenceAtBeginning = 0;

  temporaryOccurrenceAtEnd = self->_temporaryOccurrenceAtEnd;
  self->_temporaryOccurrenceAtEnd = 0;

  *(_WORD *)&self->_ignoreFirstOccurrenceInFitnessCalculations = 0;
}

- (void)makeTemporaryChangesPermanent
{
  self->_useTemporaryFitnessLevel = 0;
  temporaryOccurrenceAtBeginning = self->_temporaryOccurrenceAtBeginning;
  if (temporaryOccurrenceAtBeginning)
  {
    [(NSMutableArray *)self->_currentOccurrences insertObject:temporaryOccurrenceAtBeginning atIndex:0];
    id v4 = self->_temporaryOccurrenceAtBeginning;
    self->_temporaryOccurrenceAtBeginning = 0;
  }
  if (self->_temporaryOccurrenceAtEnd)
  {
    -[NSMutableArray addObject:](self->_currentOccurrences, "addObject:");
    temporaryOccurrenceAtEnd = self->_temporaryOccurrenceAtEnd;
    self->_temporaryOccurrenceAtEnd = 0;
  }
  if (self->_ignoreFirstOccurrenceInFitnessCalculations)
  {
    if ([(NSMutableArray *)self->_currentOccurrences count]) {
      [(NSMutableArray *)self->_currentOccurrences removeObjectAtIndex:0];
    }
    self->_ignoreFirstOccurrenceInFitnessCalculations = 0;
  }
  if (self->_ignoreLastOccurrenceInFitnessCalculations)
  {
    if ([(NSMutableArray *)self->_currentOccurrences count]) {
      [(NSMutableArray *)self->_currentOccurrences removeLastObject];
    }
    self->_ignoreLastOccurrenceInFitnessCalculations = 0;
  }
}

- (void)setCorrespondingPartition:(id)a3
{
}

- (CUIKSingleDayTimelineGeometryDelegate)geometryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);

  return (CUIKSingleDayTimelineGeometryDelegate *)WeakRetained;
}

- (void)setGeometryDelegate:(id)a3
{
}

- (NSMutableArray)currentOccurrences
{
  return self->_currentOccurrences;
}

- (void)setCurrentOccurrences:(id)a3
{
}

@end