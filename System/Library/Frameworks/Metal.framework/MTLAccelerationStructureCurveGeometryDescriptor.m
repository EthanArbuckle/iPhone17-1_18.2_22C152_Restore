@interface MTLAccelerationStructureCurveGeometryDescriptor
+ (MTLAccelerationStructureCurveGeometryDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructureCurveGeometryDescriptor)init;
- (MTLAttributeFormat)controlPointFormat;
- (MTLAttributeFormat)radiusFormat;
- (MTLCurveBasis)curveBasis;
- (MTLCurveEndCaps)curveEndCaps;
- (MTLCurveType)curveType;
- (MTLIndexType)indexType;
- (NSUInteger)controlPointBufferOffset;
- (NSUInteger)controlPointCount;
- (NSUInteger)controlPointStride;
- (NSUInteger)indexBufferOffset;
- (NSUInteger)radiusBufferOffset;
- (NSUInteger)radiusStride;
- (NSUInteger)segmentControlPointCount;
- (NSUInteger)segmentCount;
- (id)controlPointBuffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexBuffer;
- (id)radiusBuffer;
- (int64_t)endCaps;
- (unint64_t)hash;
- (void)dealloc;
- (void)setControlPointBuffer:(id)controlPointBuffer;
- (void)setControlPointBufferOffset:(NSUInteger)controlPointBufferOffset;
- (void)setControlPointCount:(NSUInteger)controlPointCount;
- (void)setControlPointFormat:(MTLAttributeFormat)controlPointFormat;
- (void)setControlPointStride:(NSUInteger)controlPointStride;
- (void)setCurveBasis:(MTLCurveBasis)curveBasis;
- (void)setCurveEndCaps:(MTLCurveEndCaps)curveEndCaps;
- (void)setCurveType:(MTLCurveType)curveType;
- (void)setEndCaps:(int64_t)a3;
- (void)setIndexBuffer:(id)indexBuffer;
- (void)setIndexBufferOffset:(NSUInteger)indexBufferOffset;
- (void)setIndexType:(MTLIndexType)indexType;
- (void)setRadiusBuffer:(id)radiusBuffer;
- (void)setRadiusBufferOffset:(NSUInteger)radiusBufferOffset;
- (void)setRadiusFormat:(MTLAttributeFormat)radiusFormat;
- (void)setRadiusStride:(NSUInteger)radiusStride;
- (void)setSegmentControlPointCount:(NSUInteger)segmentControlPointCount;
- (void)setSegmentCount:(NSUInteger)segmentCount;
@end

@implementation MTLAccelerationStructureCurveGeometryDescriptor

- (int64_t)endCaps
{
  return self->_endCaps;
}

- (void)setEndCaps:(int64_t)a3
{
  self->_endCaps = a3;
}

+ (MTLAccelerationStructureCurveGeometryDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLAccelerationStructureCurveGeometryDescriptor);

  return v2;
}

- (MTLAccelerationStructureCurveGeometryDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  result = [(MTLAccelerationStructureGeometryDescriptor *)&v3 init];
  if (result)
  {
    result->_controlPointFormat = 30;
    result->_radiusFormat = 28;
    result->_indexType = 1;
    result->_curveType = 0;
    result->_curveBasis = 0;
    result->_endCaps = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  [(MTLAccelerationStructureGeometryDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  id v4 = [(MTLAccelerationStructureGeometryDescriptor *)&v6 copyWithZone:a3];
  [v4 setControlPointBuffer:self->_controlPointBuffer];
  [v4 setControlPointBufferOffset:self->_controlPointBufferOffset];
  [v4 setControlPointCount:self->_controlPointCount];
  [v4 setControlPointStride:self->_controlPointStride];
  [v4 setControlPointFormat:self->_controlPointFormat];
  [v4 setRadiusBuffer:self->_radiusBuffer];
  [v4 setRadiusBufferOffset:self->_radiusBufferOffset];
  [v4 setRadiusFormat:self->_radiusFormat];
  [v4 setRadiusStride:self->_radiusStride];
  [v4 setIndexBuffer:self->_indexBuffer];
  [v4 setIndexBufferOffset:self->_indexBufferOffset];
  [v4 setIndexType:self->_indexType];
  [v4 setSegmentCount:self->_segmentCount];
  [v4 setSegmentControlPointCount:self->_segmentControlPointCount];
  [v4 setCurveType:self->_curveType];
  [v4 setCurveBasis:self->_curveBasis];
  [v4 setEndCaps:self->_endCaps];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v28 = v3;
    uint64_t v29 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v27.receiver = self;
    v27.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
    BOOL v8 = [(MTLAccelerationStructureGeometryDescriptor *)&v27 isEqual:a3];
    if (!v8) {
      return v8;
    }
    id v9 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self controlPointBuffer];
    if (v9 != (id)[a3 controlPointBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v10 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self controlPointBufferOffset];
    if (v10 != [a3 controlPointBufferOffset]) {
      goto LABEL_3;
    }
    NSUInteger v11 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self controlPointCount];
    if (v11 != [a3 controlPointCount]) {
      goto LABEL_3;
    }
    NSUInteger v12 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self controlPointStride];
    if (v12 != [a3 controlPointStride]) {
      goto LABEL_3;
    }
    MTLAttributeFormat v13 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self controlPointFormat];
    if (v13 != [a3 controlPointFormat]) {
      goto LABEL_3;
    }
    id v14 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self radiusBuffer];
    if (v14 != (id)[a3 radiusBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v15 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self radiusBufferOffset];
    if (v15 != [a3 radiusBufferOffset]) {
      goto LABEL_3;
    }
    MTLAttributeFormat v16 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self radiusFormat];
    if (v16 != [a3 radiusFormat]) {
      goto LABEL_3;
    }
    NSUInteger v17 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self radiusStride];
    if (v17 != [a3 radiusStride]) {
      goto LABEL_3;
    }
    id v18 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self indexBuffer];
    if (v18 == (id)[a3 indexBuffer]
      && (NSUInteger v19 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self indexBufferOffset],
          v19 == [a3 indexBufferOffset])
      && (MTLIndexType v20 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self indexType],
          v20 == [a3 indexType])
      && (NSUInteger v21 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self segmentCount],
          v21 == [a3 segmentCount])
      && (NSUInteger v22 = -[MTLAccelerationStructureCurveGeometryDescriptor segmentControlPointCount](self, "segmentControlPointCount"), v22 == [a3 segmentControlPointCount])&& (v23 = -[MTLAccelerationStructureCurveGeometryDescriptor curveType](self, "curveType"), v23 == objc_msgSend(a3, "curveType"))&& (v24 = -[MTLAccelerationStructureCurveGeometryDescriptor curveBasis](self, "curveBasis"), v24 == objc_msgSend(a3, "curveBasis")))
    {
      int64_t v25 = [(MTLAccelerationStructureCurveGeometryDescriptor *)self endCaps];
      LOBYTE(v8) = v25 == [a3 endCaps];
    }
    else
    {
LABEL_3:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v18, 0x90uLL);
  v17.receiver = self;
  v17.super_class = (Class)MTLAccelerationStructureCurveGeometryDescriptor;
  v18[0] = [(MTLAccelerationStructureGeometryDescriptor *)&v17 hash];
  uint64_t v3 = [(MTLBuffer *)self->_controlPointBuffer hash];
  unint64_t controlPointBufferOffset = self->_controlPointBufferOffset;
  unint64_t controlPointCount = self->_controlPointCount;
  unint64_t controlPointStride = self->_controlPointStride;
  v18[1] = v3;
  v18[2] = controlPointBufferOffset;
  unint64_t controlPointFormat = self->_controlPointFormat;
  v18[3] = controlPointCount;
  v18[4] = controlPointStride;
  v18[5] = controlPointFormat;
  uint64_t v8 = [(MTLBuffer *)self->_radiusBuffer hash];
  unint64_t radiusBufferOffset = self->_radiusBufferOffset;
  v18[6] = v8;
  v18[7] = radiusBufferOffset;
  unint64_t radiusStride = self->_radiusStride;
  v18[8] = self->_radiusFormat;
  v18[9] = radiusStride;
  uint64_t v11 = [(MTLBuffer *)self->_indexBuffer hash];
  unint64_t indexBufferOffset = self->_indexBufferOffset;
  v18[10] = v11;
  v18[11] = indexBufferOffset;
  unint64_t segmentCount = self->_segmentCount;
  v18[12] = self->_indexType;
  v18[13] = segmentCount;
  int64_t curveType = self->_curveType;
  v18[14] = self->_segmentControlPointCount;
  v18[15] = curveType;
  int64_t endCaps = self->_endCaps;
  v18[16] = self->_curveBasis;
  v18[17] = endCaps;
  return _MTLHashState((int *)v18, 0x90uLL);
}

- (id)controlPointBuffer
{
  return self->_controlPointBuffer;
}

- (void)setControlPointBuffer:(id)controlPointBuffer
{
}

- (NSUInteger)controlPointBufferOffset
{
  return self->_controlPointBufferOffset;
}

- (void)setControlPointBufferOffset:(NSUInteger)controlPointBufferOffset
{
  self->_unint64_t controlPointBufferOffset = controlPointBufferOffset;
}

- (NSUInteger)controlPointCount
{
  return self->_controlPointCount;
}

- (void)setControlPointCount:(NSUInteger)controlPointCount
{
  self->_unint64_t controlPointCount = controlPointCount;
}

- (NSUInteger)controlPointStride
{
  return self->_controlPointStride;
}

- (void)setControlPointStride:(NSUInteger)controlPointStride
{
  self->_unint64_t controlPointStride = controlPointStride;
}

- (MTLAttributeFormat)controlPointFormat
{
  return self->_controlPointFormat;
}

- (void)setControlPointFormat:(MTLAttributeFormat)controlPointFormat
{
  self->_unint64_t controlPointFormat = controlPointFormat;
}

- (id)radiusBuffer
{
  return self->_radiusBuffer;
}

- (void)setRadiusBuffer:(id)radiusBuffer
{
}

- (NSUInteger)radiusBufferOffset
{
  return self->_radiusBufferOffset;
}

- (void)setRadiusBufferOffset:(NSUInteger)radiusBufferOffset
{
  self->_unint64_t radiusBufferOffset = radiusBufferOffset;
}

- (MTLAttributeFormat)radiusFormat
{
  return self->_radiusFormat;
}

- (void)setRadiusFormat:(MTLAttributeFormat)radiusFormat
{
  self->_radiusFormat = radiusFormat;
}

- (NSUInteger)radiusStride
{
  return self->_radiusStride;
}

- (void)setRadiusStride:(NSUInteger)radiusStride
{
  self->_unint64_t radiusStride = radiusStride;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (void)setIndexBuffer:(id)indexBuffer
{
}

- (NSUInteger)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(NSUInteger)indexBufferOffset
{
  self->_unint64_t indexBufferOffset = indexBufferOffset;
}

- (MTLIndexType)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(MTLIndexType)indexType
{
  self->_indexType = indexType;
}

- (NSUInteger)segmentCount
{
  return self->_segmentCount;
}

- (void)setSegmentCount:(NSUInteger)segmentCount
{
  self->_unint64_t segmentCount = segmentCount;
}

- (NSUInteger)segmentControlPointCount
{
  return self->_segmentControlPointCount;
}

- (void)setSegmentControlPointCount:(NSUInteger)segmentControlPointCount
{
  self->_segmentControlPointCount = segmentControlPointCount;
}

- (MTLCurveBasis)curveBasis
{
  return self->_curveBasis;
}

- (void)setCurveBasis:(MTLCurveBasis)curveBasis
{
  self->_curveBasis = curveBasis;
}

- (MTLCurveType)curveType
{
  return self->_curveType;
}

- (void)setCurveType:(MTLCurveType)curveType
{
  self->_int64_t curveType = curveType;
}

- (MTLCurveEndCaps)curveEndCaps
{
  return self->_endCaps;
}

- (void)setCurveEndCaps:(MTLCurveEndCaps)curveEndCaps
{
  self->_int64_t endCaps = curveEndCaps;
}

@end