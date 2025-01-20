@interface _MKDynamicTileOverlayRenderer
- ($4479F518DFD59EF68F6FA14DAF968345)_keyToTilePath:(SEL)a3;
- (BOOL)_mayExtendOutsideBounds;
- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4;
- (BOOL)forceContinuousLayout;
- (BOOL)isFallbackEnabled;
- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4 withData:(id)a5;
- (BOOL)overlayCanProvideCustomTileData:(id)a3;
- (BOOL)useMetalTexture;
- (BOOL)useNativeDisplayRate;
- (_MKDynamicTileOverlayRenderer)initWithOverlay:(id)a3;
- (id)customTileProviderForOverlay:(id)a3;
- (unint64_t)desiredDisplayRate;
- (unint64_t)estimatedCostForTile:(id)a3;
- (unint64_t)overlay:(id)a3 estimatedCostForCustomTileData:(id)a4;
- (unsigned)anisotropy;
- (void)overlay:(id)a3 didEnterKey:(id *)a4 withFallback:(BOOL)a5;
- (void)overlay:(id)a3 didExitKey:(id *)a4;
- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inIOSurface:(__IOSurface *)a6 withTimestamp:(double)a7;
- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inTexture:(id)a6 withTimestamp:(double)a7 withTileScale:(float)a8;
- (void)overlay:(id)a3 onVisibleTiles:(id)a4;
- (void)setAlpha:(double)a3;
- (void)setDesiredDisplayRate:(unint64_t)a3;
- (void)setForceContinuousLayout:(BOOL)a3;
- (void)setUseNativeDisplayRate:(BOOL)a3;
@end

@implementation _MKDynamicTileOverlayRenderer

- ($4479F518DFD59EF68F6FA14DAF968345)_keyToTilePath:(SEL)a3
{
  *(void *)&long long v5 = *(void *)&a4->var0;
  *((void *)&v5 + 1) = HIDWORD(*(void *)&a4->var0);
  *(_OWORD *)&retstr->var0 = v5;
  retstr->var2 = a4->var2;
  retstr->var3 = 0.0;
  result = ($4479F518DFD59EF68F6FA14DAF968345 *)[(MKOverlayRenderer *)self contentScaleFactor];
  retstr->var3 = v7;
  return result;
}

- (_MKDynamicTileOverlayRenderer)initWithOverlay:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKDynamicTileOverlayRenderer;
    long long v5 = [(MKOverlayRenderer *)&v12 initWithOverlay:v4];

    self = v5;
    v6 = self;
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = [NSString stringWithFormat:@"Expected a _MKDynamicTileOverlay but got %@", v4];

    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];

    v6 = 0;
  }

  return v6;
}

- (BOOL)_mayExtendOutsideBounds
{
  return 0;
}

- (void)setAlpha:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKDynamicTileOverlayRenderer;
  -[MKOverlayRenderer setAlpha:](&v8, sel_setAlpha_);
  customDataProvider = self->_customDataProvider;
  if (customDataProvider)
  {
    [(VKCustomTileOverlayProviderData *)customDataProvider alpha];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42___MKDynamicTileOverlayRenderer_setAlpha___block_invoke;
    v7[3] = &unk_1E54BB710;
    v7[4] = self;
    v7[5] = v6;
    *(double *)&v7[6] = a3;
    [(MKOverlayRenderer *)self _animateIfNecessaryForKey:@"alpha" withStepHandler:v7];
  }
}

- (void)setDesiredDisplayRate:(unint64_t)a3
{
  self->_desiredDisplayRate = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider) {
    -[VKCustomTileOverlayProviderData setDesiredDisplayRate:](customDataProvider, "setDesiredDisplayRate:");
  }
}

- (void)setUseNativeDisplayRate:(BOOL)a3
{
  self->_useNativeDisplayRate = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider) {
    -[VKCustomTileOverlayProviderData setForceNativeDisplayRate:](customDataProvider, "setForceNativeDisplayRate:");
  }
}

- (void)setForceContinuousLayout:(BOOL)a3
{
  self->_forceContinuousLayout = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider) {
    [(VKCustomTileOverlayProviderData *)customDataProvider setForceContinuousLayout:"setForceContinuousLayout:"];
  }
}

- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4
{
  return 1;
}

- (unint64_t)estimatedCostForTile:(id)a3
{
  return 0x100000;
}

- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inIOSurface:(__IOSurface *)a6 withTimestamp:(double)a7
{
  long long v13 = 0u;
  long long v14 = 0u;
  id v11 = a5;
  [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:a4];
  v12[0] = v13;
  v12[1] = v14;
  [(_MKDynamicTileOverlayRenderer *)self drawTileAtPath:v12 withTile:v11 inIOSurface:a6 withTimestamp:a7];
}

- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inTexture:(id)a6 withTimestamp:(double)a7 withTileScale:(float)a8
{
  long long v16 = 0u;
  long long v17 = 0u;
  id v13 = a6;
  id v14 = a5;
  [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:a4];
  v15[0] = v16;
  v15[1] = v17;
  [(_MKDynamicTileOverlayRenderer *)self drawTileAtPath:v15 withTile:v14 inTexture:v13 withTimestamp:a7 withTileScale:COERCE_DOUBLE(__PAIR64__(DWORD1(v17), LODWORD(a8)))];
}

- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4 withData:(id)a5
{
  long long v10 = 0u;
  long long v11 = 0u;
  id v7 = a5;
  [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:a4];
  v9[0] = v10;
  v9[1] = v11;
  LOBYTE(a4) = [(_MKDynamicTileOverlayRenderer *)self canDrawKey:v9 withTile:v7];

  return (char)a4;
}

- (void)overlay:(id)a3 didExitKey:(id *)a4
{
  long long v6 = 0u;
  long long v7 = 0u;
  [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:a4];
  v5[0] = v6;
  v5[1] = v7;
  [(_MKDynamicTileOverlayRenderer *)self didExitTile:v5];
}

- (void)overlay:(id)a3 didEnterKey:(id *)a4 withFallback:(BOOL)a5
{
  BOOL v5 = a5;
  long long v8 = 0u;
  long long v9 = 0u;
  [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:a4];
  v7[0] = v8;
  v7[1] = v9;
  [(_MKDynamicTileOverlayRenderer *)self didEnterTile:v7 withFallback:v5];
}

- (void)overlay:(id)a3 onVisibleTiles:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 bytes];
  unint64_t v7 = [v5 length];
  unint64_t v8 = v7 >> 4;
  long long v9 = malloc_type_malloc(32 * (v7 >> 4), 0x1000040E0EAB150uLL);
  long long v10 = v9;
  if (v7 >= 0x10)
  {
    if (v8 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v7 >> 4;
    }
    objc_super v12 = v9;
    do
    {
      [(_MKDynamicTileOverlayRenderer *)self _keyToTilePath:v6];
      *objc_super v12 = v13;
      v12[1] = v14;
      v12 += 2;
      v6 += 16;
      --v11;
    }
    while (v11);
  }
  [(_MKDynamicTileOverlayRenderer *)self onVisibleTiles:v10 count:v8];
  free(v10);
}

- (BOOL)overlayCanProvideCustomTileData:(id)a3
{
  return 1;
}

- (unint64_t)overlay:(id)a3 estimatedCostForCustomTileData:(id)a4
{
  return [(_MKDynamicTileOverlayRenderer *)self estimatedCostForTile:a4];
}

- (BOOL)isFallbackEnabled
{
  return 0;
}

- (BOOL)useMetalTexture
{
  return 0;
}

- (unsigned)anisotropy
{
  return 1;
}

- (id)customTileProviderForOverlay:(id)a3
{
  customDataProvider = self->_customDataProvider;
  if (!customDataProvider)
  {
    id v5 = [(MKOverlayRenderer *)self overlay];
    uint64_t v6 = [v5 minimumZ];

    unint64_t v7 = [(MKOverlayRenderer *)self overlay];
    uint64_t v8 = [v7 maximumZ];

    uint64_t v9 = 0xFFFFFFFFLL;
    if (v6 >= 0xFFFFFFFFLL) {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v10 = v6;
    }
    uint64_t v11 = v10 & ~(v10 >> 63);
    if (v8 < 0xFFFFFFFFLL) {
      uint64_t v9 = v8;
    }
    uint64_t v12 = v9 & ~(v9 >> 63);
    id v13 = objc_alloc(MEMORY[0x1E4FB3A00]);
    long long v14 = [(MKOverlayRenderer *)self overlay];
    v15 = (VKCustomTileOverlayProviderData *)objc_msgSend(v13, "initWithProviderID:tileSize:minimumZ:maximumZ:", objc_msgSend(v14, "_providerID"), 512, v11, v12);
    long long v16 = self->_customDataProvider;
    self->_customDataProvider = v15;

    [(MKOverlayRenderer *)self alpha];
    -[VKCustomTileOverlayProviderData setAlpha:](self->_customDataProvider, "setAlpha:");
    [(VKCustomTileOverlayProviderData *)self->_customDataProvider setDesiredDisplayRate:[(_MKDynamicTileOverlayRenderer *)self desiredDisplayRate]];
    customDataProvider = self->_customDataProvider;
  }

  return customDataProvider;
}

- (unint64_t)desiredDisplayRate
{
  return self->_desiredDisplayRate;
}

- (BOOL)useNativeDisplayRate
{
  return self->_useNativeDisplayRate;
}

- (BOOL)forceContinuousLayout
{
  return self->_forceContinuousLayout;
}

- (void).cxx_destruct
{
}

@end