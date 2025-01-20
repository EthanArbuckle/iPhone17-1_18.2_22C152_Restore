@interface CUIPSDLayerRef
- (CGImage)createCGImage;
- (CUIPSDLayerRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4;
- (id)colorFill;
- (id)fillSample;
- (id)gradient;
- (id)image;
- (id)imageFromSlice:(unsigned int)a3;
- (id)imageFromSlice:(unsigned int)a3 isEmptyImage:(BOOL *)a4;
- (id)imageIsZeroSizeImage:(BOOL *)a3;
- (id)layerEffects;
- (id)maskFromSlice:(unsigned int)a3;
- (id)patternFromSlice:(unsigned int)a3;
- (id)patternFromSlice:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4;
- (void)dealloc;
@end

@implementation CUIPSDLayerRef

- (CUIPSDLayerRef)initWithImageRef:(id)a3 layerIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDLayerRef;
  v6 = [(CUIPSDLayerRef *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CUIPSDLayerBaseRef *)v6 setImageRef:a3];
    [(CUIPSDLayerBaseRef *)v7 setLayerIndex:v4];
  }
  return v7;
}

- (void)dealloc
{
  [(CUIPSDLayerBaseRef *)self setImageRef:0];
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerRef;
  [(CUIPSDLayerBaseRef *)&v3 dealloc];
}

- (CGImage)createCGImage
{
  objc_super v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v4 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v3 _copyCGImageAtAbsoluteIndex:v4];
}

- (id)image
{
  objc_super v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v4 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v3 _imageAtAbsoluteIndex:v4 isZeroSizeImage:0];
}

- (id)imageIsZeroSizeImage:(BOOL *)a3
{
  v5 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v6 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v5 _imageAtAbsoluteIndex:v6 isZeroSizeImage:a3];
}

- (id)imageFromSlice:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v6 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v5 _imageFromSlice:v3 atAbsoluteIndex:v6 isEmptyImage:0];
}

- (id)imageFromSlice:(unsigned int)a3 isEmptyImage:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v8 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v7 _imageFromSlice:v5 atAbsoluteIndex:v8 isEmptyImage:a4];
}

- (id)patternFromSlice:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v6 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v5 _patternFromSlice:v3 atAbsoluteIndex:v6 isZeroSizeImage:0];
}

- (id)patternFromSlice:(unsigned int)a3 isZeroSizeImage:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v8 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v7 _patternFromSlice:v5 atAbsoluteIndex:v8 isZeroSizeImage:a4];
}

- (id)maskFromSlice:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v6 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v5 _createMaskFromSlice:v3 atAbsoluteIndex:v6];
}

- (id)fillSample
{
  uint64_t v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v4 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v3 _fillSampleAtAbsoluteIndex:v4];
}

- (id)gradient
{
  uint64_t v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v4 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v3 _gradientAtAbsoluteIndex:v4];
}

- (id)layerEffects
{
  uint64_t v3 = [(CUIPSDLayerBaseRef *)self imageRef];
  uint64_t v4 = [(CUIPSDLayerBaseRef *)self layerIndex];
  return [(CUIPSDImageRef *)v3 _layerEffectsAtAbsoluteIndex:v4];
}

- (id)colorFill
{
  id result = [(CUIPSDImageRef *)[(CUIPSDLayerBaseRef *)self imageRef] psdFile];
  if (result)
  {
    id result = CPSDFile::GetColorFillInfo((CPSDFile *)result, [(CUIPSDLayerBaseRef *)self layerIndex]);
    if (result) {
      return [(CUIPSDImageRef *)[(CUIPSDLayerBaseRef *)self imageRef] colorFromDocumentColor:v4];
    }
  }
  return result;
}

@end