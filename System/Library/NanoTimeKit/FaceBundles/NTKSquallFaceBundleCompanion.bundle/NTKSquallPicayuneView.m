@interface NTKSquallPicayuneView
- (NTKSquallPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation NTKSquallPicayuneView

- (NTKSquallPicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKSquallPicayuneView;
  v4 = [(NTKSquallPicayuneView *)&v11 initWithDevice:a3 clockTimer:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(NTKSquallPicayuneView *)v4 hourLabel];
    v7 = [v6 timeFormatter];
    [v7 setZeroPadTimeSubstringToSeparatorText:1];

    v8 = [(NTKSquallPicayuneView *)v5 inactiveHourLabel];
    v9 = [v8 timeFormatter];
    [v9 setZeroPadTimeSubstringToSeparatorText:1];

    [(NTKSquallPicayuneView *)v5 enumerateLabelsWithBlock:&stru_C470];
  }
  return v5;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)NTKSquallPicayuneView;
  [(NTKSquallPicayuneView *)&v48 layoutSubviews];
  [(NTKSquallPicayuneView *)self bounds];
  double Width = CGRectGetWidth(v49);
  [(NTKSquallPicayuneView *)self bounds];
  double Height = CGRectGetHeight(v50);
  v5 = [(NTKSquallPicayuneView *)self minuteLabel];
  [v5 frame];
  double v7 = v6;

  v8 = [(NTKSquallPicayuneView *)self hourLabel];
  [v8 frame];
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  double v47 = v11;
  v12 = [(NTKSquallPicayuneView *)self minuteLabel];
  [v12 opticalInsets];
  double v14 = v13;

  v15 = [(NTKSquallPicayuneView *)self hourLabel];
  [v15 opticalInsets];
  double v17 = v16;

  if (v14 >= v17) {
    double v18 = v17;
  }
  else {
    double v18 = v14;
  }
  [(NTKSquallPicayuneView *)self paddingInsets];
  double v20 = 18.5 - v19;
  v21 = [(NTKSquallPicayuneView *)self minuteLabel];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;

  [(NTKSquallPicayuneView *)self paddingInsets];
  double v27 = v18 + Width - v26 - v11;
  v28 = [(NTKSquallPicayuneView *)self minuteLabel];
  [v28 _lastLineBaseline];
  double v30 = Height;
  double v31 = Height - v29 - v20;

  v32 = [(NTKSquallPicayuneView *)self minuteLabel];
  objc_msgSend(v32, "setFrame:", v27, v31, v23, v25);

  v33 = [(NTKSquallPicayuneView *)self inactiveMinuteLabel];
  objc_msgSend(v33, "setFrame:", v27, v31, v23, v25);

  double v34 = v20 + 42.5;
  v35 = [(NTKSquallPicayuneView *)self hourLabel];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;

  [(NTKSquallPicayuneView *)self paddingInsets];
  double v41 = v18 + Width - v40 - v47;
  v42 = [(NTKSquallPicayuneView *)self hourLabel];
  [v42 _lastLineBaseline];
  double v44 = v30 - v43 - v34;

  v45 = [(NTKSquallPicayuneView *)self hourLabel];
  objc_msgSend(v45, "setFrame:", v41, v44, v37, v39);

  v46 = [(NTKSquallPicayuneView *)self inactiveHourLabel];
  objc_msgSend(v46, "setFrame:", v41, v44, v37, v39);
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  double v6 = [(NTKSquallPicayuneView *)self traitCollection];
  id v7 = [v6 activeAppearance];
  id v8 = [v5 activeAppearance];

  if (v7 != v8)
  {
    double v9 = [(NTKSquallPicayuneView *)self traitCollection];
    if ([v9 activeAppearance]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }

    double v11 = [(NTKSquallPicayuneView *)self hourLabel];
    [v11 setAlpha:v10];

    v12 = [(NTKSquallPicayuneView *)self minuteLabel];
    [v12 setAlpha:v10];

    double v13 = 1.0 - v10;
    double v14 = [(NTKSquallPicayuneView *)self inactiveHourLabel];
    [v14 setAlpha:v13];

    id v15 = [(NTKSquallPicayuneView *)self inactiveMinuteLabel];
    [v15 setAlpha:v13];
  }
}

@end