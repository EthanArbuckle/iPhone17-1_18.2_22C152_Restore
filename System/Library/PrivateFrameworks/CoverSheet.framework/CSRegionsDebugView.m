@interface CSRegionsDebugView
- (CSRegionsDebugView)initWithFrame:(CGRect)a3;
- (NSArray)regions;
- (void)drawRect:(CGRect)a3;
- (void)setRegions:(id)a3;
@end

@implementation CSRegionsDebugView

- (CSRegionsDebugView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSRegionsDebugView;
  v3 = -[CSRegionsDebugView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(CSRegionsDebugView *)v3 setBackgroundColor:v4];

    [(CSRegionsDebugView *)v3 bs_setHitTestingDisabled:1];
  }
  return v3;
}

- (void)setRegions:(id)a3
{
  v5 = (NSArray *)a3;
  p_regions = &self->_regions;
  if (self->_regions != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_regions, a3);
    p_regions = (NSArray **)[(CSRegionsDebugView *)self setNeedsDisplay];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_regions, v5);
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.3];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v6 = self->_regions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "extent", (void)v11);
        CGContextFillRect(CurrentContext, v17);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSArray)regions
{
  return self->_regions;
}

- (void).cxx_destruct
{
}

@end