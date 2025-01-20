@interface GKTextField
+ (void)initialize;
- (GKTextField)initWithFrame:(CGRect)a3;
- (GKTextStyle)appliedStyle;
- (GKTextStyle)baseStyle;
- (void)applyTextStyle:(id)a3;
- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3;
- (void)setAppliedStyle:(id)a3;
- (void)setBaseStyle:(id)a3;
@end

@implementation GKTextField

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_baseStyle;
  appliedStyle = self->_appliedStyle;
  if (appliedStyle)
  {
    v8 = v5;
    uint64_t v7 = [(GKTextStyle *)appliedStyle replayOnBaseStyle:self->_baseStyle systemContentSizeDidChange:v3];

    v5 = (GKTextStyle *)v7;
  }
  if (v5)
  {
    v9 = v5;
    appliedStyle = (GKTextStyle *)[(GKTextStyle *)v5 applyToEditField:self];
    v5 = v9;
  }

  MEMORY[0x1F41817F8](appliedStyle, v5);
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
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_baseStyle, a3);
    p_baseStyle = (GKTextStyle **)[(GKTextField *)self replayAndApplyStyleWithSystemContentChange:0];
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

- (GKTextField)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKTextField;
  BOOL v3 = -[GKTextField initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v6 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v6 = 0), v6)) {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F63A08];
    }
    else {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F63A00];
    }
    v8 = (GKTextStyle *)objc_alloc_init(v7);
    baseStyle = v3->_baseStyle;
    v3->_baseStyle = v8;
  }
  return v3;
}

- (void)applyTextStyle:(id)a3
{
  p_appliedStyle = &self->_appliedStyle;
  BOOL v6 = (GKTextStyle *)a3;
  uint64_t v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    BOOL v6 = *p_appliedStyle;
  }
  if (v6) {
    [(GKTextField *)self replayAndApplyStyleWithSystemContentChange:0];
  }
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
  objc_storeStrong((id *)&self->_appliedStyle, 0);

  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end