@interface ETColorStore
+ (id)defaultStore;
- (ETColorStore)init;
- (id)_colors;
- (unint64_t)selectedColorIndex;
- (void)addDefaultsObserver;
- (void)dealloc;
- (void)defaultsChanged:(id)a3;
- (void)saveColor:(id)a3 forIndex:(unint64_t)a4;
- (void)setSelectedColorIndex:(unint64_t)a3;
@end

@implementation ETColorStore

+ (id)defaultStore
{
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)defaultStore_sharedStore;

  return v2;
}

uint64_t __28__ETColorStore_defaultStore__block_invoke()
{
  defaultStore_sharedStore = objc_alloc_init(ETColorStore);

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ETColorPrefsChangedExternallyNotification", 0);
  v5.receiver = self;
  v5.super_class = (Class)ETColorStore;
  [(ETColorStore *)&v5 dealloc];
}

- (ETColorStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)ETColorStore;
  v2 = [(ETColorStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ETColorStore *)v2 addDefaultsObserver];
  }
  return v3;
}

- (void)addDefaultsObserver
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_defaultsChanged_ name:*MEMORY[0x263F08660] object:0];
}

- (void)defaultsChanged:(id)a3
{
  colors = self->_colors;
  self->_colors = 0;

  self->_selectedIndexLoaded = 0;
}

- (id)_colors
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  colors = self->_colors;
  if (!colors)
  {
    v4 = PaletteColorsDataArray();
    objc_super v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = bswap32(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "unsignedIntValue", (void)v15));
          v12 = [MEMORY[0x263F1C550] colorWithRed:(double)v11 / 255.0 green:(double)BYTE1(v11) / 255.0 blue:(double)BYTE2(v11) / 255.0 alpha:(double)HIBYTE(v11) / 255.0];
          [(NSMutableArray *)v5 addObject:v12];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    v13 = self->_colors;
    self->_colors = v5;

    colors = self->_colors;
  }

  return colors;
}

- (void)saveColor:(id)a3 forIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(ETColorStore *)self _colors];
  [v7 setObject:v6 atIndexedSubscript:a4];
  uint64_t v8 = PaletteColorsDataArray();
  uint64_t v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = NSNumber;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  [v6 getRed:&v17 green:&v16 blue:&v15 alpha:&v14];

  unsigned int v11 = [v10 numberWithUnsignedInt:bswap32(((int)(v15 * 255.0) << 16) | ((int)(v14 * 255.0) << 24) | ((int)(v16 * 255.0) << 8) | (int)(v17 * 255.0))];
  [v9 setObject:v11 atIndexedSubscript:a4];

  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 removeObserver:self name:*MEMORY[0x263F08660] object:0];

  v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 setObject:v9 forKey:@"ETColorPickerColorData"];
  [v13 synchronize];
  [(ETColorStore *)self addDefaultsObserver];
}

- (unint64_t)selectedColorIndex
{
  if (!self->_selectedIndexLoaded)
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 synchronize];
    v4 = [v3 objectForKey:@"ETColorPickerSelectedIndex"];
    self->_selectedColorIndex = [v4 unsignedIntegerValue];

    if (self->_selectedColorIndex >= 8) {
      self->_selectedColorIndex = 0;
    }
    self->_selectedIndexLoaded = 1;
  }
  return self->_selectedColorIndex;
}

- (void)setSelectedColorIndex:(unint64_t)a3
{
  if (self->_selectedColorIndex != a3)
  {
    self->_selectedColorIndex = a3;
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F08660] object:0];

    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_super v5 = [NSNumber numberWithUnsignedInteger:self->_selectedColorIndex];
    [v6 setObject:v5 forKey:@"ETColorPickerSelectedIndex"];

    [v6 synchronize];
    [(ETColorStore *)self addDefaultsObserver];
  }
}

- (void).cxx_destruct
{
}

@end