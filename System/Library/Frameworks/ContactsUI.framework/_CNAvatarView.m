@interface _CNAvatarView
+ (BOOL)requiresConstraintBasedLayout;
- (NSArray)likenessProviders;
- (NSArray)likenessViews;
- (NSArray)subviewsConstraints;
- (_CNAvatarViewDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setLikenessProviders:(id)a3;
- (void)setLikenessViews:(id)a3;
- (void)setSubviewsConstraints:(id)a3;
- (void)setupSubviews;
- (void)updateConstraints;
@end

@implementation _CNAvatarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subviewsConstraints, 0);
  objc_storeStrong((id *)&self->_likenessViews, 0);
  objc_storeStrong((id *)&self->_likenessProviders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSubviewsConstraints:(id)a3
{
}

- (NSArray)subviewsConstraints
{
  return self->_subviewsConstraints;
}

- (void)setLikenessViews:(id)a3
{
}

- (NSArray)likenessViews
{
  return self->_likenessViews;
}

- (NSArray)likenessProviders
{
  return self->_likenessProviders;
}

- (void)setDelegate:(id)a3
{
}

- (_CNAvatarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CNAvatarViewDelegate *)WeakRetained;
}

- (void)updateConstraints
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = self;
  v5 = [(_CNAvatarView *)v4 likenessViews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(_CNAvatarView *)v4 likenessViews];
    v8 = [v7 objectAtIndexedSubscript:0];

    double v9 = 1.0;
    v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
    [v3 addObject:v10];

    v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    [v3 addObject:v11];

    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:7 relatedBy:0 toItem:v8 attribute:8 multiplier:1.0 constant:0.0];
    [v3 addObject:v12];

    v13 = [(_CNAvatarView *)v4 likenessViews];
    if ((unint64_t)[v13 count] > 1) {
      double v9 = 0.666666667;
    }

    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v8 attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:v9 constant:0.0];
    [v3 addObject:v14];
  }
  v15 = [(_CNAvatarView *)v4 likenessViews];
  unint64_t v16 = [v15 count];

  if (v16 >= 2)
  {
    v17 = [(_CNAvatarView *)v4 likenessViews];
    v18 = [v17 objectAtIndexedSubscript:1];

    v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:0.0];
    [v3 addObject:v19];

    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
    [v3 addObject:v20];

    v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v18 attribute:8 multiplier:1.0 constant:0.0];
    [v3 addObject:v21];

    v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:0.666666667 constant:0.0];
    [v3 addObject:v22];
  }
  [(_CNAvatarView *)v4 setSubviewsConstraints:v3];
  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  v23.receiver = v4;
  v23.super_class = (Class)_CNAvatarView;
  [(_CNAvatarView *)&v23 updateConstraints];
}

- (void)setupSubviews
{
  v3 = [(_CNAvatarView *)self subviewsConstraints];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC8];
    v5 = [(_CNAvatarView *)self subviewsConstraints];
    [v4 deactivateConstraints:v5];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [(_CNAvatarView *)self likenessProviders];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __30___CNAvatarView_setupSubviews__block_invoke;
  v12 = &unk_1E5497C20;
  v13 = self;
  id v14 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v9];

  -[_CNAvatarView setLikenessViews:](self, "setLikenessViews:", v8, v9, v10, v11, v12, v13);
  [(_CNAvatarView *)self setNeedsUpdateConstraints];
}

- (void)setLikenessProviders:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_likenessProviders != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_likenessProviders, a3);
    [(_CNAvatarView *)self setupSubviews];
    v5 = v6;
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end