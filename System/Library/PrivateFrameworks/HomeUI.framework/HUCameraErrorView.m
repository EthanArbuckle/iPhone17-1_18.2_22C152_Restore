@interface HUCameraErrorView
- (HUCameraErrorView)init;
- (NSString)descriptionText;
- (NSString)titleText;
- (UIImageView)imageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)labelStackView;
- (void)setDescriptionText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation HUCameraErrorView

- (HUCameraErrorView)init
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)HUCameraErrorView;
  v2 = [(HUCameraErrorView *)&v22 init];
  v3 = v2;
  if (v2)
  {
    [(HUCameraErrorView *)v2 setAxis:1];
    [(HUCameraErrorView *)v3 setAlignment:3];
    [(HUCameraErrorView *)v3 setSpacing:20.0];
    v4 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_cameraErrorImage");
    v5 = [v4 imageWithRenderingMode:2];

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v5];
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(UIImageView *)v3->_imageView setAlpha:0.5];
    v8 = [(UIImageView *)v3->_imageView widthAnchor];
    v9 = [v8 constraintEqualToConstant:61.0];
    v23[0] = v9;
    v10 = [(UIImageView *)v3->_imageView heightAnchor];
    v11 = [v10 constraintEqualToConstant:50.0];
    v23[1] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

    [MEMORY[0x1E4F28DC8] activateConstraints:v12];
    [(HUCameraErrorView *)v3 addArrangedSubview:v3->_imageView];
    v13 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
    labelStackView = v3->_labelStackView;
    v3->_labelStackView = v13;

    [(UIStackView *)v3->_labelStackView setAxis:1];
    [(UIStackView *)v3->_labelStackView setAlignment:3];
    [(UIStackView *)v3->_labelStackView setSpacing:1.0];
    [(HUCameraErrorView *)v3 addArrangedSubview:v3->_labelStackView];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v15;

    v17 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0 weight:*MEMORY[0x1E4F43930]];
    [(UILabel *)v3->_titleLabel setFont:v17];

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UILabel *)v3->_titleLabel _setTextColorFollowsTintColor:1];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v18;

    v20 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43920]];
    [(UILabel *)v3->_descriptionLabel setFont:v20];

    [(UILabel *)v3->_descriptionLabel setNumberOfLines:3];
    [(UILabel *)v3->_descriptionLabel _setTextColorFollowsTintColor:1];
  }
  return v3;
}

- (NSString)titleText
{
  v2 = [(HUCameraErrorView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraErrorView *)self titleLabel];
  [v5 setText:v4];

  if (v4)
  {
    id v7 = [(HUCameraErrorView *)self labelStackView];
    uint64_t v6 = [(HUCameraErrorView *)self titleLabel];
    [v7 insertArrangedSubview:v6 atIndex:0];
  }
  else
  {
    id v7 = [(HUCameraErrorView *)self titleLabel];
    [v7 removeFromSuperview];
  }
}

- (NSString)descriptionText
{
  v2 = [(HUCameraErrorView *)self descriptionLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraErrorView *)self descriptionLabel];
  [v5 setText:v4];

  if (v4)
  {
    id v7 = [(HUCameraErrorView *)self labelStackView];
    uint64_t v6 = [(HUCameraErrorView *)self descriptionLabel];
    [v7 addArrangedSubview:v6];
  }
  else
  {
    id v7 = [(HUCameraErrorView *)self descriptionLabel];
    [v7 removeFromSuperview];
  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end