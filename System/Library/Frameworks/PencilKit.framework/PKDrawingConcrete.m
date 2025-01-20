@interface PKDrawingConcrete
+ (CGAffineTransform)_orientationTransform:(SEL)a3 size:(int64_t)a4;
+ (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3 forUUID:(_PKStrokeID *)a4;
+ (id)_defaultConversionQueue;
- ($3CC19D079FD0B010EE84973AA846B91B)_drawingStrokeInfoIsLegacyDrawing:(SEL)a3;
- (BOOL)_hasReplicaUUID;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)_transformForImageWithSize:(SEL)a3;
- (CGRect)_canvasBounds;
- (CGRect)bounds;
- (CGSize)_orientedDrawingSize;
- (CGSize)_unscaledOrientedDrawingSize;
- (Class)strokeClass;
- (Class)strokeSelectionClass;
- (NSMutableArray)_allStrokes;
- (NSUUID)nsuuid;
- (NSUUID)replicaUUID;
- (PKDrawingConcrete)init;
- (PKDrawingConcrete)initWithArchive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5;
- (PKDrawingConcrete)initWithData:(id)a3 error:(id *)a4;
- (PKDrawingConcrete)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5;
- (PKDrawingConcrete)initWithDrawing:(id)a3;
- (PKDrawingConcrete)initWithLegacyArchive:(const void *)a3;
- (PKDrawingConcrete)initWithLegacyData:(id)a3;
- (PKDrawingConcrete)initWithStrokes:(id)a3 fromDrawing:(id)a4;
- (PKDrawingConcrete)initWithUUID:(id)a3 strokes:(id)a4 version:(id)a5 canvasBounds:(CGRect)a6 boundsVersion:(_PKStrokeID *)a7 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a8;
- (PKDrawingConcrete)initWithV1Archive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4;
- (PKDrawingConcrete)initWithV1Data:(id)a3 loadNonInkingStrokes:(BOOL)a4;
- (PKVectorTimestamp)version;
- (_PKStrokeID)boundsVersion;
- (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3;
- (double)_conversionScaleFactor;
- (id).cxx_construct;
- (id)_data;
- (id)_dataInUnknownFields;
- (id)_initWithUnzippedData:(id)a3 error:(id *)a4;
- (id)_initWithUnzippedData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5;
- (id)_newStroke:(id)a3 withGroupID:(id)a4;
- (id)_newStroke:(id)a3 withInk:(id)a4;
- (id)_rootStrokes;
- (id)_stroke:(id)a3 transformed:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (id)_strokeForIdentifier:(id)a3;
- (id)_strokesIdentifierMap;
- (id)_upgradeOnQueue:(id)a3 isLegacyDrawing:(BOOL)a4 completionBlock:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutInternalStrokes;
- (id)newStroke;
- (id)serialize;
- (id)serializeTransiently;
- (id)serializeWithVersion:(int64_t)a3;
- (id)undoableAddNewStrokes:(id)a3;
- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4;
- (id)undoableDeleteStrokes:(id)a3;
- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5;
- (id)undoableSetStrokes:(id)a3 inks:(id)a4;
- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6;
- (id)uuid;
- (id)v1SerializeWithPathData:(BOOL)a3;
- (id)v1SerializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4;
- (id)visibleStrokeForInsertingStroke:(id)a3;
- (int64_t)_orientation;
- (int64_t)saveToArchive:(void *)a3 withPathData:(BOOL)a4;
- (shared_ptr<PKProtobufUnknownFields>)_unknownFields;
- (unint64_t)hash;
- (unint64_t)mergeWithDrawing:(id)a3;
- (unsigned)saveToV1Archive:(void *)a3 withPathData:(BOOL)a4;
- (void)_addTestDataToUnknownFields;
- (void)_collectAllStrokesIn:(id)a3 into:(id)a4;
- (void)_mergeStroke:(id)a3;
- (void)_removeHiddenAndEraserStrokes;
- (void)_removeInvisibleStrokes;
- (void)_setAllStrokes:(id)a3;
- (void)_setUUID:(id)a3;
- (void)_updateStrokes:(id)a3 updateBlock:(id)a4;
- (void)_upgradeLegacyPenInks;
- (void)addNewStroke:(id)a3;
- (void)dealloc;
- (void)deleteStrokes:(id)a3;
- (void)didUpdate;
- (void)invalidateStrokeBounds;
- (void)invalidateVisibleStrokes;
- (void)normalizeUUIDsWithDrawing:(id)a3;
- (void)setBoundsVersion:(_PKStrokeID *)a3;
- (void)setStrokeSortIDForInsertion:(id)a3;
- (void)setStrokes:(id)a3 groupID:(id)a4;
- (void)setStrokes:(id)a3 hidden:(BOOL)a4;
- (void)setStrokes:(id)a3 inks:(id)a4;
- (void)setVersion:(id)a3;
- (void)set_canvasBounds:(CGRect)a3;
- (void)set_orientation:(int64_t)a3;
- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5;
- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4;
- (void)updateStrokes:(id)a3;
- (void)willMergeWithDrawing:(id)a3;
@end

@implementation PKDrawingConcrete

- (id).cxx_construct
{
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  return self;
}

- (void)dealloc
{
  if (self->_replicaUUID)
  {
    v3 = +[PKReplicaManager sharedReplicaManager];
    [v3 returnReplicaForDrawing:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PKDrawingConcrete;
  [(PKDrawing *)&v4 dealloc];
}

- (PKDrawingConcrete)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKDrawingConcrete;
  v2 = [(PKDrawing *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allStrokes = v2->_allStrokes;
    v2->_allStrokes = v5;

    v7 = objc_alloc_init(PKVectorTimestamp);
    version = v2->_version;
    v2->_version = v7;

    v9 = (CGPoint *)MEMORY[0x1E4F1DB20];
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v2->__canvasBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v2->__canvasBounds.size = v10;
    CGSize v11 = (CGSize)v9[1];
    v2->__bounds.origin = *v9;
    v2->__bounds.size = v11;
  }
  return v2;
}

- (void).cxx_destruct
{
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_replicaUUID, 0);
  objc_storeStrong((id *)&self->_allStrokes, 0);
  objc_storeStrong((id *)&self->_strokesIdentifierMap, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (PKDrawingConcrete)initWithUUID:(id)a3 strokes:(id)a4 version:(id)a5 canvasBounds:(CGRect)a6 boundsVersion:(_PKStrokeID *)a7 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a8
{
  ptr = a8.__ptr_;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PKDrawingConcrete;
  v20 = [(PKDrawing *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a3);
    uint64_t v22 = [v18 mutableCopy];
    allStrokes = v21->_allStrokes;
    v21->_allStrokes = (NSMutableArray *)v22;

    objc_storeStrong((id *)&v21->_version, a5);
    v21->__canvasBounds.origin.CGFloat x = x;
    v21->__canvasBounds.origin.CGFloat y = y;
    v21->__canvasBounds.size.CGFloat width = width;
    v21->__canvasBounds.size.CGFloat height = height;
    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v21->__bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v21->__bounds.size = v24;
    v26 = *(PKProtobufUnknownFields **)ptr;
    uint64_t v25 = *((void *)ptr + 1);
    if (v25) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v21->_unknownFields.__cntrl_;
    v21->_unknownFields.__ptr_ = v26;
    v21->_unknownFields.__cntrl_ = (__shared_weak_count *)v25;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }

  return v21;
}

- (PKDrawingConcrete)initWithDrawing:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (id *)a3;
  v26[0].receiver = self;
  v26[0].super_class = (Class)PKDrawingConcrete;
  id v5 = [(objc_super *)v26 initWithDrawing:v4];
  if (v5)
  {
    uint64_t v6 = [v4 nsuuid];
    v7 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;

    v8 = [v4 _allStrokes];
    uint64_t v9 = [v8 mutableCopy];
    CGSize v10 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v9;

    CGSize v11 = [v4 version];
    uint64_t v12 = [v11 copy];
    objc_super v13 = (void *)*((void *)v5 + 21);
    *((void *)v5 + 21) = v12;

    [v4 _canvasBounds];
    *((void *)v5 + 12) = v14;
    *((void *)v5 + 13) = v15;
    *((void *)v5 + 14) = v16;
    *((void *)v5 + 15) = v17;
    long long v18 = *((_OWORD *)v4 + 9);
    *((_OWORD *)v5 + 8) = *((_OWORD *)v4 + 8);
    *((_OWORD *)v5 + 9) = v18;
    [v4 boundsVersion];
    uint64_t v19 = v27;
    *((objc_super *)v5 + 12) = v26[1];
    *((void *)v5 + 26) = v19;
    uint64_t v20 = [v4[10] mutableCopy];
    v21 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v20;

    id v23 = v4[22];
    uint64_t v22 = (atomic_ullong *)v4[23];
    if (v22) {
      atomic_fetch_add_explicit(v22 + 1, 1uLL, memory_order_relaxed);
    }
    CGSize v24 = (std::__shared_weak_count *)*((void *)v5 + 23);
    *((void *)v5 + 22) = v23;
    *((void *)v5 + 23) = v22;
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
  }

  return (PKDrawingConcrete *)v5;
}

- (PKDrawingConcrete)initWithStrokes:(id)a3 fromDrawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKDrawingConcrete *)self init];
  if (!v8) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 mutableCopy];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGSize v10 = [v6 array];
      uint64_t v11 = [v10 mutableCopy];
      allStrokes = v8->_allStrokes;
      v8->_allStrokes = (NSMutableArray *)v11;

      goto LABEL_8;
    }
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  }
  CGSize v10 = v8->_allStrokes;
  v8->_allStrokes = (NSMutableArray *)v9;
LABEL_8:

  if (v7)
  {
    objc_super v13 = [v7 version];
    uint64_t v14 = [v13 copy];
    version = v8->_version;
    v8->_version = (PKVectorTimestamp *)v14;

    [v7 _canvasBounds];
    v8->__canvasBounds.origin.CGFloat x = v16;
    v8->__canvasBounds.origin.CGFloat y = v17;
    v8->__canvasBounds.size.CGFloat width = v18;
    v8->__canvasBounds.size.CGFloat height = v19;
  }
LABEL_10:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_replicaUUID)
  {
    id v5 = +[PKReplicaManager sharedReplicaManager];
    [v5 updateVersionForDrawing:self];
  }
  id v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v6 initWithDrawing:self];
}

- (NSUUID)nsuuid
{
  return self->_uuid;
}

- (Class)strokeClass
{
  return (Class)objc_opt_class();
}

- (id)newStroke
{
  return objc_alloc_init(_PKStrokeConcrete);
}

- (Class)strokeSelectionClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithoutInternalStrokes
{
  v2 = [[PKDrawingConcrete alloc] initWithDrawing:self];
  uint64_t v3 = [(PKDrawingConcrete *)v2 _allStrokes];
  objc_super v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_7];
  [v3 filterUsingPredicate:v4];

  [(PKDrawingConcrete *)v2 invalidateVisibleStrokes];
  return v2;
}

uint64_t __47__PKDrawingConcrete_copyWithoutInternalStrokes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isInternal] ^ 1;
}

- (id)uuid
{
  return self->_uuid;
}

- (void)_setUUID:(id)a3
{
}

- (id)_rootStrokes
{
  return self->_allStrokes;
}

- (NSMutableArray)_allStrokes
{
  return self->_allStrokes;
}

- (void)_setAllStrokes:(id)a3
{
  id v6 = a3;
  objc_super v4 = (NSMutableArray *)[v6 mutableCopy];
  allStrokes = self->_allStrokes;
  self->_allStrokes = v4;
}

- (NSUUID)replicaUUID
{
  replicaUUID = self->_replicaUUID;
  if (!replicaUUID)
  {
    objc_super v4 = +[PKReplicaManager sharedReplicaManager];
    id v5 = [v4 checkoutReplicaUUIDForDrawing:self];
    id v6 = self->_replicaUUID;
    self->_replicaUUID = v5;

    replicaUUID = self->_replicaUUID;
  }

  return replicaUUID;
}

- (BOOL)_hasReplicaUUID
{
  return self->_replicaUUID != 0;
}

- (void)_collectAllStrokesIn:(id)a3 into:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _strokeUUID];
  [v7 setObject:v6 forKeyedSubscript:v8];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v9 = objc_msgSend(v6, "_substrokesInDrawing:", self, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [(PKDrawingConcrete *)self _collectAllStrokesIn:*(void *)(*((void *)&v13 + 1) + 8 * v12++) into:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)_strokesIdentifierMap
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  strokesIdentifierMap = v2->_strokesIdentifierMap;
  if (!strokesIdentifierMap)
  {
    objc_super v4 = [(PKDrawing *)v2 strokes];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = v2->_strokesIdentifierMap;
    v2->_strokesIdentifierMap = (NSMutableDictionary *)v5;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v2->_allStrokes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          -[PKDrawingConcrete _collectAllStrokesIn:into:](v2, "_collectAllStrokesIn:into:", *(void *)(*((void *)&v13 + 1) + 8 * i), v2->_strokesIdentifierMap, (void)v13);
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    strokesIdentifierMap = v2->_strokesIdentifierMap;
  }
  uint64_t v11 = strokesIdentifierMap;
  objc_sync_exit(v2);

  return v11;
}

- (id)_strokeForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PKDrawingConcrete *)self _strokesIdentifierMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CGRect)_canvasBounds
{
  double x = self->__canvasBounds.origin.x;
  double y = self->__canvasBounds.origin.y;
  double width = self->__canvasBounds.size.width;
  double height = self->__canvasBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_canvasBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_canvasBounds = &self->__canvasBounds;
  if (!CGRectEqualToRect(a3, self->__canvasBounds))
  {
    p_canvasBounds->origin.CGFloat x = x;
    p_canvasBounds->origin.CGFloat y = y;
    p_canvasBounds->size.CGFloat width = width;
    p_canvasBounds->size.CGFloat height = height;
    ++self->_boundsVersion.clock;
    id v12 = [(PKDrawingConcrete *)self replicaUUID];
    [v12 getUUIDBytes:self->_boundsVersion.replicaUUID];

    id v13 = [(PKDrawingConcrete *)self version];
    uint64_t v9 = [(PKDrawingConcrete *)self replicaUUID];
    uint64_t v10 = [v13 clockForUUID:v9];

    if (!v10)
    {
      id v14 = [(PKDrawingConcrete *)self version];
      uint64_t v11 = [(PKDrawingConcrete *)self replicaUUID];
      [v14 setClock:0 forUUID:v11];
    }
  }
}

- (void)invalidateStrokeBounds
{
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->__bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->__bounds.size = v2;
}

- (void)invalidateVisibleStrokes
{
  v5.receiver = self;
  v5.super_class = (Class)PKDrawingConcrete;
  [(PKDrawing *)&v5 invalidateVisibleStrokes];
  strokesIdentifierMap = self->_strokesIdentifierMap;
  self->_strokesIdentifierMap = 0;

  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->__bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->__bounds.size = v4;
}

- (CGRect)bounds
{
  CGSize v2 = self;
  objc_sync_enter(v2);
  p_CGFloat x = &v2->__bounds.origin.x;
  if (CGRectIsNull(v2->__bounds))
  {
    [(PKDrawing *)v2 calculateStrokeBounds];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
    *p_CGFloat x = v4;
    v2->__bounds.origin.CGFloat y = v6;
    v2->__bounds.size.CGFloat width = v8;
    v2->__bounds.size.CGFloat height = v10;
  }
  else
  {
    CGFloat x = *p_x;
    CGFloat y = v2->__bounds.origin.y;
    CGFloat width = v2->__bounds.size.width;
    CGFloat height = v2->__bounds.size.height;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (!CGRectIsNull(v16))
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v18 = CGRectIntegral(v17);
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
  }
  objc_sync_exit(v2);

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setStrokeSortIDForInsertion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0uLL;
  objc_super v5 = [(PKDrawingConcrete *)self _allStrokes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PKDrawingConcrete *)self _allStrokes];
    double v8 = [v7 lastObject];

    if (v8)
    {
      [v8 _sortID];
      unsigned int v9 = *(_DWORD *)v30;
      unsigned int v10 = *(_DWORD *)&v30[20];
    }
    else
    {
      unsigned int v10 = 0;
      unsigned int v9 = 0;
      memset(v30, 0, sizeof(v30));
    }
    long long v31 = *(_OWORD *)&v30[4];
  }
  else
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
  }
  uint64_t v11 = [(PKDrawingConcrete *)self version];
  double v12 = [(PKDrawingConcrete *)self replicaUUID];
  double v13 = [v11 clockElementForUUID:v12];

  long long v29 = 0uLL;
  double v14 = [(PKDrawingConcrete *)self replicaUUID];
  [v14 getUUIDBytes:&v29];

  unsigned int v15 = [v13 clock];
  unsigned int v16 = [v13 subclock];
  long long v28 = v29;
  v26.subclock = v16;
  v27.clock = v9;
  *(_OWORD *)v27.replicaUUID = v31;
  v27.subclock = v10;
  v26.clock = v15;
  *(_OWORD *)v26.replicaUUID = v29;
  if (_PKStrokeIDCompare(&v27, &v26) == -1)
  {
    long long v31 = v28;
    unsigned int v9 = v15;
    unsigned int v10 = v16;
  }
  memset(v30, 0, sizeof(v30));
  unsigned int v23 = v9;
  long long v24 = v31;
  unsigned int v25 = v10;
  [(PKDrawingConcrete *)self newStrokeIDGreaterThan:&v23];
  long long v21 = *(_OWORD *)v30;
  uint64_t v22 = *(void *)&v30[16];
  objc_msgSend(v4, "set_sortID:", &v21);
  CGRect v17 = [(PKDrawingConcrete *)self version];
  uint64_t v18 = *(unsigned int *)v30;
  uint64_t v19 = *(unsigned int *)&v30[20];
  uint64_t v20 = [(PKDrawingConcrete *)self replicaUUID];
  [v17 setClock:v18 subclock:v19 forUUID:v20];
}

- (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3
{
  id v4 = [(PKDrawingConcrete *)self replicaUUID];
  +[PKDrawingConcrete newStrokeIDGreaterThan:&v6 forUUID:v4];

  return result;
}

+ (_PKStrokeID)newStrokeIDGreaterThan:(SEL)a3 forUUID:(_PKStrokeID *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  memset(uu2, 0, sizeof(uu2));
  [v7 getUUIDBytes:uu2];
  int v8 = uuid_compare(a4->replicaUUID, uu2);
  uint64_t v9 = v8 != 0;
  if (v8 < 0) {
    uint64_t v9 = -1;
  }
  if (v9 == -1)
  {
    unsigned int v10 = 0;
    unsigned int clock = a4->clock;
  }
  else if (v9)
  {
    unsigned int v10 = 0;
    unsigned int clock = a4->clock + 1;
  }
  else
  {
    unsigned int clock = a4->clock;
    unsigned int v10 = a4->subclock + 1;
  }
  retstr->unsigned int clock = clock;
  *(_OWORD *)retstr->replicaUUID = *(_OWORD *)uu2;
  retstr->subunsigned int clock = v10;

  return result;
}

- (id)visibleStrokeForInsertingStroke:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 _clipPlane];
  long long v6 = [v4 _renderMask];
  long long v19 = 0uLL;
  id v7 = [(PKDrawingConcrete *)self replicaUUID];
  [v7 getUUIDBytes:&v19];

  int v8 = [_PKStrokeConcrete alloc];
  int v16 = 0;
  long long v17 = v19;
  int v18 = 0;
  uint64_t v9 = [v4 ink];
  if (v4)
  {
    [v4 _transform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  unsigned int v10 = [(_PKStrokeConcrete *)v8 initWithStroke:v4 hidden:0 version:&v16 ink:v9 transform:&v13];

  [(PKDrawingConcrete *)self setStrokeSortIDForInsertion:v10];
  if (v5) {
    [(_PKStrokeConcrete *)v10 _setClipPlane:v5];
  }
  if (v6) {
    [(PKStroke *)v10 _setRenderMask:v6];
  }
  uint64_t v11 = objc_msgSend(v4, "_groupID", v13, v14, v15);
  [(_PKStrokeConcrete *)v10 _setGroupID:v11];

  return v10;
}

- (void)addNewStroke:(id)a3
{
  id v18 = a3;
  -[NSMutableArray addObject:](self->_allStrokes, "addObject:");
  if (([v18 _isHidden] & 1) == 0)
  {
    if ([v18 hasSubstrokes])
    {
      [(PKDrawingConcrete *)self invalidateVisibleStrokes];
      [(PKDrawingConcrete *)self invalidateStrokeBounds];
    }
    else
    {
      id v4 = [(PKDrawing *)self _cachedVisibleStrokes];
      [v4 addObject:v18];

      strokesIdentifierMap = self->_strokesIdentifierMap;
      long long v6 = [v18 _strokeUUID];
      [(NSMutableDictionary *)strokesIdentifierMap setObject:v18 forKey:v6];

      p_bounds = &self->__bounds;
      if (!CGRectIsNull(self->__bounds))
      {
        CGFloat x = p_bounds->origin.x;
        CGFloat y = self->__bounds.origin.y;
        CGFloat width = self->__bounds.size.width;
        CGFloat height = self->__bounds.size.height;
        [v18 _bounds];
        v22.origin.CGFloat x = v12;
        v22.origin.CGFloat y = v13;
        v22.size.CGFloat width = v14;
        v22.size.CGFloat height = v15;
        v20.origin.CGFloat x = x;
        v20.origin.CGFloat y = y;
        v20.size.CGFloat width = width;
        v20.size.CGFloat height = height;
        CGRect v21 = CGRectUnion(v20, v22);
        p_bounds->origin.CGFloat x = v21.origin.x;
        self->__bounds.origin.CGFloat y = v21.origin.y;
        self->__bounds.size.CGFloat width = v21.size.width;
        self->__bounds.size.CGFloat height = v21.size.height;
      }
    }
  }
  int v16 = [(PKDrawingConcrete *)self version];
  long long v17 = [(PKDrawingConcrete *)self replicaUUID];
  [v16 incrementClockForUUID:v17];

  [(PKDrawing *)self setNeedsRecognitionUpdate];
}

- (id)undoableAddNewStrokes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  CGRect v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v19;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = [v8 ink];
        unsigned int v10 = [v9 identifier];
        char v11 = [v10 isEqual:@"com.apple.ink.lasso"];

        if ((v11 & 1) == 0)
        {
          [(PKDrawingConcrete *)self addNewStroke:v8];
          CGFloat v12 = [v8 ink];
          CGFloat v13 = [v12 behavior];
          char v14 = [v13 isEraser];

          if ((v14 & 1) == 0) {
            [v20 addObject:v8];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  if ([v20 count])
  {
    CGFloat v15 = [v20 firstObject];
    int v16 = [v15 _isHidden];

    long long v17 = +[PKModifyStrokesCommand commandForMakingStrokesVisible:v20 drawing:self hiding:v16 ^ 1u];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (id)undoableAddNewStrokes:(id)a3 replacingOldStrokes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        CGFloat v12 = [(PKDrawingConcrete *)self visibleStrokeForInsertingStroke:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  CGFloat v13 = [(PKDrawingConcrete *)self undoableDeleteStrokes:v23];
  char v14 = [(PKDrawingConcrete *)self undoableAddNewStrokes:v7];
  CGFloat v15 = v14;
  if (v13)
  {
    if (v14)
    {
      int v16 = [PKUndoGroupCommand alloc];
      long long v17 = [(PKDrawingConcrete *)self uuid];
      id v18 = [v15 actionName];
      v28[0] = v15;
      v28[1] = v13;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      CGRect v20 = [(PKUndoGroupCommand *)v16 initWithDrawingUUID:v17 actionName:v18 commands:v19];

      goto LABEL_14;
    }
    long long v21 = v13;
  }
  else
  {
    long long v21 = v14;
  }
  CGRect v20 = v21;
LABEL_14:

  return v20;
}

- (void)updateStroke:(id)a3 indexHint:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(PKDrawingConcrete *)self _allStrokes];
  [v6 replaceObjectAtIndex:a4 withObject:v7];
}

- (void)updateStrokes:(id)a3
{
  id v12 = a3;
  char v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(NSMutableArray *)self->_allStrokes count];
  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [(NSMutableArray *)self->_allStrokes objectAtIndexedSubscript:v6];
      uint64_t v16 = 0;
      long long v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __35__PKDrawingConcrete_updateStrokes___block_invoke;
      v13[3] = &unk_1E64C6258;
      id v14 = v12;
      CGFloat v15 = &v16;
      id v8 = [v7 _updateStroke:v13 inDrawing:self];
      if (v8 != v7)
      {
        [(NSMutableArray *)self->_allStrokes replaceObjectAtIndex:v6 withObject:v8];
        [v11 addObject:v8];
      }
      int v9 = *((unsigned __int8 *)v17 + 24);

      _Block_object_dispose(&v16, 8);
      if (v9) {
        break;
      }
    }
    while (v5 != v6++);
  }
  if ([v11 count])
  {
    [(PKDrawingConcrete *)self didUpdate];
    [(PKDrawingConcrete *)self invalidateVisibleStrokes];
    [(PKDrawing *)self setNeedsRecognitionUpdate];
  }
}

id __35__PKDrawingConcrete_updateStrokes___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

  return v5;
}

- (void)setStrokes:(id)a3 hidden:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__PKDrawingConcrete_setStrokes_hidden___block_invoke;
  v4[3] = &__block_descriptor_33_e44___PKStroke_32__0__PKStroke_8__PKStroke_16Q24l;
  BOOL v5 = a4;
  [(PKDrawingConcrete *)self _updateStrokes:a3 updateBlock:v4];
}

id __39__PKDrawingConcrete_setStrokes_hidden___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (*(unsigned __int8 *)(a1 + 32) != [v7 _isHidden])
  {
    if ([v7 _pointsCount]) {
      int v9 = v7;
    }
    else {
      int v9 = v6;
    }
    id v10 = v9;
    id v8 = (void *)[v10 copyForMutation];

    [v8 _setHidden:*(unsigned __int8 *)(a1 + 32)];
    objc_msgSend(v8, "_setFlags:", objc_msgSend(v8, "_flags") & 0xFFFFFFFFFFFFFFFDLL);
  }

  return v8;
}

- (void)deleteStrokes:(id)a3
{
}

- (id)undoableDeleteStrokes:(id)a3
{
  uint64_t v4 = +[PKModifyStrokesCommand commandForErasingStrokes:a3 drawing:self];
  [v4 applyToDrawing:self];
  id v5 = [v4 invertedInDrawing:self];

  return v5;
}

- (id)_stroke:(id)a3 transformed:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = (void *)[a3 copyForMutation];
  id v8 = v7;
  if (v5)
  {
    if (v7) {
      [v7 _transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v10;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v15, &t1, &t2);
  }
  else
  {
    long long v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v9;
    *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&a4->tx;
  }
  CGAffineTransform v12 = v15;
  [v8 _setTransform:&v12];
  objc_msgSend(v8, "_setFlags:", objc_msgSend(v8, "_flags") & 0xFFFFFFFFFFFFFFF7);

  return v8;
}

- (void)transformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v5
    || (long long v9 = *(_OWORD *)&a4->c,
        *(_OWORD *)&v16.a = *(_OWORD *)&a4->a,
        *(_OWORD *)&v16.c = v9,
        *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&a4->tx,
        !CGAffineTransformIsIdentity(&v16)))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    long long v10 = *(_OWORD *)&a4->c;
    long long v12 = *(_OWORD *)&a4->a;
    v11[2] = __59__PKDrawingConcrete_transformStrokes_withTransform_concat___block_invoke;
    v11[3] = &unk_1E64C62A0;
    v11[4] = self;
    long long v13 = v10;
    long long v14 = *(_OWORD *)&a4->tx;
    BOOL v15 = v5;
    [(PKDrawingConcrete *)self _updateStrokes:v8 updateBlock:v11];
  }
}

id __59__PKDrawingConcrete_transformStrokes_withTransform_concat___block_invoke(uint64_t a1, uint64_t a2)
{
  CGSize v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 72);
  uint64_t v4 = [v2 _stroke:a2 transformed:v6 concat:*(unsigned __int8 *)(a1 + 88)];

  return v4;
}

- (id)undoableTransformStrokes:(id)a3 withTransform:(CGAffineTransform *)a4 concat:(BOOL)a5
{
  long long v6 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a4->tx;
  id v7 = +[PKTransformStrokesCommand commandForTransforming:a3 drawing:self strokeTransform:v10];
  [v7 applyToDrawing:self];
  id v8 = [v7 invertedInDrawing:self];

  return v8;
}

- (void)setStrokes:(id)a3 inks:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PKDrawingConcrete_setStrokes_inks___block_invoke;
  v8[3] = &unk_1E64C62C8;
  id v9 = v6;
  long long v10 = self;
  id v7 = v6;
  [(PKDrawingConcrete *)self _updateStrokes:a3 updateBlock:v8];
}

id __37__PKDrawingConcrete_setStrokes_inks___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a4];
  id v8 = (void *)[*(id *)(a1 + 40) _newStroke:v6 withInk:v7];

  return v8;
}

- (id)undoableSetStrokes:(id)a3 inks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PKDrawing drawingStrokesFromStrokes:v6 inDrawing:self];
  id v9 = +[PKModifyStrokeInkCommand commandForModifyingStrokes:v8 drawing:self inks:v7];
  long long v10 = [v9 invertedInDrawing:self];

  [(PKDrawingConcrete *)self setStrokes:v6 inks:v7];

  return v10;
}

- (id)_newStroke:(id)a3 withInk:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 ink];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    id v9 = v5;
  }
  else
  {
    id v9 = (id)[v5 copyForMutation];
    [v9 _setInk:v6];
    objc_msgSend(v9, "_setFlags:", objc_msgSend(v9, "_flags") & 0xFFFFFFFFFFFFFFFBLL);
  }

  return v9;
}

- (void)setStrokes:(id)a3 groupID:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PKDrawingConcrete_setStrokes_groupID___block_invoke;
  v8[3] = &unk_1E64C62C8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PKDrawingConcrete *)self _updateStrokes:a3 updateBlock:v8];
}

id __40__PKDrawingConcrete_setStrokes_groupID___block_invoke(uint64_t a1, uint64_t a2)
{
  CGSize v2 = (void *)[*(id *)(a1 + 32) _newStroke:a2 withGroupID:*(void *)(a1 + 40)];

  return v2;
}

- (id)undoableSetStrokes:(id)a3 groupID:(id)a4 actionName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = +[PKDrawing drawingStrokesFromStrokes:v8 inDrawing:self];
  long long v12 = +[PKModifyStrokesGroupIDCommand commandForModifyingStrokes:v11 drawing:self groupID:v9 actionName:v10];
  long long v13 = [v12 invertedInDrawing:self];

  [(PKDrawingConcrete *)self setStrokes:v8 groupID:v9];

  return v13;
}

- (id)_newStroke:(id)a3 withGroupID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _groupID];
  if (v7 == v6)
  {

    goto LABEL_5;
  }
  id v8 = [v5 _groupID];
  int v9 = [v8 isEqual:v6];

  if (v9)
  {
LABEL_5:
    id v10 = v5;
    goto LABEL_6;
  }
  id v10 = (id)[v5 copyForMutation];
  [v10 _setGroupID:v6];
LABEL_6:

  return v10;
}

- (void)_updateStrokes:(id)a3 updateBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v14 = [v13 _strokeUUID];
        [v8 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v15 = [v9 count];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __48__PKDrawingConcrete__updateStrokes_updateBlock___block_invoke;
  v18[3] = &unk_1E64C62F0;
  id v16 = v8;
  id v19 = v16;
  id v17 = v7;
  long long v22 = v24;
  uint64_t v23 = v15;
  CGRect v20 = self;
  id v21 = v17;
  [(PKDrawingConcrete *)self updateStrokes:v18];

  _Block_object_dispose(v24, 8);
}

id __48__PKDrawingConcrete__updateStrokes_updateBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = (void *)a1[4];
  id v7 = [v5 _strokeUUID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = v5;
  uint64_t v10 = v9;
  if (v8)
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = *(void *)(a1[7] + 8);
    uint64_t v13 = *(void *)(v12 + 24) + 1;
    *(void *)(v12 + 24) = v13;
    if (v13 == a1[8]) {
      *a3 = 1;
    }
    uint64_t v10 = v9;
    if (v11 != v9)
    {
      [v11 didUpdateInDrawing:a1[5]];
      uint64_t v10 = v11;
    }
  }

  return v10;
}

- (void)_mergeStroke:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(NSMutableArray *)self->_allStrokes count] + 1;
  while (1)
  {
    allStrokes = self->_allStrokes;
    uint64_t v6 = v4 - 2;
    if (v4 - 2 < 0)
    {
      [(NSMutableArray *)allStrokes insertObject:v19 atIndex:0];
      goto LABEL_9;
    }
    id v7 = [(NSMutableArray *)allStrokes objectAtIndexedSubscript:v4 - 2];
    id v8 = [v7 _strokeUUID];
    id v9 = [v19 _strokeUUID];
    int v10 = [v8 isEqual:v9];

    id v11 = self->_allStrokes;
    if (v10) {
      break;
    }
    uint64_t v12 = [(NSMutableArray *)v11 objectAtIndexedSubscript:v4 - 2];
    uint64_t v13 = [v12 compareToStroke:v19];

    --v4;
    if (v13 != 1)
    {
      [(NSMutableArray *)self->_allStrokes insertObject:v19 atIndex:v4];
LABEL_9:
      id v17 = [(PKDrawingConcrete *)self version];
      uint64_t v18 = [(PKDrawingConcrete *)self replicaUUID];
      [v17 incrementClockForUUID:v18];

      [(PKDrawingConcrete *)self invalidateVisibleStrokes];
      [(PKDrawing *)self setNeedsRecognitionUpdate];
      goto LABEL_10;
    }
  }
  long long v14 = [(NSMutableArray *)v11 objectAtIndexedSubscript:v4 - 2];
  uint64_t v15 = [v14 _mergeWithStroke:v19 inDrawing:self];

  id v16 = [(NSMutableArray *)self->_allStrokes objectAtIndexedSubscript:v6];

  if (v15 != v16)
  {
    [(NSMutableArray *)self->_allStrokes setObject:v15 atIndexedSubscript:v6];

    goto LABEL_9;
  }

LABEL_10:
}

- (void)normalizeUUIDsWithDrawing:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDrawingConcrete *)self version];
  if (([v5 isEmpty] & 1) == 0)
  {

LABEL_8:
    uint64_t v13 = [(PKDrawingConcrete *)self uuid];
    long long v14 = [v4 uuid];
    char v15 = [v13 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)CGRect v20 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_FAULT, "Attempt to merge with invalid drawing", v20, 2u);
      }
    }
    goto LABEL_18;
  }
  uint64_t v6 = [v4 version];
  char v7 = [v6 isEmpty];

  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
  id v8 = [(PKDrawingConcrete *)self version];
  if ([v8 isEmpty])
  {
    id v9 = [v4 version];
    int v10 = [v9 isEmpty];

    if (v10)
    {
      id v11 = [(PKDrawingConcrete *)self nsuuid];
      uint64_t v12 = [v4 nsuuid];
      if (objc_msgSend(v11, "PK_compare:", v12) == -1) {
        [v4 uuid];
      }
      else {
      id v19 = [(PKDrawingConcrete *)self uuid];
      }
      [(PKDrawingConcrete *)self _setUUID:v19];

      goto LABEL_17;
    }
  }
  else
  {
  }
  id v17 = [(PKDrawingConcrete *)self version];
  int v18 = [v17 isEmpty];

  if (v18)
  {
    id v11 = [v4 uuid];
    [(PKDrawingConcrete *)self _setUUID:v11];
LABEL_17:
  }
LABEL_18:
}

- (unint64_t)mergeWithDrawing:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = (PKDrawingConcrete *)a3;
  if (v4 != self)
  {
    [(PKDrawingConcrete *)self normalizeUUIDsWithDrawing:v4];
    [(PKDrawingConcrete *)v4 willMergeWithDrawing:self];
    if (v4)
    {
      [(PKDrawingConcrete *)v4 boundsVersion];
      unsigned int v5 = *(_DWORD *)buf;
    }
    else
    {
      unsigned int v5 = 0;
      memset(buf, 0, sizeof(buf));
    }
    [(PKDrawingConcrete *)self boundsVersion];
    if (v5 < v56) {
      goto LABEL_11;
    }
    if (v4) {
      [(PKDrawingConcrete *)v4 boundsVersion];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    *(_OWORD *)&self->_boundsVersion.unsigned int clock = *(_OWORD *)buf;
    *(void *)&self->_boundsVersion.replicaUUID[12] = *(void *)&buf[16];
    [(PKDrawingConcrete *)v4 _canvasBounds];
    v59.origin.CGFloat x = v7;
    v59.origin.CGFloat y = v8;
    v59.size.CGFloat width = v9;
    v59.size.CGFloat height = v10;
    if (CGRectEqualToRect(self->__canvasBounds, v59))
    {
LABEL_11:
      unint64_t v6 = 1;
    }
    else
    {
      [(PKDrawingConcrete *)v4 _canvasBounds];
      self->__canvasBounds.origin.CGFloat x = v11;
      self->__canvasBounds.origin.CGFloat y = v12;
      unint64_t v6 = 2;
      self->__canvasBounds.size.CGFloat width = v13;
      self->__canvasBounds.size.CGFloat height = v14;
    }
    char v15 = [(PKDrawingConcrete *)self version];
    id v16 = [(PKDrawingConcrete *)v4 version];
    char v17 = [v15 compareTo:v16];

    if ((v17 & 1) == 0)
    {
      [(PKDrawingConcrete *)v4 didMergeWithDrawing:self];
      int v18 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [(PKDrawingConcrete *)self uuid];
        CGRect v20 = [(PKDrawingConcrete *)self _allStrokes];
        uint64_t v21 = [v20 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v21;
        _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Skipped drawing merge: %@, strokes: %lu", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if ((v17 & 4) == 0)
    {
      long long v22 = [(PKDrawingConcrete *)v4 _allStrokes];
      uint64_t v23 = (NSMutableArray *)[v22 mutableCopy];
      allStrokes = self->_allStrokes;
      self->_allStrokes = v23;

      long long v25 = [(PKDrawingConcrete *)v4 version];
      long long v26 = (PKVectorTimestamp *)[v25 copy];
      version = self->_version;
      self->_version = v26;

      long long v28 = [(PKDrawing *)v4 _cachedVisibleStrokes];
      long long v29 = (void *)[v28 mutableCopy];
      [(PKDrawing *)self set_cachedVisibleStrokes:v29];

      uint64_t v30 = (NSMutableDictionary *)[(NSMutableDictionary *)v4->_strokesIdentifierMap mutableCopy];
      strokesIdentifierMap = self->_strokesIdentifierMap;
      self->_strokesIdentifierMap = v30;

      [(PKDrawingConcrete *)v4 bounds];
      self->__bounds.origin.CGFloat x = v32;
      self->__bounds.origin.CGFloat y = v33;
      self->__bounds.size.CGFloat width = v34;
      self->__bounds.size.CGFloat height = v35;
      [(PKDrawing *)self setNeedsRecognitionUpdate];
      [(PKDrawingConcrete *)v4 didMergeWithDrawing:self];
      int v18 = os_log_create("com.apple.pencilkit", "");
      unint64_t v6 = 2;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v36 = [(PKDrawingConcrete *)self uuid];
        v37 = [(PKDrawingConcrete *)self _allStrokes];
        uint64_t v38 = [v37 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v38;
        _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Quick merged drawing: %@, strokes: %lu", buf, 0x16u);

LABEL_39:
        unint64_t v6 = 2;
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    uint64_t v39 = [(NSMutableArray *)self->_allStrokes count];
    v40 = [(PKDrawingConcrete *)v4 _allStrokes];
    uint64_t v41 = [v40 count];

    uint64_t v42 = v41 - 1;
    if (v41 - 1 < 0)
    {
LABEL_35:
      v50 = [(PKDrawingConcrete *)self version];
      v51 = [(PKDrawingConcrete *)v4 version];
      [v50 mergeWithTimestamp:v51];

      [(PKDrawingConcrete *)self invalidateVisibleStrokes];
      [(PKDrawing *)self setNeedsRecognitionUpdate];
      [(PKDrawingConcrete *)v4 didMergeWithDrawing:self];
      int v18 = os_log_create("com.apple.pencilkit", "");
      unint64_t v6 = 2;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v53 = [(PKDrawingConcrete *)self uuid];
        v54 = [(PKDrawingConcrete *)self _allStrokes];
        uint64_t v55 = [v54 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v55;
        _os_log_debug_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEBUG, "Merged drawing: %@, strokes: %lu", buf, 0x16u);

        goto LABEL_39;
      }
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v43 = v39 - 1;
    while (1)
    {
      v44 = [(PKDrawingConcrete *)v4 _allStrokes];
      v45 = [v44 objectAtIndexedSubscript:v42];

      v46 = self->_allStrokes;
      if ((v43 & 0x8000000000000000) == 0) {
        break;
      }
      [(NSMutableArray *)v46 insertObject:v45 atIndex:0];
      --v42;
LABEL_34:

      if (v42 < 0) {
        goto LABEL_35;
      }
    }
    v47 = [(NSMutableArray *)v46 objectAtIndexedSubscript:v43];
    uint64_t v48 = [v47 compareToStroke:v45];
    if (v48 == -1)
    {
      [(NSMutableArray *)self->_allStrokes insertObject:v45 atIndex:v43 + 1];
    }
    else
    {
      if (v48)
      {
        if (v48 == 1) {
          --v43;
        }
        goto LABEL_33;
      }
      v49 = [v47 _mergeWithStroke:v45 inDrawing:self];
      if (v49 != v47) {
        [(NSMutableArray *)self->_allStrokes replaceObjectAtIndex:v43 withObject:v49];
      }

      --v43;
    }
    --v42;
LABEL_33:

    goto LABEL_34;
  }
  unint64_t v6 = 1;
LABEL_37:

  return v6;
}

- (void)didUpdate
{
  id v4 = [(PKDrawingConcrete *)self version];
  long long v3 = [(PKDrawingConcrete *)self replicaUUID];
  [v4 incrementClockForUUID:v3];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(PKDrawingConcrete *)self uuid];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = [(PKDrawingConcrete *)self version];
  unint64_t v7 = v5 ^ v3 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_7;
  }
  unint64_t v6 = [(PKDrawingConcrete *)self uuid];
  unint64_t v7 = [v4 uuid];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_7;
  }
  CGFloat v9 = [(PKDrawingConcrete *)self version];
  CGFloat v10 = [v4 version];
  if (![v9 isEqual:v10])
  {

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  [v4 boundsVersion];
  [(PKDrawingConcrete *)self boundsVersion];
  BOOL v11 = _PKStrokeIDCompare(&v14, &v13) == 0;

LABEL_8:
  return v11;
}

- (void)willMergeWithDrawing:(id)a3
{
  if (self->_replicaUUID)
  {
    id v4 = +[PKReplicaManager sharedReplicaManager];
    [v4 updateVersionForDrawing:self];
  }
}

- (id)updateFromSlicedIntersectingIndexes:(int64_t *)a3 resultNewRoots:(const void *)a4 resultUpdatedStrokes:(const void *)a5 count:(int64_t)a6
{
  CGFloat v32 = [MEMORY[0x1E4F1CA60] dictionary];
  CGFloat v33 = [MEMORY[0x1E4F1CA48] array];
  if (a6 < 1)
  {
LABEL_15:
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  char v11 = 0;
  CGFloat v12 = a5 - 1;
  _PKStrokeID v13 = a4 - 1;
  _PKStrokeID v14 = a3 - 1;
  while (1)
  {
    int64_t v15 = v14[a6];
    id v16 = (id)v13[a6];
    if (v16) {
      break;
    }
    uint64_t v21 = [(PKDrawingConcrete *)self _rootStrokes];
    long long v22 = [v21 objectAtIndexedSubscript:v15];
    [v33 addObject:v22];

    uint64_t v23 = [(PKDrawingConcrete *)self _rootStrokes];
    long long v24 = [v23 objectAtIndexedSubscript:v15];
    long long v25 = (void *)[v24 mutableCopy];

    [v25 _setHidden:1];
    [v25 didUpdateSubstrokesInDrawing:self];
    [(PKDrawingConcrete *)self updateStroke:v25 indexHint:v15];

    if ((unint64_t)a6 < 2) {
      goto LABEL_14;
    }
    char v11 = 1;
LABEL_12:
    --a6;
  }
  if ([(id)v12[a6] count])
  {
    char v17 = [(PKDrawingConcrete *)self _rootStrokes];
    id v18 = [v17 objectAtIndexedSubscript:v15];

    if (v16 != v18)
    {
      id v19 = [v18 _substrokes];
      CGRect v20 = [v16 _strokeUUID];
      [v32 setObject:v19 forKeyedSubscript:v20];

      [(PKDrawingConcrete *)self updateStroke:v16 indexHint:v15];
      char v11 = 1;
    }
  }
  if ((unint64_t)a6 > 1) {
    goto LABEL_12;
  }
  if ((v11 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_14:
  [(PKDrawingConcrete *)self didUpdate];
  [(PKDrawingConcrete *)self invalidateVisibleStrokes];
  long long v26 = [PKSliceStrokesCommand alloc];
  long long v27 = [(PKDrawingConcrete *)self uuid];
  long long v28 = _PencilKitBundle();
  long long v29 = [v28 localizedStringForKey:@"Bitmap Erase" value:@"Bitmap Erase" table:@"Localizable"];
  uint64_t v30 = [(PKSliceStrokesCommand *)v26 initWithDrawingUUID:v27 actionName:v29 substrokes:v32 strokesHidden:v33 hiding:0];

LABEL_16:

  return v30;
}

- (PKDrawingConcrete)initWithData:(id)a3 error:(id *)a4
{
  return [(PKDrawingConcrete *)self initWithData:a3 loadNonInkingStrokes:0 error:a4];
}

- (void)_addTestDataToUnknownFields
{
}

- (id)_dataInUnknownFields
{
  ptr = self->_unknownFields.__ptr_;
  if (ptr && (uint64_t v3 = *(void **)ptr) != 0 && *v3 != v3[1])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v4;
}

- (PKVectorTimestamp)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (_PKStrokeID)boundsVersion
{
  *retstr = self[8];
  return self;
}

- (void)setBoundsVersion:(_PKStrokeID *)a3
{
  uint64_t v3 = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_boundsVersion.unsigned int clock = *(_OWORD *)&a3->clock;
  *(void *)&self->_boundsVersion.replicaUUID[12] = v3;
}

- (shared_ptr<PKProtobufUnknownFields>)_unknownFields
{
  cntrl = self->_unknownFields.__cntrl_;
  void *v2 = self->_unknownFields.__ptr_;
  v2[1] = (PKProtobufUnknownFields *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKProtobufUnknownFields *)self;
  return result;
}

- (void)set_orientation:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, &kOrientationKey, v4, (void *)0x301);
}

- (int64_t)_orientation
{
  CGSize v2 = objc_getAssociatedObject(self, &kOrientationKey);
  uint64_t v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_removeHiddenAndEraserStrokes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int64_t v4 = [(PKDrawingConcrete *)self _allStrokes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKDrawingConcrete_UpgradeAdditions___removeHiddenAndEraserStrokes__block_invoke;
  v7[3] = &unk_1E64C7FE0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  unint64_t v6 = [(PKDrawingConcrete *)self _allStrokes];
  [v6 removeObjectsAtIndexes:v5];

  [(PKDrawingConcrete *)self invalidateVisibleStrokes];
}

void __68__PKDrawingConcrete_UpgradeAdditions___removeHiddenAndEraserStrokes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (([v8 _isHidden] & 1) != 0
    || ([v8 ink],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 identifier],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"com.apple.ink.eraser"],
        v6,
        v5,
        v7))
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)_removeInvisibleStrokes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int64_t v4 = [(PKDrawingConcrete *)self _allStrokes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKDrawingConcrete_UpgradeAdditions___removeInvisibleStrokes__block_invoke;
  v7[3] = &unk_1E64C7FE0;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  if ([v5 count])
  {
    unint64_t v6 = [(PKDrawingConcrete *)self _allStrokes];
    [v6 removeObjectsAtIndexes:v5];

    [(PKDrawingConcrete *)self invalidateVisibleStrokes];
  }
}

void __62__PKDrawingConcrete_UpgradeAdditions___removeInvisibleStrokes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  if ([v14 _isHidden])
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
  else if ((unint64_t)[v14 _pointsCount] >= 2)
  {
    id v5 = [v14 _strokeData];
    uint64_t v6 = [v5 _pointsCount];
    uint64_t v7 = 1;
    while (v6 != v7)
    {
      [v5 locationAtIndex:v7 - 1];
      double v9 = v8;
      double v11 = v10;
      [v5 locationAtIndex:v7++];
      if (sqrt((v13 - v11) * (v13 - v11) + (v12 - v9) * (v12 - v9)) >= 0.00000011920929) {
        goto LABEL_9;
      }
    }
    [*(id *)(a1 + 32) addIndex:a3];
LABEL_9:
  }
}

- ($3CC19D079FD0B010EE84973AA846B91B)_drawingStrokeInfoIsLegacyDrawing:(SEL)a3
{
  BOOL v21 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKDrawing *)self strokes];
  retstr->var0 = [v5 count];

  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var3 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PKDrawing *)self strokes];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v18 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v12 = [v11 ink];
        double v13 = [v12 identifier];
        int v14 = [v13 isEqualToString:@"com.apple.ink.eraser"];

        if (v14) {
          retstr->var1 = ++v8;
        }
        int64_t v15 = [v11 _clipPlane];
        BOOL v16 = v15 == 0;

        if (!v16) {
          retstr->var2 = ++v7;
        }
        if (v21 && [v11 _shouldBeClippedAgainstLegacyCanvas]) {
          retstr->var3 = ++v18;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return result;
}

+ (CGAffineTransform)_orientationTransform:(SEL)a3 size:(int64_t)a4
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v5 + 32);
  switch(a4)
  {
    case 3:
      *(_OWORD *)&retstr->a = xmmword_1C4827030;
      *(_OWORD *)&retstr->c = xmmword_1C482A020;
      retstr->tCGFloat x = a5.width;
      retstr->tCGFloat y = 0.0;
      break;
    case 2:
      *(_OWORD *)&retstr->a = xmmword_1C482A010;
      retstr->d = 0.0;
      retstr->tCGFloat x = 0.0;
      retstr->c = 1.0;
      retstr->tCGFloat y = a5.height;
      break;
    case 1:
      retstr->a = -1.0;
      retstr->b = 0.0;
      retstr->c = 0.0;
      retstr->d = -1.0;
      *(CGSize *)&retstr->tCGFloat x = a5;
      break;
  }
  return result;
}

+ (id)_defaultConversionQueue
{
  if (_MergedGlobals_133 != -1) {
    dispatch_once(&_MergedGlobals_133, &__block_literal_global_39);
  }
  CGSize v2 = (void *)qword_1EB3C5F78;

  return v2;
}

void __62__PKDrawingConcrete_UpgradeAdditions___defaultConversionQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.pencilkit.conversion", attr);
  CGSize v2 = (void *)qword_1EB3C5F78;
  qword_1EB3C5F78 = (uint64_t)v1;
}

- (id)_upgradeOnQueue:(id)a3 isLegacyDrawing:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v8 = a3;
  id v9 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  [(PKDrawingConcrete *)self _drawingStrokeInfoIsLegacyDrawing:v6];
  [(PKDrawingConcrete *)self _unscaledOrientedDrawingSize];
  memset(&v32, 0, sizeof(v32));
  +[PKDrawingConcrete _orientationTransform:size:](PKDrawingConcrete, "_orientationTransform:size:", [(PKDrawingConcrete *)self _orientation], v10, v11);
  [(PKDrawingConcrete *)self _conversionScaleFactor];
  if (v12 != 1.0)
  {
    CGAffineTransform t1 = v32;
    CGAffineTransformMakeScale(&t2, v12, v12);
    CGAffineTransformConcat(&v31, &t1, &t2);
    CGAffineTransform v32 = v31;
  }
  CGAffineTransform v28 = v32;
  BOOL v13 = !CGAffineTransformIsIdentity(&v28);
  int v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:*((void *)&v33 + 1) + (void)v34 + v13 + *((void *)&v34 + 1)];
  if (!v8)
  {
    uint64_t v8 = [(id)objc_opt_class() _defaultConversionQueue];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  long long v23 = v33;
  v20[2] = __87__PKDrawingConcrete_UpgradeAdditions___upgradeOnQueue_isLegacyDrawing_completionBlock___block_invoke;
  v20[3] = &unk_1E64C8008;
  v20[4] = self;
  long long v24 = v34;
  id v15 = v14;
  BOOL v26 = v6;
  BOOL v27 = v13;
  CGAffineTransform v25 = v32;
  id v21 = v15;
  id v22 = v9;
  id v16 = v9;
  dispatch_async(v8, v20);
  char v17 = v22;
  id v18 = v15;

  return v18;
}

void __87__PKDrawingConcrete_UpgradeAdditions___upgradeOnQueue_isLegacyDrawing_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _removeInvisibleStrokes];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (*(void *)(a1 + 72))
  {
    CGSize v2 = [*(id *)(a1 + 32) _allStrokes];
    uint64_t v3 = [v2 count];

    if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        uint64_t v5 = (void *)MEMORY[0x1C8784520]();
        BOOL v6 = [*(id *)(a1 + 32) _allStrokes];
        uint64_t v7 = [v6 objectAtIndexedSubscript:i];

        uint64_t v8 = [v7 _clipPlane];
        if (v8)
        {
          char v9 = [v7 _isHidden];

          if ((v9 & 1) == 0)
          {
            double v10 = [v7 ink];
            double v11 = [v10 identifier];
            int v12 = [v11 isEqualToString:@"com.apple.ink.eraser"];

            if (v12)
            {
              BOOL v13 = [v7 _clipPlane];
              int v14 = [v7 _strokeUUID];
              [v44 setObject:v13 forKeyedSubscript:v14];
            }
            else
            {
              id v50 = 0;
              id v15 = (id)[*(id *)(a1 + 32) _clipStroke:v7 newRootStroke:&v50];
              id v16 = v50;
              char v17 = *(void **)(a1 + 32);
              if (v50)
              {
                id v18 = [v17 _allStrokes];
                [v18 setObject:v16 atIndexedSubscript:i];
              }
              else
              {
                id v19 = [v17 _allStrokes];
                [v19 removeObjectAtIndex:i];

                --i;
                --v3;
              }
            }
            objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
          }
        }
      }
    }
    [*(id *)(a1 + 32) invalidateVisibleStrokes];
  }
  if (*(void *)(a1 + 80) && *(unsigned char *)(a1 + 136))
  {
    CGRect v20 = [*(id *)(a1 + 32) _allStrokes];
    uint64_t v21 = [v20 count];

    if (v21 >= 1)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        long long v23 = (void *)MEMORY[0x1C8784520]();
        long long v24 = [*(id *)(a1 + 32) _allStrokes];
        CGAffineTransform v25 = [v24 objectAtIndexedSubscript:j];

        if ([v25 _shouldBeClippedAgainstLegacyCanvas])
        {
          uint64_t v26 = [*(id *)(a1 + 32) _clipAgainstLegacyCanvas:v25];
          BOOL v27 = (void *)v26;
          if (v26 && (void *)v26 != v25)
          {
            CGAffineTransform v28 = [*(id *)(a1 + 32) _allStrokes];
            [v28 setObject:v27 atIndexedSubscript:j];
          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
        }
      }
    }
    [*(id *)(a1 + 32) invalidateVisibleStrokes];
  }
  if (*(unsigned char *)(a1 + 137))
  {
    long long v29 = *(void **)(a1 + 32);
    long long v30 = *(_OWORD *)(a1 + 104);
    v49[0] = *(_OWORD *)(a1 + 88);
    v49[1] = v30;
    v49[2] = *(_OWORD *)(a1 + 120);
    [v29 _transformAllStrokes:v49];
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
  }
  if (*(void *)(a1 + 64))
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    CGAffineTransform v31 = [*(id *)(a1 + 32) strokes];
    CGAffineTransform v32 = (void *)[v31 copy];

    uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          v37 = [v36 ink];
          uint64_t v38 = [v37 identifier];
          int v39 = [v38 isEqualToString:@"com.apple.ink.eraser"];

          if (v39)
          {
            v40 = (void *)MEMORY[0x1C8784520]();
            uint64_t v41 = [v36 _strokeUUID];
            uint64_t v42 = [v44 objectForKeyedSubscript:v41];
            [v36 _setClipPlane:v42];

            id v43 = (id)[*(id *)(a1 + 32) sliceWithEraseStroke:v36];
            objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v33);
    }
  }
  [*(id *)(a1 + 32) _removeHiddenAndEraserStrokes];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "set_canvasBounds:", 0.0);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (CGAffineTransform)_transformForImageWithSize:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  +[PKDrawingConcrete _orientationTransform:size:](PKDrawingConcrete, "_orientationTransform:size:", [(PKDrawingConcrete *)self _orientation], a4.width, a4.height);
  CGAffineTransformInvert(retstr, &v13);
  shared_ptr<PKProtobufUnknownFields> result = (CGAffineTransform *)[(PKDrawingConcrete *)self _conversionScaleFactor];
  if (v7 != 1.0)
  {
    long long v8 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformMakeScale(&v10, v7, v7);
    shared_ptr<PKProtobufUnknownFields> result = CGAffineTransformConcat(&v12, &t1, &v10);
    long long v9 = *(_OWORD *)&v12.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v12.tx;
  }
  return result;
}

- (double)_conversionScaleFactor
{
  unint64_t v2 = [(PKDrawingConcrete *)self _orientation];
  double result = 1.0;
  if (v2 < 2) {
    return 0.75;
  }
  return result;
}

- (CGSize)_unscaledOrientedDrawingSize
{
  unint64_t v2 = [(PKDrawingConcrete *)self _orientation];
  double v3 = 768.0;
  if (v2 >= 2) {
    double v4 = 768.0;
  }
  else {
    double v4 = 1024.0;
  }
  if (v2 >= 2) {
    double v3 = 1024.0;
  }
  result.CGFloat height = v3;
  result.CGFloat width = v4;
  return result;
}

- (CGSize)_orientedDrawingSize
{
  [(PKDrawingConcrete *)self _unscaledOrientedDrawingSize];
  double v4 = v3;
  double v6 = v5;
  [(PKDrawingConcrete *)self _conversionScaleFactor];
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

- (void)_upgradeLegacyPenInks
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x1E4F1CA48];
  double v3 = [(PKDrawing *)self strokes];
  uint64_t v21 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  double v4 = (void *)MEMORY[0x1E4F1CA48];
  double v5 = [(PKDrawing *)self strokes];
  CGRect v20 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PKDrawing *)self strokes];
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v9 = [v8 ink];
        if (![v9 version])
        {
          CGAffineTransform v10 = [v9 identifier];
          int v11 = [v10 isEqualToString:@"com.apple.ink.pen"];

          if (v11)
          {
            CGAffineTransform v12 = [PKInk alloc];
            CGAffineTransform v13 = [v9 identifier];
            int v14 = [v9 color];
            id v15 = [v9 identifier];
            int64_t v16 = +[PKInk currentInkVersionForInkIdentifier:v15];
            char v17 = [v9 variant];
            [v9 weight];
            id v18 = -[PKInk initWithIdentifier:color:version:variant:weight:](v12, "initWithIdentifier:color:version:variant:weight:", v13, v14, v16, v17);

            [v21 addObject:v8];
            [v20 addObject:v18];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  if ([v21 count]) {
    [(PKDrawingConcrete *)self setStrokes:v21 inks:v20];
  }
}

- (PKDrawingConcrete)initWithData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ((unint64_t)[v8 length] >= 0xB)
  {
    [v8 getBytes:v14 length:10];
    if (v14[0] == 31 && v14[1] == 139)
    {
      double v9 = objc_msgSend(v8, "PK_gzipInflate");
      CGAffineTransform v10 = v9;
      if (v9)
      {
        id v11 = v9;

        id v8 = v11;
      }
    }
  }
  CGAffineTransform v12 = [(PKDrawingConcrete *)self _initWithUnzippedData:v8 loadNonInkingStrokes:v6 error:a5];

  return v12;
}

- (id)_initWithUnzippedData:(id)a3 error:(id *)a4
{
  return [(PKDrawingConcrete *)self _initWithUnzippedData:a3 loadNonInkingStrokes:0 error:a4];
}

- (id)_initWithUnzippedData:(id)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [[PKDrawingVersionedDocument alloc] initWithDrawingClass:objc_opt_class()];
  [(PKDrawingVersionedDocument *)v9 setLoadNonInkingStrokes:v6];
  if (![(PKDrawingVersionedDocument *)v9 loadUnzippedData:v8])
  {
    id v18 = (unsigned int (**)(void **, unsigned char *))&unk_1F1FB0858;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v27 = 0;
    id v11 = v8;
    if ((unint64_t)[v11 length] <= 7)
    {
      PKProtobufUtilitiesMalformedError(a5);
LABEL_5:

LABEL_6:
      CGAffineTransform v10 = 0;
LABEL_7:
      drawing::Drawing::~Drawing((drawing::Drawing *)&v18);
      goto LABEL_8;
    }
    int v31 = 0;
    objc_msgSend(v11, "getBytes:range:", &v31, 0, 4);
    if (v31 == -261852553)
    {
      unsigned __int8 v29 = 0;
      objc_msgSend(v11, "getBytes:range:", &v29, 4, 1);
      if (v29 >= 5u)
      {
        PKProtobufUtilitiesFormatTooNew(a5);
        goto LABEL_5;
      }
      unsigned __int16 v28 = 0;
      objc_msgSend(v11, "getBytes:range:", &v28, 6, 2);
      unint64_t v15 = v28;
      if (v28 < 8uLL || [v11 length] <= v15)
      {
        PKProtobufUtilitiesMalformedError(a5);
        goto LABEL_5;
      }
      id v13 = v11;
      uint64_t v16 = [v13 bytes];
      uint64_t v17 = v28;
      [v13 length];
      PB::Reader::Reader((PB::Reader *)v30, (const unsigned __int8 *)(v16 + v17));
      if (!v18[2]((void **)&v18, v30))
      {
LABEL_17:
        PKProtobufUtilitiesMalformedError(a5);

        goto LABEL_6;
      }
    }
    else
    {
      id v13 = v11;
      int v14 = (const unsigned __int8 *)[v13 bytes];
      [v13 length];
      PB::Reader::Reader((PB::Reader *)v30, v14);
      if (!v18[2]((void **)&v18, v30)) {
        goto LABEL_17;
      }
    }

    CGAffineTransform v10 = [(PKDrawingConcrete *)self initWithArchive:&v18 loadNonInkingStrokes:v6 error:a5];
    self = v10;
    goto LABEL_7;
  }
  CGAffineTransform v10 = [(PKDrawingVersionedDocument *)v9 drawing];
LABEL_8:

  return v10;
}

- (id)serialize
{
  int64_t v3 = [(PKDrawing *)self _minimumSerializationVersion];

  return [(PKDrawingConcrete *)self serializeWithVersion:v3];
}

- (id)_data
{
  int64_t v3 = +[PKDrawing _currentSerializationVersion];

  return [(PKDrawingConcrete *)self serializeWithVersion:v3];
}

- (id)serializeTransiently
{
  unint64_t v2 = (void *)[(PKDrawingConcrete *)self copy];
  [v2 _setUUID:0];
  int64_t v3 = objc_msgSend(v2, "serializeWithVersion:", +[PKDrawing _currentSerializationVersion](PKDrawing, "_currentSerializationVersion"));

  return v3;
}

- (id)serializeWithVersion:(int64_t)a3
{
  if (a3 > 1)
  {
    CGAffineTransform v12 = &unk_1F1FB0858;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PKDrawingConcrete *)self saveToArchive:&v12 withPathData:1];
      PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::Drawing>((uint64_t)&v12, 255);
    }
    else
    {
      PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::Drawing>((uint64_t)&v12, [(PKDrawingConcrete *)self saveToArchive:&v12 withPathData:1]);
    double v5 = };
    drawing::Drawing::~Drawing((drawing::Drawing *)&v12);
  }
  else
  {
    double v4 = [[PKDrawingVersionedDocument alloc] initWithDrawing:self];
    double v5 = [(PKVersionedDocument *)v4 serialize];
  }
  BOOL v6 = [(PKDrawingConcrete *)self _hasReplicaUUID];
  if (v5) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v8 = [(PKDrawingConcrete *)self uuid];

    if (v8)
    {
      double v9 = +[PKReplicaManager sharedReplicaManager];
      [v9 updateVersionForDrawing:self];
    }
  }
  CGAffineTransform v10 = +[PKReplicaManager sharedReplicaManager];
  [v10 persistIfNeeded];

  return v5;
}

- (PKDrawingConcrete)initWithV1Data:(id)a3 loadNonInkingStrokes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v6)
  {
    CGAffineTransform v10 = [(PKDrawingConcrete *)self init];
    goto LABEL_5;
  }
  long long v14 = (void **)&unk_1F1FB0A18;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  memset(v21, 0, sizeof(v21));
  id v8 = v6;
  double v9 = (const unsigned __int8 *)[v8 bytes];
  [v8 length];
  PB::Reader::Reader((PB::Reader *)buf, v9);
  LODWORD(v9) = unk_1F1FB0A28(&v14, buf);

  if (v9)
  {
    CGAffineTransform v10 = [(PKDrawingConcrete *)self initWithV1Archive:&v14 loadNonInkingStrokes:v4];
    drawingV1::Drawing::~Drawing(&v14);
LABEL_5:
    self = v10;
    id v11 = self;
    goto LABEL_9;
  }
  CGAffineTransform v12 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "PKDrawing protobuf corrupt.", buf, 2u);
  }

  drawingV1::Drawing::~Drawing(&v14);
  id v11 = 0;
LABEL_9:

  return v11;
}

- (PKDrawingConcrete)initWithLegacyData:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    id v8 = [(PKDrawingConcrete *)self init];
    goto LABEL_5;
  }
  v12[0] = &unk_1F1FB05F0;
  memset(&v12[1], 0, 24);
  int v13 = 0;
  v12[5] = 0;
  v12[6] = 0;
  id v6 = v4;
  BOOL v7 = (const unsigned __int8 *)[v6 bytes];
  [v6 length];
  PB::Reader::Reader((PB::Reader *)buf, v7);
  LODWORD(v7) = unk_1F1FB0600(v12, buf);

  if (v7)
  {
    id v8 = [(PKDrawingConcrete *)self initWithLegacyArchive:v12];
    legacy_drawing::Drawing::~Drawing((legacy_drawing::Drawing *)v12);
LABEL_5:
    self = v8;
    double v9 = self;
    goto LABEL_9;
  }
  CGAffineTransform v10 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "PKDrawing protobuf corrupt.", buf, 2u);
  }

  legacy_drawing::Drawing::~Drawing((legacy_drawing::Drawing *)v12);
  double v9 = 0;
LABEL_9:

  return v9;
}

- (PKDrawingConcrete)initWithArchive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = *((void *)a3 + 12);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", (uint64_t)(*((void *)a3 + 7) - *((void *)a3 + 6)) >> 4, a4, a5);
  uint64_t v7 = *((void *)a3 + 7) - *((void *)a3 + 6);
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = v7 >> 4;
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    do
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)(*((void *)a3 + 6) + v8)];
      [v6 addObject:v11];

      v8 += 16;
      --v10;
    }
    while (v10);
  }
  CGAffineTransform v12 = objc_alloc_init(PKVectorTimestamp);
  uint64_t v13 = *((void *)a3 + 14) - *((void *)a3 + 13);
  if (v13)
  {
    uint64_t v14 = 0;
    unint64_t v15 = v13 >> 3;
    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    do
    {
      long long v17 = *(void **)(*((void *)a3 + 13) + 8 * v14);
      uint64_t v18 = v17[1];
      uint64_t v19 = v17[3];
      long long v20 = [v6 objectAtIndex:v17[2]];
      [(PKVectorTimestamp *)v12 setClock:v18 subclock:v19 forUUID:v20];

      ++v14;
    }
    while (v16 != v14);
  }
  uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 4) - *((void *)a3 + 3)) >> 3];
  uint64_t v22 = *((void *)a3 + 4) - *((void *)a3 + 3);
  if (v22)
  {
    uint64_t v23 = 0;
    unint64_t v24 = v22 >> 3;
    if (v24 <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = v24;
    }
    do
    {
      long long v26 = [[PKInk alloc] initWithArchive:*(void *)(*((void *)a3 + 3) + 8 * v23)];
      if (v26) {
        [v21 addObject:v26];
      }

      ++v23;
    }
    while (v25 != v23);
  }
  v53 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 10) - *((void *)a3 + 9)) >> 3];
  id v50 = v12;
  if (v52)
  {
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:(uint64_t)(*((void *)a3 + 10) - *((void *)a3 + 9)) >> 3];
  }
  uint64_t v28 = *((void *)a3 + 10) - *((void *)a3 + 9);
  if (v28)
  {
    uint64_t v29 = 0;
    unint64_t v30 = v28 >> 3;
    if (v30 <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v30;
    }
    do
    {
      CGAffineTransform v32 = [[_PKStrokeConcrete alloc] initWithArchive:*(void *)(*((void *)a3 + 9) + 8 * v29) sortedUUIDs:v6 inks:v21 transientArchiveDictionary:v27];
      uint64_t v33 = v32;
      if (!v32 || a4)
      {
        if (v32)
        {
LABEL_30:
          if (!v52) {
            [(PKStroke *)v33 _setIsPastedStroke:1];
          }
          [v53 addObject:v33];
        }
      }
      else
      {
        uint64_t v34 = [(_PKStrokeConcrete *)v32 ink];
        BOOL v35 = +[PKTool _inkIsInkingTool:v34];

        if (v35) {
          goto LABEL_30;
        }
      }

      ++v29;
    }
    while (v31 != v29);
  }
  double v36 = *MEMORY[0x1E4F1DB28];
  double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v59 = 0uLL;
  uint64_t v60 = 0;
  v40 = (float *)*((void *)a3 + 1);
  if (v40)
  {
    double v36 = v40[3];
    double v37 = v40[4];
    double v38 = v40[5];
    double v39 = v40[2];
    uint64_t v41 = *((void *)a3 + 2);
    if (v41)
    {
      uint64_t v42 = *(void *)(v41 + 16);
      LODWORD(v59) = *(void *)(v41 + 8);
      if (v42 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uuid_clear((unsigned __int8 *)&v59 + 4);
      }
      else
      {
        id v43 = objc_msgSend(v6, "objectAtIndex:");
        [v43 getUUIDBytes:(char *)&v59 + 4];
      }
      HIDWORD(v60) = *(void *)(*((void *)a3 + 2) + 24);
    }
  }
  id v44 = (void *)*((void *)a3 + 12);
  if (v44)
  {
    uint64_t v45 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*v44];
  }
  else
  {
    uint64_t v45 = [MEMORY[0x1E4F29128] UUID];
  }
  long long v46 = (void *)v45;
  long long v57 = v59;
  uint64_t v58 = v60;
  long long v47 = (std::__shared_weak_count *)*((void *)a3 + 17);
  uint64_t v55 = *((void *)a3 + 16);
  unsigned int v56 = v47;
  if (v47) {
    atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v48 = -[PKDrawingConcrete initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:](self, "initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:", v45, v53, v50, &v57, &v55, v36, v37, v38, v39);
  if (v56) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v56);
  }

  return v48;
}

- (PKDrawingConcrete)initWithV1Archive:(const void *)a3 loadNonInkingStrokes:(BOOL)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)a3 + 136) & 1) != 0 && *((void *)a3 + 9) == 10)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:(uint64_t)(*((void *)a3 + 7) - *((void *)a3 + 6)) >> 4];
    uint64_t v8 = *((void *)a3 + 7) - *((void *)a3 + 6);
    if (v8)
    {
      uint64_t v9 = 0;
      unint64_t v10 = v8 >> 4;
      if (v10 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      do
      {
        CGAffineTransform v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)(*((void *)a3 + 6) + v9)];
        [v7 addObject:v12];

        v9 += 16;
        --v11;
      }
      while (v11);
    }
    uint64_t v52 = objc_alloc_init(PKVectorTimestamp);
    uint64_t v13 = *((void *)a3 + 15) - *((void *)a3 + 14);
    if (v13)
    {
      uint64_t v14 = 0;
      unint64_t v15 = v13 >> 3;
      if (v15 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v15;
      }
      do
      {
        long long v17 = *(void **)(*((void *)a3 + 14) + 8 * v14);
        uint64_t v18 = v17[1];
        uint64_t v19 = v17[3];
        long long v20 = [v7 objectAtIndex:v17[2]];
        [(PKVectorTimestamp *)v52 setClock:v18 subclock:v19 forUUID:v20];

        ++v14;
      }
      while (v16 != v14);
    }
    uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 4) - *((void *)a3 + 3)) >> 3];
    uint64_t v22 = *((void *)a3 + 4) - *((void *)a3 + 3);
    if (v22)
    {
      uint64_t v23 = 0;
      unint64_t v24 = v22 >> 3;
      if (v24 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v24;
      }
      do
      {
        long long v26 = [[PKInk alloc] initWithV1Archive:*(void *)(*((void *)a3 + 3) + 8 * v23) serializationVersion:*((void *)a3 + 9)];
        if (v26) {
          [v21 addObject:v26];
        }

        ++v23;
      }
      while (v25 != v23);
    }
    v51 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 11) - *((void *)a3 + 10)) >> 3];
    uint64_t v27 = *((void *)a3 + 11) - *((void *)a3 + 10);
    if (v27)
    {
      uint64_t v28 = 0;
      unint64_t v29 = v27 >> 3;
      if (v29 <= 1) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = v29;
      }
      while (1)
      {
        uint64_t v31 = [[_PKStrokeConcrete alloc] initWithV1Archive:*(void *)(*((void *)a3 + 10) + 8 * v28) sortedUUIDs:v7 inks:v21];
        CGAffineTransform v32 = v31;
        if (v31)
        {
          if (!a4) {
            break;
          }
        }
        if (v31) {
          goto LABEL_29;
        }
LABEL_30:

        if (v30 == ++v28) {
          goto LABEL_31;
        }
      }
      uint64_t v33 = [(_PKStrokeConcrete *)v31 ink];
      BOOL v34 = +[PKTool _inkIsInkingTool:v33];

      if (!v34) {
        goto LABEL_30;
      }
LABEL_29:
      [v51 addObject:v32];
      goto LABEL_30;
    }
LABEL_31:
    double v35 = *MEMORY[0x1E4F1DB28];
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    memset(buf, 0, sizeof(buf));
    double v39 = (float *)*((void *)a3 + 1);
    if (v39)
    {
      double v35 = v39[3];
      double v36 = v39[4];
      double v37 = v39[5];
      double v38 = v39[2];
      uint64_t v40 = *((void *)a3 + 2);
      if (v40)
      {
        uint64_t v41 = *(void *)(v40 + 16);
        *(_DWORD *)buf = *(void *)(v40 + 8);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uuid_clear(&buf[4]);
        }
        else
        {
          id v44 = objc_msgSend(v7, "objectAtIndex:");
          [v44 getUUIDBytes:&buf[4]];
        }
        *(_DWORD *)&buf[20] = *(void *)(*((void *)a3 + 2) + 24);
      }
    }
    uint64_t v45 = (void *)*((void *)a3 + 13);
    if (v45)
    {
      uint64_t v46 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*v45];
    }
    else
    {
      uint64_t v46 = [MEMORY[0x1E4F29128] UUID];
    }
    long long v47 = (void *)v46;
    long long v55 = *(_OWORD *)buf;
    uint64_t v56 = *(void *)&buf[16];
    uint64_t v53 = 0;
    v54 = 0;
    id v43 = -[PKDrawingConcrete initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:](self, "initWithUUID:strokes:version:canvasBounds:boundsVersion:unknownFields:", v46, v51, v52, &v55, &v53, v35, v36, v37, v38);
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
  }
  else
  {
    uint64_t v42 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v49 = *((void *)a3 + 9);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v49;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 10;
      _os_log_error_impl(&dword_1C44F8000, v42, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%llu != %d).", buf, 0x12u);
    }

    id v43 = [(PKDrawingConcrete *)self init];
  }

  return v43;
}

- (PKDrawingConcrete)initWithLegacyArchive:(const void *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)a3 + 64) & 4) != 0 && *((_DWORD *)a3 + 15) == 6)
  {
    double v5 = [(PKDrawingConcrete *)self init];
    if (v5)
    {
      id v6 = [[PKVectorMultiTimestamp alloc] initWithArchive:*((void *)a3 + 5) andCapacity:2];
      uint64_t v7 = [(PKVectorMultiTimestamp *)v6 sortedUUIDs];
      uint64_t v8 = [(PKVectorMultiTimestamp *)v6 timestamps];
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];
      [(PKDrawingConcrete *)v5 setVersion:v9];

      unint64_t v10 = [(PKVectorMultiTimestamp *)v6 timestamps];
      uint64_t v11 = [v10 count];

      if (v11 >= 2)
      {
        for (uint64_t i = 1; i != v11; ++i)
        {
          uint64_t v13 = [(PKDrawingConcrete *)v5 version];
          uint64_t v14 = [(PKVectorMultiTimestamp *)v6 timestamps];
          unint64_t v15 = [v14 objectAtIndexedSubscript:i];
          [v13 mergeWithTimestamp:v15];
        }
      }
      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 2) - *((void *)a3 + 1)) >> 3];
      [(PKDrawingConcrete *)v5 _setAllStrokes:v16];

      uint64_t v17 = *((void *)a3 + 2) - *((void *)a3 + 1);
      if (v17)
      {
        uint64_t v18 = 0;
        unint64_t v19 = v17 >> 3;
        if (v19 <= 1) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = v19;
        }
        do
        {
          uint64_t v21 = [[_PKStrokeConcrete alloc] initWithLegacyArchive:*(void *)(*((void *)a3 + 1) + 8 * v18) sortedUUIDs:v7];
          if (v21)
          {
            uint64_t v22 = [(PKDrawingConcrete *)v5 _allStrokes];
            [v22 addObject:v21];
          }
          ++v18;
        }
        while (v20 != v18);
      }
      if ((~*((unsigned __int8 *)a3 + 64) & 3) == 0) {
        [(PKDrawingConcrete *)v5 set_orientation:*((unsigned int *)a3 + 14)];
      }
      uint64_t v23 = (float *)*((void *)a3 + 6);
      if (v23) {
        -[PKDrawingConcrete set_canvasBounds:](v5, "set_canvasBounds:", v23[3], v23[4], v23[5], v23[2]);
      }
    }
  }
  else
  {
    unint64_t v24 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v27 = *((_DWORD *)a3 + 15);
      v28[0] = 67109376;
      v28[1] = v27;
      __int16 v29 = 1024;
      int v30 = 6;
      _os_log_error_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%d != %d).", (uint8_t *)v28, 0xEu);
    }

    double v5 = [(PKDrawingConcrete *)self init];
  }
  uint64_t v25 = v5;

  return v25;
}

- (int64_t)saveToArchive:(void *)a3 withPathData:(BOOL)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4F1CA70];
  id v6 = [(PKDrawingConcrete *)self version];
  uint64_t v7 = [v6 allUUIDs];
  v67 = [v5 orderedSetWithArray:v7];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v8 = [(PKDrawingConcrete *)self _allStrokes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * i) saveUUIDsTo:v67];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v9);
  }

  [v67 sortWithOptions:1 usingComparator:&__block_literal_global_76];
  CGAffineTransform v12 = (PB::Data **)((char *)a3 + 48);
  std::vector<PB::Data>::reserve((uint64_t *)a3 + 6, [v67 count]);
  unint64_t v13 = [v67 count];
  uint64_t v14 = *((void *)a3 + 13);
  if (v13 > (*((void *)a3 + 15) - v14) >> 3)
  {
    if (v13 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = *((void *)a3 + 14);
    v85 = (char *)a3 + 120;
    *(void *)v82 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 120, v13);
    *(void *)&v82[8] = *(void *)v82 + v15 - v14;
    v83 = *(void **)&v82[8];
    uint64_t v84 = *(void *)v82 + 8 * v16;
    std::vector<std::unique_ptr<drawing::StrokeID>>::__swap_out_circular_buffer((uint64_t *)a3 + 13, v82);
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)v82);
  }
  if ([v67 count])
  {
    uint64_t v17 = [v67 objectAtIndex:0];
    unint64_t v19 = (char *)*((void *)a3 + 7);
    unint64_t v18 = *((void *)a3 + 8);
    if ((unint64_t)v19 >= v18)
    {
      uint64_t v21 = (v19 - (char *)*v12) >> 4;
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 60) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v23 = v18 - (void)*v12;
      if (v23 >> 3 > v22) {
        unint64_t v22 = v23 >> 3;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v22;
      }
      v85 = (char *)a3 + 64;
      if (v24) {
        uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 64, v24);
      }
      else {
        uint64_t v25 = 0;
      }
      long long v26 = &v25[16 * v21];
      *(void *)v82 = v25;
      *(void *)&v82[8] = v26;
      uint64_t v84 = (uint64_t)&v25[16 * v24];
      *(void *)long long v26 = 0;
      *((void *)v26 + 1) = 0;
      v83 = v26 + 16;
      std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 6, v82);
      uint64_t v20 = (void *)*((void *)a3 + 7);
      std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v82);
    }
    else
    {
      *(void *)unint64_t v19 = 0;
      *((void *)v19 + 1) = 0;
      uint64_t v20 = v19 + 16;
      *((void *)a3 + 7) = v19 + 16;
    }
    *((void *)a3 + 7) = v20;
    memset(v82, 0, sizeof(v82));
    [v17 getUUIDBytes:v82];
    PB::Data::assign(*v12, v82, (const unsigned __int8 *)&v83);
    int v27 = [(PKDrawingConcrete *)self version];
    [v27 clockElementForUUID:v17];
    objc_claimAutoreleasedReturnValue();

    PB::PtrVector<drawing::StrokeID>::emplace_back<>();
  }
  v66 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v28 = [(PKDrawingConcrete *)self _allStrokes];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v71;
    int64_t v31 = 1;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v71 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        [v33 saveInksTo:v66];
        uint64_t v34 = [v33 requiredContentVersion];
        if (v31 <= v34) {
          int64_t v31 = v34;
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v29);
  }
  else
  {
    int64_t v31 = 1;
  }

  unint64_t v35 = [v66 count];
  uint64_t v36 = *((void *)a3 + 3);
  if (v35 > (*((void *)a3 + 5) - v36) >> 3)
  {
    if (v35 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v37 = *((void *)a3 + 4);
    v85 = (char *)a3 + 40;
    *(void *)v82 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 40, v35);
    *(void *)&v82[8] = *(void *)v82 + v37 - v36;
    v83 = *(void **)&v82[8];
    uint64_t v84 = *(void *)v82 + 8 * v38;
    std::vector<std::unique_ptr<drawing::Ink>>::__swap_out_circular_buffer((uint64_t *)a3 + 3, v82);
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)v82);
  }
  memset(v69, 0, sizeof(v69));
  double v39 = v66;
  if ([v39 countByEnumeratingWithState:v69 objects:v79 count:16]) {
    PB::PtrVector<drawing::Ink>::emplace_back<>();
  }

  uint64_t v40 = [(PKDrawingConcrete *)self _allStrokes];
  std::vector<std::unique_ptr<drawing::Stroke>>::reserve((uint64_t *)a3 + 9, [v40 count]);

  [(PKDrawingConcrete *)self uuid];
  memset(v68, 0, sizeof(v68));
  uint64_t v41 = [(PKDrawingConcrete *)self _allStrokes];
  if ([v41 countByEnumeratingWithState:v68 objects:v78 count:16]) {
    PB::PtrVector<drawing::Stroke>::emplace_back<>();
  }

  [(PKDrawingConcrete *)self _canvasBounds];
  double x = v87.origin.x;
  double y = v87.origin.y;
  double width = v87.size.width;
  double height = v87.size.height;
  if (!CGRectIsNull(v87))
  {
    drawing::Drawing::makeBounds((uint64_t)a3);
    uint64_t v46 = *((void *)a3 + 1);
    float v47 = x;
    char v48 = *(unsigned char *)(v46 + 24);
    float v49 = y;
    float v50 = width;
    *(float *)(v46 + 16) = v49;
    *(float *)(v46 + 20) = v50;
    float v51 = height;
    *(unsigned char *)(v46 + 24) = v48 | 0xF;
    *(float *)(v46 + 8) = v51;
    *(float *)(v46 + 12) = v47;
  }
  drawing::Drawing::makeBoundsVersion((uint64_t)a3);
  uint64_t v52 = *((void *)a3 + 2);
  [(PKDrawingConcrete *)self boundsVersion];
  uint64_t v53 = *(unsigned int *)v82;
  *(unsigned char *)(v52 + 32) |= 1u;
  *(void *)(v52 + 8) = v53;
  id v54 = objc_alloc(MEMORY[0x1E4F29128]);
  [(PKDrawingConcrete *)self boundsVersion];
  long long v55 = (void *)[v54 initWithUUIDBytes:&v82[4]];
  uint64_t v56 = [v67 indexOfObject:v55];
  uint64_t v57 = *((void *)a3 + 2);
  *(unsigned char *)(v57 + 32) |= 2u;
  *(void *)(v57 + 16) = v56;
  uint64_t v58 = *((void *)a3 + 2);
  [(PKDrawingConcrete *)self boundsVersion];
  uint64_t v59 = HIDWORD(v83);
  *(unsigned char *)(v58 + 32) |= 4u;
  *(void *)(v58 + 24) = v59;
  uint64_t v60 = [(PKDrawingConcrete *)self nsuuid];
  LOBYTE(v58) = v60 == 0;

  if ((v58 & 1) == 0)
  {
    if (!*((void *)a3 + 12)) {
      operator new();
    }
    memset(v82, 0, sizeof(v82));
    uint64_t v61 = [(PKDrawingConcrete *)self nsuuid];
    [v61 getUUIDBytes:v82];

    PB::Data::assign(*((PB::Data **)a3 + 12), v82, (const unsigned __int8 *)&v83);
  }
  [(PKDrawingConcrete *)self _unknownFields];
  long long v62 = *(_OWORD *)v82;
  memset(v82, 0, sizeof(v82));
  v63 = (std::__shared_weak_count *)*((void *)a3 + 17);
  *((_OWORD *)a3 + 8) = v62;
  if (v63)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v63);
    if (*(void *)&v82[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v82[8]);
    }
  }

  return v31;
}

uint64_t __79__PKDrawingConcrete_PKDrawingPersistenceAdditions__saveToArchive_withPathData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "PK_compare:");
}

- (unsigned)saveToV1Archive:(void *)a3 withPathData:(BOOL)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CA70];
  uint64_t v7 = [(PKDrawingConcrete *)self version];
  uint64_t v8 = [v7 allUUIDs];
  long long v70 = [v6 orderedSetWithArray:v8];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v9 = [(PKDrawingConcrete *)self _allStrokes];
  v68 = self;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v78 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v77 + 1) + 8 * i) saveUUIDsTo:v70];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v10);
  }

  *((unsigned char *)a3 + 136) |= 1u;
  *((void *)a3 + 9) = 10;
  unint64_t v13 = (PB::Data **)((char *)a3 + 48);
  std::vector<PB::Data>::reserve((uint64_t *)a3 + 6, [v70 count]);
  unint64_t v14 = [v70 count];
  uint64_t v15 = *((void *)a3 + 14);
  if (v14 > (*((void *)a3 + 16) - v15) >> 3)
  {
    if (v14 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = *((void *)a3 + 15);
    v89 = (char *)a3 + 128;
    *(void *)v85 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 128, v14);
    uint64_t v86 = (char *)(*(void *)v85 + v16 - v15);
    CGRect v87 = v86;
    uint64_t v88 = *(void *)v85 + 8 * v17;
    std::vector<std::unique_ptr<drawingV1::StrokeID>>::__swap_out_circular_buffer((uint64_t *)a3 + 14, v85);
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)v85);
  }
  if ([v70 count])
  {
    unint64_t v18 = [v70 objectAtIndex:0];
    uint64_t v20 = (char *)*((void *)a3 + 7);
    unint64_t v19 = *((void *)a3 + 8);
    if ((unint64_t)v20 >= v19)
    {
      uint64_t v22 = (v20 - (char *)*v13) >> 4;
      unint64_t v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 60) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v24 = v19 - (void)*v13;
      if (v24 >> 3 > v23) {
        unint64_t v23 = v24 >> 3;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v23;
      }
      v89 = (char *)a3 + 64;
      if (v25) {
        long long v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 64, v25);
      }
      else {
        long long v26 = 0;
      }
      int v27 = &v26[16 * v22];
      *(void *)v85 = v26;
      uint64_t v86 = v27;
      uint64_t v88 = (uint64_t)&v26[16 * v25];
      *(void *)int v27 = 0;
      *((void *)v27 + 1) = 0;
      CGRect v87 = v27 + 16;
      std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 6, v85);
      uint64_t v21 = (void *)*((void *)a3 + 7);
      std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v85);
    }
    else
    {
      *(void *)uint64_t v20 = 0;
      *((void *)v20 + 1) = 0;
      uint64_t v21 = v20 + 16;
      *((void *)a3 + 7) = v20 + 16;
    }
    *((void *)a3 + 7) = v21;
    *(void *)v85 = 0;
    uint64_t v86 = 0;
    [v18 getUUIDBytes:v85];
    PB::Data::assign(*v13, v85, (const unsigned __int8 *)&v87);
    uint64_t v28 = [(PKDrawingConcrete *)v68 version];
    [v28 clockElementForUUID:v18];
    objc_claimAutoreleasedReturnValue();

    PB::PtrVector<drawingV1::StrokeID>::emplace_back<>();
  }
  v69 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v29 = [(PKDrawingConcrete *)v68 _allStrokes];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v74 != v31) {
          objc_enumerationMutation(v29);
        }
        uint64_t v33 = [*(id *)(*((void *)&v73 + 1) + 8 * j) ink];
        [v69 addObject:v33];
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v30);
  }

  unint64_t v34 = [v69 count];
  uint64_t v35 = *((void *)a3 + 3);
  if (v34 > (*((void *)a3 + 5) - v35) >> 3)
  {
    if (v34 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v36 = *((void *)a3 + 4);
    v89 = (char *)a3 + 40;
    *(void *)v85 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 40, v34);
    uint64_t v86 = (char *)(*(void *)v85 + v36 - v35);
    CGRect v87 = v86;
    uint64_t v88 = *(void *)v85 + 8 * v37;
    std::vector<std::unique_ptr<drawingV1::Ink>>::__swap_out_circular_buffer((uint64_t *)a3 + 3, v85);
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)v85);
  }
  memset(v72, 0, sizeof(v72));
  uint64_t v38 = v69;
  if ([v38 countByEnumeratingWithState:v72 objects:v82 count:16]) {
    PB::PtrVector<drawingV1::Ink>::emplace_back<>();
  }

  [(PKDrawingConcrete *)v68 uuid];
  double v39 = [(PKDrawingConcrete *)v68 _allStrokes];
  unint64_t v40 = [v39 count];
  uint64_t v41 = *((void *)a3 + 10);
  if (v40 > (*((void *)a3 + 12) - v41) >> 3)
  {
    if (v40 >> 61) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v42 = *((void *)a3 + 11);
    v89 = (char *)a3 + 96;
    *(void *)v85 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)a3 + 96, v40);
    uint64_t v86 = (char *)(*(void *)v85 + v42 - v41);
    CGRect v87 = v86;
    uint64_t v88 = *(void *)v85 + 8 * v43;
    std::vector<std::unique_ptr<drawingV1::Stroke>>::__swap_out_circular_buffer((uint64_t *)a3 + 10, v85);
    std::__split_buffer<std::unique_ptr<legacy_drawing::VectorTimestampClockReplicaClock>>::~__split_buffer((void **)v85);
  }

  memset(v71, 0, sizeof(v71));
  id v44 = [(PKDrawingConcrete *)v68 _allStrokes];
  if ([v44 countByEnumeratingWithState:v71 objects:v81 count:16]) {
    PB::PtrVector<drawingV1::Stroke>::emplace_back<>();
  }

  [(PKDrawingConcrete *)v68 _canvasBounds];
  double x = v91.origin.x;
  double y = v91.origin.y;
  double width = v91.size.width;
  double height = v91.size.height;
  if (!CGRectIsNull(v91))
  {
    drawingV1::Drawing::makeBounds((uint64_t)a3);
    uint64_t v49 = *((void *)a3 + 1);
    float v50 = x;
    char v51 = *(unsigned char *)(v49 + 24);
    float v52 = y;
    float v53 = width;
    *(float *)(v49 + 16) = v52;
    *(float *)(v49 + 20) = v53;
    float v54 = height;
    *(unsigned char *)(v49 + 24) = v51 | 0xF;
    *(float *)(v49 + 8) = v54;
    *(float *)(v49 + 12) = v50;
  }
  drawingV1::Drawing::makeBoundsVersion((uint64_t)a3);
  uint64_t v55 = *((void *)a3 + 2);
  [(PKDrawingConcrete *)v68 boundsVersion];
  uint64_t v56 = *(unsigned int *)v85;
  *(unsigned char *)(v55 + 32) |= 1u;
  *(void *)(v55 + 8) = v56;
  id v57 = objc_alloc(MEMORY[0x1E4F29128]);
  [(PKDrawingConcrete *)v68 boundsVersion];
  uint64_t v58 = (void *)[v57 initWithUUIDBytes:&v85[4]];
  uint64_t v59 = [v70 indexOfObject:v58];
  uint64_t v60 = *((void *)a3 + 2);
  *(unsigned char *)(v60 + 32) |= 2u;
  *(void *)(v60 + 16) = v59;
  uint64_t v61 = *((void *)a3 + 2);
  [(PKDrawingConcrete *)v68 boundsVersion];
  uint64_t v62 = HIDWORD(v87);
  *(unsigned char *)(v61 + 32) |= 4u;
  *(void *)(v61 + 24) = v62;
  v63 = [(PKDrawingConcrete *)v68 nsuuid];
  LOBYTE(v61) = v63 == 0;

  if ((v61 & 1) == 0)
  {
    uint64_t v65 = *((void *)a3 + 13);
    v64 = (PB::Data **)((char *)a3 + 104);
    if (!v65) {
      operator new();
    }
    *(void *)v85 = 0;
    uint64_t v86 = 0;
    v66 = [(PKDrawingConcrete *)v68 nsuuid];
    [v66 getUUIDBytes:v85];

    PB::Data::assign(*v64, v85, (const unsigned __int8 *)&v87);
  }

  return 10;
}

- (id)v1SerializeWithPathData:(BOOL)a3
{
  int v5 = 0;
  int64_t v3 = [(PKDrawingConcrete *)self v1SerializeWithPathData:a3 toVersion:&v5];

  return v3;
}

- (id)v1SerializeWithPathData:(BOOL)a3 toVersion:(unsigned int *)a4
{
  uint64_t v7 = (void **)&unk_1F1FB0A18;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  *a4 = [(PKDrawingConcrete *)self saveToV1Archive:&v7 withPathData:a3];
  PB::Writer::Writer((PB::Writer *)&v15);
  ((void (*)(void ***, uint64_t *))v7[3])(&v7, &v15);
  id v4 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  int v5 = (void *)[v4 initWithBytes:v16 length:v15 - v16];
  PB::Writer::~Writer((PB::Writer *)&v15);
  drawingV1::Drawing::~Drawing(&v7);

  return v5;
}

@end