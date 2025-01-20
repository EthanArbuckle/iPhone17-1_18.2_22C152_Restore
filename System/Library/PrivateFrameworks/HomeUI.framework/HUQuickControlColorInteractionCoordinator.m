@interface HUQuickControlColorInteractionCoordinator
- (BOOL)hasPendingColorPaletteChangeDelegateNotification;
- (HFColorPalette)colorPalette;
- (HUQuickControlColorInteractionCoordinator)initWithControlView:(id)a3 colorPalette:(id)a4 delegate:(id)a5;
- (void)_notifyDelegateOfColorPaletteChangeIfNecessary;
- (void)cancelButtonTappedToDismissColorViewController;
- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4;
- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4;
- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5;
- (void)controlView:(id)a3 showAuxiliaryView:(id)a4;
- (void)hideAuxiliaryViewForControlView:(id)a3;
- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4;
- (void)setColorPalette:(id)a3;
- (void)setHasPendingColorPaletteChangeDelegateNotification:(BOOL)a3;
@end

@implementation HUQuickControlColorInteractionCoordinator

- (HUQuickControlColorInteractionCoordinator)initWithControlView:(id)a3 colorPalette:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUQuickControlColorInteractionCoordinator;
  v9 = [(HUQuickControlSimpleInteractionCoordinator *)&v12 initWithControlView:a3 delegate:a5];
  v10 = v9;
  if (v9) {
    [(HUQuickControlColorInteractionCoordinator *)v9 setColorPalette:v8];
  }

  return v10;
}

- (void)_notifyDelegateOfColorPaletteChangeIfNecessary
{
  if ([(HUQuickControlColorInteractionCoordinator *)self hasPendingColorPaletteChangeDelegateNotification]&& ![(HUQuickControlSimpleInteractionCoordinator *)self isUserInteractionActive])
  {
    v3 = [(HUQuickControlInteractionCoordinator *)self delegate];
    v4 = [(HUQuickControlColorInteractionCoordinator *)self colorPalette];
    [v3 interactionCoordinator:self colorPaletteDidChange:v4];

    [(HUQuickControlColorInteractionCoordinator *)self setHasPendingColorPaletteChangeDelegateNotification:0];
  }
}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlColorInteractionCoordinator;
  [(HUQuickControlSimpleInteractionCoordinator *)&v7 controlView:a3 interactionStateDidChange:a4 forFirstTouch:a5];
  if (!a4) {
    [(HUQuickControlColorInteractionCoordinator *)self _notifyDelegateOfColorPaletteChangeIfNecessary];
  }
}

- (void)controlView:(id)a3 colorPaletteDidChange:(id)a4
{
  [(HUQuickControlColorInteractionCoordinator *)self setColorPalette:a4];
  [(HUQuickControlColorInteractionCoordinator *)self setHasPendingColorPaletteChangeDelegateNotification:1];

  [(HUQuickControlColorInteractionCoordinator *)self _notifyDelegateOfColorPaletteChangeIfNecessary];
}

- (void)controlView:(id)a3 showAuxiliaryView:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v6 interactionCoordinator:self showAuxiliaryView:v5];
}

- (void)hideAuxiliaryViewForControlView:(id)a3
{
  id v4 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v4 hideAuxiliaryViewForInteractionCoordinator:self];
}

- (void)presentFullColorViewForControlView:(id)a3 selectedColorIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v6 presentFullColorViewForInteractionCoordinator:self selectedColorIndexPath:v5];
}

- (void)controlView:(id)a3 didSelectColorAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v6 interactionCoordinator:self didSelectColorAtIndexPath:v5];
}

- (void)cancelButtonTappedToDismissColorViewController
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = self;
    __int16 v7 = 2080;
    id v8 = "-[HUQuickControlColorInteractionCoordinator cancelButtonTappedToDismissColorViewController]";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel button", (uint8_t *)&v5, 0x16u);
  }

  id v4 = [(HUQuickControlInteractionCoordinator *)self controlView];
  [v4 cancelColorPicking];
}

- (HFColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (void)setColorPalette:(id)a3
{
}

- (BOOL)hasPendingColorPaletteChangeDelegateNotification
{
  return self->_hasPendingColorPaletteChangeDelegateNotification;
}

- (void)setHasPendingColorPaletteChangeDelegateNotification:(BOOL)a3
{
  self->_hasPendingColorPaletteChangeDelegateNotification = a3;
}

- (void).cxx_destruct
{
}

@end