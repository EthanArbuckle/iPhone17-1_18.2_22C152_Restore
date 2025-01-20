@interface HUPersonFaceCropTableCell
- (HFItem)item;
- (HMFaceCrop)personFaceCrop;
- (HUPersonFaceCropTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (UIImage)faceImage;
- (UIImageView)faceCropView;
- (void)_setupConstraints;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setFaceCropView:(id)a3;
- (void)setFaceImage:(id)a3;
- (void)setItem:(id)a3;
- (void)setPersonFaceCrop:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUPersonFaceCropTableCell

- (HUPersonFaceCropTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HUPersonFaceCropTableCell;
  v4 = [(HUPersonFaceCropTableCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:0];
    [(HUPersonFaceCropTableCell *)v4 setFaceCropView:v5];

    v6 = [(HUPersonFaceCropTableCell *)v4 faceCropView];
    [v6 setContentMode:1];

    v7 = [(HUPersonFaceCropTableCell *)v4 contentView];
    v8 = [(HUPersonFaceCropTableCell *)v4 faceCropView];
    [v7 addSubview:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F6A418]);
    v10 = [(HUPersonFaceCropTableCell *)v4 imageView];
    [v10 frame];
    v11 = objc_msgSend(v9, "initWithFrame:");

    v12 = [MEMORY[0x1E4F428B8] blackColor];
    [v11 setBackgroundColor:v12];

    v13 = [(HUPersonFaceCropTableCell *)v4 faceCropView];
    [v13 setMaskView:v11];

    [(HUPersonFaceCropTableCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUPersonFaceCropTableCell;
  [(HUPersonFaceCropTableCell *)&v4 prepareForReuse];
  v3 = [(HUPersonFaceCropTableCell *)self faceCropView];
  [v3 setImage:0];

  [(HUPersonFaceCropTableCell *)self setItem:0];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HUPersonFaceCropTableCell;
  [(HUPersonFaceCropTableCell *)&v14 layoutSubviews];
  v3 = [(HUPersonFaceCropTableCell *)self faceCropView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(HUPersonFaceCropTableCell *)self faceCropView];
  v13 = [v12 maskView];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  double v4 = [(HUPersonFaceCropTableCell *)self item];
  double v5 = [v4 latestResults];
  double v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];
  [(HUPersonFaceCropTableCell *)self setFaceImage:v6];

  double v7 = [(HUPersonFaceCropTableCell *)self faceImage];
  double v8 = [(HUPersonFaceCropTableCell *)self faceCropView];
  [v8 setImage:v7];

  id v9 = [(HUPersonFaceCropTableCell *)self faceCropView];
  [v9 sizeToFit];
}

- (void)_setupConstraints
{
  v3 = [(HUPersonFaceCropTableCell *)self constraints];

  if (!v3)
  {
    double v4 = [(HUPersonFaceCropTableCell *)self faceCropView];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v38 = [MEMORY[0x1E4F1CA48] array];
    double v5 = [(HUPersonFaceCropTableCell *)self faceCropView];
    double v6 = [v5 centerXAnchor];
    double v7 = [(HUPersonFaceCropTableCell *)self layoutMarginsGuide];
    double v8 = [v7 centerXAnchor];
    id v9 = [v6 constraintEqualToAnchor:v8];
    [v38 addObject:v9];

    double v10 = [(HUPersonFaceCropTableCell *)self faceCropView];
    double v11 = [v10 centerYAnchor];
    v12 = [(HUPersonFaceCropTableCell *)self layoutMarginsGuide];
    v13 = [v12 centerYAnchor];
    objc_super v14 = [v11 constraintEqualToAnchor:v13];
    [v38 addObject:v14];

    objc_super v15 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v16 = [v15 topAnchor];
    v17 = [(HUPersonFaceCropTableCell *)self contentView];
    v18 = [v17 topAnchor];
    v19 = [v16 constraintEqualToAnchor:v18 constant:20.0];
    [v38 addObject:v19];

    v20 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v21 = [v20 bottomAnchor];
    v22 = [(HUPersonFaceCropTableCell *)self contentView];
    v23 = [v22 bottomAnchor];
    v24 = [v21 constraintEqualToAnchor:v23 constant:-20.0];
    [v38 addObject:v24];

    v25 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v26 = [v25 heightAnchor];
    v27 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v28 = [v27 widthAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v38 addObject:v29];

    v30 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v31 = [v30 heightAnchor];
    v32 = [v31 constraintGreaterThanOrEqualToConstant:30.0];
    [v38 addObject:v32];

    v33 = [(HUPersonFaceCropTableCell *)self faceCropView];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintLessThanOrEqualToConstant:256.0];
    [v38 addObject:v35];

    [(HUPersonFaceCropTableCell *)self setConstraints:v38];
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(HUPersonFaceCropTableCell *)self constraints];
    [v36 activateConstraints:v37];
  }
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HMFaceCrop)personFaceCrop
{
  return self->_personFaceCrop;
}

- (void)setPersonFaceCrop:(id)a3
{
}

- (UIImage)faceImage
{
  return self->_faceImage;
}

- (void)setFaceImage:(id)a3
{
}

- (UIImageView)faceCropView
{
  return self->_faceCropView;
}

- (void)setFaceCropView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_faceCropView, 0);
  objc_storeStrong((id *)&self->_faceImage, 0);
  objc_storeStrong((id *)&self->_personFaceCrop, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end