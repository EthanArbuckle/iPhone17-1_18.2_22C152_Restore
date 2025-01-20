@interface CUIPSDLayerBaseRef
- (BOOL)hasLayerMask;
- (BOOL)hasVectorMask;
- (BOOL)isLayerGroup;
- (BOOL)visibility;
- (CGImage)_createMaskFromAlphaChannel:(int64_t)a3;
- (CGRect)bounds;
- (CUIPSDImageRef)imageRef;
- (double)fillOpacity;
- (double)opacity;
- (id)_psdImageRef;
- (id)layerMaskRef;
- (id)name;
- (id)vectorMaskRef;
- (int)blendMode;
- (unsigned)layerIndex;
- (void)_psdLayerRecord;
- (void)dealloc;
- (void)setImageRef:(id)a3;
- (void)setLayerIndex:(unsigned int)a3;
@end

@implementation CUIPSDLayerBaseRef

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerBaseRef;
  [(CUIPSDLayerBaseRef *)&v3 dealloc];
}

- (void)_psdLayerRecord
{
  return [(CUIPSDImageRef *)self->_imageRef _psdLayerRecordAtAbsoluteIndex:self->_layerIndex];
}

- (id)_psdImageRef
{
  return self->_imageRef;
}

- (id)name
{
  return [(CUIPSDImageRef *)self->_imageRef _nameAtAbsoluteIndex:self->_layerIndex];
}

- (BOOL)isLayerGroup
{
  return 0;
}

- (CGRect)bounds
{
  [(CUIPSDImageRef *)self->_imageRef _boundsAtAbsoluteIndex:self->_layerIndex];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)visibility
{
  return [(CUIPSDImageRef *)self->_imageRef _visibilityAtAbsoluteIndex:self->_layerIndex];
}

- (double)opacity
{
  [(CUIPSDImageRef *)self->_imageRef _opacityAtAbsoluteIndex:self->_layerIndex];
  return result;
}

- (double)fillOpacity
{
  [(CUIPSDImageRef *)self->_imageRef _fillOpacityAtAbsoluteIndex:self->_layerIndex];
  return result;
}

- (int)blendMode
{
  return [(CUIPSDImageRef *)self->_imageRef _blendModeAtAbsluteIndex:self->_layerIndex];
}

- (BOOL)hasLayerMask
{
  double v3 = (CPSDLayerMaskData *)((char *)[(CUIPSDLayerBaseRef *)self _psdLayerRecord] + 80);
  return (CPSDLayerMaskData::GetMaskCount(v3) != 1
       || ![(CUIPSDLayerBaseRef *)self hasVectorMask])
      && CPSDLayerMaskData::GetMaskCount(v3) != 0;
}

- (BOOL)hasVectorMask
{
  double v2 = [(CUIPSDLayerBaseRef *)self _psdLayerRecord];
  if (v2) {
  return (char)v2;
  }
}

- (id)layerMaskRef
{
  if (![(CUIPSDLayerBaseRef *)self hasLayerMask]) {
    return 0;
  }
  id v3 = [[CUIPSDLayerMaskRef alloc] initLayerMaskWithLayerRef:self];
  return v3;
}

- (id)vectorMaskRef
{
  if (![(CUIPSDLayerBaseRef *)self hasVectorMask]) {
    return 0;
  }
  id v3 = [[CUIPSDLayerMaskRef alloc] initVectorMaskWithLayerRef:self];
  return v3;
}

- (CGImage)_createMaskFromAlphaChannel:(int64_t)a3
{
  double v5 = [(CUIPSDImageRef *)self->_imageRef psdFile];
  v6 = [(CUIPSDLayerBaseRef *)self _psdLayerRecord];
  int64_t v7 = v6[16];
  uint64_t v8 = v5[77];
  if (CPSDLayerRecord::GetTransparencyMask((CPSDLayerRecord *)v6)) {
    int64_t v9 = v8 + a3 + 1;
  }
  else {
    int64_t v9 = v8 + a3;
  }
  if (v9 >= v7) {
    return 0;
  }
  CPSDLayerInfo::CreateImageAtLayer((CPSDLayerInfo *)(v5 + 124), self->_layerIndex);
  if (result)
  {
    uint64_t v11 = (*(uint64_t (**)(CGImage *, int64_t))(*(void *)result + 24))(result, v9);
    return (CGImage *)(*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
  }
  return result;
}

- (CUIPSDImageRef)imageRef
{
  return self->_imageRef;
}

- (void)setImageRef:(id)a3
{
}

- (unsigned)layerIndex
{
  return self->_layerIndex;
}

- (void)setLayerIndex:(unsigned int)a3
{
  self->_layerIndex = a3;
}

@end