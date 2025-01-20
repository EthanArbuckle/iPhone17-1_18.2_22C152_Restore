@interface MadridTimeStampSliderTableCell
- (MadridTimeStampSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)newControl;
- (void)layoutSubviews;
@end

@implementation MadridTimeStampSliderTableCell

- (MadridTimeStampSliderTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v27.receiver = self;
  v27.super_class = (Class)MadridTimeStampSliderTableCell;
  v5 = [(MadridTimeStampSliderTableCell *)&v27 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel1 = v5->_valueLabel1;
    v5->_valueLabel1 = v6;

    v8 = v5->_valueLabel1;
    v9 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)v5->_valueLabel1 setText:@"OFF"];
    [(UILabel *)v5->_valueLabel1 sizeToFit];
    v10 = [(MadridTimeStampSliderTableCell *)v5 contentView];
    [v10 addSubview:v5->_valueLabel1];

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel2 = v5->_valueLabel2;
    v5->_valueLabel2 = v11;

    v13 = v5->_valueLabel2;
    v14 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v5->_valueLabel2 setText:@"15"];
    [(UILabel *)v5->_valueLabel2 sizeToFit];
    v15 = [(MadridTimeStampSliderTableCell *)v5 contentView];
    [v15 addSubview:v5->_valueLabel2];

    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel3 = v5->_valueLabel3;
    v5->_valueLabel3 = v16;

    v18 = v5->_valueLabel3;
    v19 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v18 setFont:v19];

    [(UILabel *)v5->_valueLabel3 setText:@"30"];
    [(UILabel *)v5->_valueLabel3 sizeToFit];
    v20 = [(MadridTimeStampSliderTableCell *)v5 contentView];
    [v20 addSubview:v5->_valueLabel3];

    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel4 = v5->_valueLabel4;
    v5->_valueLabel4 = v21;

    v23 = v5->_valueLabel4;
    v24 = +[UIFont systemFontOfSize:12.0];
    [(UILabel *)v23 setFont:v24];

    [(UILabel *)v5->_valueLabel4 setText:@"60"];
    [(UILabel *)v5->_valueLabel4 sizeToFit];
    v25 = [(MadridTimeStampSliderTableCell *)v5 contentView];
    [v25 addSubview:v5->_valueLabel4];
  }
  return v5;
}

- (id)newControl
{
  v2 = +[UIColor colorWithWhite:0.596078431 alpha:1.0];
  v3 = -[MadridDiscreteSlider initWithFrame:]([MadridDiscreteSlider alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MadridDiscreteSlider *)v3 setMinimumTrackTintColor:v2];
  [(MadridDiscreteSlider *)v3 setMaximumTrackTintColor:v2];
  [(MadridDiscreteSlider *)v3 setTrackMarkersColor:v2];

  return v3;
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)MadridTimeStampSliderTableCell;
  [(MadridTimeStampSliderTableCell *)&v45 layoutSubviews];
  v3 = [(MadridTimeStampSliderTableCell *)self contentView];
  [v3 bounds];

  v4 = [(MadridTimeStampSliderTableCell *)self control];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  PSRoundToPixel();
  objc_msgSend(v4, "setFrame:", v6, v11, v8, v10);
  v12 = [(MadridTimeStampSliderTableCell *)self contentView];
  [v4 bounds];
  objc_msgSend(v4, "trackRectForBounds:");
  objc_msgSend(v12, "convertRect:fromView:", v4);
  double v14 = v13;
  double v16 = v15;

  [(UILabel *)self->_valueLabel1 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  PSRoundToPixel();
  -[UILabel setFrame:](self->_valueLabel1, "setFrame:", v14 - v23, v18, v20, v22);
  [(UILabel *)self->_valueLabel1 _setFirstLineBaselineFrameOriginY:40.0];
  [(UILabel *)self->_valueLabel2 frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  PSRoundToPixel();
  -[UILabel setFrame:](self->_valueLabel2, "setFrame:", v14 + v16 / 3.0 - v30, v25, v27, v29);
  [(UILabel *)self->_valueLabel2 _setFirstLineBaselineFrameOriginY:40.0];
  [(UILabel *)self->_valueLabel3 frame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  PSRoundToPixel();
  -[UILabel setFrame:](self->_valueLabel3, "setFrame:", v14 + v16 / 3.0 * 2.0 - v37, v32, v34, v36);
  [(UILabel *)self->_valueLabel3 _setFirstLineBaselineFrameOriginY:40.0];
  [(UILabel *)self->_valueLabel4 frame];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  PSRoundToPixel();
  -[UILabel setFrame:](self->_valueLabel4, "setFrame:", v14 + v16 / 3.0 * 3.0 - v44, v39, v41, v43);
  [(UILabel *)self->_valueLabel4 _setFirstLineBaselineFrameOriginY:40.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel4, 0);
  objc_storeStrong((id *)&self->_valueLabel3, 0);
  objc_storeStrong((id *)&self->_valueLabel2, 0);

  objc_storeStrong((id *)&self->_valueLabel1, 0);
}

@end