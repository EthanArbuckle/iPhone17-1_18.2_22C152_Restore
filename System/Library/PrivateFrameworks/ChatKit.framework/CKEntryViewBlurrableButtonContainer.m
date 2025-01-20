@interface CKEntryViewBlurrableButtonContainer
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CKEntryViewBlurrableButtonContainer)init;
- (double)blurRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setBlurRadius:(double)a3;
@end

@implementation CKEntryViewBlurrableButtonContainer

- (CKEntryViewBlurrableButtonContainer)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CKEntryViewBlurrableButtonContainer;
  v2 = [(CKEntryViewBlurrableButtonContainer *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v3 setValue:&unk_1EDF16730 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    v8[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v5 = [(CKEntryViewBlurrableButtonContainer *)v2 layer];
    [v5 setFilters:v4];
  }
  return v2;
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
    v7.super_class = (Class)CKEntryViewBlurrableButtonContainer;
    BOOL v5 = [(CKEntryViewBlurrableButtonContainer *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKEntryViewBlurrableButtonContainer;
  -[CKEntryViewBlurrableButtonContainer hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  BOOL v5 = (CKEntryViewBlurrableButtonContainer *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = v5;
  }

  return v7;
}

- (void)setBlurRadius:(double)a3
{
  if (vabdd_f64(a3, self->_blurRadius) > 2.22044605e-16)
  {
    self->_blurRadius = a3;
    id v5 = [(CKEntryViewBlurrableButtonContainer *)self layer];
    id v4 = [NSNumber numberWithDouble:a3];
    [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
}

- (double)blurRadius
{
  return self->_blurRadius;
}

@end