@interface HKElectrocardiogramWaveformView
- (CGRect)lastPathBounds;
- (CGRect)pathBounds;
- (CGSize)intrinsicContentSize;
- (HKElectrocardiogramWaveformView)initWithFrame:(CGRect)a3;
- (NSArray)shapeLayers;
- (UIColor)lineColor;
- (double)lineWidth;
- (id)createShapeLayerWithPath:(id)a3;
- (void)setLastPathBounds:(CGRect)a3;
- (void)setLineColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setPathBounds:(CGRect)a3;
- (void)setPaths:(id)a3;
- (void)setShapeLayers:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HKElectrocardiogramWaveformView

- (HKElectrocardiogramWaveformView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKElectrocardiogramWaveformView;
  result = -[HKElectrocardiogramWaveformView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_lineWidth = 1.5;
    CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_pathBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_pathBounds.size = v4;
    result->_lastPathBounds.origin = v5;
    result->_lastPathBounds.size = v4;
  }
  return result;
}

- (id)createShapeLayerWithPath:(id)a3
{
  CGSize v4 = (objc_class *)MEMORY[0x1E4F39C88];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setFillColor:0];
  [(HKElectrocardiogramWaveformView *)self lineWidth];
  objc_msgSend(v6, "setLineWidth:");
  id v7 = [(HKElectrocardiogramWaveformView *)self lineColor];
  uint64_t v8 = [v7 CGColor];
  if (v8)
  {
    [v6 setStrokeColor:v8];
  }
  else
  {
    id v9 = [(HKElectrocardiogramWaveformView *)self tintColor];
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v9, "CGColor"));
  }
  [v6 setLineJoin:*MEMORY[0x1E4F3A478]];
  id v10 = v5;
  uint64_t v11 = [v10 CGPath];

  [v6 setPath:v11];
  v12 = [(HKElectrocardiogramWaveformView *)self layer];
  [v12 addSublayer:v6];

  return v6;
}

- (void)setPaths:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(HKElectrocardiogramWaveformView *)self shapeLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v21 = -[HKElectrocardiogramWaveformView createShapeLayerWithPath:](self, "createShapeLayerWithPath:", v20, (void)v26);
        [v10 addObject:v21];

        [v20 bounds];
        v39.origin.double x = v22;
        v39.origin.double y = v23;
        v39.size.double width = v24;
        v39.size.double height = v25;
        v37.origin.double x = x;
        v37.origin.double y = y;
        v37.size.double width = width;
        v37.size.double height = height;
        CGRect v38 = CGRectUnion(v37, v39);
        double x = v38.origin.x;
        double y = v38.origin.y;
        double width = v38.size.width;
        double height = v38.size.height;
        [v20 bounds];
        -[HKElectrocardiogramWaveformView setLastPathBounds:](self, "setLastPathBounds:");
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  -[HKElectrocardiogramWaveformView setPathBounds:](self, "setPathBounds:", x, y, width, height);
  [(HKElectrocardiogramWaveformView *)self setShapeLayers:v10];
  [(HKElectrocardiogramWaveformView *)self invalidateIntrinsicContentSize];
}

- (void)setLineWidth:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_lineWidth = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(HKElectrocardiogramWaveformView *)self shapeLayers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setLineWidth:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setLineColor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_lineColor, a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(HKElectrocardiogramWaveformView *)self shapeLayers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [v5 CGColor];
        if (v12)
        {
          [v11 setStrokeColor:v12];
        }
        else
        {
          id v13 = [(HKElectrocardiogramWaveformView *)self tintColor];
          objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v13, "CGColor"));
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (CGSize)intrinsicContentSize
{
  [(HKElectrocardiogramWaveformView *)self pathBounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramWaveformView;
  [(HKElectrocardiogramWaveformView *)&v15 tintColorDidChange];
  double v3 = [(HKElectrocardiogramWaveformView *)self lineColor];

  if (!v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v4 = [(HKElectrocardiogramWaveformView *)self shapeLayers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          id v10 = [(HKElectrocardiogramWaveformView *)self tintColor];
          objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (NSArray)shapeLayers
{
  return self->_shapeLayers;
}

- (void)setShapeLayers:(id)a3
{
}

- (CGRect)pathBounds
{
  double x = self->_pathBounds.origin.x;
  double y = self->_pathBounds.origin.y;
  double width = self->_pathBounds.size.width;
  double height = self->_pathBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPathBounds:(CGRect)a3
{
  self->_pathBounds = a3;
}

- (CGRect)lastPathBounds
{
  double x = self->_lastPathBounds.origin.x;
  double y = self->_lastPathBounds.origin.y;
  double width = self->_lastPathBounds.size.width;
  double height = self->_lastPathBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastPathBounds:(CGRect)a3
{
  self->_lastPathBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayers, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
}

@end