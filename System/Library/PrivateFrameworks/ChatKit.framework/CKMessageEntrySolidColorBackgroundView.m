@interface CKMessageEntrySolidColorBackgroundView
- (NSString)backdropGroupName;
- (UITraitCollection)entryViewTraitCollection;
- (id)inputAccessoryViewBackdropColor;
- (id)inputAccessoryViewBackdropEffects;
- (int64_t)style;
- (void)_updateBackgroundView;
- (void)setBackdropGroupName:(id)a3;
- (void)setEntryViewTraitCollection:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation CKMessageEntrySolidColorBackgroundView

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(CKMessageEntrySolidColorBackgroundView *)self _updateBackgroundView];
  }
}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    [(CKMessageEntrySolidColorBackgroundView *)self _updateBackgroundView];
  }
}

- (void)_updateBackgroundView
{
  uint64_t v3 = [(CKMessageEntrySolidColorBackgroundView *)self style];
  id v6 = [(CKMessageEntrySolidColorBackgroundView *)self entryViewTraitCollection];
  if (CKMessageEntryViewStyleIsForDarkFullscreenMoment(v3)) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  id v5 = [v4 resolvedColorForTraitCollection:v6];

  [(CKMessageEntrySolidColorBackgroundView *)self setBackgroundColor:v5];
}

- (id)inputAccessoryViewBackdropColor
{
  return 0;
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);

  objc_storeStrong((id *)&self->_backdropGroupName, 0);
}

@end