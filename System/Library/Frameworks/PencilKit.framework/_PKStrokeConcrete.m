@interface _PKStrokeConcrete
+ (id)decodeRenameableUUIDFromData:(const char *)a3 transientArchiveDictionary:(id)a4;
+ (void)encodeUUID:(id)a3 toData:(void *)a4;
- ($F102CC200F6BE7F1479F71F6DC2C7351)_flags;
- (BOOL)_isFullyHidden;
- (BOOL)hasSubstrokes;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)_inkTransform;
- (CGAffineTransform)_transform;
- (CGPoint)_anchorPointForTexture;
- (CGPoint)readPointFromArchive:(const Point *)a3;
- (CGRect)renderBounds;
- (NSArray)_substrokes;
- (_PKStrokeConcrete)init;
- (_PKStrokeConcrete)initWithArchive:(const void *)a3 error:(id *)a4;
- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 parent:(id)a6 isHidden:(BOOL)a7 transientArchiveDictionary:(id)a8;
- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 transientArchiveDictionary:(id)a6;
- (_PKStrokeConcrete)initWithData:(id)a3 error:(id *)a4;
- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8;
- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 sortID:(_PKStrokeID *)a5 flags:(id)a6 version:(_PKStrokeID *)a7 ink:(id)a8 transform:(CGAffineTransform *)a9 substrokes:(id)a10 substrokesVersion:(_PKStrokeID *)a11;
- (_PKStrokeConcrete)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7;
- (_PKStrokeConcrete)initWithLegacyArchive:(const void *)a3 sortedUUIDs:(id)a4;
- (_PKStrokeConcrete)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_PKStrokeID *)a5 ink:(id)a6 transform:(CGAffineTransform *)a7;
- (_PKStrokeConcrete)initWithV1Archive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5;
- (_PKStrokeID)_sortID;
- (_PKStrokeID)_substrokesVersion;
- (_PKStrokeID)_version;
- (_PKStrokeID)readStrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4;
- (_PKStrokeID)readV1StrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4;
- (_PKStrokePoint)readPointFromLegacyArchive:(SEL)a3 deltaFrom:(const Point *)a4;
- (id).cxx_construct;
- (id)_clipPlane;
- (id)_dataInUnknownFields;
- (id)_groupID;
- (id)_mergeUnparentedWithStroke:(id)a3 inDrawing:(id)a4;
- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4;
- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4;
- (id)_renderGroupID;
- (id)_strokeMask;
- (id)_strokeUUID;
- (id)_substrokesInDrawing:(id)a3;
- (id)_updateStroke:(id)a3 inDrawing:(id)a4;
- (id)_updateWithParent:(id)a3 inDrawing:(id)a4;
- (id)copyForMutation;
- (id)copyForSubstroke;
- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3;
- (id)dataRepresentation;
- (id)deltaTo:(id)a3;
- (id)ink;
- (id)mergeArrayOfStrokes:(id)a3 with:(id)a4 inDrawing:(id)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)parentStrokeForInsertionInDrawing:(id)a3;
- (id)path;
- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4;
- (id)strokeApplying:(id)a3;
- (int64_t)_shapeType;
- (int64_t)compareToStroke:(id)a3;
- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 parent:(id)a7 transient:(BOOL)a8;
- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7;
- (unsigned)saveToV1Archive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7;
- (void)_addTestDataToUnknownFields;
- (void)_invalidateBounds;
- (void)_setBounds:(CGRect)a3;
- (void)_setClipPlane:(id)a3;
- (void)_setFlags:(id)a3;
- (void)_setGroupID:(id)a3;
- (void)_setInkTransform:(CGAffineTransform *)a3;
- (void)_setRenderGroupID:(id)a3;
- (void)_setShapeType:(int64_t)a3;
- (void)_setStrokeMask:(id)a3;
- (void)_setStrokeUUID:(id)a3;
- (void)_setSubstrokes:(id)a3;
- (void)_setTransform:(CGAffineTransform *)a3;
- (void)didUpdateInDrawing:(id)a3;
- (void)didUpdateSubstrokesInDrawing:(id)a3;
- (void)saveInksTo:(id)a3;
- (void)saveStrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5;
- (void)saveToArchive:(void *)a3;
- (void)saveUUIDsTo:(id)a3;
- (void)saveV1StrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5;
- (void)setInk:(id)a3;
- (void)setPath:(id)a3;
- (void)set_sortID:(_PKStrokeID *)a3;
- (void)set_substrokes:(id)a3;
- (void)set_substrokesVersion:(_PKStrokeID *)a3;
- (void)set_version:(_PKStrokeID *)a3;
@end

@implementation _PKStrokeConcrete

- (_PKStrokeConcrete)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9 = &unk_1F1FB0740;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (PKProtobufUtilitiesParseArchiveFromNSDataWithHeader<drawing::StrokeDelta>((uint64_t)&v9, v6, a4))
  {
    self = [(_PKStrokeConcrete *)self initWithArchive:&v9 error:a4];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v9);

  return v7;
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", (uint64_t)(*((void *)a3 + 3) - *((void *)a3 + 2)) >> 4, a4);
  uint64_t v7 = *((void *)a3 + 3) - *((void *)a3 + 2);
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
      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)(*((void *)a3 + 2) + v8)];
      [v6 addObject:v11];

      v8 += 16;
      --v10;
    }
    while (v10);
  }
  long long v12 = [[PKInk alloc] initWithArchive:*((void *)a3 + 1)];
  v13 = v12;
  uint64_t v14 = *((void *)a3 + 5);
  if (v14)
  {
    v18[0] = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v16 = [(_PKStrokeConcrete *)self initWithArchive:v14 sortedUUIDs:v6 inks:v15 transientArchiveDictionary:0];
  }
  else
  {

    v16 = 0;
  }

  return v16;
}

- (id)dataRepresentation
{
  v4 = &unk_1F1FB0740;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  [(_PKStrokeConcrete *)self saveToArchive:&v4];
  v2 = PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::StrokeDelta>((uint64_t)&v4);
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v4);

  return v2;
}

- (void)saveToArchive:(void *)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  long long v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v6 = (void *)MEMORY[0x1E4F1CAA0];
  long long v7 = [(_PKStrokeConcrete *)self ink];
  v27 = [v6 orderedSetWithObject:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  [(_PKStrokeConcrete *)self _sortID];
  unint64_t v9 = (void *)[v8 initWithUUIDBytes:&v28[4]];
  [v5 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  [(_PKStrokeConcrete *)self _version];
  long long v11 = (void *)[v10 initWithUUIDBytes:&v28[4]];
  [v5 addObject:v11];

  drawing::StrokeDelta::makeInk((uint64_t)a3);
  long long v12 = [(_PKStrokeConcrete *)self ink];
  [v12 saveToArchive:*((void *)a3 + 1)];

  drawing::StrokeDelta::makeStroke((uint64_t)a3);
  [(_PKStrokeConcrete *)self saveToArchive:*((void *)a3 + 5) sortedUUIDs:v5 inks:v27 withPathData:1 transient:0];
  uint64_t v13 = [v5 count];
  if (v13)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v16 = (char *)a3 + 16;
    do
    {
      v17 = [v5 objectAtIndex:v15];
      v19 = (void *)*((void *)a3 + 3);
      unint64_t v18 = *((void *)a3 + 4);
      if ((unint64_t)v19 >= v18)
      {
        uint64_t v21 = ((uint64_t)v19 - *v16) >> 4;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v23 = v18 - *v16;
        if (v23 >> 3 > v22) {
          unint64_t v22 = v23 >> 3;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        v30[2] = (char *)a3 + 32;
        if (v24) {
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 32, v24);
        }
        else {
          v25 = 0;
        }
        v26 = &v25[16 * v21];
        *(void *)v28 = v25;
        v29 = v26;
        v30[1] = &v25[16 * v24];
        *(void *)v26 = 0;
        *((void *)v26 + 1) = 0;
        v30[0] = v26 + 16;
        std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 2, v28);
        v20 = (void *)*((void *)a3 + 3);
        std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)v28);
      }
      else
      {
        void *v19 = 0;
        v19[1] = 0;
        v20 = v19 + 2;
        *((void *)a3 + 3) = v19 + 2;
      }
      *((void *)a3 + 3) = v20;
      *(void *)v28 = 0;
      v29 = 0;
      [v17 getUUIDBytes:v28];
      PB::Data::assign((PB::Data *)(*v16 + v14), v28, (const unsigned __int8 *)v30);

      ++v15;
      v14 += 16;
    }
    while (v13 != v15);
  }
}

- (id)deltaTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(_PKStrokeConcrete *)self _strokeUUID];
  long long v6 = [v4 _strokeUUID];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0) {
    goto LABEL_8;
  }
  [(_PKStrokeConcrete *)self _version];
  if (v4) {
    [v4 _version];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  uint64_t v8 = _PKStrokeIDCompare(&v16, &v15);
  if (!v8)
  {
    long long v11 = [(PKStroke *)self _strokeData];
    long long v12 = [v4 _strokeData];
    uint64_t v13 = [v11 deltaTo:v12];

    if (v13)
    {
      unint64_t v9 = objc_alloc_init(PKStrokeDelta);
      [(PKStrokeDelta *)v9 setDeltaStrokeData:v13];
      uint64_t v14 = [(_PKStrokeConcrete *)self _strokeUUID];
      [(PKStrokeDelta *)v9 set_strokeUUID:v14];
    }
    else
    {
      unint64_t v9 = 0;
    }

    goto LABEL_9;
  }
  if (v8 == -1)
  {
    unint64_t v9 = objc_alloc_init(PKStrokeDelta);
    [(PKStrokeDelta *)v9 setDeltaStroke:v4];
  }
  else
  {
LABEL_8:
    unint64_t v9 = 0;
  }
LABEL_9:

  return v9;
}

- (id)strokeApplying:(id)a3
{
  id v4 = a3;
  long long v5 = [(_PKStrokeConcrete *)self _strokeUUID];
  long long v6 = [v4 _strokeUUID];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    unint64_t v9 = self;
    goto LABEL_8;
  }
  uint64_t v8 = [v4 deltaStroke];

  if (!v8)
  {
    id v10 = [v4 deltaStrokeData];

    if (v10)
    {
      long long v11 = [(PKStroke *)self _strokeData];
      long long v12 = [v4 deltaStrokeData];
      uint64_t v13 = [v11 dataApplying:v12];

      if (v13)
      {
        uint64_t v14 = [(_PKStrokeConcrete *)self copyForMutation];
        [(PKStroke *)v14 set_strokeData:v13];

        goto LABEL_9;
      }
    }
    goto LABEL_7;
  }
  unint64_t v9 = [v4 deltaStroke];
LABEL_8:
  uint64_t v14 = v9;
LABEL_9:

  return v14;
}

- (_PKStrokeConcrete)init
{
  v15.receiver = self;
  v15.super_class = (Class)_PKStrokeConcrete;
  v2 = [(PKStroke *)&v15 init];
  v3 = objc_alloc_init(PKStrokePath);
  id v4 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v3;

  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v2 + 40) = v5;
  long long v6 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *((_OWORD *)v2 + 10) = *MEMORY[0x1E4F1DAB8];
  *((_OWORD *)v2 + 11) = v8;
  *((_OWORD *)v2 + 12) = v7;
  long long v10 = v6[1];
  long long v9 = v6[2];
  *((_OWORD *)v2 + 13) = *v6;
  *((_OWORD *)v2 + 14) = v10;
  *((_OWORD *)v2 + 15) = v9;
  long long v11 = (void *)*((void *)v2 + 14);
  *((void *)v2 + 14) = MEMORY[0x1E4F1CBF0];

  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v13 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v12;

  return (_PKStrokeConcrete *)v2;
}

- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 flags:(id)a5 ink:(id)a6 transform:(CGAffineTransform *)a7 substrokes:(id)a8
{
  long long v10 = (void *)*(&a5.var0.var1 + 1);
  unint64_t var1 = a5.var0.var1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = v10;
  uint64_t v17 = a7;
  long long v32 = 0uLL;
  unint64_t v18 = objc_msgSend(MEMORY[0x1E4F29128], "PK_zero");
  [v18 getUUIDBytes:&v32];

  int v28 = 0;
  int v29 = 0;
  long long v30 = v32;
  int v31 = 0;
  int v25 = 0;
  int v26 = 0;
  long long v27 = v32;
  long long v19 = *((_OWORD *)a6 + 1);
  v22[0] = *(_OWORD *)a6;
  v22[1] = v19;
  v22[2] = *((_OWORD *)a6 + 2);
  int v23 = 0;
  long long v24 = v32;
  v20 = [(_PKStrokeConcrete *)self initWithData:v14 id:v15 sortID:&v29 flags:var1 version:&v26 ink:v16 transform:v22 substrokes:v17 substrokesVersion:&v23];

  return v20;
}

- (_PKStrokeConcrete)initWithData:(id)a3 id:(id)a4 sortID:(_PKStrokeID *)a5 flags:(id)a6 version:(_PKStrokeID *)a7 ink:(id)a8 transform:(CGAffineTransform *)a9 substrokes:(id)a10 substrokesVersion:(_PKStrokeID *)a11
{
  uint64_t v12 = (long long *)*(&a6.var0.var1 + 1);
  unint64_t var1 = a6.var0.var1;
  id v31 = a3;
  id v30 = a4;
  long long v32 = a7;
  int v29 = a9;
  v36.receiver = self;
  v36.super_class = (Class)_PKStrokeConcrete;
  uint64_t v17 = [(PKStroke *)&v36 init];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v17 + 24) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v17 + 40) = v19;
  objc_storeStrong((id *)v17 + 7, a7);
  *((void *)v17 + 8) = var1;
  objc_storeStrong((id *)v17 + 9, a4);
  objc_storeStrong((id *)v17 + 10, a3);
  uint64_t v20 = *((void *)a10 + 2);
  *(_OWORD *)(v17 + 88) = *(_OWORD *)a10;
  *((void *)v17 + 13) = v20;
  objc_storeStrong((id *)v17 + 14, a9);
  long long v21 = *v12;
  *((void *)v17 + 39) = *((void *)v12 + 2);
  *(_OWORD *)(v17 + 296) = v21;
  long long v22 = *(_OWORD *)&a5->clock;
  *((void *)v17 + 36) = *(void *)&a5->replicaUUID[12];
  *((_OWORD *)v17 + 17) = v22;
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)a8), (int8x16_t)vcgezq_f64(*(float64x2_t *)a8)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*((float64x2_t *)a8 + 1)), (int8x16_t)vcgezq_f64(*((float64x2_t *)a8 + 1))))))))a8 = (id)MEMORY[0x1E4F1DAB8]; {
  float64x2_t v23 = *(float64x2_t *)a8;
  }
  long long v24 = *((_OWORD *)a8 + 2);
  *((_OWORD *)v17 + 11) = *((_OWORD *)a8 + 1);
  *((_OWORD *)v17 + 12) = v24;
  *((float64x2_t *)v17 + 10) = v23;
  int v25 = [(_PKStrokeID *)v32 behavior];
  int v26 = v25;
  if (v25)
  {
    [v25 inkTransform];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
  }
  *((_OWORD *)v17 + 13) = v33;
  *((_OWORD *)v17 + 14) = v34;
  *((_OWORD *)v17 + 15) = v35;

  return (_PKStrokeConcrete *)v17;
}

- (_PKStrokeConcrete)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_PKStrokeID *)a5 ink:(id)a6 transform:(CGAffineTransform *)a7
{
  BOOL v10 = a4;
  v36[3] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = a3;
  id v13 = a6;
  uint64_t v14 = [v12 _flags];
  id v15 = [v12 _strokeData];
  id v16 = [v12 _strokeUUID];
  if (v12) {
    [v12 _sortID];
  }
  else {
    memset(v36, 0, 24);
  }
  long long v34 = *(_OWORD *)&a5->clock;
  uint64_t v35 = *(void *)&a5->replicaUUID[12];
  long long v17 = *(_OWORD *)&a7->c;
  v32[0] = *(_OWORD *)&a7->a;
  v32[1] = v17;
  v32[2] = *(_OWORD *)&a7->tx;
  unint64_t v18 = [v12 _substrokes];
  if (v12) {
    [v12 _substrokesVersion];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  long long v19 = [(_PKStrokeConcrete *)self initWithData:v15 id:v16 sortID:v36 flags:v14 | v10 version:&v34 ink:v13 transform:v32 substrokes:v18 substrokesVersion:v33];

  uint64_t v20 = [v12 _clipPlane];
  [(_PKStrokeConcrete *)v19 _setClipPlane:v20];

  long long v21 = [v12 _strokeMask];
  [(_PKStrokeConcrete *)v19 _setStrokeMask:v21];

  long long v22 = [v12 _renderMask];
  [(PKStroke *)v19 _setRenderMask:v22];

  float64x2_t v23 = [v12 _groupID];
  [(_PKStrokeConcrete *)v19 _setGroupID:v23];

  long long v24 = [v12 _renderGroupID];
  [(_PKStrokeConcrete *)v19 _setRenderGroupID:v24];

  -[_PKStrokeConcrete _setShapeType:](v19, "_setShapeType:", [v12 _shapeType]);
  if (v12)
  {
    [v12 _inkTransform];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
  }
  *(_OWORD *)&v19->_transform.ty = v29;
  *(_OWORD *)&v19->_inkTransform.b = v30;
  *(_OWORD *)&v19->_inkTransform.d = v31;
  int v26 = (PKProtobufUnknownFields *)v12[1];
  uint64_t v25 = v12[2];
  if (v25) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v19->_unknownFields.__cntrl_;
  v19->_unknownFields.__ptr_ = v26;
  v19->_unknownFields.__cntrl_ = (__shared_weak_count *)v25;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }

  return v19;
}

- (_PKStrokeConcrete)initWithInk:(id)a3 strokePath:(id)a4 transform:(CGAffineTransform *)a5 mask:(id)a6 randomSeed:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_PKStrokeConcrete;
  id v16 = [(PKStroke *)&v31 init];
  objc_storeStrong((id *)v16 + 7, a3);
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v18 = (void *)*((void *)v16 + 9);
  *((void *)v16 + 9) = v17;

  objc_storeStrong((id *)v16 + 10, a4);
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v16 + 24) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v16 + 40) = v19;
  uint64_t v20 = (void *)*((void *)v16 + 14);
  *((void *)v16 + 14) = MEMORY[0x1E4F1CBF0];

  long long v22 = *(_OWORD *)&a5->c;
  long long v21 = *(_OWORD *)&a5->tx;
  *((_OWORD *)v16 + 10) = *(_OWORD *)&a5->a;
  *((_OWORD *)v16 + 11) = v22;
  *((_OWORD *)v16 + 12) = v21;
  float64x2_t v23 = [v13 behavior];
  long long v24 = v23;
  if (v23)
  {
    [v23 inkTransform];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }
  *((_OWORD *)v16 + 13) = v28;
  *((_OWORD *)v16 + 14) = v29;
  *((_OWORD *)v16 + 15) = v30;

  if (v15)
  {
    if (([v15 isEmpty] & 1) == 0)
    {
      [v15 bounds];
      if (!CGRectIsEmpty(v32))
      {
        uint64_t v25 = [[PKStrokeMask alloc] initWithBezierPath:v15 stroke:v16];
        int v26 = (void *)*((void *)v16 + 16);
        *((void *)v16 + 16) = v25;
      }
    }
  }
  *((void *)v16 + 8) = *((void *)v16 + 8) & 0xFFFFFFC00000001FLL | (32 * a7) | 0x2000000000;

  return (_PKStrokeConcrete *)v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [PKMutableStroke alloc];
  BOOL v5 = [(PKStroke *)self _isHidden];
  [(_PKStrokeConcrete *)self _version];
  long long v6 = [(_PKStrokeConcrete *)self ink];
  [(PKStroke *)self transform];
  long long v7 = [(_PKStrokeConcrete *)v4 initWithStroke:self hidden:v5 version:v10 ink:v6 transform:&v9];

  return v7;
}

- (id)copyForMutation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [_PKStrokeConcrete alloc];
  BOOL v4 = [(PKStroke *)self _isHidden];
  [(_PKStrokeConcrete *)self _version];
  BOOL v5 = [(_PKStrokeConcrete *)self ink];
  [(PKStroke *)self transform];
  long long v6 = [(_PKStrokeConcrete *)v3 initWithStroke:self hidden:v4 version:v9 ink:v5 transform:&v8];

  return v6;
}

- (id)copyForSubstroke
{
  id v3 = [(_PKStrokeConcrete *)self copyForMutation];
  objc_msgSend(v3, "_setFlags:", -[_PKStrokeConcrete _flags](self, "_flags") & 0x1FFFFFFFE0 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x2000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x10000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x80000000000 | -[_PKStrokeConcrete _flags](self, "_flags") & 0x100000000000 | 0xE);
  BOOL v4 = [MEMORY[0x1E4F29128] UUID];
  [v3 _setStrokeUUID:v4];

  return v3;
}

- (id)parentStrokeForInsertionInDrawing:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0uLL;
  BOOL v5 = [v4 replicaUUID];
  [v5 getUUIDBytes:&v21];

  long long v6 = [_PKStrokeConcrete alloc];
  long long v7 = [(PKStroke *)self _strokeData];
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  [(_PKStrokeConcrete *)self _sortID];
  int v17 = 0;
  long long v18 = v21;
  int v19 = 0;
  uint64_t v9 = [(_PKStrokeConcrete *)self ink];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v10;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  int v14 = 0;
  long long v15 = v21;
  int v16 = 0;
  uint64_t v11 = [(_PKStrokeConcrete *)v6 initWithData:v7 id:v8 sortID:v20 flags:0 version:&v17 ink:v9 transform:v13 substrokes:MEMORY[0x1E4F1CBF0] substrokesVersion:&v14];

  return v11;
}

- (id)sliceIdentifierForTStart:(double)a3 tEnd:(double)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  long long v7 = [PKStrokeProviderSliceIdentifierConcrete alloc];
  uint64_t v8 = [(_PKStrokeConcrete *)self _strokeUUID];
  [(_PKStrokeConcrete *)self _version];
  uint64_t v9 = [(PKStrokeProviderSliceIdentifierConcrete *)v7 initWithUUID:v8 version:v11 tStart:a3 tEnd:a4];

  return v9;
}

- (id)ink
{
  return self->_ink;
}

- (void)setInk:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_ink, a3);
  long long v6 = [v5 behavior];
  long long v7 = v6;
  if (v6)
  {
    [v6 inkTransform];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  *(_OWORD *)&self->_transform.ty = v8;
  *(_OWORD *)&self->_inkTransform.b = v9;
  *(_OWORD *)&self->_inkTransform.d = v10;
}

- (id)path
{
  return self->_strokeUUID;
}

- (void)setPath:(id)a3
{
}

- (id)_strokeMask
{
  return self->_clipPlane;
}

- (void)_setStrokeMask:(id)a3
{
}

- ($F102CC200F6BE7F1479F71F6DC2C7351)_flags
{
  unint64_t allFlags = self->_flags.var0.allFlags;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.unint64_t var1 = allFlags;
  return result;
}

- (void)_setFlags:(id)a3
{
  self->_flags.var0.unint64_t allFlags = a3.var0.var1;
}

- (id)_groupID
{
  return self->_strokeMask;
}

- (void)_setGroupID:(id)a3
{
}

- (int64_t)_shapeType
{
  return (int64_t)self->_renderGroupID;
}

- (id)_renderGroupID
{
  return self->_groupID;
}

- (void)_setRenderGroupID:(id)a3
{
}

- (void)_setShapeType:(int64_t)a3
{
  self->_renderGroupID = (NSUUID *)a3;
}

- (void)_setClipPlane:(id)a3
{
}

- (id)_clipPlane
{
  return self->_substrokes;
}

- (CGAffineTransform)_transform
{
  long long v3 = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].a;
  return self;
}

- (CGAffineTransform)_inkTransform
{
  long long v3 = *(_OWORD *)&self[4].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].a;
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_shapeType = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.b = v4;
  *(_OWORD *)&self->_transform.d = v3;
  [(_PKStrokeConcrete *)self _invalidateBounds];
}

- (void)_setInkTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.ty = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_inkTransform.b = v4;
  *(_OWORD *)&self->_inkTransform.d = v3;
  [(_PKStrokeConcrete *)self _invalidateBounds];
}

- (id)copyWithNewAnchorPointForTexture:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id result = [(_PKStrokeConcrete *)self copyForMutation];
  *((CGFloat *)result + 32) = x;
  *((CGFloat *)result + 33) = y;
  return result;
}

- (CGPoint)_anchorPointForTexture
{
  tCGFloat y = self->_inkTransform.ty;
  double x = self->_anchorPointForTexture.x;
  result.CGFloat y = x;
  result.double x = ty;
  return result;
}

- (BOOL)hasSubstrokes
{
  v2 = [(_PKStrokeConcrete *)self _substrokes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_strokeUUID
{
  return *((id *)&self->_flags.var0.allFlags + 1);
}

- (void)_setStrokeUUID:(id)a3
{
}

- (BOOL)_isFullyHidden
{
  return [(PKStroke *)self _visibleSubstrokeCountInDrawing:0] == 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v4 = (_PKStrokeConcrete *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)*(&self->_flags.var0.allFlags + 1);
      long long v6 = [(_PKStrokeConcrete *)v4 _strokeUUID];
      if ([v5 isEqual:v6])
      {
        long long v21 = *(_OWORD *)&self->_sortID.replicaUUID[12];
        uint64_t v22 = *(void *)&self->_version.replicaUUID[4];
        if (v4)
        {
          [(_PKStrokeConcrete *)v4 _version];
          int v7 = v19[0];
        }
        else
        {
          int v7 = 0;
          v19[0] = 0;
          v19[1] = 0;
          uint64_t v20 = 0;
        }
        if (v21 == v7 && !uuid_compare((const unsigned __int8 *)&v21 + 4, (const unsigned __int8 *)v19 + 4))
        {
          BOOL v10 = HIDWORD(v22) == HIDWORD(v20);

          if (v10)
          {
            if ((*(unsigned char *)&self->_flags.var0.var0 & 0xE) != 0)
            {
              BOOL v11 = [(PKStroke *)self _isHidden];
              if (v11 != [(PKStroke *)v4 _isHidden]) {
                goto LABEL_12;
              }
              uint64_t v12 = [(_PKStrokeConcrete *)self ink];
              id v13 = [(_PKStrokeConcrete *)v4 ink];
              if (([v12 isEqualUnweightedInk:v13] & 1) == 0)
              {

                goto LABEL_12;
              }
              [(_PKStrokeConcrete *)self _transform];
              if (v4) {
                [(_PKStrokeConcrete *)v4 _transform];
              }
              else {
                memset(&v17, 0, sizeof(v17));
              }
              BOOL v14 = CGAffineTransformEqualToTransform(&t1, &v17);

              if (!v14) {
                goto LABEL_12;
              }
            }
            long long v15 = [(PKStroke *)self _strokeDataUUID];
            int v16 = [(PKStroke *)v4 _strokeDataUUID];
            char v8 = [v15 isEqual:v16];

            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  char v8 = 1;
LABEL_13:

  return v8;
}

- (void)didUpdateInDrawing:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_PKStrokeConcrete *)self _version];
  id v5 = [v4 replicaUUID];
  +[PKDrawingConcrete newStrokeIDGreaterThan:v8 forUUID:v5];
  long long v6 = v9;
  uint64_t v7 = v10;
  [(_PKStrokeConcrete *)self set_version:&v6];
}

- (void)didUpdateSubstrokesInDrawing:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_PKStrokeConcrete *)self _substrokesVersion];
  id v5 = [v4 replicaUUID];
  +[PKDrawingConcrete newStrokeIDGreaterThan:v8 forUUID:v5];
  long long v6 = v9;
  uint64_t v7 = v10;
  [(_PKStrokeConcrete *)self set_substrokesVersion:&v6];
}

- (id)_substrokesInDrawing:(id)a3
{
  return *(id *)&self->_substrokesVersion.replicaUUID[12];
}

- (id)_newStrokeWithSubstrokes:(id)a3 inDrawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_PKStrokeConcrete *)self copyForMutation];
  [v8 _setSubstrokes:v6];
  [v8 didUpdateSubstrokesInDrawing:v7];

  return v8;
}

- (void)_setSubstrokes:(id)a3
{
}

- (CGRect)renderBounds
{
  v2 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  CGFloat x = v2->_cachedBounds.origin.x;
  CGFloat y = v2->_cachedBounds.origin.y;
  CGFloat width = v2->_cachedBounds.size.width;
  CGFloat height = v2->_cachedBounds.size.height;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  if (CGRectIsNull(v16))
  {
    [(PKStroke *)v2 _calculateBounds];
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
    uint64_t v11 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
    v11->_cachedBounds.origin.CGFloat x = x;
    v11->_cachedBounds.origin.CGFloat y = y;
    v11->_cachedBounds.size.CGFloat width = width;
    v11->_cachedBounds.size.CGFloat height = height;

    os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
  }
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

- (void)_setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  v7->_cachedBounds.origin.CGFloat x = x;
  v7->_cachedBounds.origin.CGFloat y = y;
  v7->_cachedBounds.size.CGFloat width = width;
  v7->_cachedBounds.size.CGFloat height = height;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
}

- (void)_invalidateBounds
{
  CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGFloat v2 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v3 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&bounds_lock);
  v4->_cachedBounds.origin = v5;
  v4->_cachedBounds.size.CGFloat width = v2;
  v4->_cachedBounds.size.CGFloat height = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&bounds_lock);
}

- (int64_t)compareToStroke:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_PKStrokeConcrete *)self _sortID];
  if (v4) {
    [v4 _sortID];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  int64_t v5 = _PKStrokeIDCompare(&v8, &v7);

  return v5;
}

- (id)_updateStroke:(id)a3 inDrawing:(id)a4
{
  id v6 = (void (**)(id, _PKStrokeConcrete *, unsigned char *))a3;
  id v7 = a4;
  unsigned __int8 v22 = 0;
  _PKStrokeID v8 = v6[2](v6, self, &v22);
  uint64_t v9 = v8;
  if (!v22 && [v8 hasSubstrokes])
  {
    double v10 = [v9 _substrokesInDrawing:v7];
    uint64_t v11 = [v10 count];
    if (v11 < 1)
    {
      double v12 = 0;
    }
    else
    {
      double v12 = 0;
      char v13 = 0;
      for (uint64_t i = 0; i != v11; ++i)
      {
        double v15 = [v10 objectAtIndexedSubscript:i];
        id v16 = v15;
        if (v22)
        {
          id v17 = v15;
          int v18 = 1;
        }
        else
        {
          id v17 = [v15 _updateStroke:v6 inDrawing:v7];
          int v18 = v22;
        }
        v13 |= v17 != v16;
        if (v18 && (v13 & 1) == 0)
        {

          goto LABEL_18;
        }
        if (v12 == 0 && (v13 & 1) != 0)
        {
          int v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
          double v12 = v19;
          if (i) {
            objc_msgSend(v19, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v10, 0, i);
          }
        }
        [v12 addObject:v17];
      }
      if (v13)
      {
        uint64_t v20 = (void *)[v9 copyForMutation];

        objc_msgSend(v20, "set_substrokes:", v12);
        uint64_t v9 = v20;
      }
    }
LABEL_18:
  }

  return v9;
}

- (id)mergeArrayOfStrokes:(id)a3 with:(id)a4 inDrawing:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  if (v10 == [v7 count])
  {
    uint64_t v11 = [v7 count];
    if (v11 >= 1)
    {
      double v12 = 0;
      uint64_t v13 = 0;
      while (1)
      {
        double v14 = [v7 objectAtIndexedSubscript:v13];
        double v15 = [v8 objectAtIndexedSubscript:v13];
        id v16 = [v14 _mergeWithStroke:v15 inDrawing:v9];

        id v17 = [v7 objectAtIndexedSubscript:v13];

        if (!v12 && v16 != v17)
        {
          int v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
          if (!v13)
          {
            double v12 = v18;
            if (!v18) {
              goto LABEL_10;
            }
LABEL_9:
            [v12 addObject:v16];
            goto LABEL_10;
          }
          double v12 = v18;
          objc_msgSend(v18, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v7, 0, v13);
        }
        if (v12) {
          goto LABEL_9;
        }
LABEL_10:

        if (v11 == ++v13) {
          goto LABEL_19;
        }
      }
    }
    double v12 = 0;
LABEL_19:
    if (v12) {
      unsigned __int8 v22 = v12;
    }
    else {
      unsigned __int8 v22 = v7;
    }
    id v21 = v22;
  }
  else
  {
    unint64_t v19 = [v8 count];
    if (v19 >= [v7 count]) {
      id v20 = v7;
    }
    else {
      id v20 = v8;
    }
    id v21 = v20;
  }

  return v21;
}

- (id)_mergeWithStroke:(id)a3 inDrawing:(id)a4
{
  id v6 = a4;
  id v7 = [(_PKStrokeConcrete *)self _mergeUnparentedWithStroke:a3 inDrawing:v6];
  id v8 = [v7 _updateWithParent:0 inDrawing:v6];

  return v8;
}

- (id)_updateWithParent:(id)a3 inDrawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = v8;
  id v29 = v6;
  if (v6)
  {
    if (([(_PKStrokeConcrete *)v8 _flags] & 8) != 0)
    {
      if (v9) {
        [v9 _transform];
      }
      else {
        memset(&t1, 0, sizeof(t1));
      }
      [v6 _transform];
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        if (([v9 _isNewCopy] & 1) == 0)
        {
          uint64_t v10 = (void *)[v9 copyForMutation];

          id v9 = v10;
          [v10 _setIsNewCopy:1];
        }
        [v6 _transform];
        v30[0] = v30[3];
        v30[1] = v30[4];
        v30[2] = v30[5];
        [v9 _setTransform:v30];
      }
    }
    if (([v9 _flags] & 4) != 0)
    {
      uint64_t v11 = [v6 ink];
      double v12 = [v9 ink];
      char v13 = [v11 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        if (([v9 _isNewCopy] & 1) == 0)
        {
          double v14 = (void *)[v9 copyForMutation];

          id v9 = v14;
          [v14 _setIsNewCopy:1];
        }
        double v15 = [v6 ink];
        [v9 _setInk:v15];
      }
    }
  }
  id v16 = [v9 _substrokesInDrawing:v7];
  uint64_t v17 = [v16 count];
  if (v17 < 1)
  {
    id v20 = 0;
    goto LABEL_30;
  }
  uint64_t v18 = 0;
  LOBYTE(v19) = 0;
  id v20 = 0;
  do
  {
    id v21 = [v16 objectAtIndexedSubscript:v18];
    unsigned __int8 v22 = [v21 _updateWithParent:v9 inDrawing:v7];

    if (v19)
    {
      BOOL v19 = 1;
      if (v20) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v23 = [v16 objectAtIndexedSubscript:v18];
      BOOL v19 = v22 != v23;

      if (v20) {
        goto LABEL_24;
      }
    }
    if (v19)
    {
      long long v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
      id v20 = v24;
      if (v18) {
        objc_msgSend(v24, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v16, 0, v18);
      }
    }
LABEL_24:
    [v20 addObject:v22];

    ++v18;
  }
  while (v17 != v18);
  if (!v19)
  {
LABEL_30:
    uint64_t v25 = v29;
    goto LABEL_31;
  }
  uint64_t v25 = v29;
  if (([v9 _isNewCopy] & 1) == 0)
  {
    uint64_t v26 = [v9 copyForMutation];

    id v9 = (void *)v26;
  }
  objc_msgSend(v9, "set_substrokes:", v20);
LABEL_31:
  [v9 _setIsNewCopy:0];
  id v27 = v9;

  return v27;
}

- (id)_mergeUnparentedWithStroke:(id)a3 inDrawing:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = (_PKStrokeConcrete *)a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [(_PKStrokeConcrete *)v8 _strokeUUID];
  uint64_t v10 = [(_PKStrokeConcrete *)v6 _strokeUUID];
  uint64_t v11 = objc_msgSend(v9, "PK_compare:", v10);

  id v12 = v8;
  if (v11 == -1)
  {
    id v12 = [(_PKStrokeConcrete *)v8 copyForMutation];

    char v13 = [(_PKStrokeConcrete *)v6 _strokeUUID];
    [v12 _setStrokeUUID:v13];
  }
  [(_PKStrokeConcrete *)v8 _version];
  if (v6) {
    [(_PKStrokeConcrete *)v6 _version];
  }
  else {
    memset(&v44, 0, sizeof(v44));
  }
  uint64_t v14 = _PKStrokeIDCompare(&v45, &v44);
  [(_PKStrokeConcrete *)v8 _substrokesVersion];
  if (v6) {
    [(_PKStrokeConcrete *)v6 _substrokesVersion];
  }
  else {
    memset(&v42, 0, sizeof(v42));
  }
  uint64_t v15 = _PKStrokeIDCompare(&v43, &v42);
  if (!v15)
  {
    uint64_t v18 = [(_PKStrokeConcrete *)v8 _substrokes];
    BOOL v19 = [(_PKStrokeConcrete *)v6 _substrokes];
    id v20 = [(_PKStrokeConcrete *)v8 mergeArrayOfStrokes:v18 with:v19 inDrawing:v7];

    id v21 = [(_PKStrokeConcrete *)v8 _substrokes];
    BOOL v22 = v20 == v21;

    if (v14 == -1) {
      uint64_t v23 = v6;
    }
    else {
      uint64_t v23 = v8;
    }
    if (v22)
    {
      long long v24 = v23;
    }
    else
    {
      long long v24 = [(_PKStrokeConcrete *)v23 copyForMutation];

      [(_PKStrokeConcrete *)v24 set_substrokes:v20];
      [(PKStroke *)v24 _setIsNewCopy:1];
    }
    id v12 = v24;
    goto LABEL_29;
  }
  if (v14 != 1)
  {
    if (v14 == -1)
    {
      if (v15 != -1)
      {
        id v16 = [(_PKStrokeConcrete *)v6 copyForMutation];

        uint64_t v17 = [(_PKStrokeConcrete *)v8 _substrokes];
        objc_msgSend(v16, "set_substrokes:", v17);

        [(_PKStrokeConcrete *)v8 _substrokesVersion];
        long long v38 = v40;
        uint64_t v39 = v41;
        objc_msgSend(v16, "set_substrokesVersion:", &v38);
        id v12 = v16;
        [v16 _setIsNewCopy:1];
        goto LABEL_30;
      }
      goto LABEL_25;
    }
    if (v15 == -1)
    {
LABEL_25:
      id v27 = v6;
      goto LABEL_26;
    }
    if (v15 != 1) {
      goto LABEL_30;
    }
LABEL_24:
    id v27 = v8;
LABEL_26:
    id v20 = v12;
    id v12 = v27;
LABEL_29:

    goto LABEL_30;
  }
  if (v15 == 1) {
    goto LABEL_24;
  }
  uint64_t v25 = [(_PKStrokeConcrete *)v8 copyForMutation];

  id v12 = (id)v25;
  uint64_t v26 = [(_PKStrokeConcrete *)v6 _substrokes];
  objc_msgSend(v12, "set_substrokes:", v26);

  if (v6)
  {
    [(_PKStrokeConcrete *)v6 _substrokesVersion];
  }
  else
  {
    long long v36 = 0uLL;
    uint64_t v37 = 0;
  }
  long long v34 = v36;
  uint64_t v35 = v37;
  objc_msgSend(v12, "set_substrokesVersion:", &v34);
  [v12 _setIsNewCopy:1];
LABEL_30:
  long long v28 = [v12 _strokeData];
  unint64_t v29 = [v28 _immutablePointsCount];
  long long v30 = [(PKStroke *)v6 _strokeData];
  LODWORD(v29) = v29 < [v30 _immutablePointsCount];

  if (v29)
  {
    if (([v12 _isNewCopy] & 1) == 0)
    {
      objc_super v31 = (void *)[v12 copyForMutation];

      id v12 = v31;
      [v31 _setIsNewCopy:1];
    }
    CGRect v32 = [(PKStroke *)v6 _strokeData];
    objc_msgSend(v12, "set_strokeData:", v32);
  }

  return v12;
}

- (void)_addTestDataToUnknownFields
{
}

- (id)_dataInUnknownFields
{
  ptr = self->_unknownFields.__ptr_;
  if (ptr && (CGFloat v3 = *(void **)ptr) != 0 && *v3 != v3[1])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v4;
}

- (_PKStrokeID)_sortID
{
  *retstr = *(_PKStrokeID *)((char *)self + 272);
  return self;
}

- (void)set_sortID:(_PKStrokeID *)a3
{
  uint64_t v3 = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_anchorPointForTexture.CGFloat y = *(_OWORD *)&a3->clock;
  *(void *)&self->_sortID.replicaUUID[4] = v3;
}

- (_PKStrokeID)_version
{
  *retstr = *(_PKStrokeID *)((char *)self + 296);
  return self;
}

- (void)set_version:(_PKStrokeID *)a3
{
  uint64_t v3 = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_sortID.replicaUUID[12] = *(_OWORD *)&a3->clock;
  *(void *)&self->_version.replicaUUID[4] = v3;
}

- (NSArray)_substrokes
{
  return *(NSArray **)&self->_substrokesVersion.replicaUUID[12];
}

- (void)set_substrokes:(id)a3
{
}

- (_PKStrokeID)_substrokesVersion
{
  *retstr = *(_PKStrokeID *)((char *)self + 88);
  return self;
}

- (void)set_substrokesVersion:(_PKStrokeID *)a3
{
  uint64_t v3 = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeData = *(_OWORD *)&a3->clock;
  *(void *)&self->_substrokesVersion.replicaUUID[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_strokeMask, 0);
  objc_storeStrong((id *)&self->_clipPlane, 0);
  objc_storeStrong((id *)&self->_substrokes, 0);
  objc_storeStrong((id *)&self->_substrokesVersion.replicaUUID[12], 0);
  objc_storeStrong((id *)&self->_strokeUUID, 0);
  objc_storeStrong((id *)&self->_flags.var0.allFlags + 1, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 transientArchiveDictionary:(id)a6
{
  return [(_PKStrokeConcrete *)self initWithArchive:a3 sortedUUIDs:a4 inks:a5 parent:0 isHidden:0 transientArchiveDictionary:a6];
}

- (_PKStrokeConcrete)initWithArchive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 parent:(id)a6 isHidden:(BOOL)a7 transientArchiveDictionary:(id)a8
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v74 = a6;
  id v16 = a8;
  uint64_t v17 = *((void *)a3 + 22);
  if (!v17 || (unint64_t v18 = *(void *)(v17 + 16), v18 > [v14 count]))
  {
    BOOL v19 = 0;
    goto LABEL_76;
  }
  id v20 = [(_PKStrokeConcrete *)self init];
  if (!v20) {
    goto LABEL_70;
  }
  if (*((void *)a3 + 15))
  {
    id v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:**((void **)a3 + 15)];
  }
  else
  {
    id v21 = [MEMORY[0x1E4F29128] UUID];
  }
  [(_PKStrokeConcrete *)v20 _setStrokeUUID:v21];

  uint64_t v22 = *((void *)a3 + 13);
  if (v22)
  {
    [(_PKStrokeConcrete *)v20 readStrokeIDFromArchive:v22 withSortedUUIDs:v14];
    long long v92 = v94;
    uint64_t v93 = v95;
    [(_PKStrokeConcrete *)v20 set_sortID:&v92];
  }
  uint64_t v23 = *((void *)a3 + 22);
  if (v23)
  {
    [(_PKStrokeConcrete *)v20 readStrokeIDFromArchive:v23 withSortedUUIDs:v14];
    long long v88 = v90;
    uint64_t v89 = v91;
    [(_PKStrokeConcrete *)v20 set_version:&v88];
  }
  if ((*((unsigned char *)a3 + 184) & 2) != 0) {
    [(_PKStrokeConcrete *)v20 _setShapeType:*((void *)a3 + 12)];
  }
  long long v24 = (void *)*((void *)a3 + 5);
  if (v24)
  {
    uint64_t v25 = +[_PKStrokeConcrete decodeRenameableUUIDFromData:*v24 transientArchiveDictionary:v16];
    [(_PKStrokeConcrete *)v20 _setGroupID:v25];
  }
  uint64_t v26 = (void *)*((void *)a3 + 11);
  if (v26)
  {
    id v27 = +[_PKStrokeConcrete decodeRenameableUUIDFromData:*v26 transientArchiveDictionary:v16];
    [(_PKStrokeConcrete *)v20 _setRenderGroupID:v27];
  }
  if (*((unsigned char *)a3 + 184))
  {
    unint64_t v29 = *((void *)a3 + 6);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || v29 >= [v15 count])
    {
      long long v30 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v84 = v29;
        _os_log_fault_impl(&dword_1C44F8000, v30, OS_LOG_TYPE_FAULT, "Archive had invalid ink index: %lu", buf, 0xCu);
      }

      char v28 = 1;
    }
    else
    {
      char v28 = 0;
    }
  }
  else
  {
    char v28 = 0;
    unint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v29 < [v15 count])
  {
    objc_super v31 = [v15 objectAtIndexedSubscript:v29];
    [(PKStroke *)v20 _setInk:v31];
    goto LABEL_30;
  }
  if (v74)
  {
    objc_super v31 = [v74 ink];
    [(PKStroke *)v20 _setInk:v31];
LABEL_30:

    CGRect v32 = (const drawing::Rectangle *)*((void *)a3 + 4);
    if (v32)
    {
      drawing::Rectangle::Rectangle((drawing::Rectangle *)buf, v32);
      -[_PKStrokeConcrete _setBounds:](v20, "_setBounds:", v85, v86, v87, *((float *)&v84 + 1));
      PB::Base::~Base((PB::Base *)buf);
    }
    long long v33 = (int8x16_t *)MEMORY[0x1E4F1DAB8];
    long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v78[0] = *MEMORY[0x1E4F1DAB8];
    v78[1] = v34;
    v78[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_PKStrokeConcrete *)v20 _setTransform:v78];
    uint64_t v35 = (float32x2_t *)*((void *)a3 + 21);
    if (v35)
    {
      float32x2_t v36 = v35[1];
      int8x16_t v37 = (int8x16_t)vcvtq_f64_f32(v36);
      int8x16_t v38 = (int8x16_t)vcvtq_f64_f32(v35[2]);
      int8x16_t v39 = (int8x16_t)vcvtq_f64_f32(v35[3]);
      *(int32x2_t *)v40.f32 = vrev64_s32((int32x2_t)v36);
      *(float32x2_t *)&v40.u32[2] = v35[2];
      int8x16_t v41 = v33[2];
      if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v40), (int8x16_t)vcgezq_f32(v40))))))unint64_t v42 = -1; {
      else
      }
        unint64_t v42 = 0;
      int8x16_t v43 = (int8x16_t)vdupq_n_s64(v42);
      int8x16_t v44 = vbslq_s8(v43, v33[1], v38);
      v77[0] = vbslq_s8(v43, *v33, v37);
      v77[1] = v44;
      v77[2] = vbslq_s8(v43, v41, v39);
      [(_PKStrokeConcrete *)v20 _setTransform:v77];
    }
    else if (v74)
    {
      [v74 _transform];
      v76[0] = v76[3];
      v76[1] = v76[4];
      v76[2] = v76[5];
      [(_PKStrokeConcrete *)v20 _setTransform:v76];
    }
    _PKStrokeID v45 = (float32x2_t *)*((void *)a3 + 7);
    if (v45)
    {
      float32x2_t v46 = v45[1];
      int8x16_t v47 = (int8x16_t)vcvtq_f64_f32(v46);
      int8x16_t v48 = (int8x16_t)vcvtq_f64_f32(v45[2]);
      int8x16_t v49 = (int8x16_t)vcvtq_f64_f32(v45[3]);
      *(int32x2_t *)v50.f32 = vrev64_s32((int32x2_t)v46);
      *(float32x2_t *)&v50.u32[2] = v45[2];
      int8x16_t v51 = v33[2];
      if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v50), (int8x16_t)vcgezq_f32(v50))))))unint64_t v52 = -1; {
      else
      }
        unint64_t v52 = 0;
      int8x16_t v53 = (int8x16_t)vdupq_n_s64(v52);
      int8x16_t v54 = vbslq_s8(v53, v33[1], v48);
      v75[0] = vbslq_s8(v53, *v33, v47);
      v75[1] = v54;
      v75[2] = vbslq_s8(v53, v51, v49);
      [(_PKStrokeConcrete *)v20 _setInkTransform:v75];
    }
    [(_PKStrokeConcrete *)v20 _setFlags:*((void *)a3 + 16)];
    if (*((void *)a3 + 14))
    {
      v55 = +[PKStrokePath strokeDataFromDataArchive:](PKStrokePath, "strokeDataFromDataArchive:");
      [(PKStroke *)v20 set_strokeData:v55];
    }
    else
    {
      if (!v74)
      {
LABEL_49:
        uint64_t v57 = *((void *)a3 + 17);
        uint64_t v56 = *((void *)a3 + 18);
        uint64_t v58 = v56 - v57;
        if (v56 != v57)
        {
          uint64_t v59 = *((void *)a3 + 20);
          if (v59)
          {
            [(_PKStrokeConcrete *)v20 readStrokeIDFromArchive:v59 withSortedUUIDs:v14];
            long long v79 = v81;
            uint64_t v80 = v82;
            [(_PKStrokeConcrete *)v20 set_substrokesVersion:&v79];
          }
          v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v58 >> 3];
          [(_PKStrokeConcrete *)v20 set_substrokes:v60];

          uint64_t v61 = 0;
          if ((unint64_t)(v58 >> 3) <= 1) {
            uint64_t v62 = 1;
          }
          else {
            uint64_t v62 = v58 >> 3;
          }
          do
          {
            if (*(void *)(*(void *)(*((void *)a3 + 17) + 8 * v61) + 72) == *(void *)(*(void *)(*((void *)a3 + 17) + 8 * v61)
                                                                                              + 64))
            {
              v63 = [_PKStrokeConcrete alloc];
              uint64_t v64 = *(void *)(*((void *)a3 + 17) + 8 * v61);
              if (!a7)
              {
LABEL_60:
                uint64_t v65 = [(_PKStrokeConcrete *)v20 _flags] & 1;
                goto LABEL_61;
              }
              uint64_t v65 = 1;
            }
            else
            {
              v63 = [_PKStrokeConcrete alloc];
              uint64_t v64 = *(void *)(*((void *)a3 + 17) + 8 * v61);
              if (!a7) {
                goto LABEL_60;
              }
              uint64_t v65 = 1;
            }
LABEL_61:
            v66 = [(_PKStrokeConcrete *)v63 initWithArchive:v64 sortedUUIDs:v14 inks:v15 parent:v20 isHidden:v65 transientArchiveDictionary:v16];
            if (!v66) {
              goto LABEL_75;
            }
            v67 = [(_PKStrokeConcrete *)v20 _substrokes];
            [v67 addObject:v66];

            ++v61;
          }
          while (v62 != v61);
        }
        if (*((void *)a3 + 9) != *((void *)a3 + 8))
        {
          v68 = [[PKStrokeMask alloc] initWithArchive:a3];
          [(_PKStrokeConcrete *)v20 _setStrokeMask:v68];
        }
        v69 = (PKProtobufUnknownFields *)*((void *)a3 + 24);
        if (v69)
        {
          uint64_t v70 = *((void *)a3 + 25);
          if (v70) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v70 + 8), 1uLL, memory_order_relaxed);
          }
          cntrl = (std::__shared_weak_count *)v20->_unknownFields.__cntrl_;
          v20->_unknownFields.__ptr_ = v69;
          v20->_unknownFields.__cntrl_ = (__shared_weak_count *)v70;
          if (cntrl) {
            std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
          }
        }
LABEL_70:
        self = v20;
        BOOL v19 = self;
        goto LABEL_76;
      }
      v55 = [v74 _strokeData];
      [(PKStroke *)v20 set_strokeData:v55];
    }

    goto LABEL_49;
  }
  if ((v28 & 1) == 0)
  {
    v72 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C44F8000, v72, OS_LOG_TYPE_FAULT, "Unable to find ink from saved inkIndex or parent", buf, 2u);
    }
  }
LABEL_75:
  BOOL v19 = 0;
  self = v20;
LABEL_76:

  return v19;
}

+ (id)decodeRenameableUUIDFromData:(const char *)a3 transientArchiveDictionary:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F29128] UUID];
      [v5 setObject:v7 forKeyedSubscript:v6];
    }
    id v8 = v7;

    id v6 = v8;
  }

  return v6;
}

+ (void)encodeUUID:(id)a3 toData:(void *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)id v5 = 0;
  uint64_t v6 = 0;
  [a3 getUUIDBytes:v5];
  PB::Data::assign(*(PB::Data **)a4, v5, (const unsigned __int8 *)&v7);
}

- (void)saveUUIDsTo:(id)a3
{
  *(void *)&v20[20] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  [(_PKStrokeConcrete *)self _sortID];
  uint64_t v6 = (void *)[v5 initWithUUIDBytes:v20];
  [v4 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  [(_PKStrokeConcrete *)self _version];
  id v8 = (void *)[v7 initWithUUIDBytes:v20];
  [v4 addObject:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  [(_PKStrokeConcrete *)self _substrokesVersion];
  uint64_t v10 = (void *)[v9 initWithUUIDBytes:v20];
  [v4 addObject:v10];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(_PKStrokeConcrete *)self _substrokes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) saveUUIDsTo:v4];
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)saveInksTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PKStrokeConcrete *)self ink];

  if (v5)
  {
    uint64_t v6 = [(_PKStrokeConcrete *)self ink];
    [v4 addObject:v6];
  }
  else
  {
    id v7 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_FAULT, "Attempting to save a stroke with a nil ink.", buf, 2u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = [(_PKStrokeConcrete *)self _substrokes];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) saveInksTo:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7
{
  return [(_PKStrokeConcrete *)self saveToArchive:a3 sortedUUIDs:a4 inks:a5 withPathData:a6 parent:0 transient:a7];
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 parent:(id)a7 transient:(BOOL)a8
{
  BOOL v80 = a6;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v81 = a4;
  id v13 = a5;
  long long v14 = [(_PKStrokeConcrete *)self _groupID];

  if (v14)
  {
    if (!*((void *)a3 + 5)) {
      operator new();
    }
    long long v15 = [(_PKStrokeConcrete *)self _groupID];
    +[_PKStrokeConcrete encodeUUID:v15 toData:(char *)a3 + 40];
  }
  long long v16 = [(_PKStrokeConcrete *)self _renderGroupID];

  if (v16)
  {
    if (!*((void *)a3 + 11)) {
      operator new();
    }
    long long v17 = [(_PKStrokeConcrete *)self _renderGroupID];
    +[_PKStrokeConcrete encodeUUID:v17 toData:(char *)a3 + 88];
  }
  if ([(_PKStrokeConcrete *)self _shapeType])
  {
    int64_t v18 = [(_PKStrokeConcrete *)self _shapeType];
    *((unsigned char *)a3 + 184) |= 2u;
    *((void *)a3 + 12) = v18;
  }
  if (!a8)
  {
    if (!*((void *)a3 + 15)) {
      operator new();
    }
    BOOL v19 = [(_PKStrokeConcrete *)self _strokeUUID];
    +[_PKStrokeConcrete encodeUUID:v19 toData:(char *)a3 + 120];
  }
  drawing::Stroke::makeSortID((uint64_t)a3);
  uint64_t v20 = *((void *)a3 + 13);
  [(_PKStrokeConcrete *)self _sortID];
  [(_PKStrokeConcrete *)self saveStrokeID:&buf toArchive:v20 withSortedUUIDs:v81];
  drawing::Stroke::makeVersion((uint64_t)a3);
  uint64_t v21 = *((void *)a3 + 22);
  [(_PKStrokeConcrete *)self _version];
  [(_PKStrokeConcrete *)self saveStrokeID:&buf toArchive:v21 withSortedUUIDs:v81];
  uint64_t v22 = [(_PKStrokeConcrete *)self ink];
  if (v22)
  {
    BOOL v23 = ([(_PKStrokeConcrete *)self _flags] & 4) == 0 || a7 == 0;
    BOOL v24 = v23;

    if (v24)
    {
      uint64_t v25 = [(_PKStrokeConcrete *)self ink];
      uint64_t v26 = [v13 indexOfObject:v25];

      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v27 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf.a) = 0;
          _os_log_fault_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_FAULT, "Ink was not in the set of inks we had when saving.", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        *((unsigned char *)a3 + 184) |= 1u;
        *((void *)a3 + 6) = v26;
      }
    }
  }
  if (![(_PKStrokeConcrete *)self _isFullyHidden])
  {
    if (v80)
    {
      drawing::Stroke::makeStrokeData((uint64_t)a3);
      char v28 = [(PKStroke *)self _strokeData];
      [v28 saveToDataArchive:*((void *)a3 + 14)];
    }
    [(PKStroke *)self _bounds];
    double x = v91.origin.x;
    double y = v91.origin.y;
    double width = v91.size.width;
    double height = v91.size.height;
    if (!CGRectIsNull(v91))
    {
      drawing::Stroke::makeBounds((uint64_t)a3);
      uint64_t v33 = *((void *)a3 + 4);
      float v34 = x;
      char v35 = *(unsigned char *)(v33 + 24);
      float v36 = y;
      float v37 = width;
      *(float *)(v33 + 16) = v36;
      *(float *)(v33 + 20) = v37;
      float v38 = height;
      *(unsigned char *)(v33 + 24) = v35 | 0xF;
      *(float *)(v33 + 8) = v38;
      *(float *)(v33 + 12) = v34;
    }
    memset(&buf, 0, sizeof(buf));
    [(_PKStrokeConcrete *)self _transform];
    char v39 = [(_PKStrokeConcrete *)self _flags];
    float32x4_t v40 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    if (!a7 || (v39 & 8) == 0)
    {
      CGAffineTransform t1 = buf;
      long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&t2.float a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&t2.float c = v41;
      *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        drawing::Stroke::makeTransform((uint64_t)a3);
        uint64_t v42 = *((void *)a3 + 21);
        float a = buf.a;
        *(unsigned char *)(v42 + 32) |= 1u;
        *(float *)(v42 + 8) = a;
        uint64_t v44 = *((void *)a3 + 21);
        float b = buf.b;
        *(unsigned char *)(v44 + 32) |= 2u;
        *(float *)(v44 + 12) = b;
        uint64_t v46 = *((void *)a3 + 21);
        float c = buf.c;
        *(unsigned char *)(v46 + 32) |= 4u;
        *(float *)(v46 + 16) = c;
        uint64_t v48 = *((void *)a3 + 21);
        float d = buf.d;
        *(unsigned char *)(v48 + 32) |= 8u;
        *(float *)(v48 + 20) = d;
        uint64_t v50 = *((void *)a3 + 21);
        tdouble x = buf.tx;
        *(unsigned char *)(v50 + 32) |= 0x10u;
        *(float *)(v50 + 24) = tx;
        uint64_t v52 = *((void *)a3 + 21);
        tdouble y = buf.ty;
        *(unsigned char *)(v52 + 32) |= 0x20u;
        *(float *)(v52 + 28) = ty;
      }
    }
    memset(&v85, 0, sizeof(v85));
    [(_PKStrokeConcrete *)self _inkTransform];
    CGAffineTransform v84 = v85;
    long long v54 = v40[1];
    *(_OWORD *)&v83.float a = *v40;
    *(_OWORD *)&v83.float c = v54;
    *(_OWORD *)&v83.tdouble x = v40[2];
    if (!CGAffineTransformEqualToTransform(&v84, &v83))
    {
      drawing::Stroke::makeInkTransform((uint64_t)a3);
      uint64_t v55 = *((void *)a3 + 7);
      float v56 = v85.a;
      *(unsigned char *)(v55 + 32) |= 1u;
      *(float *)(v55 + 8) = v56;
      uint64_t v57 = *((void *)a3 + 7);
      float v58 = v85.b;
      *(unsigned char *)(v57 + 32) |= 2u;
      *(float *)(v57 + 12) = v58;
      uint64_t v59 = *((void *)a3 + 7);
      float v60 = v85.c;
      *(unsigned char *)(v59 + 32) |= 4u;
      *(float *)(v59 + 16) = v60;
      uint64_t v61 = *((void *)a3 + 7);
      float v62 = v85.d;
      *(unsigned char *)(v61 + 32) |= 8u;
      *(float *)(v61 + 20) = v62;
      uint64_t v63 = *((void *)a3 + 7);
      float v64 = v85.tx;
      *(unsigned char *)(v63 + 32) |= 0x10u;
      *(float *)(v63 + 24) = v64;
      uint64_t v65 = *((void *)a3 + 7);
      float v66 = v85.ty;
      *(unsigned char *)(v65 + 32) |= 0x20u;
      *(float *)(v65 + 28) = v66;
    }
  }
  uint64_t v67 = [(_PKStrokeConcrete *)self _flags];
  *((unsigned char *)a3 + 184) |= 4u;
  *((void *)a3 + 16) = v67;
  v68 = [(_PKStrokeConcrete *)self _substrokes];
  BOOL v69 = [v68 count] == 0;

  if (!v69)
  {
    drawing::Stroke::makeSubstrokesVersion((uint64_t)a3);
    uint64_t v70 = *((void *)a3 + 20);
    [(_PKStrokeConcrete *)self _substrokesVersion];
    [(_PKStrokeConcrete *)self saveStrokeID:&buf toArchive:v70 withSortedUUIDs:v81];
    v71 = [(_PKStrokeConcrete *)self _substrokes];
    std::vector<std::unique_ptr<drawing::Stroke>>::reserve((uint64_t *)a3 + 17, [v71 count]);

    memset(v82, 0, sizeof(v82));
    v72 = [(_PKStrokeConcrete *)self _substrokes];
    if ([v72 countByEnumeratingWithState:v82 objects:v88 count:16]) {
      PB::PtrVector<drawing::Stroke>::emplace_back<>();
    }
  }
  v73 = [(_PKStrokeConcrete *)self _strokeMask];
  BOOL v74 = v73 == 0;

  if (!v74)
  {
    v75 = [(_PKStrokeConcrete *)self _strokeMask];
    [v75 saveToArchive:a3];
  }
  ptr = self->_unknownFields.__ptr_;
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v78 = (std::__shared_weak_count *)*((void *)a3 + 25);
  *((void *)a3 + 24) = ptr;
  *((void *)a3 + 25) = cntrl;
  if (v78) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v78);
  }

  return 2;
}

- (_PKStrokeConcrete)initWithV1Archive:(const void *)a3 sortedUUIDs:(id)a4 inks:(id)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *((void *)a3 + 10);
  if (v10 && (unint64_t v11 = *(void *)(v10 + 16), v11 <= [v8 count]))
  {
    id v13 = [(_PKStrokeConcrete *)self init];
    long long v14 = v13;
    if (v13)
    {
      uint64_t v15 = *((void *)a3 + 6);
      if (v15)
      {
        [(_PKStrokeConcrete *)v13 readV1StrokeIDFromArchive:v15 withSortedUUIDs:v8];
        long long v55 = v57;
        uint64_t v56 = v58;
        [(_PKStrokeConcrete *)v14 set_sortID:&v55];
      }
      if (*((void *)a3 + 7))
      {
        long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:**((void **)a3 + 7)];
      }
      else
      {
        long long v16 = [MEMORY[0x1E4F29128] UUID];
      }
      [(_PKStrokeConcrete *)v14 _setStrokeUUID:v16];

      uint64_t v17 = *((void *)a3 + 10);
      if (v17)
      {
        [(_PKStrokeConcrete *)v14 readV1StrokeIDFromArchive:v17 withSortedUUIDs:v8];
        long long v51 = v53;
        uint64_t v52 = v54;
        [(_PKStrokeConcrete *)v14 set_version:&v51];
      }
      int64_t v18 = [v9 objectAtIndexedSubscript:*((void *)a3 + 2)];
      [(PKStroke *)v14 _setInk:v18];

      -[_PKStrokeConcrete _setBounds:](v14, "_setBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      if (*((double *)a3 + 8) == 0.0) {
        double v19 = 0.0;
      }
      else {
        double v19 = *((double *)a3 + 8);
      }
      [(PKStroke *)v14 _setHidden:*((unsigned __int8 *)a3 + 89)];
      uint64_t v20 = (int8x16_t *)MEMORY[0x1E4F1DAB8];
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v50[0] = *MEMORY[0x1E4F1DAB8];
      v50[1] = v21;
      v50[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(_PKStrokeConcrete *)v14 _setTransform:v50];
      uint64_t v22 = (float32x2_t *)*((void *)a3 + 9);
      if (v22)
      {
        float32x2_t v23 = v22[1];
        int8x16_t v24 = (int8x16_t)vcvtq_f64_f32(v23);
        int8x16_t v25 = (int8x16_t)vcvtq_f64_f32(v22[2]);
        int8x16_t v26 = (int8x16_t)vcvtq_f64_f32(v22[3]);
        *(int32x2_t *)v27.f32 = vrev64_s32((int32x2_t)v23);
        *(float32x2_t *)&v27.u32[2] = v22[2];
        int8x16_t v28 = v20[2];
        if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v27), (int8x16_t)vcgezq_f32(v27))))))unint64_t v29 = -1; {
        else
        }
          unint64_t v29 = 0;
        int8x16_t v30 = (int8x16_t)vdupq_n_s64(v29);
        int8x16_t v31 = vbslq_s8(v30, v20[1], v25);
        v49[0] = vbslq_s8(v30, *v20, v24);
        v49[1] = v31;
        v49[2] = vbslq_s8(v30, v28, v26);
        [(_PKStrokeConcrete *)v14 _setTransform:v49];
      }
      CGRect v32 = (uint64_t *)*((void *)a3 + 3);
      if (v32)
      {
        BOOL v34 = (*((unsigned char *)a3 + 92) & 8) == 0 || *((unsigned char *)a3 + 88) == 0;
        unint64_t v35 = *((void *)a3 + 4);
        uint64_t v36 = *v32;
        std::vector<PKCompressedStrokePoint>::vector(__p, v35);
        if (v35)
        {
          uint64_t v38 = 0;
          unint64_t v39 = v35;
          do
          {
            PKConvertToCompressedStrokePoint(v36, (uint64_t)v47, v37);
            float32x4_t v40 = (char *)__p[0] + v38;
            unint64_t v37 = *(void *)&v47[0];
            long long v41 = v47[1];
            *float32x4_t v40 = v47[0];
            v40[1] = v41;
            v38 += 32;
            v36 += 24;
            --v39;
          }
          while (v39);
        }
        if (*((void *)a3 + 5))
        {
          uint64_t v42 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:**((void **)a3 + 5)];
        }
        else
        {
          uint64_t v42 = [MEMORY[0x1E4F29128] UUID];
        }
        int8x16_t v43 = (void *)v42;
        uint64_t v44 = [PKStrokePath alloc];
        _PKStrokeID v45 = [(PKStrokePath *)v44 initWithPoints:__p[0] count:v35 immutableCount:v35 inputType:v34 timestamp:v43 UUID:v19];
        [(PKStroke *)v14 set_strokeData:v45];

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
    }
    self = v14;
    long long v12 = self;
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (_PKStrokeConcrete)initWithLegacyArchive:(const void *)a3 sortedUUIDs:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = *((void *)a3 + 11);
  if (v8 && (unint64_t v9 = *(unsigned int *)(v8 + 12), [v6 count] >= v9))
  {
    unint64_t v11 = [(_PKStrokeConcrete *)self init];
    if (v11)
    {
      long long v12 = [v7 objectAtIndexedSubscript:*(unsigned int *)(*((void *)a3 + 11) + 12)];
      [v12 getUUIDBytes:(char *)&v75 + 4];

      uint64_t v13 = *((void *)a3 + 11);
      int v14 = *(_DWORD *)(v13 + 8);
      LODWORD(v13) = *(_DWORD *)(v13 + 16);
      LODWORD(v75) = v14;
      HIDWORD(v76) = v13;
      uint64_t v74 = v76;
      long long v73 = v75;
      [(_PKStrokeConcrete *)v11 set_version:&v73];
      uint64_t v15 = *((void *)a3 + 6);
      if (v15)
      {
        long long v16 = [v7 objectAtIndexedSubscript:*(unsigned int *)(v15 + 12)];
        [v16 getUUIDBytes:&components.var0.var1];

        uint64_t v17 = *((void *)a3 + 6);
        float v18 = *(float *)(v17 + 8);
        LODWORD(v17) = *(_DWORD *)(v17 + 16);
        components.var0.var0 = v18;
        *(_DWORD *)&components.var5 = v17;
        uint64_t v72 = *(void *)&components.var3;
        long long v71 = *(_OWORD *)&components.var0.var0;
        [(_PKStrokeConcrete *)v11 set_sortID:&v71];
      }
      double v19 = [MEMORY[0x1E4F29128] UUID];
      [(_PKStrokeConcrete *)v11 _setStrokeUUID:v19];

      uint64_t v20 = (float *)*((void *)a3 + 5);
      if (v20)
      {
        double v21 = v20[5];
        double v22 = v20[4];
        double v23 = v20[3];
        double v24 = v20[2];
      }
      else
      {
        double v24 = 1.0;
        double v21 = 0.0;
        double v22 = 0.0;
        double v23 = 0.0;
      }
      uint64_t v25 = *((unsigned int *)a3 + 24);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      *(double *)&components.var0 = v21;
      *(double *)&components.unint64_t var1 = v22;
      *(double *)&components.var3 = v23;
      *(double *)&components.var7 = v24;
      CGColorRef v27 = CGColorCreate(DeviceRGB, (const CGFloat *)&components.var0);
      CGColorSpaceRelease(DeviceRGB);
      CFAutorelease(v27);
      int8x16_t v28 = +[PKInk identifierForCommandType:v25 wantsObjectErase:0];
      if ([v28 isEqualToString:@"com.apple.ink.marker"])
      {
        uint64_t v29 = *((void *)a3 + 7);
        if (v29) {
          unint64_t v30 = ((unint64_t)*(unsigned __int8 *)(v29 + 20) >> 2) & 1;
        }
        else {
          unint64_t v30 = 2;
        }
      }
      else
      {
        unint64_t v30 = 0;
      }
      int8x16_t v31 = [PKInk alloc];
      CGRect v32 = [MEMORY[0x1E4FB1618] colorWithCGColor:v27];
      uint64_t v33 = [(PKInk *)v31 initWithIdentifier:v28 color:v32 version:v30 variant:0];
      [(PKStroke *)v11 _setInk:v33];

      uint64_t v70 = 0;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v67 = 0u;
      memset(&components, 0, sizeof(components));
      uint64_t v34 = *((void *)a3 + 1);
      if (v34)
      {
        [(_PKStrokeConcrete *)v11 readPointFromLegacyArchive:v34 deltaFrom:&PKStrokePointDefault];
        long long v67 = v62;
        long long v68 = v63;
        long long v69 = v64;
        uint64_t v70 = v65;
        PKCompressedStrokePoint components = v61;
      }
      if (*((void *)a3 + 4) && *((void *)a3 + 3))
      {
        uint64_t v65 = 0;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v62 = 0u;
        memset(&v61, 0, sizeof(v61));
        -[_PKStrokeConcrete readPointFromLegacyArchive:deltaFrom:](v11, "readPointFromLegacyArchive:deltaFrom:");
        uint64_t v60 = 0;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v55 = 0u;
        [(_PKStrokeConcrete *)v11 readPointFromLegacyArchive:*((void *)a3 + 3) deltaFrom:&components];
        unint64_t v35 = -[_PKStrokeClipPlane initWithOrigin:normal:]([_PKStrokeClipPlane alloc], "initWithOrigin:normal:", 0.0, 0.0, -0.0, -0.0);
        [(_PKStrokeConcrete *)v11 _setClipPlane:v35];
      }
      uint64_t v36 = *((void *)a3 + 9) - *((void *)a3 + 8);
      if (v36)
      {
        unint64_t v37 = v36 >> 3;
        std::vector<PKCompressedStrokePoint>::vector(__p, v36 >> 3);
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        if (v37 <= 1) {
          uint64_t v40 = 1;
        }
        else {
          uint64_t v40 = v37;
        }
        double v41 = 0.0;
        do
        {
          uint64_t v42 = *(void *)(*((void *)a3 + 8) + 8 * v39);
          uint64_t v65 = 0;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v62 = 0u;
          memset(&v61, 0, sizeof(v61));
          [(_PKStrokeConcrete *)v11 readPointFromLegacyArchive:v42 deltaFrom:&components];
          if (!v39) {
            double v41 = *(double *)&v61.var0;
          }
          long long v50 = v62;
          long long v51 = v63;
          long long v52 = v64;
          uint64_t v53 = v65;
          PKCompressedStrokePoint v49 = v61;
          PKCompressStrokePoint(&v49, v41, (float32x2_t *)&v55);
          int8x16_t v43 = (char *)__p[0] + v38;
          *int8x16_t v43 = v55;
          v43[1] = v56;
          ++v39;
          v38 += 32;
        }
        while (v40 != v39);
        uint64_t v44 = [PKStrokePath alloc];
        _PKStrokeID v45 = __p[0];
        uint64_t v46 = [MEMORY[0x1E4F29128] UUID];
        int8x16_t v47 = [(PKStrokePath *)v44 initWithPoints:v45 count:v37 immutableCount:v37 inputType:1 timestamp:v46 UUID:0.0];
        [(PKStroke *)v11 set_strokeData:v47];

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      if (*((void *)a3 + 2)) {
        -[_PKStrokeConcrete _setBounds:](v11, "_setBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      }
      else {
        [(PKStroke *)v11 _setHidden:1];
      }
    }
    self = v11;
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (_PKStrokeID)readStrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4
{
  unint64_t var1 = a4->var1;
  unint64_t var2 = a4->var2;
  retstr->clock = var1;
  uint64_t v10 = [a5 objectAtIndexedSubscript:var2];
  [v10 getUUIDBytes:retstr->replicaUUID];

  retstr->subclock = a4->var3;
  return result;
}

- (void)saveStrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5
{
  id v12 = a5;
  unint64_t clock = a3->clock;
  *(unsigned char *)&a4->var4 |= 1u;
  a4->unint64_t var1 = clock;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3->replicaUUID];
  unint64_t v9 = [v12 indexOfObject:v8];
  char var4 = (char)a4->var4;
  *(unsigned char *)&a4->char var4 = var4 | 2;
  subunint64_t clock = a3->subclock;
  *(unsigned char *)&a4->char var4 = var4 | 6;
  a4->unint64_t var2 = v9;
  a4->var3 = subclock;
}

- (_PKStrokeID)readV1StrokeIDFromArchive:(SEL)a3 withSortedUUIDs:(const StrokeID *)a4
{
  unint64_t var1 = a4->var1;
  unint64_t var2 = a4->var2;
  retstr->unint64_t clock = var1;
  uint64_t v10 = [a5 objectAtIndexedSubscript:var2];
  [v10 getUUIDBytes:retstr->replicaUUID];

  retstr->subunint64_t clock = a4->var3;
  return result;
}

- (void)saveV1StrokeID:(const _PKStrokeID *)a3 toArchive:(StrokeID *)a4 withSortedUUIDs:(id)a5
{
  id v12 = a5;
  unint64_t clock = a3->clock;
  *(unsigned char *)&a4->var4 |= 1u;
  a4->unint64_t var1 = clock;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3->replicaUUID];
  unint64_t v9 = [v12 indexOfObject:v8];
  char var4 = (char)a4->var4;
  *(unsigned char *)&a4->char var4 = var4 | 2;
  subunint64_t clock = a3->subclock;
  *(unsigned char *)&a4->char var4 = var4 | 6;
  a4->unint64_t var2 = v9;
  a4->var3 = subclock;
}

- (CGPoint)readPointFromArchive:(const Point *)a3
{
  int32x2_t v3 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(LOBYTE(a3[4].v)), (int8x8_t)0x200000001));
  v4.i64[0] = v3.i32[0];
  v4.i64[1] = v3.i32[1];
  int8x16_t v5 = vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3[2].v), v4);
  double v6 = *(double *)&v5.i64[1];
  result.double x = *(double *)v5.i64;
  result.double y = v6;
  return result;
}

- (_PKStrokePoint)readPointFromLegacyArchive:(SEL)a3 deltaFrom:(const Point *)a4
{
  retstr->timestamp = 0.0;
  unsigned int v_low = LOBYTE(a4[9].v);
  int8x8_t v6 = (int8x8_t)vdup_n_s32(v_low);
  int32x2_t v7 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x4000000020));
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  retstr->location = (CGPoint)vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a4[7].v), v8);
  float32x2_t v9 = *(float32x2_t *)&a4[6].v;
  int32x2_t v10 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x100000010));
  v8.i64[0] = v10.i32[0];
  v8.i64[1] = v10.i32[1];
  v9.i32[1] = (__int32)a4[2];
  *(int8x16_t *)&retstr->radius = vbslq_s8(v8, *(int8x16_t *)&a5->radius, (int8x16_t)vcvtq_f64_f32(v9));
  float v11 = *(float *)&a4[3];
  double edgeWidth = *(float *)&a4[4];
  if ((v_low & 4) == 0) {
    double edgeWidth = a5->edgeWidth;
  }
  retstr->double edgeWidth = edgeWidth;
  retstr->force = 0.0;
  double azimuth = v11;
  if ((v_low & 2) == 0) {
    double azimuth = a5->azimuth;
  }
  retstr->double azimuth = azimuth;
  retstr->altitude = 0.0;
  opacitdouble y = *(float *)&a4[5];
  if ((v_low & 8) == 0) {
    opacitdouble y = a5->opacity;
  }
  retstr->opacitdouble y = opacity;
  retstr->radius2 = 0.0;
  return self;
}

- (unsigned)saveToV1Archive:(void *)a3 sortedUUIDs:(id)a4 inks:(id)a5 withPathData:(BOOL)a6 transient:(BOOL)a7
{
  BOOL v8 = a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  drawingV1::Stroke::makeStrokeID((uint64_t)a3);
  uint64_t v14 = *((void *)a3 + 6);
  [(_PKStrokeConcrete *)self _sortID];
  [(_PKStrokeConcrete *)self saveV1StrokeID:&v61 toArchive:v14 withSortedUUIDs:v12];
  if (!a7)
  {
    v61.var0 = 0;
    *(void *)&v61.unint64_t var1 = 0;
    uint64_t v15 = [(_PKStrokeConcrete *)self _strokeUUID];
    [v15 getUUIDBytes:&v61];

    long long v16 = (PB::Data *)*((void *)a3 + 7);
    if (!v16) {
      operator new();
    }
    PB::Data::assign(v16, (const unsigned __int8 *)&v61, (const unsigned __int8 *)&v61.var3);
  }
  drawingV1::Stroke::makeVersion((uint64_t)a3);
  uint64_t v17 = *((void *)a3 + 10);
  [(_PKStrokeConcrete *)self _version];
  [(_PKStrokeConcrete *)self saveV1StrokeID:&v61 toArchive:v17 withSortedUUIDs:v12];
  float v18 = [(_PKStrokeConcrete *)self ink];
  uint64_t v19 = [v13 indexOfObject:v18];

  *((unsigned char *)a3 + 92) |= 1u;
  *((void *)a3 + 2) = v19;
  [(PKStroke *)self timestamp];
  *((unsigned char *)a3 + 92) |= 4u;
  *((void *)a3 + 8) = v20;
  BOOL v21 = [(PKStroke *)self _isHidden];
  *((unsigned char *)a3 + 92) |= 0x10u;
  *((unsigned char *)a3 + 89) = v21;
  if (![(PKStroke *)self _isHidden])
  {
    if (v8)
    {
      unint64_t v22 = [(PKStroke *)self _pointsCount];
      *((unsigned char *)a3 + 92) |= 2u;
      *((void *)a3 + 4) = v22;
      double v23 = (unsigned __int8 *)malloc_type_malloc(24 * v22, 0x1000040504FFAC1uLL);
      double v24 = v23;
      if (v22)
      {
        uint64_t v25 = 0;
        int8x16_t v26 = v23;
        do
        {
          CGColorRef v27 = [(PKStroke *)self _strokeData];
          int8x16_t v28 = v27;
          if (v27) {
            [v27 _compressedPointAt:v25];
          }
          else {
            memset(&v61, 0, sizeof(v61));
          }
          PKConvertToCompressedStrokePointV1((uint64_t)&v61, (uint64_t)&v59);
          *(_OWORD *)int8x16_t v26 = v59;
          *((void *)v26 + 2) = v60;

          ++v25;
          v26 += 24;
        }
        while (v22 != v25);
      }
      uint64_t v29 = (PB::Data *)*((void *)a3 + 3);
      if (!v29) {
        operator new();
      }
      PB::Data::assign(v29, v24, &v24[24 * v22]);
      free(v24);
      unint64_t v30 = [(PKStroke *)self _strokeDataUUID];
      int8x16_t v31 = v30;
      if (v30)
      {
        v61.var0 = 0;
        *(void *)&v61.unint64_t var1 = 0;
        [v30 getUUIDBytes:&v61];
        CGRect v32 = (PB::Data *)*((void *)a3 + 5);
        if (!v32) {
          operator new();
        }
        PB::Data::assign(v32, (const unsigned __int8 *)&v61, (const unsigned __int8 *)&v61.var3);
      }
    }
    [(PKStroke *)self _bounds];
    double x = v64.origin.x;
    double y = v64.origin.y;
    double width = v64.size.width;
    double height = v64.size.height;
    if (!CGRectIsNull(v64))
    {
      drawingV1::Stroke::makeBounds((uint64_t)a3);
      uint64_t v37 = *((void *)a3 + 1);
      float v38 = x;
      char v39 = *(unsigned char *)(v37 + 24);
      float v40 = y;
      float v41 = width;
      *(float *)(v37 + 16) = v40;
      *(float *)(v37 + 20) = v41;
      float v42 = height;
      *(unsigned char *)(v37 + 24) = v39 | 0xF;
      *(float *)(v37 + 8) = v42;
      *(float *)(v37 + 12) = v38;
    }
    long long v62 = 0u;
    memset(&v61, 0, sizeof(v61));
    [(_PKStrokeConcrete *)self _transform];
    *(_OWORD *)&t1.float a = *(_OWORD *)&v61.var0.var0;
    *(_OWORD *)&t1.float c = *(_OWORD *)&v61.var3;
    *(_OWORD *)&t1.tdouble x = v62;
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v57.float a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v57.float c = v43;
    *(_OWORD *)&v57.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (!CGAffineTransformEqualToTransform(&t1, &v57))
    {
      drawingV1::Stroke::makeTransform((uint64_t)a3);
      uint64_t v44 = *((void *)a3 + 9);
      float v45 = *(double *)&v61.var0;
      *(unsigned char *)(v44 + 32) |= 1u;
      *(float *)(v44 + 8) = v45;
      uint64_t v46 = *((void *)a3 + 9);
      float v47 = *(double *)&v61.var1;
      *(unsigned char *)(v46 + 32) |= 2u;
      *(float *)(v46 + 12) = v47;
      uint64_t v48 = *((void *)a3 + 9);
      float v49 = *(double *)&v61.var3;
      *(unsigned char *)(v48 + 32) |= 4u;
      *(float *)(v48 + 16) = v49;
      uint64_t v50 = *((void *)a3 + 9);
      float v51 = *(double *)&v61.var7;
      *(unsigned char *)(v50 + 32) |= 8u;
      *(float *)(v50 + 20) = v51;
      uint64_t v52 = *((void *)a3 + 9);
      float v53 = *(double *)&v62;
      *(unsigned char *)(v52 + 32) |= 0x10u;
      *(float *)(v52 + 24) = v53;
      uint64_t v54 = *((void *)a3 + 9);
      float v55 = *((double *)&v62 + 1);
      *(unsigned char *)(v54 + 32) |= 0x20u;
      *(float *)(v54 + 28) = v55;
    }
    if (![(PKStroke *)self _inputType])
    {
      *((unsigned char *)a3 + 92) |= 8u;
      *((unsigned char *)a3 + 88) = 1;
    }
  }

  return 1;
}

@end