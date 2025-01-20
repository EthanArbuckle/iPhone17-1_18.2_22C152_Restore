@interface _CPUIAlbumContainer
- (CGSize)intrinsicContentSize;
- (CPUIModernButton)button;
- (_CPUIAlbumContainer)initWithButton:(id)a3;
- (void)setButton:(id)a3;
@end

@implementation _CPUIAlbumContainer

- (_CPUIAlbumContainer)initWithButton:(id)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_CPUIAlbumContainer;
  v5 = -[_CPUIAlbumContainer initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(_CPUIAlbumContainer *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_CPUIAlbumContainer *)v6 addSubview:v4];
    id v7 = objc_storeWeak((id *)&v6->_button, v4);
    v20 = (void *)MEMORY[0x263F08938];
    id v8 = v7;
    v26 = [v4 leadingAnchor];
    v25 = [(_CPUIAlbumContainer *)v6 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_button);
    v22 = [WeakRetained trailingAnchor];
    v21 = [(_CPUIAlbumContainer *)v6 trailingAnchor];
    v19 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v19;
    id v18 = objc_loadWeakRetained((id *)&v6->_button);
    v9 = [v18 bottomAnchor];
    v10 = [(_CPUIAlbumContainer *)v6 bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v28[2] = v11;
    id v12 = objc_loadWeakRetained((id *)&v6->_button);
    v13 = [v12 topAnchor];
    v14 = [(_CPUIAlbumContainer *)v6 topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v28[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    [v20 activateConstraints:v16];
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(_CPUIAlbumContainer *)self button];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CPUIModernButton)button
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  return (CPUIModernButton *)WeakRetained;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end