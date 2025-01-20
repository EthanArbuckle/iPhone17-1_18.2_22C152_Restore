@interface CAMInterfaceModulationView
- (CAFilter)_modulationFilter;
- (CAMInterfaceModulationView)initWithHostingView:(id)a3;
- (UIView)hostingView;
- (id)_keyPathForFilterKey:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)_inFlightAnimationCount;
- (unint64_t)interfaceModulation;
- (void)_setInFlightAnimationCount:(unint64_t)a3;
- (void)_setModulationFilter:(id)a3;
- (void)_updateModulationLayerEnabled;
- (void)didAddSubview:(id)a3;
- (void)modulationAnimationDidStop:(BOOL)a3;
- (void)setInterfaceModulation:(unint64_t)a3;
- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMInterfaceModulationView

- (CAMInterfaceModulationView)initWithHostingView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMInterfaceModulationView;
  v5 = -[CAMInterfaceModulationView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hostingView, v4);
    v6->_interfaceModulation = 0;
  }

  return v6;
}

- (void)didAddSubview:(id)a3
{
  id v3 = [(CAMInterfaceModulationView *)self hostingView];
  [v3 setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CAMInterfaceModulationView;
  -[CAMInterfaceModulationView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMInterfaceModulationView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (void)setInterfaceModulation:(unint64_t)a3
{
}

- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  if (self->_interfaceModulation != a3)
  {
    BOOL v4 = a4;
    if (a3 > 2) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_263FA4268[a3];
    }
    self->_interfaceModulation = a3;
    objc_super v7 = [(CAMInterfaceModulationView *)self _modulationFilter];
    objc_super v8 = [(CAMInterfaceModulationView *)self _keyPathForFilterKey:*MEMORY[0x263F15CA0]];
    v9 = [(CAMInterfaceModulationView *)self layer];
    if (!v7)
    {
      objc_super v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BB8]];
      [v7 setValue:&unk_26BDDE598 forKey:*MEMORY[0x263F15BF8]];
      [v7 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
      [v7 setName:@"modulationFilter"];
      [(CAMInterfaceModulationView *)self _setModulationFilter:v7];
      v24[0] = v7;
      v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      [v9 setFilters:v10];
    }
    if (v4)
    {
      v11 = [v9 presentationLayer];
      v12 = [v11 filters];
      if (v12)
      {
        id v13 = [v9 presentationLayer];
      }
      else
      {
        id v13 = v9;
      }
      v14 = v13;

      v15 = [MEMORY[0x263F15760] animationWithKeyPath:v8];
      v16 = [v14 valueForKeyPath:v8];
      [v15 setFromValue:v16];

      [v15 setToValue:v6];
      [v15 setDuration:0.3];
      [(CAMInterfaceModulationView *)self _setInFlightAnimationCount:[(CAMInterfaceModulationView *)self _inFlightAnimationCount] + 1];
      objc_initWeak(&location, self);
      v17 = objc_alloc_init(CAMAnimationDelegate);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __62__CAMInterfaceModulationView_setInterfaceModulation_animated___block_invoke;
      v21 = &unk_263FA1D38;
      objc_copyWeak(&v22, &location);
      [(CAMAnimationDelegate *)v17 setCompletion:&v18];
      objc_msgSend(v15, "setDelegate:", v17, v18, v19, v20, v21);
      [v9 addAnimation:v15 forKey:@"interfaceModulationAnimation"];
      objc_destroyWeak(&v22);

      objc_destroyWeak(&location);
    }
    [v9 setValue:v6 forKeyPath:v8];
    [(CAMInterfaceModulationView *)self _updateModulationLayerEnabled];
  }
}

void __62__CAMInterfaceModulationView_setInterfaceModulation_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained modulationAnimationDidStop:a2];
}

- (void)modulationAnimationDidStop:(BOOL)a3
{
  [(CAMInterfaceModulationView *)self _setInFlightAnimationCount:[(CAMInterfaceModulationView *)self _inFlightAnimationCount] - 1];
  [(CAMInterfaceModulationView *)self _updateModulationLayerEnabled];
}

- (void)_updateModulationLayerEnabled
{
  unint64_t v3 = [(CAMInterfaceModulationView *)self interfaceModulation];
  if (v3 - 1 >= 2)
  {
    if (v3) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = [(CAMInterfaceModulationView *)self _inFlightAnimationCount] != 0;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
  id v7 = [(CAMInterfaceModulationView *)self layer];
  v5 = [NSNumber numberWithBool:v4];
  uint64_t v6 = [(CAMInterfaceModulationView *)self _keyPathForFilterKey:@"enabled"];
  [v7 setValue:v5 forKeyPath:v6];
}

- (id)_keyPathForFilterKey:(id)a3
{
  return (id)[NSString stringWithFormat:@"filters.%@.%@", @"modulationFilter", a3];
}

- (UIView)hostingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  return (UIView *)WeakRetained;
}

- (unint64_t)interfaceModulation
{
  return self->_interfaceModulation;
}

- (CAFilter)_modulationFilter
{
  return self->__modulationFilter;
}

- (void)_setModulationFilter:(id)a3
{
}

- (unint64_t)_inFlightAnimationCount
{
  return self->__inFlightAnimationCount;
}

- (void)_setInFlightAnimationCount:(unint64_t)a3
{
  self->__inFlightAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__modulationFilter, 0);
  objc_destroyWeak((id *)&self->_hostingView);
}

@end