@interface CNVisualIdentityEditablePrimaryAvatarTextField
- (CGRect)caretRectForPosition:(id)a3;
@end

@implementation CNVisualIdentityEditablePrimaryAvatarTextField

- (CGRect)caretRectForPosition:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarTextField;
  [(CNVisualIdentityEditablePrimaryAvatarTextField *)&v19 caretRectForPosition:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CNVisualIdentityEditablePrimaryAvatarTextField *)self bounds];
  double v13 = (v11 - v12 * 0.5) * 0.5;
  BOOL v14 = v11 <= v12 * 0.5;
  if (v11 <= v12 * 0.5) {
    double v15 = v11;
  }
  else {
    double v15 = v12 * 0.5;
  }
  if (v14) {
    double v13 = -0.0;
  }
  double v16 = v7 + v13;
  double v17 = v5;
  double v18 = v9;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

@end