@interface DevicesHeaderView
- (DevicesHeaderView)initWithSpecifier:(id)a3;
- (NSString)name;
- (UIActivityIndicatorView)spinner;
- (UIListContentConfiguration)listContentConfiguration;
- (UIListContentView)listContentView;
- (double)preferredHeightForWidth:(double)a3;
- (void)setListContentConfiguration:(id)a3;
- (void)setListContentView:(id)a3;
- (void)setName:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setupSubviewsWithSpecifier:(id)a3;
@end

@implementation DevicesHeaderView

- (double)preferredHeightForWidth:(double)a3
{
  v5 = [(DevicesHeaderView *)self spinner];
  [v5 frame];
  double v7 = v6 + 24.0;

  v8 = [(DevicesHeaderView *)self listContentView];
  objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
  double v10 = v9;

  if (v7 >= v10) {
    return v7;
  }
  else {
    return v10;
  }
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (DevicesHeaderView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DevicesHeaderView;
  v5 = [(DevicesHeaderView *)&v8 init];
  double v6 = v5;
  if (v5)
  {
    [(DevicesHeaderView *)v5 setAutoresizingMask:2];
    [(DevicesHeaderView *)v6 setupSubviewsWithSpecifier:v4];
  }

  return v6;
}

- (NSString)name
{
  v2 = [(DevicesHeaderView *)self listContentConfiguration];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(DevicesHeaderView *)self listContentConfiguration];
  [v5 setText:v4];

  [(DevicesHeaderView *)self setListContentConfiguration:v5];
}

- (UIListContentConfiguration)listContentConfiguration
{
  v2 = [(DevicesHeaderView *)self listContentView];
  v3 = [v2 configuration];

  return (UIListContentConfiguration *)v3;
}

- (void)setListContentConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(DevicesHeaderView *)self listContentView];
  [v5 setConfiguration:v4];
}

- (void)setupSubviewsWithSpecifier:(id)a3
{
  v52[6] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F82918];
  id v5 = a3;
  double v6 = [v4 groupedHeaderConfiguration];
  double v7 = [v5 name];

  v51 = v6;
  [v6 setText:v7];

  objc_super v8 = (void *)[objc_alloc(MEMORY[0x263F82920]) initWithConfiguration:v6];
  [(DevicesHeaderView *)self setListContentView:v8];

  double v9 = [(DevicesHeaderView *)self contentView];
  double v10 = [(DevicesHeaderView *)self listContentView];
  [v9 addSubview:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [(DevicesHeaderView *)self setSpinner:v11];

  v12 = [(DevicesHeaderView *)self spinner];
  [v12 startAnimating];

  v13 = [(DevicesHeaderView *)self contentView];
  v14 = [(DevicesHeaderView *)self spinner];
  [v13 addSubview:v14];

  v15 = [(DevicesHeaderView *)self listContentView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(DevicesHeaderView *)self spinner];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v36 = (void *)MEMORY[0x263F08938];
  v50 = [(DevicesHeaderView *)self listContentView];
  v48 = [v50 leadingAnchor];
  v49 = [(DevicesHeaderView *)self contentView];
  v47 = [v49 leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v52[0] = v46;
  v45 = [(DevicesHeaderView *)self listContentView];
  v43 = [v45 topAnchor];
  v44 = [(DevicesHeaderView *)self contentView];
  v42 = [v44 topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v52[1] = v41;
  v40 = [(DevicesHeaderView *)self listContentView];
  v38 = [v40 trailingAnchor];
  v39 = [(DevicesHeaderView *)self contentView];
  v37 = [v39 trailingAnchor];
  v35 = [v38 constraintEqualToAnchor:v37];
  v52[2] = v35;
  v34 = [(DevicesHeaderView *)self listContentView];
  v32 = [v34 bottomAnchor];
  v33 = [(DevicesHeaderView *)self contentView];
  v31 = [v33 bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v52[3] = v30;
  v29 = [(DevicesHeaderView *)self spinner];
  v27 = [v29 leadingAnchor];
  v28 = [(DevicesHeaderView *)self listContentView];
  v17 = [v28 textLayoutGuide];
  v18 = [v17 trailingAnchor];
  v19 = [v27 constraintEqualToAnchor:v18 constant:10.0];
  v52[4] = v19;
  v20 = [(DevicesHeaderView *)self spinner];
  v21 = [v20 centerYAnchor];
  v22 = [(DevicesHeaderView *)self listContentView];
  v23 = [v22 textLayoutGuide];
  v24 = [v23 centerYAnchor];
  v25 = [v21 constraintEqualToAnchor:v24];
  v52[5] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:6];
  [v36 activateConstraints:v26];
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end