@interface AXCCMotionCuesModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (CCUIToggleModule)module;
- (id)localizedStringForKey:(id)a3;
- (id)trailingImageForMenuItem:(id)a3;
- (void)_loadIcons;
- (void)_settingsDidChange;
- (void)_updateGlyphImage;
- (void)_updateMenuItems;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dealloc;
- (void)setModule:(id)a3;
- (void)viewDidLoad;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation AXCCMotionCuesModuleViewController

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXCCMotionCuesModuleViewController;
  [(AXCCMotionCuesModuleViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)AXCCMotionCuesModuleViewController;
  [(CCUIMenuModuleViewController *)&v11 viewDidLoad];
  if (AXDeviceIsPad())
  {
    v3 = (void *)MEMORY[0x263F1C6B0];
    objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v3 imageNamed:@"MotionCuesIcon" inBundle:v4];
    v6 = [MEMORY[0x263F1C6C8] configurationWithPointSize:30.0];
    v7 = [v5 imageByApplyingSymbolConfiguration:v6];
    [(CCUIMenuModuleViewController *)self setGlyphImage:v7];
  }
  else
  {
    [(AXCCMotionCuesModuleViewController *)self _loadIcons];
    [(AXCCMotionCuesModuleViewController *)self _updateGlyphImage];
    [(CCUIMenuModuleViewController *)self setIndentation:2];
  }
  v8 = [(AXCCMotionCuesModuleViewController *)self localizedStringForKey:@"MotionCuesTitle"];
  [(CCUIMenuModuleViewController *)self setTitle:v8];

  v9 = [MEMORY[0x263F1C550] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v9];

  [(CCUIButtonModuleViewController *)self setSelected:_AXSMotionCuesActive() != 0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_24277C3A0, (CFStringRef)*MEMORY[0x263F8B318], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_24277C3A0, (CFStringRef)*MEMORY[0x263F8B0D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_24277C3A0, (CFStringRef)*MEMORY[0x263F8B0D8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (AXDeviceIsPad())
  {
    int v5 = _AXSMotionCuesActive();
    v6 = AXLogMotionCues();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_24277B000, v6, OS_LOG_TYPE_DEFAULT, "CC button tapped: current active=%{BOOL}d, changing to opposite.", (uint8_t *)v7, 8u);
    }

    [(CCUIButtonModuleViewController *)self setSelected:v5 == 0];
    _AXSSetMotionCuesMode();
  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return AXDeviceIsPad() ^ 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return AXDeviceIsPad() ^ 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)AXCCMotionCuesModuleViewController;
    [(CCUIMenuModuleViewController *)&v6 willTransitionToExpandedContentMode:v3];
    if (v3)
    {
      [(AXCCMotionCuesModuleViewController *)self _updateMenuItems];
      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = _AXSMotionCuesActive() != 0;
    }
    [(CCUIButtonModuleViewController *)self setSelected:v5];
  }
}

- (void)_loadIcons
{
  BOOL v3 = (void *)MEMORY[0x263F1C6B0];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v5 = [v3 imageNamed:@"MotionCuesIcon" inBundle:v4];
  motionCuesIcon = self->_motionCuesIcon;
  self->_motionCuesIcon = v5;

  v7 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:@"MotionCuesAndCarIcon" inBundle:v8];
  motionCuesAndCarIcon = self->_motionCuesAndCarIcon;
  self->_motionCuesAndCarIcon = v9;

  objc_super v11 = (void *)MEMORY[0x263F1C6B0];
  id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 imageNamed:@"MotionCuesSlashIcon" inBundle:v14];
  motionCuesSlashIcon = self->_motionCuesSlashIcon;
  self->_motionCuesSlashIcon = v12;
}

- (void)_updateGlyphImage
{
  int v3 = _AXSMotionCuesMode();
  if (v3)
  {
    if (v3 == 2)
    {
      uint64_t v4 = 1280;
    }
    else
    {
      if (v3 != 1) {
        return;
      }
      uint64_t v4 = 1264;
    }
  }
  else
  {
    uint64_t v4 = 1272;
  }
  BOOL v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  id v7 = [MEMORY[0x263F1C6C8] configurationWithPointSize:30.0];
  objc_super v6 = objc_msgSend(v5, "imageByApplyingSymbolConfiguration:");
  [(CCUIMenuModuleViewController *)self setGlyphImage:v6];
}

- (id)trailingImageForMenuItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:@"AlwaysOn"];

  if (v6)
  {
    id v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesIcon;
  }
  else
  {
    uint64_t v8 = [v4 identifier];
    int v9 = [v8 isEqualToString:@"OnInTheCar"];

    id v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesSlashIcon;
    if (v9) {
      id v7 = &OBJC_IVAR___AXCCMotionCuesModuleViewController__motionCuesAndCarIcon;
    }
  }
  id v10 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);

  return v10;
}

- (id)localizedStringForKey:(id)a3
{
  int v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  BOOL v5 = [v3 bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:v4 value:&stru_26F84AC08 table:@"MotionCues"];

  return v6;
}

- (void)_settingsDidChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = _AXSMotionCuesActive();
  id v4 = AXLogMotionCues();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109632;
    v5[1] = v3;
    __int16 v6 = 1024;
    int v7 = _AXSMotionCuesEnabled();
    __int16 v8 = 1024;
    int v9 = _AXSMotionCuesMode();
    _os_log_impl(&dword_24277B000, v4, OS_LOG_TYPE_DEFAULT, "CC setting did change: active=%{BOOL}d, enabled=%{BOOL}d, mode=%d", (uint8_t *)v5, 0x14u);
  }

  if (AXDeviceIsPad())
  {
    [(CCUIButtonModuleViewController *)self setSelected:v3 != 0];
  }
  else
  {
    [(CCUIButtonModuleViewController *)self setSelected:(v3 != 0) & ~[(CCUIButtonModuleViewController *)self isExpanded]];
    [(AXCCMotionCuesModuleViewController *)self _updateGlyphImage];
    if ([(CCUIButtonModuleViewController *)self isExpanded]) {
      [(AXCCMotionCuesModuleViewController *)self _updateMenuItems];
    }
  }
}

- (void)_updateMenuItems
{
  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (_AXSMotionCuesEnabled()) {
      int v3 = _AXSMotionCuesMode();
    }
    else {
      int v3 = 2;
    }
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = 0; i != 48; i += 16)
    {
      int v6 = *(_DWORD *)((char *)&off_26516C130 + i + 8);
      objc_initWeak(&location, self);
      uint64_t v7 = *(uint64_t *)((char *)&off_26516C130 + i);
      __int16 v8 = [(AXCCMotionCuesModuleViewController *)self localizedStringForKey:v7];
      id v9 = objc_alloc(MEMORY[0x263F33CC0]);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_24277CB64;
      v11[3] = &unk_26516C168;
      int v13 = v6;
      objc_copyWeak(&v12, &location);
      uint64_t v10 = (void *)[v9 initWithTitle:v8 identifier:v7 handler:v11];
      [v10 setSelected:v6 == v3];
      [v4 addObject:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    [(CCUIMenuModuleViewController *)self setMenuItems:v4];
  }
}

- (CCUIToggleModule)module
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_module);

  return (CCUIToggleModule *)WeakRetained;
}

- (void)setModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_module);
  objc_storeStrong((id *)&self->_motionCuesSlashIcon, 0);
  objc_storeStrong((id *)&self->_motionCuesAndCarIcon, 0);

  objc_storeStrong((id *)&self->_motionCuesIcon, 0);
}

@end