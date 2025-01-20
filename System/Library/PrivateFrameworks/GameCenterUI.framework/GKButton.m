@interface GKButton
+ (void)initialize;
- (CGSize)intrinsicContentSize;
- (GKButton)initWithFrame:(CGRect)a3;
- (GKTextStyle)appliedStyle;
- (GKTextStyle)baseStyle;
- (void)applyButtonStyle:(id)a3;
- (void)applyTextStyle:(id)a3;
- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3;
- (void)setAppliedStyle:(id)a3;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setBaseStyle:(id)a3;
@end

@implementation GKButton

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  if (self->_baseStyle)
  {
    BOOL v3 = a3;
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v6 = replayAndApplyStyleWithSystemContentChange__states[i];
      v7 = (void *)MEMORY[0x1E4F639F8];
      v8 = [(GKButton *)self attributedTitleForState:v6];
      v9 = [v7 attributedString:v8 byReplayingFromBaseStyle:self->_baseStyle systemContentSizeDidChange:v3];

      v14.receiver = self;
      v14.super_class = (Class)GKButton;
      [(GKButton *)&v14 setAttributedTitle:v9 forState:v6];
    }
    v10 = self->_baseStyle;
    appliedStyle = self->_appliedStyle;
    if (appliedStyle)
    {
      uint64_t v12 = [(GKTextStyle *)appliedStyle replayOnBaseStyle:self->_baseStyle systemContentSizeDidChange:v3];

      v10 = (GKTextStyle *)v12;
    }
    if (v10)
    {
      v13 = [(GKButton *)self titleLabel];
      [(GKTextStyle *)v10 applyToLabel:v13];
    }
  }
}

- (GKTextStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  v5 = (GKTextStyle *)a3;
  p_baseStyle = &self->_baseStyle;
  if (self->_baseStyle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_baseStyle, a3);
    p_baseStyle = (GKTextStyle **)[(GKButton *)self replayAndApplyStyleWithSystemContentChange:0];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_baseStyle, v5);
}

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v6[0] = objc_opt_class();
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 appearanceWhenContainedInInstancesOfClasses:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F63A08]);
  [v4 setBaseStyle:v5];
}

- (GKButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKButton;
  BOOL v3 = -[GKButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v6 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v6 = 0), v6)) {
      v7 = (Class *)0x1E4F63A08;
    }
    else {
      v7 = (Class *)0x1E4F63A00;
    }
    id v8 = objc_alloc_init(*v7);
    objc_storeStrong((id *)&v3->_baseStyle, v8);
  }
  return v3;
}

- (void)applyTextStyle:(id)a3
{
  p_appliedStyle = &self->_appliedStyle;
  BOOL v6 = (GKTextStyle *)a3;
  v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    BOOL v6 = *p_appliedStyle;
  }
  if (v6) {
    [(GKButton *)self replayAndApplyStyleWithSystemContentChange:0];
  }
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKButton;
  [(GKButton *)&v5 setAttributedTitle:a3 forState:a4];
  [(GKButton *)self replayAndApplyStyleWithSystemContentChange:0];
}

- (void)applyButtonStyle:(id)a3
{
  p_appliedButtonStyle = &self->_appliedButtonStyle;
  objc_storeStrong((id *)&self->_appliedButtonStyle, a3);
  id v6 = a3;
  [(GKButtonStyle *)*p_appliedButtonStyle applyToButton:self];
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)GKButton;
  [(GKButton *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(GKButton *)self titleEdgeInsets];
  double v8 = v7;
  [(GKButton *)self titleEdgeInsets];
  double v10 = v4 + v8 + v9;
  [(GKButton *)self titleEdgeInsets];
  double v12 = v11;
  [(GKButton *)self titleEdgeInsets];
  double v14 = v6 + v12 + v13;
  double v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

- (GKTextStyle)appliedStyle
{
  return self->_appliedStyle;
}

- (void)setAppliedStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedButtonStyle, 0);
  objc_storeStrong((id *)&self->_appliedStyle, 0);

  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end