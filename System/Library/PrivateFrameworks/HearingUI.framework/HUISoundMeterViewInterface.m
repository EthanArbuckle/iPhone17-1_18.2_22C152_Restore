@interface HUISoundMeterViewInterface
- (BOOL)shouldShow;
- (HUISoundMeterListener)meteringListener;
- (HUISoundMeterViewInterface)initWithConfigurationType:(unint64_t)a3 delegate:(id)a4 source:(unint64_t)a5;
- (HUISoundMeterViewInterfaceDelegate)delegate;
- (HUISoundMeterViewInterfaceInternal)soundMeterViewInterfaceInternal;
- (id)soundMeterView;
- (id)soundMeterViewController;
- (void)liveLevelMeteringDisplayStateChanged:(BOOL)a3;
- (void)localSourceAvailableDidUpdate:(BOOL)a3;
- (void)remoteSourceAvailableDidUpdate:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMeteringListener:(id)a3;
- (void)setSoundMeterViewInterfaceInternal:(id)a3;
- (void)start;
- (void)stop;
- (void)updateViewsWith:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5;
@end

@implementation HUISoundMeterViewInterface

- (HUISoundMeterViewInterface)initWithConfigurationType:(unint64_t)a3 delegate:(id)a4 source:(unint64_t)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUISoundMeterViewInterface;
  v9 = [(HUISoundMeterViewInterface *)&v13 init];
  if (v9)
  {
    v10 = [[HUISoundMeterViewInterfaceInternal alloc] initWithConfigurationType:a3];
    [(HUISoundMeterViewInterface *)v9 setSoundMeterViewInterfaceInternal:v10];

    [(HUISoundMeterViewInterface *)v9 setDelegate:v8];
    v11 = [[HUISoundMeterListener alloc] initWithDelgate:v9 source:a5];
    [(HUISoundMeterViewInterface *)v9 setMeteringListener:v11];
  }
  return v9;
}

- (id)soundMeterViewController
{
  v2 = [(HUISoundMeterViewInterface *)self soundMeterViewInterfaceInternal];
  v3 = [v2 soundMeterViewController];

  return v3;
}

- (id)soundMeterView
{
  v2 = [(HUISoundMeterViewInterface *)self soundMeterViewInterfaceInternal];
  v3 = [v2 soundMeterViewController];
  v4 = [v3 view];

  return v4;
}

- (void)start
{
  id v2 = [(HUISoundMeterViewInterface *)self meteringListener];
  [v2 start];
}

- (void)stop
{
  id v2 = [(HUISoundMeterViewInterface *)self meteringListener];
  [v2 stop];
}

- (BOOL)shouldShow
{
  id v2 = [(HUISoundMeterViewInterface *)self meteringListener];
  char v3 = [v2 shouldShow];

  return v3;
}

- (void)liveLevelMeteringDisplayStateChanged:(BOOL)a3
{
  char v3 = [(HUISoundMeterViewInterface *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    AXPerformBlockOnMainThread();
  }
}

void __67__HUISoundMeterViewInterface_liveLevelMeteringDisplayStateChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 soundMeterViewInterfaceDisplayStateChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateViewsWith:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5
{
  id v8 = [(HUISoundMeterViewInterface *)self soundMeterViewInterfaceInternal];
  [v8 updateViewsWithSlowLeq:a5 fastLeq:a3 thresholdLevel:a4];
}

- (void)localSourceAvailableDidUpdate:(BOOL)a3
{
  char v3 = [(HUISoundMeterViewInterface *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    AXPerformBlockOnMainThread();
  }
}

void __60__HUISoundMeterViewInterface_localSourceAvailableDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 localSourceAvailableDidUpdate:*(unsigned __int8 *)(a1 + 40)];
}

- (void)remoteSourceAvailableDidUpdate:(BOOL)a3
{
  char v3 = [(HUISoundMeterViewInterface *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4) {
    AXPerformBlockOnMainThread();
  }
}

void __61__HUISoundMeterViewInterface_remoteSourceAvailableDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteSourceAvailableDidUpdate:*(unsigned __int8 *)(a1 + 40)];
}

- (HUISoundMeterViewInterfaceInternal)soundMeterViewInterfaceInternal
{
  return self->_soundMeterViewInterfaceInternal;
}

- (void)setSoundMeterViewInterfaceInternal:(id)a3
{
}

- (HUISoundMeterListener)meteringListener
{
  return self->_meteringListener;
}

- (void)setMeteringListener:(id)a3
{
}

- (HUISoundMeterViewInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUISoundMeterViewInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_meteringListener, 0);

  objc_storeStrong((id *)&self->_soundMeterViewInterfaceInternal, 0);
}

@end