@interface CHSegmentDescriptor
+ (CGRect)boundingBoxFromSegmentID:(int64_t)a3 toSegmentID:(int64_t)a4 withSegments:(id)a5 withSourceDrawing:(id)a6;
+ (id)generateSegmentsFromDrawing:(id)a3;
+ (int64_t)indexForSegmentID:(id)a3 fromSegments:(id)a4;
- (BOOL)isSinglePointSegment;
- (CGRect)contextBounds;
- (CGRect)segmentBounds;
- (CHCutPoint)endCutPoint;
- (CHCutPoint)startCutPoint;
- (CHSegmentDescriptor)initWithSegmentID:(id)a3 startCutPoint:(id)a4 endCutPoint:(id)a5 referenceDrawing:(id)a6;
- (NSNumber)segmentID;
- (id)strokeIndexSet;
- (int64_t)strokeCount;
- (void)setContextBounds:(CGRect)a3;
@end

@implementation CHSegmentDescriptor

- (CHSegmentDescriptor)initWithSegmentID:(id)a3 startCutPoint:(id)a4 endCutPoint:(id)a5 referenceDrawing:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v60.receiver = self;
  v60.super_class = (Class)CHSegmentDescriptor;
  v15 = [(CHSegmentDescriptor *)&v60 init];
  objc_storeStrong((id *)&v15->_segmentID, a3);
  p_startCutPoint = (void **)&v15->_startCutPoint;
  objc_storeStrong((id *)&v15->_startCutPoint, a4);
  p_endCutPoint = (void **)&v15->_endCutPoint;
  objc_storeStrong((id *)&v15->_endCutPoint, a5);
  objc_msgSend_isSinglePointSegment(v15, v18, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_strokeIndex(v15->_startCutPoint, v23, v24, v25, v26, v27);
  if (v28 == objc_msgSend_strokeIndex(v15->_endCutPoint, v29, v30, v31, v32, v33)
    && objc_msgSend_isStartOfStroke(*p_startCutPoint, v34, v35, v36, v37, v38)
    && objc_msgSend_isEndOfStroke(*p_endCutPoint, v39, v40, v41, v42, v43))
  {
    uint64_t v49 = objc_msgSend_strokeIndex(*p_startCutPoint, v44, v45, v46, v47, v48);
    objc_msgSend_boundsForStrokeIndex_(v14, v50, v49, v51, v52, v53);
  }
  else
  {
    double v54 = sub_1C49C3CC0(v14, *p_startCutPoint, *p_endCutPoint);
  }
  v15->_segmentBounds.origin.x = v54;
  v15->_segmentBounds.origin.y = v55;
  v15->_segmentBounds.size.width = v56;
  v15->_segmentBounds.size.height = v57;
  CGSize size = v15->_segmentBounds.size;
  v15->_contextBounds.origin = v15->_segmentBounds.origin;
  v15->_contextBounds.CGSize size = size;

  return v15;
}

- (id)strokeIndexSet
{
  v7 = objc_msgSend_startCutPoint(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_strokeIndex(v7, v8, v9, v10, v11, v12);

  uint64_t v19 = objc_msgSend_endCutPoint(self, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_strokeIndex(v19, v20, v21, v22, v23, v24) - v13 + 1;

  v29 = (void *)MEMORY[0x1E4F28D60];
  return (id)objc_msgSend_indexSetWithIndexesInRange_(v29, v26, v13, v25, v27, v28);
}

- (int64_t)strokeCount
{
  uint64_t v7 = objc_msgSend_strokeIndex(self->_endCutPoint, a2, v2, v3, v4, v5);
  return v7 - objc_msgSend_strokeIndex(self->_startCutPoint, v8, v9, v10, v11, v12) + 1;
}

- (BOOL)isSinglePointSegment
{
  uint64_t v7 = objc_msgSend_startCutPoint(self, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_endCutPoint(self, v8, v9, v10, v11, v12);
  BOOL v18 = objc_msgSend_compare_(v7, v14, (uint64_t)v13, v15, v16, v17) == 0;

  return v18;
}

+ (id)generateSegmentsFromDrawing:(id)a3
{
  id v3 = a3;
  id v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7, v8);
  for (unint64_t i = 0; i < objc_msgSend_strokeCount(v3, v9, v10, v11, v12, v13); ++i)
  {
    uint64_t v16 = [CHCutPoint alloc];
    isEndOfStroke = objc_msgSend_initWithStrokeIndex_pointIndex_isEndOfStroke_(v16, v17, i, 0, 0, v18);
    uint64_t v20 = [CHCutPoint alloc];
    uint64_t v25 = objc_msgSend_pointCountForStrokeIndex_(v3, v21, i, v22, v23, v24);
    uint64_t v28 = objc_msgSend_initWithStrokeIndex_pointIndex_isEndOfStroke_(v20, v26, i, v25 - 1, 1, v27);
    v29 = [CHSegmentDescriptor alloc];
    v34 = objc_msgSend_numberWithInteger_(NSNumber, v30, i, v31, v32, v33);
    started = objc_msgSend_initWithSegmentID_startCutPoint_endCutPoint_referenceDrawing_(v29, v35, (uint64_t)v34, (uint64_t)isEndOfStroke, (uint64_t)v28, (uint64_t)v3);

    objc_msgSend_addObject_(v14, v37, (uint64_t)started, v38, v39, v40);
  }

  return v14;
}

+ (CGRect)boundingBoxFromSegmentID:(int64_t)a3 toSegmentID:(int64_t)a4 withSegments:(id)a5 withSourceDrawing:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t v15 = objc_msgSend_objectAtIndex_(v9, v11, a3, v12, v13, v14);
  uint64_t v20 = objc_msgSend_objectAtIndex_(v9, v16, a4, v17, v18, v19);
  uint64_t v26 = objc_msgSend_startCutPoint(v15, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_endCutPoint(v20, v27, v28, v29, v30, v31);
  double v33 = sub_1C49C3CC0(v10, v26, v32);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  double v40 = v33;
  double v41 = v35;
  double v42 = v37;
  double v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

+ (int64_t)indexForSegmentID:(id)a3 fromSegments:(id)a4
{
  id v5 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C49C5390;
  v13[3] = &unk_1E64E1A60;
  id v14 = v5;
  id v6 = v5;
  int64_t v11 = objc_msgSend_indexOfObjectPassingTest_(a4, v7, (uint64_t)v13, v8, v9, v10);

  return v11;
}

- (NSNumber)segmentID
{
  return self->_segmentID;
}

- (CHCutPoint)startCutPoint
{
  return self->_startCutPoint;
}

- (CHCutPoint)endCutPoint
{
  return self->_endCutPoint;
}

- (CGRect)segmentBounds
{
  double x = self->_segmentBounds.origin.x;
  double y = self->_segmentBounds.origin.y;
  double width = self->_segmentBounds.size.width;
  double height = self->_segmentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contextBounds
{
  double x = self->_contextBounds.origin.x;
  double y = self->_contextBounds.origin.y;
  double width = self->_contextBounds.size.width;
  double height = self->_contextBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContextBounds:(CGRect)a3
{
  self->_contextBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCutPoint, 0);
  objc_storeStrong((id *)&self->_startCutPoint, 0);
  objc_storeStrong((id *)&self->_segmentID, 0);
}

@end