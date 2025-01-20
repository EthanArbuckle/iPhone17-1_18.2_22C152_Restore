@interface MKFirstPartyPhotoBigAttributionView
- (MKFirstPartyPhotoBigAttributionView)initWithContext:(int64_t)a3;
- (NSString)titleText;
- (UIImage)glyphImage;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)didEndAnimatingActivityIndicatorView;
- (void)didUpdateAttributionViewType;
- (void)willStartAnimatingActivityIndicatorView;
@end

@implementation MKFirstPartyPhotoBigAttributionView

- (MKFirstPartyPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKFirstPartyPhotoBigAttributionView;
  v3 = [(MKPhotoBigAttributionView *)&v6 initWithContext:a3];
  v4 = v3;
  if (v3)
  {
    [(MKFirstPartyPhotoBigAttributionView *)v3 _setupSubviews];
    [(MKFirstPartyPhotoBigAttributionView *)v4 _setupConstraints];
    [(MKFirstPartyPhotoBigAttributionView *)v4 didUpdateAttributionViewType];
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  glyphView = self->_glyphView;
  self->_glyphView = v8;

  [(UIImageView *)self->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UIImageView *)self->_glyphView setTintColor:v10];

  v11 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v11;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [MEMORY[0x1E4F42A30] systemFontOfSize:12.0];
  [(UILabel *)self->_titleLabel setFont:v13];

  v14 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)self->_titleLabel setTextColor:v14];

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v15 = [(MKPhotoBigAttributionView *)self contentView];
  [v15 addSubview:self->_glyphView];

  id v16 = [(MKPhotoBigAttributionView *)self contentView];
  [v16 addSubview:self->_titleLabel];
}

- (void)_setupConstraints
{
  v36[9] = *MEMORY[0x1E4F143B8];
  id v3 = [(MKPhotoBigAttributionView *)self contentView];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [(UIImageView *)self->_glyphView centerXAnchor];
  v34 = [v3 centerXAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v36[0] = v33;
  v32 = [(UIImageView *)self->_glyphView topAnchor];
  v31 = [v3 topAnchor];
  v30 = [v32 constraintGreaterThanOrEqualToAnchor:v31];
  v36[1] = v30;
  v29 = [(UIImageView *)self->_glyphView bottomAnchor];
  v24 = v3;
  v28 = [v3 centerYAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v36[2] = v27;
  v26 = [(UILabel *)self->_titleLabel topAnchor];
  v25 = [(UIImageView *)self->_glyphView bottomAnchor];
  v22 = [v26 constraintEqualToAnchor:v25 constant:4.0];
  v36[3] = v22;
  v21 = [(UILabel *)self->_titleLabel leadingAnchor];
  v20 = [v3 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:4.0];
  v36[4] = v19;
  v18 = [(UILabel *)self->_titleLabel trailingAnchor];
  v17 = [v3 trailingAnchor];
  id v16 = [v18 constraintEqualToAnchor:v17 constant:-4.0];
  v36[5] = v16;
  v15 = [(UILabel *)self->_titleLabel bottomAnchor];
  v14 = [v3 bottomAnchor];
  double v4 = [v15 constraintLessThanOrEqualToAnchor:v14 constant:-4.0];
  v36[6] = v4;
  double v5 = [(MKPhotoBigAttributionView *)self spinner];
  double v6 = [v5 centerXAnchor];
  double v7 = [(UIImageView *)self->_glyphView centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v36[7] = v8;
  v9 = [(MKPhotoBigAttributionView *)self spinner];
  v10 = [v9 centerYAnchor];
  v11 = [(UIImageView *)self->_glyphView centerYAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v36[8] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:9];
  [v23 activateConstraints:v13];
}

- (NSString)titleText
{
  v2 = [(MKPhotoBigAttributionView *)self type];
  if (v2)
  {
    if (v2 != (void *)1) {
      goto LABEL_6;
    }
    id v3 = @"More Photos [UGC]";
  }
  else
  {
    id v3 = @"Add Photo [UGC]";
  }
  v2 = _MKLocalizedStringFromThisBundle(v3);
LABEL_6:

  return (NSString *)v2;
}

- (UIImage)glyphImage
{
  int64_t v2 = [(MKPhotoBigAttributionView *)self type];
  id v3 = &stru_1ED919588;
  if (v2 == 1) {
    id v3 = @"photo.fill.on.rectangle.fill";
  }
  if (v2) {
    double v4 = v3;
  }
  else {
    double v4 = @"camera.fill";
  }
  double v5 = (void *)MEMORY[0x1E4F42A98];
  double v6 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0];
  double v7 = [v5 configurationWithFont:v6];

  v8 = [MEMORY[0x1E4F42A80] systemImageNamed:v4];
  v9 = [v8 imageWithConfiguration:v7];

  return (UIImage *)v9;
}

- (void)didUpdateAttributionViewType
{
  id v3 = [(MKFirstPartyPhotoBigAttributionView *)self titleText];
  [(UILabel *)self->_titleLabel setText:v3];

  glyphView = self->_glyphView;
  id v5 = [(MKFirstPartyPhotoBigAttributionView *)self glyphImage];
  [(UIImageView *)glyphView setImage:v5];
}

- (void)willStartAnimatingActivityIndicatorView
{
}

- (void)didEndAnimatingActivityIndicatorView
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end