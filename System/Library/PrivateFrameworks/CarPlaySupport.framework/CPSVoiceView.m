@interface CPSVoiceView
- (CPSAbridgableLabel)titleLabel;
- (CPSVoiceView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (id)_titleFont;
- (void)setImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSVoiceView

- (CPSVoiceView)initWithFrame:(CGRect)a3
{
  v76[11] = *MEMORY[0x263EF8340];
  CGRect v75 = a3;
  SEL v73 = a2;
  v74 = 0;
  v72.receiver = self;
  v72.super_class = (Class)CPSVoiceView;
  v70 = -[CPSVoiceView initWithFrame:](&v72, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v74 = v70;
  objc_storeStrong((id *)&v74, v70);
  if (v70)
  {
    [(CPSVoiceView *)v74 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
    -[CPSVoiceView setBackgroundColor:](v74, "setBackgroundColor:");

    v3 = [CPSAbridgableLabel alloc];
    v22 = (double *)MEMORY[0x263F001A8];
    uint64_t v4 = -[CPSAbridgableLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleLabel = v74->_titleLabel;
    v74->_titleLabel = (CPSAbridgableLabel *)v4;

    id v12 = [(CPSVoiceView *)v74 _titleFont];
    v11 = [(CPSVoiceView *)v74 titleLabel];
    [(CPSAbridgableLabel *)v11 setFont:v12];

    id v14 = (id)[MEMORY[0x263F1C550] clearColor];
    v13 = [(CPSVoiceView *)v74 titleLabel];
    [(CPSAbridgableLabel *)v13 setBackgroundColor:v14];

    v15 = [(CPSVoiceView *)v74 titleLabel];
    [(CPSAbridgableLabel *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(CPSVoiceView *)v74 titleLabel];
    -[CPSAbridgableLabel setTextAlignment:](v16, "setTextAlignment:");

    v17 = [(CPSVoiceView *)v74 titleLabel];
    [(CPSAbridgableLabel *)v17 setNumberOfLines:2];

    id v19 = (id)[MEMORY[0x263F1C550] labelColor];
    v18 = [(CPSVoiceView *)v74 titleLabel];
    [(CPSAbridgableLabel *)v18 setTextColor:v19];

    v20 = v74;
    v21 = [(CPSVoiceView *)v74 titleLabel];
    -[CPSVoiceView addSubview:](v20, "addSubview:");

    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    imageView = v74->_imageView;
    v74->_imageView = (UIImageView *)v6;

    id v24 = (id)[MEMORY[0x263F1C550] clearColor];
    v23 = [(CPSVoiceView *)v74 imageView];
    [(UIImageView *)v23 setBackgroundColor:v24];

    v25 = [(CPSVoiceView *)v74 imageView];
    [(UIImageView *)v25 setContentMode:1];

    v26 = [(CPSVoiceView *)v74 imageView];
    [(UIImageView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = v74;
    v28 = [(CPSVoiceView *)v74 imageView];
    -[CPSVoiceView addSubview:](v27, "addSubview:");

    id v71 = objc_alloc_init(MEMORY[0x263F1C778]);
    [(CPSVoiceView *)v74 addLayoutGuide:v71];
    v29 = (void *)MEMORY[0x263F08938];
    v69 = [(CPSVoiceView *)v74 titleLabel];
    id v68 = (id)[(CPSAbridgableLabel *)v69 topAnchor];
    id v67 = (id)[(CPSVoiceView *)v74 topAnchor];
    id v66 = (id)objc_msgSend(v68, "constraintEqualToAnchor:constant:", 10.0);
    v76[0] = v66;
    v65 = [(CPSVoiceView *)v74 titleLabel];
    id v64 = (id)[(CPSAbridgableLabel *)v65 leadingAnchor];
    id v63 = (id)[(CPSVoiceView *)v74 leadingAnchor];
    id v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:constant:", 12.0);
    v76[1] = v62;
    v61 = [(CPSVoiceView *)v74 titleLabel];
    id v60 = (id)[(CPSAbridgableLabel *)v61 trailingAnchor];
    id v59 = (id)[(CPSVoiceView *)v74 trailingAnchor];
    id v58 = (id)objc_msgSend(v60, "constraintEqualToAnchor:constant:", -12.0);
    v76[2] = v58;
    id v57 = (id)[v71 leadingAnchor];
    id v56 = (id)[(CPSVoiceView *)v74 leadingAnchor];
    id v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
    v76[3] = v55;
    id v54 = (id)[v71 trailingAnchor];
    id v53 = (id)[(CPSVoiceView *)v74 trailingAnchor];
    id v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
    v76[4] = v52;
    id v51 = (id)[v71 topAnchor];
    v50 = [(CPSVoiceView *)v74 titleLabel];
    id v49 = (id)[(CPSAbridgableLabel *)v50 bottomAnchor];
    id v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
    v76[5] = v48;
    id v47 = (id)[v71 bottomAnchor];
    id v46 = (id)[(CPSVoiceView *)v74 bottomAnchor];
    id v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
    v76[6] = v45;
    v44 = [(CPSVoiceView *)v74 imageView];
    id v43 = (id)[(UIImageView *)v44 widthAnchor];
    id v42 = (id)objc_msgSend(v43, "constraintLessThanOrEqualToConstant:");
    v76[7] = v42;
    v41 = [(CPSVoiceView *)v74 imageView];
    id v40 = (id)[(UIImageView *)v41 heightAnchor];
    id v39 = (id)[v40 constraintLessThanOrEqualToConstant:150.0];
    v76[8] = v39;
    v38 = [(CPSVoiceView *)v74 imageView];
    id v37 = (id)[(UIImageView *)v38 centerXAnchor];
    id v36 = (id)[v71 centerXAnchor];
    id v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v76[9] = v35;
    v34 = [(CPSVoiceView *)v74 imageView];
    id v33 = (id)[(UIImageView *)v34 centerYAnchor];
    id v32 = (id)[v71 centerYAnchor];
    id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v76[10] = v31;
    id v30 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:11];
    objc_msgSend(v29, "activateConstraints:");

    objc_storeStrong(&v71, 0);
  }
  v9 = v74;
  objc_storeStrong((id *)&v74, 0);
  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)CPSVoiceView;
  [(CPSVoiceView *)&v5 traitCollectionDidChange:location[0]];
  uint64_t v4 = [(CPSVoiceView *)v7 titleLabel];
  id v3 = [(CPSVoiceView *)v7 _titleFont];
  -[CPSAbridgableLabel setFont:](v4, "setFont:");

  objc_storeStrong(location, 0);
}

- (id)_titleFont
{
  v17[1] = *MEMORY[0x263EF8340];
  v13[2] = self;
  v13[1] = (id)a2;
  uint64_t v6 = (void *)MEMORY[0x263F1C660];
  uint64_t v5 = *MEMORY[0x263F1D300];
  id v7 = (id)[(CPSVoiceView *)self traitCollection];
  v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  uint64_t v16 = *MEMORY[0x263F1D350];
  id v8 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v17[0] = v8;
  id v12 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, &v16);

  id v9 = v13[0];
  uint64_t v14 = *MEMORY[0x263F1D210];
  id v15 = v12;
  id v10 = (id)[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  id v3 = v13[0];
  v13[0] = v2;

  id v11 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v13[0] size:0.0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);

  return v11;
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end