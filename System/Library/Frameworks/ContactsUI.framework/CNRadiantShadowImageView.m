@interface CNRadiantShadowImageView
- (CNRadiantShadowImageView)init;
- (void)applyAffineTransform;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)updateLayerFilters;
@end

@implementation CNRadiantShadowImageView

- (void)applyAffineTransform
{
  [(CNRadiantShadowImageView *)self frame];
  CGFloat v4 = v3 * 0.015;
  [(CNRadiantShadowImageView *)self frame];
  CGFloat v6 = v5 * 0.015;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, 1.05, 1.05);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, v6, v4);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransform t1 = v14;
  CGAffineTransform t2 = v13;
  CGAffineTransformConcat(&v12, &t1, &t2);
  CGAffineTransform v9 = v12;
  v7 = [(CNRadiantShadowImageView *)self layer];
  CGAffineTransform v8 = v9;
  [v7 setAffineTransform:&v8];
}

- (void)updateLayerFilters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGFloat v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v4 setValue:@"low" forKeyPath:*MEMORY[0x1E4F3A1D0]];
  [v4 setValue:&unk_1ED915580 forKeyPath:*MEMORY[0x1E4F3A1D8]];
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  [v4 setValue:MEMORY[0x1E4F1CC28] forKeyPath:*MEMORY[0x1E4F3A1A0]];
  [v4 setValue:v5 forKeyPath:*MEMORY[0x1E4F3A1B8]];
  [v4 setValue:v5 forKeyPath:*MEMORY[0x1E4F3A170]];
  [v4 setValue:v5 forKeyPath:*MEMORY[0x1E4F3A1B0]];
  [v3 addObject:v4];
  CGFloat v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
  [v6 setValue:&unk_1ED915590 forKeyPath:*MEMORY[0x1E4F3A100]];
  [v3 addObject:v6];

  v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  v11[0] = xmmword_18B9C3730;
  v11[1] = xmmword_18B9C3740;
  v11[2] = xmmword_18B9C3750;
  v11[3] = xmmword_18B9C3760;
  v11[4] = xmmword_18B9BE5D0;
  CGAffineTransform v8 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v11];
  [v7 setValue:v8 forKey:*MEMORY[0x1E4F3A168]];
  [v3 addObject:v7];

  [(CNRadiantShadowImageView *)self setAlpha:0.3];
  CGAffineTransform v9 = (void *)[v3 copy];
  v10 = [(CNRadiantShadowImageView *)self layer];
  [v10 setFilters:v9];
}

- (void)setImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNRadiantShadowImageView;
  [(CNRadiantShadowImageView *)&v4 setImage:a3];
  [(CNRadiantShadowImageView *)self updateLayerFilters];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNRadiantShadowImageView;
  [(CNRadiantShadowImageView *)&v3 layoutSubviews];
  [(CNRadiantShadowImageView *)self applyAffineTransform];
}

- (CNRadiantShadowImageView)init
{
  v8.receiver = self;
  v8.super_class = (Class)CNRadiantShadowImageView;
  v2 = -[CNRadiantShadowImageView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v3 = v2;
  if (v2)
  {
    [(CNRadiantShadowImageView *)v2 setContentMode:2];
    objc_super v4 = [(CNRadiantShadowImageView *)v3 layer];
    [v4 setShouldRasterize:1];

    uint64_t v5 = [(CNRadiantShadowImageView *)v3 layer];
    [v5 setRasterizationScale:0.5];

    CGFloat v6 = v3;
  }

  return v3;
}

@end