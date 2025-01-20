@interface FMFTitleView
- (FMFLocation)location;
- (NSLayoutConstraint)titleBottomConstraint;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)initFromNib;
- (void)_updateLabels:(id)a3;
- (void)setLocation:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleBottomConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateLocation:(id)a3;
@end

@implementation FMFTitleView

- (id)initFromNib
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 loadNibNamed:@"TitleView_iOS" owner:self options:0];

  v5 = [v4 lastObject];

  return v5;
}

- (void)updateLocation:(id)a3
{
  id v4 = a3;
  [(FMFTitleView *)self setLocation:v4];
  [(FMFTitleView *)self _updateLabels:v4];
}

- (void)_updateLabels:(id)a3
{
  id v4 = a3;
  v5 = [v4 locationShortAddressWithAge];
  v6 = [(FMFTitleView *)self subtitleLabel];
  [v6 setText:v5];

  v7 = [v4 location];

  v8 = [(FMFTitleView *)self titleBottomConstraint];
  v9 = v8;
  double v10 = 16.0;
  if (!v7) {
    double v10 = 2.0;
  }
  [v8 setConstant:v10];

  v11 = [v4 handle];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30__FMFTitleView__updateLabels___block_invoke;
  v12[3] = &unk_264343868;
  v12[4] = self;
  [v11 prettyNameWithCompletion:v12];
}

void __30__FMFTitleView__updateLabels___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 titleLabel];
  [v4 setText:v3];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (NSLayoutConstraint)titleBottomConstraint
{
  return self->_titleBottomConstraint;
}

- (void)setTitleBottomConstraint:(id)a3
{
}

- (FMFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_titleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end