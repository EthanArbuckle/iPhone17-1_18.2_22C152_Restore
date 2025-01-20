@interface MTLAccelerationStructureMotionCurveGeometryDescriptor
+ (MTLAccelerationStructureMotionCurveGeometryDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructureMotionCurveGeometryDescriptor)init;
- (MTLAttributeFormat)controlPointFormat;
- (MTLAttributeFormat)radiusFormat;
- (MTLCurveBasis)curveBasis;
- (MTLCurveEndCaps)curveEndCaps;
- (MTLCurveType)curveType;
- (MTLIndexType)indexType;
- (NSArray)controlPointBuffers;
- (NSArray)radiusBuffers;
- (NSUInteger)controlPointCount;
- (NSUInteger)controlPointStride;
- (NSUInteger)indexBufferOffset;
- (NSUInteger)radiusStride;
- (NSUInteger)segmentControlPointCount;
- (NSUInteger)segmentCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexBuffer;
- (int64_t)endCaps;
- (unint64_t)hash;
- (void)dealloc;
- (void)setControlPointBuffers:(NSArray *)controlPointBuffers;
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
- (void)setRadiusBuffers:(NSArray *)radiusBuffers;
- (void)setRadiusFormat:(MTLAttributeFormat)radiusFormat;
- (void)setRadiusStride:(NSUInteger)radiusStride;
- (void)setSegmentControlPointCount:(NSUInteger)segmentControlPointCount;
- (void)setSegmentCount:(NSUInteger)segmentCount;
@end

@implementation MTLAccelerationStructureMotionCurveGeometryDescriptor

- (int64_t)endCaps
{
  return self->_endCaps;
}

- (void)setEndCaps:(int64_t)a3
{
  self->_endCaps = a3;
}

+ (MTLAccelerationStructureMotionCurveGeometryDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLAccelerationStructureMotionCurveGeometryDescriptor);

  return v2;
}

- (MTLAccelerationStructureMotionCurveGeometryDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  v2 = [(MTLAccelerationStructureGeometryDescriptor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_controlPointFormat = 30;
    v2->_radiusFormat = 28;
    v2->_indexType = 1;
    v2->_curveType = 0;
    v2->_curveBasis = 0;
    v2->_endCaps = 0;
    v2->_controlPointBuffers = (NSArray *)objc_opt_new();
    v3->_radiusBuffers = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  [(MTLAccelerationStructureGeometryDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  id v4 = [(MTLAccelerationStructureGeometryDescriptor *)&v6 copyWithZone:a3];
  [v4 setControlPointBuffers:self->_controlPointBuffers];
  [v4 setControlPointCount:self->_controlPointCount];
  [v4 setControlPointStride:self->_controlPointStride];
  [v4 setControlPointFormat:self->_controlPointFormat];
  [v4 setRadiusBuffers:self->_radiusBuffers];
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
    uint64_t v32 = v3;
    uint64_t v33 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v31.receiver = self;
    v31.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
    BOOL v8 = [(MTLAccelerationStructureGeometryDescriptor *)&v31 isEqual:a3];
    if (!v8) {
      return v8;
    }
    NSUInteger v9 = [(NSArray *)[(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self controlPointBuffers] count];
    if (v9 != objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "count")) {
      goto LABEL_3;
    }
    NSUInteger v10 = [(NSArray *)[(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self radiusBuffers] count];
    if (v10 != objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "count")) {
      goto LABEL_3;
    }
    if ([(NSArray *)self->_controlPointBuffers count])
    {
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointBuffers](self, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "buffer");
        if (v12 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "buffer"))goto LABEL_3; {
        uint64_t v13 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor controlPointBuffers](self, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "offset");
        }
        if (v13 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "controlPointBuffers"), "objectAtIndexedSubscript:", v11), "offset"))goto LABEL_3; {
      }
        }
      while (++v11 < [(NSArray *)self->_controlPointBuffers count]);
    }
    if ([(NSArray *)self->_radiusBuffers count])
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusBuffers](self, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "buffer");
        if (v15 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "buffer"))goto LABEL_3; {
        uint64_t v16 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionCurveGeometryDescriptor radiusBuffers](self, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "offset");
        }
        if (v16 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "radiusBuffers"), "objectAtIndexedSubscript:", v14), "offset"))goto LABEL_3; {
      }
        }
      while (++v14 < [(NSArray *)self->_radiusBuffers count]);
    }
    NSUInteger v17 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self controlPointCount];
    if (v17 != [a3 controlPointCount]) {
      goto LABEL_3;
    }
    NSUInteger v18 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self controlPointStride];
    if (v18 != [a3 controlPointStride]) {
      goto LABEL_3;
    }
    MTLAttributeFormat v19 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self controlPointFormat];
    if (v19 != [a3 controlPointFormat]) {
      goto LABEL_3;
    }
    MTLAttributeFormat v20 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self radiusFormat];
    if (v20 != [a3 radiusFormat]) {
      goto LABEL_3;
    }
    NSUInteger v21 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self radiusStride];
    if (v21 != [a3 radiusStride]
      || (id v22 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self indexBuffer],
          v22 != (id)[a3 indexBuffer])
      || (NSUInteger v23 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self indexBufferOffset],
          v23 != [a3 indexBufferOffset])
      || (MTLIndexType v24 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self indexType],
          v24 != [a3 indexType])
      || (NSUInteger v25 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self segmentCount],
          v25 != [a3 segmentCount])
      || (NSUInteger v26 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor segmentControlPointCount](self, "segmentControlPointCount"), v26 != [a3 segmentControlPointCount])|| (v27 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor curveType](self, "curveType"), v27 != objc_msgSend(a3, "curveType"))|| (v28 = -[MTLAccelerationStructureMotionCurveGeometryDescriptor curveBasis](self, "curveBasis"), v28 != objc_msgSend(a3, "curveBasis")))
    {
LABEL_3:
      LOBYTE(v8) = 0;
      return v8;
    }
    int64_t v29 = [(MTLAccelerationStructureMotionCurveGeometryDescriptor *)self endCaps];
    LOBYTE(v8) = v29 == [a3 endCaps];
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v16, 0x80uLL);
  v15.receiver = self;
  v15.super_class = (Class)MTLAccelerationStructureMotionCurveGeometryDescriptor;
  v16[0] = [(MTLAccelerationStructureGeometryDescriptor *)&v15 hash];
  uint64_t v3 = MTLHashArray(self->_controlPointBuffers, 0, 1);
  unint64_t controlPointCount = self->_controlPointCount;
  v16[1] = v3;
  v16[2] = controlPointCount;
  unint64_t controlPointFormat = self->_controlPointFormat;
  v16[3] = self->_controlPointStride;
  v16[4] = controlPointFormat;
  uint64_t v6 = MTLHashArray(self->_radiusBuffers, 0, 1);
  unint64_t radiusFormat = self->_radiusFormat;
  unint64_t radiusStride = self->_radiusStride;
  v16[5] = v6;
  v16[6] = radiusFormat;
  v16[7] = radiusStride;
  uint64_t v9 = [(MTLBuffer *)self->_indexBuffer hash];
  unint64_t indexBufferOffset = self->_indexBufferOffset;
  v16[8] = v9;
  v16[9] = indexBufferOffset;
  unint64_t segmentCount = self->_segmentCount;
  v16[10] = self->_indexType;
  v16[11] = segmentCount;
  int64_t curveType = self->_curveType;
  v16[12] = self->_segmentControlPointCount;
  v16[13] = curveType;
  int64_t endCaps = self->_endCaps;
  v16[14] = self->_curveBasis;
  v16[15] = endCaps;
  return _MTLHashState((int *)v16, 0x80uLL);
}

- (void)setControlPointBuffers:(NSArray *)controlPointBuffers
{
  uint64_t v3 = self->_controlPointBuffers;
  if (v3 != controlPointBuffers)
  {

    self->_controlPointBuffers = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:controlPointBuffers copyItems:1];
  }
}

- (void)setRadiusBuffers:(NSArray *)radiusBuffers
{
  uint64_t v3 = self->_radiusBuffers;
  if (v3 != radiusBuffers)
  {

    self->_radiusBuffers = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:radiusBuffers copyItems:1];
  }
}

- (NSArray)controlPointBuffers
{
  return self->_controlPointBuffers;
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
  self->_controlPointStride = controlPointStride;
}

- (MTLAttributeFormat)controlPointFormat
{
  return self->_controlPointFormat;
}

- (void)setControlPointFormat:(MTLAttributeFormat)controlPointFormat
{
  self->_unint64_t controlPointFormat = controlPointFormat;
}

- (NSArray)radiusBuffers
{
  return self->_radiusBuffers;
}

- (MTLAttributeFormat)radiusFormat
{
  return self->_radiusFormat;
}

- (void)setRadiusFormat:(MTLAttributeFormat)radiusFormat
{
  self->_unint64_t radiusFormat = radiusFormat;
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