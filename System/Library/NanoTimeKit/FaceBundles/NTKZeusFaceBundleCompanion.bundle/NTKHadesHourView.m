@interface NTKHadesHourView
+ (id)_assetForHour:(unint64_t)a3 rotation:(unint64_t)a4 statusIcon:(BOOL)a5;
+ (id)imageForRotation:(unint64_t)a3 palette:(id)a4 hour:(unint64_t)a5;
- (BOOL)_isFractionAtEnd:(double)a3;
- (BOOL)showingStatusIcon;
- (CLKDevice)device;
- (NTKHadesColorPalette)palette;
- (NTKHadesHourView)initWithDevice:(id)a3;
- (UIImageView)hourImageView;
- (unint64_t)hour;
- (unint64_t)rotation;
- (void)_updateAsset;
- (void)_updatePalette;
- (void)applyFraction:(double)a3 fromRotation:(unint64_t)a4 toRotation:(unint64_t)a5;
- (void)endEditing;
- (void)layoutSubviews;
- (void)setDevice:(id)a3;
- (void)setHour:(unint64_t)a3;
- (void)setHourImageView:(id)a3;
- (void)setPalette:(id)a3;
- (void)setShowingStatusIcon:(BOOL)a3;
@end

@implementation NTKHadesHourView

- (NTKHadesHourView)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKHadesHourView;
  v6 = -[NTKHadesHourView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_rotation = 2;
    v7->_hour = -1;
    uint64_t v8 = objc_opt_new();
    hourImageView = v7->_hourImageView;
    v7->_hourImageView = (UIImageView *)v8;

    [(NTKHadesHourView *)v7 addSubview:v7->_hourImageView];
    [(NTKHadesHourView *)v7 setClipsToBounds:1];
  }

  return v7;
}

- (void)applyFraction:(double)a3 fromRotation:(unint64_t)a4 toRotation:(unint64_t)a5
{
  if (!-[NTKHadesHourView _isFractionAtEnd:](self, "_isFractionAtEnd:"))
  {
    id v12 = [(NTKHadesHourView *)self device];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_4CCF8);
    id WeakRetained = objc_loadWeakRetained(&qword_4CD00);
    if (WeakRetained)
    {
      v14 = WeakRetained;
      id v15 = objc_loadWeakRetained(&qword_4CD00);
      if (v15 == v12)
      {
        id v16 = [v12 version];
        uint64_t v17 = qword_4CD08;

        if (v16 == (id)v17)
        {
LABEL_11:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CCF8);
          long long v23 = *(_OWORD *)byte_4CCC8;
          long long v24 = *(_OWORD *)&byte_4CCC8[16];
          long long v25 = *(_OWORD *)&byte_4CCC8[32];

          self->_rotation = 0;
          [(NTKHadesHourView *)self _updateAsset];
          long long v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v22[6] = *(_OWORD *)&CGAffineTransformIdentity.a;
          v22[7] = v20;
          v22[8] = *(_OWORD *)&CGAffineTransformIdentity.tx;
          v22[3] = v23;
          v22[4] = v24;
          v22[5] = v25;
          CLKInterpolateBetweenTransform();
          hourImageView = self->_hourImageView;
          v22[0] = v22[9];
          v22[1] = v22[10];
          v22[2] = v22[11];
          [(UIImageView *)hourImageView setTransform:v22];
          return;
        }
      }
      else
      {
      }
    }
    id v18 = objc_storeWeak(&qword_4CD00, v12);
    qword_4CD08 = (uint64_t)[v12 version];

    sub_13BD4(v19, (uint64_t)v12);
    goto LABEL_11;
  }
  v9 = self->_hourImageView;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v26[1] = v10;
  v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(UIImageView *)v9 setTransform:v26];
  if (a3 == 0.0) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = a5;
  }
  self->_rotation = v11;
  [(NTKHadesHourView *)self _updateAsset];
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);

  [(NTKHadesHourView *)self _updatePalette];
}

- (void)setHour:(unint64_t)a3
{
  unint64_t v3 = (a3 + 11) % 0xC + 1;
  if (v3 != self->_hour)
  {
    self->_hour = v3;
    [(NTKHadesHourView *)self _updateAsset];
  }
}

- (void)_updateAsset
{
  uint64_t v3 = [(id)objc_opt_class() _assetForHour:self->_hour rotation:self->_rotation statusIcon:self->_showingStatusIcon];
  if (v3)
  {
    [(UIImageView *)self->_hourImageView setImage:v3];
    [(UIImageView *)self->_hourImageView sizeToFit];
    [(NTKHadesHourView *)self _updatePalette];
    [(NTKHadesHourView *)self setNeedsLayout];
  }

  _objc_release_x1();
}

- (void)setShowingStatusIcon:(BOOL)a3
{
  if (self->_showingStatusIcon != a3)
  {
    self->_showingStatusIcon = a3;
    [(NTKHadesHourView *)self _updateAsset];
  }
}

- (void)_updatePalette
{
  uint64_t v3 = [(NTKHadesColorPalette *)self->_palette background];
  [(NTKHadesHourView *)self setBackgroundColor:v3];

  id v4 = [(NTKHadesColorPalette *)self->_palette numbers];
  [(UIImageView *)self->_hourImageView setTintColor:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKHadesHourView;
  [(NTKHadesHourView *)&v3 layoutSubviews];
  [(NTKHadesHourView *)self bounds];
  -[UIImageView ntk_setBoundsAndPositionFromFrame:](self->_hourImageView, "ntk_setBoundsAndPositionFromFrame:");
}

+ (id)_assetForHour:(unint64_t)a3 rotation:(unint64_t)a4 statusIcon:(BOOL)a5
{
  id v5 = 0;
  if (a3 <= 0xC && a4 <= 1)
  {
    if (a4 == 1) {
      v7 = @"Twisted";
    }
    else {
      v7 = @"Straight";
    }
    if (a4 != 1 && a5)
    {
      v7 = [@"Straight" stringByAppendingString:@"-Inset"];
    }
    uint64_t v8 = +[NSString stringWithFormat:@"Hades%@-%d", v7, a3];
    id v5 = +[NTKHadesFaceBundle imageWithName:v8];
  }

  return v5;
}

- (void)endEditing
{
}

- (BOOL)_isFractionAtEnd:(double)a3
{
  return a3 == 1.0 || a3 == 0.0;
}

+ (id)imageForRotation:(unint64_t)a3 palette:(id)a4 hour:(unint64_t)a5
{
  id v8 = a4;
  v9 = [a1 _assetForHour:a5 rotation:a3 statusIcon:0];
  if (v9)
  {
    long long v10 = +[NTKFaceViewRenderingContext sharedRenderingContext];
    unint64_t v11 = [v10 device];

    id v12 = objc_alloc((Class)UIGraphicsImageRenderer);
    [v9 size];
    id v13 = objc_msgSend(v12, "initWithSize:");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_139FC;
    v17[3] = &unk_3CEB8;
    id v18 = v8;
    id v19 = v11;
    id v20 = v9;
    id v14 = v11;
    id v15 = [v13 imageWithActions:v17];
  }
  else
  {
    id v15 = objc_opt_new();
  }

  return v15;
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (NTKHadesColorPalette)palette
{
  return self->_palette;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (BOOL)showingStatusIcon
{
  return self->_showingStatusIcon;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIImageView)hourImageView
{
  return self->_hourImageView;
}

- (void)setHourImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourImageView, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end