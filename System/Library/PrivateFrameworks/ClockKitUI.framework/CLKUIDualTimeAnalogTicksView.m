@interface CLKUIDualTimeAnalogTicksView
- (CLKUIDualTimeAnalogTicksView)initWithConfiguration:(id *)a3;
- (CLKUIDualTimeAnalogTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4;
- (id)_createReplicatorLayerWithTickCount:(unint64_t)a3;
- (id)_createTickLayerWithSize:(CGSize)a3 actions:(id)a4;
- (void)layoutSubviews;
- (void)setHourTickColor:(id)a3 minuteTickColor:(id)a4;
@end

@implementation CLKUIDualTimeAnalogTicksView

- (CLKUIDualTimeAnalogTicksView)initWithConfiguration:(id *)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v7 = *(_OWORD *)&a3->var4;
  v10[2] = a3->var3;
  v10[3] = v7;
  uint64_t v11 = *(void *)&a3->var6;
  CGSize var2 = a3->var2;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = var2;
  return -[CLKUIDualTimeAnalogTicksView initWithFrame:configuration:](self, "initWithFrame:configuration:", v10, v3, v4, v5, v6);
}

- (CLKUIDualTimeAnalogTicksView)initWithFrame:(CGRect)a3 configuration:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CLKUIDualTimeAnalogTicksView;
  double v5 = -[CLKUIDualTimeAnalogTicksView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = (CLKUIDualTimeAnalogTicksView *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 408) = *(_OWORD *)&a4->var0;
    CGSize var3 = a4->var3;
    long long v7 = *(_OWORD *)&a4->var4;
    CGSize var2 = a4->var2;
    *((void *)v5 + 59) = *(void *)&a4->var6;
    *(CGSize *)(v5 + 440) = var3;
    *(_OWORD *)(v5 + 456) = v7;
    *(CGSize *)(v5 + 424) = var2;
    if (a4->var6)
    {
      v25 = @"position";
      v10 = [MEMORY[0x1E4F1CA98] null];
      v26[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    }
    else
    {
      v23[0] = @"backgroundColor";
      v10 = [MEMORY[0x1E4F1CA98] null];
      v23[1] = @"position";
      v24[0] = v10;
      v12 = [MEMORY[0x1E4F1CA98] null];
      v24[1] = v12;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    }
    if (a4->var0)
    {
      uint64_t v13 = -[CLKUIDualTimeAnalogTicksView _createReplicatorLayerWithTickCount:](v6, "_createReplicatorLayerWithTickCount:");
      minuteTickReplicatorLayer = v6->_minuteTickReplicatorLayer;
      v6->_minuteTickReplicatorLayer = (CAReplicatorLayer *)v13;

      uint64_t v15 = -[CLKUIDualTimeAnalogTicksView _createTickLayerWithSize:actions:](v6, "_createTickLayerWithSize:actions:", v11, a4->var2.width, a4->var2.height);
      minuteTickLayer = v6->_minuteTickLayer;
      v6->_minuteTickLayer = (CALayer *)v15;

      [(CAReplicatorLayer *)v6->_minuteTickReplicatorLayer addSublayer:v6->_minuteTickLayer];
    }
    if (a4->var1)
    {
      uint64_t v17 = -[CLKUIDualTimeAnalogTicksView _createReplicatorLayerWithTickCount:](v6, "_createReplicatorLayerWithTickCount:");
      hourTickReplicatorLayer = v6->_hourTickReplicatorLayer;
      v6->_hourTickReplicatorLayer = (CAReplicatorLayer *)v17;

      uint64_t v19 = -[CLKUIDualTimeAnalogTicksView _createTickLayerWithSize:actions:](v6, "_createTickLayerWithSize:actions:", v11, a4->var3.width, a4->var3.height);
      hourTickLayer = v6->_hourTickLayer;
      v6->_hourTickLayer = (CALayer *)v19;

      [(CAReplicatorLayer *)v6->_hourTickReplicatorLayer addSublayer:v6->_hourTickLayer];
    }
  }
  return v6;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CLKUIDualTimeAnalogTicksView;
  [(CLKUIDualTimeAnalogTicksView *)&v18 layoutSubviews];
  uint64_t v3 = [(CLKUIDualTimeAnalogTicksView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = MEMORY[0x1D94315A0](v3);
  double v14 = v12;
  double v15 = v13;
  minuteTickReplicatorLayer = self->_minuteTickReplicatorLayer;
  if (minuteTickReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](minuteTickReplicatorLayer, "setPosition:", v12, v13);
    -[CAReplicatorLayer setBounds:](self->_minuteTickReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_minuteTickLayer, "setPosition:", v14, self->_configuration.minuteTickSize.height * 0.5 + self->_configuration.minuteTickInset * 0.5);
  }
  hourTickReplicatorLayer = self->_hourTickReplicatorLayer;
  if (hourTickReplicatorLayer)
  {
    -[CAReplicatorLayer setPosition:](hourTickReplicatorLayer, "setPosition:", v14, v15);
    -[CAReplicatorLayer setBounds:](self->_hourTickReplicatorLayer, "setBounds:", v5, v7, v9, v11);
    -[CALayer setPosition:](self->_hourTickLayer, "setPosition:", v14, self->_configuration.hourTickSize.height * 0.5 + self->_configuration.hourTickInset * 0.5);
  }
}

- (id)_createReplicatorLayerWithTickCount:(unint64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F39C68] layer];
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v5 setInstanceCount:a3];
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v5, "setInstanceColor:", objc_msgSend(v6, "CGColor"));

  CATransform3DMakeRotation(&v12, 6.28318531 / (double)a3, 0.0, 0.0, 1.0);
  [v5 setInstanceTransform:&v12];
  v13[0] = @"position";
  double v7 = [MEMORY[0x1E4F1CA98] null];
  v13[1] = @"bounds";
  v14[0] = v7;
  double v8 = [MEMORY[0x1E4F1CA98] null];
  v14[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v5 setActions:v9];

  double v10 = [(CLKUIDualTimeAnalogTicksView *)self layer];
  [v10 addSublayer:v5];

  return v5;
}

- (id)_createTickLayerWithSize:(CGSize)a3 actions:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = (void *)MEMORY[0x1E4F39BE8];
  id v7 = a4;
  double v8 = [v6 layer];
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));

  objc_msgSend(v8, "setBounds:", 0.0, 0.0, width, height);
  [v8 setCornerRadius:width * 0.5];
  [v8 setActions:v7];

  return v8;
}

- (void)setHourTickColor:(id)a3 minuteTickColor:(id)a4
{
  hourTickLayer = self->_hourTickLayer;
  id v7 = a3;
  id v8 = a4;
  -[CALayer setBackgroundColor:](hourTickLayer, "setBackgroundColor:", [v7 CGColor]);
  minuteTickLayer = self->_minuteTickLayer;
  id v10 = v8;
  uint64_t v11 = [v10 CGColor];

  [(CALayer *)minuteTickLayer setBackgroundColor:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourTickLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickLayer, 0);
  objc_storeStrong((id *)&self->_hourTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->_minuteTickReplicatorLayer, 0);
}

@end