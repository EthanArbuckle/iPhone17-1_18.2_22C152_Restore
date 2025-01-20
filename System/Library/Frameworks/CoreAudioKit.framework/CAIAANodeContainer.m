@interface CAIAANodeContainer
+ (void)initialize;
- (CAIAANodeContainer)initWithFrame:(CGRect)a3;
- (double)contentWidth;
- (double)minWidth;
- (int64_t)numPages;
- (void)layoutSubviews;
- (void)setNumPages:(int64_t)a3;
@end

@implementation CAIAANodeContainer

+ (void)initialize
{
  [MEMORY[0x263F82670] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F82670], "currentDevice"), "userInterfaceIdiom"))
  {
    uint64_t v2 = 0x4053000000000000;
  }
  else
  {
    uint64_t v2 = 0x404E000000000000;
  }
  _minWidth = v2;
}

- (CAIAANodeContainer)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAIAANodeContainer;
  v3 = -[CAIAANodeContainer initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAIAANodeContainer *)v3 setNumPages:1];
    [(CAIAANodeContainer *)v4 setShowsHorizontalScrollIndicator:0];
    [(CAIAANodeContainer *)v4 setShowsVerticalScrollIndicator:0];
    [(CAIAANodeContainer *)v4 setPagingEnabled:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)CAIAANodeContainer;
  [(CAIAANodeContainer *)&v43 layoutSubviews];
  v3 = (void *)[(CAIAANodeContainer *)self subviews];
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v6);
  }
  double v10 = *(double *)&_minWidth + 12.0;
  double v11 = (double)(unint64_t)[v4 count];
  double v12 = (double)(unint64_t)(3 * [v4 count] - 3) + v10 * v11;
  [(CAIAANodeContainer *)self frame];
  if (v13 - v12 + -6.0 >= 0.0)
  {
    [(CAIAANodeContainer *)self setNumPages:1];
    [(CAIAANodeContainer *)self frame];
    -[CAIAANodeContainer setContentSize:](self, "setContentSize:", v20, v21);
    unint64_t v16 = [v4 count];
  }
  else
  {
    [(CAIAANodeContainer *)self frame];
    float v15 = (v14 + -20.0 - (*(double *)&_minWidth + 12.0)) / (*(double *)&_minWidth + 6.0);
    unint64_t v16 = vcvtms_u32_f32(v15);
    float v17 = (double)(unint64_t)[v4 count] / (double)v16;
    [(CAIAANodeContainer *)self setNumPages:vcvtps_s32_f32(v17)];
    [(CAIAANodeContainer *)self frame];
    -[CAIAANodeContainer setContentSize:](self, "setContentSize:", v18 * (double)[(CAIAANodeContainer *)self numPages], v19);
  }
  if ([(CAIAANodeContainer *)self numPages])
  {
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    double v24 = 0.0;
    do
    {
      if (v23 == [(CAIAANodeContainer *)self numPages] - 1) {
        unint64_t v16 = [v4 count] - v22;
      }
      double v25 = *(double *)&_minWidth;
      [(CAIAANodeContainer *)self frame];
      if (v16)
      {
        double v27 = v26 - ((double)(3 * v16 - 3) + (v25 + 12.0) * (double)v16) + -6.0;
        float v28 = v27 / (double)v16 * 0.5;
        double v29 = floorf(v28);
        if (v29 + v29 > 14.0) {
          double v29 = 14.0;
        }
        float v30 = (v27 + v29 * -2.0 * (double)v16) * 0.5;
        double v31 = v24 + floorf(v30) + 3.0;
        double v32 = v29 + 6.0;
        uint64_t v33 = v22;
        unint64_t v34 = v16;
        do
        {
          v35 = (void *)[v4 objectAtIndexedSubscript:v33];
          double v36 = *(double *)&_minWidth + v32 * 2.0;
          [(CAIAANodeContainer *)self frame];
          objc_msgSend(v35, "setFrame:", v31, 0.0, v36);
          [v35 frame];
          double v31 = v31 + v37 + 3.0;
          ++v33;
          --v34;
        }
        while (v34);
      }
      v22 += v16;
      [(CAIAANodeContainer *)self frame];
      double v24 = v24 + v38;
      ++v23;
    }
    while (v23 < [(CAIAANodeContainer *)self numPages]);
  }
}

- (double)contentWidth
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[(CAIAANodeContainer *)self subviews];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  if (![v3 count]) {
    return 0.0;
  }
  double v9 = *(double *)&_minWidth + 12.0;
  double v10 = (double)(unint64_t)[v3 count];
  return (double)(unint64_t)(3 * [v3 count] - 3) + v9 * v10;
}

- (double)minWidth
{
  return *(double *)&_minWidth;
}

- (int64_t)numPages
{
  return self->_numPages;
}

- (void)setNumPages:(int64_t)a3
{
  self->_numPages = a3;
}

@end