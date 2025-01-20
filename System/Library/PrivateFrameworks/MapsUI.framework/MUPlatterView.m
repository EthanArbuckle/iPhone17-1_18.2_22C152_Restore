@interface MUPlatterView
- (MUPlatterView)init;
- (MUPlatterView)initWithContentView:(id)a3;
- (UIView)contentView;
- (id)_createVisualStyleProvider;
- (void)_fetchGroupNameIfNeeded;
- (void)_setup;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation MUPlatterView

- (MUPlatterView)init
{
  return [(MUPlatterView *)self initWithContentView:0];
}

- (MUPlatterView)initWithContentView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlatterView;
  v6 = -[MUPlatterView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentView, a3);
    [(MUPlatterView *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v3 = [(MUPlatterView *)self _createVisualStyleProvider];
  visualStyleProvider = self->_visualStyleProvider;
  self->_visualStyleProvider = v3;

  id v5 = [(MUPlatterViewStyleProviding *)self->_visualStyleProvider fillColor];
  v6 = self->_visualStyleProvider;
  v7 = [(MUPlatterView *)self traitCollection];
  v8 = [(MUPlatterViewStyleProviding *)v6 visualEffectForTraitCollection:v7];

  if (v8)
  {
    objc_super v9 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v8];
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v9;

    v11 = [(UIVisualEffectView *)self->_visualEffectView contentView];
    [v11 setBackgroundColor:v5];

    [(UIVisualEffectView *)self->_visualEffectView _setContinuousCornerRadius:10.0];
    [(MUPlatterView *)self addSubview:self->_visualEffectView];
  }
  else
  {
    [(MUPlatterView *)self setBackgroundColor:v5];
  }
  [(MUPlatterView *)self _setContinuousCornerRadius:10.0];
  [(MUPlatterView *)self setClipsToBounds:1];
  contentView = self->_contentView;
  if (contentView)
  {
    [(UIView *)contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentView _setContinuousCornerRadius:10.0];
    [(MUPlatterView *)self addSubview:self->_contentView];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UIView *)self->_contentView leadingAnchor];
    v26 = [(MUPlatterView *)self leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v28[0] = v25;
    v24 = [(UIView *)self->_contentView trailingAnchor];
    v23 = [(MUPlatterView *)self trailingAnchor];
    v21 = [v24 constraintEqualToAnchor:v23];
    v28[1] = v21;
    v13 = [(UIView *)self->_contentView topAnchor];
    v14 = [(MUPlatterView *)self topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v28[2] = v15;
    v16 = [(UIView *)self->_contentView bottomAnchor];
    v17 = [(MUPlatterView *)self bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v28[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v22 activateConstraints:v19];
  }
  v20 = [(MUPlatterView *)self traitOverrides];
  [v20 setNSIntegerValue:1 forTrait:objc_opt_class()];
}

- (id)_createVisualStyleProvider
{
  v2 = objc_opt_new();
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlatterView;
  [(MUPlatterView *)&v3 layoutSubviews];
  [(MUPlatterView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_visualEffectView, "setFrame:");
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MUPlatterView;
  [(MUPlatterView *)&v3 didMoveToWindow];
  [(MUPlatterView *)self _fetchGroupNameIfNeeded];
}

- (void)_fetchGroupNameIfNeeded
{
  objc_super v3 = [(MUPlatterView *)self window];

  if (v3)
  {
    visualEffectView = self->_visualEffectView;
    if (visualEffectView)
    {
      if (([(UIVisualEffectView *)visualEffectView isHidden] & 1) == 0)
      {
        id v5 = [(UIVisualEffectView *)self->_visualEffectView _groupName];
        uint64_t v6 = [v5 length];

        if (!v6)
        {
          uint64_t v7 = [(MUPlatterView *)self superview];
          if (v7)
          {
            while (1)
            {
              id v10 = (id)v7;
              if (objc_opt_respondsToSelector()) {
                break;
              }
              uint64_t v8 = [v10 superview];

              uint64_t v7 = v8;
              if (!v8) {
                return;
              }
            }
            objc_super v9 = [v10 vibrancyGroupName];
            [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v9];
          }
        }
      }
    }
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end