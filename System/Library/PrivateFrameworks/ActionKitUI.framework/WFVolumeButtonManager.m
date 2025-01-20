@interface WFVolumeButtonManager
- (WFVolumeButtonManager)initWithPressHandler:(id)a3;
- (id)pressHandler;
- (void)dealloc;
- (void)setPressHandler:(id)a3;
- (void)volumeButtonPressed;
@end

@implementation WFVolumeButtonManager

- (void).cxx_destruct
{
}

- (void)setPressHandler:(id)a3
{
}

- (id)pressHandler
{
  return self->_pressHandler;
}

- (void)volumeButtonPressed
{
  v2 = [(WFVolumeButtonManager *)self pressHandler];
  v2[2]();
}

- (void)dealloc
{
  if (!--_instanceCount)
  {
    v3 = [MEMORY[0x263F82438] sharedApplication];
    [v3 setWantsVolumeButtonEvents:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)WFVolumeButtonManager;
  [(WFVolumeButtonManager *)&v4 dealloc];
}

- (WFVolumeButtonManager)initWithPressHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFVolumeButtonManager.m", 26, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFVolumeButtonManager;
  v6 = [(WFVolumeButtonManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    [(WFVolumeButtonManager *)v6 setPressHandler:v5];
    uint64_t v8 = _instanceCount;
    if (!_instanceCount)
    {
      v9 = [MEMORY[0x263F82438] sharedApplication];
      [v9 setWantsVolumeButtonEvents:1];

      uint64_t v8 = _instanceCount;
    }
    _instanceCount = v8 + 1;
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v7 selector:sel_volumeButtonPressed name:*MEMORY[0x263F83C90] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v7 selector:sel_volumeButtonPressed name:*MEMORY[0x263F83C80] object:0];

    v12 = v7;
  }

  return v7;
}

@end