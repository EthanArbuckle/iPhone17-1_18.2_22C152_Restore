@interface CKSendMenuPopoverBlurContentsView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CKSendMenuPopoverBlurContentsView)init;
- (double)blurFilterRadius;
- (void)setBlurFilterRadius:(double)a3;
@end

@implementation CKSendMenuPopoverBlurContentsView

- (CKSendMenuPopoverBlurContentsView)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CKSendMenuPopoverBlurContentsView;
  v2 = -[CKSendMenuPopoverBlurContentsView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v3 setValue:&unk_1EDF16508 forKey:*MEMORY[0x1E4F3A1D8]];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v5 = [(CKSendMenuPopoverBlurContentsView *)v2 layer];
    [v5 setFilters:v4];
  }
  return v2;
}

- (void)setBlurFilterRadius:(double)a3
{
  id v5 = [(CKSendMenuPopoverBlurContentsView *)self layer];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (double)blurFilterRadius
{
  v2 = [(CKSendMenuPopoverBlurContentsView *)self layer];
  v3 = [v2 valueForKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
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
    v7.super_class = (Class)CKSendMenuPopoverBlurContentsView;
    BOOL v5 = [(CKSendMenuPopoverBlurContentsView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end