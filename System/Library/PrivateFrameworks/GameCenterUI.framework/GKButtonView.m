@interface GKButtonView
+ (BOOL)requiresConstraintBasedLayout;
+ (void)registerSupplementaryViewClassesForKind:(id)a3 withCollectionView:(id)a4;
- (GKButtonView)initWithFrame:(CGRect)a3;
- (GKCollectionViewDataSource)dataSource;
- (NSMutableArray)buttonConstraints;
- (SEL)action;
- (UIButton)button;
- (void)applyLayoutAttributes:(id)a3;
- (void)buttonPressed:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setButton:(id)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setDataSource:(id)a3;
- (void)updateConstraints;
@end

@implementation GKButtonView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (void)registerSupplementaryViewClassesForKind:(id)a3 withCollectionView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 _gkRegisterClass:objc_opt_class() forSupplementaryViewOfKind:v6];
}

- (GKButtonView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKButtonView;
  v3 = -[GKButtonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [GKButton alloc];
    uint64_t v5 = -[GKButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    button = v3->_button;
    v3->_button = (UIButton *)v5;

    [(UIButton *)v3->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_button addTarget:v3 action:sel_buttonPressed_ forControlEvents:64];
    [(GKButtonView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)updateConstraints
{
  v8.receiver = self;
  v8.super_class = (Class)GKButtonView;
  [(GKButtonView *)&v8 updateConstraints];
  if (self->_buttonConstraints) {
    -[GKButtonView removeConstraints:](self, "removeConstraints:");
  }
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  [(GKButtonView *)self setButtonConstraints:v3];

  buttonConstraints = self->_buttonConstraints;
  uint64_t v5 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_button centeredXInView:self];
  [(NSMutableArray *)buttonConstraints addObject:v5];

  id v6 = self->_buttonConstraints;
  v7 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_button centeredYInView:self];
  [(NSMutableArray *)v6 addObject:v7];

  [(GKButtonView *)self addConstraints:self->_buttonConstraints];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v5 dataSource];
    [(GKButtonView *)self setDataSource:v4];
  }
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  p_SEL action = &self->_action;
  SEL action = self->_action;
  if (action)
  {
    id v12 = v4;
    v7 = [(GKCollectionViewDataSource *)self->_dataSource targetForAction:action];
    objc_super v8 = v7;
    if (*p_action) {
      SEL v9 = *p_action;
    }
    else {
      SEL v9 = 0;
    }
    v10 = (void (*)(void *, SEL))[v7 methodForSelector:v9];
    if (*p_action) {
      SEL v11 = *p_action;
    }
    else {
      SEL v11 = 0;
    }
    v10(v8, v11);

    id v4 = v12;
  }
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_SEL action = v3;
}

- (NSMutableArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end