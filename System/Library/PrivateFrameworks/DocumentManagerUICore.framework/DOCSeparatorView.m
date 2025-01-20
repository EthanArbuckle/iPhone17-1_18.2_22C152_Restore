@interface DOCSeparatorView
+ (double)separatorThicknessForTraitCollection:(id)a3;
- (CGSize)intrinsicContentSize;
- (DOCSeparatorView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation DOCSeparatorView

+ (double)separatorThicknessForTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = [v3 preferredContentSizeCategory];
  v5 = (void *)*MEMORY[0x263F1D1A0];

  if (v4 == v5)
  {
    v7 = [MEMORY[0x263F1C568] system];
    v6 = [v7 preferredContentSizeCategory];
  }
  else
  {
    v6 = [v3 preferredContentSizeCategory];
  }
  double v8 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v6))
  {
    [v3 displayScale];
    if (v9 <= 0.0)
    {
      v12 = [MEMORY[0x263F1C920] mainScreen];
      [v12 scale];
      double v11 = v13;
    }
    else
    {
      [v3 displayScale];
      double v11 = v10;
    }
    if (v11 <= 0.0) {
      +[DOCSeparatorView separatorThicknessForTraitCollection:]();
    }
    double v8 = 1.0 / v11;
  }

  return v8;
}

- (DOCSeparatorView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DOCSeparatorView;
  id v3 = -[DOCSeparatorView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] separatorColor];
    [(DOCSeparatorView *)v3 setBackgroundColor:v4];

    LODWORD(v5) = 1131413504;
    [(DOCSeparatorView *)v3 setContentHuggingPriority:1 forAxis:v5];
    LODWORD(v6) = 1131413504;
    [(DOCSeparatorView *)v3 setContentHuggingPriority:0 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(DOCSeparatorView *)v3 setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [(DOCSeparatorView *)v3 setContentCompressionResistancePriority:0 forAxis:v8];
    double v9 = objc_msgSend(MEMORY[0x263F1CB00], "doc_traitsAffectingFonts");
    double v10 = self;
    double v11 = [v9 arrayByAddingObject:v10];

    id v12 = (id)[(DOCSeparatorView *)v3 registerForTraitChanges:v11 withAction:sel_invalidateIntrinsicContentSize];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  id v3 = objc_opt_class();
  v4 = [(DOCSeparatorView *)self traitCollection];
  [v3 separatorThicknessForTraitCollection:v4];
  double v6 = v5;

  double v7 = v6;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)DOCSeparatorView;
  [(DOCSeparatorView *)&v4 didMoveToWindow];
  id v3 = [(DOCSeparatorView *)self window];

  if (v3) {
    [(DOCSeparatorView *)self invalidateIntrinsicContentSize];
  }
}

+ (void)separatorThicknessForTraitCollection:.cold.1()
{
}

@end