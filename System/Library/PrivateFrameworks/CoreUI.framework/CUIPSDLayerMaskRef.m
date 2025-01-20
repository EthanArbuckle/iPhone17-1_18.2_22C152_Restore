@interface CUIPSDLayerMaskRef
- (BOOL)isEnabled;
- (BOOL)isInvertedWhenBlending;
- (BOOL)isLinked;
- (CGImage)createCGImageMask;
- (CGPath)newBezierPath;
- (CGPath)newBezierPathAtScale:(double)a3;
- (CGRect)bounds;
- (id)initLayerMaskWithLayerRef:(id)a3;
- (id)initVectorMaskWithLayerRef:(id)a3;
- (id)layerRef;
- (void)dealloc;
@end

@implementation CUIPSDLayerMaskRef

- (id)initLayerMaskWithLayerRef:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerMaskRef;
  v4 = [(CUIPSDLayerMaskRef *)&v6 init];
  if (v4)
  {
    v4->_layerRef = (CUIPSDLayerRef *)a3;
    v4->_isVectorMask = 0;
  }
  return v4;
}

- (id)initVectorMaskWithLayerRef:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDLayerMaskRef;
  v4 = [(CUIPSDLayerMaskRef *)&v6 init];
  if (v4)
  {
    v4->_layerRef = (CUIPSDLayerRef *)a3;
    v4->_isVectorMask = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerMaskRef;
  [(CUIPSDLayerMaskRef *)&v3 dealloc];
}

- (id)layerRef
{
  return self->_layerRef;
}

- (BOOL)isLinked
{
  v2 = [(CUIPSDLayerBaseRef *)self->_layerRef _psdLayerRecord];
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return v2[117] & 1;
}

- (BOOL)isEnabled
{
  v2 = [(CUIPSDLayerBaseRef *)self->_layerRef _psdLayerRecord];
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return (v2[117] & 2) == 0;
}

- (BOOL)isInvertedWhenBlending
{
  v2 = [(CUIPSDLayerBaseRef *)self->_layerRef _psdLayerRecord];
  CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v2 + 80));
  return (v2[117] & 3) == 1;
}

- (CGRect)bounds
{
  objc_super v3 = [(CUIPSDLayerBaseRef *)self->_layerRef _psdLayerRecord];
  if (CPSDLayerMaskData::GetMaskCount((CPSDLayerMaskData *)(v3 + 20)) == 2 && !self->_isVectorMask)
  {
    v4 = v3 + 30;
    v5 = v3 + 31;
    objc_super v6 = v3 + 32;
    v7 = v3 + 33;
  }
  else
  {
    v4 = v3 + 25;
    v5 = v3 + 26;
    objc_super v6 = v3 + 27;
    v7 = v3 + 28;
  }
  unsigned int v8 = *v5;
  unsigned int v9 = *v4;
  double v10 = (double)v8;
  double v11 = (double)v9;
  double v12 = (double)(*v7 - v8);
  double v13 = (double)(*v6 - v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPath)newBezierPath
{
  return [(CUIPSDLayerMaskRef *)self newBezierPathAtScale:1.0];
}

- (CGPath)newBezierPathAtScale:(double)a3
{
  if (!self->_isVectorMask) {
    return 0;
  }
  Mutable = CGPathCreateMutable();
  unsigned int v9 = *((unsigned __int16 *)FirstItemOfTypeID + 44);
  objc_msgSend(-[CUIPSDLayerBaseRef _psdImageRef](self->_layerRef, "_psdImageRef"), "size");
  if (v9)
  {
    unsigned __int16 v12 = 0;
    double v13 = v10 * a3;
    double v14 = v11 * a3;
    do
    {
      uint64_t Subpath = CPSDPathsResourceItem::GetSubpath((CPSDPathsResourceItem *)(FirstItemOfTypeID + 7), v12);
      unsigned int v16 = *(unsigned __int8 *)(Subpath + 18);
      v17 = CGPathCreateMutable();
      unsigned int v18 = 0;
      do
      {
        if (v18 == v16) {
          unsigned __int16 v19 = 0;
        }
        else {
          unsigned __int16 v19 = v18;
        }
        CPSDPathResource::GetBezierKnot(Subpath, v19, &v26, &v25, &v27);
        long long v20 = v26;
        memset(&v24, 0, sizeof(v24));
        CGAffineTransformMakeScale(&v24, v13, v14);
        if (v18) {
          CGPathAddCurveToPoint(v17, &v24, v4, v3, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
        }
        else {
          CGPathMoveToPoint(v17, &v24, *(CGFloat *)&v20, *((CGFloat *)&v20 + 1));
        }
        CGFloat v3 = *((double *)&v27 + 1);
        CGFloat v4 = *(double *)&v27;
      }
      while (v18++ < v16);
      CGPathCloseSubpath(v17);
      CGPathAddPath(Mutable, 0, v17);
      CGPathRelease(v17);
      ++v12;
    }
    while (v9 > v12);
  }
  v22 = (CGPath *)MEMORY[0x1A62305F0](Mutable);
  CGPathRelease(Mutable);
  return v22;
}

- (CGImage)createCGImageMask
{
  if (self->_isVectorMask) {
    return 0;
  }
  layerRef = self->_layerRef;
  uint64_t v4 = [(CUIPSDLayerBaseRef *)layerRef hasVectorMask];
  return [(CUIPSDLayerBaseRef *)layerRef _createMaskFromAlphaChannel:v4];
}

@end