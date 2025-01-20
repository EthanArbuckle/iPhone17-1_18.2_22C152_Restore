@interface CATiledLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)shouldDrawOnMainThread;
+ (CFTimeInterval)fadeDuration;
+ (id)defaultValueForKey:(id)a3;
+ (unsigned)prefetchedTiles;
- (BOOL)_canDisplayConcurrently;
- (BOOL)canDrawRect:(CGRect)a3 levelOfDetail:(int)a4;
- (BOOL)isDrawingEnabled;
- (BOOL)shouldArchiveValueForKey:(id)a3;
- (CGColor)fillColor;
- (CGSize)tileSize;
- (double)maximumTileScale;
- (size_t)levelsOfDetail;
- (size_t)levelsOfDetailBias;
- (void)_colorSpaceDidChange;
- (void)_dealloc;
- (void)_display;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)displayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5;
- (void)invalidateContents;
- (void)setContents:(id)a3;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)setLevelsOfDetail:(size_t)levelsOfDetail;
- (void)setLevelsOfDetailBias:(size_t)levelsOfDetailBias;
- (void)setMaximumTileScale:(double)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4;
- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5;
- (void)setTileSize:(CGSize)tileSize;
@end

@implementation CATiledLayer

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CATiledLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setTileSize:(CGSize)tileSize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize v3 = tileSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x22D, (const CGAffineTransform *)0x14, &v3.width);
}

- (CGSize)tileSize
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x22Du, (const CGAffineTransform *)0x14, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLevelsOfDetailBias:(size_t)levelsOfDetailBias
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = levelsOfDetailBias;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15A, (const CGAffineTransform *)0xE, v3);
}

- (size_t)levelsOfDetailBias
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Au, (const CGAffineTransform *)0xE, v3);
  return (size_t)v3[0];
}

- (void)setLevelsOfDetail:(size_t)levelsOfDetail
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = levelsOfDetail;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x159, (const CGAffineTransform *)0xE, v3);
}

- (size_t)levelsOfDetail
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x159u, (const CGAffineTransform *)0xE, v3);
  return (size_t)v3[0];
}

- (void)_colorSpaceDidChange
{
  +[CATransaction lock];
  id v3 = [(CALayer *)self contents];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v5 == CAImageProviderGetTypeID::type) {
      CAImageProviderInvalidateLOD(v4, 0, 0, *(unsigned int *)(v4 + 220), *(unsigned int *)(v4 + 224), 0xFFFFFFFFLL, 0);
    }
  }

  +[CATransaction unlock];
}

- (BOOL)_canDisplayConcurrently
{
  return 0;
}

- (void)_display
{
  int v3 = [(CATiledLayer *)self levelsOfDetail];
  int v4 = [(CATiledLayer *)self levelsOfDetailBias];
  [(CALayer *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [(CALayer *)self contentsScale];
  double v10 = v6 * v9;
  double v11 = v8 * v9;
  [(CATiledLayer *)self tileSize];
  uint64_t v14 = v10;
  uint64_t v15 = v11;
  if (v12 > 3072.0) {
    double v12 = 3072.0;
  }
  if (v12 >= 16.0) {
    double v16 = v12;
  }
  else {
    double v16 = 16.0;
  }
  if (v13 <= 3072.0) {
    double v17 = v13;
  }
  else {
    double v17 = 3072.0;
  }
  if (v17 >= 16.0) {
    double v18 = v17;
  }
  else {
    double v18 = 16.0;
  }
  if ([(CALayer *)self isOpaque]) {
    int v19 = 5;
  }
  else {
    int v19 = 4;
  }
  if ([(CALayer *)self canDrawConcurrently]) {
    int v20 = v19;
  }
  else {
    int v20 = v19 | 2;
  }
  if (v14 >= v15) {
    unsigned int v21 = v15;
  }
  else {
    unsigned int v21 = v14;
  }
  int v22 = 1;
  if (v21 >= 2)
  {
    do
    {
      ++v22;
      BOOL v23 = v21 > 3;
      v21 >>= 1;
    }
    while (v23);
  }
  int v24 = v16;
  int v25 = v18;
  if (v3 - v4 <= v22) {
    int v26 = v3;
  }
  else {
    int v26 = v22 + v4;
  }
  +[CATransaction lock];
  id v27 = [(CALayer *)self contents];
  if (!v27) {
    goto LABEL_37;
  }
  uint64_t v28 = (uint64_t)v27;
  int v29 = v20;
  CFTypeID v30 = CFGetTypeID(v27);
  if (CAImageProviderGetTypeID::once != -1) {
    dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
  }
  BOOL v31 = v30 == CAImageProviderGetTypeID::type;
  int v20 = v29;
  int v25 = v18;
  int v24 = v16;
  if (v31)
  {
    CFRetain((CFTypeRef)v28);
    +[CATransaction unlock];
    if (*(_DWORD *)(v28 + 236) == v26
      && *(_DWORD *)(v28 + 240) == v4
      && *(_DWORD *)(v28 + 228) == v24
      && *(_DWORD *)(v28 + 232) == v25
      && *(_DWORD *)(v28 + 216) == v20)
    {
      goto LABEL_40;
    }
    CFRelease((CFTypeRef)v28);
  }
  else
  {
LABEL_37:
    +[CATransaction unlock];
  }
  [(id)objc_opt_class() fadeDuration];
  uint64_t v33 = CAImageProviderCreate(v14, v15, v24, v25, v26, v4, v20, v32);
  if (v33)
  {
    uint64_t v28 = v33;
    *(_DWORD *)(v33 + 248) = [(id)objc_opt_class() prefetchedTiles];
LABEL_40:
    CAImageProviderSetImageSize(v28, v14, v15);
    CAImageProviderSetFillColor(v28, [(CATiledLayer *)self fillColor]);
    [(CATiledLayer *)self maximumTileScale];
    double v36 = trunc(v35) + 0.5;
    if (*(_DWORD *)(v28 + 264) != (int)v36)
    {
      *(_DWORD *)(v28 + 264) = (int)v36;
      if (*(_DWORD *)(v28 + 24))
      {
        CFArrayRef cfarray = create_cfarray(2, v34, (int)v36, 0);
        CA::Transaction::add_command((CA::Transaction *)0x12, *(_DWORD *)(v28 + 24), *(void *)(v28 + 56), cfarray, v38);
        CFRelease(cfarray);
      }
    }
    [(CATiledLayer *)self setContents:v28];
    CFRelease((CFTypeRef)v28);
    return;
  }

  [(CATiledLayer *)self setContents:0];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CATiledLayerDestroy(self);
  v3.receiver = self;
  v3.super_class = (Class)CATiledLayer;
  [(CALayer *)&v3 dealloc];
}

- (void)_dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CATiledLayerDestroy(self);
  v3.receiver = self;
  v3.super_class = (Class)CATiledLayer;
  [(CALayer *)&v3 _dealloc];
}

- (void)invalidateContents
{
}

- (void)setContents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(CALayer *)self contents];
  id v6 = v5;
  if (v5 && v5 != a3)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v7 == CAImageProviderGetTypeID::type)
    {
      CAImageProviderSetCallback((uint64_t)v6, 0, 0);
      CAImageProviderRemoveLayer((uint64_t)v6, (uint64_t)self);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CATiledLayer;
  [(CALayer *)&v17 setContents:a3];
  double v8 = [(CALayer *)self contents];
  if (v8)
  {
    double v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v10 == CAImageProviderGetTypeID::type)
    {
      if (v6 != a3)
      {
        os_unfair_lock_lock(v9 + 4);
        uint64_t v11 = *(void *)&v9[8]._os_unfair_lock_opaque;
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        double v13 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
        *double v13 = self;
        v13[1] = v11;
        *(void *)&v9[8]._os_unfair_lock_opaque = v13;
        os_unfair_lock_unlock(v9 + 4);
      }
      if ([(CATiledLayer *)self isDrawingEnabled])
      {
        uint64_t v14 = tiled_layer_render;
        uint64_t v15 = (uint64_t)v9;
        double v16 = self;
      }
      else
      {
        uint64_t v15 = (uint64_t)v9;
        uint64_t v14 = 0;
        double v16 = 0;
      }
      CAImageProviderSetCallback(v15, (uint64_t)v14, (uint64_t)v16);
    }
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CGRect v14 = a3;
  id v8 = [(CALayer *)self contents];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v10 == CAImageProviderGetTypeID::type)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      if (convertRectToImageCoordinates(self, *(_DWORD *)(v9 + 220), *(_DWORD *)(v9 + 224), (uint64_t)&v14, (uint64_t)&v12))
      {
        CAImageProviderInvalidateLOD(v9, v12, HIDWORD(v12), v13, HIDWORD(v13), 0xFFFFFFFFLL, 0);
        [(CALayer *)self setContentsChanged];
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CATiledLayer;
  -[CALayer setNeedsDisplayInRect:](&v11, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"contents"]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CATiledLayer;
  return [(CALayer *)&v6 shouldArchiveValueForKey:a3];
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  int v6 = v5;
  if (v5 > 384)
  {
    if (v5 != 557 && v5 != 545)
    {
      if (v5 != 385) {
        goto LABEL_5;
      }
LABEL_12:
      double v8 = *MEMORY[0x1E4F1DB20];
      double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      v13.receiver = self;
      v13.super_class = (Class)CATiledLayer;
      -[CALayer setNeedsDisplayInRect:](&v13, sel_setNeedsDisplayInRect_, v8, v9, v10, v11);
      [(CALayer *)self setContentsChanged];
      goto LABEL_14;
    }
LABEL_13:
    [(CALayer *)self setNeedsDisplay];
    goto LABEL_14;
  }
  if ((v5 - 345) < 2) {
    goto LABEL_13;
  }
  if (v5 == 189 || v5 == 222) {
    goto LABEL_12;
  }
LABEL_5:
  int v7 = -[CATiledLayer didChangeValueForKey:]::contentsAreFlipped;
  if (!-[CATiledLayer didChangeValueForKey:]::contentsAreFlipped)
  {
    int v7 = CAInternAtom(@"contentsAreFlipped", 1);
    -[CATiledLayer didChangeValueForKey:]::contentsAreFlipped = v7;
  }
  if (v6 == v7) {
    goto LABEL_13;
  }
LABEL_14:
  v12.receiver = self;
  v12.super_class = (Class)CATiledLayer;
  [(CATiledLayer *)&v12 didChangeValueForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 <= 344)
  {
    if (v5 == 81)
    {
      int v8 = [a1 shouldDrawOnMainThread];
      int v7 = (id *)MEMORY[0x1E4F1CFC8];
      if (!v8) {
        int v7 = (id *)MEMORY[0x1E4F1CFD0];
      }
    }
    else
    {
      if (v5 != 189) {
        goto LABEL_17;
      }
      int v7 = (id *)MEMORY[0x1E4F1CFD0];
    }
    return *v7;
  }
  switch(v5)
  {
    case 557:
      id result = (id)+[CATiledLayer defaultValueForKey:]::ts;
      if (!+[CATiledLayer defaultValueForKey:]::ts)
      {
        id result = (id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 256.0, 256.0);
        +[CATiledLayer defaultValueForKey:]::ts = (uint64_t)result;
      }
      break;
    case 346:
      id result = (id)+[CATiledLayer defaultValueForKey:]::zero;
      if (!+[CATiledLayer defaultValueForKey:]::zero)
      {
        id result = (id)[objc_alloc(NSNumber) initWithInt:0];
        +[CATiledLayer defaultValueForKey:]::zero = (uint64_t)result;
      }
      break;
    case 345:
      id result = (id)+[CATiledLayer defaultValueForKey:]::one;
      if (!+[CATiledLayer defaultValueForKey:]::one)
      {
        id result = (id)[objc_alloc(NSNumber) initWithInt:1];
        +[CATiledLayer defaultValueForKey:]::one = (uint64_t)result;
      }
      return result;
    default:
LABEL_17:
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___CATiledLayer;
      return objc_msgSendSuper2(&v9, sel_defaultValueForKey_, a3);
  }
  return result;
}

+ (CFTimeInterval)fadeDuration
{
  return 0.25;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xBD, (const CGAffineTransform *)7, (double *)&v3);
}

- (BOOL)isDrawingEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xBDu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setMaximumTileScale:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x181, (const CGAffineTransform *)0x12, v3);
}

- (double)maximumTileScale
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x181u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setFillColor:(CGColor *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xDE, (const CGAffineTransform *)2, v3);
}

- (CGColor)fillColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDEu, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)displayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CGRect v14 = a3;
  +[CATransaction begin];
  [(CATiledLayer *)self _display];
  +[CATransaction lock];
  int v8 = (unsigned int *)[(CALayer *)self contents];
  +[CATransaction unlock];
  if (v8)
  {
    CFTypeID v9 = CFGetTypeID(v8);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v9 == CAImageProviderGetTypeID::type)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      if (convertRectToImageCoordinates(self, v8[55], v8[56], (uint64_t)&v14, (uint64_t)&v12))
      {
        if (a5)
        {
          int v10 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"uncollectable"), "BOOLValue");
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"disableFade"), "BOOLValue")
             ? v10 | 4
             : v10)
          {
            +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), @"CATiledLayerFlags");
          }
        }
        CAImageProviderDraw((uint64_t)v8, v12, SHIDWORD(v12), v13, SHIDWORD(v13), a4);
      }
    }
  }

  +[CATransaction commit];
}

- (BOOL)canDrawRect:(CGRect)a3 levelOfDetail:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  +[CATransaction lock];
  id v10 = [(CALayer *)self delegate];
  +[CATransaction unlock];
  if (objc_opt_respondsToSelector()) {
    char v11 = objc_msgSend(v10, "tiledLayer:canDrawRect:levelOfDetail:", self, v4, x, y, width, height);
  }
  else {
    char v11 = 1;
  }

  return v11;
}

- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4
{
}

- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CGRect v20 = a3;
  id v12 = [(CALayer *)self contents];
  if (v12)
  {
    uint64_t v13 = (uint64_t)v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (CAImageProviderGetTypeID::once != -1) {
      dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
    }
    if (v14 == CAImageProviderGetTypeID::type)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      if (convertRectToImageCoordinates(self, *(_DWORD *)(v13 + 220), *(_DWORD *)(v13 + 224), (uint64_t)&v20, (uint64_t)&v18))
      {
        unsigned int v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"onlyIfNull"), "BOOLValue");
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"removeImmediately"), "BOOLValue")) {
          uint64_t v16 = v15 | 2;
        }
        else {
          uint64_t v16 = v15;
        }
        CAImageProviderInvalidateLOD(v13, v18, HIDWORD(v18), v19, HIDWORD(v19), v6, v16);
        [(CALayer *)self setContentsChanged];
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CATiledLayer;
  -[CALayer setNeedsDisplayInRect:](&v17, sel_setNeedsDisplayInRect_, x, y, width, height);
}

+ (unsigned)prefetchedTiles
{
  return 0;
}

+ (BOOL)shouldDrawOnMainThread
{
  return 0;
}

@end