@interface NTKUtilityFaceDialView
- (NTKUtilityFaceDialView)initWithDevice:(id)a3;
- (void)layoutSubviews;
- (void)setConfig:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTickColor:(id)a3;
- (void)setTypeface:(unint64_t)a3;
- (void)transitionFromConfig:(id)a3 toConfig:(id)a4 withFraction:(double)a5;
- (void)transitionFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 withFraction:(double)a5;
- (void)transitionFromTypeface:(unint64_t)a3 toTypeface:(unint64_t)a4 withFraction:(double)a5;
@end

@implementation NTKUtilityFaceDialView

- (NTKUtilityFaceDialView)initWithDevice:(id)a3
{
  id v5 = a3;
  [v5 screenBounds];
  v21.receiver = self;
  v21.super_class = (Class)NTKUtilityFaceDialView;
  v6 = -[NTKUtilityFaceDialView initWithFrame:](&v21, "initWithFrame:");
  v7 = v6;
  if (v6)
  {
    p_device = (id *)&v6->_device;
    objc_storeStrong((id *)&v6->_device, a3);
    id v9 = objc_alloc((Class)UIImageView);
    [*p_device screenBounds];
    v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:");
    numberImageView = v7->_numberImageView;
    v7->_numberImageView = v10;

    [(UIImageView *)v7->_numberImageView setContentMode:4];
    id v12 = objc_alloc((Class)UIImageView);
    [*p_device screenBounds];
    v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:");
    transitionNumberImageView = v7->_transitionNumberImageView;
    v7->_transitionNumberImageView = v13;

    [(UIImageView *)v7->_transitionNumberImageView setContentMode:4];
    id v15 = objc_alloc((Class)UIImageView);
    [*p_device screenBounds];
    v16 = (UIImageView *)objc_msgSend(v15, "initWithFrame:");
    dialImageView = v7->_dialImageView;
    v7->_dialImageView = v16;

    [(UIImageView *)v7->_dialImageView setContentMode:4];
    v18 = +[NTKUtilityFaceDialFactory dialImageForDevice:v5];
    v19 = [v18 imageWithRenderingMode:2];
    [(UIImageView *)v7->_dialImageView setImage:v19];

    [(NTKUtilityFaceDialView *)v7 addSubview:v7->_numberImageView];
    [(NTKUtilityFaceDialView *)v7 addSubview:v7->_transitionNumberImageView];
    [(NTKUtilityFaceDialView *)v7 addSubview:v7->_dialImageView];
  }

  return v7;
}

- (void)layoutSubviews
{
  numberImageView = self->_numberImageView;
  [(CLKDevice *)self->_device screenBounds];
  -[UIImageView setFrame:](numberImageView, "setFrame:");
  transitionNumberImageView = self->_transitionNumberImageView;
  [(CLKDevice *)self->_device screenBounds];
  -[UIImageView setFrame:](transitionNumberImageView, "setFrame:");
  dialImageView = self->_dialImageView;
  [(CLKDevice *)self->_device screenBounds];

  -[UIImageView setFrame:](dialImageView, "setFrame:");
}

- (void)setConfig:(id)a3
{
  self->_transitionFrom = ($948541DDFDBEACAFA67F302B40F6B4CE)a3;
  numberImageView = self->_numberImageView;
  id v5 = +[NTKUtilityFaceDialFactory numbersImageForStyle:typeface:device:](NTKUtilityFaceDialFactory, "numbersImageForStyle:typeface:device:");
  [(UIImageView *)numberImageView setImage:v5];

  [(UIImageView *)self->_numberImageView setContentMode:4];
  [(UIImageView *)self->_numberImageView setAlpha:1.0];
  transitionNumberImageView = self->_transitionNumberImageView;

  [(UIImageView *)transitionNumberImageView setAlpha:0.0];
}

- (void)setStyle:(unint64_t)a3
{
  self->_transitionFrom.style = a3;
  -[NTKUtilityFaceDialView setConfig:](self, "setConfig:");
}

- (void)setTypeface:(unint64_t)a3
{
  self->_transitionFrom.language = a3;
  -[NTKUtilityFaceDialView setConfig:](self, "setConfig:", self->_transitionFrom.style, a3);
}

- (void)transitionFromConfig:(id)a3 toConfig:(id)a4 withFraction:(double)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  if (a5 == 1.0)
  {
    -[NTKUtilityFaceDialView setConfig:](self, "setConfig:", a4.var0, a4.var1);
  }
  else
  {
    if (self->_transitionFrom.style != a3.var0 || self->_transitionFrom.language != a3.var1)
    {
      self->_transitionFrom = ($948541DDFDBEACAFA67F302B40F6B4CE)a3;
      numberImageView = self->_numberImageView;
      v11 = +[NTKUtilityFaceDialFactory numbersImageForStyle:typeface:device:](NTKUtilityFaceDialFactory, "numbersImageForStyle:typeface:device:");
      [(UIImageView *)numberImageView setImage:v11];

      [(UIImageView *)self->_numberImageView setContentMode:4];
    }
    if (self->_transitionTo.style != var0 || self->_transitionTo.language != var1)
    {
      self->_transitionTo.style = var0;
      self->_transitionTo.language = var1;
      transitionNumberImageView = self->_transitionNumberImageView;
      v14 = +[NTKUtilityFaceDialFactory numbersImageForStyle:var0 typeface:var1 device:self->_device];
      [(UIImageView *)transitionNumberImageView setImage:v14];

      [(UIImageView *)self->_transitionNumberImageView setContentMode:4];
    }
    [(UIImageView *)self->_numberImageView setAlpha:1.0 - a5];
    id v15 = self->_transitionNumberImageView;
    [(UIImageView *)v15 setAlpha:a5];
  }
}

- (void)transitionFromStyle:(unint64_t)a3 toStyle:(unint64_t)a4 withFraction:(double)a5
{
}

- (void)transitionFromTypeface:(unint64_t)a3 toTypeface:(unint64_t)a4 withFraction:(double)a5
{
}

- (void)setTickColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_transitionNumberImageView, 0);
  objc_storeStrong((id *)&self->_numberImageView, 0);

  objc_storeStrong((id *)&self->_dialImageView, 0);
}

@end