@interface _CKAvatarCutoutSupplementaryView
+ (id)reuseIdentifier;
+ (id)supplementaryViewKind;
- (_CKAvatarCutoutSupplementaryView)initWithFrame:(CGRect)a3;
@end

@implementation _CKAvatarCutoutSupplementaryView

+ (id)reuseIdentifier
{
  return @"_CKAvatarCutoutDecorationView_reuseIdentifier";
}

+ (id)supplementaryViewKind
{
  return @"_CKAvatarCutoutDecorationView_supplementaryViewKind";
}

- (_CKAvatarCutoutSupplementaryView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_CKAvatarCutoutSupplementaryView;
  v3 = -[_CKAvatarCutoutSupplementaryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] whiteColor];
    [(_CKAvatarCutoutSupplementaryView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    v6 = [(_CKAvatarCutoutSupplementaryView *)v3 layer];
    [v6 setCompositingFilter:v5];

    v7 = +[CKUIBehavior sharedBehaviors];
    [v7 avatarCutoutSize];
    double v9 = v8 * 0.5;
    v10 = [(_CKAvatarCutoutSupplementaryView *)v3 layer];
    [v10 setCornerRadius:v9];
  }
  return v3;
}

@end