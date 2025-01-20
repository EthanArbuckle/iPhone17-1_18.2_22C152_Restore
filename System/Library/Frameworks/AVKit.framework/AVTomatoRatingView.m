@interface AVTomatoRatingView
- (AVTomatoRatingView)init;
- (UIColor)textColor;
- (UIFont)font;
- (float)tomatoRating;
- (id)viewForLastBaselineLayout;
- (unint64_t)tomatoFreshness;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTomatoFreshness:(unint64_t)a3;
- (void)setTomatoRating:(float)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVTomatoRatingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tomatoRatingLabel, 0);

  objc_storeStrong((id *)&self->_tomatoRatingIcon, 0);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (unint64_t)tomatoFreshness
{
  return self->_tomatoFreshness;
}

- (float)tomatoRating
{
  return self->_tomatoRating;
}

- (id)viewForLastBaselineLayout
{
  return self->_tomatoRatingLabel;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTomatoRatingView;
  [(AVTomatoRatingView *)&v4 traitCollectionDidChange:a3];
  [(UILabel *)self->_tomatoRatingLabel setTextColor:self->_textColor];
}

- (void)setTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UILabel *)self->_tomatoRatingLabel setTextColor:v5];
  }
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return [(UILabel *)self->_tomatoRatingLabel font];
}

- (void)setTomatoRating:(float)a3
{
  if (self->_tomatoRating != a3)
  {
    if (a3 > 1.0) {
      a3 = a3 / 100.0;
    }
    self->_tomatoRating = a3;
    id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v7 setNumberStyle:3];
    *(float *)&double v4 = self->_tomatoRating;
    v5 = [NSNumber numberWithFloat:v4];
    v6 = [v7 stringFromNumber:v5];

    [(UILabel *)self->_tomatoRatingLabel setText:v6];
  }
}

- (void)setTomatoFreshness:(unint64_t)a3
{
  if (self->_tomatoFreshness != a3)
  {
    self->_tomatoFreshness = a3;
    if (a3 > 2)
    {
      id v7 = 0;
      id v11 = 0;
    }
    else
    {
      double v4 = off_1E5FC47C8[a3];
      AVLocalizedString(off_1E5FC47B0[a3]);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E4FB1818];
      v6 = AVBundle();
      id v7 = [v5 imageNamed:v4 inBundle:v6 compatibleWithTraitCollection:0];
    }
    [v7 scale];
    if (fabs(v8 + -2.0) > 0.00000011920929)
    {
      v9 = (void *)MEMORY[0x1E4FB1818];
      id v10 = v7;
      id v7 = objc_msgSend(v9, "imageWithCGImage:scale:orientation:", objc_msgSend(v10, "CGImage"), objc_msgSend(v10, "imageOrientation"), 2.0);
    }
    [(UIImageView *)self->_tomatoRatingIcon setImage:v7];
    [(UIImageView *)self->_tomatoRatingIcon setAccessibilityValue:v11];
  }
}

- (AVTomatoRatingView)init
{
  v33.receiver = self;
  v33.super_class = (Class)AVTomatoRatingView;
  v2 = [(AVTomatoRatingView *)&v33 init];
  v3 = v2;
  if (v2)
  {
    v2->_tomatoFreshness = 3;
    v2->_tomatoRating = NAN;
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemPinkColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    tomatoRatingIcon = v3->_tomatoRatingIcon;
    v3->_tomatoRatingIcon = v6;

    [(UIImageView *)v3->_tomatoRatingIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_tomatoRatingIcon setAccessibilityIdentifier:@"AVTomatoRatingIcon"];
    [(AVTomatoRatingView *)v3 addSubview:v3->_tomatoRatingIcon];
    double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    tomatoRatingLabel = v3->_tomatoRatingLabel;
    v3->_tomatoRatingLabel = v8;

    [(UILabel *)v3->_tomatoRatingLabel setBackgroundColor:0];
    id v10 = v3->_tomatoRatingLabel;
    id v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_tomatoRatingLabel setOpaque:0];
    [(UILabel *)v3->_tomatoRatingLabel setTextColor:v3->_textColor];
    [(UILabel *)v3->_tomatoRatingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_tomatoRatingLabel setAccessibilityIdentifier:@"AVTomatoRatingLabel"];
    [(AVTomatoRatingView *)v3 addSubview:v3->_tomatoRatingLabel];
    v12 = [MEMORY[0x1E4F1CA48] array];
    v13 = [(UIImageView *)v3->_tomatoRatingIcon bottomAnchor];
    v14 = [(UILabel *)v3->_tomatoRatingLabel lastBaselineAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:1.0];
    [v12 addObject:v15];

    v16 = [(UIImageView *)v3->_tomatoRatingIcon leftAnchor];
    v17 = [(AVTomatoRatingView *)v3 leftAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v12 addObject:v18];

    v19 = [(UILabel *)v3->_tomatoRatingLabel topAnchor];
    v20 = [(AVTomatoRatingView *)v3 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v12 addObject:v21];

    v22 = [(UILabel *)v3->_tomatoRatingLabel rightAnchor];
    v23 = [(AVTomatoRatingView *)v3 rightAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v12 addObject:v24];

    v25 = [(UILabel *)v3->_tomatoRatingLabel bottomAnchor];
    v26 = [(AVTomatoRatingView *)v3 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v12 addObject:v27];

    v28 = [(UILabel *)v3->_tomatoRatingLabel leftAnchor];
    v29 = [(UIImageView *)v3->_tomatoRatingIcon rightAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:6.0];

    LODWORD(v31) = *(_DWORD *)"";
    [v30 setPriority:v31];
    [v12 addObject:v30];
    [MEMORY[0x1E4F28DC8] activateConstraints:v12];
  }
  return v3;
}

@end