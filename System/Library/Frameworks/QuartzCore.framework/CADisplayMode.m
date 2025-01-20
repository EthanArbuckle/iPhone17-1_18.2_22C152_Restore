@interface CADisplayMode
+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5;
+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5 isVRR:(BOOL)a6;
+ (id)_displayModeWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7;
- (BOOL)colorModeIsYCbCr;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighBandwidth;
- (BOOL)isVRR;
- (BOOL)isVirtual;
- (Mode)_mode;
- (NSString)colorGamut;
- (NSString)colorMode;
- (NSString)hdrMode;
- (double)pixelAspectRatio;
- (double)refreshRate;
- (id)_display;
- (id)_initWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7;
- (id)description;
- (unint64_t)bitDepth;
- (unint64_t)hash;
- (unint64_t)height;
- (unint64_t)internalRepresentation;
- (unint64_t)maximumSourceBandwidth;
- (unint64_t)preferredScale;
- (unint64_t)width;
- (unsigned)maximumSourceHeight;
- (unsigned)maximumSourceWidth;
- (void)_setPreferredUIScale:(unsigned int)a3;
- (void)_setWidth:(unint64_t)a3 height:(unint64_t)a4;
- (void)dealloc;
@end

@implementation CADisplayMode

- (void)_setPreferredUIScale:(unsigned int)a3
{
  LODWORD(self->_priv->var3) = a3;
}

+ (id)_displayModeWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7
{
  v7 = objc_msgSend(objc_alloc((Class)a1), "_initWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", a3.var0.var1, *(&a3.var0.var1 + 1), a4, a5, a6.var0, *(void *)&a6.var2);

  return v7;
}

- (id)_initWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7
{
  unsigned int v7 = *(_DWORD *)&a6.var2;
  unsigned int var0 = a6.var0;
  v10 = (void *)*(&a3.var0.var1 + 1);
  unint64_t var1 = a3.var0.var1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13 = (CADisplayModePriv *)malloc_type_malloc(0x40uLL, 0x1080040D897DFA0uLL);
  self->_priv = v13;
  v13->var0.var0.unint64_t var1 = var1;
  id v14 = v10;
  priv = self->_priv;
  *(&priv->var0.var0.var1 + 1) = (unint64_t)v14;
  priv->unint64_t var1 = (id)(var1 & 0x3FFF);
  priv->var2 = (var1 >> 14) & 0x3FFF;
  LODWORD(priv->var3) = 0;
  priv->var5 = a5;
  priv->var6.unsigned int var0 = var0;
  self->_priv->var6.unint64_t var1 = v7;
  v17.receiver = self;
  v17.super_class = (Class)CADisplayMode;
  return [(CADisplayMode *)&v17 init];
}

- (void)_setWidth:(unint64_t)a3 height:(unint64_t)a4
{
  priv = self->_priv;
  priv->unint64_t var1 = (id)a3;
  priv->var2 = a4;
}

- (unint64_t)width
{
  return (unint64_t)self->_priv->var1;
}

- (unint64_t)height
{
  return self->_priv->var2;
}

- (NSString)hdrMode
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  if (var1) {
    BOOL v3 = (*(void *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3 && (unsigned int v4 = ((var1 >> 55) & 0x1F) - 16, v4 <= 0xC)) {
    return (NSString *)*((void *)&off_1E5272880 + v4);
  }
  else {
    return (NSString *)@"SDR";
  }
}

- (NSString)colorGamut
{
  if ([*((id *)&self->_priv->var0.var0.var1 + 1) supportsExtendedColors]) {
    return (NSString *)@"gamut_P3";
  }
  else {
    return (NSString *)@"gamut_SRGB";
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    v5 = (uint64_t *)*((void *)a3 + 1);
    priv = (uint64_t *)self->_priv;
    int v7 = CA::WindowServer::Display::Mode::operator==(*v5, *priv);
    if (!v7) {
      return v7;
    }
    if (v5[1] != priv[1] || v5[2] != priv[2])
    {
LABEL_7:
      LOBYTE(v7) = 0;
      return v7;
    }
    LOBYTE(v7) = v5[3] == priv[3];
  }
  return v7;
}

- (double)refreshRate
{
  priv = self->_priv;
  if (priv->var0.var0.var1 == -1)
  {
    [*((id *)&priv->var0.var0.var1 + 1) hardwareRefreshRate];
    double v3 = 1.0 / v4;
  }
  else
  {
    double v3 = (double)((priv->var0.var0.var1 >> 29) & 0x1FFFFFF) * 0.0000152587891;
  }
  return round(v3);
}

- (unint64_t)preferredScale
{
  priv = self->_priv;
  unint64_t result = LODWORD(priv->var3);
  if (!result)
  {
    if ((priv->var0.var0.var1 & 0x10000000) != 0)
    {
      MGGetFloat32Answer();
      return (unint64_t)v4;
    }
    else if (priv->var2 <= 0x438)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayMode;
  [(CADisplayMode *)&v3 dealloc];
}

- (id)description
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  if ((var1 & 0x10000000) != 0) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CADisplayMode %d x %d internal_panel (fixed)>", -[CADisplayMode width](self, "width"), -[CADisplayMode height](self, "height"), v11, v12);
  }
  if ((~var1 & 0x3000000000000000) != 0) {
    uint64_t v4 = off_1E52728E8[(var1 >> 60) & 3];
  }
  else {
    uint64_t v4 = 0;
  }
  v6 = NSString;
  unint64_t v7 = [(CADisplayMode *)self width];
  unint64_t v8 = [(CADisplayMode *)self height];
  unsigned int v9 = ((*(void *)&self->_priv->var0.var0.var0 >> 55) & 0x1F) - 1;
  if (v9 > 0x1B) {
    v10 = "";
  }
  else {
    v10 = off_1E52739E0[v9];
  }
  return (id)objc_msgSend(v6, "stringWithFormat:", @"<CADisplayMode %d x %d fmt:%s range:%s>", v7, v8, v10, v4);
}

- (unint64_t)hash
{
  return self->_priv->var0.var0.var1;
}

- (unint64_t)maximumSourceBandwidth
{
  return self->_priv->var6.var1 * LOBYTE(self->_priv->var6.var0) * BYTE1(self->_priv->var6.var0);
}

- (unsigned)maximumSourceHeight
{
  return HIDWORD(self->_priv->var5);
}

- (unsigned)maximumSourceWidth
{
  return self->_priv->var5;
}

- (unint64_t)internalRepresentation
{
  return self->_priv->var0.var0.var1;
}

- (BOOL)isVRR
{
  return *(void *)&self->_priv->var0.var0.var0 < -1;
}

- (unint64_t)bitDepth
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  if (var1) {
    BOOL v3 = (*(void *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3 && (unsigned int v4 = ((var1 >> 55) & 0x1F) - 2, v4 <= 0x1A)) {
    return qword_184998DD8[v4];
  }
  else {
    return 8;
  }
}

- (BOOL)colorModeIsYCbCr
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  if (var1) {
    BOOL v3 = (*(void *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3 && (uint64_t v4 = (var1 >> 55) & 0x1F, v4 <= 0x15)) {
    return (0x3F1FF0u >> v4) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSString)colorMode
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  if (var1) {
    BOOL v3 = (*(void *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  unint64_t result = (NSString *)@"auto";
  if (v3)
  {
    unint64_t result = (NSString *)@"YCbCr444LimitedRange";
    switch((var1 >> 55) & 0x1F)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
        uint64_t v5 = (var1 >> 60) & 3;
        if (v5 != 1)
        {
          v6 = @"RGBLimitedRange";
          BOOL v7 = v5 == 2;
          goto LABEL_13;
        }
        unint64_t result = (NSString *)@"RGBFullRange";
        break;
      case 4uLL:
      case 5uLL:
      case 6uLL:
        unint64_t result = (NSString *)@"YCbCr420LimitedRange";
        break;
      case 7uLL:
      case 8uLL:
      case 9uLL:
        unint64_t result = (NSString *)@"YCbCr422LimitedRange";
        break;
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
        return result;
      case 0x10uLL:
      case 0x11uLL:
        unint64_t result = (NSString *)@"HDR10_444LimitedRange";
        break;
      case 0x12uLL:
      case 0x13uLL:
        unint64_t result = (NSString *)@"HDR10_422LimitedRange";
        break;
      case 0x14uLL:
      case 0x15uLL:
        unint64_t result = (NSString *)@"HDR10_420LimitedRange";
        break;
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
        v6 = @"HDR10_RGBFullRange";
        BOOL v7 = (var1 & 0x3000000000000000) == 0x1000000000000000;
LABEL_13:
        if (v7) {
          unint64_t result = &v6->isa;
        }
        else {
          unint64_t result = (NSString *)@"auto";
        }
        break;
      case 0x1AuLL:
      case 0x1BuLL:
        unint64_t result = (NSString *)@"DolbyVision";
        break;
      case 0x1CuLL:
        unint64_t result = (NSString *)@"DolbyVisionLowLatency";
        break;
      default:
        unint64_t result = (NSString *)@"auto";
        break;
    }
  }
  return result;
}

- (BOOL)isHighBandwidth
{
  return (*(void *)&self->_priv->var0.var0.var0 & 0x4000000010000000) == 0x4000000000000000;
}

- (BOOL)isVirtual
{
  return (*(void *)&self->_priv->var0.var0.var0 & 0x40000010000000) == 0x40000000000000;
}

- (double)pixelAspectRatio
{
  return 1.0;
}

- (Mode)_mode
{
  unint64_t var1 = self->_priv->var0.var0.var1;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.unint64_t var1 = var1;
  return result;
}

- (id)_display
{
  return (id)*(&self->_priv->var0.var0.var1 + 1);
}

+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5 isVRR:(BOOL)a6
{
  unint64_t v6 = a3 & 0x3FFF | ((a4 & 0x3FFF) << 14) | ((unint64_t)(vcvtd_n_u64_f64(a5, 0x10uLL) & 0x1FFFFFF) << 29);
  unint64_t v7 = 0x8000000000000000;
  if (!a6) {
    unint64_t v7 = 0;
  }
  return (CADisplayMode *)objc_msgSend(a1, "_displayModeWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", v6 | v7 | 0x1080000000000000, 0, 0, 0, 0, 0);
}

+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5
{
  return (CADisplayMode *)objc_msgSend(a1, "_displayModeWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", a3 & 0x3FFF | ((a4 & 0x3FFF) << 14) | ((unint64_t)(vcvtd_n_u64_f64(a5, 0x10uLL) & 0x1FFFFFF) << 29) | 0x1080000000000000, 0, 0, 0, 0, 0);
}

@end