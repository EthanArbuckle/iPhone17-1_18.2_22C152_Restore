@interface NTKSecretariatBackgroundView
- (NTKSecretariatBackgroundView)initWithFrame:(CGRect)a3 device:(id)a4 inactive:(BOOL)a5;
- (NTKSecretariatColorPalette)palette;
- (UIImageView)horseImageView;
- (id)_horseImageViewWithName:(id)a3;
- (id)_imageViewWithName:(id)a3;
- (void)_loadImages;
- (void)_updateLayout;
- (void)_updateOrigin:(CGPoint)a3 forImageView:(id)a4;
- (void)setPalette:(id)a3;
@end

@implementation NTKSecretariatBackgroundView

- (NTKSecretariatBackgroundView)initWithFrame:(CGRect)a3 device:(id)a4 inactive:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKSecretariatBackgroundView;
  v13 = -[NTKSecretariatBackgroundView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a4);
    v14->_inactive = a5;
    [(NTKSecretariatBackgroundView *)v14 _loadImages];
    [(NTKSecretariatBackgroundView *)v14 setClipsToBounds:1];
  }

  return v14;
}

- (void)setPalette:(id)a3
{
  p_palette = &self->_palette;
  objc_storeStrong((id *)&self->_palette, a3);
  id v6 = a3;
  v7 = [(NTKSecretariatColorPalette *)*p_palette apple];
  [(UIImageView *)self->_appleImageView setTintColor:v7];

  v8 = [(NTKSecretariatColorPalette *)*p_palette horseshoe];
  [(UIImageView *)self->_horseshoeImageView setTintColor:v8];

  v9 = [(NTKSecretariatColorPalette *)*p_palette horseshoeHoles];
  [(UIImageView *)self->_horseshoeHolesImageView setTintColor:v9];

  v10 = [(NTKSecretariatColorPalette *)*p_palette horse];
  [(UIImageView *)self->_horseImageView setTintColor:v10];

  v11 = [(NTKSecretariatColorPalette *)*p_palette horseEye];
  [(UIImageView *)self->_horseEyeImageView setTintColor:v11];

  id v12 = [(NTKSecretariatColorPalette *)*p_palette horseHair];
  [(UIImageView *)self->_horseHairImageView setTintColor:v12];
}

- (void)_loadImages
{
  v3 = [(NTKSecretariatBackgroundView *)self _imageViewWithName:@"SecretariatApple"];
  appleImageView = self->_appleImageView;
  self->_appleImageView = v3;

  [(NTKSecretariatBackgroundView *)self addSubview:self->_appleImageView];
  v5 = [(NTKSecretariatBackgroundView *)self _imageViewWithName:@"SecretariatHorseshoe"];
  horseshoeImageView = self->_horseshoeImageView;
  self->_horseshoeImageView = v5;

  [(NTKSecretariatBackgroundView *)self addSubview:self->_horseshoeImageView];
  v7 = [(NTKSecretariatBackgroundView *)self _imageViewWithName:@"SecretariatHorseshoeHoles"];
  horseshoeHolesImageView = self->_horseshoeHolesImageView;
  self->_horseshoeHolesImageView = v7;

  [(UIImageView *)self->_horseshoeImageView addSubview:self->_horseshoeHolesImageView];
  v9 = [(NTKSecretariatBackgroundView *)self _horseImageViewWithName:@"SecretariatHorse"];
  horseImageView = self->_horseImageView;
  self->_horseImageView = v9;

  [(NTKSecretariatBackgroundView *)self addSubview:self->_horseImageView];
  if (self->_inactive)
  {
    v11 = [(NTKSecretariatBackgroundView *)self _horseImageViewWithName:@"SecretariatHorseEye"];
    horseEyeImageView = self->_horseEyeImageView;
    self->_horseEyeImageView = v11;

    [(UIImageView *)self->_horseImageView addSubview:self->_horseEyeImageView];
    uint64_t v13 = [(NTKSecretariatBackgroundView *)self _horseImageViewWithName:@"SecretariatHorseHair"];
    uint64_t v14 = 56;
  }
  else
  {
    uint64_t v13 = [(NTKSecretariatBackgroundView *)self _horseImageViewWithName:@"SecretariatHorseFeatures"];
    uint64_t v14 = 40;
  }
  v15 = (uint64_t *)((char *)self + v14);
  objc_super v16 = *(Class *)((char *)&self->super.super.super.isa + v14);
  uint64_t *v15 = v13;

  [(UIImageView *)self->_horseImageView addSubview:*v15];

  [(NTKSecretariatBackgroundView *)self _updateLayout];
}

- (id)_imageViewWithName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_inactive)
  {
    uint64_t v6 = [v4 stringByAppendingString:@"Inactive"];

    v5 = (void *)v6;
  }
  v7 = +[NTKSecretariatFaceBundle imageWithName:v5];
  id v8 = [objc_alloc((Class)UIImageView) initWithImage:v7];

  return v8;
}

- (id)_horseImageViewWithName:(id)a3
{
  id v4 = [(NTKSecretariatBackgroundView *)self _imageViewWithName:a3];
  [(NTKSecretariatBackgroundView *)self bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setContentMode:2];

  return v4;
}

- (void)_updateLayout
{
  v3 = self->_device;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CF50);
  id WeakRetained = objc_loadWeakRetained(&qword_4CF58);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    uint64_t v6 = (CLKDevice *)objc_loadWeakRetained(&qword_4CF58);
    if (v6 == v3)
    {
      id v7 = [(CLKDevice *)v3 version];
      uint64_t v8 = qword_4CF60;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_4CF58, v3);
  qword_4CF60 = (uint64_t)[(CLKDevice *)v3 version];

  sub_1CE50(v10, (uint64_t)v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CF50);
  double v11 = *(double *)&qword_4CF30;
  double v12 = *(double *)&qword_4CF38;
  double v13 = *(double *)&qword_4CF40;
  double v14 = *(double *)&qword_4CF48;

  -[NTKSecretariatBackgroundView _updateOrigin:forImageView:](self, "_updateOrigin:forImageView:", self->_appleImageView, v11, v12);
  horseshoeImageView = self->_horseshoeImageView;

  -[NTKSecretariatBackgroundView _updateOrigin:forImageView:](self, "_updateOrigin:forImageView:", horseshoeImageView, v13, v14);
}

- (void)_updateOrigin:(CGPoint)a3 forImageView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  [(NTKSecretariatBackgroundView *)self bounds];
  CLKRectGetCenter();
  double v8 = v7;
  double v10 = v9;
  [v11 frame];
  objc_msgSend(v11, "setFrame:", (v8 - x) * 0.5, (v10 - y) * 0.5);
}

- (UIImageView)horseImageView
{
  return self->_horseImageView;
}

- (NTKSecretariatColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_horseImageView, 0);
  objc_storeStrong((id *)&self->_horseHairImageView, 0);
  objc_storeStrong((id *)&self->_horseEyeImageView, 0);
  objc_storeStrong((id *)&self->_horseFeaturesImageView, 0);
  objc_storeStrong((id *)&self->_horseshoeHolesImageView, 0);
  objc_storeStrong((id *)&self->_horseshoeImageView, 0);
  objc_storeStrong((id *)&self->_appleImageView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end