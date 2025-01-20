@interface CAEmitterCell
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CAEmitterCell)emitterCell;
+ (id)defaultValueForKey:(NSString *)key;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)autoreverses;
- (BOOL)isEnabled;
- (BOOL)shouldArchiveValueForKey:(NSString *)key;
- (CAEmitterCell)initWithCoder:(id)a3;
- (CGColorRef)color;
- (CGFloat)contentsScale;
- (CGFloat)emissionLatitude;
- (CGFloat)emissionLongitude;
- (CGFloat)emissionRange;
- (CGFloat)scale;
- (CGFloat)scaleRange;
- (CGFloat)scaleSpeed;
- (CGFloat)spin;
- (CGFloat)spinRange;
- (CGFloat)velocity;
- (CGFloat)velocityRange;
- (CGFloat)xAcceleration;
- (CGFloat)yAcceleration;
- (CGFloat)zAcceleration;
- (CGRect)contentsRect;
- (NSArray)emitterBehaviors;
- (NSArray)emitterCells;
- (NSDictionary)style;
- (NSString)contentsFrameMode;
- (NSString)fillMode;
- (NSString)magnificationFilter;
- (NSString)minificationFilter;
- (NSString)name;
- (NSString)particleType;
- (Object)CA_copyRenderValue;
- (double)beginTime;
- (double)duration;
- (double)orientationLatitude;
- (double)orientationLongitude;
- (double)orientationRange;
- (double)repeatDuration;
- (double)rotation;
- (double)rotationRange;
- (double)timeOffset;
- (float)alphaRange;
- (float)alphaSpeed;
- (float)birthRate;
- (float)blueRange;
- (float)blueSpeed;
- (float)contentsFramesPerSecond;
- (float)greenRange;
- (float)greenSpeed;
- (float)lifetime;
- (float)lifetimeRange;
- (float)mass;
- (float)massRange;
- (float)minificationFilterBias;
- (float)redRange;
- (float)redSpeed;
- (float)repeatCount;
- (float)speed;
- (id)CAMLTypeForKey:(id)a3;
- (id)contents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unsigned)contentsFrameCount;
- (unsigned)contentsFramesPerRow;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)CA_prepareRenderValue;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAlphaRange:(float)alphaRange;
- (void)setAlphaSpeed:(float)alphaSpeed;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBeginTime:(double)a3;
- (void)setBirthRate:(float)birthRate;
- (void)setBlueRange:(float)blueRange;
- (void)setBlueSpeed:(float)blueSpeed;
- (void)setColor:(CGColorRef)color;
- (void)setContents:(id)contents;
- (void)setContentsFrameCount:(unsigned int)a3;
- (void)setContentsFrameMode:(id)a3;
- (void)setContentsFramesPerRow:(unsigned int)a3;
- (void)setContentsFramesPerSecond:(float)a3;
- (void)setContentsRect:(CGRect)contentsRect;
- (void)setContentsScale:(CGFloat)contentsScale;
- (void)setDuration:(double)a3;
- (void)setEmissionLatitude:(CGFloat)emissionLatitude;
- (void)setEmissionLongitude:(CGFloat)emissionLongitude;
- (void)setEmissionRange:(CGFloat)emissionRange;
- (void)setEmitterBehaviors:(id)a3;
- (void)setEmitterCells:(NSArray *)emitterCells;
- (void)setEnabled:(BOOL)enabled;
- (void)setFillMode:(id)a3;
- (void)setGreenRange:(float)greenRange;
- (void)setGreenSpeed:(float)greenSpeed;
- (void)setLifetime:(float)lifetime;
- (void)setLifetimeRange:(float)lifetimeRange;
- (void)setMagnificationFilter:(NSString *)magnificationFilter;
- (void)setMass:(float)a3;
- (void)setMassRange:(float)a3;
- (void)setMinificationFilter:(NSString *)minificationFilter;
- (void)setMinificationFilterBias:(float)minificationFilterBias;
- (void)setName:(NSString *)name;
- (void)setOrientationLatitude:(double)a3;
- (void)setOrientationLongitude:(double)a3;
- (void)setOrientationRange:(double)a3;
- (void)setParticleType:(id)a3;
- (void)setRedRange:(float)redRange;
- (void)setRedSpeed:(float)redSpeed;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setRotation:(double)a3;
- (void)setRotationRange:(double)a3;
- (void)setScale:(CGFloat)scale;
- (void)setScaleRange:(CGFloat)scaleRange;
- (void)setScaleSpeed:(CGFloat)scaleSpeed;
- (void)setSpeed:(float)a3;
- (void)setSpin:(CGFloat)spin;
- (void)setSpinRange:(CGFloat)spinRange;
- (void)setStyle:(NSDictionary *)style;
- (void)setTimeOffset:(double)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVelocity:(CGFloat)velocity;
- (void)setVelocityRange:(CGFloat)velocityRange;
- (void)setXAcceleration:(CGFloat)xAcceleration;
- (void)setYAcceleration:(CGFloat)yAcceleration;
- (void)setZAcceleration:(CGFloat)zAcceleration;
@end

@implementation CAEmitterCell

- (void)setEmitterCells:(NSArray *)emitterCells
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = emitterCells;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC9, 3, (unsigned __int8 *)v3);
}

- (NSArray)emitterCells
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC9u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setMinificationFilterBias:(float)minificationFilterBias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = minificationFilterBias;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x186, 17, (unsigned __int8 *)&v3);
}

- (float)minificationFilterBias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x186u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setMinificationFilter:(NSString *)minificationFilter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = minificationFilter;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x185, 3, (unsigned __int8 *)v3);
}

- (NSString)minificationFilter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x185u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setMagnificationFilter:(NSString *)magnificationFilter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = magnificationFilter;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x175, 3, (unsigned __int8 *)v3);
}

- (NSString)magnificationFilter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x175u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setContentsScale:(CGFloat)contentsScale
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = contentsScale;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x88, 18, (unsigned __int8 *)v3);
}

- (CGFloat)contentsScale
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x88u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setContentsRect:(CGRect)contentsRect
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = contentsRect;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x87, 21, (unsigned __int8 *)&v3);
}

- (CGRect)contentsRect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CAEmitterCell_getter((CA::Transaction *)self, 0x87u, (const CGAffineTransform *)0x15, (CA::Mat4Impl *)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = v7[1];
  double v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContents:(id)contents
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = contents;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x77, 2, (unsigned __int8 *)v3);
}

- (id)contents
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x77u, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (void)setAlphaSpeed:(float)alphaSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = alphaSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x18, 17, (unsigned __int8 *)&v3);
}

- (float)alphaSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x18u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setAlphaRange:(float)alphaRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = alphaRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x16, 17, (unsigned __int8 *)&v3);
}

- (float)alphaRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x16u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBlueSpeed:(float)blueSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = blueSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x41, 17, (unsigned __int8 *)&v3);
}

- (float)blueSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x41u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBlueRange:(float)blueRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = blueRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x40, 17, (unsigned __int8 *)&v3);
}

- (float)blueRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x40u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setGreenSpeed:(float)greenSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = greenSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xFB, 17, (unsigned __int8 *)&v3);
}

- (float)greenSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xFBu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setGreenRange:(float)greenRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = greenRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xFA, 17, (unsigned __int8 *)&v3);
}

- (float)greenRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xFAu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRedSpeed:(float)redSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = redSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1CE, 17, (unsigned __int8 *)&v3);
}

- (float)redSpeed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1CEu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRedRange:(float)redRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = redRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1CD, 17, (unsigned __int8 *)&v3);
}

- (float)redRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1CDu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setColor:(CGColorRef)color
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = color;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x5C, 2, (unsigned __int8 *)v3);
}

- (CGColorRef)color
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x5Cu, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CGColorRef)v3[0];
}

- (void)setSpinRange:(CGFloat)spinRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = spinRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x212, 18, (unsigned __int8 *)v3);
}

- (CGFloat)spinRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x212u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setSpin:(CGFloat)spin
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = spin;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x210, 18, (unsigned __int8 *)v3);
}

- (CGFloat)spin
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x210u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRotationRange:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1E3, 18, (unsigned __int8 *)v3);
}

- (double)rotationRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1E3u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRotation:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1E1, 18, (unsigned __int8 *)v3);
}

- (double)rotation
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1E1u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationRange:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x19F, 18, (unsigned __int8 *)v3);
}

- (double)orientationRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x19Fu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationLongitude:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x19E, 18, (unsigned __int8 *)v3);
}

- (double)orientationLongitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x19Eu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationLatitude:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x19D, 18, (unsigned __int8 *)v3);
}

- (double)orientationLatitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x19Du, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScaleSpeed:(CGFloat)scaleSpeed
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = scaleSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1E8, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scaleSpeed
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1E8u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScaleRange:(CGFloat)scaleRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = scaleRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1E7, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scaleRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1E7u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScale:(CGFloat)scale
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = scale;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1E6, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scale
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1E6u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setZAcceleration:(CGFloat)zAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = zAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x266, 18, (unsigned __int8 *)v3);
}

- (CGFloat)zAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x266u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setYAcceleration:(CGFloat)yAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = yAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x264, 18, (unsigned __int8 *)v3);
}

- (CGFloat)yAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x264u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setXAcceleration:(CGFloat)xAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = xAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x260, 18, (unsigned __int8 *)v3);
}

- (CGFloat)xAcceleration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x260u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setVelocityRange:(CGFloat)velocityRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = velocityRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x24E, 18, (unsigned __int8 *)v3);
}

- (CGFloat)velocityRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x24Eu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setVelocity:(CGFloat)velocity
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = velocity;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x24D, 18, (unsigned __int8 *)v3);
}

- (CGFloat)velocity
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x24Du, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionRange:(CGFloat)emissionRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = emissionRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC7, 18, (unsigned __int8 *)v3);
}

- (CGFloat)emissionRange
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC7u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionLongitude:(CGFloat)emissionLongitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = emissionLongitude;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC6, 18, (unsigned __int8 *)v3);
}

- (CGFloat)emissionLongitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC6u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionLatitude:(CGFloat)emissionLatitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)float v3 = emissionLatitude;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC5, 18, (unsigned __int8 *)v3);
}

- (CGFloat)emissionLatitude
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC5u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setLifetimeRange:(float)lifetimeRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = lifetimeRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x15C, 17, (unsigned __int8 *)&v3);
}

- (float)lifetimeRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x15Cu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setLifetime:(float)lifetime
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = lifetime;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x15B, 17, (unsigned __int8 *)&v3);
}

- (float)lifetime
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x15Bu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBirthRate:(float)birthRate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = birthRate;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x3D, 17, (unsigned __int8 *)&v3);
}

- (float)birthRate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x3Du, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setStyle:(NSDictionary *)style
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = style;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x221, 3, (unsigned __int8 *)v3);
}

- (NSDictionary)style
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x221u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSDictionary *)v3[0];
}

- (void)setEnabled:(BOOL)enabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = enabled;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xD4, 7, (unsigned __int8 *)&v3);
}

- (BOOL)isEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xD4u, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setName:(NSString *)name
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = name;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x18D, 3, (unsigned __int8 *)v3);
}

- (NSString)name
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x18Du, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setFillMode:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xDF, 3, (unsigned __int8 *)v3);
}

- (NSString)fillMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xDFu, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setAutoreverses:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x31, 7, (unsigned __int8 *)&v3);
}

- (BOOL)autoreverses
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x31u, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setRepeatDuration:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)char v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1D6, 18, (unsigned __int8 *)v3);
}

- (double)repeatDuration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1D6u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRepeatCount:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1D5, 17, (unsigned __int8 *)&v3);
}

- (float)repeatCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1D5u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setSpeed:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x20E, 17, (unsigned __int8 *)&v3);
}

- (float)speed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x20Eu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setDuration:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xBF, 18, (unsigned __int8 *)v3);
}

- (double)duration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xBFu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setTimeOffset:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x22E, 18, (unsigned __int8 *)v3);
}

- (double)timeOffset
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x22Eu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setBeginTime:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x39, 18, (unsigned __int8 *)v3);
}

- (double)beginTime
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x39u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3
    && ([a4 isEqualToString:@"emitterCells"]
     || [a4 isEqualToString:@"emitterBehaviors"]))
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAEmitterCell;
    return [&v8 CA_validateValue:a3 forKey:a4];
  }
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"contents"]) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterCell;
  return [&v6 CAMLTypeSupportedForKey:a3];
}

- (id)CAMLTypeForKey:(id)a3
{
  return CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

- (void)encodeWithCAMLWriter:(id)a3
{
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
}

- (id)debugDescription
{
  float v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    float v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  uint64_t v4 = (__CFString *)[MEMORY[0x1E4F28E78] string];
  double v5 = (objc_class *)objc_opt_class();
  [(__CFString *)v4 appendFormat:@"<%@:%p; ", NSStringFromClass(v5), self];
  int v6 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v7 = (CA::AttrList **)self->_attr[0];
  if (v7) {
    CA::AttrList::append_description(*v7, v4);
  }
  CA::Transaction::unlock(v3);
  [(__CFString *)v4 appendString:@">"];
  return v4;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_state
    && (([a3 isEqualToString:@"emitterCells"] & 1) != 0
     || [a3 isEqualToString:@"emitterBehaviors"]))
  {
    state = (atomic_uint *)self->_state;
    if (atomic_fetch_add(state + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)state + 16))(state);
    }
    self->_state = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterCell;
  [(CAEmitterCell *)&v6 didChangeValueForKey:a3];
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  objc_super v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    objc_super v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  uint64_t v7 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  -[CAEmitterCell willChangeValueForKey:](self, "willChangeValueForKey:", a4, v11[0]);
  int v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v9 = (CA::AttrList *)self->_attr[0];
  if (!v9)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    uint64_t v9 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
  }
  self->_attr[0] = CA::AttrList::set(v9, v7, 2, (unsigned __int8 *)v11);
  CA::Transaction::unlock(v6);

  [(CAEmitterCell *)self didChangeValueForKey:a4];
}

- (id)valueForUndefinedKey:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    double v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = CAInternAtom((const __CFString *)a3, 1);
  int v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  int v8 = self->_attr[0];
  if (v8)
  {
    v11[0] = 0;
    int v9 = CA::AttrList::get((uint64_t)v8, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v11);
    CA::Transaction::unlock(v5);
    if (v9) {
      return (id)v11[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    CA::Transaction::unlock(v5);
    return 0;
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  int v7 = (objc_class *)+[CAEmitterCell superclass];

  CAObject_setValueForKey(self, v7, a3, (const __CFString *)a4);
}

- (id)valueForKey:(id)a3
{
  double v5 = (objc_class *)+[CAEmitterCell superclass];

  return CAObject_valueForKey(self, v5, (const __CFString *)a3);
}

- (void)encodeWithCoder:(id)a3
{
}

- (CAEmitterCell)initWithCoder:(id)a3
{
  return (CAEmitterCell *)CAObject_initWithCoder(self, a3);
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  double v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    double v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = CAInternAtom((const __CFString *)key, 1);
  int v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  int v8 = self->_attr[0];
  if (v8)
  {
    while (1)
    {
      int v8 = *(_DWORD **)v8;
      BOOL v9 = v8 != 0;
      if (!v8) {
        break;
      }
      if ((v8[2] & 0xFFFFFF) == v6)
      {
        BOOL v9 = 1;
        break;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  CA::Transaction::unlock(v5);
  return v9;
}

- (Object)CA_copyRenderValue
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  state = (char *)self->_state;
  if (!state)
  {
    uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v4 && (uint64_t v5 = *(void *)(v4 + 40)) != 0) {
      int v6 = *(CGColorSpace **)(v5 + 112);
    }
    else {
      int v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    }
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    int v8 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xE8uLL, 0x743898A5uLL);
    state = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 1;
      *((_DWORD *)v8 + 3) = 14;
      ++dword_1EB2ADE00;
      *(void *)int v8 = &unk_1ED02CF48;
      *((_OWORD *)v8 + 1) = 0u;
      *((_OWORD *)v8 + 2) = 0u;
      *((_OWORD *)v8 + 3) = 0u;
      *((void *)v8 + 8) = 0x20000000214;
      *(_OWORD *)(v8 + 72) = 0u;
      *(_OWORD *)(v8 + 88) = 0u;
      *(_OWORD *)(v8 + 104) = 0u;
      *(_OWORD *)(v8 + 120) = 0u;
      *(_OWORD *)(v8 + 136) = 0u;
      *(_OWORD *)(v8 + 152) = 0u;
      *(_OWORD *)(v8 + 168) = 0u;
      *(_OWORD *)(v8 + 184) = 0u;
      *(_OWORD *)(v8 + 200) = 0u;
      *(_OWORD *)(v8 + 216) = 0u;
      *((_DWORD *)v8 + 54) = 1065353216;
    }
    CFStringRef v9 = [(CAEmitterCell *)self name];
    if (v9)
    {
      v11 = CA::Render::String::new_string(v9, v10);
      v12 = (atomic_uint *)*((void *)state + 2);
      *((void *)state + 2) = v11;
      if (v12)
      {
        if (atomic_fetch_add(v12 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v12 + 16))(v12);
        }
      }
    }
    int v13 = [(CAEmitterCell *)self isEnabled];
    CFStringRef v14 = [(CAEmitterCell *)self particleType];
    if (v14) {
      *((_DWORD *)state + 16) = CAInternAtom(v14, 0);
    }
    uint64_t v15 = CAMediaTimingCopyRenderTiming((unint64_t)self);
    v16 = (atomic_uint *)*((void *)state + 7);
    *((void *)state + 7) = v15;
    if (v16 && atomic_fetch_add(v16 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v16 + 16))(v16);
    }
    [(CAEmitterCell *)self birthRate];
    *((_DWORD *)state + 18) = v17;
    [(CAEmitterCell *)self lifetime];
    *((_DWORD *)state + 19) = v18;
    [(CAEmitterCell *)self lifetimeRange];
    *((_DWORD *)state + 20) = v19;
    [(CAEmitterCell *)self emissionLatitude];
    *(float *)&double v20 = v20;
    *((_DWORD *)state + 21) = LODWORD(v20);
    [(CAEmitterCell *)self emissionLongitude];
    *(float *)&double v21 = v21;
    *((_DWORD *)state + 22) = LODWORD(v21);
    [(CAEmitterCell *)self emissionRange];
    *(float *)&double v22 = v22;
    *((_DWORD *)state + 23) = LODWORD(v22);
    [(CAEmitterCell *)self velocity];
    *(float *)&double v23 = v23;
    *((_DWORD *)state + 24) = LODWORD(v23);
    [(CAEmitterCell *)self velocityRange];
    *(float *)&double v24 = v24;
    *((_DWORD *)state + 25) = LODWORD(v24);
    [(CAEmitterCell *)self xAcceleration];
    *(float *)&double v25 = v25;
    *((_DWORD *)state + 26) = LODWORD(v25);
    [(CAEmitterCell *)self yAcceleration];
    *(float *)&double v26 = v26;
    *((_DWORD *)state + 27) = LODWORD(v26);
    [(CAEmitterCell *)self zAcceleration];
    *(float *)&double v27 = v27;
    *((_DWORD *)state + 28) = LODWORD(v27);
    [(CAEmitterCell *)self mass];
    *((_DWORD *)state + 29) = v28;
    [(CAEmitterCell *)self massRange];
    *((_DWORD *)state + 30) = v29;
    [(CAEmitterCell *)self scale];
    *(float *)&double v30 = v30;
    *((_DWORD *)state + 31) = LODWORD(v30);
    [(CAEmitterCell *)self scaleRange];
    *(float *)&double v31 = v31;
    *((_DWORD *)state + 32) = LODWORD(v31);
    [(CAEmitterCell *)self scaleSpeed];
    *(float *)&double v32 = v32;
    *((_DWORD *)state + 33) = LODWORD(v32);
    [(CAEmitterCell *)self orientationLatitude];
    *(float *)&double v33 = v33;
    *((_DWORD *)state + 34) = LODWORD(v33);
    [(CAEmitterCell *)self orientationLongitude];
    *(float *)&double v34 = v34;
    *((_DWORD *)state + 35) = LODWORD(v34);
    [(CAEmitterCell *)self orientationRange];
    *(float *)&double v35 = v35;
    *((_DWORD *)state + 36) = LODWORD(v35);
    [(CAEmitterCell *)self rotation];
    *(float *)&double v36 = v36;
    *((_DWORD *)state + 37) = LODWORD(v36);
    [(CAEmitterCell *)self rotationRange];
    *(float *)&double v37 = v37;
    *((_DWORD *)state + 38) = LODWORD(v37);
    [(CAEmitterCell *)self spin];
    *(float *)&double v38 = v38;
    *((_DWORD *)state + 39) = LODWORD(v38);
    [(CAEmitterCell *)self spinRange];
    *(float *)&double v39 = v39;
    *((_DWORD *)state + 40) = LODWORD(v39);
    v40 = [(CAEmitterCell *)self color];
    if (v40)
    {
      float64x2_t v84 = 0u;
      float64x2_t v85 = 0u;
      CA_CGColorGetRGBComponents(v40, v6, v84.f64);
      *(float32x4_t *)(state + 164) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v84), v85);
    }
    [(CAEmitterCell *)self redRange];
    *((_DWORD *)state + 45) = v41;
    [(CAEmitterCell *)self greenRange];
    *((_DWORD *)state + 46) = v42;
    [(CAEmitterCell *)self blueRange];
    *((_DWORD *)state + 47) = v43;
    [(CAEmitterCell *)self alphaRange];
    *((_DWORD *)state + 48) = v44;
    [(CAEmitterCell *)self redSpeed];
    *((_DWORD *)state + 49) = v45;
    [(CAEmitterCell *)self greenSpeed];
    *((_DWORD *)state + 50) = v46;
    [(CAEmitterCell *)self blueSpeed];
    *((_DWORD *)state + 51) = v47;
    [(CAEmitterCell *)self alphaSpeed];
    *((_DWORD *)state + 52) = v48;
    [(CAEmitterCell *)self minificationFilterBias];
    *((_DWORD *)state + 53) = v49;
    [(CAEmitterCell *)self contentsScale];
    *(float *)&double v50 = v50;
    *((_DWORD *)state + 54) = LODWORD(v50);
    *((float *)state + 55) = (float)[(CAEmitterCell *)self contentsFrameCount];
    *((float *)state + 56) = (float)[(CAEmitterCell *)self contentsFramesPerRow];
    [(CAEmitterCell *)self contentsFramesPerSecond];
    *((_DWORD *)state + 57) = v51;
    v52 = [(CAEmitterCell *)self contents];
    if (v52)
    {
      v53 = v52;
      CFTypeID v54 = CFGetTypeID(v52);
      if (v54 == CGImageGetTypeID())
      {
        v55 = CA::Render::copy_image(v53, v6, 0, 0.0, 1.0);
        v56 = (atomic_uint *)*((void *)state + 3);
        *((void *)state + 3) = v55;
        if (v56)
        {
          if (atomic_fetch_add(v56 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v56 + 16))(v56);
          }
        }
      }
    }
    CFStringRef v57 = [(CAEmitterCell *)self contentsFrameMode];
    if (v57) {
      *((_DWORD *)state + 17) = CAInternAtom(v57, 0);
    }
    [(CAEmitterCell *)self contentsRect];
    if (v59 != 0.0 || *(double *)&v60 != 0.0 || v61.f64[0] != 1.0 || *(double *)&v62 != 1.0)
    {
      *(double *)v64.i64 = v59;
      v64.i64[1] = v60;
      v63.f64[0] = 0.0;
      v65.i64[0] = *(void *)&v61.f64[0];
      v65.i64[1] = v62;
      int8x16_t v66 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v63, v61).i64[0], 0);
      v67.i64[1] = v60;
      *(double *)v67.i64 = v61.f64[0] + v59;
      float64x2_t v68 = (float64x2_t)vbslq_s8(v66, v67, v64);
      v64.i64[1] = v62;
      *(double *)v64.i64 = -v61.f64[0];
      float64x2_t v69 = (float64x2_t)vbslq_s8(v66, v64, v65);
      if (*(double *)&v62 < 0.0)
      {
        v68.f64[1] = *(double *)&v62 + *(double *)&v60;
        v69.f64[1] = -*(double *)&v62;
      }
      float64x2_t v84 = v68;
      float64x2_t v85 = vaddq_f64(v69, v68);
      v70 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, &v84, v58);
      v71 = (atomic_uint *)*((void *)state + 4);
      *((void *)state + 4) = v70;
      if (v71 && atomic_fetch_add(v71 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v71 + 16))(v71);
      }
    }
    CFStringRef v72 = [(CAEmitterCell *)self magnificationFilter];
    if (v72) {
      v13 |= 8 * CA::Render::Layer::image_filter_from_string(v72, 0);
    }
    CFStringRef v73 = [(CAEmitterCell *)self minificationFilter];
    if (v73) {
      v13 |= 2 * CA::Render::Layer::image_filter_from_string(v73, (const __CFString *)1);
    }
    v74 = [(CAEmitterCell *)self emitterCells];
    if (v74)
    {
      v75 = CA::Render::copy_render_array((const __CFArray *)v74, 14);
      v76 = (atomic_uint *)*((void *)state + 5);
      if (v76 != v75)
      {
        if (v76 && atomic_fetch_add(v76 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v76 + 16))(v76);
        }
        if (v75)
        {
          v77 = v75;
          if (!atomic_fetch_add(v75 + 2, 1u))
          {
            v77 = 0;
            atomic_fetch_add(v75 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v77 = 0;
        }
        *((void *)state + 5) = v77;
      }
      if (v75 && atomic_fetch_add(v75 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v75 + 16))(v75);
      }
    }
    v78 = [(CAEmitterCell *)self emitterBehaviors];
    if (v78)
    {
      v79 = CA::Render::copy_render_array((const __CFArray *)v78, 13);
      v80 = (atomic_uint *)*((void *)state + 6);
      if (v80 != v79)
      {
        if (v80 && atomic_fetch_add(v80 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v80 + 16))(v80);
        }
        if (v79)
        {
          v81 = v79;
          if (!atomic_fetch_add(v79 + 2, 1u))
          {
            v81 = 0;
            atomic_fetch_add(v79 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v81 = 0;
        }
        *((void *)state + 6) = v81;
      }
      if (v79 && atomic_fetch_add(v79 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v79 + 16))(v79);
      }
    }
    *((_DWORD *)state + 3) |= v13 << 8;
    self->_state = state;
  }
  v82 = (atomic_uint *)(state + 8);
  if (!atomic_fetch_add((atomic_uint *volatile)state + 2, 1u))
  {
    state = 0;
    atomic_fetch_add(v82, 0xFFFFFFFF);
  }
  return (Object *)state;
}

- (void)CA_prepareRenderValue
{
  double v2 = [(CAEmitterCell *)self contents];
  if (v2)
  {
    float v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CGImageGetTypeID())
    {
      uint64_t v6 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (v6 && (uint64_t v7 = *(void *)(v6 + 40)) != 0) {
        int v8 = *(CGImage **)(v7 + 112);
      }
      else {
        int v8 = (CGImage *)CAGetColorSpace(0x1Du);
      }
      CA::Render::prepare_image(v3, v8, 0, v5);
    }
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CAMediaTimingInvalidate((uint64_t)self);
  double v5 = (CA::AttrList *)self->_attr[0];
  if (v5)
  {
    uint64_t v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6) {
      uint64_t v6 = (CA::Transaction *)CA::Transaction::create(v3);
    }
    int v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    CA::AttrList::free(v5, v4);
    CA::Transaction::unlock(v6);
  }
  state = (atomic_uint *)self->_state;
  if (state && atomic_fetch_add(state + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)state + 16))(state);
  }
  v9.receiver = self;
  v9.super_class = (Class)CAEmitterCell;
  [(CAEmitterCell *)&v9 dealloc];
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return objc_opt_class() != (void)a3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = (objc_class *)objc_opt_class();

  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3 = CAInternAtom((const __CFString *)key, 0);
  if (v3 <= 211)
  {
    switch(v3)
    {
      case 127:
      case 129:
        id v4 = NSNumber;
        return (id)[v4 numberWithUnsignedInt:1];
      case 128:
        return @"single";
      case 130:
        int v7 = NSNumber;
        uint64_t v8 = 0;
        goto LABEL_29;
      case 131:
      case 132:
      case 133:
      case 134:
        return 0;
      case 135:
        objc_super v9 = (void *)MEMORY[0x1E4F29238];
        return (id)objc_msgSend(v9, "valueWithRect:", 0.0, 0.0, 1.0, 1.0);
      case 136:
        goto LABEL_25;
      default:
        if (v3 == 92)
        {
          id result = (id)+[CAEmitterCell defaultValueForKey:]::white;
          if (!+[CAEmitterCell defaultValueForKey:]::white)
          {
            v11 = (CGColorSpace *)CAGetColorSpace(0x1Du);
            id result = CGColorCreate(v11, +[CAEmitterCell defaultValueForKey:]::values);
            +[CAEmitterCell defaultValueForKey:]::white = (uint64_t)result;
          }
        }
        else
        {
          if (v3 != 191) {
            return 0;
          }
          uint64_t v6 = NSNumber;
          id result = (id)[v6 numberWithDouble:INFINITY];
        }
        break;
    }
    return result;
  }
  if (v3 > 388)
  {
    if (v3 <= 485)
    {
      if (v3 == 389)
      {
        if (dyld_program_sdk_at_least()) {
          return @"linear";
        }
        else {
          return @"trilinear";
        }
      }
      if (v3 == 422) {
        return @"sprite";
      }
      return 0;
    }
    if (v3 != 486 && v3 != 526) {
      return 0;
    }
LABEL_25:
    int v7 = NSNumber;
    uint64_t v8 = 1;
LABEL_29:
    return (id)[v7 numberWithInt:v8];
  }
  if (v3 > 372)
  {
    if (v3 == 373) {
      return @"linear";
    }
    if (v3 != 379) {
      return 0;
    }
    goto LABEL_25;
  }
  if (v3 != 212)
  {
    if (v3 == 223) {
      return @"removed";
    }
    return 0;
  }
  uint64_t v10 = NSNumber;

  return (id)[v10 numberWithBool:1];
}

+ (CAEmitterCell)emitterCell
{
  id v2 = objc_alloc_init((Class)a1);

  return (CAEmitterCell *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    id v4 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  id v6 = objc_alloc_init((Class)objc_opt_class());
  if (v6)
  {
    int v7 = *((_DWORD *)v4 + 25);
    *((_DWORD *)v4 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    uint64_t v8 = (CA::AttrList *)*((void *)v6 + 1);
    if (v8) {
      CA::AttrList::free(v8, v5);
    }
    objc_super v9 = (CA::AttrList *)self->_attr[0];
    if (v9)
    {
      uint64_t v10 = *((void *)v9 + 1) & 7;
      if (v10 == 7) {
        objc_super v9 = (CA::AttrList *)CA::AttrList::copy_(v9);
      }
      else {
        *((void *)v9 + 1) = *((void *)v9 + 1) & 0xFFFFFFFFFFFFFFF8 | (v10 + 1);
      }
    }
    *((void *)v6 + 1) = v9;
    state = (atomic_uint *)self->_state;
    if (state)
    {
      v12 = state + 2;
      if (!atomic_fetch_add(state + 2, 1u))
      {
        state = 0;
        atomic_fetch_add(v12, 0xFFFFFFFF);
      }
    }
    *((void *)v6 + 3) = state;
    *((_DWORD *)v6 + 8) = self->_flags;
    CA::Transaction::unlock(v4);
  }
  return v6;
}

- (void)setContentsFramesPerSecond:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x82, 17, (unsigned __int8 *)&v3);
}

- (float)contentsFramesPerSecond
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x82u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFramesPerRow:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x81, 12, (unsigned __int8 *)&v3);
}

- (unsigned)contentsFramesPerRow
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x81u, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFrameCount:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x7F, 12, (unsigned __int8 *)&v3);
}

- (unsigned)contentsFrameCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x7Fu, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFrameMode:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x80, 3, (unsigned __int8 *)v3);
}

- (NSString)contentsFrameMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x80u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setEmitterBehaviors:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC8, 3, (unsigned __int8 *)v3);
}

- (NSArray)emitterBehaviors
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC8u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setMassRange:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x17C, 17, (unsigned __int8 *)&v3);
}

- (float)massRange
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x17Cu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setMass:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x17B, 17, (unsigned __int8 *)&v3);
}

- (float)mass
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x17Bu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setParticleType:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1A6, 3, (unsigned __int8 *)v3);
}

- (NSString)particleType
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1A6u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

@end