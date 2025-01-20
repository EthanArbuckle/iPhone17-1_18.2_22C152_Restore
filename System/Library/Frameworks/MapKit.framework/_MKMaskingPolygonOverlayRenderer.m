@interface _MKMaskingPolygonOverlayRenderer
- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4;
- (BOOL)_canProvideVectorGeometry;
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (id)_vectorGeometry;
- (id)vectorDataForOverlay:(id)a3;
- (int64_t)style;
- (void)setStyle:(int64_t)a3;
@end

@implementation _MKMaskingPolygonOverlayRenderer

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(VKVectorOverlayMaskingPolygonGroup *)self->_vectorData setStyle:a3 == 1];
  }
}

- (BOOL)_canProvideVectorGeometry
{
  return 1;
}

- (id)_vectorGeometry
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  vectorData = self->_vectorData;
  if (!vectorData)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [(MKOverlayRenderer *)self overlay];
    v6 = [v5 polygons];
    v7 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v8 = [(MKOverlayRenderer *)self overlay];
    v9 = [v8 polygons];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v15 = objc_alloc(MEMORY[0x1E4FB3AB8]);
          id v16 = v14;
          v17 = objc_msgSend(v15, "initWithMapPoints:count:", objc_msgSend(v16, "points"), objc_msgSend(v16, "pointCount"));
          [v7 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    v18 = (VKVectorOverlayMaskingPolygonGroup *)[objc_alloc(MEMORY[0x1E4FB3AB0]) initWithPolygons:v7];
    v19 = self->_vectorData;
    self->_vectorData = v18;

    [(VKVectorOverlayMaskingPolygonGroup *)self->_vectorData setStyle:[(_MKMaskingPolygonOverlayRenderer *)self style] == 1];
    [(VKVectorOverlayMaskingPolygonGroup *)self->_vectorData setFillMode:1];

    vectorData = self->_vectorData;
  }

  return vectorData;
}

- (id)vectorDataForOverlay:(id)a3
{
  if ([(_MKMaskingPolygonOverlayRenderer *)self _canProvideVectorGeometry])
  {
    v4 = [(_MKMaskingPolygonOverlayRenderer *)self _vectorGeometry];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  int64_t v10 = [(_MKMaskingPolygonOverlayRenderer *)self style];
  if (v10 != 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKMaskingPolygonOverlayRenderer;
    LOBYTE(v10) = -[MKOverlayRenderer canDrawMapRect:zoomScale:](&v12, sel_canDrawMapRect_zoomScale_, v8, v7, var0, var1, a4);
  }
  return v10;
}

- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  int64_t v10 = [(_MKMaskingPolygonOverlayRenderer *)self style];
  if (v10 != 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKMaskingPolygonOverlayRenderer;
    LOBYTE(v10) = -[MKOverlayRenderer _canPossiblyDrawMapRect:zoomScale:](&v12, sel__canPossiblyDrawMapRect_zoomScale_, v8, v7, var0, var1, a4);
  }
  return v10;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end