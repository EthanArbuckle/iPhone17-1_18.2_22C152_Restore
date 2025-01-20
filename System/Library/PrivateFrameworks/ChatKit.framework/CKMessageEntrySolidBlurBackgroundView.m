@interface CKMessageEntrySolidBlurBackgroundView
- (CKMessageEntrySolidBlurBackgroundView)init;
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

@implementation CKMessageEntrySolidBlurBackgroundView

- (CKMessageEntrySolidBlurBackgroundView)init
{
  v3 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:20.0];
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntrySolidBlurBackgroundView;
  v4 = [(CKMessageEntrySolidBlurBackgroundView *)&v6 initWithEffect:v3];

  return v4;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(CKMessageEntrySolidBlurBackgroundView *)self _updateBackgroundView];
  }
}

- (void)setEntryViewTraitCollection:(id)a3
{
  id v5 = a3;
  if ((-[UITraitCollection isEqual:](self->_entryViewTraitCollection, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entryViewTraitCollection, a3);
    [(CKMessageEntrySolidBlurBackgroundView *)self _updateBackgroundView];
  }
}

- (void)_updateBackgroundView
{
  id v8 = +[CKUIBehavior sharedBehaviors];
  uint64_t v3 = [(CKMessageEntrySolidBlurBackgroundView *)self style];
  v4 = [(CKMessageEntrySolidBlurBackgroundView *)self contentView];
  id v5 = [(CKMessageEntrySolidBlurBackgroundView *)self entryViewTraitCollection];
  if (CKMessageEntryViewStyleIsForDarkFullscreenMoment(v3)) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  objc_super v6 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  v7 = [v6 resolvedColorForTraitCollection:v5];
  [v4 setBackgroundColor:v7];
  if (CKMessageEntryViewStyleIsForReply(v3)) {
    [v8 replyEntryViewBackagroundAlpha];
  }
  else {
    [v8 entryViewBackgroundAlpha];
  }
  objc_msgSend(v4, "setAlpha:");
}

- (void)setBackdropGroupName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_backdropGroupName, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v4;

    [(CKMessageEntrySolidBlurBackgroundView *)self _setGroupName:v6];
  }
}

- (id)inputAccessoryViewBackdropColor
{
  v2 = [(CKMessageEntrySolidBlurBackgroundView *)self contentView];
  uint64_t v3 = [v2 backgroundColor];
  [v2 alpha];
  v4 = objc_msgSend(v3, "colorWithAlphaComponent:");

  return v4;
}

- (id)inputAccessoryViewBackdropEffects
{
  uint64_t v2 = [(CKMessageEntrySolidBlurBackgroundView *)self backgroundEffects];
  uint64_t v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    v4 = (void *)v2;
  }
  id v5 = v4;

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
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