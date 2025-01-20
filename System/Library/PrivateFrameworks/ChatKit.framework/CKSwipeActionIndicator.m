@interface CKSwipeActionIndicator
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CKSwipeActionIndicator)initWithFrame:(CGRect)a3;
- (CKSwipeActionIndicator)initWithImage:(id)a3;
- (double)blurRadius;
- (double)currentHorizontalTranslation;
- (double)currentScale;
- (void)_swipeActionIndicatorInit;
- (void)setBlurRadius:(double)a3;
- (void)setCurrentHorizontalTranslation:(double)a3;
- (void)setCurrentScale:(double)a3;
- (void)setTransformForScale:(double)a3 horizontalTranslation:(double)a4;
@end

@implementation CKSwipeActionIndicator

- (CKSwipeActionIndicator)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSwipeActionIndicator;
  v3 = -[CKSwipeActionIndicator initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CKSwipeActionIndicator *)v3 _swipeActionIndicatorInit];
  }
  return v4;
}

- (CKSwipeActionIndicator)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSwipeActionIndicator;
  v3 = [(CKSwipeActionIndicator *)&v6 initWithImage:a3];
  v4 = v3;
  if (v3) {
    [(CKSwipeActionIndicator *)v3 _swipeActionIndicatorInit];
  }
  return v4;
}

- (void)_swipeActionIndicatorInit
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(CKSwipeActionIndicator *)self setContentMode:1];
  v3 = [MEMORY[0x1E4F428B8] systemGray2Color];
  [(CKSwipeActionIndicator *)self setTintColor:v3];

  v4 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKSwipeActionIndicator *)self setBackgroundColor:v4];

  [(CKSwipeActionIndicator *)self setClipsToBounds:0];
  v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v5 setValue:&unk_1EDF16DD8 forKey:*MEMORY[0x1E4F3A1D8]];
  v8[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7 = [(CKSwipeActionIndicator *)self layer];
  [v7 setFilters:v6];

  self->_currentHorizontalTranslation = 0.0;
  self->_currentScale = 1.0;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  id v5 = [(CKSwipeActionIndicator *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (void)setTransformForScale:(double)a3 horizontalTranslation:(double)a4
{
  self->_double currentScale = a3;
  self->_currentHorizontalTranslation = a4;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v11.c = v6;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double currentScale = self->_currentScale;
  *(_OWORD *)&v10.a = *(_OWORD *)&v11.a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&v11.tx;
  CGAffineTransformScale(&v11, &v10, currentScale, currentScale);
  CGAffineTransform v9 = v11;
  CGAffineTransformTranslate(&v10, &v9, a4, 0.0);
  CGAffineTransform v11 = v10;
  CGAffineTransform v8 = v10;
  [(CKSwipeActionIndicator *)self setTransform:&v8];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKSwipeActionIndicator;
    BOOL v5 = [(CKSwipeActionIndicator *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_double currentScale = a3;
}

- (double)currentHorizontalTranslation
{
  return self->_currentHorizontalTranslation;
}

- (void)setCurrentHorizontalTranslation:(double)a3
{
  self->_currentHorizontalTranslation = a3;
}

@end