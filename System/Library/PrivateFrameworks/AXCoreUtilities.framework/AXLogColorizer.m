@interface AXLogColorizer
+ (AXLogColorTheme)defaultDarkColorsTheme;
+ (AXLogColorTheme)defaultLightColorsTheme;
+ (char)ansiColorSeqForAXLogColor:(int64_t)a3;
+ (id)coloredString:(id)a3 withColor:(int64_t)a4;
+ (id)colorizeStringIfEnabled:(id)a3 withColor:(int64_t)a4;
+ (id)defaultColorizer;
- (AXLogColorTheme)colorTheme;
- (AXLogColorizer)init;
- (BOOL)isActive;
- (BOOL)isManagedBySettings;
- (BOOL)preferDarkColors;
- (id)_initAndManageWithSettings:(BOOL)a3;
- (id)blueString:(id)a3;
- (id)cyanString:(id)a3;
- (id)debugString:(id)a3;
- (id)description;
- (id)errorString:(id)a3;
- (id)greenString:(id)a3;
- (id)greyString:(id)a3;
- (id)infoString:(id)a3;
- (id)magentaString:(id)a3;
- (id)redString:(id)a3;
- (id)warningString:(id)a3;
- (id)whiteOrBlackString:(id)a3;
- (id)yellowString:(id)a3;
- (void)_updateSettingsFromUserPrefs;
- (void)setActive:(BOOL)a3;
- (void)setColorTheme:(AXLogColorTheme *)a3;
- (void)setManagedBySettings:(BOOL)a3;
- (void)setPreferDarkColors:(BOOL)a3;
@end

@implementation AXLogColorizer

+ (id)defaultColorizer
{
  if (defaultColorizer_onceToken != -1) {
    dispatch_once(&defaultColorizer_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultColorizer__shared;
  return v2;
}

uint64_t __34__AXLogColorizer_defaultColorizer__block_invoke()
{
  defaultColorizer__shared = [[AXLogColorizer alloc] _initAndManageWithSettings:1];
  return MEMORY[0x1F41817F8]();
}

+ (AXLogColorTheme)defaultLightColorsTheme
{
  *retstr = *(AXLogColorTheme *)ymmword_18FD06CA0;
  return result;
}

+ (AXLogColorTheme)defaultDarkColorsTheme
{
  *retstr = *(AXLogColorTheme *)ymmword_18FD06CC0;
  return result;
}

+ (char)ansiColorSeqForAXLogColor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD) {
    return "\x1B[30m";
  }
  else {
    return off_1E5672610[a3 - 1];
  }
}

+ (id)coloredString:(id)a3 withColor:(int64_t)a4
{
  id v5 = a3;
  v6 = +[AXLogColorizer ansiColorSeqForAXLogColor:a4];
  v7 = [NSString stringWithFormat:@"%s%@%s", v6, v5, "\x1B[0m"];

  return v7;
}

+ (id)colorizeStringIfEnabled:(id)a3 withColor:(int64_t)a4
{
  id v5 = a3;
  v6 = +[AXLogColorizer defaultColorizer];
  int v7 = [v6 isActive];

  if (v7)
  {
    uint64_t v8 = +[AXLogColorizer coloredString:v5 withColor:a4];

    id v5 = (id)v8;
  }
  return v5;
}

- (id)_initAndManageWithSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXLogColorizer;
  v4 = [(AXLogColorizer *)&v13 init];
  id v5 = v4;
  if (v4)
  {
    [(AXLogColorizer *)v4 setManagedBySettings:v3];
    if (v3)
    {
      v6 = [getAXSettingsClass() sharedInstance];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __45__AXLogColorizer__initAndManageWithSettings___block_invoke;
      v11[3] = &unk_1E5672590;
      int v7 = v5;
      v12 = v7;
      [v6 registerUpdateBlock:v11 forRetrieveSelector:sel_internalLoggingColorTheme withListener:v7];

      [(AXLogColorizer *)v7 _updateSettingsFromUserPrefs];
    }
    else
    {
      [(AXLogColorizer *)v5 setActive:1];
      +[AXLogColorizer defaultLightColorsTheme];
      *(_OWORD *)v10 = *(_OWORD *)&v10[5];
      *(_OWORD *)&v10[2] = *(_OWORD *)&v10[7];
      [(AXLogColorizer *)v5 setColorTheme:v10];
      [(AXLogColorizer *)v5 setPreferDarkColors:0];
    }
    uint64_t v8 = v5;
  }

  return v5;
}

uint64_t __45__AXLogColorizer__initAndManageWithSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSettingsFromUserPrefs];
}

- (AXLogColorizer)init
{
  return (AXLogColorizer *)[(AXLogColorizer *)self _initAndManageWithSettings:0];
}

- (void)_updateSettingsFromUserPrefs
{
  BOOL v3 = [getAXSettingsClass() sharedInstance];
  uint64_t v4 = [v3 internalLoggingColorTheme];

  if (v4 == 1)
  {
    [(AXLogColorizer *)self setActive:1];
    +[AXLogColorizer defaultLightColorsTheme];
    uint64_t v5 = 0;
    v11[0] = v11[2];
    v11[1] = v11[3];
    v6 = v11;
  }
  else if (v4 == 2)
  {
    uint64_t v5 = 1;
    [(AXLogColorizer *)self setActive:1];
    +[AXLogColorizer defaultDarkColorsTheme];
    v12[0] = v12[2];
    v12[1] = v12[3];
    v6 = v12;
  }
  else
  {
    [(AXLogColorizer *)self setActive:0];
    +[AXLogColorizer defaultLightColorsTheme];
    uint64_t v5 = 0;
    long long v7 = v9;
    long long v8 = v10;
    v6 = &v7;
  }
  -[AXLogColorizer setColorTheme:](self, "setColorTheme:", v6, v7, v8);
  [(AXLogColorizer *)self setPreferDarkColors:v5];
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[AXLogColorizer isActive](self, "isActive"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[AXLogColorizer isManagedBySettings](self, "isManagedBySettings"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AXLogColorizer preferDarkColors](self, "preferDarkColors"));
  long long v7 = [v3 stringWithFormat:@"AXLogColorizer:<%p>. active:%@ managed:%@ preferDarkColors:%@", self, v4, v5, v6];

  return v7;
}

- (id)errorString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    [(AXLogColorizer *)self colorTheme];
    id v5 = +[AXLogColorizer coloredString:v4 withColor:v8];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)warningString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    [(AXLogColorizer *)self colorTheme];
    id v5 = +[AXLogColorizer coloredString:v4 withColor:v8];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)infoString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    [(AXLogColorizer *)self colorTheme];
    id v5 = +[AXLogColorizer coloredString:v4 withColor:v8];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)debugString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    [(AXLogColorizer *)self colorTheme];
    id v5 = +[AXLogColorizer coloredString:v4 withColor:v8];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)whiteOrBlackString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 14;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)greyString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    id v5 = +[AXLogColorizer coloredString:v4 withColor:1];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)redString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 3;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)greenString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)yellowString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 6;
    }
    else {
      uint64_t v5 = 7;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)blueString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 8;
    }
    else {
      uint64_t v5 = 9;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)magentaString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = 11;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (id)cyanString:(id)a3
{
  id v4 = a3;
  if ([(AXLogColorizer *)self isActive])
  {
    if ([(AXLogColorizer *)self preferDarkColors]) {
      uint64_t v5 = 12;
    }
    else {
      uint64_t v5 = 13;
    }
    id v6 = +[AXLogColorizer coloredString:v4 withColor:v5];
  }
  else
  {
    id v6 = v4;
  }
  long long v7 = v6;

  return v7;
}

- (AXLogColorTheme)colorTheme
{
  long long v3 = *(_OWORD *)&self[1].errorColor;
  *(_OWORD *)&retstr->errorColor = *(_OWORD *)&self->infoColor;
  *(_OWORD *)&retstr->infoColor = v3;
  return self;
}

- (void)setColorTheme:(AXLogColorTheme *)a3
{
  long long v3 = *(_OWORD *)&a3->infoColor;
  *(_OWORD *)&self->_colorTheme.errorColor = *(_OWORD *)&a3->errorColor;
  *(_OWORD *)&self->_colorTheme.infoColor = v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isManagedBySettings
{
  return self->_managedBySettings;
}

- (void)setManagedBySettings:(BOOL)a3
{
  self->_managedBySettings = a3;
}

- (BOOL)preferDarkColors
{
  return self->_preferDarkColors;
}

- (void)setPreferDarkColors:(BOOL)a3
{
  self->_preferDarkColors = a3;
}

@end