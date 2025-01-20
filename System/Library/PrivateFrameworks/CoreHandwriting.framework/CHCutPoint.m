@interface CHCutPoint
+ (id)sortedCHCutPointArray:(id)a3;
- (BOOL)isEndOfStroke;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStartOfStroke;
- (CHCutPoint)initWithStrokeIndex:(int64_t)a3 pointIndex:(int64_t)a4 isEndOfStroke:(BOOL)a5;
- (int64_t)compare:(id)a3;
- (int64_t)pointIndex;
- (int64_t)strokeIndex;
- (unint64_t)hash;
@end

@implementation CHCutPoint

- (CHCutPoint)initWithStrokeIndex:(int64_t)a3 pointIndex:(int64_t)a4 isEndOfStroke:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CHCutPoint;
  result = [(CHCutPoint *)&v9 init];
  result->_strokeIndex = a3;
  result->_pointIndex = a4;
  result->_isEndOfStroke = a5;
  return result;
}

- (BOOL)isStartOfStroke
{
  return self->_pointIndex == 0;
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend_compare_(self, a2, (uint64_t)a3, v3, v4, v5) == 0;
}

- (unint64_t)hash
{
  return (4 * self->_pointIndex) | (2 * self->_strokeIndex);
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_strokeIndex(self, v5, v6, v7, v8, v9);
  if (v10 > objc_msgSend_strokeIndex(v4, v11, v12, v13, v14, v15)) {
    goto LABEL_2;
  }
  uint64_t v22 = objc_msgSend_strokeIndex(self, v16, v17, v18, v19, v20);
  if (v22 >= objc_msgSend_strokeIndex(v4, v23, v24, v25, v26, v27))
  {
    uint64_t v33 = objc_msgSend_pointIndex(self, v28, v29, v30, v31, v32);
    if (v33 > objc_msgSend_pointIndex(v4, v34, v35, v36, v37, v38))
    {
LABEL_2:

      return 1;
    }
    uint64_t v44 = objc_msgSend_pointIndex(self, v39, v40, v41, v42, v43);
    if (v44 >= objc_msgSend_pointIndex(v4, v45, v46, v47, v48, v49)) {
      int64_t v50 = 0;
    }
    else {
      int64_t v50 = -1;
    }

    return v50;
  }
  else
  {

    return -1;
  }
}

+ (id)sortedCHCutPointArray:(id)a3
{
  uint64_t v6 = objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1F2012A50, v3, v4, v5);
  return v6;
}

- (int64_t)strokeIndex
{
  return self->_strokeIndex;
}

- (int64_t)pointIndex
{
  return self->_pointIndex;
}

- (BOOL)isEndOfStroke
{
  return self->_isEndOfStroke;
}

@end