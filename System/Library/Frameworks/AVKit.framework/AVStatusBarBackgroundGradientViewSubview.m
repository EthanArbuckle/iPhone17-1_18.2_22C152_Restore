@interface AVStatusBarBackgroundGradientViewSubview
+ (Class)layerClass;
- (AVStatusBarBackgroundGradientViewSubview)initWithFrame:(CGRect)a3;
- (double)gradientOpacity;
- (void)setGradientOpacity:(double)a3;
@end

@implementation AVStatusBarBackgroundGradientViewSubview

- (void)setGradientOpacity:(double)a3
{
  self->_gradientOpacity = a3;
}

- (double)gradientOpacity
{
  return self->_gradientOpacity;
}

- (AVStatusBarBackgroundGradientViewSubview)initWithFrame:(CGRect)a3
{
  v27[16] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)AVStatusBarBackgroundGradientViewSubview;
  v3 = -[AVStatusBarBackgroundGradientViewSubview initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v25 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
    v27[0] = [v25 CGColor];
    id v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.994603225];
    v27[1] = [v24 CGColor];
    id v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.978587023];
    v27[2] = [v23 CGColor];
    id v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.952464435];
    v27[3] = [v22 CGColor];
    id v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.917060124];
    v27[4] = [v21 CGColor];
    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.822990973];
    v27[5] = [v20 CGColor];
    id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.707279774];
    v27[6] = [v19 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.458754447];
    v27[7] = [v18 CGColor];
    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.346236755];
    v27[8] = [v17 CGColor];
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.250244738];
    v27[9] = [v4 CGColor];
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.173203094];
    v27[10] = [v5 CGColor];
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.114800887];
    v27[11] = [v6 CGColor];
    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0728674787];
    v27[12] = [v7 CGColor];
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0442915775];
    v27[13] = [v8 CGColor];
    id v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0143711881];
    v27[14] = [v9 CGColor];
    id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.00392156863];
    v27[15] = [v10 CGColor];
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:16];
    v12 = [(AVStatusBarBackgroundGradientViewSubview *)v3 layer];
    [v12 setColors:v11];

    v13 = [(AVStatusBarBackgroundGradientViewSubview *)v3 layer];
    [v13 setLocations:&unk_1F094A298];

    v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A078]];
    v15 = [(AVStatusBarBackgroundGradientViewSubview *)v3 layer];
    [v15 setCompositingFilter:v14];
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end