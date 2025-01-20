@interface CKWolfEntryBackgroundView
- (CKWolfEntryBackgroundView)init;
- (NSString)backdropGroupName;
- (UITraitCollection)entryViewTraitCollection;
- (UIView)blurView;
- (id)inputAccessoryViewBackdropColor;
- (id)inputAccessoryViewBackdropEffects;
- (int64_t)style;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setEntryViewTraitCollection:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation CKWolfEntryBackgroundView

- (CKWolfEntryBackgroundView)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKWolfEntryBackgroundView;
  return [(CKWolfEntryBackgroundView *)&v3 init];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKWolfEntryBackgroundView;
  [(CKWolfEntryBackgroundView *)&v12 layoutSubviews];
  [(CKWolfEntryBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKWolfEntryBackgroundView *)self blurView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (id)inputAccessoryViewBackdropColor
{
  return (id)[MEMORY[0x1E4F428B8] clearColor];
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)style
{
  return self->style;
}

- (void)setStyle:(int64_t)a3
{
  self->style = a3;
}

- (NSString)backdropGroupName
{
  return self->backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->entryViewTraitCollection;
}

- (void)setEntryViewTraitCollection:(id)a3
{
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->entryViewTraitCollection, 0);

  objc_storeStrong((id *)&self->backdropGroupName, 0);
}

@end