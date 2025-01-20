@interface NSCollectionLayoutAnchor
+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3;
+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 offset:(CGPoint)a4;
+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 unitOffset:(CGPoint)a4;
+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges;
+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges absoluteOffset:(CGPoint)absoluteOffset;
+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges fractionalOffset:(CGPoint)fractionalOffset;
- (BOOL)isAbsoluteOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)offsetIsUnitOffset;
- (CGPoint)anchorPoint;
- (CGPoint)offset;
- (CGRect)_itemFrameForContainerRect:(CGRect)a3 itemSize:(CGSize)a4 itemLayoutAnchor:(id)a5;
- (NSCollectionLayoutAnchor)initWithEdges:(unint64_t)a3 offset:(CGPoint)a4 anchorPoint:(CGPoint)a5 offsetIsUnitOffset:(BOOL)a6;
- (NSDirectionalRectEdge)edges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOffsetIsUnitOffset:(BOOL)a3;
@end

@implementation NSCollectionLayoutAnchor

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), x, y);
  return (NSCollectionLayoutAnchor *)v6;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges
{
  int8x16_t v4 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  int8x16_t v14 = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_20BE345E0)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_20BE345F0)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_20BE34600), (int64x2_t)xmmword_20BE34600)));
  id v11 = objc_alloc((Class)a1);
  v12 = objc_msgSend(v11, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *(_OWORD *)&v14);
  return (NSCollectionLayoutAnchor *)v12;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges absoluteOffset:(CGPoint)absoluteOffset
{
  double x = absoluteOffset.x;
  int8x16_t v5 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  v12 = objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 0, x, absoluteOffset.y, vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE345E0)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE345F0)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE34600), (int64x2_t)xmmword_20BE34600))));
  return (NSCollectionLayoutAnchor *)v12;
}

- (NSCollectionLayoutAnchor)initWithEdges:(unint64_t)a3 offset:(CGPoint)a4 anchorPoint:(CGPoint)a5 offsetIsUnitOffset:(BOOL)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)NSCollectionLayoutAnchor;
  result = [(NSCollectionLayoutAnchor *)&v13 init];
  if (result)
  {
    result->_edges = a3;
    result->_offset.CGFloat x = v10;
    result->_offset.CGFloat y = v9;
    result->_anchorPoint.CGFloat x = x;
    result->_anchorPoint.CGFloat y = y;
    result->_offsetIsUnitOffset = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int8x16_t v4 = (NSCollectionLayoutAnchor *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (NSDirectionalRectEdge v5 = [(NSCollectionLayoutAnchor *)self edges], v5 == [(NSCollectionLayoutAnchor *)v4 edges]))
    {
      [(NSCollectionLayoutAnchor *)self anchorPoint];
      double v7 = v6;
      double v9 = v8;
      [(NSCollectionLayoutAnchor *)v4 anchorPoint];
      LOBYTE(v11) = 0;
      if (v7 == v12 && v9 == v10)
      {
        [(NSCollectionLayoutAnchor *)self offset];
        double v14 = v13;
        double v16 = v15;
        [(NSCollectionLayoutAnchor *)v4 offset];
        LOBYTE(v11) = 0;
        if (v14 == v18 && v16 == v17)
        {
          BOOL v19 = [(NSCollectionLayoutAnchor *)self offsetIsUnitOffset];
          BOOL v11 = v19 ^ [(NSCollectionLayoutAnchor *)v4 offsetIsUnitOffset] ^ 1;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int8x16_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSDirectionalRectEdge v5 = [(NSCollectionLayoutAnchor *)self edges];
  [(NSCollectionLayoutAnchor *)self offset];
  double v7 = v6;
  double v9 = v8;
  [(NSCollectionLayoutAnchor *)self anchorPoint];
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(NSCollectionLayoutAnchor *)self offsetIsUnitOffset];
  return (id)objc_msgSend(v4, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", v5, v14, v7, v9, v11, v13);
}

- (CGRect)_itemFrameForContainerRect:(CGRect)a3 itemSize:(CGSize)a4 itemLayoutAnchor:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  CGFloat v7 = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v12 = (NSCollectionLayoutAnchor *)a5;
  [(NSCollectionLayoutAnchor *)self anchorPoint];
  double v14 = _CVCRectAnchorPointForUnitAnchorPoint(x, y, v8, v7, v13) - width * 0.5;
  double v16 = v15 - height * 0.5;
  if (v12) {
    double v17 = v12;
  }
  else {
    double v17 = self;
  }
  double v18 = v17;
  [(NSCollectionLayoutAnchor *)v18 anchorPoint];
  double v20 = _CVCRectAdjustWithAnchorPoint(v14, v16, width, height, v19);
  double v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  BOOL v27 = [(NSCollectionLayoutAnchor *)self offsetIsUnitOffset];
  [(NSCollectionLayoutAnchor *)self offset];
  double v29 = v28;
  double v31 = v30;
  if (v27)
  {
    v53.origin.CGFloat x = v20;
    v53.origin.CGFloat y = v22;
    v53.size.double width = v24;
    v53.size.double height = v26;
    double v29 = v29 * CGRectGetWidth(v53);
    v54.origin.CGFloat x = v20;
    v54.origin.CGFloat y = v22;
    v54.size.double width = v24;
    v54.size.double height = v26;
    double v31 = v31 * CGRectGetHeight(v54);
  }
  double v32 = *MEMORY[0x263F00148];
  double v33 = *(double *)(MEMORY[0x263F00148] + 8);
  if (*MEMORY[0x263F00148] != v29 || v33 != v31)
  {
    double v52 = v20 + v29;
    v55.origin.CGFloat x = v20;
    v55.origin.CGFloat y = v22;
    v55.size.double width = v24;
    v55.size.double height = v26;
    CGFloat v35 = CGRectGetWidth(v55);
    v56.origin.CGFloat x = v20;
    v56.origin.CGFloat y = v22;
    v56.size.double width = v24;
    v56.size.double height = v26;
    CGFloat v26 = CGRectGetHeight(v56);
    CGFloat v24 = v35;
    double v22 = v22 + v31;
    double v20 = v52;
  }
  if (v12)
  {
    [(NSCollectionLayoutAnchor *)v12 offset];
    if (v32 != v37 || v33 != v36)
    {
      BOOL v39 = [(NSCollectionLayoutAnchor *)v12 offsetIsUnitOffset];
      [(NSCollectionLayoutAnchor *)v12 offset];
      double v41 = v40;
      double v43 = v42;
      if (v39)
      {
        v57.origin.CGFloat x = v20;
        v57.origin.CGFloat y = v22;
        v57.size.double width = v24;
        v57.size.double height = v26;
        double v41 = v41 * CGRectGetWidth(v57);
        v58.origin.CGFloat x = v20;
        v58.origin.CGFloat y = v22;
        v58.size.double width = v24;
        v58.size.double height = v26;
        double v43 = v43 * CGRectGetHeight(v58);
      }
      CGFloat v44 = v20;
      CGFloat v45 = v22;
      double v46 = v41;
      CGFloat v47 = v24;
      double v20 = v20 + v46;
      double v22 = v22 + v43;
      v59.origin.CGFloat x = v44;
      v59.origin.CGFloat y = v45;
      v59.size.double width = v24;
      v59.size.double height = v26;
      CGFloat v24 = CGRectGetWidth(v59);
      v60.origin.CGFloat x = v44;
      v60.origin.CGFloat y = v45;
      v60.size.double width = v47;
      v60.size.double height = v26;
      CGFloat v26 = CGRectGetHeight(v60);
    }
  }

  double v48 = v20;
  double v49 = v22;
  double v50 = v24;
  double v51 = v26;
  result.size.double height = v51;
  result.size.double width = v50;
  result.origin.CGFloat y = v49;
  result.origin.CGFloat x = v48;
  return result;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)offsetIsUnitOffset
{
  return self->_offsetIsUnitOffset;
}

- (NSDirectionalRectEdge)edges
{
  return self->_edges;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges fractionalOffset:(CGPoint)fractionalOffset
{
  double x = fractionalOffset.x;
  int8x16_t v5 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  double v12 = objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 1, x, fractionalOffset.y, vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE345E0)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE345F0)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_20BE34600), (int64x2_t)xmmword_20BE34600))));
  return (NSCollectionLayoutAnchor *)v12;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 offset:(CGPoint)a4
{
  int8x16_t v4 = objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 0, a4.x, a4.y, a3.x, a3.y);
  return (NSCollectionLayoutAnchor *)v4;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 unitOffset:(CGPoint)a4
{
  int8x16_t v4 = objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 1, a4.x, a4.y, a3.x, a3.y);
  return (NSCollectionLayoutAnchor *)v4;
}

- (BOOL)isAbsoluteOffset
{
  return ![(NSCollectionLayoutAnchor *)self offsetIsUnitOffset];
}

- (id)description
{
  v3 = NSString;
  int8x16_t v4 = (objc_class *)objc_opt_class();
  int8x16_t v5 = NSStringFromClass(v4);
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSCollectionLayoutAnchor edges](self, "edges"));
  [(NSCollectionLayoutAnchor *)self offset];
  double v9 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g}", 17, v7, 17, v8);
  [(NSCollectionLayoutAnchor *)self anchorPoint];
  double v12 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g}", 17, v10, 17, v11);
  double v13 = [v3 stringWithFormat:@"<%@ %p: edges=%@ offset=%@; anchorPoint=%@>", v5, self, v6, v9, v12];;

  return v13;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (void)setOffsetIsUnitOffset:(BOOL)a3
{
  self->_offsetIsUnitOffset = a3;
}

@end