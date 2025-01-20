@interface AVTHUDView
- (AVTHUDView)initWithFrame:(CGRect)a3;
- (id)_label;
- (void)_loadSubviews;
- (void)_tapAction:(id)a3;
- (void)_updateLatencyBar:(id *)a3;
- (void)_updateLatencyGraph:(id *)a3;
- (void)layoutSubviews;
- (void)updateWithData:(id *)a3;
@end

@implementation AVTHUDView

- (AVTHUDView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTHUDView;
  v3 = -[AVTHUDView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(AVTHUDView *)v3 setBackgroundColor:v4];

    [(AVTHUDView *)v3 _loadSubviews];
  }
  return v3;
}

- (void)updateWithData:(id *)a3
{
  v5 = [NSString stringWithFormat:@"Total latency: %.2f ms", a3->var0 * 1000.0];
  [(UILabel *)self->_totalLatencyLabel setText:v5];

  objc_super v6 = [NSString stringWithFormat:@"ARKit latency: %.2f ms", a3->var1 * 1000.0];
  [(UILabel *)self->_arKitLatencyLabel setText:v6];

  v7 = [NSString stringWithFormat:@"Sync latency: %.2f ms", a3->var2 * 1000.0];
  [(UILabel *)self->_updateSyncLatencyLabel setText:v7];

  v8 = [NSString stringWithFormat:@"MTL latency: %.2f ms", a3->var3 * 1000.0];
  [(UILabel *)self->_metalLatencyLabel setText:v8];

  float var6 = a3->var6;
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"Audio time: %f ms", var6);
  [(UILabel *)self->_audioTimeLabel setText:v10];

  v11 = @"2x Buffer";
  if (!a3->var8) {
    v11 = @"3x Buffer";
  }
  v12 = [NSString stringWithFormat:@"FPS: %d | %@", a3->var5, v11];
  [(UILabel *)self->_fpsLabel setText:v12];

  v13 = [NSString stringWithFormat:@"Time between ARFrame: %.2f ms", a3->var4 * 1000.0];
  [(UILabel *)self->_timeBetweenARFrameLabel setText:v13];

  v14 = objc_msgSend(NSString, "stringWithFormat:", @"Frame dropped/s: %d", a3->var7);
  [(UILabel *)self->_droppedFrameLabel setText:v14];

  v15 = objc_msgSend(NSString, "stringWithFormat:", @"Shader compilation: %d", a3->var9);
  [(UILabel *)self->_shaderCompilationLabel setText:v15];

  if (a3->var9)
  {
    v16 = [MEMORY[0x263F1C550] redColor];
    [(UILabel *)self->_shaderCompilationLabel setTextColor:v16];
  }
  *(_OWORD *)&self->_lastFrameData.totalLatency = *(_OWORD *)&a3->var0;
  long long v18 = *(_OWORD *)&a3->var4;
  long long v17 = *(_OWORD *)&a3->var6;
  long long v19 = *(_OWORD *)&a3->var2;
  *(void *)&self->_lastFrameData.onlineShaderCompilationCount = *(void *)&a3->var9;
  *(_OWORD *)&self->_lastFrameData.timeBetweenARFrame = v18;
  *(_OWORD *)&self->_lastFrameData.audioTime = v17;
  *(_OWORD *)&self->_lastFrameData.updateSyncLatency = v19;
  [(AVTHUDView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AVTHUDView;
  [(AVTHUDView *)&v5 layoutSubviews];
  [(AVTHUDView *)self bounds];
  double v4 = v3 + -10.0;
  -[UILabel setFrame:](self->_totalLatencyLabel, "setFrame:", 5.0, 5.0, v3 + -10.0, 15.0);
  -[UILabel setFrame:](self->_arKitLatencyLabel, "setFrame:", 5.0, 25.0, v4, 15.0);
  -[UILabel setFrame:](self->_updateSyncLatencyLabel, "setFrame:", 5.0, 45.0, v4, 15.0);
  -[UILabel setFrame:](self->_metalLatencyLabel, "setFrame:", 5.0, 65.0, v4, 15.0);
  -[UILabel setFrame:](self->_audioTimeLabel, "setFrame:", 5.0, 85.0, v4, 15.0);
  -[UILabel setFrame:](self->_fpsLabel, "setFrame:", 5.0, 105.0, v4, 15.0);
  -[UILabel setFrame:](self->_timeBetweenARFrameLabel, "setFrame:", 5.0, 125.0, v4, 15.0);
  -[UILabel setFrame:](self->_droppedFrameLabel, "setFrame:", 5.0, 145.0, v4, 15.0);
  -[UILabel setFrame:](self->_shaderCompilationLabel, "setFrame:", 5.0, 165.0, v4, 15.0);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AVTHUDView *)self _updateLatencyBar:&self->_lastFrameData];
  [(AVTHUDView *)self _updateLatencyGraph:&self->_lastFrameData];
  [MEMORY[0x263F158F8] commit];
}

- (void)_updateLatencyBar:(id *)a3
{
  double var0 = a3->var0;
  BOOL v6 = a3->var0 <= 0.0;
  [(CALayer *)self->_arKitLatencyBar setHidden:v6];
  [(CALayer *)self->_updateLatencyBar setHidden:v6];
  [(CALayer *)self->_metalLatencyBar setHidden:v6];
  if (var0 > 0.0)
  {
    [(AVTHUDView *)self bounds];
    double v8 = v7 / 3.0 + -10.0;
    double v9 = 0.1;
    if (a3->var0 <= 0.1) {
      double v9 = a3->var0;
    }
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    float v10 = v9;
    float v11 = v8 * (v10 / a3->var0);
    [(UILabel *)self->_shaderCompilationLabel frame];
    double v13 = v12 + 15.0 + 5.0;
    float v14 = a3->var1 / a3->var0;
    float v15 = a3->var2 / a3->var0;
    float v16 = a3->var3 / a3->var0;
    [(AVTHUDView *)self bounds];
    double v18 = v17 - (v11 + 5.0);
    double v19 = (float)(v14 * v11);
    -[CALayer setFrame:](self->_arKitLatencyBar, "setFrame:", v18, v13, v19, 5.0);
    double v20 = v18 + v19;
    -[CALayer setFrame:](self->_updateLatencyBar, "setFrame:", v20, v13, (float)(v15 * v11), 5.0);
    metalLatencyBar = self->_metalLatencyBar;
    -[CALayer setFrame:](metalLatencyBar, "setFrame:", v20 + (float)(v15 * v11), v13, (float)(v16 * v11), 5.0);
  }
}

- (void)_updateLatencyGraph:(id *)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  [(AVTHUDView *)self bounds];
  double v6 = v5 / 3.0 + -10.0;
  float v7 = v6 * 0.25;
  int v8 = (int)fmaxf(ceilf(v7), 1.0);
  totalLatencyGraphLayers = self->_totalLatencyGraphLayers;
  uint64_t v10 = v8;
  if (!totalLatencyGraphLayers)
  {
    float v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v8];
    double v12 = self->_totalLatencyGraphLayers;
    self->_totalLatencyGraphLayers = v11;

    totalLatencyGraphLayers = self->_totalLatencyGraphLayers;
  }
  if ([(NSMutableArray *)totalLatencyGraphLayers count] >= (unint64_t)v8)
  {
    double v13 = [(NSMutableArray *)self->_totalLatencyGraphLayers objectAtIndexedSubscript:0];
    if ((unint64_t)[(NSMutableArray *)self->_totalLatencyGraphLayers count] >= 2)
    {
      unint64_t v15 = 1;
      do
      {
        float v16 = [(NSMutableArray *)self->_totalLatencyGraphLayers objectAtIndexedSubscript:v15];
        [(NSMutableArray *)self->_totalLatencyGraphLayers setObject:v16 atIndexedSubscript:v15 - 1];

        ++v15;
      }
      while ([(NSMutableArray *)self->_totalLatencyGraphLayers count] > v15);
    }
    [(NSMutableArray *)self->_totalLatencyGraphLayers setObject:v13 atIndexedSubscript:[(NSMutableArray *)self->_totalLatencyGraphLayers count] - 1];
  }
  else
  {
    double v13 = [MEMORY[0x263F157E8] layer];
    [v13 setOpaque:1];
    [(NSMutableArray *)self->_totalLatencyGraphLayers addObject:v13];
    float v14 = [(AVTHUDView *)self layer];
    [v14 addSublayer:v13];
  }
  int selectedGraphIndex = self->_selectedGraphIndex;
  if (selectedGraphIndex == 3)
  {
    p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var3;
  }
  else if (selectedGraphIndex == 2)
  {
    p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var2;
  }
  else
  {
    p_var3 = a3;
    if (selectedGraphIndex == 1) {
      p_var3 = ($BE50A9AA43D9A69F4120A6BB065164BC *)&a3->var1;
    }
  }
  double var0 = a3->var0;
  double v20 = 0.0;
  if (a3->var0 > 0.0)
  {
    double v21 = p_var3->var0;
    if (p_var3->var0 > 0.1) {
      double v21 = 0.1;
    }
    if (v21 < 0.0) {
      double v21 = 0.0;
    }
    float v22 = v21;
    double var0 = v22 / 0.1 * 15.0;
    *(float *)&double var0 = var0;
    double v20 = *(float *)&var0;
  }
  switch(selectedGraphIndex)
  {
    case 1:
      v23 = objc_msgSend(MEMORY[0x263F1C550], "systemRedColor", var0);
      break;
    case 2:
      v23 = objc_msgSend(MEMORY[0x263F1C550], "systemGreenColor", var0);
      break;
    case 3:
      v23 = objc_msgSend(MEMORY[0x263F1C550], "systemBlueColor", var0);
      break;
    default:
      v23 = objc_msgSend(MEMORY[0x263F1C550], "labelColor", var0);
      break;
  }
  id v24 = v23;
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, 3.0, v20);
  [(AVTHUDView *)self bounds];
  double v26 = v25;
  uint64_t v27 = [(NSMutableArray *)self->_totalLatencyGraphLayers count];
  [(CALayer *)self->_metalLatencyBar frame];
  double v29 = v28;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v30 = self->_totalLatencyGraphLayers;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    double v33 = v29 + 5.0 + 5.0;
    double v34 = v26 - (v6 + 5.0 + 1.0) + (double)(unint64_t)(v10 - v27) * 4.0;
    uint64_t v35 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v30);
        }
        v37 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        objc_msgSend(v37, "frame", (void)v39);
        objc_msgSend(v37, "setFrame:", v34, v33 + 15.0 - v38);
        double v34 = v34 + 4.0;
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v32);
  }
}

- (id)_label
{
  id v3 = objc_alloc(MEMORY[0x263F1C768]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v4 setUserInteractionEnabled:1];
  double v5 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:12.0 weight:*MEMORY[0x263F1D338]];
  [v4 setFont:v5];

  double v6 = [MEMORY[0x263F1C550] clearColor];
  [v4 setBackgroundColor:v6];

  [v4 setTextAlignment:2];
  float v7 = [MEMORY[0x263F1C550] labelColor];
  [v4 setTextColor:v7];

  int v8 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapAction_];
  [v4 addGestureRecognizer:v8];

  return v4;
}

- (void)_loadSubviews
{
  id v3 = [(AVTHUDView *)self _label];
  totalLatencyLabel = self->_totalLatencyLabel;
  self->_totalLatencyLabel = v3;

  double v5 = [(AVTHUDView *)self _label];
  arKitLatencyLabel = self->_arKitLatencyLabel;
  self->_arKitLatencyLabel = v5;

  float v7 = [MEMORY[0x263F1C550] redColor];
  [(UILabel *)self->_arKitLatencyLabel setTextColor:v7];

  int v8 = [(AVTHUDView *)self _label];
  updateSyncLatencyLabel = self->_updateSyncLatencyLabel;
  self->_updateSyncLatencyLabel = v8;

  uint64_t v10 = [MEMORY[0x263F1C550] greenColor];
  [(UILabel *)self->_updateSyncLatencyLabel setTextColor:v10];

  float v11 = [(AVTHUDView *)self _label];
  metalLatencyLabel = self->_metalLatencyLabel;
  self->_metalLatencyLabel = v11;

  double v13 = [MEMORY[0x263F1C550] blueColor];
  [(UILabel *)self->_metalLatencyLabel setTextColor:v13];

  float v14 = [(AVTHUDView *)self _label];
  audioTimeLabel = self->_audioTimeLabel;
  self->_audioTimeLabel = v14;

  [(UILabel *)self->_audioTimeLabel setGestureRecognizers:0];
  [(UILabel *)self->_audioTimeLabel setUserInteractionEnabled:0];
  float v16 = [(AVTHUDView *)self _label];
  fpsLabel = self->_fpsLabel;
  self->_fpsLabel = v16;

  [(UILabel *)self->_fpsLabel setGestureRecognizers:0];
  [(UILabel *)self->_fpsLabel setUserInteractionEnabled:0];
  double v18 = [(AVTHUDView *)self _label];
  timeBetweenARFrameLabel = self->_timeBetweenARFrameLabel;
  self->_timeBetweenARFrameLabel = v18;

  [(UILabel *)self->_timeBetweenARFrameLabel setGestureRecognizers:0];
  [(UILabel *)self->_timeBetweenARFrameLabel setUserInteractionEnabled:0];
  double v20 = [(AVTHUDView *)self _label];
  droppedFrameLabel = self->_droppedFrameLabel;
  self->_droppedFrameLabel = v20;

  [(UILabel *)self->_droppedFrameLabel setGestureRecognizers:0];
  [(UILabel *)self->_droppedFrameLabel setUserInteractionEnabled:0];
  float v22 = [(AVTHUDView *)self _label];
  shaderCompilationLabel = self->_shaderCompilationLabel;
  self->_shaderCompilationLabel = v22;

  [(UILabel *)self->_shaderCompilationLabel setGestureRecognizers:0];
  [(UILabel *)self->_shaderCompilationLabel setUserInteractionEnabled:0];
  [(AVTHUDView *)self addSubview:self->_totalLatencyLabel];
  [(AVTHUDView *)self addSubview:self->_arKitLatencyLabel];
  [(AVTHUDView *)self addSubview:self->_updateSyncLatencyLabel];
  [(AVTHUDView *)self addSubview:self->_metalLatencyLabel];
  [(AVTHUDView *)self addSubview:self->_fpsLabel];
  [(AVTHUDView *)self addSubview:self->_audioTimeLabel];
  [(AVTHUDView *)self addSubview:self->_timeBetweenARFrameLabel];
  [(AVTHUDView *)self addSubview:self->_droppedFrameLabel];
  [(AVTHUDView *)self addSubview:self->_shaderCompilationLabel];
  id v24 = [MEMORY[0x263F157E8] layer];
  arKitLatencyBar = self->_arKitLatencyBar;
  self->_arKitLatencyBar = v24;

  id v26 = [MEMORY[0x263F1C550] redColor];
  -[CALayer setBackgroundColor:](self->_arKitLatencyBar, "setBackgroundColor:", [v26 CGColor]);

  [(CALayer *)self->_arKitLatencyBar setOpaque:1];
  uint64_t v27 = [MEMORY[0x263F157E8] layer];
  updateLatencyBar = self->_updateLatencyBar;
  self->_updateLatencyBar = v27;

  id v29 = [MEMORY[0x263F1C550] greenColor];
  -[CALayer setBackgroundColor:](self->_updateLatencyBar, "setBackgroundColor:", [v29 CGColor]);

  [(CALayer *)self->_updateLatencyBar setOpaque:1];
  v30 = [MEMORY[0x263F157E8] layer];
  metalLatencyBar = self->_metalLatencyBar;
  self->_metalLatencyBar = v30;

  id v32 = [MEMORY[0x263F1C550] blueColor];
  -[CALayer setBackgroundColor:](self->_metalLatencyBar, "setBackgroundColor:", [v32 CGColor]);

  [(CALayer *)self->_metalLatencyBar setOpaque:1];
  double v33 = [(AVTHUDView *)self layer];
  [v33 addSublayer:self->_arKitLatencyBar];

  double v34 = [(AVTHUDView *)self layer];
  [v34 addSublayer:self->_updateLatencyBar];

  id v35 = [(AVTHUDView *)self layer];
  [v35 addSublayer:self->_metalLatencyBar];
}

- (void)_tapAction:(id)a3
{
  id v12 = a3;
  double v4 = [v12 view];
  totalLatencyLabel = self->_totalLatencyLabel;

  if (v4 == totalLatencyLabel) {
    self->_int selectedGraphIndex = 0;
  }
  double v6 = [v12 view];
  arKitLatencyLabel = self->_arKitLatencyLabel;

  if (v6 == arKitLatencyLabel) {
    self->_int selectedGraphIndex = 1;
  }
  int v8 = [v12 view];
  updateSyncLatencyLabel = self->_updateSyncLatencyLabel;

  if (v8 == updateSyncLatencyLabel) {
    self->_int selectedGraphIndex = 2;
  }
  uint64_t v10 = [v12 view];
  metalLatencyLabel = self->_metalLatencyLabel;

  if (v10 == metalLatencyLabel) {
    self->_int selectedGraphIndex = 3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalLatencyGraphLayers, 0);
  objc_storeStrong((id *)&self->_metalLatencyBar, 0);
  objc_storeStrong((id *)&self->_updateLatencyBar, 0);
  objc_storeStrong((id *)&self->_arKitLatencyBar, 0);
  objc_storeStrong((id *)&self->_shaderCompilationLabel, 0);
  objc_storeStrong((id *)&self->_droppedFrameLabel, 0);
  objc_storeStrong((id *)&self->_timeBetweenARFrameLabel, 0);
  objc_storeStrong((id *)&self->_audioTimeLabel, 0);
  objc_storeStrong((id *)&self->_fpsLabel, 0);
  objc_storeStrong((id *)&self->_metalLatencyLabel, 0);
  objc_storeStrong((id *)&self->_updateSyncLatencyLabel, 0);
  objc_storeStrong((id *)&self->_arKitLatencyLabel, 0);
  objc_storeStrong((id *)&self->_totalLatencyLabel, 0);
}

@end