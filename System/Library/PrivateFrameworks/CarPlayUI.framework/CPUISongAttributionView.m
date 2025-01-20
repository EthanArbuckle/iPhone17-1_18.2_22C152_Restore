@interface CPUISongAttributionView
- (CPUIModernButton)button;
- (CPUISongAttributionView)initWithFrame:(CGRect)a3;
- (NSString)name;
- (UIImage)artwork;
- (UIImageView)artworkImageView;
- (void)layoutSubviews;
- (void)setArtwork:(id)a3;
- (void)setArtworkImageView:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CPUISongAttributionView

- (CPUISongAttributionView)initWithFrame:(CGRect)a3
{
  v39[9] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)CPUISongAttributionView;
  v3 = -[CPUISongAttributionView initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(CPUISongAttributionView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    [(CPUISongAttributionView *)v4 setClipsToBounds:1];
    uint64_t v6 = objc_opt_new();
    button = v4->_button;
    v4->_button = (CPUIModernButton *)v6;

    [(CPUIModernButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v4->_button setShowButtonBackgroundShape:1];
    -[CPUIModernButton setContentEdgeInsets:](v4->_button, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 5.0);
    uint64_t v8 = objc_opt_new();
    artworkImageView = v4->_artworkImageView;
    v4->_artworkImageView = (UIImageView *)v8;

    [(UIImageView *)v4->_artworkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_artworkImageView setContentMode:2];
    [(UIImageView *)v4->_artworkImageView setClipsToBounds:1];
    [(CPUISongAttributionView *)v4 addSubview:v4->_button];
    [(CPUISongAttributionView *)v4 addSubview:v4->_artworkImageView];
    v27 = (void *)MEMORY[0x263F08938];
    v37 = [(CPUIModernButton *)v4->_button leadingAnchor];
    v36 = [(CPUISongAttributionView *)v4 leadingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v39[0] = v35;
    v34 = [(CPUIModernButton *)v4->_button trailingAnchor];
    v33 = [(CPUISongAttributionView *)v4 trailingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v39[1] = v32;
    v31 = [(CPUIModernButton *)v4->_button topAnchor];
    v30 = [(CPUISongAttributionView *)v4 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v39[2] = v29;
    v28 = [(CPUIModernButton *)v4->_button bottomAnchor];
    v26 = [(CPUISongAttributionView *)v4 bottomAnchor];
    v25 = [v28 constraintEqualToAnchor:v26];
    v39[3] = v25;
    v24 = [(UIImageView *)v4->_artworkImageView heightAnchor];
    v23 = [(UIImageView *)v4->_artworkImageView widthAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v39[4] = v22;
    v21 = [(UIImageView *)v4->_artworkImageView widthAnchor];
    v20 = [v21 constraintEqualToConstant:14.0];
    v39[5] = v20;
    v10 = [(UIImageView *)v4->_artworkImageView leadingAnchor];
    v11 = [(CPUISongAttributionView *)v4 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:4.0];
    v39[6] = v12;
    v13 = [(UIImageView *)v4->_artworkImageView centerYAnchor];
    v14 = [(CPUISongAttributionView *)v4 centerYAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v39[7] = v15;
    v16 = [(CPUISongAttributionView *)v4 heightAnchor];
    v17 = [v16 constraintEqualToConstant:22.0];
    v39[8] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:9];
    [v27 activateConstraints:v18];
  }
  return v4;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CPUISongAttributionView;
  [(CPUISongAttributionView *)&v8 layoutSubviews];
  v3 = [(CPUISongAttributionView *)self artworkImageView];
  [v3 bounds];
  double v5 = v4 * 0.5;
  uint64_t v6 = [(CPUISongAttributionView *)self artworkImageView];
  [v6 _setContinuousCornerRadius:v5];

  [(CPUISongAttributionView *)self bounds];
  [(CPUISongAttributionView *)self _setContinuousCornerRadius:v7 * 0.5];
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
  id v5 = a3;
  id v6 = [(CPUISongAttributionView *)self artworkImageView];
  [v6 setImage:v5];
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  id v5 = a3;
  id v6 = [(CPUISongAttributionView *)self button];
  [v6 setTitle:v5 forState:0];
}

- (CPUIModernButton)button
{
  return self->_button;
}

- (UIImage)artwork
{
  return self->_artwork;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end