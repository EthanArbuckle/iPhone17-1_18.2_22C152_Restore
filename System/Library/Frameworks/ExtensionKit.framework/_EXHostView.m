@interface _EXHostView
- (UIView)embededView;
- (_EXHostViewDelegateProtocol)delegate;
- (float)horizontalContentCompressionResistancePriority;
- (float)verticalContentCompressionResistancePriority;
- (void)addShieldView;
- (void)embedView:(id)a3;
- (void)removeShieldView;
- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setEmbededView:(id)a3;
- (void)setHorizontalContentCompressionResistancePriority:(float)a3;
- (void)setVerticalContentCompressionResistancePriority:(float)a3;
@end

@implementation _EXHostView

- (void)setContentCompressionResistancePriority:(float)a3 forAxis:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_EXHostView;
  -[_EXHostView setContentCompressionResistancePriority:forAxis:](&v11, sel_setContentCompressionResistancePriority_forAxis_);
  if (a4 == 1)
  {
    v7 = &OBJC_IVAR____EXHostView__verticalContentCompressionResistancePriority;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    v7 = &OBJC_IVAR____EXHostView__horizontalContentCompressionResistancePriority;
  }
  *(float *)((char *)&self->super.super.super.isa + *v7) = a3;
LABEL_6:
  v8 = [(_EXHostView *)self embededView];

  if (v8)
  {
    v9 = [(_EXHostView *)self embededView];
    *(float *)&double v10 = a3;
    [v9 setContentCompressionResistancePriority:a4 forAxis:v10];
  }
}

- (void)embedView:(id)a3
{
  v30[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(_EXHostView *)self embededView];
  v6 = (void *)v5;
  if ((id)v5 != v4)
  {
    if (v5)
    {
      [(_EXHostView *)self setEmbededView:0];
      [v6 removeFromSuperview];
    }
    if (v4)
    {
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      *(float *)&double v7 = self->_horizontalContentCompressionResistancePriority;
      [v4 setContentCompressionResistancePriority:0 forAxis:v7];
      *(float *)&double v8 = self->_verticalContentCompressionResistancePriority;
      [v4 setContentCompressionResistancePriority:1 forAxis:v8];
      [(_EXHostView *)self addSubview:v4];
      v24 = (void *)MEMORY[0x263F08938];
      v29 = [v4 leftAnchor];
      v28 = [(_EXHostView *)self leftAnchor];
      v27 = [v29 constraintEqualToAnchor:v28];
      v30[0] = v27;
      v26 = [v4 topAnchor];
      v25 = [(_EXHostView *)self topAnchor];
      v23 = [v26 constraintEqualToAnchor:v25];
      v30[1] = v23;
      v9 = [v4 rightAnchor];
      double v10 = [(_EXHostView *)self rightAnchor];
      objc_super v11 = [v9 constraintEqualToAnchor:v10];
      v30[2] = v11;
      v12 = [v4 bottomAnchor];
      v13 = [(_EXHostView *)self bottomAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v30[3] = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
      [v24 activateConstraints:v15];

      [(_EXHostView *)self setEmbededView:v4];
    }
  }
  v16 = [(_EXHostView *)self delegate];
  v17 = [v16 session];
  if (![v17 isLocked]) {
    goto LABEL_14;
  }
  v18 = [(_EXHostView *)self delegate];
  v19 = [v18 session];
  int v20 = [v19 requiresFBSceneHosting];

  if (v20)
  {
    v21 = _EXDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[_EXHostView embedView:](self);
    }

    v22 = [(_EXHostView *)self delegate];
    v16 = [v22 shieldView];

    if (v16)
    {
      [(_EXHostView *)self addShieldView];
      v17 = [(_EXHostView *)self delegate];
      [v17 shieldViewUnlockButtonPressed:v16];
    }
    else
    {
      v17 = _EXDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[_EXHostView embedView:](self);
      }
    }
LABEL_14:
  }
}

- (void)addShieldView
{
  v29[4] = *MEMORY[0x263EF8340];
  v3 = [(_EXHostView *)self delegate];
  id v4 = [v3 shieldView];
  [(_EXHostView *)self addSubview:v4];

  uint64_t v5 = [(_EXHostView *)self delegate];
  v6 = [v5 shieldView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = (void *)MEMORY[0x263F08938];
  v28 = [(_EXHostView *)self delegate];
  v27 = [v28 shieldView];
  v26 = [v27 leftAnchor];
  v25 = [(_EXHostView *)self leftAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [(_EXHostView *)self delegate];
  v22 = [v23 shieldView];
  v21 = [v22 topAnchor];
  int v20 = [(_EXHostView *)self topAnchor];
  v18 = [v21 constraintEqualToAnchor:v20];
  v29[1] = v18;
  v17 = [(_EXHostView *)self delegate];
  double v7 = [v17 shieldView];
  double v8 = [v7 rightAnchor];
  v9 = [(_EXHostView *)self rightAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  v29[2] = v10;
  objc_super v11 = [(_EXHostView *)self delegate];
  v12 = [v11 shieldView];
  v13 = [v12 bottomAnchor];
  v14 = [(_EXHostView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v29[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  [v19 activateConstraints:v16];
}

- (void)removeShieldView
{
  id v3 = [(_EXHostView *)self delegate];
  v2 = [v3 shieldView];
  [v2 removeFromSuperview];
}

- (UIView)embededView
{
  return (UIView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setEmbededView:(id)a3
{
}

- (_EXHostViewDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_EXHostViewDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)horizontalContentCompressionResistancePriority
{
  return self->_horizontalContentCompressionResistancePriority;
}

- (void)setHorizontalContentCompressionResistancePriority:(float)a3
{
  self->_horizontalContentCompressionResistancePriority = a3;
}

- (float)verticalContentCompressionResistancePriority
{
  return self->_verticalContentCompressionResistancePriority;
}

- (void)setVerticalContentCompressionResistancePriority:(float)a3
{
  self->_verticalContentCompressionResistancePriority = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_embededView, 0);
}

- (void)embedView:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 delegate];
  v2 = [v1 session];
  id v3 = [v2 configuration];
  id v4 = [v3 sceneIdentifier];
  OUTLINED_FUNCTION_2_0(&dword_2156DD000, v5, v6, "No shield to add for scene: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)embedView:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 delegate];
  v2 = [v1 session];
  id v3 = [v2 configuration];
  id v4 = [v3 sceneIdentifier];
  OUTLINED_FUNCTION_2_0(&dword_2156DD000, v5, v6, "Session is locked, adding shield to scene: %{public}@", v7, v8, v9, v10, 2u);
}

@end