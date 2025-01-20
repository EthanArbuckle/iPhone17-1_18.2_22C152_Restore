@interface CHDrawingSegmentGroup
- (CGRect)bounds;
- (CHDrawingSegmentGroup)initWithSegmentGroupIndex:(int64_t)a3 segments:(id)a4;
- (NSArray)segments;
- (int64_t)segmentGroupIndex;
- (int64_t)totalSegmentCount;
@end

@implementation CHDrawingSegmentGroup

- (CHDrawingSegmentGroup)initWithSegmentGroupIndex:(int64_t)a3 segments:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHDrawingSegmentGroup;
  v8 = [(CHDrawingSegmentGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_segmentGroupIndex = a3;
    objc_storeStrong((id *)&v8->_segments, a4);
  }

  return v9;
}

- (CGRect)bounds
{
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (objc_msgSend_count(self->_segments, a2, v2, v3, v4, v5))
  {
    unint64_t v15 = 0;
    do
    {
      v16 = objc_msgSend_objectAtIndexedSubscript_(self->_segments, v11, v15, v12, v13, v14);
      objc_msgSend_segmentBounds(v16, v17, v18, v19, v20, v21);
      v38.origin.CGFloat x = v22;
      v38.origin.CGFloat y = v23;
      v38.size.CGFloat width = v24;
      v38.size.CGFloat height = v25;
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      CGRect v36 = CGRectUnion(v35, v38);
      CGFloat x = v36.origin.x;
      CGFloat y = v36.origin.y;
      CGFloat width = v36.size.width;
      CGFloat height = v36.size.height;

      ++v15;
    }
    while (v15 < objc_msgSend_count(self->_segments, v26, v27, v28, v29, v30));
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (int64_t)totalSegmentCount
{
  return objc_msgSend_count(self->_segments, a2, v2, v3, v4, v5);
}

- (int64_t)segmentGroupIndex
{
  return self->_segmentGroupIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
}

@end