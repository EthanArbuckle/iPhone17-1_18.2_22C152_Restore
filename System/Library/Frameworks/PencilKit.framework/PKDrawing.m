@interface PKDrawing
+ (BOOL)supportsSecureCoding;
+ (CGRect)_boundingBoxForStrokeArray:(id)a3;
+ (CGRect)_boundingBoxForStrokes:(id)a3;
+ (Class)drawingClassForPaper;
+ (PKDrawing)allocWithZone:(_NSZone *)a3;
+ (PKDrawing)drawingWithData:(id)a3;
+ (id)_findLeftmostStrokes:(id)a3;
+ (id)_findRightmostStrokes:(id)a3;
+ (id)_otherStrokesCloseToLeft:(BOOL)a3 forStrokes:(id)a4 withClosestStroke:(id)a5;
+ (id)_upgradeDrawingData:(id)a3 queue:(id)a4 completionBlock:(id)a5;
+ (id)_uuidDescriptionForStrokes:(id)a3;
+ (id)drawingStrokesFromStrokes:(id)a3 inDrawing:(id)a4;
+ (id)fileType;
+ (id)visibleStrokesFromStrokes:(id)a3 inDrawing:(id)a4;
+ (int64_t)_currentSerializationVersion;
+ (void)sortStrokes:(id)a3;
- (BOOL)_isEmpty;
- (BOOL)_newAsciiBitfield;
- (BOOL)containsInternalStrokes;
- (BOOL)isEqual:(id)a3;
- (BOOL)recognitionEnabled;
- (BOOL)shouldClearSelectionAfterStraightening;
- (CGAffineTransform)_transformForImageWithSize:(SEL)a3;
- (CGRect)_canvasBounds;
- (CGRect)_eraserStrokeBounds;
- (CGRect)bounds;
- (CGRect)calculateStrokeBounds;
- (CGSize)_orientedDrawingSize;
- (CHRecognitionSession)recognitionSession;
- (Class)classForCoder;
- (Class)strokeClass;
- (Class)strokeSelectionClass;
- (NSArray)strokes;
- (NSData)dataRepresentation;
- (NSMapTable)ongoingQueries;
- (NSMutableArray)_cachedVisibleStrokes;
- (NSString)description;
- (NSUUID)uuid;
- (PKContentVersion)requiredContentVersion;
- (PKDrawing)drawingByAppendingDrawing:(PKDrawing *)drawing;
- (PKDrawing)drawingByAppendingStrokes:(NSArray *)strokes;
- (PKDrawing)drawingByApplyingTransform:(CGAffineTransform *)transform;
- (PKDrawing)init;
- (PKDrawing)initWithCoder:(id)a3;
- (PKDrawing)initWithData:(NSData *)data error:(NSError *)error;
- (PKDrawing)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5;
- (PKDrawing)initWithDrawing:(id)a3;
- (PKDrawing)initWithStrokes:(NSArray *)strokes;
- (PKDrawing)initWithStrokes:(id)a3 fromDrawing:(id)a4;
- (PKRecognitionSessionManager)recognitionManager;
- (PKVisualizationManager)visualizationManager;
- (UIImage)imageFromRect:(CGRect)rect scale:(CGFloat)scale;
- (id)CHDrawing;
- (id)_addStroke:(id)a3;
- (id)_ascii;
- (id)_clipAgainstLegacyCanvas:(id)a3;
- (id)_clipStroke:(id)a3 againstPaths:(const void *)a4;
- (id)_clipStroke:(id)a3 newRootStroke:(id *)a4;
- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4;
- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 newParent:(id *)a6;
- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5 ink:(id)a6 newParent:(id *)a7;
- (id)_originalDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5 shouldUseStrokeDataUUID:(BOOL)a6;
- (id)_originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5;
- (id)_originalStrokeUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5;
- (id)_rootStrokes;
- (id)_strokeForIdentifier:(id)a3;
- (id)_strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 transform:(CGAffineTransform *)a5;
- (id)_unclippedStroke:(id)a3;
- (id)_visibleStrokeForIdentifier:(id)a3;
- (id)clipStroke:(id)a3 onPlane:(id)a4 renderMask:(id)a5;
- (id)copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutInternalStrokes;
- (id)debugQuickLookObject;
- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4;
- (id)forcedRecognitionLocales;
- (id)indexableContent;
- (id)insertNewTestStroke;
- (id)intersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6;
- (id)intersectedStrokesFromRect:(CGRect)a3 visibleOnscreenStrokes:(id)a4;
- (id)intersectedStrokesFromStroke:(id)a3 visibleOnscreenStrokes:(id)a4;
- (id)intersectedStrokesTest:(id)a3 inBounds:(CGRect)a4 visibleOnscreenStrokes:(id)a5;
- (id)newStroke;
- (id)setStroke:(id)a3 hidden:(BOOL)a4;
- (id)setStroke:(id)a3 ink:(id)a4;
- (id)setStroke:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (id)sliceWithEraseStroke:(id)a3;
- (id)strokesForCHStrokeIdentifiers:(id)a3;
- (id)strokesForCHStrokeIdentifiers:(id)a3 didFindAllStrokes:(BOOL *)a4;
- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 minThreshold:(double)a5 transform:(CGAffineTransform *)a6 onscreenVisibleStrokes:(id)a7;
- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 onscreenVisibleStrokes:(id)a5;
- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5;
- (id)undoableAddNewStrokes:(id)a3;
- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4;
- (id)undoableDeleteStrokes:(id)a3;
- (id)undoableMergeWithDrawing:(id)a3;
- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5;
- (id)undoableSetStrokes:(id)a3 inks:(id)a4;
- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6;
- (id)updateStroke:(id)a3 updater:(id)a4;
- (id)version;
- (id)visibleStrokeForInsertingStroke:(id)a3;
- (int64_t)_minimumSerializationVersion;
- (int64_t)_orientation;
- (int64_t)_rootStrokesCount;
- (unint64_t)hash;
- (unint64_t)mergeWithDrawing:(id)a3;
- (void)_clipMaskedStrokes;
- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4;
- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5;
- (void)_eraseWithEraserStroke:(id)a3;
- (void)_imageInRect:(CGRect)a3 scale:(double)a4 completionHandler:(id)a5;
- (void)_removeStroke:(id)a3;
- (void)_setAllStrokes:(id)a3;
- (void)_setUUID:(id)a3;
- (void)_teardownRecognitionObjects;
- (void)_transformAllStrokes:(CGAffineTransform *)a3;
- (void)_updateRecognitionSession;
- (void)_upgradeLegacyPenInks;
- (void)addNewStroke:(id)a3;
- (void)cancelOngoingRecognitionRequests;
- (void)clipStrokesIfNeededOnQueue:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteStrokes:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchIntersectedStrokesBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleOnscreenStrokes:(id)a5 completion:(id)a6;
- (void)invalidateVisibleStrokes;
- (void)performSearchQuery:(id)a3 fullWordsOnly:(BOOL)a4 caseMatchingOnly:(BOOL)a5 withBlock:(id)a6;
- (void)performSearchQuery:(id)a3 withBlock:(id)a4;
- (void)queryDidUpdateResult:(id)a3;
- (void)setForcedRecognitionLocales:(id)a3;
- (void)setNeedsRecognitionUpdate;
- (void)setOngoingQueries:(id)a3;
- (void)setRecognitionEnabled:(BOOL)a3;
- (void)setRecognitionManager:(id)a3;
- (void)setRecognitionSession:(id)a3;
- (void)setStrokeSubstrokes:(id)a3;
- (void)setStrokes:(id)a3 groupID:(id)a4;
- (void)setStrokes:(id)a3 hidden:(BOOL)a4;
- (void)setStrokes:(id)a3 inks:(id)a4;
- (void)setStrokes:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (void)setVisualizationManager:(id)a3;
- (void)set_cachedVisibleStrokes:(id)a3;
- (void)set_canvasBounds:(CGRect)a3;
- (void)set_orientation:(int64_t)a3;
- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (void)transformStrokes:(id)a3 withTransforms:(id)a4 concat:(BOOL)a5;
- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4;
- (void)updateStrokes:(id)a3;
@end

@implementation PKDrawing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationManager, 0);
  objc_storeStrong((id *)&self->_ongoingQueries, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
  objc_storeStrong((id *)&self->_recognitionManager, 0);
  objc_storeStrong((id *)&self->_cachedVisibleStrokes, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);

  objc_storeStrong((id *)&self->_forcedRecognitionLocales, 0);
}

+ (Class)drawingClassForPaper
{
  if (_MergedGlobals_128 != -1) {
    dispatch_once(&_MergedGlobals_128, &__block_literal_global_33);
  }
  v2 = (void *)qword_1EB3C5F28;

  return (Class)v2;
}

+ (PKDrawing)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (PKDrawing *)+[PKDrawing allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___PKDrawing;
    return (PKDrawing *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (int64_t)_currentSerializationVersion
{
  return 2;
}

Class __33__PKDrawing_drawingClassForPaper__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Pkdrawingcoher.isa);
  qword_1EB3C5F28 = (uint64_t)result;
  return result;
}

- (PKDrawing)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKDrawing;
  return [(PKDrawing *)&v3 init];
}

- (void)dealloc
{
  [(PKDrawing *)self _teardownRecognitionObjects];
  v3.receiver = self;
  v3.super_class = (Class)PKDrawing;
  [(PKDrawing *)&v3 dealloc];
}

- (void)_teardownRecognitionObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  recognitionManager = self->_recognitionManager;
  self->_recognitionManager = 0;

  recognitionSession = self->_recognitionSession;
  self->_recognitionSession = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_ongoingQueries;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8++), "setDelegate:", 0, (void)v13);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  ongoingQueries = self->_ongoingQueries;
  self->_ongoingQueries = 0;

  visualizationManager = self->_visualizationManager;
  p_visualizationManager = &self->_visualizationManager;
  [(PKVisualizationManager *)visualizationManager setDelegate:0];
  v12 = *p_visualizationManager;
  *p_visualizationManager = 0;
}

- (id)_unclippedStroke:(id)a3
{
  v4 = (void *)[a3 copyForMutation];
  [v4 _setClipPlane:0];
  [v4 _setRenderMask:0];
  [v4 didUpdateInDrawing:self];

  return v4;
}

- (id)_clipStroke:(id)a3 newRootStroke:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 _clipPlane];
  if (v7)
  {
    uint64_t v8 = (void *)[v6 copyForMutation];
    [v8 generateMask];
    [v8 _setClipPlane:0];
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v30[0] = *MEMORY[0x1E4F1DAB8];
    v30[1] = v9;
    v30[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v6 generateClipPaths:&v31 transform:v30];
    if (v32 == v31)
    {
      v21 = [(PKDrawing *)self _unclippedStroke:v6];
      id v22 = *a4;
      *a4 = v21;

      id v36 = *a4;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    }
    else
    {
      v10 = [v8 sliceWithEraser:&v31];
      if ([v10 count] != 1) {
        goto LABEL_7;
      }
      v11 = [v10 firstObject];
      v12 = [v11 _strokeUUID];
      long long v13 = [v8 _strokeUUID];
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        long long v15 = [(PKDrawing *)self _unclippedStroke:v6];
        id v16 = *a4;
        *a4 = v15;

        id v35 = *a4;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      }
      else
      {
LABEL_7:
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __49__PKDrawing_Clipping___clipStroke_newRootStroke___block_invoke;
        v27 = &unk_1E64C52C8;
        id v28 = v6;
        id v29 = v10;
        v20 = _Block_copy(&v24);
        v17 = objc_msgSend(v8, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", v20, self, a4, v24, v25, v26, v27);
      }
    }
    v34 = (void **)&v31;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v34);
  }
  else
  {
    uint64_t v18 = [(PKDrawing *)self _unclippedStroke:v6];
    id v19 = *a4;
    *a4 = v18;

    v37[0] = *a4;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  }

  return v17;
}

id __49__PKDrawing_Clipping___clipStroke_newRootStroke___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 _strokeUUID];
  v4 = [*(id *)(a1 + 32) _strokeUUID];
  int v5 = [v3 isEqual:v4];

  if (v5) {
    id v6 = *(id *)(a1 + 40);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_clipAgainstLegacyCanvas:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasSubstrokes])
  {
    int v5 = [v4 _substrokesInDrawing:self];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v83 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [(PKDrawing *)self _clipAgainstLegacyCanvas:*(void *)(*((void *)&v82 + 1) + 8 * i)];
          if (v11) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v82 objects:v88 count:16];
      }
      while (v8);
    }

    if ([v7 isEqualToArray:v6])
    {
      id v12 = v4;
    }
    else
    {
      id v12 = (id)[v4 _newStrokeWithSubstrokes:v6 inDrawing:self];
      [v12 didUpdateInDrawing:self];
    }
  }
  else
  {
    uint64_t v79 = 0;
    v80 = 0;
    unint64_t v81 = 0;
    __p = 0;
    v77 = 0;
    unint64_t v78 = 0;
    v91.size.width = 1024.0;
    v91.size.height = 768.0;
    v91.origin.x = 0.0;
    v91.origin.y = 0.0;
    double MinX = CGRectGetMinX(v91);
    v92.size.width = 1024.0;
    v92.size.height = 768.0;
    v92.origin.x = 0.0;
    v92.origin.y = 0.0;
    uint64_t v14 = (int)(CGRectGetMinY(v92) * 100.0);
    id v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, 1uLL);
    v17 = &v16[8 * ((v77 - (unsigned char *)__p) >> 3)];
    *(void *)v17 = (int)(MinX * 100.0);
    *((void *)v17 + 1) = v14;
    *((void *)v17 + 2) = 0x3F800000BF800000;
    __p = v17;
    unint64_t v78 = (unint64_t)&v16[24 * v15];
    v77 = v17 + 24;
    v93.size.width = 1024.0;
    v93.size.height = 768.0;
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    double MaxX = CGRectGetMaxX(v93);
    v94.size.width = 1024.0;
    v94.size.height = 768.0;
    v94.origin.x = 0.0;
    v94.origin.y = 0.0;
    uint64_t v19 = (int)(MaxX * 100.0);
    uint64_t v20 = (int)(CGRectGetMinY(v94) * 100.0);
    v21 = v77;
    if ((unint64_t)v77 >= v78)
    {
      v23 = (char *)__p;
      unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (unsigned char *)__p) >> 3) + 1;
      if (v24 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3) > v24) {
        unint64_t v24 = 0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (void)__p) >> 3) >= 0x555555555555555) {
        unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25)
      {
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v25);
        v23 = (char *)__p;
        v21 = v77;
      }
      else
      {
        v26 = 0;
      }
      v27 = &v26[8 * ((v77 - (unsigned char *)__p) >> 3)];
      id v28 = &v26[24 * v25];
      *(void *)v27 = v19;
      *((void *)v27 + 1) = v20;
      *((void *)v27 + 2) = 0x3F800000BF800000;
      id v22 = v27 + 24;
      if (v21 != v23)
      {
        do
        {
          long long v29 = *(_OWORD *)(v21 - 24);
          *((void *)v27 - 1) = *((void *)v21 - 1);
          *(_OWORD *)(v27 - 24) = v29;
          v27 -= 24;
          v21 -= 24;
        }
        while (v21 != v23);
        v23 = (char *)__p;
      }
      __p = v27;
      v77 = v22;
      unint64_t v78 = (unint64_t)v28;
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *(void *)v77 = v19;
      *((void *)v21 + 1) = v20;
      *((void *)v21 + 2) = 0x3F800000BF800000;
      id v22 = v21 + 24;
    }
    v77 = v22;
    v95.size.width = 1024.0;
    v95.size.height = 768.0;
    v95.origin.x = 0.0;
    v95.origin.y = 0.0;
    double v30 = CGRectGetMaxX(v95);
    v96.size.width = 1024.0;
    v96.size.height = 768.0;
    v96.origin.x = 0.0;
    v96.origin.y = 0.0;
    uint64_t v31 = (int)(v30 * 100.0);
    uint64_t v32 = (int)(CGRectGetMaxY(v96) * 100.0);
    uint64_t v33 = v77;
    if ((unint64_t)v77 >= v78)
    {
      id v35 = (char *)__p;
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (unsigned char *)__p) >> 3) + 1;
      if (v36 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3) > v36) {
        unint64_t v36 = 0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (void)__p) >> 3) >= 0x555555555555555) {
        unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37)
      {
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v37);
        id v35 = (char *)__p;
        uint64_t v33 = v77;
      }
      else
      {
        v38 = 0;
      }
      v39 = &v38[8 * ((v77 - (unsigned char *)__p) >> 3)];
      v40 = &v38[24 * v37];
      *(void *)v39 = v31;
      *((void *)v39 + 1) = v32;
      *((void *)v39 + 2) = 0x3F800000BF800000;
      v34 = v39 + 24;
      if (v33 != v35)
      {
        do
        {
          long long v41 = *(_OWORD *)(v33 - 24);
          *((void *)v39 - 1) = *((void *)v33 - 1);
          *(_OWORD *)(v39 - 24) = v41;
          v39 -= 24;
          v33 -= 24;
        }
        while (v33 != v35);
        id v35 = (char *)__p;
      }
      __p = v39;
      v77 = v34;
      unint64_t v78 = (unint64_t)v40;
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      *(void *)v77 = v31;
      *((void *)v33 + 1) = v32;
      *((void *)v33 + 2) = 0x3F800000BF800000;
      v34 = v33 + 24;
    }
    v77 = v34;
    v97.size.width = 1024.0;
    v97.size.height = 768.0;
    v97.origin.x = 0.0;
    v97.origin.y = 0.0;
    double v42 = CGRectGetMinX(v97);
    v98.size.width = 1024.0;
    v98.size.height = 768.0;
    v98.origin.x = 0.0;
    v98.origin.y = 0.0;
    uint64_t v43 = (int)(v42 * 100.0);
    uint64_t v44 = (int)(CGRectGetMaxY(v98) * 100.0);
    v46 = v77;
    v45 = (char *)v78;
    if ((unint64_t)v77 >= v78)
    {
      v48 = (char *)__p;
      unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * ((v77 - (unsigned char *)__p) >> 3) + 1;
      if (v49 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3) > v49) {
        unint64_t v49 = 0x5555555555555556 * ((uint64_t)(v78 - (void)__p) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v78 - (void)__p) >> 3) >= 0x555555555555555) {
        unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v50 = v49;
      }
      if (v50)
      {
        v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v50);
        v48 = (char *)__p;
        v46 = v77;
      }
      else
      {
        v51 = 0;
      }
      v52 = &v51[8 * ((v77 - (unsigned char *)__p) >> 3)];
      v45 = &v51[24 * v50];
      *(void *)v52 = v43;
      *((void *)v52 + 1) = v44;
      *((void *)v52 + 2) = 0x3F800000BF800000;
      v47 = v52 + 24;
      if (v46 != v48)
      {
        do
        {
          long long v53 = *(_OWORD *)(v46 - 24);
          *((void *)v52 - 1) = *((void *)v46 - 1);
          *(_OWORD *)(v52 - 24) = v53;
          v52 -= 24;
          v46 -= 24;
        }
        while (v46 != v48);
        v48 = (char *)__p;
      }
      __p = v52;
      v77 = v47;
      unint64_t v78 = (unint64_t)v45;
      if (v48)
      {
        operator delete(v48);
        v45 = (char *)v78;
      }
    }
    else
    {
      *(void *)v77 = v43;
      *((void *)v46 + 1) = v44;
      *((void *)v46 + 2) = 0x3F800000BF800000;
      v47 = v46 + 24;
    }
    v77 = v47;
    if (v47 >= v45)
    {
      unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((v47 - (unsigned char *)__p) >> 3);
      unint64_t v57 = v56 + 1;
      if (v56 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((v45 - (unsigned char *)__p) >> 3);
      if (2 * v58 > v57) {
        unint64_t v57 = 2 * v58;
      }
      if (v58 >= 0x555555555555555) {
        unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v59 = v57;
      }
      if (v59) {
        v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::IntPoint>>((uint64_t)&v78, v59);
      }
      else {
        v60 = 0;
      }
      v61 = &v60[24 * v56];
      v62 = &v60[24 * v59];
      long long v63 = *(_OWORD *)__p;
      *((void *)v61 + 2) = *((void *)__p + 2);
      *(_OWORD *)v61 = v63;
      v55 = v61 + 24;
      v65 = __p;
      v64 = v77;
      if (v77 != __p)
      {
        do
        {
          long long v66 = *(_OWORD *)(v64 - 3);
          *((void *)v61 - 1) = *(v64 - 1);
          *(_OWORD *)(v61 - 24) = v66;
          v61 -= 24;
          v64 -= 3;
        }
        while (v64 != v65);
        v64 = __p;
      }
      __p = v61;
      v77 = v55;
      unint64_t v78 = (unint64_t)v62;
      if (v64) {
        operator delete(v64);
      }
    }
    else
    {
      long long v54 = *(_OWORD *)__p;
      *((void *)v47 + 2) = *((void *)__p + 2);
      *(_OWORD *)v47 = v54;
      v55 = v47 + 24;
    }
    v77 = v55;
    if (ClipperLib::Area((uint64_t *)&__p) >= 0.0 && __p != v55)
    {
      v67 = v55 - 24;
      if (v55 - 24 > __p)
      {
        v68 = (char *)__p + 24;
        do
        {
          long long v86 = *(_OWORD *)(v68 - 24);
          long long v69 = v86;
          uint64_t v87 = *((void *)v68 - 1);
          uint64_t v70 = v87;
          uint64_t v71 = *((void *)v67 + 2);
          *(_OWORD *)(v68 - 24) = *(_OWORD *)v67;
          *((void *)v68 - 1) = v71;
          *((void *)v67 + 2) = v70;
          *(_OWORD *)v67 = v69;
          v67 -= 24;
          BOOL v72 = v68 >= v67;
          v68 += 24;
        }
        while (!v72);
      }
    }
    v73 = v80;
    if ((unint64_t)v80 >= v81)
    {
      uint64_t v74 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v79, (uint64_t)&__p);
    }
    else
    {
      void *v80 = 0;
      v73[1] = 0;
      v73[2] = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v73, __p, (uint64_t)v77, 0xAAAAAAAAAAAAAAABLL * ((v77 - (unsigned char *)__p) >> 3));
      uint64_t v74 = (uint64_t)(v73 + 3);
    }
    v80 = (void *)v74;
    -[PKDrawing _clipStroke:againstPaths:](self, "_clipStroke:againstPaths:", v4, &v79, __p);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (__p)
    {
      v77 = (char *)__p;
      operator delete(__p);
    }
    *(void *)&long long v86 = &v79;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v86);
  }

  return v12;
}

- (id)_clipStroke:(id)a3 againstPaths:(const void *)a4
{
  id v6 = a3;
  id v7 = [v6 _clipPlane];
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  if (v7)
  {
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v58[0] = *MEMORY[0x1E4F1DAB8];
    v58[1] = v8;
    v58[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v6 generateClipPaths:&v59 transform:v58];
    if (v60 != v59)
    {
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      uint64_t v55 = 0;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v33 = &off_1F1FB03A8;
      *(_OWORD *)v34 = 0u;
      *(_OWORD *)id v35 = 0u;
      long long v36 = 0u;
      *(_OWORD *)__p = 0u;
      uint64_t v38 = 0;
      v39[0] = v39;
      v39[1] = v39;
      v39[2] = 0;
      char v40 = 0;
      char v47 = 0;
      char v41 = 0;
      char v42 = 0;
      __int16 v51 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = off_1F1FB03F0;
      uint64_t v9 = v59;
      if (v60 != v59)
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0;
        id v12 = (char *)&v34[-1] + (void)*(v33 - 3);
        do
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 16))(v12, v9 + v10, 1, 1);
          ++v11;
          uint64_t v9 = v59;
          v10 += 24;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v60 - v59) >> 3));
      }
      ClipperLib::Clipper::Execute((uint64_t)&v33, 2, &v62, 0, 0);
      std::__list_imp<long long>::clear(v39);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v35[1])
      {
        *(void **)&long long v36 = v35[1];
        operator delete(v35[1]);
      }
      if (v34[0])
      {
        v34[1] = v34[0];
        operator delete(v34[0]);
      }
      ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v44);
    }
    uint64_t v33 = (uint64_t (**)(ClipperLib::Clipper *__hidden))&v59;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
  }
  long long v13 = (void *)[v6 copyForMutation];
  [v13 generateMask];
  [v13 _setClipPlane:0];
  if (v63 == v62) {
    uint64_t v14 = (uint64_t *)a4;
  }
  else {
    uint64_t v14 = &v62;
  }
  uint64_t v15 = [v13 sliceWithMask:v14];
  if ([v15 count] != 1) {
    goto LABEL_20;
  }
  id v16 = [v15 firstObject];
  v17 = [v16 _strokeUUID];
  uint64_t v18 = [v13 _strokeUUID];
  int v19 = [v17 isEqual:v18];

  if (v19)
  {
    uint64_t v20 = [(PKDrawing *)self _unclippedStroke:v6];
  }
  else
  {
LABEL_20:
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __48__PKDrawing_Clipping___clipStroke_againstPaths___block_invoke;
    double v30 = &unk_1E64C52C8;
    id v21 = v6;
    id v31 = v21;
    id v32 = v15;
    id v22 = _Block_copy(&v27);
    uint64_t v33 = 0;
    v23 = objc_msgSend(v13, "_sliceWithSlicingBlock:inDrawing:newRootStroke:", v22, self, &v33, v27, v28, v29, v30);
    unint64_t v24 = v23;
    if (v33)
    {
      if ([v23 count])
      {
        id v25 = [v24 lastObject];
      }
      else
      {
        id v25 = v21;
      }
      uint64_t v20 = v25;
    }
    else
    {
      uint64_t v20 = (void *)[v21 mutableCopy];
      [v20 _setHidden:1];
      [v20 didUpdateSubstrokesInDrawing:self];
    }
  }
  uint64_t v33 = (uint64_t (**)(ClipperLib::Clipper *__hidden))&v62;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);

  return v20;
}

id __48__PKDrawing_Clipping___clipStroke_againstPaths___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 _strokeUUID];
  id v4 = [*(id *)(a1 + 32) _strokeUUID];
  int v5 = [v3 isEqual:v4];

  if (v5) {
    id v6 = *(id *)(a1 + 40);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (PKDrawing)initWithDrawing:(id)a3
{
  id v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDrawing;
  int v5 = [(PKDrawing *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4[4] mutableCopy];
    cachedVisibleStrokes = v5->_cachedVisibleStrokes;
    v5->_cachedVisibleStrokes = (NSMutableArray *)v6;
  }
  return v5;
}

- (PKDrawing)initWithStrokes:(NSArray *)strokes
{
  id v4 = strokes;
  int v5 = [(PKDrawing *)self init];
  objc_opt_class();
  objc_opt_isKindOfClass();
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKDrawing *)v5 _copyAndAddStrokes:v4 transform:v8];

  return v5;
}

- (PKDrawing)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (PKDrawing)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  id v5 = a3;
  PKCrash();
}

+ (id)fileType
{
  return @"com.apple.drawing";
}

- (Class)strokeClass
{
}

- (id)newStroke
{
}

- (Class)strokeSelectionClass
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDrawing)initWithCoder:(id)a3
{
  uint64_t v12 = 0;
  id v4 = a3;
  id v5 = (PKDrawing *)[v4 decodeBytesWithReturnedLength:&v12];
  if (v5)
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v5 length:v12 freeWhenDone:0];
    id v11 = 0;
    long long v8 = (void *)[v6 initWithData:v7 error:&v11];
    id v9 = v11;

    if (v9)
    {
      [v4 failWithError:v9];
    }
    else
    {
      if (v8)
      {
        self = [(PKDrawing *)self initWithDrawing:v8];
        id v9 = 0;
        id v5 = self;
        goto LABEL_8;
      }
      id v9 = 0;
    }
    id v5 = 0;
  }
  else
  {
    long long v8 = 0;
    id v9 = 0;
  }
LABEL_8:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PKDrawing *)self serialize];
  objc_msgSend(v5, "encodeBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithDrawing:self];
}

- (id)version
{
}

- (id)_rootStrokes
{
}

- (int64_t)_rootStrokesCount
{
  v2 = [(PKDrawing *)self _rootStrokes];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_isEmpty
{
  return [(PKDrawing *)self _rootStrokesCount] == 0;
}

- (void)_setAllStrokes:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (BOOL)containsInternalStrokes
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PKDrawing *)self strokes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) _isInternal])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)copyWithoutInternalStrokes
{
}

- (void)_imageInRect:(CGRect)a3 scale:(double)a4 completionHandler:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v9 = a5;
  long long v10 = -[PKImageRenderer initWithSize:scale:]([PKImageRenderer alloc], "initWithSize:scale:", width, height, a4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PKDrawing__imageInRect_scale_completionHandler___block_invoke;
  v12[3] = &unk_1E64C76D0;
  id v11 = v9;
  id v13 = v11;
  [(PKImageRenderer *)v10 renderDrawing:self completion:v12];
}

void __50__PKDrawing__imageInRect_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (UIImage)imageFromRect:(CGRect)rect scale:(CGFloat)scale
{
  double v4 = scale;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__10;
  id v22 = __Block_byref_object_dispose__10;
  id v23 = 0;
  if (scale <= 0.0)
  {
    long long v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v4 = v11;
  }
  id v12 = -[PKImageRenderer initSyncWithSize:scale:]([PKImageRenderer alloc], "initSyncWithSize:scale:", width, height, v4);
  id v13 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  objc_msgSend(v12, "setInvertColors:", objc_msgSend(v13, "userInterfaceStyle") == 2);

  uint64_t v14 = [(PKDrawing *)self strokes];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __33__PKDrawing_imageFromRect_scale___block_invoke;
  v17[3] = &unk_1E64C76F8;
  v17[4] = &v18;
  objc_msgSend(v12, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v14, v17, x, y, width, height, 1.0);

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return (UIImage *)v15;
}

void __33__PKDrawing_imageFromRect_scale___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4
{
  long long v4 = *(_OWORD *)&a4->c;
  v7[0] = *(_OWORD *)&a4->a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&a4->tx;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKDrawing *)self _copyAndAddStrokes:a3 transform:v7 inkTransform:v6];
}

- (void)_copyAndAddStrokes:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        long long v14 = *(_OWORD *)&a4->c;
        v21[0] = *(_OWORD *)&a4->a;
        v21[1] = v14;
        v21[2] = *(_OWORD *)&a4->tx;
        long long v15 = *(_OWORD *)&a5->c;
        v20[0] = *(_OWORD *)&a5->a;
        v20[1] = v15;
        v20[2] = *(_OWORD *)&a5->tx;
        id v16 = [v13 ink];
        id v19 = v12;
        id v17 = [(PKDrawing *)self _copyAndAddStroke:v13 transform:v21 inkTransform:v20 ink:v16 newParent:&v19];
        id v9 = v19;

        ++v11;
        id v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
}

- (PKDrawing)drawingByApplyingTransform:(CGAffineTransform *)transform
{
  long long v3 = *(_OWORD *)&transform->c;
  v6[0] = *(_OWORD *)&transform->a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&transform->tx;
  long long v4 = [(PKDrawing *)self drawingByApplyingTransform:v6 transformInk:1];

  return (PKDrawing *)v4;
}

- (id)drawingByApplyingTransform:(CGAffineTransform *)a3 transformInk:(BOOL)a4
{
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v14.c = v6;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (!a4)
  {
    double v7 = sqrt(a3->b * a3->b + a3->a * a3->a);
    if (v7 > 0.0) {
      CGAffineTransformMakeScale(&v14, 1.0 / v7, 1.0 / v7);
    }
  }
  id v8 = objc_alloc_init((Class)objc_opt_class());
  id v9 = [(PKDrawing *)self strokes];
  long long v10 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->tx;
  CGAffineTransform v12 = v14;
  [v8 _copyAndAddStrokes:v9 transform:v13 inkTransform:&v12];

  return v8;
}

- (PKDrawing)drawingByAppendingDrawing:(PKDrawing *)drawing
{
  long long v4 = drawing;
  long long v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDrawing:self];
  long long v6 = [(PKDrawing *)v4 strokes];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 _copyAndAddStrokes:v6 transform:v9];

  return (PKDrawing *)v5;
}

- (PKDrawing)drawingByAppendingStrokes:(NSArray *)strokes
{
  long long v4 = strokes;
  long long v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDrawing:self];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 _copyAndAddStrokes:v4 transform:v8];

  return (PKDrawing *)v5;
}

- (NSArray)strokes
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  cachedVisibleStrokes = v2->_cachedVisibleStrokes;
  if (!cachedVisibleStrokes)
  {
    [(PKDrawing *)v2 _rootStrokes];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = 0;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          v5 += [*(id *)(*((void *)&v21 + 1) + 8 * i) _visibleSubstrokeCountInDrawing:v2];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v6);
    }

    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "_addVisibleSubstrokesTo:inDrawing:", v9, v2, (void)v17);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    CGAffineTransform v14 = v2->_cachedVisibleStrokes;
    v2->_cachedVisibleStrokes = (NSMutableArray *)v9;

    cachedVisibleStrokes = v2->_cachedVisibleStrokes;
  }
  long long v15 = (void *)[(NSMutableArray *)cachedVisibleStrokes copy];
  objc_sync_exit(v2);

  return (NSArray *)v15;
}

- (CGRect)calculateStrokeBounds
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(PKDrawing *)self strokes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v9) _bounds];
        v27.origin.CGFloat x = v10;
        v27.origin.CGFloat y = v11;
        v27.size.CGFloat width = v12;
        v27.size.CGFloat height = v13;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectUnion(v24, v27);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)bounds
{
}

- (NSUUID)uuid
{
}

- (void)_setUUID:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (CGRect)_canvasBounds
{
}

- (void)set_canvasBounds:(CGRect)a3
{
}

- (void)invalidateVisibleStrokes
{
  cachedVisibleStrokes = self->_cachedVisibleStrokes;
  self->_cachedVisibleStrokes = 0;
}

+ (void)sortStrokes:(id)a3
{
}

uint64_t __25__PKDrawing_sortStrokes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareToStroke:");
}

+ (id)visibleStrokesFromStrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        CGFloat v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_strokeUUID", (void)v15);
        CGFloat v13 = [v6 _visibleStrokeForIdentifier:v12];

        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)drawingStrokesFromStrokes:(id)a3 inDrawing:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        CGFloat v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_strokeUUID", (void)v15);
        CGFloat v13 = [v6 _strokeForIdentifier:v12];

        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)insertNewTestStroke
{
  id v3 = [(PKDrawing *)self newStroke];
  id v4 = objc_alloc_init(PKInk);
  [v3 _setInk:v4];

  id v5 = [(PKDrawing *)self visibleStrokeForInsertingStroke:v3];
  [(PKDrawing *)self addNewStroke:v5];

  return v5;
}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (PKContentVersion)requiredContentVersion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PKDrawing *)self _rootStrokes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    PKContentVersion v5 = PKContentVersion1;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v4) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) requiredContentVersion];
      if (v5 <= v7) {
        PKContentVersion v5 = v7;
      }
      if (v5 == (PKContentVersionLatest|PKContentVersion1)) {
        break;
      }
      if (v3 == ++v6)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    PKContentVersion v5 = PKContentVersion1;
  }

  return v5;
}

- (void)addNewStroke:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)undoableAddNewStrokes:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (id)_addStroke:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v3;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v4 = [(PKDrawing *)self _copyAndAddStroke:a3 transform:v6];

  return v4;
}

- (void)_removeStroke:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(PKDrawing *)self deleteStrokes:v5];
}

- (id)copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "ink", *(void *)&a4->a, *(void *)&a4->b, *(void *)&a4->c, *(void *)&a4->d, *(void *)&a4->tx, *(void *)&a4->ty);
  id v8 = [(PKDrawing *)self _copyAndAddStroke:v6 transform:&v10 ink:v7 newParent:0];

  return v8;
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "ink", *(void *)&a4->a, *(void *)&a4->b, *(void *)&a4->c, *(void *)&a4->d, *(void *)&a4->tx, *(void *)&a4->ty);
  id v8 = [(PKDrawing *)self _copyAndAddStroke:v6 transform:&v10 ink:v7 newParent:0];

  return v8;
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 ink:(id)a5 newParent:(id *)a6
{
  long long v6 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->tx;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [(PKDrawing *)self _copyAndAddStroke:a3 transform:v10 inkTransform:v9 ink:a5 newParent:a6];
}

- (id)_copyAndAddStroke:(id)a3 transform:(CGAffineTransform *)a4 inkTransform:(CGAffineTransform *)a5 ink:(id)a6 newParent:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  uint64_t v14 = [(PKDrawing *)self visibleStrokeForInsertingStroke:v12];
  long long v15 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v38.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v38.c = v15;
  *(_OWORD *)&v38.tCGFloat x = *(_OWORD *)&a4->tx;
  if (!CGAffineTransformIsIdentity(&v38))
  {
    if (v14) {
      [v14 transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v16 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v37, &t1, &t2);
    [v14 _setTransform:&v37];
  }
  long long v17 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v34.c = v17;
  *(_OWORD *)&v34.tCGFloat x = *(_OWORD *)&a5->tx;
  if (!CGAffineTransformIsIdentity(&v34))
  {
    if (v14) {
      [v14 _inkTransform];
    }
    else {
      memset(&v32, 0, sizeof(v32));
    }
    long long v18 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v18;
    *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)&a5->tx;
    CGAffineTransformConcat(&v33, &v32, &v31);
    [v14 _setInkTransform:&v33];
  }
  id v19 = [v14 ink];

  if (v19 != v13) {
    [v14 setInk:v13];
  }
  uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
  [v14 _setStrokeUUID:v20];

  objc_msgSend(v14, "_setFlags:", objc_msgSend(v12, "_flags") & 0xFFFFFFC000000011 | (32 * objc_msgSend(v12, "randomSeed")) | 0x2000000000);
  long long v21 = [v14 _strokeMask];

  if (v21)
  {
    if (a7)
    {
      id v22 = *a7;
      id v23 = v22;
      if (v22)
      {
        CGRect v24 = [v22 _strokeDataUUID];
        CGRect v25 = [v14 _strokeDataUUID];
        char v26 = [v24 isEqual:v25];

        if (v26) {
          goto LABEL_23;
        }
      }
    }
    else
    {
      id v23 = 0;
    }
    CGRect v27 = [v14 parentStrokeForInsertionInDrawing:self];

    [(PKDrawing *)self addNewStroke:v27];
    if (a7)
    {
      id v23 = v27;
      *a7 = v23;
    }
    else
    {
      id v23 = v27;
    }
LABEL_23:
    uint64_t v28 = [v23 _substrokes];
    long long v29 = [v28 arrayByAddingObject:v14];
    objc_msgSend(v23, "set_substrokes:", v29);

    [(PKDrawing *)self invalidateVisibleStrokes];
    goto LABEL_24;
  }
  [(PKDrawing *)self addNewStroke:v14];
LABEL_24:

  return v14;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  id v4 = a3;
  PKCrash();
}

- (void)setStrokes:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  long long v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  void v6[2] = *(_OWORD *)&a4->tx;
  [(PKDrawing *)self transformStrokes:a3 withTransform:v6 concat:a5];
}

- (id)setStroke:(id)a3 ink:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v13 = v7;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [(PKDrawing *)self setStrokes:v8 inks:v9];

  long long v10 = [v6 _strokeUUID];
  long long v11 = [(PKDrawing *)self _strokeForIdentifier:v10];

  return v11;
}

- (id)setStroke:(id)a3 hidden:(BOOL)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__PKDrawing_setStroke_hidden___block_invoke;
  _OWORD v10[3] = &unk_1E64C7740;
  BOOL v12 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(PKDrawing *)self updateStroke:v7 updater:v10];

  return v8;
}

id __30__PKDrawing_setStroke_hidden___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned __int8 *)(a1 + 40) == [v3 _isHidden])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [v3 _pointsCount];
    id v6 = v3;
    if (!v5) {
      id v6 = *(void **)(a1 + 32);
    }
    id v4 = (id)[v6 copyForMutation];
    [v4 _setHidden:*(unsigned __int8 *)(a1 + 40)];
    objc_msgSend(v4, "_setFlags:", objc_msgSend(v4, "_flags") & 0xFFFFFFFFFFFFFFFDLL);
  }

  return v4;
}

- (void)_eraseWithEraserStroke:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKDrawing *)self sliceWithEraseStroke:v4];
  v7[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(PKDrawing *)self deleteStrokes:v6];
}

- (void)_clipMaskedStrokes
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31__PKDrawing__clipMaskedStrokes__block_invoke;
  v2[3] = &unk_1E64C57A8;
  v2[4] = self;
  [(PKDrawing *)self clipStrokesIfNeededOnQueue:0 completion:v2];
}

uint64_t __31__PKDrawing__clipMaskedStrokes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) mergeWithDrawing:a2];
}

- (void)deleteStrokes:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)undoableDeleteStrokes:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  id v5 = a3;
  PKCrash();
}

- (void)transformStrokes:(id)a3 withTransforms:(id)a4 concat:(BOOL)a5
{
  BOOL v5 = a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  for (unint64_t i = 0; [v8 count] > i; ++i)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    id v11 = [v9 objectAtIndexedSubscript:i];
    BOOL v12 = v11;
    if (v11)
    {
      [v11 CGAffineTransformValue];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
    }

    id v13 = [v8 objectAtIndexedSubscript:i];
    v19[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    [(PKDrawing *)self transformStrokes:v14 withTransform:v15 concat:v5];
  }
}

- (id)transformStrokes:(id)a3 paths:(id)a4 masks:(id)a5
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PKDrawing *)self _originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:v8 pathDict:v9 maskDict:v10];
  BOOL v12 = [v11 allValues];
  id v13 = [(PKDrawing *)self undoableAddNewStrokes:v12];

  uint64_t v14 = [(PKDrawing *)self undoableDeleteStrokes:v8];
  long long v15 = _PencilKitBundle();
  long long v16 = [v15 localizedStringForKey:@"Straighten Strokes" value:@"Straighten Strokes" table:@"Localizable"];

  [v13 setActionName:v16];
  [v14 setActionName:v16];
  v19[0] = v13;
  v19[1] = v14;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v17;
}

- (id)_originalStrokeDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5
{
  BOOL v5 = [(PKDrawing *)self _originalDataUUIDToTransformedStrokeDictFromStrokes:a3 pathDict:a4 maskDict:a5 shouldUseStrokeDataUUID:1];

  return v5;
}

- (id)_originalStrokeUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5
{
  BOOL v5 = [(PKDrawing *)self _originalDataUUIDToTransformedStrokeDictFromStrokes:a3 pathDict:a4 maskDict:a5 shouldUseStrokeDataUUID:0];

  return v5;
}

- (id)_originalDataUUIDToTransformedStrokeDictFromStrokes:(id)a3 pathDict:(id)a4 maskDict:(id)a5 shouldUseStrokeDataUUID:(BOOL)a6
{
  BOOL v28 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v31 = a4;
  id v30 = a5;
  char v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = [v13 _strokeUUID];
        long long v15 = [v31 objectForKeyedSubscript:v14];

        if (!v15)
        {
          long long v15 = [v13 _strokeData];
        }
        long long v16 = [v13 _strokeUUID];
        long long v17 = [v30 objectForKeyedSubscript:v16];

        if (!v17)
        {
          long long v17 = [v13 _strokeMask];
        }
        id v18 = objc_alloc([(PKDrawing *)self strokeClass]);
        id v19 = [v13 ink];
        if (v13) {
          [v13 transform];
        }
        else {
          memset(v32, 0, sizeof(v32));
        }
        uint64_t v20 = [v13 mask];
        long long v21 = (void *)[v18 initWithInk:v19 strokePath:v15 transform:v32 mask:v20];

        id v22 = [v13 _strokeMask];
        BOOL v23 = v22 == 0;

        if (!v23) {
          [v21 _setStrokeMask:v17];
        }
        if (v28) {
          [v13 _strokeDataUUID];
        }
        else {
        CGRect v24 = [v13 _strokeUUID];
        }
        [v29 setObject:v21 forKey:v24];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  return v29;
}

- (BOOL)shouldClearSelectionAfterStraightening
{
  return 1;
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  id v5 = a3;
  PKCrash();
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PKCrash();
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  PKCrash();
}

- (void)_transformAllStrokes:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v9.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v9.c = v5;
  *(_OWORD *)&v9.tCGFloat x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v9))
  {
    id v6 = [(PKDrawing *)self strokes];
    long long v7 = *(_OWORD *)&a3->c;
    v8[0] = *(_OWORD *)&a3->a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a3->tx;
    [(PKDrawing *)self transformStrokes:v6 withTransform:v8 concat:1];
  }
}

- (id)setStroke:(id)a3 transform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v5
    && (long long v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&v16.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&v16.c = v9,
        *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&a4->tx,
        CGAffineTransformIsIdentity(&v16)))
  {
    id v10 = v8;
  }
  else
  {
    v17[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    long long v12 = *(_OWORD *)&a4->c;
    v15[0] = *(_OWORD *)&a4->a;
    v15[1] = v12;
    v15[2] = *(_OWORD *)&a4->tx;
    [(PKDrawing *)self transformStrokes:v11 withTransform:v15 concat:1];

    id v13 = [v8 _strokeUUID];
    id v10 = [(PKDrawing *)self _strokeForIdentifier:v13];
  }

  return v10;
}

- (id)updateStroke:(id)a3 updater:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CGRect v24 = __Block_byref_object_copy__10;
  CGRect v25 = __Block_byref_object_dispose__10;
  id v8 = v6;
  id v26 = v8;
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__PKDrawing_updateStroke_updater___block_invoke;
  _OWORD v13[3] = &unk_1E64C7768;
  long long v17 = v19;
  id v18 = &v21;
  long long v15 = self;
  id v16 = v7;
  id v14 = v8;
  id v9 = v7;
  id v10 = v8;
  [(PKDrawing *)self updateStrokes:v13];
  id v11 = (id)v22[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

id __34__PKDrawing_updateStroke_updater___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    id v7 = [v5 _strokeUUID];
    id v8 = [*(id *)(a1 + 32) _strokeUUID];
    int v9 = [v7 isEqual:v8];

    id v5 = v6;
    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a3 = 1;
      uint64_t v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      id v5 = v6;
      if (*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != v6)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) didUpdateInDrawing:*(void *)(a1 + 40)];
        id v5 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
    }
  }
  id v13 = v5;

  return v13;
}

- (void)setStrokeSubstrokes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __33__PKDrawing_setStrokeSubstrokes___block_invoke;
  _OWORD v6[3] = &unk_1E64C7790;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PKDrawing *)self updateStrokes:v6];
}

id __33__PKDrawing_setStrokeSubstrokes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 _strokeUUID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    id v7 = (id)[v3 _newStrokeWithSubstrokes:v6 inDrawing:*(void *)(a1 + 40)];
  }
  else {
    id v7 = v3;
  }
  id v8 = v7;

  return v8;
}

- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4
{
  id v4 = a3;
  PKCrash();
}

- (void)updateStrokes:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)undoableMergeWithDrawing:(id)a3
{
  return 0;
}

- (id)CHDrawing
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F5C040]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(PKDrawing *)self strokes];
  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = 0;
        id v16 = &v15;
        uint64_t v17 = 0x2020000000;
        char v18 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __22__PKDrawing_CHDrawing__block_invoke;
        v12[3] = &unk_1E64C77B8;
        id v9 = v3;
        id v13 = v9;
        id v14 = &v15;
        [v8 enumeratePointsWithTimestep:v12 usingBlock:0.00833333333];
        if (*((unsigned char *)v16 + 24)) {
          [v9 endStroke];
        }

        _Block_object_dispose(&v15, 8);
      }
      id v4 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  return v3;
}

uint64_t __22__PKDrawing_CHDrawing__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "addPoint:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (unint64_t)hash
{
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)debugQuickLookObject
{
  [(PKDrawing *)self bounds];

  return -[PKDrawing imageFromRect:scale:](self, "imageFromRect:scale:");
}

- (PKDrawing)initWithData:(NSData *)data error:(NSError *)error
{
  id v4 = data;
  PKCrash();
}

- (NSData)dataRepresentation
{
}

- (BOOL)recognitionEnabled
{
  return self->_recognitionEnabled;
}

- (void)setRecognitionEnabled:(BOOL)a3
{
  if (self->_recognitionEnabled != a3)
  {
    self->_recognitionEnabled = a3;
    [(PKDrawing *)self _updateRecognitionSession];
  }
}

- (id)forcedRecognitionLocales
{
  return self->_forcedRecognitionLocales;
}

- (void)setForcedRecognitionLocales:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  if (self->_forcedRecognitionLocales != v5)
  {
    objc_storeStrong((id *)&self->_forcedRecognitionLocales, a3);
    [(PKDrawing *)self _updateRecognitionSession];
  }
}

- (PKVisualizationManager)visualizationManager
{
  if (self->_recognitionEnabled)
  {
    id v3 = [(PKDrawing *)self uuid];
    id v4 = +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v3);

    uint64_t v5 = -[PKRecognitionSessionManager session](v4);
    if (v5)
    {
      uint64_t v6 = [[PKVisualizationManager alloc] initWithRecognitionSession:v5];
      [(PKVisualizationManager *)v6 setRecognitionStatusReportingEnabled:1];
    }
    else
    {
      visualizationManager = self->_visualizationManager;
      if (!visualizationManager)
      {
        id v8 = [PKVisualizationManager alloc];
        id v9 = [(PKDrawing *)self recognitionSession];
        uint64_t v10 = [(PKVisualizationManager *)v8 initWithRecognitionSession:v9];
        uint64_t v11 = self->_visualizationManager;
        self->_visualizationManager = v10;

        visualizationManager = self->_visualizationManager;
      }
      uint64_t v6 = visualizationManager;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_updateRecognitionSession
{
  if ([(PKDrawing *)self recognitionEnabled]
    && ([(PKDrawing *)self recognitionSession],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v5 = [(PKDrawing *)self uuid];
    uint64_t v6 = +[PKRecognitionSessionCache recognitionSessionForUUID:]((uint64_t)PKRecognitionSessionCache, v5);

    id v7 = -[PKRecognitionSessionManager session](v6);

    if (v7)
    {
      objc_storeStrong((id *)&self->_recognitionManager, v6);
      id v8 = -[PKRecognitionSessionManager session](v6);
      [(PKDrawing *)self setRecognitionSession:v8];
    }
    else
    {
      id v9 = [PKRecognitionSessionManager alloc];
      uint64_t v10 = +[PKRecognitionSessionManagerConfiguration backgroundIndexingConfiguration]();
      uint64_t v11 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)v9, v10);
      recognitionManager = self->_recognitionManager;
      self->_recognitionManager = (PKRecognitionSessionManager *)v11;

      -[PKRecognitionSessionManager setDrawing:](self->_recognitionManager, self);
      id v13 = -[PKRecognitionSessionManager session](self->_recognitionManager);
      [(PKDrawing *)self setRecognitionSession:v13];

      id v14 = self->_recognitionManager;
      id v8 = [(PKDrawing *)self uuid];
      +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v14, v8);
    }

    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    listenerID = self->_listenerID;
    self->_listenerID = v15;

    -[PKRecognitionSessionManager addListener:]((uint64_t)self->_recognitionManager, self->_listenerID);
    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [(PKDrawing *)self setOngoingQueries:v17];
  }
  else if ([(PKDrawing *)self recognitionEnabled] {
         || ([(PKDrawing *)self recognitionSession],
  }
             id v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             !v4))
  {
    -[PKRecognitionSessionManager setDrawing:](self->_recognitionManager, self);
  }
  else
  {
    -[PKRecognitionSessionManager removeListener:]((uint64_t)self->_recognitionManager, self->_listenerID);
    [(PKDrawing *)self _teardownRecognitionObjects];
  }
  if ([(PKDrawing *)self recognitionEnabled])
  {
    char v18 = [(PKDrawing *)self forcedRecognitionLocales];
    if (v18
      && ([(PKDrawing *)self forcedRecognitionLocales],
          long long v19 = objc_claimAutoreleasedReturnValue(),
          uint64_t v20 = [v19 count],
          v19,
          v18,
          v20))
    {
      uint64_t v21 = [(PKDrawing *)self forcedRecognitionLocales];
    }
    else
    {
      uint64_t v21 = +[PKRecognitionSessionManager enabledLocales];
    }
    id v23 = (id)v21;
    long long v22 = [(PKDrawing *)self recognitionSession];
    [v22 setPreferredLocales:v23];
  }
}

- (id)_strokeForIdentifier:(id)a3
{
  id v3 = a3;
  PKCrash();
}

- (id)_visibleStrokeForIdentifier:(id)a3
{
  id v3 = [(PKDrawing *)self _strokeForIdentifier:a3];
  if ([v3 _isHidden]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

+ (id)_uuidDescriptionForStrokes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((v8 & 1) == 0) {
          [v4 appendString:@", ", (void)v14];
        }
        uint64_t v11 = objc_msgSend(v10, "_strokeUUID", (void)v14);
        long long v12 = [v11 UUIDString];
        [v4 appendString:v12];

        char v8 = 0;
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  [v4 appendString:@"]"];

  return v4;
}

- (void)setNeedsRecognitionUpdate
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v4 BOOLForKey:@"PKDrawingRecognitionDisableUpdates"];

  if ((v3 & 1) == 0)
  {
    id v5 = [(PKDrawing *)self recognitionSession];
    [v5 setNeedsRecognitionUpdate];
  }
}

- (void)cancelOngoingRecognitionRequests
{
  id v2 = [(PKDrawing *)self recognitionSession];
  [v2 cancelOngoingRequests];
}

- (id)strokesForCHStrokeIdentifiers:(id)a3
{
  char v3 = [(PKDrawing *)self strokesForCHStrokeIdentifiers:a3 didFindAllStrokes:0];

  return v3;
}

- (id)strokesForCHStrokeIdentifiers:(id)a3 didFindAllStrokes:(BOOL *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v15;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) strokeUUID];
        id v13 = [(PKDrawing *)self _visibleStrokeForIdentifier:v12];

        if (v13) {
          [v6 addObject:v13];
        }
        else {
          char v10 = 0;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  if (a4) {
    *a4 = v10 & 1;
  }

  return v6;
}

- (id)indexableContent
{
  char v3 = [(PKDrawing *)self recognitionSession];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5C050]);
    id v5 = [(PKDrawing *)self recognitionSession];
    uint64_t v6 = (void *)[v4 initWithRecognitionSession:v5];

    [v6 start];
    [v6 waitForPendingUpdates];
    id v7 = [PKIndexableContent alloc];
    uint64_t v8 = [v6 indexableContent];
    uint64_t v9 = [(PKIndexableContent *)v7 initWithIndexableContent:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)performSearchQuery:(id)a3 withBlock:(id)a4
{
}

- (void)performSearchQuery:(id)a3 fullWordsOnly:(BOOL)a4 caseMatchingOnly:(BOOL)a5 withBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v17 = a3;
  id v10 = a6;
  if (v10)
  {
    uint64_t v11 = [(PKDrawing *)self recognitionSession];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F5C088]);
      id v13 = [(PKDrawing *)self recognitionSession];
      long long v14 = (void *)[v12 initWithRecognitionSession:v13];

      [v14 setQueryString:v17];
      [v14 setDelegate:self];
      if (objc_opt_respondsToSelector()) {
        [v14 setFullWordsOnly:v8];
      }
      if (objc_opt_respondsToSelector()) {
        [v14 setCaseMatchingOnly:v7];
      }
      id v15 = [(PKDrawing *)self ongoingQueries];
      long long v16 = _Block_copy(v10);
      [v15 setObject:v16 forKey:v14];

      [v14 start];
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v31;
    [v30 pause];
    [v30 setDelegate:0];
    id v4 = [(PKDrawing *)self ongoingQueries];
    id v29 = [v4 objectForKey:v30];

    id v5 = [(PKDrawing *)self ongoingQueries];
    [v5 removeObjectForKey:v30];

    if (v29)
    {
      [MEMORY[0x1E4F1CA48] array];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      v34 = long long v41 = 0u;
      uint64_t v6 = [v30 foundItems];
      id obj = v6;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v7)
      {
        uint64_t v33 = *(void *)v41;
        BOOL v8 = (double *)MEMORY[0x1E4F1DB20];
        do
        {
          uint64_t v35 = v7;
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v41 != v33) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            double x = *v8;
            double y = v8[1];
            double width = v8[2];
            double height = v8[3];
            id v15 = [MEMORY[0x1E4F1CA48] array];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v16 = [v10 strokeIdentifiers];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v37 != v18) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v20 = [*(id *)(*((void *)&v36 + 1) + 8 * j) strokeUUID];
                  uint64_t v21 = [(PKDrawing *)self _visibleStrokeForIdentifier:v20];

                  if (v21) {
                    [v15 addObject:v21];
                  }
                  [v21 _bounds];
                  v49.origin.double x = v22;
                  v49.origin.double y = v23;
                  v49.size.double width = v24;
                  v49.size.double height = v25;
                  v47.origin.double x = x;
                  v47.origin.double y = y;
                  v47.size.double width = width;
                  v47.size.double height = height;
                  CGRect v48 = CGRectUnion(v47, v49);
                  double x = v48.origin.x;
                  double y = v48.origin.y;
                  double width = v48.size.width;
                  double height = v48.size.height;
                }
                uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
              }
              while (v17);
            }

            id v26 = [PKSearchQueryItem alloc];
            CGRect v27 = (void *)[v15 copy];
            BOOL v28 = -[PKSearchQueryItem initWithBounds:strokes:](v26, "initWithBounds:strokes:", v27, x, y, width, height);

            [v34 addObject:v28];
          }
          uint64_t v6 = obj;
          uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v7);
      }

      ((void (**)(void, void *))v29)[2](v29, v34);
    }
    else
    {
    }
  }
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PKDrawing *)self uuid];
  uint64_t v7 = [v6 description];
  BOOL v8 = [(PKDrawing *)self strokes];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p %@ %ld strokes>", v5, self, v7, objc_msgSend(v8, "count")];

  return (NSString *)v9;
}

- (id)_ascii
{
  char v3 = [(PKDrawing *)self _newAsciiBitfield];
  [(PKDrawing *)self bounds];
  uint64_t v5 = +[PKStroke _asciiDimensionForBoundsDimension:v4];
  [(PKDrawing *)self bounds];
  uint64_t v7 = +[PKStroke _asciiDimensionForBoundsDimension:v6];
  BOOL v8 = [MEMORY[0x1E4F28E78] string];
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (v5 >= 1)
      {
        for (uint64_t j = 0; j != v5; ++j)
        {
          if (v3[+[PKStroke _asciiBitfieldIndexForX:j y:i width:v5]])uint64_t v11 = @"■"; {
          else
          }
            uint64_t v11 = @" ";
          id v12 = v11;
          [v8 appendString:v12];
        }
      }
      [v8 appendString:@"\n"];
    }
  }
  free(v3);

  return v8;
}

- (BOOL)_newAsciiBitfield
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [(PKDrawing *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = off_1E64C4000;
  int64_t v39 = +[PKStroke _asciiDimensionForBoundsDimension:](PKStroke, "_asciiDimensionForBoundsDimension:");
  int64_t v10 = +[PKStroke _asciiDimensionForBoundsDimension:v4];
  int64_t v44 = +[PKStroke _asciiDimensionForBoundsDimension:v6];
  uint64_t v11 = (BOOL *)malloc_type_calloc(+[PKStroke _asciiDimensionForBoundsDimension:v8]* v44, 1uLL, 0x100004077774924uLL);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = [(PKDrawing *)self strokes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v13)
  {
    long long v40 = v12;
    uint64_t v41 = *(void *)v46;
    int64_t v38 = -v10;
    do
    {
      uint64_t v14 = 0;
      uint64_t v42 = v13;
      do
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(v12);
        }
        id v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
        long long v16 = (unsigned __int8 *)objc_msgSend(v15, "_newAsciiBitfield", v38);
        [v15 _bounds];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        uint64_t v23 = -[__objc2_class _asciiDimensionForBoundsDimension:](v9[100], "_asciiDimensionForBoundsDimension:");
        uint64_t v24 = [(__objc2_class *)v9[100] _asciiDimensionForBoundsDimension:v18];
        uint64_t v25 = [(__objc2_class *)v9[100] _asciiDimensionForBoundsDimension:v20];
        uint64_t v26 = [(__objc2_class *)v9[100] _asciiDimensionForBoundsDimension:v22];
        uint64_t v43 = v14;
        if (v25 >= 1)
        {
          uint64_t v27 = v26;
          uint64_t v28 = 0;
          int64_t v29 = v38 + v24;
          do
          {
            if (v27 >= 1)
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                uint64_t v31 = [(__objc2_class *)v9[100] _asciiBitfieldIndexForX:v28 y:i width:v25];
                CGAffineTransform v32 = v9;
                int v33 = v16[v31];
                long long v34 = v32;
                uint64_t v35 = [(__objc2_class *)v32[100] _asciiBitfieldIndexForX:v23 - v39 + v28 y:v29 + i width:v44];
                if (v33) {
                  BOOL v36 = 1;
                }
                else {
                  BOOL v36 = v11[v35];
                }
                v11[v35] = v36;
                uint64_t v9 = v34;
              }
            }
            ++v28;
          }
          while (v28 != v25);
        }
        free(v16);
        uint64_t v14 = v43 + 1;
        id v12 = v40;
      }
      while (v43 + 1 != v42);
      uint64_t v13 = [v40 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v13);
  }

  return v11;
}

- (NSMutableArray)_cachedVisibleStrokes
{
  return self->_cachedVisibleStrokes;
}

- (void)set_cachedVisibleStrokes:(id)a3
{
}

- (PKRecognitionSessionManager)recognitionManager
{
  return self->_recognitionManager;
}

- (void)setRecognitionManager:(id)a3
{
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (void)setRecognitionSession:(id)a3
{
}

- (NSMapTable)ongoingQueries
{
  return self->_ongoingQueries;
}

- (void)setOngoingQueries:(id)a3
{
}

- (void)setVisualizationManager:(id)a3
{
}

+ (id)_upgradeDrawingData:(id)a3 queue:(id)a4 completionBlock:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, id))a5;
  int64_t v10 = [[PKDrawingConcrete alloc] initWithLegacyData:v7];
  uint64_t v11 = [(PKDrawingConcrete *)v10 _allStrokes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    if (v10)
    {
      id v13 = 0;
      uint64_t v14 = v10;
LABEL_6:
      long long v16 = [(PKDrawingConcrete *)v14 _upgradeOnQueue:v8 isLegacyDrawing:v10 != 0 completionBlock:v9];

      goto LABEL_10;
    }
LABEL_8:
    double v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = @"Error reading old ICDrawing data format.";
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v13 = [v17 errorWithDomain:*MEMORY[0x1E4F281F8] code:1 userInfo:v18];

    goto LABEL_9;
  }
  id v20 = 0;
  id v15 = [[PKDrawingConcrete alloc] initWithData:v7 error:&v20];
  id v13 = v20;

  if (v15)
  {
    uint64_t v14 = v15;
    goto LABEL_6;
  }
  if (!v13) {
    goto LABEL_8;
  }
LABEL_9:
  v9[2](v9, 0, v13);
  long long v16 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
LABEL_10:

  return v16;
}

- (void)set_orientation:(int64_t)a3
{
}

- (int64_t)_orientation
{
}

- (CGAffineTransform)_transformForImageWithSize:(SEL)a3
{
}

- (CGSize)_orientedDrawingSize
{
}

- (void)_upgradeLegacyPenInks
{
}

- (id)sliceWithEraseStroke:(id)a3
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  id v166 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v158 = v3;
  uint64_t v4 = [v166 newOutlinePaths];
  double v5 = *(uint64_t **)v4;
  double v6 = *(uint64_t **)(v4 + 8);
  v159 = (uint64_t *)v4;
  if (*(uint64_t **)v4 != v6)
  {
    do
    {
      uint64_t v7 = *v5;
      uint64_t v8 = v5[1];
      while (v7 != v8)
      {
        *(void *)(v7 + 16) = 0x3F800000BF800000;
        v7 += 24;
      }
      v5 += 3;
    }
    while (v5 != v6);
  }
  [v166 _bounds];
  CGRect v237 = CGRectInset(v236, -1.0, -1.0);
  CGFloat x = v237.origin.x;
  CGFloat y = v237.origin.y;
  CGFloat width = v237.size.width;
  CGFloat height = v237.size.height;
  v160 = [(PKDrawing *)self strokes];
  v161 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v160, "count"));
  v226 = 0;
  __p = 0;
  v227 = 0;
  uint64_t v217 = 0;
  v218 = &v217;
  uint64_t v219 = 0x4812000000;
  v220 = __Block_byref_object_copy__75;
  v221 = __Block_byref_object_dispose__76;
  v222 = "";
  v224 = 0;
  int64x2_t v223 = 0uLL;
  unint64_t v13 = [v160 count];
  uint64_t v14 = v223.i64[0];
  if (v13 > (uint64_t)&v224[-v223.i64[0]] >> 3)
  {
    if (v13 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v223.i64[1];
    *((void *)&v195 + 1) = &v224;
    long long v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<legacy_drawing::Command>>>(v13);
    double v18 = (void *)v223.i64[1];
    double v19 = (void *)v223.i64[0];
    if (v223.i64[1] == v223.i64[0])
    {
      int64x2_t v22 = vdupq_n_s64(v223.u64[1]);
      id v20 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      id v20 = &v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v21 = *--v18;
        *double v18 = 0;
        *((void *)v20 - 1) = v21;
        v20 -= 8;
      }
      while (v18 != v19);
      int64x2_t v22 = v223;
    }
    v223.i64[0] = (uint64_t)v20;
    v223.i64[1] = (uint64_t)&v16[(v15 - v14) & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v194 = v22;
    uint64_t v23 = v224;
    v224 = &v16[8 * v17];
    *(void *)&long long v195 = v23;
    v193 = (void *)v22.i64[0];
    std::__split_buffer<PKStroke * {__strong}>::~__split_buffer((uint64_t)&v193);
  }
  v162 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v160, "count"));
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  id obj = [(PKDrawing *)self _rootStrokes];
  uint64_t v24 = [obj countByEnumeratingWithState:&v213 objects:v233 count:16];
  if (v24)
  {
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v214;
LABEL_16:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v214 != v26) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(id *)(*((void *)&v213 + 1) + 8 * v27);
      if (v28 == v166) {
        break;
      }
      int64_t v29 = [*(id *)(*((void *)&v213 + 1) + 8 * v27) ink];
      id v30 = [v29 identifier];
      char v31 = [v30 isEqualToString:@"com.apple.ink.eraser"];

      if ((v31 & 1) == 0)
      {
        v193 = 0;
        v194.i64[0] = (uint64_t)&v193;
        v194.i64[1] = 0x2020000000;
        LOBYTE(v195) = 0;
        v205[0] = MEMORY[0x1E4F143A8];
        v205[1] = 3221225472;
        v205[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke;
        v205[3] = &unk_1E64C8A08;
        CGFloat v209 = x;
        CGFloat v210 = y;
        CGFloat v211 = width;
        CGFloat v212 = height;
        id v206 = v162;
        v207 = &v217;
        v208 = &v193;
        [v28 _visitVisibleSubstrokes:v205 inDrawing:self];
        if (*(unsigned char *)(v194.i64[0] + 24))
        {
          [v161 addObject:v28];
          CGAffineTransform v32 = v226;
          if (v226 >= v227)
          {
            long long v34 = (char *)__p;
            uint64_t v35 = (v226 - (unsigned char *)__p) >> 3;
            unint64_t v36 = v35 + 1;
            if ((unint64_t)(v35 + 1) >> 61) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v37 = v227 - (unsigned char *)__p;
            if ((v227 - (unsigned char *)__p) >> 2 > v36) {
              unint64_t v36 = v37 >> 2;
            }
            if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v38 = v36;
            }
            if (v38)
            {
              int64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v227, v38);
              CGAffineTransform v32 = v226;
              long long v34 = (char *)__p;
            }
            else
            {
              int64_t v39 = 0;
            }
            long long v40 = &v39[8 * v35];
            *(void *)long long v40 = v25;
            int v33 = v40 + 8;
            while (v32 != v34)
            {
              uint64_t v41 = *((void *)v32 - 1);
              v32 -= 8;
              *((void *)v40 - 1) = v41;
              v40 -= 8;
            }
            __p = v40;
            v226 = v33;
            v227 = &v39[8 * v38];
            if (v34) {
              operator delete(v34);
            }
          }
          else
          {
            *(void *)v226 = v25;
            int v33 = v32 + 8;
          }
          v226 = v33;
        }

        _Block_object_dispose(&v193, 8);
      }
      ++v25;
      if (++v27 == v24)
      {
        uint64_t v24 = [obj countByEnumeratingWithState:&v213 objects:v233 count:16];
        if (v24) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  size_t v42 = (v218[7] - v218[6]) >> 3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_2;
  block[3] = &unk_1E64C8A30;
  block[4] = &v217;
  dispatch_apply(v42, 0, block);
  uint64_t v201 = 0;
  uint64_t v202 = 0;
  uint64_t v203 = 0;
  uint64_t v43 = v218;
  uint64_t v44 = *v159;
  uint64_t v45 = v159[1];
  if (*v159 == v45)
  {
    double v49 = 0.0;
  }
  else
  {
    uint64_t v46 = 0;
    do
    {
      v193 = 0;
      int64x2_t v194 = 0uLL;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v193, *(const void **)v44, *(void *)(v44 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v44 + 8) - *(void *)v44) >> 3));
      long long v47 = v193;
      uint64_t v48 = v194.i64[0];
      if (v193)
      {
        v194.i64[0] = (uint64_t)v193;
        operator delete(v193);
      }
      v46 -= 0x5555555555555555 * ((v48 - (uint64_t)v47) >> 3);
      v44 += 24;
    }
    while (v44 != v45);
    double v49 = (double)(uint64_t)((double)v46 * 1.4);
  }
  double v165 = v49;
  uint64_t v50 = v43[7] - v43[6];
  if (v50 >= 1)
  {
    uint64_t v51 = 0;
    uint64_t v52 = (unint64_t)v50 >> 3;
    if (v52 <= 1) {
      uint64_t v53 = 1;
    }
    else {
      uint64_t v53 = v52;
    }
    do
    {
      uint64_t v54 = [*(id *)(v43[6] + 8 * v51) _strokeMask];
      uint64_t v55 = (uint64_t *)[v54 maskPaths];

      uint64_t v56 = *v55;
      uint64_t v57 = v55[1];
      if (*v55 == v57)
      {
        uint64_t v58 = 0;
      }
      else
      {
        uint64_t v58 = 0;
        do
        {
          v193 = 0;
          int64x2_t v194 = 0uLL;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&v193, *(const void **)v56, *(void *)(v56 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v56 + 8) - *(void *)v56) >> 3));
          uint64_t v59 = v193;
          uint64_t v60 = v194.i64[0];
          if (v193)
          {
            v194.i64[0] = (uint64_t)v193;
            operator delete(v193);
          }
          v58 -= 0x5555555555555555 * ((v60 - (uint64_t)v59) >> 3);
          v56 += 24;
        }
        while (v56 != v57);
      }
      [*(id *)(v43[6] + 8 * v51) _bounds];
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      uint64_t v69 = v201;
      uint64_t v70 = (v202 - v201) >> 6;
      if (v70 <= 100) {
        uint64_t v70 = 100;
      }
      unint64_t v71 = v70 - 100;
      if (v70 - 100 >= (unint64_t)((v202 - v201) >> 6))
      {
LABEL_66:
        v193 = 0;
        int64x2_t v194 = 0uLL;
        long long v77 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        long long v195 = *MEMORY[0x1E4F1DB20];
        long long v196 = v77;
        v197 = 0;
        std::vector<Bucket>::push_back[abi:ne180100](&v201, (uint64_t)&v193);
        if (v193) {
          operator delete(v193);
        }
        uint64_t v78 = v202;
        uint64_t v79 = *(char **)(v202 - 56);
        unint64_t v80 = *(void *)(v202 - 48);
        if ((unint64_t)v79 >= v80)
        {
          long long v82 = *(char **)(v202 - 64);
          uint64_t v83 = (v79 - v82) >> 3;
          if ((unint64_t)(v83 + 1) >> 61) {
            goto LABEL_163;
          }
          unint64_t v84 = v80 - (void)v82;
          unint64_t v85 = (uint64_t)(v80 - (void)v82) >> 2;
          if (v85 <= v83 + 1) {
            unint64_t v85 = v83 + 1;
          }
          if (v84 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v86 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v86 = v85;
          }
          if (v86)
          {
            uint64_t v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v202 - 48, v86);
            long long v82 = *(char **)(v78 - 64);
            uint64_t v79 = *(char **)(v78 - 56);
          }
          else
          {
            uint64_t v87 = 0;
          }
          CGRect v92 = &v87[8 * v83];
          *(void *)CGRect v92 = v51;
          unint64_t v81 = v92 + 8;
          while (v79 != v82)
          {
            uint64_t v93 = *((void *)v79 - 1);
            v79 -= 8;
            *((void *)v92 - 1) = v93;
            v92 -= 8;
          }
          *(void *)(v78 - 64) = v92;
          *(void *)(v78 - 56) = v81;
          *(void *)(v78 - 48) = &v87[8 * v86];
          if (v82) {
            operator delete(v82);
          }
        }
        else
        {
          *(void *)uint64_t v79 = v51;
          unint64_t v81 = v79 + 8;
        }
        *(void *)(v78 - 56) = v81;
        uint64_t v94 = v202;
        *(void *)(v202 - 8) = v58;
        *(CGFloat *)(v94 - 40) = v62;
        *(CGFloat *)(v94 - 32) = v64;
        *(CGFloat *)(v94 - 24) = v66;
        *(CGFloat *)(v94 - 16) = v68;
      }
      else
      {
        uint64_t v72 = (v70 << 6) - 6400;
        while (1)
        {
          CGFloat v73 = *(double *)(v69 + v72 + 24);
          CGFloat v74 = *(double *)(v69 + v72 + 32);
          CGFloat v76 = *(double *)(v69 + v72 + 40);
          CGFloat v75 = *(double *)(v69 + v72 + 48);
          v238.origin.CGFloat x = v62;
          v238.origin.CGFloat y = v64;
          v238.size.CGFloat width = v66;
          v238.size.CGFloat height = v68;
          CGRect v240 = CGRectInset(v238, -2.0, -2.0);
          v239.origin.CGFloat x = v73;
          v239.origin.CGFloat y = v74;
          v239.size.CGFloat width = v76;
          v239.size.CGFloat height = v75;
          if (!CGRectIntersectsRect(v239, v240)) {
            break;
          }
          ++v71;
          uint64_t v69 = v201;
          v72 += 64;
          if (v71 >= (v202 - v201) >> 6) {
            goto LABEL_66;
          }
        }
        uint64_t v88 = v69 + v72;
        uint64_t v89 = *(void **)(v69 + v72 + 8);
        unint64_t v90 = *(void *)(v69 + v72 + 16);
        if ((unint64_t)v89 >= v90)
        {
          CGRect v95 = *(void **)v88;
          uint64_t v96 = ((uint64_t)v89 - *(void *)v88) >> 3;
          unint64_t v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 61) {
LABEL_163:
          }
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          uint64_t v98 = v90 - (void)v95;
          if (v98 >> 2 > v97) {
            unint64_t v97 = v98 >> 2;
          }
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v99 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v99 = v97;
          }
          if (v99)
          {
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v69 + v72 + 16, v99);
            CGRect v95 = *(void **)v88;
            uint64_t v89 = *(void **)(v88 + 8);
          }
          else
          {
            v100 = 0;
          }
          v101 = &v100[8 * v96];
          *(void *)v101 = v51;
          CGRect v91 = v101 + 8;
          while (v89 != v95)
          {
            uint64_t v102 = *--v89;
            *((void *)v101 - 1) = v102;
            v101 -= 8;
          }
          *(void *)uint64_t v88 = v101;
          *(void *)(v88 + 8) = v91;
          *(void *)(v88 + 16) = &v100[8 * v99];
          if (v95) {
            operator delete(v95);
          }
        }
        else
        {
          *uint64_t v89 = v51;
          CGRect v91 = v89 + 1;
        }
        *(void *)(v88 + 8) = v91;
        *(void *)(v69 + v72 + 56) += v58;
        v241.origin.CGFloat x = v62;
        v241.origin.CGFloat y = v64;
        v241.size.CGFloat width = v66;
        v241.size.CGFloat height = v68;
        *(CGRect *)(v88 + 24) = CGRectUnion(*(CGRect *)(v88 + 24), v241);
      }
      ++v51;
    }
    while (v51 != v53);
  }
  if (v202 - v201 >= 1)
  {
    uint64_t v103 = 0;
    unint64_t v104 = (unint64_t)(v202 - v201) >> 6;
    if (v104 <= 1) {
      unint64_t v104 = 1;
    }
    unint64_t v164 = v104;
    while (1)
    {
      v105 = (void *)(v201 + (v103 << 6));
      uint64_t v172 = vcvtpd_s64_f64((double)(uint64_t)v105[7] / v165);
      if (v172 >= 2) {
        break;
      }
LABEL_148:
      if (++v103 == v164) {
        goto LABEL_149;
      }
    }
    uint64_t v106 = 0;
    unint64_t v107 = ((uint64_t)(v105[1] - *v105) >> 3) / (unint64_t)v172;
    if (v107 <= 1) {
      unint64_t v107 = 1;
    }
    uint64_t v167 = v103;
    uint64_t v168 = -(uint64_t)v107;
    uint64_t v170 = 8 * v107;
    unint64_t v171 = v107 + 1;
    unint64_t v169 = v107;
    uint64_t obja = (uint64_t)(8 * v107) >> 3;
    while (1)
    {
      if (v171 >= (uint64_t)(*(void *)(v201 + (v103 << 6) + 8) - *(void *)(v201 + (v103 << 6))) >> 3) {
        goto LABEL_148;
      }
      v193 = 0;
      int64x2_t v194 = 0uLL;
      long long v108 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      long long v195 = *MEMORY[0x1E4F1DB20];
      long long v196 = v108;
      v197 = 0;
      std::vector<Bucket>::push_back[abi:ne180100](&v201, (uint64_t)&v193);
      if (v193) {
        operator delete(v193);
      }
      v109 = (void *)(v201 + (v103 << 6));
      if (v170 >= 1)
      {
        uint64_t v110 = v202;
        v112 = (void **)(v202 - 64);
        uint64_t v111 = *(void *)(v202 - 64);
        unint64_t v113 = *(void *)(v202 - 56);
        v114 = (char *)v109[1];
        v115 = &v114[8 * v168];
        uint64_t v116 = v113 - v111;
        v117 = (char *)(v111 + ((v113 - v111) & 0xFFFFFFFFFFFFFFF8));
        uint64_t v118 = *(void *)(v202 - 48);
        uint64_t v119 = obja;
        if (obja <= (uint64_t)(v118 - v113) >> 3)
        {
          uint64_t v127 = (uint64_t)(v113 - (void)v117) >> 3;
          if (v127 >= obja)
          {
            v128 = &v115[8 * obja];
            v130 = *(char **)(v202 - 56);
          }
          else
          {
            v128 = &v115[8 * v127];
            int64_t v129 = v114 - v128;
            if (v114 != v128) {
              memmove(*(void **)(v202 - 56), &v115[8 * v127], v114 - v128);
            }
            v130 = (char *)(v113 + v129);
            *(void *)(v110 - 56) = v113 + v129;
            if ((uint64_t)(v113 - (void)v117) < 1) {
              goto LABEL_147;
            }
            uint64_t v119 = obja;
          }
          v131 = (uint64_t *)&v130[-8 * v119];
          v132 = v130;
          while ((unint64_t)v131 < v113)
          {
            uint64_t v133 = *v131++;
            *(void *)v132 = v133;
            v132 += 8;
          }
          v134 = &v117[8 * obja];
          *(void *)(v110 - 56) = v132;
          if (v130 != v134) {
            memmove(&v130[-8 * ((v130 - v134) >> 3)], v117, v130 - v134);
          }
          if (v128 != v115) {
            memmove(v117, v115, v128 - v115);
          }
        }
        else
        {
          uint64_t v120 = v116 >> 3;
          unint64_t v121 = (v116 >> 3) + obja;
          if (v121 >> 61) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v122 = v118 - v111;
          if (v122 >> 2 > v121) {
            unint64_t v121 = v122 >> 2;
          }
          if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v123 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v123 = v121;
          }
          if (v123)
          {
            v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v202 - 48, v123);
            uint64_t v126 = v125;
            uint64_t v119 = obja;
          }
          else
          {
            v124 = 0;
            uint64_t v126 = 0;
          }
          v135 = &v124[8 * v120];
          v136 = &v135[8 * v119];
          v137 = v135;
          do
          {
            uint64_t v138 = *(void *)v115;
            v115 += 8;
            *(void *)v137 = v138;
            v137 += 8;
          }
          while (v137 != v136);
          v139 = (char *)*v112;
          if (*v112 != v117)
          {
            v140 = v117;
            do
            {
              uint64_t v141 = *((void *)v140 - 1);
              v140 -= 8;
              *((void *)v135 - 1) = v141;
              v135 -= 8;
            }
            while (v140 != v139);
          }
          v142 = *(unsigned char **)(v110 - 56);
          uint64_t v143 = v142 - v117;
          if (v142 != v117) {
            memmove(v136, v117, v142 - v117);
          }
          v144 = *(void **)(v110 - 64);
          *(void *)(v110 - 64) = v135;
          *(void *)(v110 - 56) = &v136[v143];
          *(void *)(v110 - 48) = &v124[8 * v126];
          uint64_t v103 = v167;
          if (v144) {
            operator delete(v144);
          }
        }
      }
LABEL_147:
      std::vector<long>::resize((uint64_t)v109, ((uint64_t)(v109[1] - *v109) >> 3) - v169);
      if (++v106 == v172) {
        goto LABEL_148;
      }
    }
  }
LABEL_149:
  unint64_t v145 = (v218[7] - v218[6]) >> 3;
  id v198 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(&v199, v145, &v198);
  v193 = (void *)MEMORY[0x1E4F143A8];
  v194.i64[0] = 3221225472;
  v194.i64[1] = (uint64_t)___ZL12sliceBucketsPNSt3__16vectorINS0_IN10ClipperLib8IntPointENS_9allocatorIS2_EEEENS3_IS5_EEEERNS0_IU8__strongP8PKStrokeNS3_ISB_EEEERNS0_I6BucketNS3_ISF_EEEERNS0_IU8__strongP7NSArrayISA_ENS3_ISM_EEEE_block_invoke;
  *(void *)&long long v195 = &__block_descriptor_64_e8_v16__0Q8l;
  *((void *)&v195 + 1) = &v201;
  *(void *)&long long v196 = v218 + 6;
  *((void *)&v196 + 1) = v159;
  v197 = &v199;
  dispatch_apply((v202 - v201) >> 6, 0, &v193);
  v193 = 0;
  v194.i64[0] = (uint64_t)&v193;
  v194.i64[1] = 0x4812000000;
  *(void *)&long long v195 = __Block_byref_object_copy__75;
  *((void *)&v195 + 1) = __Block_byref_object_dispose__76;
  *(void *)&long long v196 = "";
  id v192 = 0;
  std::vector<PKStroke * {__strong}>::vector((void *)&v196 + 1, [v161 count], &v192);
  v185 = 0;
  v186 = &v185;
  uint64_t v187 = 0x4812000000;
  v188 = __Block_byref_object_copy__82;
  v189 = __Block_byref_object_dispose__83;
  v190 = "";
  id v184 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(v191, [v161 count], &v184);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3321888768;
  aBlock[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_85;
  aBlock[3] = &unk_1F1FB0C08;
  id v146 = v162;
  id v182 = v146;
  memset(v183, 0, sizeof(v183));
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::__init_with_size[abi:ne180100]<NSArray<PKStroke *> * {__strong}*,NSArray<PKStroke *> * {__strong}*>((char *)v183, v199, v200, v200 - v199);
  v147 = _Block_copy(aBlock);
  size_t v148 = [v161 count];
  v175[0] = MEMORY[0x1E4F143A8];
  v175[1] = 3221225472;
  v175[2] = __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_87;
  v175[3] = &unk_1E64C8A58;
  id v149 = v161;
  id v176 = v149;
  v179 = &v193;
  v180 = &v185;
  id v150 = v147;
  v177 = self;
  id v178 = v150;
  dispatch_apply(v148, 0, v175);
  *(void *)buf = v159;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  MEMORY[0x1C8783F10](v159, 0x20C40960023A9);
  v151 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
  {
    v152 = v226;
    v153 = __p;
    uint64_t v154 = [v160 count];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = (v152 - v153) >> 3;
    __int16 v229 = 2048;
    uint64_t v230 = v154;
    __int16 v231 = 2048;
    double v232 = v155 - v158;
    _os_log_impl(&dword_1C44F8000, v151, OS_LOG_TYPE_DEFAULT, "Sliced %ld/%ld strokes in %fs.", buf, 0x20u);
  }

  if (v226 == __p || *(void *)(v194.i64[0] + 56) == *(void *)(v194.i64[0] + 48) || v186[7] == v186[6])
  {
    v156 = 0;
  }
  else
  {
    v156 = -[PKDrawing updateFromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:](self, "updateFromSlicedIntersectingIndexes:resultNewRoots:resultUpdatedStrokes:count:");
  }

  *(void *)buf = v183;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  _Block_object_dispose(&v185, 8);
  *(void *)buf = v191;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  _Block_object_dispose(&v193, 8);
  v185 = (void **)&v196 + 1;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v185);
  v193 = &v199;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);
  v193 = &v201;
  std::vector<Bucket>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);

  _Block_object_dispose(&v217, 8);
  v193 = &v223;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v193);
  if (__p)
  {
    v226 = (char *)__p;
    operator delete(__p);
  }

  return v156;
}

uint64_t __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (([v3 _isHidden] & 1) == 0 && (objc_msgSend(v3, "hasSubstrokes") & 1) == 0)
  {
    [v3 _bounds];
    if (CGRectIntersectsRect(v9, *(CGRect *)(a1 + 56)))
    {
      uint64_t v4 = [NSNumber numberWithUnsignedLong:(uint64_t)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56)- *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48)) >> 3];
      double v5 = *(void **)(a1 + 32);
      double v6 = [v3 _strokeUUID];
      [v5 setObject:v4 forKeyedSubscript:v6];

      std::vector<PKStroke * {__strong}>::push_back[abi:ne180100]((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), &v8);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }

  return 1;
}

void __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 8 * a2) _strokeMask];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 8 * a2) copyForMutation];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
    uint64_t v7 = *(void **)(v6 + 8 * a2);
    *(void *)(v6 + 8 * a2) = v5;

    id v8 = *(void **)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) + 8 * a2);
    [v8 generateMask];
  }
}

id __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_85(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 _strokeUUID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = *(id *)(*(void *)(a1 + 40) + 8 * (int)[v6 intValue]);
  }
  else
  {
    v10[0] = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  id v8 = v7;

  return v8;
}

void __43__PKDrawing_Slicing__sliceWithEraseStroke___block_invoke_87(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) + 8 * a2), v7);
  uint64_t v4 = [v7 _sliceWithSlicingBlock:*(void *)(a1 + 48) inDrawing:*(void *)(a1 + 40) newRootStroke:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) + 8 * a2];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48);
  uint64_t v6 = *(void **)(v5 + 8 * a2);
  *(void *)(v5 + 8 * a2) = v4;
}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
}

- (id)clipStroke:(id)a3 onPlane:(id)a4 renderMask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  uint64_t v12 = v11;
  if (v10)
  {
    -[PKDrawing _clipStroke:againstPaths:](self, "_clipStroke:againstPaths:", v11, [v10 maskPaths]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v11;
    if (v9)
    {
      [v11 _setClipPlane:v9];
      id v16 = 0;
      id v14 = [(PKDrawing *)self _clipStroke:v12 newRootStroke:&v16];
      id v13 = v16;
    }
  }

  return v13;
}

- (void)clipStrokesIfNeededOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  int v33 = a3;
  id v34 = a4;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x4812000000;
  uint64_t v57 = __Block_byref_object_copy__90;
  uint64_t v58 = __Block_byref_object_dispose__91;
  uint64_t v59 = "";
  double v61 = 0;
  uint64_t v62 = 0;
  __p = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x4812000000;
  uint64_t v50 = __Block_byref_object_copy__75;
  uint64_t v51 = __Block_byref_object_dispose__76;
  uint64_t v52 = "";
  memset(v53, 0, sizeof(v53));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v6 = [(PKDrawing *)self _rootStrokes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v64 count:16];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void ***)(*((void *)&v43 + 1) + 8 * i);
        double v63 = v11;
        if (([v11 _isHidden] & 1) == 0 && (objc_msgSend(v11, "hasSubstrokes") & 1) == 0)
        {
          uint64_t v12 = [v11 ink];
          id v13 = [v12 behavior];
          if ([v13 isEraser])
          {

            goto LABEL_30;
          }
          id v14 = [v11 _clipPlane];
          if (v14)
          {
          }
          else
          {
            uint64_t v15 = [v11 _renderMask];
            BOOL v16 = v15 == 0;

            if (v16) {
              goto LABEL_30;
            }
          }
          uint64_t v17 = v55;
          double v18 = (char *)v55[7];
          unint64_t v19 = v55[8];
          if ((unint64_t)v18 >= v19)
          {
            uint64_t v21 = (char *)v55[6];
            uint64_t v22 = (v18 - v21) >> 3;
            if ((unint64_t)(v22 + 1) >> 61) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v23 = v19 - (void)v21;
            unint64_t v24 = (uint64_t)(v19 - (void)v21) >> 2;
            if (v24 <= v22 + 1) {
              unint64_t v24 = v22 + 1;
            }
            if (v23 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v25 = v24;
            }
            if (v25)
            {
              uint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(v55 + 8), v25);
              uint64_t v21 = (char *)v17[6];
              double v18 = (char *)v17[7];
            }
            else
            {
              uint64_t v26 = 0;
            }
            uint64_t v27 = &v26[8 * v22];
            *(void *)uint64_t v27 = v8;
            id v20 = v27 + 8;
            while (v18 != v21)
            {
              uint64_t v28 = *((void *)v18 - 1);
              v18 -= 8;
              *((void *)v27 - 1) = v28;
              v27 -= 8;
            }
            v17[6] = (uint64_t)v27;
            v17[7] = (uint64_t)v20;
            v17[8] = (uint64_t)&v26[8 * v25];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            *(void *)double v18 = v8;
            id v20 = v18 + 8;
          }
          v17[7] = (uint64_t)v20;
          std::vector<PKStroke * {__strong}>::push_back[abi:ne180100](v48 + 6, (id *)&v63);
        }
LABEL_30:
        ++v8;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v64 count:16];
    }
    while (v7);
  }

  if (v48[7] != v48[6])
  {
    int64_t v29 = (void *)[(PKDrawing *)self copy];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke;
    aBlock[3] = &unk_1E64C8AA8;
    uint64_t v41 = &v47;
    id v30 = v29;
    id v38 = v30;
    int64_t v39 = self;
    size_t v42 = &v54;
    id v40 = v34;
    char v31 = (void (**)(void))_Block_copy(aBlock);
    CGAffineTransform v32 = v31;
    if (v33)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_98;
      block[3] = &unk_1E64C5390;
      unint64_t v36 = v31;
      dispatch_async(v33, block);
    }
    else
    {
      v31[2](v31);
    }
  }
  _Block_object_dispose(&v47, 8);
  double v63 = (void **)v53;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v63);
  _Block_object_dispose(&v54, 8);
  if (__p)
  {
    double v61 = __p;
    operator delete(__p);
  }
}

void __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke(uint64_t a1)
{
  v22[0] = 0;
  v22[1] = v22;
  void v22[2] = 0x4812000000;
  v22[3] = __Block_byref_object_copy__75;
  v22[4] = __Block_byref_object_dispose__76;
  v22[5] = "";
  unint64_t v2 = (uint64_t)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56)
               - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48)) >> 3;
  id v21 = 0;
  std::vector<PKStroke * {__strong}>::vector(v23, v2, &v21);
  v19[0] = 0;
  v19[1] = (void **)v19;
  void v19[2] = (void **)0x4812000000;
  void v19[3] = (void **)__Block_byref_object_copy__82;
  v19[4] = (void **)__Block_byref_object_dispose__83;
  v19[5] = (void **)"";
  unint64_t v3 = (uint64_t)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56)
               - *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48)) >> 3;
  id v18 = 0;
  std::vector<NSArray<PKStroke *> * {__strong},std::allocator<NSArray<PKStroke *> * {__strong}>>::vector(v20, v3, &v18);
  uint64_t v4 = *(void *)(a1 + 56);
  size_t v5 = (uint64_t)(*(void *)(*(void *)(v4 + 8) + 56) - *(void *)(*(void *)(v4 + 8) + 48)) >> 3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_2;
  uint64_t v12 = &unk_1E64C8A80;
  uint64_t v15 = v4;
  BOOL v16 = v22;
  id v6 = *(id *)(a1 + 32);
  uint64_t v17 = v19;
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  dispatch_apply(v5, 0, &v9);
  id v8 = (id)[*(id *)(a1 + 32) updateFromSlicedIntersectingIndexes:v9 resultNewRoots:v10 resultUpdatedStrokes:v11 count:v12];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  _Block_object_dispose(v19, 8);
  unint64_t v24 = (void **)v20;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v24);
  _Block_object_dispose(v22, 8);
  v19[0] = (void **)v23;
  std::vector<PKStroke * {__strong}>::__destroy_vector::operator()[abi:ne180100](v19);
}

void __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48) + 8 * a2);
  id v5 = v4;
  id v6 = [v5 _renderMask];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v5 _renderMask];
    uint64_t v9 = objc_msgSend(v7, "_clipStroke:againstPaths:", v5, objc_msgSend(v8, "maskPaths"));
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
    id v11 = *(void **)(v10 + 8 * a2);
    *(void *)(v10 + 8 * a2) = v9;
  }
  else
  {
    uint64_t v12 = [v5 _clipPlane];

    if (!v12) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) + 8 * a2), v4);
    uint64_t v13 = [*(id *)(a1 + 32) _clipStroke:v5 newRootStroke:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) + 8 * a2];
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48);
    id v8 = *(void **)(v14 + 8 * a2);
    *(void *)(v14 + 8 * a2) = v13;
  }

LABEL_6:
  uint64_t v15 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void **)(a1 + 40);
    int v19 = 138412546;
    id v20 = v17;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_debug_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEBUG, "Drawing %@ merged clipped/masked stroke %@", (uint8_t *)&v19, 0x16u);
  }

  BOOL v16 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [v5 _groupID];
    int v19 = 138412290;
    id v20 = v18;
    _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Stroke merged into group: %@", (uint8_t *)&v19, 0xCu);
  }
}

uint64_t __60__PKDrawing_Slicing__clipStrokesIfNeededOnQueue_completion___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 onscreenVisibleStrokes:(id)a5
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v6 = -[PKDrawing strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:](self, "strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:", v8, a5, a3.x, a3.y, a4.x, a4.y, 10.0);

  return v6;
}

- (id)_strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 transform:(CGAffineTransform *)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  uint64_t v10 = [(PKDrawing *)self strokes];
  id v11 = -[PKDrawing strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:](self, "strokesIntersectedByPoint:prevPoint:minThreshold:transform:onscreenVisibleStrokes:", &v13, v10, v8, v7, x, y, 10.0);

  return v11;
}

- (id)strokesIntersectedByPoint:(CGPoint)a3 prevPoint:(CGPoint)a4 minThreshold:(double)a5 transform:(CGAffineTransform *)a6 onscreenVisibleStrokes:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v48 = a7;
  long long v13 = *(_OWORD *)&a6->c;
  *(_OWORD *)&v61.a = *(_OWORD *)&a6->a;
  *(_OWORD *)&v61.c = v13;
  *(_OWORD *)&v61.tdouble x = *(_OWORD *)&a6->tx;
  if (!CGAffineTransformIsIdentity(&v61))
  {
    long long v14 = *(_OWORD *)&a6->c;
    *(_OWORD *)&v59.a = *(_OWORD *)&a6->a;
    *(_OWORD *)&v59.c = v14;
    *(_OWORD *)&v59.tdouble x = *(_OWORD *)&a6->tx;
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformInvert(&v60, &v59);
    double v15 = v10 * v60.d + v60.b * v11;
    double v11 = v60.tx + v10 * v60.c + v60.a * v11;
    double v10 = v60.ty + v15;
    double v16 = y * v60.d + v60.b * x;
    double x = v60.tx + y * v60.c + v60.a * x;
    double y = v60.ty + v16;
  }
  [(PKDrawing *)self _eraserStrokeBounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  id v50 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v46 = self;
  if (v48)
  {
    id v47 = v48;
  }
  else
  {
    id v47 = [(PKDrawing *)self strokes];
  }
  unint64_t v25 = [MEMORY[0x1E4F1CA80] set];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v26 = v47;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v26);
        }
        id v30 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        char v31 = [v30 ink];
        CGAffineTransform v32 = [v31 behavior];
        char v33 = [v32 isEraser];

        if ((v33 & 1) == 0)
        {
          [v30 _bounds];
          v67.origin.double x = v18;
          v67.origin.double y = v20;
          v67.size.CGFloat width = v22;
          v67.size.CGFloat height = v24;
          if (!CGRectIntersectsRect(v66, v67))
          {
            if (objc_msgSend(v30, "intersectsLineFrom:to:minThreshold:", v11, v10, x, y, a5))
            {
              [v50 addObject:v30];
              id v34 = [v30 _groupID];
              BOOL v35 = v34 == 0;

              if (!v35)
              {
                unint64_t v36 = [v30 _groupID];
                [v25 addObject:v36];
              }
            }
          }
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v27);
  }

  if ([v25 count])
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v37 = [(PKDrawing *)v46 strokes];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v52 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          size_t v42 = [v41 _groupID];
          if (v42)
          {
            long long v43 = [v41 _groupID];
            int v44 = [v25 containsObject:v43];

            if (v44) {
              [v50 addObject:v41];
            }
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
      }
      while (v38);
    }
  }

  return v50;
}

- (id)intersectedStrokesFromStroke:(id)a3 visibleOnscreenStrokes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PKDrawing_IntersectionAdditions__intersectedStrokesFromStroke_visibleOnscreenStrokes___block_invoke;
  v11[3] = &unk_1E64CA0F8;
  id v8 = v6;
  id v12 = v8;
  [v8 _bounds];
  uint64_t v9 = -[PKDrawing intersectedStrokesTest:inBounds:visibleOnscreenStrokes:](self, "intersectedStrokesTest:inBounds:visibleOnscreenStrokes:", v11, v7);

  return v9;
}

uint64_t __88__PKDrawing_IntersectionAdditions__intersectedStrokesFromStroke_visibleOnscreenStrokes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 intersectsClosedStroke:*(void *)(a1 + 32)];
}

- (id)intersectedStrokesFromRect:(CGRect)a3 visibleOnscreenStrokes:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __86__PKDrawing_IntersectionAdditions__intersectedStrokesFromRect_visibleOnscreenStrokes___block_invoke;
  _OWORD v6[3] = &__block_descriptor_64_e18_B16__0__PKStroke_8l;
  CGRect v7 = a3;
  uint64_t v4 = -[PKDrawing intersectedStrokesTest:inBounds:visibleOnscreenStrokes:](self, "intersectedStrokesTest:inBounds:visibleOnscreenStrokes:", v6, a4);

  return v4;
}

uint64_t __86__PKDrawing_IntersectionAdditions__intersectedStrokesFromRect_visibleOnscreenStrokes___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "intersectsRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (id)intersectedStrokesTest:(id)a3 inBounds:(CGRect)a4 visibleOnscreenStrokes:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = (unsigned int (**)(id, void *))a3;
  id v11 = a5;
  uint64_t v38 = v11;
  id v41 = [MEMORY[0x1E4F1CA70] orderedSet];
  if (v11)
  {
    id v39 = v11;
  }
  else
  {
    id v39 = [(PKDrawing *)self strokes];
  }
  [(PKDrawing *)self _eraserStrokeBounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v20 = [MEMORY[0x1E4F1CA80] set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = v39;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v21);
        }
        unint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v25 _bounds];
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        if (CGRectIntersectsRect(v54, v56))
        {
          [v25 _bounds];
          v57.origin.CGFloat x = v13;
          v57.origin.CGFloat y = v15;
          v57.size.CGFloat width = v17;
          v57.size.CGFloat height = v19;
          if (!CGRectIntersectsRect(v55, v57))
          {
            if (v40[2](v40, v25))
            {
              [v41 addObject:v25];
              id v26 = [v25 _groupID];
              BOOL v27 = v26 == 0;

              if (!v27)
              {
                uint64_t v28 = [v25 _groupID];
                [v20 addObject:v28];
              }
            }
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v22);
  }

  if ([v20 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v29 = v21;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v29);
          }
          char v33 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          id v34 = [v33 _groupID];
          if (v34)
          {
            BOOL v35 = [v33 _groupID];
            int v36 = [v20 containsObject:v35];

            if (v36) {
              [v41 addObject:v33];
            }
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v30);
    }
  }

  return v41;
}

- (CGRect)_eraserStrokeBounds
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [(PKDrawing *)self strokes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = [v10 ink];
        double v12 = [v11 behavior];
        int v13 = [v12 isEraser];

        if (v13)
        {
          [v10 _bounds];
          v31.origin.CGFloat x = v14;
          v31.origin.CGFloat y = v15;
          v31.size.CGFloat width = v16;
          v31.size.CGFloat height = v17;
          v28.origin.CGFloat x = x;
          v28.origin.CGFloat y = y;
          v28.size.CGFloat width = width;
          v28.size.CGFloat height = height;
          CGRect v29 = CGRectUnion(v28, v31);
          CGFloat x = v29.origin.x;
          CGFloat y = v29.origin.y;
          CGFloat width = v29.size.width;
          CGFloat height = v29.size.height;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (id)intersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  double v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(PKDrawing *)self strokes];
  }
  CGFloat v14 = v13;
  CGFloat v15 = +[PKClusteringUtility _geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:](PKClusteringUtility, "_geometricBasedStrokeClusteringFromPoint:visibleStrokes:selectionType:inputType:", v13, a4, a5, x, y);

  return v15;
}

- (void)fetchIntersectedStrokesBetweenPoint:(CGPoint)a3 otherPoint:(CGPoint)a4 visibleOnscreenStrokes:(id)a5 completion:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v15 = a5;
  id v12 = a6;
  if (v15)
  {
    id v13 = v15;
  }
  else
  {
    id v13 = [(PKDrawing *)self strokes];
  }
  CGFloat v14 = v13;
  +[PKClusteringUtility _fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:otherPoint:visibleStrokes:completion:](PKClusteringUtility, "_fetchIntersectedStrokesForGeometricBasedStrokeClusteringBetweenPoint:otherPoint:visibleStrokes:completion:", v13, v12, v10, v9, x, y);
}

+ (CGRect)_boundingBoxForStrokes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "_bounds", (void)v20);
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

+ (CGRect)_boundingBoxForStrokeArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "_bounds", (void)v20);
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

+ (id)_findRightmostStrokes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {
    CGFloat v14 = v5;
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)v17;
  double v9 = -1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      objc_msgSend(v11, "_bounds", (void)v16);
      double MaxX = CGRectGetMaxX(v23);
      if (MaxX > v9)
      {
        id v13 = v11;

        double v9 = MaxX;
        id v6 = v13;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);

  if (v6)
  {
    [v4 addObject:v6];
    CGFloat v14 = +[PKDrawing _otherStrokesCloseToLeft:0 forStrokes:v5 withClosestStroke:v6];
    [v4 addObjectsFromArray:v14];
LABEL_13:
  }

  return v4;
}

+ (id)_findLeftmostStrokes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {
    CGFloat v14 = v5;
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)v17;
  double v9 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      objc_msgSend(v11, "_bounds", (void)v16);
      double MinX = CGRectGetMinX(v23);
      if (MinX < v9)
      {
        id v13 = v11;

        double v9 = MinX;
        id v6 = v13;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);

  if (v6)
  {
    [v4 addObject:v6];
    CGFloat v14 = +[PKDrawing _otherStrokesCloseToLeft:1 forStrokes:v5 withClosestStroke:v6];
    [v4 addObjectsFromArray:v14];
LABEL_13:
  }

  return v4;
}

+ (id)_otherStrokesCloseToLeft:(BOOL)a3 forStrokes:(id)a4 withClosestStroke:(id)a5
{
  BOOL v6 = a3;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  double v9 = [MEMORY[0x1E4F1CA48] array];
  +[PKDrawing _boundingBoxForStrokes:v7];
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  if (v6)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v10);
    v95.origin.CGFloat x = v14;
    v95.origin.CGFloat y = v15;
    v95.size.CGFloat width = v16;
    v95.size.CGFloat height = v17;
    double MinY = CGRectGetMinY(v95);
    v96.origin.CGFloat x = v14;
    v96.origin.CGFloat y = v15;
    v96.size.CGFloat width = v16;
    v96.size.CGFloat height = v17;
    double MaxX = CGRectGetMinX(v96);
  }
  else
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v10);
    v97.origin.CGFloat x = v14;
    v97.origin.CGFloat y = v15;
    v97.size.CGFloat width = v16;
    v97.size.CGFloat height = v17;
    double MinY = CGRectGetMinY(v97);
    v98.origin.CGFloat x = v14;
    v98.origin.CGFloat y = v15;
    v98.size.CGFloat width = v16;
    v98.size.CGFloat height = v17;
    double MaxX = CGRectGetMaxX(v98);
  }
  double v85 = MaxX;
  v99.origin.CGFloat x = v14;
  v99.origin.CGFloat y = v15;
  v99.size.CGFloat width = v16;
  v99.size.CGFloat height = v17;
  double MaxY = CGRectGetMaxY(v99);
  [v8 _bounds];
  CGFloat v82 = v20;
  CGFloat v83 = v19;
  CGFloat rect = v21;
  CGFloat v23 = v22;
  [v8 _bounds];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  [v8 _bounds];
  CGFloat v80 = v32;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  v100.origin.CGFloat x = v25;
  v100.origin.CGFloat y = v27;
  v100.size.CGFloat width = v29;
  v100.size.CGFloat height = v31;
  double MidX = CGRectGetMidX(v100);
  v101.origin.CGFloat x = v25;
  v101.origin.CGFloat y = v27;
  v101.size.CGFloat width = v29;
  v101.size.CGFloat height = v31;
  double MidY = CGRectGetMidY(v101);
  v102.origin.CGFloat x = v34;
  v102.origin.CGFloat y = v80;
  v102.size.CGFloat width = v36;
  v102.size.CGFloat height = v38;
  double v40 = CGRectGetMidX(v102);
  v103.origin.CGFloat x = v34;
  v103.origin.CGFloat y = v80;
  v103.size.CGFloat width = v36;
  v103.size.CGFloat height = v38;
  double v41 = CGRectGetMidY(v103);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v42 = v7;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v88 objects:v92 count:16];
  if (v43)
  {
    double v44 = fmax((MidY - MinY) * (MidY - MinY) + (MidX - MinX) * (MidX - MinX), (v41 - MaxY) * (v41 - MaxY) + (v40 - v85) * (v40 - v85));
    uint64_t v45 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v89 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        if ([v47 isEqual:v8]) {
          continue;
        }
        [v47 _bounds];
        CGFloat x = v104.origin.x;
        CGFloat y = v104.origin.y;
        CGFloat width = v104.size.width;
        CGFloat height = v104.size.height;
        double v52 = CGRectGetMidX(v104);
        v105.origin.CGFloat x = x;
        v105.origin.CGFloat y = y;
        v105.size.CGFloat width = width;
        v105.size.CGFloat height = height;
        double v53 = CGRectGetMidY(v105);
        CGFloat v54 = x;
        CGFloat v55 = y;
        CGFloat v56 = width;
        CGFloat v57 = height;
        if (v6)
        {
          double v58 = CGRectGetMinX(*(CGRect *)&v54);
          v106.origin.CGFloat y = v82;
          v106.origin.CGFloat x = v83;
          v106.size.CGFloat width = rect;
          v106.size.CGFloat height = v23;
          BOOL v59 = v58 < CGRectGetMaxX(v106);
        }
        else
        {
          double v60 = CGRectGetMaxX(*(CGRect *)&v54);
          v107.origin.CGFloat y = v82;
          v107.origin.CGFloat x = v83;
          v107.size.CGFloat width = rect;
          v107.size.CGFloat height = v23;
          BOOL v59 = v60 > CGRectGetMinX(v107);
        }
        double v61 = (v53 - MinY) * (v53 - MinY) + (v52 - MinX) * (v52 - MinX);
        if (((v53 - MaxY) * (v53 - MaxY) + (v52 - v85) * (v52 - v85) < v44 || v61 < v44) && v59) {
          goto LABEL_32;
        }
        objc_msgSend(v47, "_bounds", v61);
        double v65 = v64;
        double v67 = v66;
        double v69 = v68;
        double v71 = v70;
        [v8 _bounds];
        if (v65 >= v72)
        {
          if (v72 + v74 > v65)
          {
LABEL_23:
            char v76 = 0;
            goto LABEL_26;
          }
        }
        else if (v65 + v69 > v72)
        {
          goto LABEL_23;
        }
        char v76 = 1;
LABEL_26:
        if (v67 >= v73)
        {
          double v61 = v73 + v75;
          BOOL v77 = v73 + v75 > v67;
        }
        else
        {
          double v61 = v67 + v71;
          BOOL v77 = v67 + v71 > v73;
        }
        if (!v77) {
          char v76 = 1;
        }
        if ((v76 & 1) == 0)
        {
LABEL_32:
          objc_msgSend(v9, "addObject:", v47, v61);
          continue;
        }
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v88 objects:v92 count:16];
    }
    while (v43);
  }

  return v9;
}

+ (PKDrawing)drawingWithData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithData:v4 error:0];

  return (PKDrawing *)v5;
}

- (int64_t)_minimumSerializationVersion
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v2 = [(PKDrawing *)self _rootStrokes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    int64_t v5 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v7 hasSubstrokes]) {
          goto LABEL_17;
        }
        id v8 = [v7 _strokeMask];
        BOOL v9 = v8 == 0;

        if (!v9 || [v7 _shapeType]) {
          goto LABEL_17;
        }
        CGFloat v10 = [v7 _groupID];
        if (v10)
        {

LABEL_17:
          int64_t v5 = +[PKDrawing _currentSerializationVersion];
          goto LABEL_18;
        }
        double v11 = [v7 _renderGroupID];
        BOOL v12 = v11 == 0;

        if (!v12) {
          goto LABEL_17;
        }
        double v13 = [v7 ink];
        if ([v13 version] == 2)
        {
          int64_t v5 = +[PKDrawing _currentSerializationVersion];

          goto LABEL_18;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v5 = 1;
  }
LABEL_18:

  return v5;
}

@end