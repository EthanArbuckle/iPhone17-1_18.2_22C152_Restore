@interface MPDetailSlider
+ (Class)labelClass;
- (BOOL)allowsDetailScrubbing;
- (BOOL)allowsScrubbing;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)detailScrubbingAvailableForCurrentDuration;
- (BOOL)isTracking;
- (CGRect)thumbHitRect;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (MPDetailSlider)initWithFrame:(CGRect)a3;
- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5;
- (MPDetailSliderDelegate)delegate;
- (NSString)localizedScrubSpeedText;
- (UIEdgeInsets)_thumbHitEdgeInsets;
- (double)availableDuration;
- (double)detailScrubbingVerticalRange;
- (double)duration;
- (double)minTimeLabelWidth;
- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4;
- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5;
- (id)_stringForCurrentTime:(double)a3;
- (id)_stringForInverseCurrentTime:(double)a3;
- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4;
- (id)createThumbView;
- (id)currentThumbImage;
- (id)timeLabelFontForStyle:(int64_t)a3;
- (id)timeLabelTextColorForStyle:(int64_t)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)timeLabelStyle;
- (void)_autoscrubTick:(id)a3;
- (void)_commitValue;
- (void)_resetScrubInfo;
- (void)_setValueWhileTracking:(float)a3 duration:(double)a4;
- (void)_setupControlsForStyle;
- (void)_updateForAvailableDuraton;
- (void)_updateTimeDisplayForTime:(double)a3;
- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4;
- (void)_updateTrackInset;
- (void)cancelTracking;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4;
- (void)detailScrubController:(id)a3 didChangeValue:(float)a4;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAllowsDetailScrubbing:(BOOL)a3;
- (void)setAllowsScrubbing:(BOOL)a3;
- (void)setAvailableDuration:(double)duration;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailScrubbingVerticalRange:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMinTimeLabelWidth:(double)a3;
- (void)setTimeLabelStyle:(int64_t)a3;
- (void)setValue:(float)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)setValue:(float)a3 duration:(double)a4;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MPDetailSlider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);
  objc_storeStrong((id *)&self->_glowDetailScrubImageView, 0);
  objc_storeStrong((id *)&self->_downloadingTrackOverlay, 0);
  objc_storeStrong((id *)&self->_autoscrubTimer, 0);
  objc_storeStrong((id *)&self->_scrubController, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);

  objc_storeStrong((id *)&self->_currentTimeInverseLabel, 0);
}

- (double)minTimeLabelWidth
{
  return self->_minTimeLabelWidth;
}

- (int64_t)timeLabelStyle
{
  return self->_timeLabelStyle;
}

- (double)availableDuration
{
  return self->_availableDuration;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDetailScrubbingVerticalRange:(double)a3
{
  self->_detailScrubbingVerticalRange = a3;
}

- (double)detailScrubbingVerticalRange
{
  return self->_detailScrubbingVerticalRange;
}

- (BOOL)allowsScrubbing
{
  return self->_allowsScrubbing;
}

- (void)setDelegate:(id)a3
{
}

- (MPDetailSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPDetailSliderDelegate *)WeakRetained;
}

- (void)_updateForAvailableDuraton
{
  [(MPDetailSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (!self->_thumbImageView)
  {
    [(MPDetailSlider *)self setNeedsLayout];
    [(MPDetailSlider *)self layoutIfNeeded];
  }
  v89.origin.CGFloat x = v4;
  v89.origin.CGFloat y = v6;
  v89.size.CGFloat width = v8;
  v89.size.CGFloat height = v10;
  if (CGRectGetWidth(v89) > 0.0)
  {
    int64_t style = self->_style;
    if ((unint64_t)(style - 1) < 2)
    {
      if (self->_availableDuration < self->_duration)
      {
        -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        [(MPDetailSlider *)self value];
        LODWORD(v87) = v52;
        -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v45, v47, v49, v51, v87);
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        CGFloat v58 = v57;
        CGFloat v60 = v59;
        v97.origin.CGFloat x = v45;
        v97.origin.CGFloat y = v47;
        v97.size.CGFloat width = v49;
        v97.size.CGFloat height = v51;
        CGFloat v61 = -CGRectGetMinX(v97);
        v98.origin.CGFloat x = v54;
        v98.origin.CGFloat y = v56;
        v98.size.CGFloat width = v58;
        v98.size.CGFloat height = v60;
        CGRect v99 = CGRectOffset(v98, v61, 0.0);
        double MidX = CGRectGetMidX(v99);
        double v63 = self->_availableDuration / self->_duration;
        v100.origin.CGFloat x = v45;
        v100.origin.CGFloat y = v47;
        v100.size.CGFloat width = v49;
        v100.size.CGFloat height = v51;
        CGFloat v64 = -(MidX - v63 * CGRectGetWidth(v100));
        v101.origin.CGFloat x = v45;
        v101.origin.CGFloat y = v47;
        v101.size.CGFloat width = v49;
        v101.size.CGFloat height = v51;
        CGFloat MinX = CGRectGetMinX(v101);
        v102.size.CGFloat height = 1.0;
        v102.origin.CGFloat x = MidX;
        v102.origin.CGFloat y = v47 + 1.0;
        v102.size.CGFloat width = v64;
        CGRect v103 = CGRectOffset(v102, MinX, 0.0);
        CGFloat x = v103.origin.x;
        if (v103.size.width < 0.00000011920929) {
          return;
        }
        CGFloat y = v103.origin.y;
        CGFloat width = v103.size.width;
        CGFloat height = v103.size.height;
        downloadingTrackOverlaCGFloat y = self->_downloadingTrackOverlay;
        if (!downloadingTrackOverlay)
        {
          if (self->_thumbImageView)
          {
            v70 = (void *)MEMORY[0x1E4FB1818];
            v71 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
            v72 = [v70 imageNamed:@"VideoPlayer_Slider_Track_Hollow" inBundle:v71];

            v73 = [MEMORY[0x1E4FB1618] blackColor];
            v74 = [v72 _flatImageWithColor:v73];

            [(MPDetailSlider *)self setMaximumTrackImage:v74 forState:0];
            v75 = [(MPDetailSlider *)self _maxTrackView];
            [v75 _setDrawsAsBackdropOverlay:1];

            v76 = [(MPDetailSlider *)self _maxTrackView];
            [v76 setAlpha:0.4];

            id v77 = objc_alloc(MEMORY[0x1E4FB1EB0]);
            v78 = (UIView *)objc_msgSend(v77, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            v79 = self->_downloadingTrackOverlay;
            self->_downloadingTrackOverlaCGFloat y = v78;

            [(UIView *)self->_downloadingTrackOverlay _setDrawsAsBackdropOverlay:1];
            v80 = self->_downloadingTrackOverlay;
            v81 = [MEMORY[0x1E4FB1618] blackColor];
            [(UIView *)v80 setBackgroundColor:v81];

            [(UIView *)self->_downloadingTrackOverlay setAlpha:0.4];
            [(MPDetailSlider *)self insertSubview:self->_downloadingTrackOverlay belowSubview:self->_thumbImageView];

            downloadingTrackOverlaCGFloat y = self->_downloadingTrackOverlay;
          }
          else
          {
            downloadingTrackOverlaCGFloat y = 0;
          }
        }
        double v83 = x;
        double v84 = y;
        double v85 = width;
        double v86 = height;
        goto LABEL_24;
      }
    }
    else
    {
      if ((unint64_t)(style - 3) > 1) {
        return;
      }
      if (self->_availableDuration < self->_duration)
      {
        -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:", v4, v6, v8, v10);
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        [(MPDetailSlider *)self value];
        LODWORD(v87) = v20;
        -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v13, v15, v17, v19, v87);
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        v90.origin.CGFloat x = v13;
        v90.origin.CGFloat y = v15;
        v90.size.CGFloat width = v17;
        v90.size.CGFloat height = v19;
        CGFloat v29 = -CGRectGetMinX(v90);
        v91.origin.CGFloat x = v22;
        v91.origin.CGFloat y = v24;
        v91.size.CGFloat width = v26;
        v91.size.CGFloat height = v28;
        CGRect v92 = CGRectOffset(v91, v29, 0.0);
        double v30 = CGRectGetMidX(v92);
        double v31 = self->_availableDuration / self->_duration;
        v93.origin.CGFloat x = v13;
        v93.origin.CGFloat y = v15;
        v93.size.CGFloat width = v17;
        v93.size.CGFloat height = v19;
        CGFloat v32 = -(v30 - v31 * CGRectGetWidth(v93));
        v94.origin.CGFloat x = v13;
        v94.origin.CGFloat y = v15;
        v94.size.CGFloat width = v17;
        v94.size.CGFloat height = v19;
        CGFloat v33 = CGRectGetMinX(v94);
        v95.origin.CGFloat x = v30;
        v95.origin.CGFloat y = v15;
        v95.size.CGFloat width = v32;
        v95.size.CGFloat height = v19;
        CGRect v96 = CGRectOffset(v95, v33, 0.0);
        CGFloat v34 = v96.origin.x;
        if (v96.size.width < 0.00000011920929) {
          return;
        }
        CGFloat v35 = v96.origin.y;
        CGFloat v36 = v96.size.width;
        CGFloat v37 = v96.size.height;
        downloadingTrackOverlaCGFloat y = self->_downloadingTrackOverlay;
        if (!downloadingTrackOverlay)
        {
          if (self->_thumbImageView)
          {
            id v39 = objc_alloc(MEMORY[0x1E4FB1EB0]);
            v40 = (UIView *)objc_msgSend(v39, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
            v41 = self->_downloadingTrackOverlay;
            self->_downloadingTrackOverlaCGFloat y = v40;

            [(UIView *)self->_downloadingTrackOverlay _setDrawsAsBackdropOverlayWithBlendMode:2];
            v42 = self->_downloadingTrackOverlay;
            v43 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.05];
            [(UIView *)v42 setBackgroundColor:v43];

            [(MPDetailSlider *)self insertSubview:self->_downloadingTrackOverlay belowSubview:self->_thumbImageView];
            downloadingTrackOverlaCGFloat y = self->_downloadingTrackOverlay;
          }
          else
          {
            downloadingTrackOverlaCGFloat y = 0;
          }
        }
        double v83 = v34;
        double v84 = v35;
        double v85 = v36;
        double v86 = v37;
LABEL_24:
        -[UIView setFrame:](downloadingTrackOverlay, "setFrame:", v83, v84, v85, v86);
        return;
      }
    }
    [(MPDetailSlider *)self _setupControlsForStyle];
    [(UIView *)self->_downloadingTrackOverlay removeFromSuperview];
    v82 = self->_downloadingTrackOverlay;
    self->_downloadingTrackOverlaCGFloat y = 0;
  }
}

- (void)_commitValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [(MPDetailSlider *)self value];
    double v4 = self->_duration * v3;
    *(float *)&double v4 = v4;
    [WeakRetained detailSlider:self didChangeValue:v4];
  }
}

- (void)_resetScrubInfo
{
  thumbImageView = self->_thumbImageView;
  double v4 = [(MPDetailSlider *)self currentThumbImage];
  [(UIImageView *)thumbImageView setImage:v4];

  id v5 = [(UIImageView *)self->_glowDetailScrubImageView layer];
  [v5 removeAnimationForKey:@"pulseAnimation"];
}

- (id)_stringForInverseCurrentTime:(double)a3
{
  int64_t timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && fabs(a3) < 30.0)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.MediaPlayer", a3);
    id v5 = [v4 localizedStringForKey:@"LIVE" value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    id v5 = [(MPDetailSlider *)self _stringForTime:0 elapsed:a3];
  }

  return v5;
}

- (id)_stringForCurrentTime:(double)a3
{
  int64_t timeLabelStyle = self->_timeLabelStyle;
  if (timeLabelStyle == 3 || timeLabelStyle == 2 && vabdd_f64(self->_duration, a3) < 30.0)
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.MediaPlayer", a3);
    id v5 = [v4 localizedStringForKey:@"UNKNOWN_DURATION" value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    id v5 = [(MPDetailSlider *)self _stringForTime:1 elapsed:a3];
  }

  return v5;
}

- (id)_stringForTime:(double)a3 elapsed:(BOOL)a4
{
  formatter = self->_formatter;
  if (a4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(AVTimeFormatter *)formatter setStyle:v7];
  double v8 = self->_formatter;

  return (id)[(AVTimeFormatter *)v8 stringFromSeconds:a3];
}

- (void)_updateTimeDisplayForTime:(double)a3 force:(BOOL)a4
{
  double v5 = floor(a3);
  if (a4 || vabdd_f64(self->_currentTime, v5) > 2.22044605e-16)
  {
    if (self->_timeLabelStyle != 1)
    {
      currentTimeLabel = self->_currentTimeLabel;
      uint64_t v7 = [(MPDetailSlider *)self _stringForCurrentTime:v5];
      [(UILabel *)currentTimeLabel setText:v7];

      currentTimeInverseLabel = self->_currentTimeInverseLabel;
      double v9 = [(MPDetailSlider *)self _stringForInverseCurrentTime:self->_duration - v5];
      [(UILabel *)currentTimeInverseLabel setText:v9];

      [(MPDetailSlider *)self setNeedsLayout];
    }
    self->_currentTime = v5;
  }
}

- (void)_updateTimeDisplayForTime:(double)a3
{
}

- (void)_updateTrackInset
{
  [(MPDetailSlider *)self duration];
  float v3 = -[MPDetailSlider _stringForInverseCurrentTime:](self, "_stringForInverseCurrentTime:");
  double v4 = [(UILabel *)self->_currentTimeInverseLabel font];
  objc_msgSend(v3, "_legacy_sizeWithFont:", v4);
  double v6 = v5;

  int64_t timeLabelStyle = self->_timeLabelStyle;
  if ((timeLabelStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    double v9 = [v8 localizedStringForKey:@"LIVE" value:&stru_1EE680640 table:@"MediaPlayer"];
    double v10 = [(UILabel *)self->_currentTimeInverseLabel font];
    objc_msgSend(v9, "_legacy_sizeWithFont:", v10);
    double v12 = v11;

    if (v6 < v12) {
      double v6 = v12;
    }
    int64_t timeLabelStyle = self->_timeLabelStyle;
  }
  double v13 = 0.0;
  if (timeLabelStyle != 1)
  {
    double minTimeLabelWidth = self->_minTimeLabelWidth;
    if (minTimeLabelWidth < v6) {
      double minTimeLabelWidth = v6;
    }
    double v13 = minTimeLabelWidth + 4.0;
  }
  self->_trackInset = v13;
  if (self->_maxTrackWidth > 0.0)
  {
    [(MPDetailSlider *)self bounds];
    v18.receiver = self;
    v18.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider trackRectForBounds:](&v18, sel_trackRectForBounds_);
    CGRect v20 = CGRectInset(v19, self->_trackInset, 0.0);
    double Width = CGRectGetWidth(v20);
    maxTrackdouble Width = self->_maxTrackWidth;
    if (Width > maxTrackWidth)
    {
      float v17 = (Width - maxTrackWidth) * 0.5;
      self->_trackInset = self->_trackInset + ceilf(v17);
    }
  }
}

- (void)_setupControlsForStyle
{
  float v3 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
  if (self->_timeLabelStyle == 3)
  {
    v31.CGFloat width = 1.0;
    v31.CGFloat height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
    double v4 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [(MPDetailSlider *)self setThumbImage:v4 forState:0];

    char v5 = 1;
  }
  else
  {
    if (self->_style == 5) {
      [(MPDetailSlider *)self duration];
    }
    char v5 = 0;
  }
  int64_t style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke_3;
    block[3] = &unk_1E57F9EA8;
    id v9 = v3;
    id v26 = v9;
    if (_setupControlsForStyle___trackImageOnce_92 == -1)
    {
      if ((v5 & 1) == 0)
      {
LABEL_16:
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        CGFloat v22 = __40__MPDetailSlider__setupControlsForStyle__block_invoke_4;
        double v23 = &unk_1E57F9EA8;
        id v24 = v9;
        if (_setupControlsForStyle___thumbImageOnce_94 != -1) {
          dispatch_once(&_setupControlsForStyle___thumbImageOnce_94, &v20);
        }
        -[MPDetailSlider setThumbImage:forState:](self, "setThumbImage:forState:", _setupControlsForStyle___thumbImage_93, 0, v20, v21, v22, v23);
      }
    }
    else
    {
      dispatch_once(&_setupControlsForStyle___trackImageOnce_92, block);
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
    }
    [(MPDetailSlider *)self setMinimumTrackImage:_setupControlsForStyle___minTrackImage_90 forState:0];
    [(MPDetailSlider *)self setMaximumTrackImage:_setupControlsForStyle___maxTrackImage_91 forState:0];
    double v8 = v26;
    goto LABEL_20;
  }
  if ((unint64_t)(style - 3) < 2)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke;
    v29[3] = &unk_1E57F9EA8;
    id v7 = v3;
    id v30 = v7;
    if (_setupControlsForStyle___trackImageOnce == -1)
    {
      if ((v5 & 1) == 0)
      {
LABEL_10:
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __40__MPDetailSlider__setupControlsForStyle__block_invoke_2;
        v27[3] = &unk_1E57F9EA8;
        id v28 = v7;
        if (_setupControlsForStyle___thumbImageOnce != -1) {
          dispatch_once(&_setupControlsForStyle___thumbImageOnce, v27);
        }
        [(MPDetailSlider *)self setThumbImage:_setupControlsForStyle___thumbImage forState:0];
      }
    }
    else
    {
      dispatch_once(&_setupControlsForStyle___trackImageOnce, v29);
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
    }
    [(MPDetailSlider *)self setMinimumTrackImage:_setupControlsForStyle___minTrackImage forState:0];
    [(MPDetailSlider *)self setMaximumTrackImage:_setupControlsForStyle___maxTrackImage forState:0];
    double v8 = v30;
LABEL_20:

    goto LABEL_31;
  }
  if (style == 5)
  {
    if ((v5 & 1) == 0)
    {
      BOOL v10 = [(MPDetailSlider *)self allowsScrubbing];
      if (v10)
      {
        double v11 = [(MPDetailSlider *)self tintColor];
        double v12 = 15.0;
      }
      else
      {
        double v11 = [MEMORY[0x1E4FB1618] blackColor];
        double v12 = 7.0;
      }
      double v13 = [(MPDetailSlider *)self _modernThumbImageWithColor:v11 height:v10 includeShadow:v12];
      [(MPDetailSlider *)self setThumbImage:v13 forState:0];
    }
    double v14 = [(MPDetailSlider *)self traitCollection];
    if ([v14 userInterfaceStyle] == 2)
    {
      double v15 = 0.93;
      double v16 = 1.0;
    }
    else
    {
      double v15 = 0.07;
      double v16 = 0.0;
    }
    float v17 = [MEMORY[0x1E4FB1618] colorWithWhite:v16 alpha:v15];

    objc_super v18 = [(MPDetailSlider *)self _colorSliceImageWithColor:v17 height:7.0];
    CGRect v19 = [(MPDetailSlider *)self _colorSliceImageWithColor:v17 height:7.0];
    [(MPDetailSlider *)self setMinimumTrackImage:v18 forState:0];
    [(MPDetailSlider *)self setMaximumTrackImage:v19 forState:0];
  }
LABEL_31:
}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4FB1818] imageNamed:@"VideoPlayer_Slider_Track" inBundle:*(void *)(a1 + 32)];
  v1 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.35];
  uint64_t v2 = [v7 _flatImageWithColor:v1];
  float v3 = (void *)_setupControlsForStyle___minTrackImage;
  _setupControlsForStyle___minTrackImage = v2;

  double v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.05];
  uint64_t v5 = [v7 _flatImageWithColor:v4];
  double v6 = (void *)_setupControlsForStyle___maxTrackImage;
  _setupControlsForStyle___maxTrackImage = v5;
}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4FB1818] imageNamed:@"VideoPlayer_Slider_Thumb_Small" inBundle:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v1;

  float v3 = (void *)_setupControlsForStyle___thumbImage;
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v5 = [v3 _flatImageWithColor:v4];
  double v6 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v5;

  id v7 = (void *)_setupControlsForStyle___thumbImage;
  double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  uint64_t v9 = [v7 imageWithEtchedBorderOfColor:v8 radius:0.5];
  BOOL v10 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v9;

  id v14 = objc_alloc_init(MEMORY[0x1E4FB1388]);
  double v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v14 setShadowColor:v11];

  [v14 setShadowBlurRadius:2.0];
  objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);
  uint64_t v12 = [(id)_setupControlsForStyle___thumbImage imageWithShadow:v14];
  double v13 = (void *)_setupControlsForStyle___thumbImage;
  _setupControlsForStyle___thumbImage = v12;
}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_3(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4FB1818] imageNamed:@"VideoPlayer_Slider_Track" inBundle:*(void *)(a1 + 32)];
  uint64_t v1 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v2 = [v7 _flatImageWithColor:v1];
  float v3 = (void *)_setupControlsForStyle___minTrackImage_90;
  _setupControlsForStyle___minTrackImage_90 = v2;

  double v4 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v5 = [v7 _flatImageWithColor:v4];
  double v6 = (void *)_setupControlsForStyle___maxTrackImage_91;
  _setupControlsForStyle___maxTrackImage_91 = v5;
}

void __40__MPDetailSlider__setupControlsForStyle__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4FB1818] imageNamed:@"VideoPlayer_Slider_Thumb" inBundle:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)_setupControlsForStyle___thumbImage_93;
  _setupControlsForStyle___thumbImage_93 = v1;

  float v3 = (void *)_setupControlsForStyle___thumbImage_93;
  double v4 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v5 = [v3 _flatImageWithColor:v4];
  double v6 = (void *)_setupControlsForStyle___thumbImage_93;
  _setupControlsForStyle___thumbImage_93 = v5;

  id v7 = (void *)_setupControlsForStyle___thumbImage_93;
  double v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  uint64_t v9 = [v7 imageWithEtchedBorderOfColor:v8 radius:0.5];
  BOOL v10 = (void *)_setupControlsForStyle___thumbImage_93;
  _setupControlsForStyle___thumbImage_93 = v9;

  id v14 = objc_alloc_init(MEMORY[0x1E4FB1388]);
  double v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v14 setShadowColor:v11];

  [v14 setShadowBlurRadius:2.0];
  objc_msgSend(v14, "setShadowOffset:", 0.0, 2.0);
  uint64_t v12 = [(id)_setupControlsForStyle___thumbImage_93 imageWithShadow:v14];
  double v13 = (void *)_setupControlsForStyle___thumbImage_93;
  _setupControlsForStyle___thumbImage_93 = v12;
}

- (id)_colorSliceImageWithColor:(id)a3 height:(double)a4
{
  id v6 = a3;
  [v6 alphaComponent];
  double v8 = 1.0 - v7;
  uint64_t v9 = [(MPDetailSlider *)self traitCollection];
  [v9 displayScale];
  if (v10 == 0.0)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", 0.00000011920929);
    [v11 scale];
    CGFloat v13 = v12;
    v18.CGFloat width = 1.0;
    v18.CGFloat height = a4;
    UIGraphicsBeginImageContextWithOptions(v18, v8 <= 0.00000011920929, v13);
  }
  else
  {
    CGFloat v14 = v10;
    v19.CGFloat width = 1.0;
    v19.CGFloat height = a4;
    UIGraphicsBeginImageContextWithOptions(v19, v8 <= 0.00000011920929, v14);
  }

  [v6 setFill];
  v20.origin.CGFloat x = 0.0;
  v20.origin.CGFloat y = 0.0;
  v20.size.CGFloat width = 1.0;
  v20.size.CGFloat height = a4;
  UIRectFillUsingBlendMode(v20, kCGBlendModeCopy);
  double v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)_modernThumbImageWithColor:(id)a3 height:(double)a4 includeShadow:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [(MPDetailSlider *)self traitCollection];
  [v9 displayScale];
  if (v10 == 0.0)
  {
    double v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
    CGFloat v13 = v12;
    v27.CGFloat width = 6.0;
    v27.CGFloat height = a4 + 4.0;
    UIGraphicsBeginImageContextWithOptions(v27, 0, v13);
  }
  else
  {
    CGFloat v14 = v10;
    v28.CGFloat width = 6.0;
    v28.CGFloat height = a4 + 4.0;
    UIGraphicsBeginImageContextWithOptions(v28, 0, v14);
  }

  if (v5)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    id v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    float v17 = (CGColor *)[v16 CGColor];
    CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E4F1DB30], 2.0, v17);
  }
  [v8 setFill];
  CGSize v18 = [(MPDetailSlider *)self traitCollection];
  [v18 displayScale];
  double v20 = 1.0 / v19;
  if (1.0 / v19 == 0.0)
  {
    uint64_t v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v21 scale];
    double v20 = v22;
  }
  double v23 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 2.0, 2.0, v20 + 1.0, a4, 3.0);
  [v23 fill];

  id v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v24;
}

- (id)timeLabelTextColorForStyle:(int64_t)a3
{
  if ((unint64_t)(self->_style - 3) > 1) {
    objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", a3);
  }
  else {
  float v3 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", a3, 1.0, 0.45);
  }

  return v3;
}

- (id)timeLabelFontForStyle:(int64_t)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int64_t style = self->_style;
  if ((unint64_t)(style - 1) < 2)
  {
    id v6 = (void *)MEMORY[0x1E4FB1798];
    double v7 = 12.0;
    goto LABEL_7;
  }
  if ((unint64_t)(style - 3) >= 2)
  {
    if (style != 5)
    {
      double v4 = (void *)MEMORY[0x1E4FB1798];
      double v5 = 14.0;
      goto LABEL_9;
    }
    id v6 = (void *)MEMORY[0x1E4FB1798];
    double v7 = 10.0;
LABEL_7:
    id v8 = objc_msgSend(v6, "systemFontOfSize:", a3, v7);
    goto LABEL_10;
  }
  double v4 = (void *)MEMORY[0x1E4FB1798];
  double v5 = 13.0;
LABEL_9:
  id v8 = objc_msgSend(v4, "boldSystemFontOfSize:", a3, v5);
LABEL_10:
  uint64_t v9 = v8;
  double v10 = [v8 fontDescriptor];
  uint64_t v25 = *MEMORY[0x1E4FB2868];
  uint64_t v12 = *MEMORY[0x1E4FB2888];
  v22[0] = *MEMORY[0x1E4FB2898];
  uint64_t v11 = v22[0];
  v22[1] = v12;
  v23[0] = &unk_1EE6ECFC8;
  v23[1] = &unk_1EE6ECFE0;
  CGFloat v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v24[0] = v13;
  v20[0] = v11;
  v20[1] = v12;
  v21[0] = &unk_1EE6ECFF8;
  v21[1] = &unk_1EE6ED010;
  CGFloat v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v24[1] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v26[0] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  float v17 = [v10 fontDescriptorByAddingAttributes:v16];

  CGSize v18 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v17 size:0.0];

  return v18;
}

- (void)setTimeLabelStyle:(int64_t)a3
{
  if (self->_timeLabelStyle != a3)
  {
    self->_int64_t timeLabelStyle = a3;
    [(MPDetailSlider *)self _setupControlsForStyle];
    [(MPDetailSlider *)self setNeedsLayout];
  }
}

- (void)setMinTimeLabelWidth:(double)a3
{
  if (self->_minTimeLabelWidth != a3)
  {
    self->_double minTimeLabelWidth = a3;
    [(MPDetailSlider *)self _updateTrackInset];
    [(MPDetailSlider *)self setNeedsLayout];
  }
}

- (void)setDuration:(double)a3
{
  if (vabdd_f64(self->_duration, a3) > 2.22044605e-16)
  {
    self->_duration = a3;
    -[MPDetailScrubController setDuration:](self->_scrubController, "setDuration:");
    double currentTime = self->_currentTime;
    if (currentTime >= self->_duration) {
      double currentTime = self->_duration;
    }
    self->_double currentTime = fmax(currentTime, 0.0);
    [(MPDetailSlider *)self frame];
    if (!CGRectIsEmpty(v8)) {
      [(MPDetailSlider *)self layoutSubviews];
    }
    double v5 = self->_currentTime;
    *(float *)&double v5 = v5;
    [(MPDetailSlider *)self setValue:0 animated:v5];
    [(MPDetailSlider *)self setAvailableDuration:self->_duration];
    double v6 = self->_currentTime;
    [(MPDetailSlider *)self _updateTimeDisplayForTime:1 force:v6];
  }
}

- (void)setAvailableDuration:(double)duration
{
  if (self->_duration <= duration) {
    duration = self->_duration;
  }
  if (vabdd_f64(duration, self->_availableDuration) > 2.22044605e-16)
  {
    self->_availableDuration = duration;
    [(MPDetailSlider *)self _updateForAvailableDuraton];
  }
}

- (void)setAllowsDetailScrubbing:(BOOL)a3
{
}

- (void)setAllowsScrubbing:(BOOL)a3
{
  if (self->_allowsScrubbing != a3)
  {
    self->_allowsScrubbing = a3;
    if (self->_style == 5)
    {
      [(MPDetailSlider *)self _setupControlsForStyle];
      *(void *)&a3 = self->_allowsScrubbing;
    }
    [(MPDetailSlider *)self setUserInteractionEnabled:a3];
  }
}

- (NSString)localizedScrubSpeedText
{
  switch([(MPDetailScrubController *)self->_scrubController currentScrubSpeed])
  {
    case 0:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      float v3 = v2;
      double v4 = @"HI_SPEED_SCRUBBING";
      goto LABEL_7;
    case 1:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      float v3 = v2;
      double v4 = @"HALF_SPEED_SCRUBBING";
      goto LABEL_7;
    case 2:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      float v3 = v2;
      double v4 = @"QUARTER_SPEED_SCRUBBING";
      goto LABEL_7;
    case 3:
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
      float v3 = v2;
      double v4 = @"FINE_SCRUBBING";
LABEL_7:
      double v5 = [v2 localizedStringForKey:v4 value:&stru_1EE680640 table:@"MediaPlayer"];

      break;
    default:
      double v5 = 0;
      break;
  }

  return (NSString *)v5;
}

- (void)cancelTracking
{
  [(NSTimer *)self->_autoscrubTimer invalidate];
  autoscrubTimer = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  BOOL isTracking = self->_isTracking;
  self->_BOOL isTracking = 0;
  [(MPDetailSlider *)self _resetScrubInfo];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = WeakRetained;
  if (isTracking)
  {
    CGRect v8 = WeakRetained;
    char v7 = objc_opt_respondsToSelector();
    double v6 = v8;
    if (v7)
    {
      [v8 detailSliderTrackingDidCancel:self];
      double v6 = v8;
    }
  }
}

- (BOOL)detailScrubbingAvailableForCurrentDuration
{
  return [(MPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing];
}

- (BOOL)allowsDetailScrubbing
{
  return [(MPDetailScrubController *)self->_scrubController detailedScrubbingEnabled];
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  [(MPDetailScrubController *)self->_scrubController cancelTrackingWithEvent:a3];

  [(MPDetailSlider *)self cancelTracking];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  autoscrubTimer = self->_autoscrubTimer;
  id v7 = a4;
  id v8 = a3;
  [(NSTimer *)autoscrubTimer invalidate];
  uint64_t v9 = self->_autoscrubTimer;
  self->_autoscrubTimer = 0;

  self->_autoscrubActive = 0;
  self->_BOOL isTracking = 0;
  [(MPDetailSlider *)self _resetScrubInfo];
  [(MPDetailScrubController *)self->_scrubController endTrackingWithTouch:v8 withEvent:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained detailSliderTrackingDidEnd:self];
  }
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 locationInView:self];
  double v9 = v8;
  double v11 = v10;
  if ([(MPDetailScrubController *)self->_scrubController detailedScrubbingEnabled]
    && [(MPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing])
  {
    uint64_t v12 = [(MPDetailSlider *)self window];
    -[MPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, v9, v11);
    double v14 = v13;
    double v16 = v15;
    BOOL autoscrubActive = self->_autoscrubActive;
    unint64_t v18 = [(id)*MEMORY[0x1E4FB2608] statusBarOrientation] - 3;
    if (v18 < 2) {
      double v14 = v16;
    }
    [v12 bounds];
    if (v18 > 1)
    {
      double Width = CGRectGetWidth(*(CGRect *)&v19);
      if (v12)
      {
LABEL_7:
        BOOL v24 = v14 < 20.0;
        double Width = Width + -20.0;
        if (v14 > Width) {
          BOOL v24 = 1;
        }
        self->_BOOL autoscrubActive = v24;
        if (v24)
        {
          thumbImageView = self->_thumbImageView;
          id v26 = [(MPDetailSlider *)self currentThumbImage];
          [(UIImageView *)thumbImageView setImage:v26];

          if (!autoscrubActive)
          {
            CGSize v27 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
            CGSize v28 = [NSNumber numberWithFloat:0.0];
            [v27 setToValue:v28];

            [v27 setDuration:0.25];
            LODWORD(v29) = 2139095039;
            [v27 setRepeatCount:v29];
            [v27 setAutoreverses:1];
            id v30 = [(UIImageView *)self->_glowDetailScrubImageView layer];
            [v30 addAnimation:v27 forKey:@"pulseAnimation"];
          }
          [(MPDetailSlider *)self value];
          double v32 = self->_duration * v31;
          *(float *)&double v32 = v32;
          [(MPDetailSlider *)self _setValueWhileTracking:v32 duration:0.0];
          if ([(MPDetailSlider *)self isContinuous]) {
            [(MPDetailSlider *)self sendActionsForControlEvents:4096];
          }
          if (!self->_autoscrubTimer)
          {
            CGFloat v33 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__autoscrubTick_ selector:0 userInfo:1 repeats:0.1];
            autoscrubTimer = self->_autoscrubTimer;
            self->_autoscrubTimer = v33;
          }
          self->_previousLocationInView.CGFloat x = v9;
          self->_previousLocationInView.CGFloat y = v11;

          BOOL v35 = 1;
          goto LABEL_25;
        }
        goto LABEL_19;
      }
    }
    else
    {
      double Width = CGRectGetHeight(*(CGRect *)&v19);
      if (v12) {
        goto LABEL_7;
      }
    }
    self->_BOOL autoscrubActive = 0;
LABEL_19:
    if (self->_autoscrubTimer)
    {
      CGFloat v36 = [(UIImageView *)self->_glowDetailScrubImageView layer];
      [v36 removeAnimationForKey:@"pulseAnimation"];

      [(NSTimer *)self->_autoscrubTimer invalidate];
      CGFloat v37 = self->_autoscrubTimer;
      self->_autoscrubTimer = 0;
    }
  }
  if ([(MPDetailSlider *)self isContinuous]) {
    [(MPDetailSlider *)self sendActionsForControlEvents:4096];
  }
  BOOL v35 = [(MPDetailScrubController *)self->_scrubController continueTrackingWithTouch:v6 withEvent:v7];
LABEL_25:

  return v35;
}

- (void)_autoscrubTick:(id)a3
{
  [(MPDetailSlider *)self maximumValue];
  float v5 = v4;
  [(MPDetailSlider *)self minimumValue];
  double v7 = (float)(v5 - v6);
  [(MPDetailSlider *)self bounds];
  -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v8 = v7 / CGRectGetWidth(v26);
  [(MPDetailScrubController *)self->_scrubController scaleForVerticalPosition:self->_previousLocationInView.y];
  double v10 = v9;
  double v11 = v8 * v9;
  uint64_t v12 = [(MPDetailSlider *)self window];
  -[MPDetailSlider convertPoint:toView:](self, "convertPoint:toView:", v12, self->_previousLocationInView.x, self->_previousLocationInView.y);
  double v14 = v13;
  double v15 = [(MPDetailSlider *)self window];
  [v15 bounds];
  if (v14 >= CGRectGetMidX(v27)) {
    double v16 = v11;
  }
  else {
    double v16 = -(v8 * v10);
  }
  float v17 = v16;

  self->_canCommit = 1;
  [(MPDetailSlider *)self minimumValue];
  float v19 = v18;
  [(MPDetailSlider *)self maximumValue];
  float v21 = v20;
  [(MPDetailSlider *)self value];
  float v23 = v22 + v17;
  if (v21 < v23) {
    float v23 = v21;
  }
  if (v19 >= v23) {
    float v23 = v19;
  }
  double v24 = self->_duration * v23;
  *(float *)&double v24 = v24;
  [(MPDetailSlider *)self setValue:0 animated:v24];
  if ([(MPDetailSlider *)self isContinuous])
  {
    [(MPDetailSlider *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  scrubController = self->_scrubController;
  id v7 = a3;
  BOOL v8 = [(MPDetailScrubController *)scrubController beginTrackingWithTouch:v7 withEvent:a4];
  [v7 locationInView:self];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [(MPDetailSlider *)self thumbHitRect];
  v15.CGFloat x = v10;
  v15.CGFloat y = v12;
  if (CGRectContainsPoint(v16, v15))
  {
    self->_BOOL isTracking = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained detailSliderTrackingDidBegin:self];
    }
  }
  return v8;
}

- (void)detailScrubController:(id)a3 didChangeValue:(float)a4
{
  -[MPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:", a3);

  [(MPDetailSlider *)self _commitValue];
}

- (void)detailScrubController:(id)a3 didChangeScrubSpeed:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained detailSlider:self didChangeScrubSpeed:a4];
  }
}

- (CGRect)thumbHitRect
{
  [(MPDetailSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(MPDetailSlider *)self bounds];
  -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(MPDetailSlider *)self value];
  LODWORD(v24) = v19;
  -[MPDetailSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v12, v14, v16, v18, v24);

  return CGRectInset(*(CGRect *)&v20, -19.0, -19.0);
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  double v2 = -19.0;
  double v3 = -19.0;
  double v4 = -19.0;
  double v5 = -19.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setValueWhileTracking:(float)a3 duration:(double)a4
{
  double duration = self->_duration;
  if (duration > 0.0)
  {
    double v7 = fmax(a3, 0.0);
    if (duration < v7) {
      double v7 = self->_duration;
    }
    float v8 = v7;
    double v9 = v8;
    float v10 = v8 / duration;
    [(MPDetailSlider *)self bounds];
    if (vabdd_f64(1.0, v10) < 1.0 / v11) {
      float v10 = 1.0;
    }
    double v12 = [(MPDetailSlider *)self layer];
    double v13 = [v12 animationKeys];
    uint64_t v14 = [v13 count];

    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __50__MPDetailSlider__setValueWhileTracking_duration___block_invoke;
    int v19 = &unk_1E57F9C60;
    if (v14) {
      uint64_t v15 = 196640;
    }
    else {
      uint64_t v15 = 196644;
    }
    float v21 = v10;
    uint64_t v20 = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v15 delay:&v16 options:0 animations:a4 completion:0.0];
    [(MPDetailSlider *)self _updateForAvailableDuraton];
    [(MPDetailSlider *)self _updateTimeDisplayForTime:v9];
    if (self->_isTracking && self->_canCommit) {
      [(MPDetailSlider *)self _commitValue];
    }
  }
}

uint64_t __50__MPDetailSlider__setValueWhileTracking_duration___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)MPDetailSlider;
  objc_msgSendSuper2(&v4, sel_setValue_animated_, 0, a2);
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setValue:(float)a3 duration:(double)a4
{
  if (!self->_isTracking) {
    -[MPDetailSlider _setValueWhileTracking:duration:](self, "_setValueWhileTracking:duration:");
  }
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
}

- (void)setValue:(float)a3
{
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  v29.receiver = self;
  v29.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider thumbRectForBounds:trackRect:value:](&v29, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, LODWORD(a5));
  if ((unint64_t)(self->_style - 3) > 1)
  {
    double v15 = 1.0;
    if (a5 < 0.5) {
      double v15 = -1.0;
    }
    CGRect v30 = CGRectOffset(*(CGRect *)&v7, v15, 0.0);
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
  }
  else
  {
    double v11 = 0.0;
    if (a5 < 0.5) {
      double v11 = -1.0;
    }
    CGRectOffset(*(CGRect *)&v7, v11, 0.5);
    double v12 = [(MPDetailSlider *)self traitCollection];
    [v12 displayScale];
    double v14 = v13;
    if (v13 == 0.0)
    {
      double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v5 scale];
    }
    UIRectIntegralWithScale();
    CGFloat x = v20;
    CGFloat y = v21;
    CGFloat width = v22;
    CGFloat height = v23;
    if (v14 == 0.0) {
  }
    }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPDetailSlider *)self _updateTrackInset];
  v14.receiver = self;
  v14.super_class = (Class)MPDetailSlider;
  -[MPDetailSlider trackRectForBounds:](&v14, sel_trackRectForBounds_, x, y, width, height);
  CGFloat v8 = v15.origin.x;
  CGFloat v9 = v15.origin.y;
  CGFloat v10 = v15.size.width;
  CGFloat v11 = v15.size.height;
  CGFloat v12 = CGRectGetWidth(v15);
  double trackInset = self->_trackInset;
  if (v12 <= trackInset + trackInset)
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  }
  else
  {
    v16.origin.double x = v8;
    v16.origin.double y = v9;
    v16.size.double width = v10;
    v16.size.double height = v11;
    return CGRectInset(v16, trackInset, 0.0);
  }
}

- (id)currentThumbImage
{
  if ((unint64_t)(self->_style - 1) >= 5)
  {
    if (self->_isTracking
      && [(MPDetailScrubController *)self->_scrubController detailedScrubbingEnabled]
      && [(MPDetailScrubController *)self->_scrubController durationAllowsForDetailedScrubbing])
    {
      glowDetailScrubImageView = self->_glowDetailScrubImageView;
      if (!glowDetailScrubImageView)
      {
        id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
        uint64_t v7 = (void *)MEMORY[0x1E4FB1818];
        CGFloat v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        CGFloat v9 = [v7 imageNamed:@"scrubberglow" inBundle:v8];
        CGFloat v10 = (UIImageView *)[v6 initWithImage:v9];
        CGFloat v11 = self->_glowDetailScrubImageView;
        self->_glowDetailScrubImageView = v10;

        CGFloat v12 = self->_glowDetailScrubImageView;
        [(UIImageView *)v12 bounds];
        [(UIImageView *)self->_thumbImageView bounds];
        UIRectCenteredIntegralRect();
        CGRect v18 = CGRectOffset(v17, 0.0, -1.0);
        -[UIImageView setFrame:](v12, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
        glowDetailScrubImageView = self->_glowDetailScrubImageView;
      }
      [(UIImageView *)self->_thumbImageView addSubview:glowDetailScrubImageView];
    }
    else
    {
      objc_super v4 = self->_glowDetailScrubImageView;
      if (v4)
      {
        double v5 = [(UIImageView *)v4 layer];
        [v5 removeAllAnimations];

        [(UIImageView *)self->_glowDetailScrubImageView removeFromSuperview];
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MPDetailSlider;
  double v13 = [(MPDetailSlider *)&v15 currentThumbImage];

  return v13;
}

- (id)createThumbView
{
  v7.receiver = self;
  v7.super_class = (Class)MPDetailSlider;
  double v3 = [(MPDetailSlider *)&v7 createThumbView];
  thumbImageView = self->_thumbImageView;
  self->_thumbImageView = v3;

  double v5 = self->_thumbImageView;

  return v5;
}

- (id)viewForLastBaselineLayout
{
  return self->_currentTimeLabel;
}

- (id)viewForFirstBaselineLayout
{
  return self->_currentTimeLabel;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPDetailSlider;
  id v4 = a3;
  [(MPDetailSlider *)&v9 traitCollectionDidChange:v4];
  double v5 = [(MPDetailSlider *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 == v7)
  {
  }
  else
  {
    int64_t style = self->_style;

    if (style == 5) {
      [(MPDetailSlider *)self _setupControlsForStyle];
    }
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MPDetailSlider;
  [(MPDetailSlider *)&v3 tintColorDidChange];
  if (self->_style == 5) {
    [(MPDetailSlider *)self _setupControlsForStyle];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPDetailSlider *)self frame];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider setFrame:](&v9, sel_setFrame_, x, y, width, height);
    double currentTime = self->_currentTime;
    *(float *)&double currentTime = currentTime;
    [(MPDetailSlider *)self setValue:currentTime];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MPDetailSlider *)self bounds];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    v9.receiver = self;
    v9.super_class = (Class)MPDetailSlider;
    -[MPDetailSlider setBounds:](&v9, sel_setBounds_, x, y, width, height);
    double currentTime = self->_currentTime;
    *(float *)&double currentTime = currentTime;
    [(MPDetailSlider *)self setValue:currentTime];
  }
}

- (void)layoutSubviews
{
  [(MPDetailSlider *)self bounds];
  objc_super v3 = [(MPDetailSlider *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 < 0.00000011920929)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v5 = v7;
  }
  if (self->_timeLabelStyle == 1)
  {
    [(UILabel *)self->_currentTimeLabel removeFromSuperview];
    currentTimeLabel = self->_currentTimeLabel;
    self->_currentTimeLabel = 0;

    [(UILabel *)self->_currentTimeInverseLabel removeFromSuperview];
    currentTimeInverseLabel = self->_currentTimeInverseLabel;
    self->_currentTimeInverseLabel = 0;
  }
  else
  {
    [(MPDetailSlider *)self bounds];
    -[MPDetailSlider trackRectForBounds:](self, "trackRectForBounds:");
    CGFloat v34 = v11;
    CGFloat v35 = v10;
    CGFloat v32 = v13;
    CGFloat v33 = v12;
    currentTimeInverseLabel = [(MPDetailSlider *)self timeLabelFontForStyle:self->_style];
    objc_super v14 = [(MPDetailSlider *)self timeLabelTextColorForStyle:self->_style];
    objc_super v15 = self->_currentTimeLabel;
    if (!v15)
    {
      CGRect v16 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      CGRect v17 = self->_currentTimeLabel;
      self->_currentTimeLabel = v16;

      [(UILabel *)self->_currentTimeLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeLabel setFont:currentTimeInverseLabel];
      [(UILabel *)self->_currentTimeLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeLabel setOpaque:0];
      CGRect v18 = [(MPDetailSlider *)self _stringForCurrentTime:NAN];
      [(UILabel *)self->_currentTimeLabel setText:v18];

      [(UILabel *)self->_currentTimeLabel setTextAlignment:2];
      [(UILabel *)self->_currentTimeLabel setTextColor:v14];
      [(MPDetailSlider *)self addSubview:self->_currentTimeLabel];
      objc_super v15 = self->_currentTimeLabel;
    }
    [(UILabel *)v15 sizeToFit];
    [(UILabel *)self->_currentTimeLabel frame];
    UIRectCenteredYInRectScale();
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v37.origin.double y = v34;
    v37.origin.double x = v35;
    v37.size.double height = v32;
    v37.size.double width = v33;
    CGRectGetMinX(v37);
    v38.origin.double x = v20;
    v38.origin.double y = v22;
    v38.size.double width = v24;
    v38.size.double height = v26;
    CGRectGetWidth(v38);
    UIRectIntegralWithScale();
    [(UILabel *)self->_currentTimeLabel setFrame:*(void *)&v5];
    double v27 = self->_currentTimeInverseLabel;
    if (!v27)
    {
      CGSize v28 = (UILabel *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "labelClass")), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      objc_super v29 = self->_currentTimeInverseLabel;
      self->_currentTimeInverseLabel = v28;

      [(UILabel *)self->_currentTimeInverseLabel setBackgroundColor:0];
      [(UILabel *)self->_currentTimeInverseLabel setFont:currentTimeInverseLabel];
      [(UILabel *)self->_currentTimeInverseLabel setLineBreakMode:2];
      [(UILabel *)self->_currentTimeInverseLabel setOpaque:0];
      CGRect v30 = [(MPDetailSlider *)self _stringForInverseCurrentTime:NAN];
      [(UILabel *)self->_currentTimeInverseLabel setText:v30];

      [(UILabel *)self->_currentTimeInverseLabel setTextAlignment:0];
      [(UILabel *)self->_currentTimeInverseLabel setTextColor:v14];
      [(MPDetailSlider *)self addSubview:self->_currentTimeInverseLabel];
      double v27 = self->_currentTimeInverseLabel;
    }
    [(UILabel *)v27 sizeToFit];
    [(UILabel *)self->_currentTimeInverseLabel frame];
    UIRectCenteredYInRectScale();
    v39.origin.double y = v34;
    v39.origin.double x = v35;
    v39.size.double height = v32;
    v39.size.double width = v33;
    CGRectGetMaxX(v39);
    UIRectIntegralWithScale();
    [(UILabel *)self->_currentTimeInverseLabel setFrame:*(void *)&v5];
  }
  [(MPDetailSlider *)self _updateTrackInset];
  v36.receiver = self;
  v36.super_class = (Class)MPDetailSlider;
  [(MPDetailSlider *)&v36 layoutSubviews];
  if ((unint64_t)(self->_style - 3) <= 1)
  {
    float v31 = [(MPDetailSlider *)self _maxTrackView];
    [v31 _setDrawsAsBackdropOverlayWithBlendMode:2];

    [(UILabel *)self->_currentTimeLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
    [(UILabel *)self->_currentTimeInverseLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
  }
}

- (void)dealloc
{
  [(NSTimer *)self->_autoscrubTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MPDetailSlider;
  [(MPDetailSlider *)&v3 dealloc];
}

- (MPDetailSlider)initWithFrame:(CGRect)a3
{
  return -[MPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[MPDetailSlider initWithFrame:style:maxTrackWidth:](self, "initWithFrame:style:maxTrackWidth:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (MPDetailSlider)initWithFrame:(CGRect)a3 style:(int64_t)a4 maxTrackWidth:(double)a5
{
  if (a3.size.height < 34.0 && a4 == 3 || a3.size.height == 0.0) {
    a3.size.double height = 34.0;
  }
  v15.receiver = self;
  v15.super_class = (Class)MPDetailSlider;
  objc_super v9 = -[MPDetailSlider initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v9)
  {
    double v10 = [[MPDetailScrubController alloc] initWithScrubbingControl:v9];
    scrubController = v9->_scrubController;
    v9->_scrubController = v10;

    [(MPDetailScrubController *)v9->_scrubController setDelegate:v9];
    [(MPDetailScrubController *)v9->_scrubController setDetailedScrubbingEnabled:1];
    v9->_allowsScrubbing = 1;
    v9->_maxTrackdouble Width = a5;
    v9->_int64_t style = a4;
    if ((unint64_t)(a4 - 3) >= 2) {
      v9->_double minTimeLabelWidth = 41.0;
    }
    [(MPDetailSlider *)v9 _setupControlsForStyle];
    [(MPDetailSlider *)v9 setDeliversTouchesForGesturesToSuperview:0];
    [(MPDetailSlider *)v9 setSemanticContentAttribute:1];
    uint64_t v12 = objc_opt_new();
    formatter = v9->_formatter;
    v9->_formatter = (AVTimeFormatter *)v12;
  }
  return v9;
}

+ (Class)labelClass
{
  return (Class)objc_opt_class();
}

@end