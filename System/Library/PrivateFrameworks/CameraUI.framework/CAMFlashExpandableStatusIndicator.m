@interface CAMFlashExpandableStatusIndicator
- (BOOL)_shouldHideForStatus:(unint64_t)a3;
- (BOOL)_shouldTintForStatus:(unint64_t)a3 flashActive:(BOOL)a4;
- (BOOL)_shouldUseSlashForStatus:(unint64_t)a3;
- (BOOL)isFlashActive;
- (BOOL)isFlashUnavailable;
- (CAMFlashExpandableStatusIndicator)initWithFrame:(CGRect)a3;
- (id)_axHUDSymbolNameForFlashStatus:(unint64_t)a3;
- (id)_localizedSubtitleForStatus:(unint64_t)a3;
- (id)_localizedTitleForStatus:(unint64_t)a3;
- (id)_menuItemForFlashStatus:(unint64_t)a3;
- (id)_symbolConfigurationForFlashStatus:(unint64_t)a3;
- (id)_systemImageForFlashStatus:(unint64_t)a3;
- (id)accessibilityIdentifier;
- (int64_t)_borderForStatus:(unint64_t)a3 flashActive:(BOOL)a4;
- (int64_t)flashMode;
- (void)_updateMenu;
- (void)setFlashActive:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setFlashUnavailable:(BOOL)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMFlashExpandableStatusIndicator

- (CAMFlashExpandableStatusIndicator)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMFlashExpandableStatusIndicator;
  v3 = -[CAMExpandingControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMFlashExpandableStatusIndicator *)v3 setAccessibilityIdentifier:@"FlashExpandableStatusIndicator"];
    [(CAMFlashExpandableStatusIndicator *)v4 _updateMenu];
    uint64_t v8 = 0;
    v5 = [MEMORY[0x263F08D40] valueWithBytes:&v8 objCType:"Q"];
    [(CAMExpandingControl *)v4 setSelectedState:v5 animated:0];
  }
  return v4;
}

- (void)_updateMenu
{
  v8[4] = *MEMORY[0x263EF8340];
  v3 = [(CAMFlashExpandableStatusIndicator *)self _menuItemForFlashStatus:2];
  v8[0] = v3;
  v4 = [(CAMFlashExpandableStatusIndicator *)self _menuItemForFlashStatus:1];
  v8[1] = v4;
  v5 = [(CAMFlashExpandableStatusIndicator *)self _menuItemForFlashStatus:0];
  v8[2] = v5;
  v6 = [(CAMFlashExpandableStatusIndicator *)self _menuItemForFlashStatus:3];
  v8[3] = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];
  [(CAMExpandingControl *)self setMenu:v7];
}

- (id)_menuItemForFlashStatus:(unint64_t)a3
{
  v5 = objc_alloc_init(CAMExpandingControlMenuItemConfiguration);
  BOOL v6 = [(CAMFlashExpandableStatusIndicator *)self isFlashActive];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setSlashesTitle:[(CAMFlashExpandableStatusIndicator *)self _shouldUseSlashForStatus:a3]];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setTintsTitle:[(CAMFlashExpandableStatusIndicator *)self _shouldTintForStatus:a3 flashActive:v6]];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setTitleBorder:[(CAMFlashExpandableStatusIndicator *)self _borderForStatus:a3 flashActive:v6]];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setHidden:[(CAMFlashExpandableStatusIndicator *)self _shouldHideForStatus:a3]];
  objc_super v7 = [(CAMFlashExpandableStatusIndicator *)self _axHUDSymbolNameForFlashStatus:a3];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setAxHUDSymbolName:v7];

  uint64_t v8 = [(CAMFlashExpandableStatusIndicator *)self _symbolConfigurationForFlashStatus:a3];
  [(CAMExpandingControlMenuItemConfiguration *)v5 setAxHUDSymbolConfiguration:v8];

  v9 = [(CAMFlashExpandableStatusIndicator *)self _systemImageForFlashStatus:a3];
  v10 = [(CAMFlashExpandableStatusIndicator *)self _symbolConfigurationForFlashStatus:a3];
  v11 = [(CAMFlashExpandableStatusIndicator *)self _localizedTitleForStatus:a3];
  v12 = [(CAMFlashExpandableStatusIndicator *)self _localizedSubtitleForStatus:a3];
  unint64_t v16 = a3;
  v13 = [MEMORY[0x263F08D40] valueWithBytes:&v16 objCType:"Q"];
  v14 = +[CAMExpandingControlSystemImageMenuItem menuItemWithState:v13 systemImageName:v9 symbolConfiguration:v10 subtitle:v11 selectedSubtitle:v12 configuration:v5];

  return v14;
}

- (int64_t)flashMode
{
  v2 = [(CAMExpandingControl *)self selectedState];
  int64_t v3 = 1;
  unint64_t v5 = 1;
  [v2 getValue:&v5 size:8];
  if (v5 <= 3) {
    int64_t v3 = qword_209C7AE20[v5];
  }

  return v3;
}

- (void)setFlashMode:(int64_t)a3
{
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(CAMFlashExpandableStatusIndicator *)self isFlashUnavailable])
  {
    uint64_t v7 = a3 != 0;
    if (a3 == 2) {
      uint64_t v7 = 2;
    }
    uint64_t v9 = v7;
    uint64_t v8 = [MEMORY[0x263F08D40] valueWithBytes:&v9 objCType:"Q"];
    [(CAMExpandingControl *)self setSelectedState:v8 animated:v4];
  }
}

- (void)setFlashActive:(BOOL)a3
{
  if (self->_flashActive != a3)
  {
    self->_flashActive = a3;
    [(CAMFlashExpandableStatusIndicator *)self _updateMenu];
  }
}

- (BOOL)isFlashUnavailable
{
  v2 = [(CAMExpandingControl *)self selectedState];
  uint64_t v5 = 1;
  [v2 getValue:&v5 size:8];
  BOOL v3 = v5 == 3;

  return v3;
}

- (void)setFlashUnavailable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMFlashExpandableStatusIndicator *)self isFlashUnavailable] != a3)
  {
    uint64_t v5 = 3;
    if (!v3) {
      uint64_t v5 = 0;
    }
    uint64_t v7 = v5;
    BOOL v6 = [MEMORY[0x263F08D40] valueWithBytes:&v7 objCType:"Q"];
    [(CAMExpandingControl *)self setSelectedState:v6 animated:0];
    if (v3) {
      [(CAMExpandingControl *)self setExpanded:0];
    }
  }
}

- (id)_localizedTitleForStatus:(unint64_t)a3
{
  if (a3 <= 3)
  {
    CAMLocalizedFrameworkString(off_263FA3A08[a3], 0);
    self = (CAMFlashExpandableStatusIndicator *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_localizedSubtitleForStatus:(unint64_t)a3
{
  if (a3 > 2)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = CAMLocalizedFrameworkString(off_263FA3A28[a3], 0);
  }
  return v4;
}

- (BOOL)_shouldUseSlashForStatus:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldHideForStatus:(unint64_t)a3
{
  return a3 == 3;
}

- (int64_t)_borderForStatus:(unint64_t)a3 flashActive:(BOOL)a4
{
  switch(a3)
  {
    case 3uLL:
      return 1;
    case 2uLL:
      if (a4) {
        return 2;
      }
      else {
        return 1;
      }
    case 0uLL:
      return 1;
    default:
      return 2;
  }
}

- (BOOL)_shouldTintForStatus:(unint64_t)a3 flashActive:(BOOL)a4
{
  switch(a3)
  {
    case 3uLL:
      return 0;
    case 2uLL:
      return a4;
    case 0uLL:
      return 0;
  }
  return 1;
}

- (id)_symbolConfigurationForFlashStatus:(unint64_t)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    uint64_t v3 = (void *)MEMORY[0x263F82818];
    BOOL v4 = [MEMORY[0x263F825C8] systemYellowColor];
    v9[0] = v4;
    uint64_t v5 = [MEMORY[0x263F825C8] colorWithWhite:0.5 alpha:1.0];
    v9[1] = v5;
    BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    uint64_t v7 = [v3 configurationWithPaletteColors:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)_systemImageForFlashStatus:(unint64_t)a3
{
  if (a3 == 3) {
    return @"bolt.trianglebadge.exclamationmark.fill";
  }
  else {
    return @"bolt.fill";
  }
}

- (id)_axHUDSymbolNameForFlashStatus:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"bolt.slash.fill";
  }
  else {
    return off_263FA3A40[a3 - 1];
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CAMFlashExpandableStatusIndicator;
  [(CAMExpandingControl *)&v4 setOrientation:a3 animated:a4];
}

- (id)accessibilityIdentifier
{
  return @"StatusBarFlashButton";
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

@end