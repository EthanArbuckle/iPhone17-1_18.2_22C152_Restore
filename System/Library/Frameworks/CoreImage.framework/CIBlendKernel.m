@interface CIBlendKernel
+ (CIBlendKernel)clear;
+ (CIBlendKernel)color;
+ (CIBlendKernel)colorBurn;
+ (CIBlendKernel)colorDodge;
+ (CIBlendKernel)componentAdd;
+ (CIBlendKernel)componentMax;
+ (CIBlendKernel)componentMin;
+ (CIBlendKernel)componentMultiply;
+ (CIBlendKernel)darken;
+ (CIBlendKernel)darkerColor;
+ (CIBlendKernel)destination;
+ (CIBlendKernel)destinationAtop;
+ (CIBlendKernel)destinationIn;
+ (CIBlendKernel)destinationOut;
+ (CIBlendKernel)destinationOver;
+ (CIBlendKernel)difference;
+ (CIBlendKernel)divide;
+ (CIBlendKernel)exclusion;
+ (CIBlendKernel)exclusiveOr;
+ (CIBlendKernel)hardLight;
+ (CIBlendKernel)hardMix;
+ (CIBlendKernel)hue;
+ (CIBlendKernel)kernelWithInternalRepresentation:(const void *)a3;
+ (CIBlendKernel)kernelWithString:(NSString *)string;
+ (CIBlendKernel)kernelWithString:(id)a3 extentType:(int)a4;
+ (CIBlendKernel)lighten;
+ (CIBlendKernel)lighterColor;
+ (CIBlendKernel)linearBurn;
+ (CIBlendKernel)linearDodge;
+ (CIBlendKernel)linearLight;
+ (CIBlendKernel)luminosity;
+ (CIBlendKernel)multiply;
+ (CIBlendKernel)overlay;
+ (CIBlendKernel)pinLight;
+ (CIBlendKernel)saturation;
+ (CIBlendKernel)screen;
+ (CIBlendKernel)softLight;
+ (CIBlendKernel)source;
+ (CIBlendKernel)sourceAtop;
+ (CIBlendKernel)sourceIn;
+ (CIBlendKernel)sourceOut;
+ (CIBlendKernel)sourceOver;
+ (CIBlendKernel)subtract;
+ (CIBlendKernel)vividLight;
+ (id)cachedKernelWithString:(id)a3 extentType:(int)a4;
+ (id)plusDarker;
+ (id)plusLighter;
- (BOOL)getBlendBehaviorBit:(int)a3;
- (BOOL)isBackIfForeIsClear;
- (BOOL)isClearIfBackIsClear;
- (BOOL)isClearIfForeIsClear;
- (BOOL)isForeIfBackIsClear;
- (CIBlendKernel)initWithString:(id)a3;
- (CIBlendKernel)initWithString:(id)a3 extentType:(int)a4;
- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background;
- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background colorSpace:(CGColorSpaceRef)colorSpace;
- (void)setBlendBehaviorBit:(int)a3 value:(BOOL)a4;
- (void)setIsBackIfForeIsClear:(BOOL)a3;
- (void)setIsClearIfBackIsClear:(BOOL)a3;
- (void)setIsClearIfForeIsClear:(BOOL)a3;
- (void)setIsForeIfBackIsClear:(BOOL)a3;
@end

@implementation CIBlendKernel

+ (CIBlendKernel)kernelWithInternalRepresentation:(const void *)a3
{
  if ((*(unsigned int (**)(const void *, SEL))(*(void *)a3 + 16))(a3, a2) != 62) {
    return 0;
  }
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithInternalRepresentation:a3];

  return (CIBlendKernel *)v4;
}

+ (CIBlendKernel)sourceAtop
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_srcAtop];
}

+ (CIBlendKernel)multiply
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_multiplyBlendMode];
}

- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background
{
  v25[2] = *MEMORY[0x1E4F143B8];
  [(CIImage *)foreground extent];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CIImage *)background extent];
  double x = v15;
  double y = v17;
  double width = v19;
  double height = v21;
  v27.origin.double x = v8;
  v27.origin.double y = v10;
  v27.size.double width = v12;
  v27.size.double height = v14;
  if (CGRectIsEmpty(v27) && [(CIBlendKernel *)self isBackIfForeIsClear]) {
    return background;
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  if (CGRectIsEmpty(v28) && [(CIBlendKernel *)self isForeIfBackIsClear]) {
    return foreground;
  }
  v29.origin.double x = v8;
  v29.origin.double y = v10;
  v29.size.double width = v12;
  v29.size.double height = v14;
  if (!CGRectIsEmpty(v29) || ![(CIBlendKernel *)self isClearIfForeIsClear])
  {
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    if (!CGRectIsEmpty(v30) || ![(CIBlendKernel *)self isClearIfBackIsClear])
    {
      int v24 = *((_DWORD *)self->super.super._priv + 42);
      if (v24 != 3)
      {
        if (v24 == 1)
        {
          v33.origin.double x = v8;
          v33.origin.double y = v10;
          v33.size.double width = v12;
          v33.size.double height = v14;
          v35.origin.double x = x;
          v35.origin.double y = y;
          v35.size.double width = width;
          v35.size.double height = height;
          CGRect v32 = CGRectIntersection(v33, v35);
        }
        else
        {
          if (v24)
          {
            double x = v8;
            double y = v10;
            double width = v12;
            double height = v14;
            goto LABEL_20;
          }
          v31.origin.double x = v8;
          v31.origin.double y = v10;
          v31.size.double width = v12;
          v31.size.double height = v14;
          v34.origin.double x = x;
          v34.origin.double y = y;
          v34.size.double width = width;
          v34.size.double height = height;
          CGRect v32 = CGRectUnion(v31, v34);
        }
        double x = v32.origin.x;
        double y = v32.origin.y;
        double width = v32.size.width;
        double height = v32.size.height;
      }
LABEL_20:
      v25[0] = foreground;
      v25[1] = background;
      return -[CIColorKernel applyWithExtent:arguments:](self, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2], x, y, width, height);
    }
  }

  return +[CIImage emptyImage];
}

+ (CIBlendKernel)componentAdd
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_add];
}

+ (CIBlendKernel)componentMultiply
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_multiply];
}

+ (CIBlendKernel)componentMin
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_min];
}

+ (CIBlendKernel)componentMax
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_max];
}

+ (CIBlendKernel)clear
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_clear];
}

+ (CIBlendKernel)source
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_src];
}

+ (CIBlendKernel)destination
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_dst];
}

+ (CIBlendKernel)sourceOver
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_srcOver];
}

+ (CIBlendKernel)destinationOver
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_dstOver];
}

+ (CIBlendKernel)sourceIn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_srcIn];
}

+ (CIBlendKernel)destinationIn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_dstIn];
}

+ (CIBlendKernel)sourceOut
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_srcOut];
}

+ (CIBlendKernel)destinationOut
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_dstOut];
}

+ (CIBlendKernel)destinationAtop
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_dstAtop];
}

+ (CIBlendKernel)exclusiveOr
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_exclusiveOr];
}

+ (CIBlendKernel)screen
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_screenBlendMode];
}

+ (CIBlendKernel)overlay
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_overlayBlendMode];
}

+ (CIBlendKernel)darken
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_darkenBlendMode];
}

+ (CIBlendKernel)lighten
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_lightenBlendMode];
}

+ (CIBlendKernel)colorDodge
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_colorDodgeBlendMode];
}

+ (CIBlendKernel)colorBurn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_colorBurnBlendMode];
}

+ (CIBlendKernel)hardLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_hardLightBlendMode];
}

+ (CIBlendKernel)softLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_softLightBlendMode];
}

+ (CIBlendKernel)difference
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_differenceBlendMode];
}

+ (CIBlendKernel)exclusion
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_exclusionBlendMode];
}

+ (CIBlendKernel)hue
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_hueBlendMode];
}

+ (CIBlendKernel)saturation
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_saturationBlendMode];
}

+ (CIBlendKernel)color
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_colorBlendMode];
}

+ (CIBlendKernel)luminosity
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_luminosityBlendMode];
}

+ (CIBlendKernel)subtract
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_subtractBlendMode];
}

+ (CIBlendKernel)divide
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_divideBlendMode];
}

+ (CIBlendKernel)linearBurn
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_linearBurnBlendMode];
}

+ (CIBlendKernel)linearDodge
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_linearDodgeBlendMode];
}

+ (CIBlendKernel)vividLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_vividLightBlendMode];
}

+ (CIBlendKernel)linearLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_linearLightBlendMode];
}

+ (CIBlendKernel)pinLight
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_pinLightBlendMode];
}

+ (CIBlendKernel)hardMix
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_hardMixBlendMode];
}

+ (CIBlendKernel)darkerColor
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_darkerColorBlendMode];
}

+ (CIBlendKernel)lighterColor
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_lighterColorBlendMode];
}

+ (id)plusDarker
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_plusDarker];
}

+ (id)plusLighter
{
  return +[CIBlendKernel kernelWithInternalRepresentation:&CI::_plusLighter];
}

+ (CIBlendKernel)kernelWithString:(NSString *)string
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  CGFloat v10 = __34__CIBlendKernel_kernelWithString___block_invoke;
  double v11 = &unk_1E5771BE8;
  id v12 = a1;
  if (check_cikl_string(string, "+[CIBlendKernel kernelWithString:]"))
  {
    v6 = [[CIBlendKernel alloc] initWithString:string];
    if (v6)
    {
      double v7 = (NSString *)[(id)objc_opt_class() description];
      CoreAnalytics(v7, &cfstr_Kernelwithstri.isa, 1);
    }
  }
  else
  {
    v6 = 0;
  }
  v10((uint64_t)v9);
  return v6;
}

void __34__CIBlendKernel_kernelWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

- (CIBlendKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIBlendKernel initWithString:]"))
  {
    return [(CIBlendKernel *)self initWithString:a3 extentType:0];
  }
  else
  {

    return 0;
  }
}

+ (id)cachedKernelWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString:extentType\", "%{public}@"", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v16 = __51__CIBlendKernel_cachedKernelWithString_extentType___block_invoke;
  double v17 = &unk_1E5771BE8;
  id v18 = a1;
  CGFloat v8 = (void *)[a1 cache];
  objc_sync_enter(v8);
  double v9 = (void *)[v8 objectForKey:a3];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v10 = (id)[objc_alloc((Class)a1) initWithString:a3 extentType:v4];
    uint64_t v12 = (uint64_t)v10;
    if (!v10) {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
    [v8 setObject:v12 forKey:a3];
  }
  objc_sync_exit(v8);
  if (v10 == (id)[MEMORY[0x1E4F1CA98] null]) {
    double v13 = 0;
  }
  else {
    double v13 = v10;
  }
  v16((uint64_t)v15);
  return v13;
}

void __51__CIBlendKernel_cachedKernelWithString_extentType___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString:extentType\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (CIBlendKernel)kernelWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:extentType\", "%{public}@"", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[3] = &unk_1E5771BE8;
  v10[4] = a1;
  CGFloat v8 = [[CIBlendKernel alloc] initWithString:a3 extentType:v4];
  __45__CIBlendKernel_kernelWithString_extentType___block_invoke((uint64_t)v10);
  return v8;
}

void __45__CIBlendKernel_kernelWithString_extentType___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:extentType\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

- (CIBlendKernel)initWithString:(id)a3 extentType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!check_cikl_string((NSString *)a3, "-[CIBlendKernel initWithString:extentType:]"))
  {

    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CIBlendKernel;
  double v7 = [(CIColorKernel *)&v11 initWithString:a3];
  CGFloat v8 = v7;
  if (v7)
  {
    id v9 = [(CIKernel *)v7 parameters];
    if ([v9 count] == 2
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "valueForKey:", @"CIAttributeClass"), "isEqual:", @"CISampler")&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "valueForKey:", @"CIAttributeClass"), "isEqual:", @"CISampler"))
    {
      (*(void (**)(void *, uint64_t))(*(void *)v8->super.super._priv + 80))(v8->super.super._priv, v4);
      return v8;
    }

    return 0;
  }
  return v8;
}

- (BOOL)getBlendBehaviorBit:(int)a3
{
  priv = self->super.super._priv;
  return priv && (priv[43] & a3) != 0;
}

- (void)setBlendBehaviorBit:(int)a3 value:(BOOL)a4
{
  priv = self->super.super._priv;
  if (priv) {
    (*(void (**)(void *, void, BOOL))(*(void *)priv + 88))(priv, *(void *)&a3, a4);
  }
}

- (BOOL)isBackIfForeIsClear
{
  return [(CIBlendKernel *)self getBlendBehaviorBit:1];
}

- (BOOL)isForeIfBackIsClear
{
  return [(CIBlendKernel *)self getBlendBehaviorBit:2];
}

- (BOOL)isClearIfForeIsClear
{
  return [(CIBlendKernel *)self getBlendBehaviorBit:4];
}

- (BOOL)isClearIfBackIsClear
{
  return [(CIBlendKernel *)self getBlendBehaviorBit:8];
}

- (void)setIsBackIfForeIsClear:(BOOL)a3
{
}

- (void)setIsForeIfBackIsClear:(BOOL)a3
{
}

- (void)setIsClearIfForeIsClear:(BOOL)a3
{
}

- (void)setIsClearIfBackIsClear:(BOOL)a3
{
}

- (CIImage)applyWithForeground:(CIImage *)foreground background:(CIImage *)background colorSpace:(CGColorSpaceRef)colorSpace
{
  if (colorSpace)
  {
    uint64_t v6 = [(CIBlendKernel *)self applyWithForeground:[(CIImage *)foreground imageByColorMatchingWorkingSpaceToColorSpace:colorSpace] background:[(CIImage *)background imageByColorMatchingWorkingSpaceToColorSpace:colorSpace]];
    return [(CIImage *)v6 imageByColorMatchingColorSpaceToWorkingSpace:colorSpace];
  }
  else
  {
    return -[CIBlendKernel applyWithForeground:background:](self, "applyWithForeground:background:", foreground);
  }
}

@end