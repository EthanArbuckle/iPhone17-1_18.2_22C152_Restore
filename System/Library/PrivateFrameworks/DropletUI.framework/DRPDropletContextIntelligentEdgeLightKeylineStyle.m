@interface DRPDropletContextIntelligentEdgeLightKeylineStyle
- (BOOL)isEqual:(id)a3;
- (BOOL)preferAudioReactivity;
- (BOOL)screenBlendMode;
- (BOOL)softRim;
- (DRPDropletContextIntelligentEdgeLightKeylineStyle)init;
- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3;
- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3 style:(unint64_t)a4;
- (NSString)debugDescription;
- (NSString)description;
- (UIEdgeInsets)keylineFadeLengths;
- (UIEdgeInsets)keylineOutsets;
- (double)alpha;
- (double)edrGain;
- (double)innerWidth;
- (double)keylineBlurRadius;
- (double)keylineInputAmount;
- (double)keylineInputEnd;
- (double)keylineInputStart;
- (double)normalizedStartLocation;
- (double)normalizedStopLocation;
- (double)outerWidth;
- (id)copy;
- (id)initWithPreferringAudioReactivity:(double)a3 style:(double)a4 softRim:(double)a5 screenBlendMode:(double)a6 alpha:(double)a7 innerWidth:(double)a8 outerWidth:(uint64_t)a9 keylineBlurRadius:(uint64_t)a10 keylineInputAmount:(char)a11 keylineInputStart:(uint64_t)a12 keylineInputEnd:(uint64_t)a13 edrGain:(uint64_t)a14 keylineOutsets:(uint64_t)a15 keylineFadeLengths:(uint64_t)a16 normalizedStartLocation:(__int128)a17 normalizedStopLocation:(uint64_t)a18;
- (unint64_t)style;
- (void)setAlpha:(double)a3;
- (void)setEdrGain:(double)a3;
- (void)setInnerWidth:(double)a3;
- (void)setKeylineBlurRadius:(double)a3;
- (void)setKeylineFadeLengths:(UIEdgeInsets)a3;
- (void)setKeylineInputAmount:(double)a3;
- (void)setKeylineInputEnd:(double)a3;
- (void)setKeylineInputStart:(double)a3;
- (void)setKeylineOutsets:(UIEdgeInsets)a3;
- (void)setNormalizedStartLocation:(double)a3;
- (void)setNormalizedStopLocation:(double)a3;
- (void)setOuterWidth:(double)a3;
- (void)setPreferAudioReactivity:(BOOL)a3;
- (void)setScreenBlendMode:(BOOL)a3;
- (void)setSoftRim:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation DRPDropletContextIntelligentEdgeLightKeylineStyle

- (BOOL)preferAudioReactivity
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity;
  swift_beginAccess();
  return *v2;
}

- (void)setPreferAudioReactivity:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (unint64_t)style
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (BOOL)softRim
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_softRim;
  swift_beginAccess();
  return *v2;
}

- (void)setSoftRim:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_softRim;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)screenBlendMode
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_screenBlendMode;
  swift_beginAccess();
  return *v2;
}

- (void)setScreenBlendMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_screenBlendMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)alpha
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_alpha);
  swift_beginAccess();
  return *v2;
}

- (void)setAlpha:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_alpha);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)innerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setInnerWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)outerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setOuterWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)keylineBlurRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setKeylineBlurRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineBlurRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)keylineInputAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setKeylineInputAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)keylineInputStart
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputStart);
  swift_beginAccess();
  return *v2;
}

- (void)setKeylineInputStart:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputStart);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)keylineInputEnd
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputEnd);
  swift_beginAccess();
  return *v2;
}

- (void)setKeylineInputEnd:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineInputEnd);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)edrGain
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_edrGain);
  swift_beginAccess();
  return *v2;
}

- (void)setEdrGain:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_edrGain);
  swift_beginAccess();
  double *v4 = a3;
}

- (UIEdgeInsets)keylineOutsets
{
  double v2 = sub_24D131D18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineOutsets:(UIEdgeInsets)a3
{
}

- (UIEdgeInsets)keylineFadeLengths
{
  double v2 = sub_24D131D18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineFadeLengths:(UIEdgeInsets)a3
{
}

- (double)normalizedStartLocation
{
  double v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStartLocation:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)normalizedStopLocation
{
  double v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStopLocation:(double)a3
{
  double v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  double *v4 = a3;
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3
{
  return [(DRPDropletContextIntelligentEdgeLightKeylineStyle *)self initWithPreferringAudioReactivity:a3 style:2];
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3 style:(unint64_t)a4
{
  return (DRPDropletContextIntelligentEdgeLightKeylineStyle *)DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:)(a3, a4);
}

- (id)initWithPreferringAudioReactivity:(double)a3 style:(double)a4 softRim:(double)a5 screenBlendMode:(double)a6 alpha:(double)a7 innerWidth:(double)a8 outerWidth:(uint64_t)a9 keylineBlurRadius:(uint64_t)a10 keylineInputAmount:(char)a11 keylineInputStart:(uint64_t)a12 keylineInputEnd:(uint64_t)a13 edrGain:(uint64_t)a14 keylineOutsets:(uint64_t)a15 keylineFadeLengths:(uint64_t)a16 normalizedStartLocation:(__int128)a17 normalizedStopLocation:(uint64_t)a18
{
  return DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:softRim:screenBlendMode:alpha:innerWidth:outerWidth:keylineBlurRadius:keylineInputAmount:keylineInputStart:keylineInputEnd:edrGain:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(a11, a12, a13, a14, a1, a2, a3, a4, a5, a6, a7, a8, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

- (BOOL)isEqual:(id)a3
{
  return sub_24D132A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DRPDropletContextIntelligentEdgeLightKeylineStyle.isEqual(_:));
}

- (id)copy
{
  return (id)sub_24D132D24(self, (uint64_t)a2, (void (*)(void *__return_ptr))DRPDropletContextIntelligentEdgeLightKeylineStyle.copy());
}

- (NSString)description
{
  return (NSString *)sub_24D1334B8(self, (uint64_t)a2, (void (*)(void))sub_24D132DCC);
}

- (NSString)debugDescription
{
  return (NSString *)sub_24D1334B8(self, (uint64_t)a2, (void (*)(void))sub_24D132DCC);
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)init
{
  UIEdgeInsets result = (DRPDropletContextIntelligentEdgeLightKeylineStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end