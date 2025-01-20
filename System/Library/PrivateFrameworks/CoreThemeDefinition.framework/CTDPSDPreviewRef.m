@interface CTDPSDPreviewRef
- (BOOL)hasGradient;
- (BOOL)hasRegularSliceGrid;
- (CTDPSDPreviewRef)initWithPath:(id)a3;
- (int64_t)indexOfDrawingLayerType:(int64_t)a3;
- (int64_t)numberOfAlphaChannels;
- (int64_t)numberOfGradientLayers;
- (int64_t)sliceColumnCount;
- (int64_t)sliceRowCount;
- (void)dealloc;
- (void)evaluateSliceGrid;
@end

@implementation CTDPSDPreviewRef

- (CTDPSDPreviewRef)initWithPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTDPSDPreviewRef;
  v3 = [(CUIPSDImageRef *)&v6 initWithPath:a3];
  v4 = v3;
  if (v3) {
    [(CTDPSDPreviewRef *)v3 evaluateSliceGrid];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CTDPSDPreviewRef;
  [(CUIPSDImageRef *)&v3 dealloc];
}

- (int64_t)sliceRowCount
{
  return self->_sliceRowCount;
}

- (int64_t)sliceColumnCount
{
  return self->_sliceColumnCount;
}

- (void)evaluateSliceGrid
{
  p_imageInfo = &self->_imageInfo;
  if (self)
  {
    [(CUIPSDImageRef *)self imageInfo];
  }
  else
  {
    long long v25 = 0uLL;
    int v26 = 0;
  }
  *(_OWORD *)&p_imageInfo->width = v25;
  p_imageInfo->isDrawable = v26;
  unsigned int v4 = [(CUIPSDImageRef *)self numberOfSlices];
  if (v4 <= 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = v4;
  }
  self->_sliceCount = v5;
  self->_layerCount = [(CUIPSDImageRef *)self numberOfLayers];
  self->_columnWidth = p_imageInfo->width + 10;
  self->_rowHeight = p_imageInfo->height + 20;
  objc_super v6 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:self->_sliceCount - 1];
  if (self->_sliceCount >= 2)
  {
    int64_t v7 = 0;
    int64_t v8 = -1;
    int64_t v9 = 1;
    do
    {
      [(CUIPSDImageRef *)self boundsForSlice:v9];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      objc_msgSend((id)objc_msgSend(v6, "lastObject"), "rectValue");
      if ((unint64_t)v9 >= 2)
      {
        double v19 = v18;
        uint64_t v20 = [v6 count];
        int64_t v21 = v9 - 1;
        if (v8 >= 0) {
          int64_t v21 = v8;
        }
        if (v13 == v19) {
          int64_t v22 = v7;
        }
        else {
          int64_t v22 = v7 + 1;
        }
        if (v13 == v19) {
          int64_t v21 = v8;
        }
        if (v20)
        {
          int64_t v7 = v22;
          int64_t v8 = v21;
        }
      }
      if (v8 >= 1)
      {
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", (v9 - 1) % v8), "rectValue");
        if (v11 != v23)
        {
          int64_t v7 = -1;
          goto LABEL_25;
        }
      }
      objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v11, v13, v15, v17));
      ++v9;
    }
    while (v9 < self->_sliceCount);
    if (v7) {
      goto LABEL_25;
    }
  }
  int64_t v8 = [v6 count];
  int64_t v7 = 0;
LABEL_25:
  if ([v6 count] && !(objc_msgSend(v6, "count") % (unint64_t)v8))
  {
    if ((v7 & 0x8000000000000000) == 0)
    {
      self->_columnWidth += v8 + 1;
      int64_t v24 = v7 + self->_rowHeight;
      ++v7;
      self->_rowHeight = v24 + 2;
    }
  }
  else
  {
    int64_t v7 = -1;
  }
  self->_sliceRowCount = v7;
  self->_sliceColumnCount = v8;

  self->_sliceRects = (NSArray *)[v6 copy];
}

- (BOOL)hasRegularSliceGrid
{
  int64_t sliceRowCount = self->_sliceRowCount;
  if (!sliceRowCount)
  {
    [(CTDPSDPreviewRef *)self evaluateSliceGrid];
    int64_t sliceRowCount = self->_sliceRowCount;
  }
  return sliceRowCount > 0;
}

- (BOOL)hasGradient
{
  if (![(CUIPSDImageRef *)self numberOfLayers]) {
    return 0;
  }
  unsigned int v3 = 0;
  do
  {
    id v4 = [(CUIPSDImageRef *)self gradientAtLayer:0];
    BOOL v5 = v4 != 0;
    if (v4) {
      break;
    }
    ++v3;
  }
  while (v3 < [(CUIPSDImageRef *)self numberOfLayers]);
  return v5;
}

- (int64_t)numberOfGradientLayers
{
  if (![(CUIPSDImageRef *)self numberOfLayers]) {
    return 0;
  }
  unsigned int v3 = 0;
  int64_t v4 = 0;
  do
  {
    if ([(CUIPSDImageRef *)self gradientAtLayer:0]) {
      ++v4;
    }
    ++v3;
  }
  while (v3 < [(CUIPSDImageRef *)self numberOfLayers]);
  return v4;
}

- (int64_t)numberOfAlphaChannels
{
  return [(CUIPSDImageRef *)self numberOfChannels] - 4;
}

- (int64_t)indexOfDrawingLayerType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [(CUIPSDImageRef *)self layerNames];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 rangeOfString:indexOfDrawingLayerType__drawingLayerNames[a3]] != 0x7FFFFFFFFFFFFFFFLL) {
          return [v4 indexOfObject:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

@end