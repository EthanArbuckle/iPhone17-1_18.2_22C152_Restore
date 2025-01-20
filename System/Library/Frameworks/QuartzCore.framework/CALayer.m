@interface CALayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)needsDisplayForKey:(NSString *)key;
+ (BOOL)needsLayoutForKey:(id)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (CALayer)allocWithZone:(_NSZone *)a3;
+ (CALayer)layer;
+ (CALayer)layerWithRenderLayer:(void *)a3;
+ (CALayer)layerWithRenderLayer:(void *)a3 options:(id)a4;
+ (CGFloat)cornerCurveExpansionFactor:(CALayerCornerCurve)curve;
+ (id)defaultActionForKey:(NSString *)event;
+ (id)defaultValueForKey:(NSString *)key;
+ (void)CAMLParserEndElement:(id)a3;
+ (void)CAMLParserStartElement:(id)a3;
+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3;
+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3;
+ (void)initialize;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)_continuousCorners;
- (BOOL)_defersDidBecomeVisiblePostCommit;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)_scheduleAnimationTimer;
- (BOOL)_usesCornerRadii;
- (BOOL)acceleratesDrawing;
- (BOOL)allowsDisplayCompositing;
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)allowsGroupBlending;
- (BOOL)allowsGroupOpacity;
- (BOOL)allowsHitTesting;
- (BOOL)allowsWeakReference;
- (BOOL)autoreverses;
- (BOOL)borderPathIsBounds;
- (BOOL)canDrawConcurrently;
- (BOOL)clearsContext;
- (BOOL)containsPoint:(CGPoint)p;
- (BOOL)contentsAlignsToPixels;
- (BOOL)contentsAreFlipped;
- (BOOL)contentsContainsSubtitles;
- (BOOL)contentsDither;
- (BOOL)contentsOpaque;
- (BOOL)continuousCorners;
- (BOOL)cornerContentsMasksEdges;
- (BOOL)createsCompositingGroup;
- (BOOL)definesDisplayRegionOfInterest;
- (BOOL)drawsAsynchronously;
- (BOOL)drawsMipmapLevels;
- (BOOL)flipsHorizontalAxis;
- (BOOL)getRendererInfo:(_CARenderRendererInfo *)a3 size:(unint64_t)a4;
- (BOOL)hasBeenCommitted;
- (BOOL)hitTestsAsOpaque;
- (BOOL)hitTestsContentsAlphaChannel;
- (BOOL)ignoresHitTesting;
- (BOOL)inheritsTiming;
- (BOOL)invertsMask;
- (BOOL)invertsShadow;
- (BOOL)isDescendantOf:(id)a3;
- (BOOL)isDoubleSided;
- (BOOL)isFrozen;
- (BOOL)isGeometryFlipped;
- (BOOL)isHidden;
- (BOOL)isOpaque;
- (BOOL)layoutIsActive;
- (BOOL)literalContentsCenter;
- (BOOL)masksToBounds;
- (BOOL)needsDisplay;
- (BOOL)needsDisplayOnBoundsChange;
- (BOOL)needsLayout;
- (BOOL)needsLayoutOnGeometryChange;
- (BOOL)preloadsCache;
- (BOOL)punchoutShadow;
- (BOOL)rasterizationPrefersDisplayCompositing;
- (BOOL)rasterizationPrefersWindowServerAwareBackdrops;
- (BOOL)retainWeakReference;
- (BOOL)rimPathIsBounds;
- (BOOL)shadowPathIsBounds;
- (BOOL)shouldArchiveValueForKey:(NSString *)key;
- (BOOL)shouldFlatten;
- (BOOL)shouldRasterize;
- (BOOL)shouldReflatten;
- (BOOL)softRim;
- (BOOL)sortsSublayers;
- (BOOL)toneMapToStandardDynamicRange;
- (BOOL)treatRec709AsSRGB;
- (BOOL)usesWebKitBehavior;
- (BOOL)wantsExtendedDynamicRangeContent;
- (CAAnimation)animationForKey:(NSString *)key;
- (CACornerMask)maskedCorners;
- (CACornerRadii)cornerRadii;
- (CAEdgeAntialiasingMask)edgeAntialiasingMask;
- (CALayer)hitTest:(CGPoint)p;
- (CALayer)init;
- (CALayer)initWithCoder:(id)a3;
- (CALayer)initWithLayer:(id)layer;
- (CALayer)mask;
- (CALayer)modelLayer;
- (CALayer)presentationLayer;
- (CALayer)retain;
- (CALayer)superlayer;
- (CALayerContentsFilter)magnificationFilter;
- (CALayerContentsFilter)minificationFilter;
- (CALayerContentsFormat)contentsFormat;
- (CALayerContentsGravity)contentsGravity;
- (CALayerCornerCurve)cornerCurve;
- (CALayerDelegate)unsafeUnretainedDelegate;
- (CAMeshTransform)meshTransform;
- (CATransform3D)sublayerTransform;
- (CATransform3D)transform;
- (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(CALayer *)l;
- (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(CALayer *)l;
- (CGAffineTransform)affineTransform;
- (CGAffineTransform)contentsTransform;
- (CGColor)contentsMultiplyColor;
- (CGColor)rimColor;
- (CGColorRef)backgroundColor;
- (CGColorRef)borderColor;
- (CGColorRef)shadowColor;
- (CGColorSpace)_retainColorSpace;
- (CGFloat)anchorPointZ;
- (CGFloat)borderWidth;
- (CGFloat)contentsScale;
- (CGFloat)cornerRadius;
- (CGFloat)rasterizationScale;
- (CGFloat)shadowRadius;
- (CGFloat)zPosition;
- (CGPathRef)shadowPath;
- (CGPoint)anchorPoint;
- (CGPoint)convertPoint:(CGPoint)p fromLayer:(CALayer *)l;
- (CGPoint)convertPoint:(CGPoint)p toLayer:(CALayer *)l;
- (CGPoint)position;
- (CGRect)_visibleRectOfLayer:(id)a3;
- (CGRect)bounds;
- (CGRect)contentsCenter;
- (CGRect)contentsDirtyRect;
- (CGRect)contentsRect;
- (CGRect)convertRect:(CGRect)r fromLayer:(CALayer *)l;
- (CGRect)convertRect:(CGRect)r toLayer:(CALayer *)l;
- (CGRect)cornerContentsCenter;
- (CGRect)frame;
- (CGRect)visibleRect;
- (CGSize)backgroundColorPhase;
- (CGSize)preferredFrameSize;
- (CGSize)shadowOffset;
- (CGSize)size;
- (CGSize)sizeRequisition;
- (NSArray)animationKeys;
- (NSArray)backgroundFilters;
- (NSArray)filters;
- (NSArray)presentationModifiers;
- (NSArray)sublayers;
- (NSDictionary)actions;
- (NSDictionary)style;
- (NSSet)identifiers;
- (NSString)contentsScaling;
- (NSString)contentsSwizzle;
- (NSString)fillMode;
- (NSString)name;
- (NSString)securityMode;
- (NSString)toneMapMode;
- (double)beginTime;
- (double)borderOffset;
- (double)contentsEDRStrength;
- (double)contentsMaximumDesiredEDR;
- (double)duration;
- (double)motionBlurAmount;
- (double)repeatDuration;
- (double)rimWidth;
- (double)timeOffset;
- (float)gain;
- (float)minificationFilterBias;
- (float)opacity;
- (float)repeatCount;
- (float)rimOpacity;
- (float)shadowOpacity;
- (float)speed;
- (id)CAMLTypeForKey:(id)a3;
- (id)CA_archivingValueForKey:(id)a3;
- (id)_initWithReference:(id)a3;
- (id)_layoutHash;
- (id)_previousLayoutHash;
- (id)actionForKey:(NSString *)event;
- (id)ancestorSharedWithLayer:(id)a3;
- (id)compositingFilter;
- (id)contents;
- (id)context;
- (id)cornerContents;
- (id)debugDescription;
- (id)delegate;
- (id)dependentStatesOfState:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (id)layerAtTime:(double)a3;
- (id)layerBeingDrawn;
- (id)optimizationOpportunities:(BOOL)a3;
- (id)recursiveDescription;
- (id)stateTransitionFrom:(id)a3 to:(id)a4;
- (id)stateWithName:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int)_overrideImageFormat;
- (int64_t)contentsGravityEnum;
- (unint64_t)retainCount;
- (unsigned)_renderImageCopyFlags;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (unsigned)disableUpdateMask;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)CA_initialize_for_decoding;
- (void)_colorSpaceDidChange;
- (void)_contentsFormatDidChange:(id)a3;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)_display;
- (void)_renderBackgroundInContext:(CGContext *)a3;
- (void)_renderBorderInContext:(CGContext *)a3;
- (void)_renderForegroundInContext:(CGContext *)a3;
- (void)_renderSublayersInContext:(CGContext *)a3;
- (void)_saveCurrentLayoutHash;
- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4;
- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4;
- (void)_setPreviousLayoutHash:(id)a3;
- (void)_validateLayoutHashHasChangedWithLayoutTime:(double)a3;
- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key;
- (void)addIdentifier:(id)a3;
- (void)addPresentationModifier:(id)a3;
- (void)addState:(id)a3;
- (void)addSublayer:(CALayer *)layer;
- (void)clearHasBeenCommitted;
- (void)dealloc;
- (void)display;
- (void)displayIfNeeded;
- (void)drawInContext:(CGContextRef)ctx;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)insertState:(id)a3 atIndex:(unsigned int)a4;
- (void)insertSublayer:(CALayer *)layer above:(CALayer *)sibling;
- (void)insertSublayer:(CALayer *)layer atIndex:(unsigned int)idx;
- (void)insertSublayer:(CALayer *)layer below:(CALayer *)sibling;
- (void)invalidateContents;
- (void)layoutBelowIfNeeded;
- (void)layoutIfNeeded;
- (void)layoutSublayers;
- (void)observationInfo;
- (void)prepareContents;
- (void)regionBeingDrawn;
- (void)reloadValueForKeyPath:(id)a3;
- (void)removeAllAnimations;
- (void)removeAnimationForKey:(NSString *)key;
- (void)removeFromSuperlayer;
- (void)removeIdentifier:(id)a3;
- (void)removePresentationModifier:(id)a3;
- (void)removeState:(id)a3;
- (void)renderInContext:(CGContextRef)ctx;
- (void)replaceSublayer:(CALayer *)oldLayer with:(CALayer *)newLayer;
- (void)scrollPoint:(CGPoint)p;
- (void)scrollRectToVisible:(CGRect)r;
- (void)setAcceleratesDrawing:(BOOL)a3;
- (void)setActions:(NSDictionary *)actions;
- (void)setAffineTransform:(CGAffineTransform *)m;
- (void)setAllowsDisplayCompositing:(BOOL)a3;
- (void)setAllowsEdgeAntialiasing:(BOOL)allowsEdgeAntialiasing;
- (void)setAllowsGroupBlending:(BOOL)a3;
- (void)setAllowsGroupOpacity:(BOOL)allowsGroupOpacity;
- (void)setAllowsHitTesting:(BOOL)a3;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setAnchorPointZ:(CGFloat)anchorPointZ;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBackgroundColor:(CGColorRef)backgroundColor;
- (void)setBackgroundColorPhase:(CGSize)a3;
- (void)setBackgroundFilters:(NSArray *)backgroundFilters;
- (void)setBeginTime:(double)a3;
- (void)setBorderColor:(CGColorRef)borderColor;
- (void)setBorderOffset:(double)a3;
- (void)setBorderPathIsBounds:(BOOL)a3;
- (void)setBorderWidth:(CGFloat)borderWidth;
- (void)setBounds:(CGRect)bounds;
- (void)setCanDrawConcurrently:(BOOL)a3;
- (void)setClearsContext:(BOOL)a3;
- (void)setCompositingFilter:(id)compositingFilter;
- (void)setContents:(id)contents;
- (void)setContentsAlignsToPixels:(BOOL)a3;
- (void)setContentsCenter:(CGRect)contentsCenter;
- (void)setContentsChanged;
- (void)setContentsContainsSubtitles:(BOOL)a3;
- (void)setContentsDirtyRect:(CGRect)a3;
- (void)setContentsDither:(BOOL)a3;
- (void)setContentsEDRStrength:(double)a3;
- (void)setContentsFormat:(CALayerContentsFormat)contentsFormat;
- (void)setContentsGravity:(CALayerContentsGravity)contentsGravity;
- (void)setContentsMaximumDesiredEDR:(double)a3;
- (void)setContentsMultiplyColor:(CGColor *)a3;
- (void)setContentsOpaque:(BOOL)a3;
- (void)setContentsRect:(CGRect)contentsRect;
- (void)setContentsScale:(CGFloat)contentsScale;
- (void)setContentsScaling:(id)a3;
- (void)setContentsSwizzle:(id)a3;
- (void)setContentsTransform:(CGAffineTransform *)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerContents:(id)a3;
- (void)setCornerContentsCenter:(CGRect)a3;
- (void)setCornerContentsMasksEdges:(BOOL)a3;
- (void)setCornerCurve:(CALayerCornerCurve)cornerCurve;
- (void)setCornerRadii:(CACornerRadii *)a3;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setCreatesCompositingGroup:(BOOL)a3;
- (void)setDefinesDisplayRegionOfInterest:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisableUpdateMask:(unsigned int)a3;
- (void)setDoubleSided:(BOOL)doubleSided;
- (void)setDrawsAsynchronously:(BOOL)drawsAsynchronously;
- (void)setDuration:(double)a3;
- (void)setEdgeAntialiasingMask:(CAEdgeAntialiasingMask)edgeAntialiasingMask;
- (void)setFillMode:(id)a3;
- (void)setFilters:(NSArray *)filters;
- (void)setFlipsHorizontalAxis:(BOOL)a3;
- (void)setFrame:(CGRect)frame;
- (void)setFrozen:(BOOL)a3;
- (void)setGain:(float)a3;
- (void)setGeometryFlipped:(BOOL)geometryFlipped;
- (void)setHidden:(BOOL)hidden;
- (void)setHitTestsAsOpaque:(BOOL)a3;
- (void)setHitTestsContentsAlphaChannel:(BOOL)a3;
- (void)setInheritsTiming:(BOOL)a3;
- (void)setInvertsMask:(BOOL)a3;
- (void)setInvertsShadow:(BOOL)a3;
- (void)setLiteralContentsCenter:(BOOL)a3;
- (void)setMagnificationFilter:(CALayerContentsFilter)magnificationFilter;
- (void)setMask:(CALayer *)mask;
- (void)setMaskedCorners:(CACornerMask)maskedCorners;
- (void)setMasksToBounds:(BOOL)masksToBounds;
- (void)setMeshTransform:(id)a3;
- (void)setMinificationFilter:(CALayerContentsFilter)minificationFilter;
- (void)setMinificationFilterBias:(float)minificationFilterBias;
- (void)setName:(NSString *)name;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)r;
- (void)setNeedsDisplayOnBoundsChange:(BOOL)needsDisplayOnBoundsChange;
- (void)setNeedsLayout;
- (void)setNeedsLayoutOnGeometryChange:(BOOL)a3;
- (void)setObservationInfo:(void *)a3;
- (void)setOpacity:(float)opacity;
- (void)setOpaque:(BOOL)opaque;
- (void)setPosition:(CGPoint)position;
- (void)setPreloadsCache:(BOOL)a3;
- (void)setPresentationModifiers:(id)a3;
- (void)setPunchoutShadow:(BOOL)a3;
- (void)setRasterizationPrefersDisplayCompositing:(BOOL)a3;
- (void)setRasterizationPrefersWindowServerAwareBackdrops:(BOOL)a3;
- (void)setRasterizationScale:(CGFloat)rasterizationScale;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setRimColor:(CGColor *)a3;
- (void)setRimOpacity:(float)a3;
- (void)setRimPathIsBounds:(BOOL)a3;
- (void)setRimWidth:(double)a3;
- (void)setSecurityMode:(id)a3;
- (void)setShadowColor:(CGColorRef)shadowColor;
- (void)setShadowOffset:(CGSize)shadowOffset;
- (void)setShadowOpacity:(float)shadowOpacity;
- (void)setShadowPath:(CGPathRef)shadowPath;
- (void)setShadowPathIsBounds:(BOOL)a3;
- (void)setShadowRadius:(CGFloat)shadowRadius;
- (void)setShouldFlatten:(BOOL)a3;
- (void)setShouldRasterize:(BOOL)shouldRasterize;
- (void)setShouldReflatten:(BOOL)a3;
- (void)setSizeRequisition:(CGSize)a3;
- (void)setSoftRim:(BOOL)a3;
- (void)setSortsSublayers:(BOOL)a3;
- (void)setSpeed:(float)a3;
- (void)setStyle:(NSDictionary *)style;
- (void)setSublayerTransform:(CATransform3D *)sublayerTransform;
- (void)setSublayers:(NSArray *)sublayers;
- (void)setTimeOffset:(double)a3;
- (void)setToneMapMode:(id)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setTransform:(CATransform3D *)transform;
- (void)setTreatRec709AsSRGB:(BOOL)a3;
- (void)setUnsafeUnretainedDelegate:(id)a3;
- (void)setUsesWebKitBehavior:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWantsExtendedDynamicRangeContent:(BOOL)wantsExtendedDynamicRangeContent;
- (void)setZPosition:(CGFloat)zPosition;
@end

@implementation CALayer

- (CALayerDelegate)unsafeUnretainedDelegate
{
  layer = (char *)self->_attr.layer;
  v3 = (id *)(layer + 128);
  if (layer[136]) {
    return (CALayerDelegate *)objc_loadWeak(v3);
  }
  else {
    return (CALayerDelegate *)*v3;
  }
}

- (void)observationInfo
{
  return self->_attr._objc_observation_info;
}

- (BOOL)flipsHorizontalAxis
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 4) & 1;
}

- (void)removeFromSuperlayer
{
}

- (void)addSublayer:(CALayer *)layer
{
  if (layer)
  {
    v4 = self;
    v5 = self->_attr.layer;
    if ((*((_DWORD *)v5 + 1) & 0x60000) != 0) {
      self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v5[2] format];
    }
    v6 = layer->_attr.layer;
    if ((*((_DWORD *)v6 + 1) & 0x60000) != 0) {
      self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v6[2] format];
    }
    v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    int v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    CA::Layer::insert_sublayer((CA::Layer *)v4->_attr.layer, v7, layer, 0xFFFFFFFFFFFFFFFFLL);
    CA::Transaction::unlock(v7);
  }
}

- (id)ancestorSharedWithLayer:(id)a3
{
  p_isa = &self->super.isa;
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  if (a3 == p_isa) {
    return a3;
  }
  if (!a3) {
    return 0;
  }
  v6 = p_isa ? CA::Layer::superlayer(p_isa[2], v5) : 0;
  if (v6 == a3) {
    return a3;
  }
  int v8 = CA::Layer::superlayer(*((CA::Layer **)a3 + 2), v5);
  BOOL v9 = v8 == (CALayer *)p_isa;
  if (v8 == (CALayer *)p_isa) {
    id result = p_isa;
  }
  else {
    id result = 0;
  }
  if (!v9 && p_isa)
  {
    while (2)
    {
      v10 = (CA::Layer **)a3;
      do
      {
        if (p_isa == v10) {
          return p_isa;
        }
        v10 = (CA::Layer **)CA::Layer::superlayer(v10[2], v5);
      }
      while (v10);
      p_isa = (CA::Layer **)CA::Layer::superlayer(p_isa[2], v5);
      id result = 0;
      if (p_isa) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (CALayer)retain
{
  return self;
}

- (BOOL)needsLayout
{
  layer = (CA::Layer *)self->_attr.layer;
  v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  uint64_t v4 = v3[24];
  if ((v4 & 0x80000000) != 0 || (unsigned int v5 = *((_DWORD *)layer + v4 + 68)) == 0) {
    unsigned int v5 = *CA::Layer::thread_flags_(layer, (CA::Transaction *)v3);
  }
  return (v5 >> 5) & 1;
}

- (int64_t)contentsGravityEnum
{
  return ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 3) & 0xF;
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
}

- (BOOL)hasBeenCommitted
{
  return (*((_DWORD *)self->_attr.layer + 1) >> 14) & 1;
}

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (objc_opt_isKindOfClass())
  {
    key = (NSString *)@"transition";
  }
  else if (![(NSString *)key length])
  {
    key = 0;
  }
  v7 = (CA::Transaction *)[(CAAnimation *)anim copy];
  if (v7)
  {
    v15 = (CAAnimation *)v7;
    int v8 = (uint64_t *)CA::Transaction::ensure_compat(v7);
    BOOL v9 = [(CALayer *)self modelLayer];
    if (v9)
    {
      v10 = (atomic_uint **)v9;
      v18[0] = 0;
      uint64_t v16 = 0;
      v17 = [(CAAnimation *)v15 delegate];
      if (!v17
        && CA::Transaction::get_value(v8[11], 30, (const CGAffineTransform *)2, (CA::Mat4Impl *)&v17)
        && v17)
      {
        -[CAAnimation setDelegate:](v15, "setDelegate:");
      }
      if (CA::Transaction::get_value(v8[11], 31, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v16))
      {
        double v11 = *(double *)&v16;
      }
      else
      {
        uint64_t v16 = 0x3FD0000000000000;
        double v11 = 0.25;
      }
      [(CAAnimation *)v15 setDefaultDuration:v11];
      [(CAAnimation *)v15 duration];
      if (v12 <= 0.000001)
      {
        char v14 = lookup_delegate_methods((CA::Transaction *)v8, v17);
        if ((v14 & 0x40) != 0) {
          [(objc_object *)v17 animationDidStart:v15];
        }
        if (v14 < 0) {
          [(objc_object *)v17 animationDidStop:v15 finished:1];
        }

        if (key) {
          [v10 removeAnimationForKey:key];
        }
      }
      else
      {
        if (CA::Transaction::get_value(v8[11], 32, (const CGAffineTransform *)2, (CA::Mat4Impl *)v18)
          && v18[0])
        {
          -[CAAnimation setTimingFunction:](v15, "setTimingFunction:");
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [(CAAnimation *)v15 keyPath];
          if (key)
          {
            if (!v13) {
              [(CAAnimation *)v15 setKeyPath:key];
            }
          }
        }
        CA::Layer::add_animation(v10[2], v15, (__CFString *)key);
      }
    }
    else
    {
    }
  }
}

- (id)actionForKey:(NSString *)event
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  unsigned int v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  id v16 = 0;
  v17[0] = 0;
  layer = (char *)self->_attr.layer;
  if ((layer[57] & 0x10) != 0)
  {
    int v8 = (id *)(layer + 128);
    if (layer[136])
    {
      id Weak = objc_loadWeak(v8);
      if (!Weak) {
        goto LABEL_9;
      }
    }
    else
    {
      id Weak = *v8;
      if (!Weak) {
        goto LABEL_9;
      }
    }
    id v10 = (id)[Weak actionForLayer:self forKey:event];
    if (v10)
    {
LABEL_12:
      CA::Transaction::unlock(v5);
      goto LABEL_24;
    }
  }
LABEL_9:
  uint64_t v11 = *((void *)layer + 9);
  if (v11)
  {
    if (CA::AttrList::get(v11, 2, (const CGAffineTransform *)1, (CA::Mat4Impl *)v17))
    {
      id v10 = (id)[v17[0] objectForKey:event];
      if (v10) {
        goto LABEL_12;
      }
    }
  }
  if (layer[57])
  {
    uint64_t v12 = *((void *)layer + 9);
    if (!v12 || (CA::AttrList::get(v12, 545, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v16) & 1) == 0)
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      CAObject_defaultValueForAtom(v13, 545, (const CGAffineTransform *)1, (uint64_t)&v16);
    }
    for (i = v16; i; id v16 = i)
    {
      v17[0] = (id)[i objectForKey:@"actions"];
      id v10 = (id)[v17[0] objectForKey:event];
      if (v10) {
        goto LABEL_12;
      }
      id i = (id)[v16 objectForKey:@"style"];
    }
  }
  id v10 = (id)[(objc_class *)object_getClass(self) defaultActionForKey:event];
  CA::Transaction::unlock(v5);
  if (!v10)
  {
    if ((*((_DWORD *)self->_attr.layer + 1) & 0x4000) != 0) {
      id v10 = +[CATransaction _implicitAnimationForLayer:self keyPath:event];
    }
    else {
      id v10 = 0;
    }
  }
LABEL_24:
  if (v10 == (id)*MEMORY[0x1E4F1D260]) {
    return 0;
  }
  else {
    return v10;
  }
}

- (CGRect)frame
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = self->_attr.layer;
  double v6 = 0.5;
  double v7 = 0.5;
  if ((*((unsigned char *)layer + 56) & 8) != 0) {
    [(CALayer *)self anchorPoint];
  }
  int8x16_t v8 = *((int8x16_t *)layer + 6);
  int8x16_t v19 = v8;
  double v9 = *((double *)layer + 14);
  double v10 = *((double *)layer + 15);
  double v20 = v9;
  double v21 = v10;
  if ((*((unsigned char *)layer + 55) & 0x10) != 0)
  {
    memset(v18, 0, sizeof(v18));
    CA::Layer::get_frame_transform((uint64_t)layer, v18, 1, 0, 0.0, v6, *(double *)v8.i64);
    CA::Mat4Impl::mat4_apply_to_rect(v18, &v19, v13);
    double v12 = *(double *)&v19.i64[1];
    double v11 = *(double *)v19.i64;
    double v9 = v20;
    double v10 = v21;
  }
  else
  {
    double v11 = *((double *)layer + 10) - v9 * v7;
    double v12 = *((double *)layer + 11) - v10 * v6;
  }
  CA::Transaction::unlock(v3);
  double v14 = v11;
  double v15 = v12;
  double v16 = v9;
  double v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)contents
{
  return (id)*((void *)self->_attr.layer + 18);
}

- (void)setFrame:(CGRect)frame
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (frame.size.width < 0.0 || frame.size.height < 0.0)
  {
    CGRect v28 = CGRectStandardize(frame);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
  }
  layer = self->_attr.layer;
  double v9 = 0.5;
  double v10 = 0.5;
  if ((layer[56] & 8) != 0)
  {
    [(CALayer *)self anchorPoint];
    double v10 = v11;
    double v9 = v12;
  }
  if ((layer[55] & 0x14) != 0 || (layer[51] & 0x10) != 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    float64x2_t v24 = 0u;
    [(CALayer *)self affineTransform];
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if ((layer[55] & 4) != 0) {
      [(CALayer *)self bounds];
    }
    uint64_t v19 = v14;
    uint64_t v21 = v13;
    if ((layer[51] & 0x10) != 0) {
      float64x2_t v24 = vnegq_f64(v24);
    }
    double v15 = x + v10 * width - 0.0;
    double v16 = y + v9 * height - 0.0;
    *(float64x2_t *)&v22.a = v24;
    *(_OWORD *)&v22.c = v25;
    *(_OWORD *)&v22.tdouble x = v26;
    CGAffineTransformInvert(&v23, &v22);
    float64x2_t v24 = *(float64x2_t *)&v23.a;
    long long v25 = *(_OWORD *)&v23.c;
    double v17 = v23.b * width + v23.d * height;
    double width = fabs(v23.a * width + v23.c * height);
    double height = fabs(v17);
    -[CALayer setPosition:](self, "setPosition:", v15, v16, v19, v21);
  }
  else
  {
    -[CALayer setPosition:](self, "setPosition:", x + v10 * width, y + v9 * height, 0, 0);
  }
  -[CALayer setBounds:](self, "setBounds:", v18, v20, width, height);
}

- (void)setBounds:(CGRect)bounds
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (bounds.size.width < 0.0 || bounds.size.height < 0.0) {
    bounds = CGRectStandardize(bounds);
  }
  layer = (CA::Layer *)self->_attr.layer;
  CGRect v5 = bounds;
  if (bounds.size.width < 0.0)
  {
    v5.origin.double x = bounds.size.width + bounds.origin.x;
    v5.size.double width = -bounds.size.width;
  }
  if (bounds.size.height < 0.0)
  {
    v5.origin.double y = bounds.size.height + bounds.origin.y;
    v5.size.double height = -bounds.size.height;
  }
  CA::Layer::set_bounds(layer, (const CA::Rect *)&v5);
}

- (void)setPosition:(CGPoint)position
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  layer = (double *)self->_attr.layer;
  CGPoint v4 = position;
  CA::Layer::set_position(layer, (uint64_t)&v4);
}

- (void)setNeedsLayout
{
  layer = (CA::Layer *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0) {
    goto LABEL_29;
  }
  CGPoint v4 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  unsigned int v5 = v4[25];
  v4[25] = v5 + 1;
  if (!v5) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v6 = v4[24];
  if ((v6 & 0x80000000) != 0 || (v7 = (_DWORD *)((char *)layer + 4 * v6), (int v8 = v7[68]) == 0))
  {
    double v9 = CA::Layer::thread_flags_(layer, (CA::Transaction *)v4);
    int v8 = *v9;
    if ((*v9 & 0x20) != 0) {
      goto LABEL_28;
    }
  }
  else
  {
    double v9 = v7 + 68;
    if ((v8 & 0x20) != 0) {
      goto LABEL_28;
    }
  }
  *double v9 = v8 | 0x20;
  CA::Layer::invalidate_layout((uint64_t)layer);
  double v10 = CA::Layer::retain_parent(layer, (CA::Transaction *)v4);
  if (!v10) {
    goto LABEL_28;
  }
  double v11 = (CA::Layer *)v10;
  while (1)
  {
    uint64_t v12 = v4[24];
    if ((v12 & 0x80000000) == 0)
    {
      uint64_t v13 = (char *)v11 + 4 * v12;
      int v14 = *((_DWORD *)v13 + 68);
      if (v14) {
        break;
      }
    }
    double v15 = CA::Layer::thread_flags_(v11, (CA::Transaction *)v4);
    int v14 = *v15;
    if ((*v15 & 0x40) != 0) {
      goto LABEL_24;
    }
LABEL_16:
    int *v15 = v14 | 0x40;
    CA::Layer::invalidate_layout((uint64_t)v11);
    CGAffineTransform v22 = CA::Layer::retain_parent(v11, (CA::Transaction *)v4);
    while (1)
    {
      int v16 = *(_DWORD *)v11;
      if (!*(_DWORD *)v11) {
        break;
      }
      int v17 = *(_DWORD *)v11;
      atomic_compare_exchange_strong((atomic_uint *volatile)v11, (unsigned int *)&v17, v16 - 1);
      if (v17 == v16)
      {
        if (v16 == 1)
        {
          CA::Layer::destroy(v11);
          CA::Layer::~Layer((CA::AttrList **)v11);
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          malloc_zone_free(malloc_zone, v11);
        }
        break;
      }
    }
    double v11 = (CA::Layer *)v22;
    if (!v22) {
      goto LABEL_28;
    }
  }
  double v15 = (int *)(v13 + 272);
  if ((v14 & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_24:
  while (1)
  {
    int v20 = *(_DWORD *)v11;
    if (!*(_DWORD *)v11) {
      break;
    }
    int v19 = *(_DWORD *)v11;
    atomic_compare_exchange_strong((atomic_uint *volatile)v11, (unsigned int *)&v19, v20 - 1);
    if (v19 == v20)
    {
      if (v20 == 1)
      {
        CA::Layer::destroy(v11);
        CA::Layer::~Layer((CA::AttrList **)v11);
        uint64_t v21 = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(v21, v11);
      }
      break;
    }
  }
LABEL_28:
  CA::Transaction::unlock((CA::Transaction *)v4);
LABEL_29:
  if (BYTE3(xmmword_1EB2ACC30) | BYTE4(xmmword_1EB2ACC30))
  {
    [(CALayer *)self _saveCurrentLayoutHash];
  }
}

- (BOOL)needsDisplayOnBoundsChange
{
  return *((unsigned __int8 *)self->_attr.layer + 48) >> 7;
}

- (BOOL)needsLayoutOnGeometryChange
{
  return *((unsigned char *)self->_attr.layer + 49) & 1;
}

- (BOOL)_defersDidBecomeVisiblePostCommit
{
  return 0;
}

+ (id)defaultActionForKey:(NSString *)event
{
  return 0;
}

- (CGPoint)anchorPoint
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  layer = self->_attr.layer;
  *(_OWORD *)double v7 = 0uLL;
  int v3 = *((_DWORD *)layer + 14);
  if ((v3 & 8) != 0)
  {
    if ((v3 & 0x10) != 0)
    {
      *(_OWORD *)double v7 = *MEMORY[0x1E4F1DAD8];
    }
    else
    {
      uint64_t v4 = *((void *)layer + 9);
      if (v4) {
        CA::AttrList::get(v4, 27, (const CGAffineTransform *)0x13, (CA::Mat4Impl *)v7);
      }
    }
  }
  else
  {
    CA::Layer::default_value((id *)layer, 0x1Bu, (const CGAffineTransform *)0x13, (uint64_t)v7);
  }
  double v6 = v7[1];
  double v5 = v7[0];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)setNeedsDisplayInRect:(CGRect)r
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  layer = self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    double height = r.size.height;
    double width = r.size.width;
    CGFloat y = r.origin.y;
    CGFloat x = r.origin.x;
    double v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    int v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    if (width != 0.0 && height != 0.0)
    {
      uint64_t v8 = (void *)*((void *)layer + 2);
      double v9 = (const void *)[v8 contents];
      uint64_t v10 = (uint64_t)v9;
      if (v9)
      {
        CFTypeID v11 = CFGetTypeID(v9);
        if (CABackingStoreGetTypeID::once[0] != -1)
        {
          CFTypeID v16 = v11;
          dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
          CFTypeID v11 = v16;
        }
        if (v11 == CABackingStoreGetTypeID::type)
        {
          v12.f64[0] = x;
          v12.f64[1] = y;
          float64x2_t v19 = vsubq_f64(v12, *((float64x2_t *)layer + 6));
          float64x2_t v20 = v19;
          double v21 = width;
          double v22 = height;
          if (*((unsigned char *)layer + 56))
          {
            [v8 contentsScale];
            float64x2_t v20 = vmulq_n_f64(v19, v13);
            double width = width * v13;
            double height = height * v13;
            double v21 = width;
            double v22 = height;
          }
          if (height <= 1.00000002e30 && width <= 1.00000002e30) {
            double v15 = &v20;
          }
          else {
            double v15 = 0;
          }
          CABackingStoreInvalidate(v10, (uint64_t)v15);
        }
      }
    }
    CA::Layer::mark((CA::Layer *)layer, v6, 256, 512);
    CA::Transaction::unlock(v6);
  }
}

- (void)setNeedsDisplay
{
}

- (CGAffineTransform)affineTransform
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)(*(void *)&self->c + 55) & 0x10) == 0) {
    goto LABEL_4;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  [(CGAffineTransform *)self transform];
  self = (CGAffineTransform *)CA::Mat4Impl::mat4_is_affine((CA::Mat4Impl *)v9, v4);
  if (self)
  {
    long long v5 = v10;
    *(_OWORD *)&retstr->a = v9[0];
    *(_OWORD *)&retstr->c = v5;
    long long v6 = v14;
  }
  else
  {
LABEL_4:
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v8;
    long long v6 = *(_OWORD *)(v7 + 32);
  }
  *(_OWORD *)&retstr->tCGFloat x = v6;
  return self;
}

- (void)setContentsChanged
{
  int v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  CA::Layer::property_did_change((id *)self->_attr.layer, v3, 119);

  CA::Transaction::unlock(v3);
}

- (CATransform3D)transform
{
  CGPoint result = (CATransform3D *)self->_attr.layer;
  if ((HIBYTE(result->m23) & 0x10) != 0)
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
    CA::Layer::getter((CA::Transaction *)result, 0x238u, (const CGAffineTransform *)0x16, (id *)retstr);
  }
  else
  {
    *retstr = CATransform3DIdentity;
  }
  return result;
}

- (CALayer)superlayer
{
  layer = (CA::Layer *)self->_attr.layer;
  int v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    int v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }

  return CA::Layer::superlayer(layer, v3);
}

- (void)setSizeRequisition:(CGSize)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x202, (const CGAffineTransform *)0x14, &v3.width);
}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)needsDisplayOnBoundsChange
{
}

- (void)setWantsExtendedDynamicRangeContent:(BOOL)wantsExtendedDynamicRangeContent
{
}

- (void)setContentsAlignsToPixels:(BOOL)a3
{
}

- (void)layoutBelowIfNeeded
{
  CGSize v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::layout_if_needed(layer, v3);
}

- (void)setContentsTransform:(CGAffineTransform *)a3
{
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  __int16 v5 = a4;
  uint64_t v322 = *MEMORY[0x1E4F143B8];
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  double v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
  uint64_t v11 = (uint64_t)v9;
  if (v9)
  {
    _OWORD v9[2] = 1;
    ++dword_1EB2ADE3C;
    *(void *)double v9 = &unk_1ED02F440;
    *((void *)v9 + 2) = 0;
    *((void *)v9 + 3) = 0;
    v9[8] = 16843007;
    v9[9] = v9[9] & 0x80000000 | 0xF9F11;
    *((void *)v9 + 5) = *((void *)v9 + 5) & 0xFFFF800000000000 | 0x1030C0004C00;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((_OWORD *)v9 + 5) = 0u;
    *((void *)v9 + 12) = 0;
    *((_OWORD *)v9 + 7) = 0u;
    *((_OWORD *)v9 + 8) = 0u;
    *((void *)v9 + 18) = 0;
    int v12 = 29;
  }
  else
  {
    int v12 = MEMORY[0xC];
  }
  v9[3] = v12 | 0x200;
  layer = (unsigned int *)self->_attr.layer;
  if ((v5 & 8) == 0)
  {
    int v14 = 0;
    long long v15 = a5;
LABEL_390:
    unsigned int *v15 = v14;
    goto LABEL_391;
  }
  if ((layer[10] & 2) != 0)
  {
    uint64_t v16 = CA::Layer::sublayers((CA::Layer *)self->_attr.layer);
    if (v16)
    {
      int v17 = v16;
      double v18 = (CA::Render::Array *)*((void *)v16 + 2);
      float64x2_t v19 = CA::Render::Array::new_array(v18, 0, 0, 1);
      if (v19)
      {
        float64x2_t v20 = v19;
        double v21 = (void *)((char *)v17 + 8);
        v304 = a3;
        if (v21[1] != 1 || v21[2]) {
          double v21 = (void *)*v21;
        }
        if (v18)
        {
          double v22 = 0;
          dispatch_once_t v23 = CA::Render::Encoder::initialize_render_id_slide(void)::once[0];
          do
          {
            uint64_t v24 = *(void *)(v21[(void)v22] + 16);
            if (v23 != -1) {
              dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_13615);
            }
            uint64_t v25 = CA::Render::_render_id_slide + v24;
            if (!v24) {
              uint64_t v25 = 0;
            }
            *(void *)&v20[2 * v22 + 6] = v25;
            double v22 = (CA::Render::Array *)((char *)v22 + 1);
            dispatch_once_t v23 = -1;
          }
          while (v18 != v22);
        }
        CA::Render::Layer::set_sublayers(v11, v20);
        a3 = v304;
        if (atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
        }
      }
    }
  }
  if ((layer[10] & 4) != 0)
  {
    long long v26 = CA::Layer::mask((CA::Layer *)self->_attr.layer);
    if (v26)
    {
      uint64_t v27 = (char *)v26->_attr.layer;
      if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1) {
        dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_13615);
      }
      if (v27) {
        CGRect v28 = (atomic_uint *)&v27[CA::Render::_render_id_slide];
      }
      else {
        CGRect v28 = 0;
      }
      CA::Render::Layer::set_mask((CA::Render::Layer *)v11, v28);
    }
    *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)layer[12] >> 19) & 1) << 7);
  }
  v29 = (CGImage *)CA::Context::current_colorspace((CA::Context *)a3, v10);
  uint64_t v30 = CAGetColorSpace(0x1Du);
  v31 = [(CALayer *)self contents];
  int v33 = v5 & 0x400;
  if (v33 | layer[10] & 1)
  {
    v34 = v31;
    if (v31)
    {
      CFTypeID v35 = CFGetTypeID(v31);
      if (v35 == CGImageGetTypeID())
      {
        v36 = (CGColorSpace *)[(CALayer *)self _renderImageCopyFlags];
        layer[13] = (layer[13] & 0xFF9FFFFF | ((v36 & 1) << 21) & 0xFFBFFFFF | (((v36 >> 8) & 1) << 22)) ^ 0x400000;
        v37 = (atomic_uint *)CA::Render::copy_image(v34, v29, v36, 0.0, 1.0);
      }
      else
      {
        v37 = (atomic_uint *)[(CA::Render *)v34 CA_copyRenderValue];
      }
      v38 = v37;
      if (v37)
      {
        if ((*((unsigned char *)layer + 57) & 2) != 0)
        {
          [(CALayer *)self contentsDirtyRect];
          long long v300 = v39;
          float64x2_t v301 = v40;
          uint64_t v302 = v41;
          uint64_t v303 = v42;
          if (!CGRectIsNull(*(CGRect *)&v39))
          {
            unsigned int v44 = *((unsigned __int8 *)v38 + 12);
            if (v44 <= 0x33 && ((1 << v44) & 0x8000000800200) != 0)
            {
              v45.i64[0] = v300;
              v45.i64[1] = v302;
              v43.f64[0] = 0.0;
              v46.i64[0] = *(void *)&v301.f64[0];
              v46.i64[1] = v303;
              int8x16_t v47 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v43, v301).i64[0], 0);
              v48.i64[1] = v302;
              *(double *)v48.i64 = v301.f64[0] + *(double *)&v300;
              float64x2_t v49 = (float64x2_t)vbslq_s8(v47, v48, v45);
              v48.i64[1] = v303;
              *(double *)v48.i64 = -v301.f64[0];
              float64x2_t v50 = (float64x2_t)vbslq_s8(v47, v48, v46);
              if (*(double *)&v303 < 0.0)
              {
                v49.f64[1] = *(double *)&v303 + *(double *)&v302;
                v50.f64[1] = -*(double *)&v303;
              }
              int64x2_t v51 = vceqzq_f64(v50);
              if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v51, 1), (int8x16_t)v51).u64[0] & 0x8000000000000000) != 0
                || (int8x16_t v52 = vorrq_s8((int8x16_t)vcltzq_f64(v50), (int8x16_t)vcgezq_f64(v50)),
                    (vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v52), 1), v52).u64[0] & 0x8000000000000000) != 0))
              {
                memset(buf, 0, sizeof(buf));
              }
              else
              {
                float64x2_t v53 = vmaxnmq_f64(v49, (float64x2_t)vdupq_n_s64(0xC1BFFFFFFF000000));
                float64x2_t v54 = vminnmq_f64(vaddq_f64(v49, v50), (float64x2_t)vdupq_n_s64(0x41C0000000000000uLL));
                int32x4_t v55 = (int32x4_t)vcvtmq_s64_f64(v53);
                *(int32x4_t *)buf = vuzp1q_s32(v55, (int32x4_t)vsubq_s64(vcvtpq_s64_f64(v54), (int64x2_t)v55));
              }
              v56 = (CA::Shape *)CA::Shape::new_shape((unsigned int *)buf);
              CA::Render::Texture::set_dirty_shape((CA::Render::Texture *)v38, v56);
              CA::Shape::unref(v56);
            }
          }
          layer[14] &= ~0x200u;
          v57 = (CA::AttrList *)*((void *)layer + 9);
          if (v57) {
            v57 = CA::AttrList::remove(v57, (const void *)0x7B);
          }
          *((void *)layer + 9) = v57;
        }
        CA::Render::Layer::set_contents((CA::Render::Layer *)v11, (CA::Render::Object *)v38);
        if (atomic_fetch_add(v38 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v38 + 16))(v38);
        }
      }
    }
  }
  if ((*((unsigned char *)layer + 42) & 8) != 0)
  {
    if ((layer[14] & 4) != 0)
    {
      [(CALayer *)self cornerContentsCenter];
      *(double *)v62.i64 = v61;
      v62.i64[1] = v59;
      v63.f64[0] = 0.0;
      v65.i64[0] = *(void *)&v64.f64[0];
      v65.i64[1] = v60;
      int8x16_t v66 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v63, v64).i64[0], 0);
      v67.i64[1] = v59;
      *(double *)v67.i64 = v64.f64[0] + v61;
      float64x2_t v68 = (float64x2_t)vbslq_s8(v66, v67, v62);
      v62.i64[1] = v60;
      *(double *)v62.i64 = -v64.f64[0];
      float64x2_t v69 = (float64x2_t)vbslq_s8(v66, v62, v65);
      if (*(double *)&v60 < 0.0)
      {
        v68.f64[1] = *(double *)&v60 + *(double *)&v59;
        v69.f64[1] = -*(double *)&v60;
      }
      *(float64x2_t *)buf = v68;
      float64x2_t v315 = vaddq_f64(v69, v68);
      v70 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, buf, v58);
      CA::Render::Layer::set_corner_contents_center(v11, (CA::Render::Vector *)v70);
      if (v70 && atomic_fetch_add(v70 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v70 + 16))(v70);
      }
    }
    v71 = [(CALayer *)self cornerContents];
    v72 = v71;
    if (v71)
    {
      CFTypeID v73 = CFGetTypeID(v71);
      if (v73 == CGImageGetTypeID())
      {
        v74 = (atomic_uint *)CA::Render::copy_image(v72, 0, (CGColorSpace *)2, 0.0, 1.0);
        CA::Render::Layer::set_corner_contents(v11, (CA::Render::Object *)v74);
        if (atomic_fetch_add(v74 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v74 + 16))(v74);
        }
      }
      else if (x_log_hook_p())
      {
        x_log_();
      }
      else
      {
        v75 = x_log_category_api;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184668000, v75, OS_LOG_TYPE_DEFAULT, "cornerContents must be a CGImageRef for now!\n", buf, 2u);
        }
      }
    }
  }
  if ((*((unsigned char *)layer + 41) & 0x40) != 0)
  {
    CFArrayRef v76 = (const __CFArray *)*((void *)self->_attr.layer + 36);
    if (v76)
    {
      v77 = CA::Render::copy_render_array(v76, 42);
      CA::Render::Layer::set_modifiers(v11, (uint64_t)v77);
      if (v77)
      {
        if (atomic_fetch_add(v77 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v77 + 16))(v77);
        }
      }
    }
  }
  if ((layer[10] & 8) != 0)
  {
    *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)layer[12] >> 5) & 1) << 8);
    *(_OWORD *)(v11 + 48) = *((_OWORD *)layer + 5);
    if ((*((unsigned char *)layer + 55) & 8) != 0)
    {
      [(CALayer *)self opacity];
      if (v78 > 1.0) {
        float v78 = 1.0;
      }
      if (v78 >= 0.0) {
        float v79 = (float)(v78 * 255.0) + 0.5;
      }
      else {
        float v79 = 0.5;
      }
      *(unsigned char *)(v11 + 32) = (int)v79;
    }
    if ((layer[14] & 0x40) != 0)
    {
      [(CALayer *)self zPosition];
      if (v80 != 0.0) {
        *((double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 24) = v80;
      }
    }
  }
  if ((layer[10] & 0x10) != 0)
  {
    unint64_t v81 = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)layer[12] >> 9) & 1) << 6);
    *(void *)(v11 + 40) = v81;
    unint64_t v82 = v81 & 0xFFFFFFFFFFFFFDFFLL | ((((unint64_t)layer[12] >> 11) & 1) << 9);
    *(void *)(v11 + 40) = v82;
    unint64_t v83 = v82 & 0xFFFFFFFFFFFFF7FFLL | ((((unint64_t)layer[12] >> 26) & 1) << 11);
    *(void *)(v11 + 40) = v83;
    unint64_t v84 = v83 & 0xFFFFFFFFFFFFEFFFLL | ((((unint64_t)layer[12] >> 27) & 1) << 12);
    *(void *)(v11 + 40) = v84;
    unint64_t v85 = v84 & 0xFFFFFFFFFFFDFFFFLL | ((((unint64_t)layer[13] >> 12) & 1) << 17);
    *(void *)(v11 + 40) = v85;
    *(void *)(v11 + 40) = v85 & 0xFFFFFFFFFFFFDFFFLL | ((((unint64_t)layer[12] >> 28) & 1) << 13);
    *(_OWORD *)(v11 + 64) = *((_OWORD *)layer + 6);
    *(_OWORD *)(v11 + 80) = *((_OWORD *)layer + 7);
    unsigned int v86 = layer[14];
    if ((v86 & 8) != 0)
    {
      [(CALayer *)self anchorPoint];
      *(void *)buf = v87;
      *(void *)&buf[8] = v88;
      CA::Render::Layer::set_anchor_point((void *)v11, (uint64_t)buf);
      unsigned int v86 = layer[14];
    }
    if ((v86 & 0x20) != 0)
    {
      [(CALayer *)self anchorPointZ];
      if (v89 != 0.0 || *(void *)(v11 + 128)) {
        *((double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 23) = v89;
      }
      unsigned int v86 = layer[14];
    }
    if (v86)
    {
      [(CALayer *)self contentsScale];
      float v91 = v90;
      if (v91 != 1.0) {
        CA::Render::Layer::set_contents_scale((void *)v11, v91);
      }
    }
  }
  if ((layer[10] & 0x20) != 0 && (*((unsigned char *)layer + 55) & 0x10) != 0)
  {
    if (self)
    {
      [(CALayer *)self transform];
      long long v93 = v306;
      float64x2_t v92 = v307;
      long long v95 = v308;
      long long v94 = v309;
      long long v97 = v310;
      long long v96 = v311;
      long long v99 = v312;
      long long v98 = v313;
    }
    else
    {
      long long v98 = 0uLL;
      long long v312 = 0u;
      long long v313 = 0u;
      long long v99 = 0uLL;
      long long v310 = 0u;
      long long v311 = 0u;
      long long v308 = 0u;
      long long v309 = 0u;
      long long v96 = 0uLL;
      long long v97 = 0uLL;
      long long v94 = 0uLL;
      long long v95 = 0uLL;
      float64x2_t v92 = 0uLL;
      long long v93 = 0uLL;
      long long v306 = 0u;
      float64x2_t v307 = 0u;
    }
    *(_OWORD *)buf = v93;
    float64x2_t v315 = v92;
    long long v316 = v95;
    long long v317 = v94;
    long long v318 = v97;
    long long v319 = v96;
    long long v320 = v99;
    long long v321 = v98;
    v100 = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, buf, v32);
    CA::Render::Layer::set_transform(v11, (CA::Render::Vector *)v100);
    if (v100)
    {
      if (atomic_fetch_add(v100 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v100 + 16))(v100);
      }
    }
  }
  if ((layer[10] & 0x40) != 0 && (*((unsigned char *)layer + 55) & 0x20) != 0)
  {
    if (self)
    {
      [(CALayer *)self sublayerTransform];
      long long v102 = v306;
      float64x2_t v101 = v307;
      long long v104 = v308;
      long long v103 = v309;
      long long v106 = v310;
      long long v105 = v311;
      long long v108 = v312;
      long long v107 = v313;
    }
    else
    {
      long long v107 = 0uLL;
      long long v312 = 0u;
      long long v313 = 0u;
      long long v108 = 0uLL;
      long long v310 = 0u;
      long long v311 = 0u;
      long long v308 = 0u;
      long long v309 = 0u;
      long long v105 = 0uLL;
      long long v106 = 0uLL;
      long long v103 = 0uLL;
      long long v104 = 0uLL;
      float64x2_t v101 = 0uLL;
      long long v102 = 0uLL;
      long long v306 = 0u;
      float64x2_t v307 = 0u;
    }
    *(_OWORD *)buf = v102;
    float64x2_t v315 = v101;
    long long v316 = v104;
    long long v317 = v103;
    long long v318 = v106;
    long long v319 = v105;
    long long v320 = v108;
    long long v321 = v107;
    v109 = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, buf, v32);
    CA::Render::Layer::set_sublayer_transform(v11, (CA::Render::Vector *)v109);
    if (v109)
    {
      if (atomic_fetch_add(v109 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v109 + 16))(v109);
      }
    }
  }
  if ((layer[10] & 0x80) != 0 && (layer[14] & 2) != 0)
  {
    if (self)
    {
      [(CALayer *)self contentsTransform];
      long long v111 = v306;
      float64x2_t v110 = v307;
      long long v112 = v308;
    }
    else
    {
      long long v112 = 0uLL;
      float64x2_t v307 = 0u;
      long long v308 = 0u;
      long long v306 = 0u;
      float64x2_t v110 = 0uLL;
      long long v111 = 0uLL;
    }
    *(_OWORD *)buf = v111;
    float64x2_t v315 = v110;
    long long v316 = v112;
    v113 = CA::Render::Vector::new_vector((CA::Render::Vector *)6, buf, v32);
    CA::Render::Layer::set_contents_transform(v11, (CA::Render::Vector *)v113);
    if (v113)
    {
      if (atomic_fetch_add(v113 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v113 + 16))(v113);
      }
    }
  }
  if ((*((unsigned char *)layer + 41) & 1) != 0 && (layer[13] & 0x80000000) != 0)
  {
    [(CALayer *)self contentsRect];
    *(double *)v141.i64 = v140;
    v141.i64[1] = v138;
    v142.f64[0] = 0.0;
    v144.i64[0] = *(void *)&v143.f64[0];
    v144.i64[1] = v139;
    int8x16_t v145 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v142, v143).i64[0], 0);
    v146.i64[1] = v138;
    *(double *)v146.i64 = v143.f64[0] + v140;
    float64x2_t v147 = (float64x2_t)vbslq_s8(v145, v146, v141);
    v141.i64[1] = v139;
    *(double *)v141.i64 = -v143.f64[0];
    float64x2_t v148 = (float64x2_t)vbslq_s8(v145, v141, v144);
    if (*(double *)&v139 < 0.0)
    {
      v147.f64[1] = *(double *)&v139 + *(double *)&v138;
      v148.f64[1] = -*(double *)&v139;
    }
    *(float64x2_t *)buf = v147;
    float64x2_t v315 = vaddq_f64(v148, v147);
    v149 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, buf, v137);
    CA::Render::Layer::set_contents_rect(v11, (CA::Render::Vector *)v149);
    if (v149 && atomic_fetch_add(v149 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v149 + 16))(v149);
    }
  }
  if ((*((unsigned char *)layer + 42) & 2) != 0 && (*((unsigned char *)layer + 55) & 0x40) != 0)
  {
    [(CALayer *)self contentsCenter];
    *(double *)v118.i64 = v117;
    v118.i64[1] = v115;
    v119.f64[0] = 0.0;
    v121.i64[0] = *(void *)&v120.f64[0];
    v121.i64[1] = v116;
    int8x16_t v122 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v119, v120).i64[0], 0);
    v123.i64[1] = v115;
    *(double *)v123.i64 = v120.f64[0] + v117;
    float64x2_t v124 = (float64x2_t)vbslq_s8(v122, v123, v118);
    v118.i64[1] = v116;
    *(double *)v118.i64 = -v120.f64[0];
    float64x2_t v125 = (float64x2_t)vbslq_s8(v122, v118, v121);
    if (*(double *)&v116 < 0.0)
    {
      v124.f64[1] = *(double *)&v116 + *(double *)&v115;
      v125.f64[1] = -*(double *)&v116;
    }
    *(float64x2_t *)buf = v124;
    float64x2_t v315 = vaddq_f64(v125, v124);
    v126 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, buf, v114);
    CA::Render::Layer::set_contents_center(v11, (CA::Render::Vector *)v126);
    if (v126 && atomic_fetch_add(v126 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v126 + 16))(v126);
    }
  }
  unsigned int v127 = layer[10];
  if ((v127 & 0x1000) != 0)
  {
    *(void *)buf = 0;
    CA::Layer::render_timing((uint64_t)buf, (CA::Transaction *)self->_attr.layer, (CA::Transaction *)a3);
    v128 = *(atomic_uint **)buf;
    CA::Render::Layer::set_timing(v11, *(CA::Render::Timing **)buf);
    if (v128 && atomic_fetch_add(v128 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v128 + 16))(v128);
    }
    unsigned int v127 = layer[10];
  }
  if ((v127 & 0x200) != 0)
  {
    v129 = [(CALayer *)self filters];
    if (v129)
    {
      v130 = CA::Render::copy_render_array((const __CFArray *)v129, 17);
      CA::Render::Layer::set_filters(v11, (uint64_t)v130);
      if (v130)
      {
        if (atomic_fetch_add(v130 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v130 + 16))(v130);
        }
      }
    }
  }
  if ((*((unsigned char *)layer + 41) & 4) != 0)
  {
    v131 = [(CALayer *)self backgroundFilters];
    if (v131)
    {
      v132 = CA::Render::copy_render_array((const __CFArray *)v131, 17);
      CA::Render::Layer::set_background_filters(v11, (uint64_t)v132);
      if (v132)
      {
        if (atomic_fetch_add(v132 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v132 + 16))(v132);
        }
      }
    }
  }
  if ((*((unsigned char *)layer + 41) & 8) != 0)
  {
    v133 = [(CALayer *)self compositingFilter];
    if (v133)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v134 = (CA::Render::Filter *)CAInternAtom(v133, 0);
        v135 = CA::Render::Filter::shared_filter(v134);
        if (!v135) {
          goto LABEL_158;
        }
        uint64_t v136 = (uint64_t)v135;
        if (!atomic_fetch_add((atomic_uint *volatile)v135 + 2, 1u))
        {
          atomic_fetch_add((atomic_uint *volatile)v135 + 2, 0xFFFFFFFF);
          goto LABEL_158;
        }
      }
      else
      {
        uint64_t v136 = [(__CFString *)v133 CA_copyRenderValue];
        if (!v136) {
          goto LABEL_158;
        }
      }
      if (*(unsigned char *)(v136 + 12) == 17) {
        CA::Render::Layer::set_compositing_filter(v11, (CA::Render::Filter *)v136);
      }
      if (atomic_fetch_add((atomic_uint *volatile)(v136 + 8), 0xFFFFFFFF) == 1) {
        (*(void (**)(uint64_t))(*(void *)v136 + 16))(v136);
      }
    }
  }
LABEL_158:
  if ((*((unsigned char *)layer + 42) & 4) != 0)
  {
    v150 = [(CALayer *)self meshTransform];
    if (v150)
    {
      uint64_t v151 = [(CAMeshTransform *)v150 CA_copyRenderValue];
      v152 = (atomic_uint *)v151;
      if (v151)
      {
        if (*(unsigned char *)(v151 + 12) == 33) {
          CA::Render::Layer::set_mesh_transform(v11, (os_unfair_lock_s *)v151);
        }
        if (atomic_fetch_add(v152 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v152 + 16))(v152);
        }
      }
    }
  }
  if ((*((unsigned char *)layer + 42) & 0x10) != 0)
  {
    id v153 = CA::Layer::identifiers((CA::Layer *)self->_attr.layer);
    if (v153)
    {
      v154 = CA::Render::copy_render_array((const __CFArray *)[v153 allObjects], 49);
      CA::Render::Layer::set_identifiers(v11, (uint64_t)v154);
      if (v154)
      {
        if (atomic_fetch_add(v154 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v154 + 16))(v154);
        }
      }
    }
  }
  unsigned int v155 = layer[10];
  if ((v155 & 0x8000) != 0)
  {
    [(CALayer *)self backgroundColorPhase];
    double v158 = v157;
    double v159 = v156;
    if (v157 != *MEMORY[0x1E4F1DB30] || v156 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v160 = (double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11);
      v160[19] = v158;
      v160[20] = v159;
    }
    int v161 = *(_DWORD *)(v11 + 36);
    unint64_t v162 = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFBFFFLL | ((((unint64_t)layer[13] >> 11) & 1) << 14);
    *(void *)(v11 + 40) = v162;
    unint64_t v163 = v162 & 0xFFFFFFFFFFFEFFFFLL | ((((unint64_t)layer[13] >> 8) & 1) << 16);
    *(void *)(v11 + 40) = v163;
    *(_DWORD *)(v11 + 36) = v161 & 0xFFFF0FFF | (((layer[11] >> 3) & 0xF) << 12);
    unint64_t v164 = v163 & 0xFFFFFFFFFFFF7FFFLL | ((((unint64_t)layer[13] >> 10) & 1) << 15);
    *(void *)(v11 + 40) = v164;
    *(void *)(v11 + 40) = v164 & 0xFFFFFFFFFFFFFFCFLL | (16 * (((unint64_t)layer[12] >> 3) & 3));
    *(_DWORD *)(v11 + 36) = *(_DWORD *)(v11 + 36) & 0xFFFFFF0F | (16
                                                                * CA::Render::Layer::image_filter_from_string((const __CFString *)[(CALayer *)self magnificationFilter], 0));
    *(_DWORD *)(v11 + 36) = *(_DWORD *)(v11 + 36) & 0xFFFFFFF0 | CA::Render::Layer::image_filter_from_string((const __CFString *)[(CALayer *)self minificationFilter], (const __CFString *)1);
    [(CALayer *)self minificationFilterBias];
    if (v165 != 0.0) {
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 73) = v165;
    }
    CFStringRef v166 = [(CALayer *)self name];
    if (v166)
    {
      v168 = CA::Render::String::new_string(v166, v167);
      v169 = *(atomic_uint **)(v11 + 120);
      if (v169 != v168)
      {
        if (v169 && atomic_fetch_add(v169 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v169 + 16))(v169);
        }
        if (v168)
        {
          v170 = v168;
          if (!atomic_fetch_add(v168 + 2, 1u))
          {
            v170 = 0;
            atomic_fetch_add(v168 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v170 = 0;
        }
        *(void *)(v11 + 120) = v170;
      }
      if (v168 && atomic_fetch_add(v168 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v168 + 16))(v168);
      }
    }
    v171 = [(CALayer *)self backgroundColor];
    if (!v171) {
      goto LABEL_209;
    }
    *(void *)&long long v306 = 0;
    memset(buf, 0, sizeof(buf));
    CA::Render::convert_cgcolor_to_float(v171, v29, (CGColorSpace *)buf, (float *)&v306, v172);
    long long v173 = *(_OWORD *)buf;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(*(float32x4_t *)buf))))) & 1) == 0)
    {
LABEL_199:
      v176 = (atomic_uint *)v306;
      if ((void)v306)
      {
        v177 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11);
        v178 = (atomic_uint *)v177[10];
        if (v178 != v176)
        {
          if (v178 && atomic_fetch_add(v178 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v178 + 16))(v178);
          }
          v179 = v176 + 2;
          if (!atomic_fetch_add(v176 + 2, 1u))
          {
            v176 = 0;
            atomic_fetch_add(v179, 0xFFFFFFFF);
          }
          v177[10] = v176;
        }
        uint64_t v180 = v306;
        if (atomic_fetch_add((atomic_uint *volatile)(v306 + 8), 0xFFFFFFFF) == 1) {
          (*(void (**)(uint64_t))(*(void *)v180 + 16))(v180);
        }
      }
LABEL_209:
      unsigned int v181 = layer[11];
      if (((v181 >> 7) & 0xF) != 0xF)
      {
        *(_DWORD *)(v11 + 36) = *(_DWORD *)(v11 + 36) & 0xFFFFF0FF | (((v181 >> 7) & 0xF) << 8);
        unsigned int v181 = layer[11];
      }
      if (((v181 >> 11) & 0xF) != 0xF)
      {
        *(_DWORD *)(v11 + 36) = *(_DWORD *)(v11 + 36) & 0xFFF0FFFF | (((v181 >> 11) & 0xF) << 16);
        unsigned int v181 = layer[11];
      }
      if (((v181 >> 15) & 0x7FF) != 0)
      {
        *(_DWORD *)(v11 + 36) = *(_DWORD *)(v11 + 36) & 0x800FFFFF | (((v181 >> 15) & 0x7FF) << 20);
        unsigned int v181 = layer[11];
      }
      if (v181 >> 30) {
        *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFFF3 | (v181 >> 28) & 0xC;
      }
      [(CALayer *)self cornerRadius];
      if (v183 != 0.0)
      {
        float v184 = v183;
        float v185 = v184 >= 0.0 ? v184 : 0.0;
        if (v185 != 0.0 || *(void *)(v11 + 128)) {
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 57) = v185;
        }
      }
      if (*((unsigned char *)layer + 59))
      {
        long long v186 = 0uLL;
        long long v316 = 0u;
        long long v317 = 0u;
        *(_OWORD *)buf = 0u;
        float64x2_t v315 = 0u;
        float64x2_t v187 = 0uLL;
        long long v188 = 0uLL;
        long long v189 = 0uLL;
        if (self)
        {
          [(CALayer *)self cornerRadii];
          long long v186 = *(_OWORD *)buf;
          float64x2_t v187 = v315;
          long long v188 = v316;
          long long v189 = v317;
        }
        long long v306 = v186;
        float64x2_t v307 = v187;
        long long v308 = v188;
        long long v309 = v189;
        v190 = CA::Render::Vector::new_vector((CA::Render::Vector *)8, &v306, v182);
        CA::Render::Layer::set_corner_radii(v11, (CA::Render::Vector *)v190);
        if (v190 && atomic_fetch_add(v190 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v190 + 16))(v190);
        }
      }
      v191 = (unint64_t *)(v11 + 40);
      *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFFFCLL | ((unint64_t)layer[12] >> 1) & 3;
      BOOL v192 = [(CALayer *)self cornerContentsMasksEdges];
      uint64_t v193 = 0x20000000000;
      if (!v192) {
        uint64_t v193 = 0;
      }
      unint64_t *v191 = *v191 & 0xFFFFFDFFFFFFFFFFLL | v193;
      BOOL v194 = [(CALayer *)self contentsContainsSubtitles];
      uint64_t v195 = 0x80000000000;
      if (!v194) {
        uint64_t v195 = 0;
      }
      unint64_t *v191 = *v191 & 0xFFFFF7FFFFFFFFFFLL | v195;
      [(CALayer *)self gain];
      if (v196 != 1.0 || *(void *)(v11 + 128)) {
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 74) = v196;
      }
      [(CALayer *)self contentsEDRStrength];
      float v198 = v197;
      if (v198 != 1.0 || *(void *)(v11 + 128)) {
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 64) = v198;
      }
      [(CALayer *)self contentsMaximumDesiredEDR];
      float v200 = v199;
      if (v200 != 0.0 || *(void *)(v11 + 128)) {
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 65) = v200;
      }
      [(CALayer *)self displayMaximumDesiredEDR];
      float v202 = v201;
      if (v202 != 0.0 || *(void *)(v11 + 128)) {
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 66) = v202;
      }
      [(CALayer *)self borderWidth];
      if (v203 > 0.0)
      {
        float v204 = v203;
        if (v204 > 0.0 || *(void *)(v11 + 128)) {
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 59) = v204;
        }
      }
      [(CALayer *)self borderOffset];
      if (v205 != 0.0)
      {
        float v206 = v205;
        if (v206 != 0.0 || *(void *)(v11 + 128)) {
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 58) = v206;
        }
      }
      v207 = [(CALayer *)self borderColor];
      if (v207 && (v207 != (CGColor *)black || v29 != (CGImage *)v30))
      {
        *(void *)&long long v306 = 0;
        memset(buf, 0, sizeof(buf));
        CA::Render::convert_cgcolor_to_float(v207, v29, (CGColorSpace *)buf, (float *)&v306, v208);
        if (fabsf(*(float *)buf) >= 0.00097656
          || fabsf(*(float *)&buf[4]) >= 0.00097656
          || fabsf(*(float *)&buf[8]) >= 0.00097656
          || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
        {
          CA::Render::Layer::set_border_color((CA::Render::Layer *)v11, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
        }
        v209 = (atomic_uint *)v306;
        if ((void)v306)
        {
          v210 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11);
          v211 = (atomic_uint *)v210[16];
          if (v211 != v209)
          {
            if (v211 && atomic_fetch_add(v211 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v211 + 16))(v211);
            }
            v212 = v209 + 2;
            if (!atomic_fetch_add(v209 + 2, 1u))
            {
              v209 = 0;
              atomic_fetch_add(v212, 0xFFFFFFFF);
            }
            v210[16] = v209;
          }
          uint64_t v213 = v306;
          if (atomic_fetch_add((atomic_uint *volatile)(v306 + 8), 0xFFFFFFFF) == 1) {
            (*(void (**)(uint64_t))(*(void *)v213 + 16))(v213);
          }
        }
      }
      v214 = [(CALayer *)self contentsMultiplyColor];
      if (v214 && (v214 != (CGColor *)white || v29 != (CGImage *)v30))
      {
        memset(buf, 0, sizeof(buf));
        CA::Render::convert_cgcolor_to_float(v214, v29, (CGColorSpace *)buf, 0, v215);
        if (fabsf(*(float *)buf + -1.0) >= 0.00097656
          || fabsf(*(float *)&buf[4] + -1.0) >= 0.00097656
          || fabsf(*(float *)&buf[8] + -1.0) >= 0.00097656
          || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
        {
          CA::Render::Layer::set_contents_multiply_color((CA::Render::Layer *)v11, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
        }
      }
      v216 = [(CALayer *)self contentsSwizzle];
      if (v216 != @"RGBA")
      {
        int v217 = [(__CFString *)v216 isEqualToString:@"AAAA"];
        if (((*(void *)(v11 + 128) == 0) & ~v217) == 0)
        {
          v218 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11);
          *((unsigned char *)v218 + 324) = *((unsigned char *)v218 + 324) & 0xFE | v217;
        }
      }
      BOOL v219 = [(CALayer *)self isDoubleSided];
      v220 = (unint64_t *)(v11 + 40);
      uint64_t v221 = 1024;
      if (!v219) {
        uint64_t v221 = 0;
      }
      unint64_t *v220 = *(void *)(v11 + 40) & 0xFFFFFFFFFFFFFBFFLL | v221;
      BOOL v222 = [(CALayer *)self shouldRasterize];
      uint64_t v223 = 0x40000;
      if (!v222) {
        uint64_t v223 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFFFBFFFFLL | v223;
      BOOL v224 = [(CALayer *)self shouldFlatten];
      uint64_t v225 = 0x80000;
      if (!v224) {
        uint64_t v225 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFFF7FFFFLL | v225;
      BOOL v226 = [(CALayer *)self shouldReflatten];
      uint64_t v227 = 0x100000;
      if (!v226) {
        uint64_t v227 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFFEFFFFFLL | v227;
      BOOL v228 = [(CALayer *)self rasterizationPrefersDisplayCompositing];
      uint64_t v229 = 0x200000;
      if (!v228) {
        uint64_t v229 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFFDFFFFFLL | v229;
      BOOL v230 = [(CALayer *)self rasterizationPrefersWindowServerAwareBackdrops];
      uint64_t v231 = 0x400000;
      if (!v230) {
        uint64_t v231 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFFBFFFFFLL | v231;
      BOOL v232 = [(CALayer *)self preloadsCache];
      uint64_t v233 = 0x800000;
      if (!v232) {
        uint64_t v233 = 0;
      }
      unint64_t *v220 = *v220 & 0xFFFFFFFFFF7FFFFFLL | v233;
      [(CALayer *)self rasterizationScale];
      if (v234 != 1.0)
      {
        float v235 = v234;
        CA::Render::Layer::set_rasterization_scale((void *)v11, v235);
      }
      BOOL v236 = [(CALayer *)self createsCompositingGroup];
      v237 = (unint64_t *)(v11 + 40);
      uint64_t v238 = 0x1000000;
      if (!v236) {
        uint64_t v238 = 0;
      }
      unint64_t *v237 = *(void *)(v11 + 40) & 0xFFFFFFFFFEFFFFFFLL | v238;
      BOOL v239 = [(CALayer *)self allowsEdgeAntialiasing];
      uint64_t v240 = 0x4000000;
      if (!v239) {
        uint64_t v240 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFFBFFFFFFLL | v240;
      BOOL v241 = [(CALayer *)self allowsGroupOpacity];
      uint64_t v242 = 0x20000000;
      if (!v241) {
        uint64_t v242 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFDFFFFFFFLL | v242;
      BOOL v243 = [(CALayer *)self allowsDisplayCompositing];
      uint64_t v244 = 0x2000000;
      if (!v243) {
        uint64_t v244 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFFDFFFFFFLL | v244;
      BOOL v245 = [(CALayer *)self wantsExtendedDynamicRangeContent];
      uint64_t v246 = 0x8000000;
      if (!v245) {
        uint64_t v246 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFF7FFFFFFLL | v246;
      BOOL v247 = [(CALayer *)self toneMapToStandardDynamicRange];
      uint64_t v248 = 0x10000000;
      if (!v247) {
        uint64_t v248 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFEFFFFFFFLL | v248;
      BOOL v249 = [(CALayer *)self allowsGroupBlending];
      uint64_t v250 = 0x40000000;
      if (!v249) {
        uint64_t v250 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFFBFFFFFFFLL | v250;
      BOOL v251 = [(CALayer *)self allowsHitTesting];
      uint64_t v252 = 0x80000000;
      if (!v251) {
        uint64_t v252 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFF7FFFFFFFLL | v252;
      BOOL v253 = [(CALayer *)self hitTestsContentsAlphaChannel];
      uint64_t v254 = 0x100000000;
      if (!v253) {
        uint64_t v254 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFFFEFFFFFFFFLL | v254;
      BOOL v255 = [(CALayer *)self hitTestsAsOpaque];
      uint64_t v256 = 0x8000000000;
      if (!v255) {
        uint64_t v256 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFF7FFFFFFFFFLL | v256;
      BOOL v257 = [(CALayer *)self literalContentsCenter];
      uint64_t v258 = 0x10000000000;
      if (!v257) {
        uint64_t v258 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFFEFFFFFFFFFFLL | v258;
      BOOL v259 = [(CALayer *)self inheritsTiming];
      uint64_t v260 = 0x100000000000;
      if (!v259) {
        uint64_t v260 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFEFFFFFFFFFFFLL | v260;
      BOOL v261 = [(CALayer *)self definesDisplayRegionOfInterest];
      uint64_t v262 = 0x200000000000;
      if (!v261) {
        uint64_t v262 = 0;
      }
      unint64_t *v237 = *v237 & 0xFFFFDFFFFFFFFFFFLL | v262;
      unsigned int v155 = layer[10];
      goto LABEL_326;
    }
    *(_OWORD *)(v11 + 16) = *(_OWORD *)buf;
    if (*((float *)&v173 + 2) == 0.0 && *(float *)&v173 == 0.0 && *((float *)&v173 + 1) == 0.0)
    {
      uint64_t v174 = *(void *)(v11 + 40);
      if (*((float *)&v173 + 3) == 0.0)
      {
        uint64_t v175 = 0;
LABEL_198:
        *(void *)(v11 + 40) = v175 | v174 & 0xFFFFFBFFFFFFFFFFLL;
        goto LABEL_199;
      }
    }
    else
    {
      uint64_t v174 = *(void *)(v11 + 40);
    }
    uint64_t v175 = 0x40000000000;
    goto LABEL_198;
  }
LABEL_326:
  if ((v155 & 0x2000) != 0)
  {
    [(CALayer *)self shadowOpacity];
    if (v263 > 1.0) {
      float v263 = 1.0;
    }
    if (v263 >= 0.0) {
      float v264 = (float)(v263 * 255.0) + 0.5;
    }
    else {
      float v264 = 0.5;
    }
    *(unsigned char *)(v11 + 33) = (int)v264;
    v265 = [(CALayer *)self shadowColor];
    if (v265 && (v265 != (CGColor *)black || v29 != (CGImage *)v30))
    {
      memset(buf, 0, sizeof(buf));
      CA::Render::convert_cgcolor_to_float(v265, v29, (CGColorSpace *)buf, 0, v266);
      if (fabsf(*(float *)buf) >= 0.00097656
        || fabsf(*(float *)&buf[4]) >= 0.00097656
        || fabsf(*(float *)&buf[8]) >= 0.00097656
        || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
      {
        CA::Render::Layer::set_shadow_color((CA::Render::Layer *)v11, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
      }
    }
    [(CALayer *)self shadowOffset];
    if (v267 != 0.0 || v268 != -3.0)
    {
      float v269 = v267;
      float v270 = v268;
      if (v269 != 0.0 || v270 != -3.0 || *(void *)(v11 + 128))
      {
        v271 = (float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11);
        v271[54] = v269;
        v271[55] = v270;
      }
    }
    [(CALayer *)self shadowRadius];
    float v273 = v272;
    if (v273 != 3.0) {
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 56) = v273;
    }
    v274 = [(CALayer *)self shadowPath];
    if (v274)
    {
      v276 = (CA::Render::Path *)CA::Render::Path::new_path(v274, v275);
      if (v276)
      {
        v277 = (atomic_uint *)v276;
        CA::Render::Layer::set_shadow_path(v11, v276);
        if (atomic_fetch_add(v277 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v277 + 16))(v277);
        }
      }
    }
    BOOL v278 = [(CALayer *)self invertsShadow];
    uint64_t v279 = 0x200000000;
    if (!v278) {
      uint64_t v279 = 0;
    }
    *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFFDFFFFFFFFLL | v279;
    if ([(CALayer *)self cornerContents])
    {
      unint64_t v280 = *(void *)(v11 + 40) & 0xFFFFFFFBFFFFFFFFLL;
    }
    else
    {
      BOOL v281 = [(CALayer *)self shadowPathIsBounds];
      uint64_t v282 = 0x400000000;
      if (!v281) {
        uint64_t v282 = 0;
      }
      unint64_t v280 = *(void *)(v11 + 40) & 0xFFFFFFFBFFFFFFFFLL | v282;
    }
    *(void *)(v11 + 40) = v280;
    BOOL v283 = [(CALayer *)self punchoutShadow];
    uint64_t v284 = 0x800000000;
    if (!v283) {
      uint64_t v284 = 0;
    }
    *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFF7FFFFFFFFLL | v284;
    [(CALayer *)self rimOpacity];
    if (v285 > 1.0) {
      float v285 = 1.0;
    }
    if (v285 >= 0.0) {
      float v286 = v285;
    }
    else {
      float v286 = 0.0;
    }
    if (v286 > 0.0 || *(void *)(v11 + 128)) {
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 80) = v286;
    }
    v287 = [(CALayer *)self rimColor];
    if (v287 && (v287 != (CGColor *)black || v29 != (CGImage *)v30))
    {
      memset(buf, 0, sizeof(buf));
      CA::Render::convert_cgcolor_to_float(v287, v29, (CGColorSpace *)buf, 0, v288);
      if (fabsf(*(float *)buf) >= 0.00097656
        || fabsf(*(float *)&buf[4]) >= 0.00097656
        || fabsf(*(float *)&buf[8]) >= 0.00097656
        || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
      {
        CA::Render::Layer::set_rim_color((CA::Render::Layer *)v11, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
      }
    }
    BOOL v289 = [(CALayer *)self rimPathIsBounds];
    uint64_t v290 = 0x1000000000;
    if (!v289) {
      uint64_t v290 = 0;
    }
    *(void *)(v11 + 40) = *(void *)(v11 + 40) & 0xFFFFFFEFFFFFFFFFLL | v290;
    [(CALayer *)self rimWidth];
    float v292 = v291;
    if (v292 != 0.0 && (v292 > 0.0 || *(void *)(v11 + 128))) {
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v11) + 75) = v292;
    }
    BOOL v293 = [(CALayer *)self borderPathIsBounds];
    v294 = (unint64_t *)(v11 + 40);
    uint64_t v295 = 0x2000000000;
    if (!v293) {
      uint64_t v295 = 0;
    }
    unint64_t *v294 = *(void *)(v11 + 40) & 0xFFFFFFDFFFFFFFFFLL | v295;
    BOOL v296 = [(CALayer *)self softRim];
    uint64_t v297 = 0x4000000000;
    if (!v296) {
      uint64_t v297 = 0;
    }
    unint64_t *v294 = *v294 & 0xFFFFFFBFFFFFFFFFLL | v297;
    unsigned int v155 = layer[10];
  }
  unsigned int v298 = v155 & 0x1FFFFF;
  long long v15 = a5;
  *a5 = v298;
  if (v33)
  {
    int v14 = v298 | 1;
    goto LABEL_390;
  }
LABEL_391:
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x10000) != 0) {
    *(_DWORD *)(v11 + 12) |= 0x100u;
  }
  if ((*((unsigned char *)layer + 51) & 0x40) != 0) {
    *v15 |= 0x400000u;
  }
  if ((*((unsigned char *)layer + 54) & 0x10) != 0) {
    *v15 |= 0x200000u;
  }
  return (void *)v11;
}

- (float)opacity
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  layer = (CA::Transaction *)self->_attr.layer;
  float result = 1.0;
  if ((*((unsigned char *)layer + 55) & 8) != 0)
  {
    float v4 = 0.0;
    CA::Layer::getter(layer, 0x199u, (const CGAffineTransform *)0x11, (id *)&v4);
    return v4;
  }
  return result;
}

- (CGColorRef)backgroundColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x36u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CGFloat)contentsScale
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  layer = self->_attr.layer;
  unsigned int v3 = (*((_DWORD *)layer + 11) >> 26) & 3;
  v6[0] = 0.0;
  if (v3) {
    return (double)v3;
  }
  if (*((unsigned char *)layer + 56))
  {
    uint64_t v4 = *((void *)layer + 9);
    if (!v4 || (CA::AttrList::get(v4, 136, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v6) & 1) == 0) {
      CA::Layer::default_value((id *)layer, 0x88u, (const CGAffineTransform *)0x12, (uint64_t)v6);
    }
  }
  else
  {
    v6[0] = 1.0;
  }
  return v6[0];
}

- (BOOL)allowsEdgeAntialiasing
{
  return *((_DWORD *)self->_attr.layer + 13) & 1;
}

- (CALayerContentsFilter)minificationFilter
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x185u, (const CGAffineTransform *)3, v3);
  return (CALayerContentsFilter)v3[0];
}

- (NSString)contentsSwizzle
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x8Au, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (BOOL)wantsExtendedDynamicRangeContent
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 4) & 1;
}

- (CGFloat)cornerRadius
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x94u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSString)name
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x18Du, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (CGFloat)rasterizationScale
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  layer = self->_attr.layer;
  unsigned int v3 = (*((_DWORD *)layer + 11) >> 28) & 3;
  v6[0] = 0.0;
  if (v3) {
    return (double)v3;
  }
  uint64_t v4 = *((void *)layer + 9);
  if (!v4 || (CA::AttrList::get(v4, 458, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v6) & 1) == 0) {
    CA::Layer::default_value((id *)layer, 0x1CAu, (const CGAffineTransform *)0x12, (uint64_t)v6);
  }
  return v6[0];
}

- (BOOL)shouldRasterize
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 4) & 1;
}

- (double)contentsEDRStrength
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x7Du, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)allowsHitTesting
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 2) & 1;
}

- (BOOL)allowsDisplayCompositing
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 3) & 1;
}

- (BOOL)allowsGroupOpacity
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 1) & 1;
}

- (double)borderOffset
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x43u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)inheritsTiming
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 1) & 1;
}

- (CALayerContentsFilter)magnificationFilter
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x175u, (const CGAffineTransform *)3, v3);
  return (CALayerContentsFilter)v3[0];
}

- (float)minificationFilterBias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x186u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (float)gain
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xF6u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (BOOL)toneMapToStandardDynamicRange
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 5) & 1;
}

- (BOOL)allowsGroupBlending
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 6) & 1;
}

- (BOOL)literalContentsCenter
{
  return *((unsigned char *)self->_attr.layer + 54) & 1;
}

- (BOOL)hitTestsContentsAlphaChannel
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 6) & 1;
}

- (BOOL)definesDisplayRegionOfInterest
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 2) & 1;
}

- (BOOL)preloadsCache
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 1) & 1;
}

- (BOOL)createsCompositingGroup
{
  return *((_DWORD *)self->_attr.layer + 12) >> 31;
}

- (BOOL)shouldReflatten
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 6) & 1;
}

- (BOOL)shouldFlatten
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 5) & 1;
}

- (BOOL)rasterizationPrefersWindowServerAwareBackdrops
{
  return *((unsigned char *)self->_attr.layer + 51) & 1;
}

- (BOOL)rasterizationPrefersDisplayCompositing
{
  return *((unsigned __int8 *)self->_attr.layer + 50) >> 7;
}

- (BOOL)isDoubleSided
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 4) & 1;
}

- (BOOL)cornerContentsMasksEdges
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 5) & 1;
}

- (BOOL)contentsContainsSubtitles
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 1) & 1;
}

- (BOOL)hitTestsAsOpaque
{
  return *((unsigned __int8 *)self->_attr.layer + 53) >> 7;
}

- (CGSize)backgroundColorPhase
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x37u, (const CGAffineTransform *)0x14, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)cornerContents
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x8Fu, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (float)rimOpacity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1DEu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CGColor)rimColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1DDu, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (double)rimWidth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1E0u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)shadowRadius
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1FAu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGPathRef)shadowPath
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1F8u, (const CGAffineTransform *)2, v3);
  return (CGPathRef)v3[0];
}

- (CGColorRef)shadowColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1F5u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CGSize)shadowOffset
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1F6u, (const CGAffineTransform *)0x14, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)softRim
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 2) & 1;
}

- (BOOL)rimPathIsBounds
{
  return *((unsigned char *)self->_attr.layer + 50) & 1;
}

- (BOOL)borderPathIsBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 1) & 1;
}

- (BOOL)punchoutShadow
{
  return *((unsigned __int8 *)self->_attr.layer + 49) >> 7;
}

- (BOOL)invertsShadow
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 5) & 1;
}

- (BOOL)shadowPathIsBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 6) & 1;
}

- (CGRect)contentsCenter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x79u, (const CGAffineTransform *)0x15, (id *)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = v7[1];
  double v4 = v7[0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (NSArray)backgroundFilters
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x38u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CACornerRadii)cornerRadii
{
  retstr->maxXMinY = 0u;
  retstr->minXMinY = 0u;
  retstr->minXMaxY = 0u;
  retstr->maxXMaxY = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x93u, (const CGAffineTransform *)0x19, (id *)retstr);
  return result;
}

- (CGRect)contentsDirtyRect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x7Bu, (const CGAffineTransform *)0x15, (id *)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = v7[1];
  double v4 = v7[0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setMaskedCorners:(CACornerMask)maskedCorners
{
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CAMediaTimingInvalidate((uint64_t)self);
  layer = (atomic_uint *)self->_attr.layer;
  if (layer)
  {
    while (1)
    {
      atomic_uint v4 = *layer;
      if (!*layer) {
        break;
      }
      atomic_uint v5 = *layer;
      atomic_compare_exchange_strong(layer, (unsigned int *)&v5, v4 - 1);
      if (v5 == v4)
      {
        if (v4 == 1)
        {
          CA::Layer::destroy((CA::Layer *)layer);
          CA::Layer::~Layer((CA::AttrList **)layer);
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          malloc_zone_free(malloc_zone, layer);
        }
        break;
      }
    }
  }
  self->_attr.magic = 1279351128;
  v7.receiver = self;
  v7.super_class = (Class)CALayer;
  [(CALayer *)&v7 dealloc];
}

- (BOOL)allowsWeakReference
{
  return self->_attr.refcount != 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  v12[1] = *(objc_object **)MEMORY[0x1E4F143B8];
  atomic_uint v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  unsigned int v6 = CAInternAtom((const __CFString *)a3, 1);
  int v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = (CA::Layer *)self->_attr.layer;
  v12[0] = 0;
  uint64_t v9 = *((void *)layer + 9);
  if ((!v9 || (CA::AttrList::get(v9, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v12) & 1) == 0)
    && (CA::Layer::style_value(layer, v6, v12) & 1) == 0)
  {
    v12[0] = 0;
  }
  long long v10 = v12[0];
  CA::Transaction::unlock(v5);
  return v10;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  int v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  uint64_t v8 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  int v9 = *((_DWORD *)v7 + 25);
  *((_DWORD *)v7 + 25) = v9 + 1;
  if (!v9) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = (CA::Layer *)self->_attr.layer;
  id v18 = 0;
  uint64_t v11 = *((void *)layer + 9);
  if (!v11
    || !CA::AttrList::get(v11, (int)v8, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v18)
    || ([v18 isEqual:a3] & 1) == 0)
  {
    int v17 = 0;
    String = (objc_object *)CAAtomGetString(v8);
    CA::Layer::begin_change(layer, v7, String, (objc_object *)&v17, v13);
    int v14 = CA::Layer::writable_state(layer, v7);
    long long v15 = (CA::AttrList *)*((void *)v14 + 4);
    if (!v15)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      long long v15 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
    }
    *((void *)v14 + 4) = CA::AttrList::set(v15, v8, 2, (unsigned __int8 *)v19);
    CA::Layer::end_change((id *)layer, v7, (int)v8, String, v17);
  }
  CA::Transaction::unlock(v7);
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3 = CAInternAtom((const __CFString *)key, 0);
  int v4 = v3;
  if (v3 <= 182)
  {
    if (v3 > 54)
    {
      CGColorRef v5 = (CGColorRef)@"RGBA8";
      switch(v3)
      {
        case 121:
        case 135:
          CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::unitRect;
          if (!+[CALayer defaultValueForKey:]::unitRect)
          {
            CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, 1.0, 1.0);
            +[CALayer defaultValueForKey:]::unitRect = (uint64_t)v5;
          }
          return v5;
        case 122:
        case 124:
        case 127:
        case 128:
        case 129:
        case 130:
        case 134:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
        case 145:
          goto LABEL_64;
        case 123:
          CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::nullRect;
          if (!+[CALayer defaultValueForKey:]::nullRect)
          {
            CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
            +[CALayer defaultValueForKey:]::nullRect = (uint64_t)v5;
          }
          return v5;
        case 125:
        case 136:
          goto LABEL_44;
        case 126:
          return v5;
        case 131:
          return @"resize";
        case 132:
          goto LABEL_46;
        case 133:
          CGColorRef v5 = (CGColorRef)white;
          if (!white)
          {
            int v17 = (CGColorSpace *)CAGetColorSpace(0x1Du);
            CGColorRef v5 = CGColorCreate(v17, +[CALayer defaultValueForKey:]::values);
            white = (uint64_t)v5;
          }
          return v5;
        case 137:
          return @"stretch";
        case 138:
          return @"RGBA";
        case 144:
          CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::fullRect;
          if (!+[CALayer defaultValueForKey:]::fullRect)
          {
            CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.5, 0.5, 0.0, 0.0);
            +[CALayer defaultValueForKey:]::fullRect = (uint64_t)v5;
          }
          return v5;
        case 146:
          if (LINKED_DEFAULT_CONTINUOUS_CORNERS) {
            return @"continuous";
          }
          else {
            return @"circular";
          }
        default:
          if (v3 == 55)
          {
            CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defPhase;
            if (!+[CALayer defaultValueForKey:]::defPhase)
            {
              CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 0.0, 0.0);
              +[CALayer defaultValueForKey:]::defPhase = (uint64_t)v5;
            }
            return v5;
          }
          if (v3 != 66) {
            goto LABEL_64;
          }
          break;
      }
      goto LABEL_50;
    }
    switch(v3)
    {
      case 13:
        int v7 = "CALAYER_ALLOWS_EDGE_ANTIALIASING";
        uint64_t v8 = @"CALayerAllowsEdgeAntialiasing";
        int v9 = @"UIViewEdgeAntialiasing";
        break;
      case 16:
        int v7 = "CALAYER_ALLOWS_GROUP_OPACITY";
        uint64_t v8 = @"CALayerAllowsGroupOpacity";
        int v9 = @"UIViewGroupOpacity";
        break;
      case 27:
        CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defAnchor;
        if (!+[CALayer defaultValueForKey:]::defAnchor)
        {
          CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", 0.5, 0.5);
          +[CALayer defaultValueForKey:]::defAnchor = (uint64_t)v5;
        }
        return v5;
      default:
        goto LABEL_64;
    }
    long long v10 = getenv(v7);
    if (v10)
    {
      int v11 = atoi(v10);
      int v12 = (id *)MEMORY[0x1E4F1CFD0];
      if (!v11) {
        int v12 = (id *)MEMORY[0x1E4F1CFC8];
      }
      return *v12;
    }
    long long v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary");
    CGColorRef v5 = (CGColorRef)[v13 objectForKey:v8];
    if (v5 || (CGColorRef v5 = (CGColorRef)[v13 objectForKey:v9]) != 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v5;
      }
    }
    if (v4 == 16 && dyld_program_sdk_at_least())
    {
      int v12 = (id *)MEMORY[0x1E4F1CFD0];
      return *v12;
    }
    goto LABEL_64;
  }
  if (v3 <= 408)
  {
    if (v3 <= 245)
    {
      if (v3 > 193)
      {
        if (v3 != 194)
        {
          if (v3 == 223) {
            return @"removed";
          }
          goto LABEL_64;
        }
        CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defEdges;
        if (!+[CALayer defaultValueForKey:]::defEdges)
        {
          CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithUnsignedInt:15];
          +[CALayer defaultValueForKey:]::defEdges = (uint64_t)v5;
        }
      }
      else
      {
        if (v3 == 183)
        {
LABEL_46:
          CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::zero;
          if (!+[CALayer defaultValueForKey:]::zero)
          {
            CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithInt:0];
            +[CALayer defaultValueForKey:]::zero = (uint64_t)v5;
          }
          return v5;
        }
        if (v3 != 191) {
          goto LABEL_64;
        }
        CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::inf;
        if (!+[CALayer defaultValueForKey:]::inf)
        {
          CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithDouble:INFINITY];
          +[CALayer defaultValueForKey:]::inf = (uint64_t)v5;
        }
      }
      return v5;
    }
    if (v3 > 376)
    {
      if (v3 == 377)
      {
        CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::corners;
        if (!+[CALayer defaultValueForKey:]::corners)
        {
          CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithUnsignedInt:15];
          +[CALayer defaultValueForKey:]::corners = (uint64_t)v5;
        }
        return v5;
      }
      if (v3 != 389) {
        goto LABEL_64;
      }
      return @"linear";
    }
    if (v3 != 246)
    {
      if (v3 != 373) {
        goto LABEL_64;
      }
      return @"linear";
    }
LABEL_44:
    CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::one;
    if (!+[CALayer defaultValueForKey:]::one)
    {
      CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithInt:1];
      +[CALayer defaultValueForKey:]::one = (uint64_t)v5;
    }
    return v5;
  }
  if (v3 <= 501)
  {
    if (v3 > 476)
    {
      if (v3 == 477 || v3 == 501)
      {
LABEL_50:
        CGColorRef v5 = (CGColorRef)black;
        if (!black)
        {
          unsigned int v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
          CGColorRef v5 = CGColorCreate(v6, (const CGFloat *)&xmmword_1849A7FD8);
          black = (uint64_t)v5;
        }
        return v5;
      }
      goto LABEL_64;
    }
    if (v3 != 409 && v3 != 458)
    {
LABEL_64:
      uint64_t v14 = 0;
      long long v15 = &dword_1E527D530;
      while (1)
      {
        int v16 = *v15;
        v15 += 8;
        if (v16 == v4) {
          break;
        }
        CGColorRef v5 = 0;
        if (++v14 == 46) {
          return v5;
        }
      }
      if ((0x37EF7BDFE757uLL >> v14)) {
        int v12 = (id *)MEMORY[0x1E4F1CFC8];
      }
      else {
        int v12 = (id *)MEMORY[0x1E4F1CFD0];
      }
      return *v12;
    }
    goto LABEL_44;
  }
  if (v3 > 525)
  {
    if (v3 != 526)
    {
      if (v3 == 562) {
        return @"automatic";
      }
      goto LABEL_64;
    }
    goto LABEL_44;
  }
  if (v3 == 502)
  {
    CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defOffset;
    if (!+[CALayer defaultValueForKey:]::defOffset)
    {
      CGColorRef v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", 0.0, -3.0);
      +[CALayer defaultValueForKey:]::defOffset = (uint64_t)v5;
    }
  }
  else
  {
    if (v3 != 506) {
      goto LABEL_64;
    }
    CGColorRef v5 = (CGColorRef)+[CALayer defaultValueForKey:]::three;
    if (!+[CALayer defaultValueForKey:]::three)
    {
      CGColorRef v5 = (CGColorRef)[objc_alloc(NSNumber) initWithInt:3];
      +[CALayer defaultValueForKey:]::three = (uint64_t)v5;
    }
  }
  return v5;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return objc_opt_class() != (void)a3;
}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x85, (const CGAffineTransform *)2, v3);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v5 = [a3 rangeOfString:@"."];
  if (v6)
  {
    int v7 = CAInternAtom((const __CFString *)[a3 substringToIndex:v5], 0);
    uint64_t v8 = 0;
    while (v7 != (unsigned __int16)-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::atoms[v8])
    {
      if (++v8 == 5) {
        return 0;
      }
    }
    int v11 = self;
    id v12 = a3;
    unsigned int v13 = 0;
    goto LABEL_14;
  }
  int v9 = CAInternAtom((const __CFString *)a3, 0);
  if (v9 == 119)
  {
    if ((*((unsigned char *)self->_attr.layer + 54) & 0x80) != 0)
    {
      return 0;
    }
    else
    {
      if (default_anim_once != -1) {
        dispatch_once_f(&default_anim_once, 0, (dispatch_function_t)default_anim_init);
      }
      return (id)basicAnim;
    }
  }
  else
  {
    unsigned int v14 = v9;
    if (CAAtomIndexInArray(26, (uint64_t)&-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::basic_atoms, v9) != -1)
    {
      int v11 = self;
      id v12 = a3;
      unsigned int v13 = v14;
LABEL_14:
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)v11, v12, v13);
    }
    uint64_t v15 = 0;
    while (v14 != (unsigned __int16)-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::trans_atoms[v15])
    {
      if (++v15 == 9) {
        return 0;
      }
    }
    if (default_anim_once != -1) {
      dispatch_once_f(&default_anim_once, 0, (dispatch_function_t)default_anim_init);
    }
    return (id)transition;
  }
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v7 = [a4 rangeOfString:@"."];
  if (!v8)
  {
    [(CALayer *)self setValue:a3 forKey:a4];
    return;
  }
  uint64_t v9 = v7;
  CFStringRef v10 = (const __CFString *)[a4 substringToIndex:v7];
  int v11 = (CA::Transaction *)CAInternAtom(v10, 0);
  int v12 = (int)v11;
  int v13 = *((_DWORD *)self->_attr.layer + 1) & 0x60000;
  if (v13 == 0x40000)
  {
    unsigned int v14 = (CA::Transaction *)[(CALayer *)self _renderLayerDefinesProperty:v11];
    if (v14) {
      return;
    }
    uint64_t v15 = CA::Transaction::ensure_compat(v14);
    goto LABEL_9;
  }
  int v16 = CA::Transaction::ensure_compat(v11);
  uint64_t v15 = v16;
  if (v13)
  {
LABEL_9:
    char v17 = 0;
    id v18 = 0;
    goto LABEL_10;
  }
  id v18 = 0;
  char v17 = 1;
  if (v12 != 376 && v12 != 547)
  {
    double v22 = (char *)v16 + 88;
    do
    {
      double v22 = *(char **)v22;
      if (!v22) {
        goto LABEL_26;
      }
    }
    while ((v22[28] & 1) == 0);
    if ((v22[24] & 1) == 0)
    {
LABEL_26:
      id v18 = [(CALayer *)self actionForKey:a4];
      goto LABEL_47;
    }
    id v18 = 0;
LABEL_47:
    char v17 = 1;
  }
LABEL_10:
  float64x2_t v19 = (void *)[a4 substringFromIndex:v9 + 1];
  if (v12 <= 122)
  {
    switch(v12)
    {
      case '8':
        int v20 = 1024;
        break;
      case 'q':
        int v20 = 2048;
        break;
      case 'w':
        goto LABEL_19;
      default:
LABEL_41:
        CAObject_setValueForKeyPath_(self, a3, (uint64_t)v10, v19, 0);
        if (v18) {
          char v26 = v17;
        }
        else {
          char v26 = 0;
        }
        if ((v26 & 1) == 0) {
          return;
        }
LABEL_38:
        [v18 runActionForKey:a4 object:self arguments:0];
        return;
    }
LABEL_29:
    int v21 = 1;
    goto LABEL_31;
  }
  if (v12 != 123)
  {
    if (v12 == 143)
    {
      int v21 = 0;
      int v20 = 0x80000;
      goto LABEL_31;
    }
    if (v12 != 226) {
      goto LABEL_41;
    }
    int v20 = 512;
    goto LABEL_29;
  }
LABEL_19:
  int v21 = 0;
  int v20 = 1;
LABEL_31:
  CAObject_setValueForKeyPath_(self, a3, (uint64_t)v10, v19, v21);
  if (v17)
  {
    int v23 = *((_DWORD *)v15 + 25);
    *((_DWORD *)v15 + 25) = v23 + 1;
    if (!v23) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    layer = (CA::Layer *)self->_attr.layer;
    int v25 = (v20 & 1) != 0 ? 1032 : 8;
    *((_DWORD *)layer + 10) |= v20 & 0x80E00;
    CA::Layer::mark(layer, v15, v25, 16);
    CA::Transaction::unlock(v15);
    if (v18) {
      goto LABEL_38;
    }
  }
}

- (CGRect)bounds
{
  layer = (double *)self->_attr.layer;
  double v3 = layer[12];
  double v4 = layer[13];
  double v5 = layer[14];
  double v6 = layer[15];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGPoint)position
{
  layer = (double *)self->_attr.layer;
  double v3 = layer[10];
  double v4 = layer[11];
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (NSArray)filters
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xE2u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (double)contentsMaximumDesiredEDR
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x84u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setFilters:(NSArray *)filters
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = filters;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xE2, (const CGAffineTransform *)3, v3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) != 0x40000
    || ![(CALayer *)self _renderLayerDefinesProperty:CAInternAtom((const __CFString *)a4, 0)])
  {
    uint64_t v7 = (objc_class *)+[CALayer superclass];
    CAObject_setValueForKey(self, v7, a3, (const __CFString *)a4);
  }
}

- (id)valueForKey:(id)a3
{
  double v5 = (objc_class *)+[CALayer superclass];

  return CAObject_valueForKey(self, v5, (const __CFString *)a3);
}

- (CAMeshTransform)meshTransform
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x182u, (const CGAffineTransform *)3, v3);
  return (CAMeshTransform *)v3[0];
}

- (CGRect)contentsRect
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  *(_OWORD *)uint64_t v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x87u, (const CGAffineTransform *)0x15, (id *)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = v7[1];
  double v4 = v7[0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CACornerMask)maskedCorners
{
  return ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 11) & 0xF;
}

- (CATransform3D)sublayerTransform
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x222u, (const CGAffineTransform *)0x16, (id *)retstr);
  return result;
}

- (BOOL)continuousCorners
{
  return [(CALayer *)self cornerCurve] == (CALayerCornerCurve)@"continuous";
}

- (BOOL)_continuousCorners
{
  return [(CALayer *)self cornerCurve] == (CALayerCornerCurve)@"continuous";
}

- (CALayerCornerCurve)cornerCurve
{
  unsigned int v2 = ((*((_DWORD *)self->_attr.layer + 12) >> 1) & 3) - 1;
  if (v2 > 2) {
    return (CALayerCornerCurve)@"circular";
  }
  else {
    return &off_1E527DC48[v2]->isa;
  }
}

- (void)setContentsMaximumDesiredEDR:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x84, (const CGAffineTransform *)0x12, v3);
}

- (void)layoutSublayers
{
  if ((*((unsigned char *)self->_attr.layer + 58) & 3) != 0)
  {
    double v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3) {
      double v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    }
    int v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    layer = (char *)self->_attr.layer;
    int v6 = *((_DWORD *)layer + 14);
    if ((v6 & 0x10000) != 0)
    {
      uint64_t v7 = &selRef_layoutSublayersOfLayer_;
    }
    else
    {
      if ((v6 & 0x20000) == 0)
      {
LABEL_13:
        CA::Transaction::unlock(v3);
        goto LABEL_14;
      }
      uint64_t v7 = &selRef__layoutSublayersOfLayer_;
    }
    uint64_t v8 = *v7;
    if (*v7)
    {
      uint64_t v9 = (id *)(layer + 128);
      if (layer[136]) {
        id Weak = objc_loadWeak(v9);
      }
      else {
        id Weak = *v9;
      }
      CA::Transaction::unlock(v3);
      objc_msgSend(Weak, v8, self);
      return;
    }
    goto LABEL_13;
  }
LABEL_14:
  int v11 = (char *)CA::Transaction::ensure_compat((CA::Transaction *)self) + 88;
  while (1)
  {
    int v11 = *(char **)v11;
    if (!v11) {
      break;
    }
    if (v11[28])
    {
      if (v11[24]) {
        return;
      }
      break;
    }
  }
  id v12 = [(CALayer *)self actionForKey:@"onLayout"];
  if (v12)
  {
    [v12 runActionForKey:@"onLayout" object:self arguments:0];
  }
}

- (unsigned)_renderImageCopyFlags
{
  double v3 = [(CALayer *)self minificationFilter];
  if (v3 == @"linear")
  {
    unsigned int v5 = 0;
  }
  else
  {
    CFStringRef v4 = v3;
    unsigned int v5 = CAInternAtom(v3, 0) == 341;
    int v6 = CAInternAtom(v4, 0);
    if (v6 == 341 || v6 == 574) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = [(CALayer *)self contentsScaling];
  if (v7 == @"stretch"
    || v7 != @"repeat" && ![(__CFString *)v7 isEqualToString:@"repeat"])
  {
    v5 |= 0x100u;
  }
LABEL_8:
  uint64_t v8 = [(CALayer *)self contentsSwizzle];
  if (v8 != @"RGBA"
    && (v8 == @"AAAA" || [(__CFString *)v8 isEqualToString:@"AAAA"]))
  {
    v5 |= 8u;
  }
  return v5;
}

- (NSString)contentsScaling
{
  if ((*((unsigned char *)self->_attr.layer + 53) & 4) != 0) {
    return (NSString *)@"repeat";
  }
  else {
    return (NSString *)@"stretch";
  }
}

- (void)display
{
  layer = (char *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    if ((layer[57] & 0x20) != 0)
    {
      CFStringRef v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (!v4) {
        CFStringRef v4 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
      }
      int v5 = *((_DWORD *)v4 + 25);
      *((_DWORD *)v4 + 25) = v5 + 1;
      if (!v5) {
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      }
      if ((layer[57] & 0x20) != 0)
      {
        uint64_t v7 = (id *)(layer + 128);
        if (layer[136]) {
          id Weak = objc_loadWeak(v7);
        }
        else {
          id Weak = *v7;
        }
      }
      else
      {
        id Weak = 0;
      }
      CA::Transaction::unlock(v4);
      uint64_t v8 = *((void *)layer + 2);
      [Weak displayLayer:v8];
    }
    else
    {
      double v3 = (void *)*((void *)layer + 2);
      [v3 _display];
    }
  }
}

- (void)_display
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  layer = (char *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0) {
    return;
  }
  int v5 = (void *)*((void *)layer + 2);
  if (*((double *)layer + 14) == 0.0 || *((double *)layer + 15) == 0.0) {
    goto LABEL_24;
  }
  int v6 = *((_DWORD *)layer + 14);
  if ((v6 & 0x8000) != 0)
  {
    uint64_t v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      uint64_t v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    }
    int v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    if (layer[57] < 0)
    {
      uint64_t v9 = (id *)(layer + 128);
      if (layer[136]) {
        id Weak = objc_loadWeak(v9);
      }
      else {
        id Weak = *v9;
      }
    }
    else
    {
      id Weak = 0;
    }
    CA::Transaction::unlock(v7);
    [Weak layerWillDraw:v5];
    int v6 = *((_DWORD *)layer + 14);
  }
  double v10 = 1.0;
  if (v6)
  {
    [v5 contentsScale];
    double v10 = v11;
  }
  double v12 = *((double *)layer + 14);
  double v13 = *((double *)layer + 15);
  if (v12 < 0.0 || (v13 >= 0.0 ? (BOOL v14 = v10 * v10 * v12 * v13 <= 268435456.0) : (BOOL v14 = 0), !v14))
  {
    NSLog(&cfstr_DisplayIgnorin.isa, a2, *((void *)layer + 2), *(void *)&v12, *(void *)&v13, *(void *)&v10, v12 * v10, v13 * v10);
LABEL_24:
    [v5 setContents:0];
    return;
  }
  LODWORD(Weak) = vcvtmd_s64_f64(v12 * v10 + 0.5);
  LODWORD(v3) = vcvtmd_s64_f64(v13 * v10 + 0.5);
  if ((int)Weak < 1 || (int)v3 <= 0) {
    goto LABEL_24;
  }
  int v16 = *((_DWORD *)layer + 11) & 7;
  int v17 = *((_DWORD *)layer + 14);
  int v18 = [v5 isOpaque];
  switch(v16)
  {
    case 0:
      if (v18) {
        unsigned int v19 = 3;
      }
      else {
        unsigned int v19 = 1;
      }
      break;
    case 1:
      BOOL v20 = v18 == 0;
      int v21 = 13;
      int v22 = 17;
      goto LABEL_40;
    case 2:
      BOOL v20 = v18 == 0;
      int v21 = 35;
      int v22 = 33;
      goto LABEL_40;
    case 3:
      unsigned int v19 = 9;
      break;
    case 4:
      BOOL v20 = v18 == 0;
      int v21 = 18;
      int v22 = 10;
LABEL_40:
      if (v20) {
        unsigned int v19 = v21;
      }
      else {
        unsigned int v19 = v22;
      }
      break;
    case 5:
      unsigned int v19 = 36;
      break;
    default:
      unsigned int v19 = 1;
      break;
  }
  unsigned int v23 = [v5 _overrideImageFormat];
  if (v23 == -1) {
    unint64_t v24 = v19;
  }
  else {
    unint64_t v24 = v23;
  }
  CFStringRef v25 = (const __CFString *)[v5 minificationFilter];
  BOOL v73 = v25 != @"linear" && CAInternAtom(v25, 0) == 341;
  unint64_t v26 = CA::Render::format_rowbytes((CA::Render *)v24, Weak);
  if (is_mul_ok(v26, v3)) {
    unint64_t v27 = v26 * v3;
  }
  else {
    unint64_t v27 = 0;
  }
  if (v27 < *MEMORY[0x1E4F14B00])
  {
    size_t v28 = v26;
    v75.Class isa = 0;
    LODWORD(v29) = v24;
    if ((v17 & 0x400000) == 0) {
      LODWORD(v29) = default_contents_image_format((id *)layer);
    }
    uint64_t v30 = (CGColorSpace *)[*((id *)layer + 2) _retainColorSpace];
    CFTypeRef v31 = 0;
    CGColorRef color = 0;
    if (v29 == 36)
    {
      unint64_t v81 = 0;
      *(_OWORD *)float v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      *(_OWORD *)cf = 0u;
      *(_OWORD *)decode = 0u;
      CACGContextEvaluator::CACGContextEvaluator((CACGContextEvaluator *)decode, (uint64_t)Weak, v3, v30);
      backing_callback(v79[1], (CA::Layer *)layer);
      int v32 = CACGContextEvaluator::suggested_format((CACGContextEvaluator *)decode, [v5 isOpaque], &color, objc_msgSend(v5, "wantsExtendedDynamicRangeContent"));
      if (v32 == -1)
      {
        [v5 setContents:0];
        CGColorSpaceRelease(v30);
        CACGContextEvaluator::~CACGContextEvaluator((CGColorSpaceRef *)decode);
        return;
      }
      LODWORD(v29) = v32;
      CFTypeRef v31 = CFRetain(cf[0]);
      CACGContextEvaluator::~CACGContextEvaluator((CGColorSpaceRef *)decode);
    }
    if ((0xC99B4EB03uLL >> v29)) {
      unsigned int v33 = 13;
    }
    else {
      unsigned int v33 = 17;
    }
    if ((v29 > 0x23) | (0x1FFFFFF2FuLL >> v29) & 1) {
      unint64_t v29 = v29;
    }
    else {
      unint64_t v29 = v33;
    }
    if (v29 != v24)
    {
      unint64_t v34 = CA::Render::format_rowbytes((CA::Render *)v29, Weak);
      size_t v28 = v34;
      if (is_mul_ok(v34, v3)) {
        unint64_t v27 = v34 * v3;
      }
      else {
        unint64_t v27 = 0;
      }
    }
    CFTypeID v35 = CA::Render::aligned_malloc((CA::Render *)v27, (unint64_t *)&v75, 0);
    if (!v35)
    {
      CGColorRelease(color);
      CGColorSpaceRelease(v30);
      return;
    }
    v36 = v35;
    if ((v29 - 8) > 0x16) {
      uint64_t v37 = 3;
    }
    else {
      uint64_t v37 = dword_184999590[(v29 - 8)];
    }
    if (CGColorSpaceGetNumberOfComponents(v30) != v37)
    {
      CGColorSpaceRelease(v30);
      int32x4_t v55 = (CGColorSpace *)CA::Render::format_default_colorspace((CA::Render *)v29);
      uint64_t v30 = CGColorSpaceRetain(v55);
    }
    if ([v5 wantsExtendedDynamicRangeContent]
      && v29 <= 0x1C
      && ((0x17826000u >> v29) & 1) != 0)
    {
      CGColorSpaceRef Extended = CAColorSpaceCreateExtended(v30);
      CGColorSpaceRelease(v30);
      uint64_t v30 = Extended;
    }
    v57 = CAGetCachedCGBitmapContext_(v36, Weak, v3, v29, v28, v30);
    if (!v57 || (uint64_t v59 = (CGContext *)*((void *)v57 + 2)) == 0)
    {
      CA::Render::aligned_free((CA::Render *)v36, (size_t)v75.isa, v58);
      CGColorRelease(color);
      CGColorSpaceRelease(v30);
      return;
    }
    if (v31) {
      CGDisplayListDrawInContext();
    }
    else {
      backing_callback(*((CGContext **)v57 + 2), (CA::Layer *)layer);
    }
    CGDisplayListRelease();
    CAReleaseCachedCGContext(v59);
    Class isa = v75.isa;
    MEMORY[0x185325430](*MEMORY[0x1E4F14960], v36, v75.isa, 1, 1);
    int8x16_t v66 = CGDataProviderCreateWithData(isa, v36, (size_t)isa, (CGDataProviderReleaseDataCallback)CA::Render::aligned_release);
    if (v29 == 9)
    {
      *(_OWORD *)decode = xmmword_184997D50;
      CGImageRef v67 = CGImageMaskCreate((size_t)Weak, v3, 8uLL, 8uLL, v28, v66, decode, 1);
    }
    else
    {
      if (v29 > 0x23)
      {
        size_t v69 = 0;
        size_t v68 = 0;
        CGBitmapInfo v70 = 0;
      }
      else
      {
        size_t v68 = dword_184999500[v29];
        size_t v69 = dword_1849993D8[v29];
        CGBitmapInfo v70 = dword_184999348[v29];
      }
      CGImageRef v67 = CGImageCreate((size_t)Weak, v3, v68, v69, v28, v30, v70, v66, 0, 1, kCGRenderingIntentDefault);
    }
    v71 = v67;
    CGDataProviderRelease(v66);
    objc_msgSend(v5, "setContents:", +[CATintedImage tintedImageWithCGImage:tint:copyFlags:](CATintedImage, "tintedImageWithCGImage:tint:copyFlags:", v71, color, v73));
    CGImageRelease(v71);
    CGColorRelease(color);
    CGColorSpaceRelease(v30);
    goto LABEL_135;
  }
  v75.Class isa = 0;
  v38 = CA::Transaction::ensure_compat((CA::Transaction *)v26);
  int v39 = *((_DWORD *)v38 + 25);
  *((_DWORD *)v38 + 25) = v39 + 1;
  if (!v39) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  float64x2_t v40 = (const void *)[v5 contents];
  uint64_t v41 = v40;
  if (!v40) {
    goto LABEL_79;
  }
  CFTypeID v42 = CFGetTypeID(v40);
  if (CABackingStoreGetTypeID::once[0] != -1) {
    dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
  }
  if (v42 == CABackingStoreGetTypeID::type)
  {
    uint64_t v43 = (uint64_t)CFRetain(v41);
  }
  else
  {
LABEL_79:
    if ((v17 & 0x400000) == 0) {
      LODWORD(v24) = default_contents_image_format((id *)layer);
    }
    uint64_t v43 = CABackingStoreCreate();
    if (v43)
    {
      unsigned int v44 = (CGColorSpace *)[*((id *)layer + 2) _retainColorSpace];
      CABackingStoreSetColorSpace(v43, v44);
      CGColorSpaceRelease(v44);
      pthread_mutex_lock((pthread_mutex_t *)(v43 + 16));
      *(_WORD *)(v43 + 492) = *(_WORD *)(v43 + 492) & 0xF9FF | 0x400;
      pthread_mutex_unlock((pthread_mutex_t *)(v43 + 16));
    }
  }
  if (([v5 drawsAsynchronously] & 1) != 0 || (uint64_t v45 = objc_msgSend(v5, "acceleratesDrawing"), v45)) {
    uint64_t v45 = 256;
  }
  unsigned int v46 = CABackingStoreSetDefaultAccelFlags(v45);
  if (v46 >= 0x100)
  {
    int v47 = (int)(*((_DWORD *)layer + 13) << 11) >> 31;
    CA::Layer::mark((CA::Layer *)layer, v38, 2, 4);
  }
  else
  {
    int v47 = 0;
  }
  CA::Transaction::unlock(v38);
  if (v43)
  {
    if ([v5 isOpaque])
    {
      v46 |= 1u;
    }
    else if ([v5 clearsContext])
    {
      v46 |= 2u;
    }
    if (v73)
    {
      if ([v5 drawsMipmapLevels]) {
        int v48 = 4;
      }
      else {
        int v48 = 12;
      }
      v46 |= v48;
    }
    int v49 = v46 | 0x400;
    unsigned int v50 = *((_DWORD *)layer + 1);
    if (v10 <= 1.9) {
      int v49 = v46;
    }
    uint64_t v51 = *((void *)v38 + 5);
    *(void *)&decode[0] = MEMORY[0x1E4F143A8];
    *(void *)&decode[1] = 3221225472;
    *(void *)&long long v77 = ___ZN2CA5Layer8display_Ev_block_invoke;
    *((void *)&v77 + 1) = &unk_1E527DB10;
    int v52 = ~(v50 >> 15) & 0x80 | v49;
    uint64_t v53 = v51 + 216;
    if (!v51) {
      uint64_t v53 = 0;
    }
    *((void *)&v80 + 1) = __PAIR64__(v3, Weak);
    unint64_t v81 = __PAIR64__(v52, v24);
    int v82 = v47;
    v79[0] = (CGContext *)v43;
    v79[1] = 0;
    *(void *)&long long v80 = v53;
    cf[0] = v5;
    cf[1] = layer;
    x_blame_allocations((uint64_t)(layer + 40), (uint64_t)decode);
    if ((const void *)v43 == v41)
    {
      int v60 = *((_DWORD *)v38 + 25);
      *((_DWORD *)v38 + 25) = v60 + 1;
      if (!v60) {
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      }
      CA::Layer::begin_change((CA::Layer *)layer, v38, @"contents", &v75, v54);
      uint64_t v61 = *((unsigned int *)v38 + 24);
      if ((v61 & 0x80000000) != 0 || (int8x16_t v62 = &layer[4 * v61], (v63 = *((_DWORD *)v62 + 68)) == 0))
      {
        float64x2_t v64 = CA::Layer::thread_flags_((CA::Layer *)layer, v38);
        int v63 = *v64;
      }
      else
      {
        float64x2_t v64 = (int *)(v62 + 272);
      }
      *float64x2_t v64 = v63 & 0xFFFFFEFF;
      CA::Layer::end_change((id *)layer, v38, 119, (objc_object *)@"contents", (objc_object *)v75.isa);
      CA::Transaction::unlock(v38);
    }
    else
    {
      [v5 setContents:v43];
    }
    CFRelease((CFTypeRef)v43);
LABEL_135:
    atomic_fetch_or((atomic_uint *volatile)layer + 1, 0x4000000u);
    if (v73) {
      int v72 = 0x200000;
    }
    else {
      int v72 = 0;
    }
    *((_DWORD *)layer + 13) = *((_DWORD *)layer + 13) & 0xFF5FFFFF | v72;
  }
}

- (void)setContents:(id)contents
{
  v16[1] = *(objc_object **)MEMORY[0x1E4F143B8];
  int v6 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  unsigned int v7 = v6[25];
  v6[25] = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = (char *)self->_attr.layer;
  if (*((id *)layer + 18) == contents)
  {
    uint64_t v9 = layer + 40;
  }
  else
  {
    v16[0] = 0;
    CA::Layer::begin_change((CA::Layer *)layer, (CA::Transaction *)v6, @"contents", (objc_object *)v16, v5);
    uint64_t v9 = CA::Layer::writable_state((CA::Layer *)layer, (CA::Transaction *)v6);
    double v10 = (const void *)*((void *)v9 + 13);
    if (v10) {
      CA::Transaction::release_object((CA::Transaction *)v6, v10);
    }
    *((void *)v9 + 13) = contents;
    if (contents)
    {
      CFRetain(contents);
      if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
      {
        CFTypeID v11 = CFGetTypeID(contents);
        if (CABackingStoreGetTypeID::once[0] != -1) {
          dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
        }
        if (v11 != CABackingStoreGetTypeID::type) {
          CA::Layer::mark((CA::Layer *)layer, (CA::Transaction *)v6, 2, 4);
        }
      }
    }
    atomic_fetch_and((atomic_uint *volatile)layer + 1, 0xFBFFFFFF);
    CA::Layer::end_change((id *)layer, (CA::Transaction *)v6, 119, (objc_object *)@"contents", v16[0]);
  }
  if ((v9[18] & 0x20) == 0)
  {
    uint64_t v9 = CA::Layer::writable_state((CA::Layer *)layer, (CA::Transaction *)v6);
    *((_DWORD *)v9 + 4) |= 0x200000u;
  }
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    uint64_t v12 = v6[24];
    if ((v12 & 0x80000000) != 0 || (double v13 = &layer[4 * v12], (v14 = *((_DWORD *)v13 + 68)) == 0))
    {
      uint64_t v15 = CA::Layer::thread_flags_((CA::Layer *)layer, (CA::Transaction *)v6);
      int v14 = *v15;
    }
    else
    {
      uint64_t v15 = (int *)(v13 + 272);
    }
    int *v15 = v14 & 0xFFFFFEFF;
    *((_DWORD *)v9 + 3) &= ~0x800000u;
  }

  CA::Transaction::unlock((CA::Transaction *)v6);
}

- (BOOL)isOpaque
{
  return (*((unsigned __int8 *)self->_attr.layer + 48) >> 6) & 1;
}

- (BOOL)clearsContext
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 2) & 1;
}

- (int)_overrideImageFormat
{
  return -1;
}

- (BOOL)acceleratesDrawing
{
  return *((unsigned __int8 *)self->_attr.layer + 52) >> 7;
}

- (BOOL)drawsAsynchronously
{
  return *((unsigned __int8 *)self->_attr.layer + 52) >> 7;
}

- (CGPoint)convertPoint:(CGPoint)p fromLayer:(CALayer *)l
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CGPoint v6 = p;
  CA::Layer::map_geometry((CA::Transaction *)l, self, (void (*)(uint64_t, long long *))applyVec2r, (void (*)(void, void))unapplyVec2r, (uint64_t)&v6);
  double y = v6.y;
  double x = v6.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAffineTransform:(CGAffineTransform *)m
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(CGFloat *)&long long v3 = m->a;
  if ((*((unsigned char *)self->_attr.layer + 55) & 0x10) != 0
    || *(double *)&v3 != 1.0
    || m->b != 0.0
    || m->c != 0.0
    || m->d != 1.0
    || m->tx != 0.0
    || m->ty != 0.0)
  {
    *((void *)&v3 + 1) = *(void *)&m->b;
    long long v4 = *(_OWORD *)&m->c;
    long long v5 = *(_OWORD *)&m->tx;
    long long v6 = v3;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    long long v9 = v4;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = xmmword_184997D50;
    long long v13 = v5;
    long long v14 = xmmword_184997D60;
    [(CALayer *)self setTransform:&v6];
  }
}

- (void)setTransform:(CATransform3D *)transform
{
  layer = (CA::Transaction *)self->_attr.layer;
  if ((*((unsigned char *)layer + 55) & 0x10) == 0 && transform->m11 == 1.0)
  {
    uint64_t v4 = 1;
    while (v4 != 16)
    {
      uint64_t v5 = v4;
      double v6 = *(&transform->m11 + v4);
      double v7 = *(&CATransform3DIdentity.m11 + v4++);
      if (v6 != v7)
      {
        if ((unint64_t)(v5 - 1) <= 0xE) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
  else
  {
LABEL_3:
    CA::Layer::setter(layer, (const void *)0x238, (const CGAffineTransform *)0x16, &transform->m11);
  }
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return CAObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (BOOL)retainWeakReference
{
  return CALayerRetain((uint64_t)self) != 0;
}

- (void)setOpacity:(float)opacity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = opacity;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x199, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setOpaque:(BOOL)opaque
{
}

- (void)setHidden:(BOOL)hidden
{
}

- (void)setAllowsEdgeAntialiasing:(BOOL)allowsEdgeAntialiasing
{
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = cornerRadius;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x94, (const CGAffineTransform *)0x12, v3);
}

- (void)setMasksToBounds:(BOOL)masksToBounds
{
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = backgroundColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x36, (const CGAffineTransform *)2, v3);
}

- (void)setCornerCurve:(CALayerCornerCurve)cornerCurve
{
  if (cornerCurve == (CALayerCornerCurve)@"continuous") {
    goto LABEL_5;
  }
  if (cornerCurve == (CALayerCornerCurve)@"id0") {
    goto LABEL_8;
  }
  if (cornerCurve == (CALayerCornerCurve)@"id1")
  {
    int v5 = 3;
    goto LABEL_9;
  }
  if ([(NSString *)cornerCurve isEqualToString:@"continuous"])
  {
LABEL_5:
    int v5 = 1;
    goto LABEL_9;
  }
  if ([(NSString *)cornerCurve isEqualToString:@"id0"])
  {
LABEL_8:
    int v5 = 2;
  }
  else if ([(NSString *)cornerCurve isEqualToString:@"id1"])
  {
    int v5 = 3;
  }
  else
  {
    int v5 = 0;
  }
LABEL_9:
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::set_bit_int(layer, 0x92u, 0x21u, 0xABu, 3, v5);
}

- (void)setAllowsGroupOpacity:(BOOL)allowsGroupOpacity
{
}

- (void)setAllowsGroupBlending:(BOOL)a3
{
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_11;
  }
  int v7 = CAInternAtom((const __CFString *)a4, 0);
  if (v7 <= 445)
  {
    if (v7 == 119)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return 1;
      }
      CFTypeID v11 = CFGetTypeID(a3);
      if (v11 == CGImageGetTypeID()) {
        return 1;
      }
      if (CABackingStoreGetTypeID::once[0] != -1) {
        dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
      }
      if (v11 == CABackingStoreGetTypeID::type || v11 == IOSurfaceGetTypeID()) {
        return 1;
      }
      if (CAMachPortGetTypeID::once[0] != -1) {
        dispatch_once(CAMachPortGetTypeID::once, &__block_literal_global_5766);
      }
      if (v11 == CAMachPortGetTypeID::type || v11 == CVPixelBufferGetTypeID()) {
        return 1;
      }
      if (CAIOSurfaceGetTypeID::once[0] != -1) {
        dispatch_once(CAIOSurfaceGetTypeID::once, &__block_literal_global_2614);
      }
      if (v11 == CAIOSurfaceGetTypeID::type) {
        return 1;
      }
      if (CAImageQueueGetTypeID::once != -1) {
        dispatch_once(&CAImageQueueGetTypeID::once, &__block_literal_global_14584);
      }
      if (v11 == CAImageQueueGetTypeID::type) {
        return 1;
      }
      if (CAImageProviderGetTypeID::once != -1) {
        dispatch_once(&CAImageProviderGetTypeID::once, &__block_literal_global_5_8974);
      }
      if (v11 == CAImageProviderGetTypeID::type) {
        return 1;
      }
      if (CARenderObjectGetTypeID::once != -1) {
        dispatch_once(&CARenderObjectGetTypeID::once, &__block_literal_global_5787);
      }
      return v11 == CARenderObjectGetTypeID::type;
    }
    if (v7 == 143)
    {
      CFTypeID v8 = CFGetTypeID(a3);
      return v8 == CGImageGetTypeID();
    }
LABEL_11:
    v12.receiver = self;
    v12.super_class = (Class)CALayer;
    return [&v12 CA_validateValue:a3 forKey:a4];
  }
  if (v7 != 446 && v7 != 547) {
    goto LABEL_11;
  }
  objc_opt_class();

  return CAObject_validateArrayOfClass(a3);
}

- (double)timeOffset
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x22Eu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (float)speed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x20Eu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (double)beginTime
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x39u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (double)duration
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xBFu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (double)repeatDuration
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1D6u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)autoreverses
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x31u, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (NSString)fillMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xDFu, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (float)repeatCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1D5u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setCompositingFilter:(id)compositingFilter
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = compositingFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x71, (const CGAffineTransform *)2, v3);
}

- (void)setSublayers:(NSArray *)sublayers
{
}

- (void)setName:(NSString *)name
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = name;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x18D, (const CGAffineTransform *)3, v3);
}

+ (CALayer)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CALayer;
  CGPoint result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result) {
    result->_attr.refcount = 1;
  }
  return result;
}

- (CALayer)presentationLayer
{
  layer = (CA::Layer *)self->_attr.layer;
  float v3 = (CA::Transaction::Shared **)CA::Transaction::ensure_compat((CA::Transaction *)self);

  return CA::Layer::presentation_layer(layer, v3);
}

- (void)setMask:(CALayer *)mask
{
}

- (void)setShadowOpacity:(float)shadowOpacity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = shadowOpacity;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F7, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = shadowRadius;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1FA, (const CGAffineTransform *)0x12, v3);
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize v3 = shadowOffset;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F6, (const CGAffineTransform *)0x14, &v3.width);
}

- (CALayer)initWithLayer:(id)layer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_attr.magic = 1279351122;
  v17.receiver = self;
  v17.super_class = (Class)CALayer;
  CGSize v3 = [(CALayer *)&v17 init];
  uint64_t v4 = v3;
  if (v3 && !v3->_attr.layer)
  {
    uint64_t v5 = (CA::Layer *)objc_opt_class();
    int v7 = (CA::Transaction *)CA::Layer::class_state(v5, v6);
    CFTypeID v8 = v7;
    int v9 = *(_DWORD *)v7;
    long long v10 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v10) {
      long long v10 = (CA::Transaction *)CA::Transaction::create(v7);
    }
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    objc_super v12 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v12)
    {
      uint64_t v13 = v12;
      *objc_super v12 = 0;
      v12[1] = 0;
      long long v14 = (CA::Layer::State *)(v12 + 5);
      if (v9) {
        int v15 = 33554434;
      }
      else {
        int v15 = 0x2000000;
      }
      v13[3] = 0;
      v13[4] = 0;
      v13[2] = v4;
      CA::Layer::State::State(v14, v8, v10);
      v13[19] = 0;
      v13[20] = 0;
      *((_DWORD *)v13 + 44) = 0;
      v13[21] = 0;
      *(_OWORD *)(v13 + 23) = 0u;
      *(_OWORD *)(v13 + 25) = 0u;
      *(_OWORD *)(v13 + 27) = 0u;
      *(_OWORD *)(v13 + 29) = 0u;
      *((unsigned char *)v13 + 248) = 0;
      v13[32] = 0;
      v13[33] = 0;
      v13[35] = 0;
      v13[36] = 0;
      *(_DWORD *)uint64_t v13 = 1;
      *((_DWORD *)v13 + 1) = v15;
      v13[34] = 0;
      v4->_attr.layer = v13;
    }
  }
  return v4;
}

- (void)setInheritsTiming:(BOOL)a3
{
}

- (void)setShadowPathIsBounds:(BOOL)a3
{
}

- (void)setSublayerTransform:(CATransform3D *)sublayerTransform
{
}

- (void)setInvertsShadow:(BOOL)a3
{
}

- (void)renderInContext:(CGContextRef)ctx
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([(CALayer *)self isHidden]) {
    return;
  }
  uint64_t v5 = (CA::Transaction *)[(CALayer *)self opacity];
  if (v6 <= 0.0) {
    return;
  }
  float v7 = v6;
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) == 0)
  {
    [(CALayer *)self layoutIfNeeded];
    uint64_t v5 = (CA::Transaction *)[(CALayer *)self displayIfNeeded];
  }
  CFTypeID v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8) {
    CFTypeID v8 = (CA::Transaction *)CA::Transaction::create(v5);
  }
  [(CALayer *)self shadowOpacity];
  float v10 = v9;
  BOOL v11 = [(CALayer *)self masksToBounds];
  int v12 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v12 + 1;
  if (!v12) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v13 = [(CALayer *)self mask];
  CA::Transaction::unlock(v8);
  if (v11)
  {
    [(CALayer *)self bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    CGContextSaveGState(ctx);
    if ([(CALayer *)self _usesCornerRadii])
    {
      long long v51 = 0u;
      memset(&v50, 0, sizeof(v50));
      [(CALayer *)self cornerRadii];
      CA_CGContextAddUnevenRoundRect(ctx, (uint64_t)&v50, v15, v17, v19, v21);
      CGContextClip(ctx);
    }
    else
    {
      [(CALayer *)self cornerRadius];
      if (v22 <= 0.0)
      {
        v54.origin.double x = v15;
        v54.origin.double y = v17;
        v54.size.double width = v19;
        v54.size.double height = v21;
        CGContextClipToRect(ctx, v54);
      }
      else
      {
        CA_CGContextAddRoundRect(ctx, [(CALayer *)self _continuousCorners], v15, v17, v19, v21, v22);
        CGContextClip(ctx);
      }
    }
  }
  if (v13) {
    CGContextBeginTransparencyLayer(ctx, 0);
  }
  CGContextSaveGState(ctx);
  BOOL v23 = v7 < 1.0;
  if (v7 < 1.0) {
    CGContextSetAlpha(ctx, v7);
  }
  unint64_t v24 = [(CALayer *)self compositingFilter];
  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v25 = CAInternAtom(v24, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_49;
      }
      int v25 = CAInternAtom((const __CFString *)[(__CFString *)v24 type], 0);
    }
    if (v25 <= 253)
    {
      if (v25 > 141)
      {
        switch(v25)
        {
          case 162:
            CGBlendMode v26 = kCGBlendModeDarken;
            goto LABEL_68;
          case 163:
          case 164:
          case 165:
          case 166:
          case 167:
          case 171:
            goto LABEL_49;
          case 168:
            CGBlendMode v26 = kCGBlendModeDestinationAtop;
            goto LABEL_68;
          case 169:
            CGBlendMode v26 = kCGBlendModeDestinationIn;
            goto LABEL_68;
          case 170:
            CGBlendMode v26 = kCGBlendModeDestinationOut;
            goto LABEL_68;
          case 172:
            CGBlendMode v26 = kCGBlendModeDestinationOver;
            goto LABEL_68;
          case 173:
            CGBlendMode v26 = kCGBlendModeDifference;
            goto LABEL_68;
          default:
            if (v25 == 142)
            {
              CGBlendMode v26 = kCGBlendModeCopy;
            }
            else
            {
              if (v25 != 218) {
                goto LABEL_49;
              }
              CGBlendMode v26 = kCGBlendModeExclusion;
            }
            break;
        }
        goto LABEL_68;
      }
      switch(v25)
      {
        case 'Z':
          CGBlendMode v26 = kCGBlendModeClear;
          goto LABEL_68;
          CGBlendMode v26 = kCGBlendModeColorBurn;
          goto LABEL_68;
        case 'b':
          CGBlendMode v26 = kCGBlendModeColorDodge;
          goto LABEL_68;
      }
    }
    else
    {
      if (v25 > 489)
      {
        switch(v25)
        {
          case 515:
            CGBlendMode v26 = kCGBlendModeSoftLight;
            goto LABEL_68;
          case 516:
          case 517:
          case 519:
          case 521:
          case 522:
            goto LABEL_49;
          case 518:
            CGBlendMode v26 = kCGBlendModeSourceAtop;
            goto LABEL_68;
          case 520:
            CGBlendMode v26 = kCGBlendModeSourceIn;
            goto LABEL_68;
          case 523:
            CGBlendMode v26 = kCGBlendModeSourceOut;
            goto LABEL_68;
          default:
            if (v25 == 609)
            {
              CGBlendMode v26 = kCGBlendModeXOR;
            }
            else
            {
              if (v25 != 490) {
                goto LABEL_49;
              }
              CGBlendMode v26 = kCGBlendModeScreen;
            }
            break;
        }
        goto LABEL_68;
      }
      if (v25 > 417)
      {
        switch(v25)
        {
          case 418:
            CGBlendMode v26 = kCGBlendModeOverlay;
            goto LABEL_68;
          case 431:
            CGBlendMode v26 = kCGBlendModePlusDarker;
            goto LABEL_68;
          case 433:
            CGBlendMode v26 = kCGBlendModePlusLighter;
            goto LABEL_68;
        }
      }
      else
      {
        switch(v25)
        {
          case 254:
            CGBlendMode v26 = kCGBlendModeHardLight;
            goto LABEL_68;
          case 350:
            CGBlendMode v26 = kCGBlendModeLighten;
            goto LABEL_68;
          case 395:
            CGBlendMode v26 = kCGBlendModeMultiply;
LABEL_68:
            CGContextSetBlendMode(ctx, v26);
            if (v10 <= 0.0) {
              goto LABEL_86;
            }
            BOOL v23 = 1;
            goto LABEL_70;
        }
      }
    }
  }
LABEL_49:
  if (v10 <= 0.0)
  {
    if (v7 >= 1.0) {
      goto LABEL_78;
    }
LABEL_86:
    CGContextBeginTransparencyLayer(ctx, 0);
    [(CALayer *)self _renderBackgroundInContext:ctx];
    [(CALayer *)self _renderForegroundInContext:ctx];
    [(CALayer *)self _renderSublayersInContext:ctx];
    [(CALayer *)self _renderBorderInContext:ctx];
    CGContextEndTransparencyLayer(ctx);
    goto LABEL_87;
  }
LABEL_70:
  int v27 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v27 + 1;
  if (!v27) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  [(CALayer *)self shadowOffset];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  [(CALayer *)self shadowRadius];
  double v33 = v32;
  unint64_t v34 = [(CALayer *)self shadowColor];
  CFTypeID v35 = v34;
  if (v34 && CGColorGetAlpha(v34) > 0.0)
  {
    if (v10 == 1.0)
    {
      float64x2_t v40 = v35;
    }
    else
    {
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v35);
      unint64_t v37 = NumberOfComponents << 32;
      size_t v38 = 8 * (int)NumberOfComponents;
      if (NumberOfComponents << 32 > 0x2001FFFFFFFLL)
      {
        int v39 = (char *)malloc_type_malloc(8 * (int)NumberOfComponents, 0x100004000313F17uLL);
      }
      else
      {
        MEMORY[0x1F4188790](NumberOfComponents);
        int v39 = (char *)&v45 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v39, v38);
      }
      Components = CGColorGetComponents(v35);
      memcpy(v39, Components, v38);
      *(double *)&v39[(uint64_t)(v37 - 0x100000000) >> 29] = *(double *)&v39[(uint64_t)(v37 - 0x100000000) >> 29]
                                                            * v10;
      ColorSpace = CGColorGetColorSpace(v35);
      float64x2_t v40 = CGColorCreate(ColorSpace, (const CGFloat *)v39);
      if (v37 >= 0x20000000001) {
        free(v39);
      }
    }
    float v43 = v33 + v33;
    CGFloat v44 = v43;
    v53.double width = v29;
    v53.double height = v31;
    CGContextSetShadowWithColor(ctx, v53, v44, v40);
    if (v40 != v35) {
      CGColorRelease(v40);
    }
    CA::Transaction::unlock(v8);
    goto LABEL_86;
  }
  CA::Transaction::unlock(v8);
  if (v23) {
    goto LABEL_86;
  }
LABEL_78:
  [(CALayer *)self _renderBackgroundInContext:ctx];
  [(CALayer *)self _renderForegroundInContext:ctx];
  [(CALayer *)self _renderSublayersInContext:ctx];
  [(CALayer *)self _renderBorderInContext:ctx];
LABEL_87:
  CGContextRestoreGState(ctx);
  if (v13)
  {
    memset(&v50, 0, sizeof(v50));
    CA::Layer::get_frame_transform((CA::Layer *)v13->_attr.layer, &v50, 0);
    if (CA_CGAffineTransformIsValid())
    {
      CGContextSaveGState(ctx);
      memset(&v49[1], 0, sizeof(CGAffineTransform));
      CGContextGetBaseCTM();
      v49[0] = v50;
      CGContextConcatCTM(ctx, v49);
      CGAffineTransform v47 = v50;
      CGAffineTransform v46 = v49[1];
      CGAffineTransformConcat(&v48, &v47, &v46);
      CGContextSetBaseCTM();
      CGContextSetBlendMode(ctx, kCGBlendModeDestinationIn);
      CGContextBeginTransparencyLayer(ctx, 0);
      [(CALayer *)v13 renderInContext:ctx];
      CGContextEndTransparencyLayer(ctx);
      CGAffineTransform v45 = v49[1];
      CGContextSetBaseCTM();
      CGContextRestoreGState(ctx);
    }
    CGContextEndTransparencyLayer(ctx);
  }
  if (v11) {
    CGContextRestoreGState(ctx);
  }
}

- (BOOL)isHidden
{
  return (*((unsigned __int8 *)self->_attr.layer + 48) >> 5) & 1;
}

- (BOOL)masksToBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 1) & 1;
}

- (float)shadowOpacity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1F7u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CALayer)mask
{
  return CA::Layer::mask((CA::Layer *)self->_attr.layer);
}

- (id)compositingFilter
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x71u, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (void)layoutIfNeeded
{
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) == 0)
  {
    float v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
    unsigned int v4 = v3[25];
    v3[25] = v4 + 1;
    if (!v4) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    layer = (atomic_uint *)self->_attr.layer;
    while (1)
    {
      atomic_uint v6 = *layer;
      if (!*layer) {
        break;
      }
      atomic_uint v7 = *layer;
      atomic_compare_exchange_strong(layer, (unsigned int *)&v7, v6 + 1);
      if (v7 == v6) {
        goto LABEL_10;
      }
    }
    layer = 0;
LABEL_10:
    unint64_t v24 = (CA::Layer *)layer;
    while (1)
    {
      CFTypeID v8 = (CA::Layer *)CA::Layer::retain_parent((CA::Layer *)layer, (CA::Transaction *)v3);
      if (!v8) {
        break;
      }
      float v9 = (atomic_uint *)v8;
      uint64_t v10 = v3[24];
      if ((v10 & 0x80000000) != 0 || (int v11 = *((_DWORD *)v8 + v10 + 68)) == 0) {
        int v11 = *CA::Layer::thread_flags_(v8, (CA::Transaction *)v3);
      }
      if ((v11 & 0x40) == 0)
      {
        while (1)
        {
          atomic_uint v16 = *v9;
          if (!*v9) {
            goto LABEL_27;
          }
          atomic_uint v15 = *v9;
          atomic_compare_exchange_strong(v9, (unsigned int *)&v15, v16 - 1);
          if (v15 == v16)
          {
            if (v16 == 1)
            {
              CA::Layer::destroy((CA::Layer *)v9);
              CA::Layer::~Layer((CA::AttrList **)v9);
              malloc_zone = (malloc_zone_t *)get_malloc_zone();
              malloc_zone_free(malloc_zone, v9);
            }
            goto LABEL_27;
          }
        }
      }
      unint64_t v24 = (CA::Layer *)v9;
      if (layer)
      {
        while (1)
        {
          atomic_uint v12 = *layer;
          if (!*layer) {
            break;
          }
          atomic_uint v13 = *layer;
          atomic_compare_exchange_strong(layer, (unsigned int *)&v13, v12 - 1);
          if (v13 == v12)
          {
            if (v12 == 1)
            {
              CA::Layer::destroy((CA::Layer *)layer);
              CA::Layer::~Layer((CA::AttrList **)layer);
              double v14 = (malloc_zone_t *)get_malloc_zone();
              malloc_zone_free(v14, layer);
            }
            break;
          }
        }
      }
      layer = v9;
    }
LABEL_27:
    uint64_t v18 = *((void *)v24 + 2);
    if (v18) {
      uint64_t v19 = CALayerRetain(v18);
    }
    else {
      uint64_t v19 = 0;
    }
    CA::Transaction::unlock((CA::Transaction *)v3);
    if (v19)
    {
      CA::Layer::layout_if_needed(v24, (CA::Transaction *)v3);
      uint64_t v20 = *((void *)v24 + 2);
      if (v20) {
        CALayerRelease(v20);
      }
    }
    while (1)
    {
      int v21 = *(_DWORD *)v24;
      if (!*(_DWORD *)v24) {
        break;
      }
      int v22 = *(_DWORD *)v24;
      atomic_compare_exchange_strong((atomic_uint *volatile)v24, (unsigned int *)&v22, v21 - 1);
      if (v22 == v21)
      {
        if (v21 == 1)
        {
          CA::Layer::destroy(v24);
          CA::Layer::~Layer((CA::AttrList **)v24);
          BOOL v23 = (malloc_zone_t *)get_malloc_zone();
          malloc_zone_free(v23, v24);
        }
        return;
      }
    }
  }
}

- (void)displayIfNeeded
{
  if ([(CALayer *)self needsDisplay])
  {
    [(CALayer *)self display];
  }
}

- (BOOL)needsDisplay
{
  layer = (CA::Layer *)self->_attr.layer;
  float v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  uint64_t v4 = v3[24];
  if ((v4 & 0x80000000) != 0 || (unsigned int v5 = *((_DWORD *)layer + v4 + 68)) == 0) {
    unsigned int v5 = *CA::Layer::thread_flags_(layer, (CA::Transaction *)v3);
  }
  return (v5 >> 8) & 1;
}

- (void)_renderSublayersInContext:(CGContext *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    unsigned int v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  atomic_uint v7 = (void *)[(NSArray *)[(CALayer *)self sublayers] copy];
  CA::Transaction::unlock(v5);
  uint64_t v8 = [v7 count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      int v11 = (CA::Layer **)objc_msgSend(v7, "objectAtIndex:", i, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx);
      memset(&v18, 0, sizeof(v18));
      CA::Layer::get_frame_transform(v11[2], &v18, 0);
      if (CA_CGAffineTransformIsValid())
      {
        CGContextSaveGState(a3);
        memset(&v17, 0, sizeof(v17));
        CGContextGetBaseCTM();
        CGAffineTransform transform = v18;
        CGContextConcatCTM(a3, &transform);
        CGAffineTransform t1 = v18;
        CGAffineTransform t2 = v17;
        CGAffineTransformConcat(&v15, &t1, &t2);
        CGContextSetBaseCTM();
        [v11 renderInContext:a3];
        CGAffineTransform v12 = v17;
        CGContextSetBaseCTM();
        CGContextRestoreGState(a3);
      }
    }
  }
}

- (NSArray)sublayers
{
  return (NSArray *)CA::Layer::sublayers((CA::Layer *)self->_attr.layer);
}

- (void)_renderBorderInContext:(CGContext *)a3
{
  unsigned int v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    unsigned int v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  [(CALayer *)self borderWidth];
  CGFloat v8 = v7;
  uint64_t v9 = [(CALayer *)self borderColor];
  if (v8 > 0.0)
  {
    uint64_t v10 = v9;
    if (v9)
    {
      if (CGColorGetAlpha(v9) > 0.0)
      {
        CGContextSaveGState(a3);
        if (![(CALayer *)self edgeAntialiasingMask]) {
          CGContextSetShouldAntialias(a3, 0);
        }
        CGContextSetStrokeColorWithColor(a3, v10);
        CGContextSetLineWidth(a3, v8);
        [(CALayer *)self bounds];
        CGFloat v11 = v8 * 0.5;
        CGRect v25 = CGRectInset(v24, v8 * 0.5, v8 * 0.5);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        double width = v25.size.width;
        double height = v25.size.height;
        [(CALayer *)self cornerRadius];
        double v17 = v16;
        [(CALayer *)self borderOffset];
        double v19 = v18;
        double v20 = v17 - v11;
        if (v18 != 0.0)
        {
          CGFloat v21 = -v18;
          v26.origin.CGFloat x = x;
          v26.origin.CGFloat y = y;
          v26.size.double width = width;
          v26.size.double height = height;
          CGRect v27 = CGRectInset(v26, v21, -v19);
          CGFloat x = v27.origin.x;
          CGFloat y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
          if (v19 + v20 >= 0.0) {
            double v20 = v19 + v20;
          }
          else {
            double v20 = 0.0;
          }
        }
        CA_CGContextAddRoundRect(a3, [(CALayer *)self _continuousCorners], x, y, width, height, v20);
        CA::Transaction::unlock(v5);
        CGContextStrokePath(a3);
        int v22 = *((_DWORD *)v5 + 25);
        *((_DWORD *)v5 + 25) = v22 + 1;
        if (!v22) {
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        }
        CGContextRestoreGState(a3);
      }
    }
  }

  CA::Transaction::unlock(v5);
}

- (CGFloat)borderWidth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x45u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGColorRef)borderColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x42u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (void)_renderBackgroundInContext:(CGContext *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    unsigned int v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  double v7 = [(CALayer *)self backgroundColor];
  CGFloat v8 = v7;
  if (v7 && CGColorGetAlpha(v7) > 0.0)
  {
    [(CALayer *)self bounds];
    double v10 = v9;
    double v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(CALayer *)self cornerRadius];
    CGFloat v18 = v17;
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    CGPatternRef Pattern = CGColorGetPattern(v8);
    if (Pattern)
    {
      CGContextGetBaseCTM();
      CGAffineTransform v30 = v22;
      CGContextGetCTM(&v22, a3);
      CGAffineTransform v29 = v22;
      if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
      {
        t1.b = 0.0;
        t1.c = 0.0;
        t1.a = 1.0;
        *(_OWORD *)&t1.d = xmmword_184997E00;
        t1.tCGFloat y = v16;
        CGAffineTransform t2 = v29;
        CGAffineTransformConcat(&v29, &t1, &t2);
        CGPatternGetStep();
        v32.double height = fmod(v16, v20);
        v32.double width = 0.0;
        CGContextSetPatternPhase(a3, v32);
      }
      if (CGPatternGetShading())
      {
        CGAffineTransformMakeScale(&v26, v14, v16);
        CGAffineTransform v25 = v29;
        CGAffineTransformConcat(&v22, &v26, &v25);
        CGAffineTransform v29 = v22;
      }
      CGAffineTransform v24 = v29;
      CGContextSetBaseCTM();
    }
    CGContextSaveGState(a3);
    if (![(CALayer *)self edgeAntialiasingMask]) {
      CGContextSetShouldAntialias(a3, 0);
    }
    CGContextSetFillColorWithColor(a3, v8);
    if ([(CALayer *)self _usesCornerRadii])
    {
      long long v23 = 0u;
      memset(&v22, 0, sizeof(v22));
      if (self) {
        [(CALayer *)self cornerRadii];
      }
      CA_CGContextAddUnevenRoundRect(a3, (uint64_t)&v22, v10, v12, v14, v16);
    }
    else
    {
      CA_CGContextAddRoundRect(a3, [(CALayer *)self _continuousCorners], v10, v12, v14, v16, v18);
    }
    CA::Transaction::unlock(v5);
    CGContextFillPath(a3);
    int v21 = *((_DWORD *)v5 + 25);
    *((_DWORD *)v5 + 25) = v21 + 1;
    if (!v21) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    CGContextRestoreGState(a3);
    if (Pattern) {
      CGContextSetBaseCTM();
    }
  }
  CA::Transaction::unlock(v5);
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    unsigned int v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  tinted_contents = [(CALayer *)self contents];
  if (tinted_contents)
  {
    [(CALayer *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    CFTypeID v16 = CFGetTypeID(tinted_contents);
    if (v16 == CGImageGetTypeID())
    {
LABEL_7:
      char v17 = 0;
      goto LABEL_45;
    }
    if (CABackingStoreGetTypeID::once[0] != -1) {
      dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
    }
    if (v16 == CABackingStoreGetTypeID::type)
    {
      CGFloat v18 = CABackingStoreCopyCGImage((uint64_t)tinted_contents);
      double v19 = CABackingStoreCopyTintColor((uint64_t)tinted_contents);
      if (v19)
      {
        long double v20 = v19;
        tinted_contents = (mach_port_t *)create_tinted_contents(v18, v19, 0);
        CGImageRelease(v18);
        CGColorRelease(v20);
LABEL_17:
        char v17 = 1;
        goto LABEL_45;
      }
      char v17 = 1;
LABEL_33:
      tinted_contents = (mach_port_t *)v18;
      goto LABEL_45;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v18 = (CGImage *)[(mach_port_t *)tinted_contents image];
      if (v18)
      {
        int v21 = (CGColor *)[(mach_port_t *)tinted_contents tint];
        if (v21)
        {
          tinted_contents = (mach_port_t *)create_tinted_contents(v18, v21, 0);
          goto LABEL_17;
        }
        char v17 = 0;
        goto LABEL_33;
      }
LABEL_31:
      char v17 = 0;
      tinted_contents = 0;
      goto LABEL_45;
    }
    if (CAMachPortGetTypeID::once[0] != -1) {
      dispatch_once(CAMachPortGetTypeID::once, &__block_literal_global_5766);
    }
    if (v16 == CAMachPortGetTypeID::type)
    {
      CGAffineTransform v22 = IOSurfaceLookupFromMachPort(tinted_contents[4]);
      tinted_contents = (mach_port_t *)v22;
      if (!v22) {
        goto LABEL_7;
      }
      PixelFormat = (CA::Render *)IOSurfaceGetPixelFormat(v22);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      CGAffineTransform v25 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x158uLL, 0x743898A5uLL);
      if (v25)
      {
        int v26 = CA::Render::fourcc_to_format(PixelFormat);
        CA::Render::Surface::Surface((uint64_t)v25, (IOSurfaceRef)tinted_contents, v26, 2, 0, 0, 0);
      }
      CGRect v27 = (__IOSurface *)*((void *)v25 + 14);
      unsigned int v28 = (*(uint64_t (**)(void *))(*(void *)v25 + 104))(v25);
      if (v28 > 0x23) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = dword_184999348[v28];
      }
      tinted_contents = (mach_port_t *)CACreateIOSurfaceBackedCGImage(v27, v29, *((void *)v25 + 6));
      char v17 = 1;
      if (atomic_fetch_add((atomic_uint *volatile)v25 + 2, 0xFFFFFFFF) != 1)
      {
LABEL_45:
        CGContextSaveGState(a3);
        if (!tinted_contents)
        {
          CA::Transaction::unlock(v5);
          [(CALayer *)self _prepareContext:a3];
          v125.origin.CGFloat x = v9;
          v125.origin.CGFloat y = v11;
          v125.size.double width = v13;
          v125.size.double height = v15;
          CGContextClipToRect(a3, v125);
          CGContextBeginTransparencyLayer(a3, 0);
          objc_msgSend(CA::Layer::layer_being_drawn((CA::Layer *)self->_attr.layer, v5, 0x800000), "drawInContext:", a3);
          CGContextEndTransparencyLayer(a3);
          int v53 = *((_DWORD *)v5 + 25);
          *((_DWORD *)v5 + 25) = v53 + 1;
          if (!v53) {
            os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
          }
          goto LABEL_143;
        }
        layer = self->_attr.layer;
        double Width = (double)CGImageGetWidth((CGImageRef)tinted_contents);
        double Height = (double)CGImageGetHeight((CGImageRef)tinted_contents);
        if (layer[56])
        {
          [(CALayer *)self contentsScale];
          double Width = Width / v39;
          double Height = Height / v39;
        }
        double v97 = 0.0;
        double v98 = Width;
        double v99 = Height;
        double v96 = 0.0;
        if ((*((_DWORD *)layer + 13) & 0x80000000) != 0)
        {
          [(CALayer *)self contentsRect];
          if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0) {
            double v41 = 1.0 - (v41 + v43);
          }
          double Width = v42 * Width;
          double Height = v43 * Height;
          double v96 = -(v99 * v41);
          double v97 = -(v98 * v40);
        }
        long long v108 = 0uLL;
        double v106 = 0.0;
        double v107 = 0.0;
        unsigned int v44 = (*((_DWORD *)layer + 11) >> 3) & 0xF;
        v109.a = v9;
        v109.b = v11;
        v109.c = v13;
        v109.d = v15;
        if (v13 < 0.0)
        {
          v109.a = v13 + v9;
          v109.c = -v13;
        }
        if (v15 < 0.0)
        {
          v109.b = v15 + v11;
          v109.d = -v15;
        }
        v118.f64[0] = Width;
        v118.f64[1] = Height;
        CA::Render::compute_gravity_transform(v44, &v109.a, &v118, (uint64_t)&v108, (uint64_t)&v106);
        t1.a = v106;
        t1.b = 0.0;
        t1.c = 0.0;
        t1.d = v107;
        *(_OWORD *)&t1.tCGFloat x = v108;
        [(CALayer *)self contentsTransform];
        CGAffineTransformConcat(&v109, &t1, &t2);
        CGAffineTransform transform = v109;
        CGContextConcatCTM(a3, &transform);
        if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
        {
          v102.b = 0.0;
          v102.c = 0.0;
          v102.a = 1.0;
          *(_OWORD *)&v102.d = xmmword_184997E00;
          v102.tCGFloat y = Height;
          CGContextConcatCTM(a3, &v102);
        }
        if (![(CALayer *)self edgeAntialiasingMask]) {
          CGContextSetShouldAntialias(a3, 0);
        }
        v122.origin.CGFloat x = 0.0;
        v122.origin.CGFloat y = 0.0;
        v122.size.double width = Width;
        v122.size.double height = Height;
        CGContextClipToRect(a3, v122);
        if ((v17 & 1) == 0) {
          CGImageRetain((CGImageRef)tinted_contents);
        }
        int v45 = *((_DWORD *)layer + 13);
        CGAffineTransform v46 = [(CALayer *)self contentsMultiplyColor];
        CGAffineTransform v47 = [(CALayer *)self contentsSwizzle];
        if (v47 == @"RGBA"
          || ![(__CFString *)v47 isEqualToString:@"AAAA"])
        {
          CGAffineTransform v50 = 0;
          if (!v46 || v46 == (CGColor *)white)
          {
LABEL_72:
            if (!(*((_DWORD *)layer + 13) & 0x40000000 | v45 & 0x400)
              || (v52 = v106, double v51 = v107, v106 == 1.0) && v107 == 1.0)
            {
              CA::Transaction::unlock(v5);
              if (CGImageIsMask((CGImageRef)tinted_contents))
              {
                v123.origin.CGFloat y = v96;
                v123.origin.CGFloat x = v97;
                v123.size.double width = v98;
                v123.size.double height = v99;
                CGContextClipToMask(a3, v123, (CGImageRef)tinted_contents);
                CGContextSetFillColorWithColor(a3, v46);
                v124.origin.CGFloat y = v96;
                v124.origin.CGFloat x = v97;
                v124.size.double width = v98;
                v124.size.double height = v99;
                CGContextFillRect(a3, v124);
              }
              else
              {
                if (v50) {
                  CGRect v54 = v50;
                }
                else {
                  CGRect v54 = (CGImage *)tinted_contents;
                }
                v126.origin.CGFloat y = v96;
                v126.origin.CGFloat x = v97;
                v126.size.double width = v98;
                v126.size.double height = v99;
                CGContextDrawImage(a3, v126, v54);
              }
              int v55 = *((_DWORD *)v5 + 25);
              *((_DWORD *)v5 + 25) = v55 + 1;
              if (v55) {
                goto LABEL_84;
              }
            }
            else
            {
              if (v50) {
                v56 = v50;
              }
              else {
                v56 = (CGImage *)tinted_contents;
              }
              [(CALayer *)self contentsCenter];
              double v58 = v57;
              double v60 = v59;
              double v62 = v61;
              double v64 = v63;
              CGContextBeginTransparencyLayer(a3, 0);
              CGContextSetBlendMode(a3, kCGBlendModeCopy);
              if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0) {
                double v60 = 1.0 - (v60 + v64);
              }
              BOOL v65 = [(CALayer *)self literalContentsCenter];
              if (v62 == 0.0)
              {
                if (v65) {
                  double v62 = 0.01;
                }
                else {
                  double v62 = 1.0 / Width;
                }
                double v58 = v58 + v62 * -0.5;
              }
              if (v64 == 0.0)
              {
                if (v65) {
                  double v64 = 0.01;
                }
                else {
                  double v64 = 1.0 / Height;
                }
                double v60 = v60 + v64 * -0.5;
              }
              v109.a = 0.0;
              v109.b = v58 * Width;
              v109.c = (v58 + v62) * Width;
              v109.d = Width;
              uint64_t v114 = 0;
              double v66 = Width + (v109.c - Width) / v52;
              if (Width >= v58 * Width / v52) {
                double v67 = v58 * Width / v52;
              }
              else {
                double v67 = Width;
              }
              double v68 = 0.0;
              if (v67 < 0.0) {
                double v67 = 0.0;
              }
              if (Width < v66) {
                double v66 = Width;
              }
              if (v66 < 0.0) {
                double v66 = 0.0;
              }
              double v115 = v67;
              double v116 = v66;
              double v117 = Width;
              if (v67 > v66)
              {
                double v115 = (v66 + v67) * 0.5;
                double v116 = v115;
              }
              v118.f64[0] = 0.0;
              v118.f64[1] = v60 * Height;
              double v119 = (v60 + v64) * Height;
              double v120 = Height;
              uint64_t v110 = 0;
              double v69 = v60 * Height / v51;
              double v70 = Height + (v119 - Height) / v51;
              if (Height < v69) {
                double v69 = Height;
              }
              if (v69 < 0.0) {
                double v69 = 0.0;
              }
              if (Height < v70) {
                double v70 = Height;
              }
              if (v70 >= 0.0) {
                double v68 = v70;
              }
              double v111 = v69;
              double v112 = v68;
              double v113 = Height;
              if (v69 > v68)
              {
                double v111 = (v68 + v69) * 0.5;
                double v112 = v111;
              }
              CGContextSetShouldAntialias(a3, 0);
              CA::Transaction::unlock(v5);
              uint64_t v71 = 0;
              double v72 = 0.0;
              double v73 = 0.0;
              do
              {
                double v89 = v118.f64[++v71];
                double v92 = v72;
                double v87 = *((double *)&v110 + v71);
                double v91 = v87 - v72;
                if (v87 - v72 > 0.0)
                {
                  uint64_t v74 = 0;
                  tCGFloat y = -v73;
                  double rect = v89 - v73;
                  double v88 = -(v89 - v73);
                  double v75 = 0.0;
                  double v94 = 0.0;
                  sCGFloat y = v91 / (v89 - v73);
                  do
                  {
                    double v76 = v94;
                    ++v74;
                    double v93 = *((double *)&v114 + v74);
                    double v94 = *(&v109.a + v74);
                    double v77 = v93 - v75;
                    if (v93 - v75 > 0.0)
                    {
                      double v78 = v94 - v76;
                      if ((v45 & 0x400) != 0)
                      {
                        double v79 = v106 * v75;
                        double v80 = v107 * v92;
                        double v81 = v106 * v77;
                        double v82 = v107 * v91;
                        double v83 = v107 * v92;
                        double v95 = rect;
                        if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
                        {
                          v127.origin.CGFloat x = v79;
                          v127.origin.CGFloat y = v107 * v92;
                          v127.size.double width = v81;
                          v127.size.double height = v107 * v91;
                          double v83 = CGRectGetMaxY(v127) - rect;
                          double v95 = v88;
                        }
                        double v84 = -v76;
                        double i = v79;
                        while (1)
                        {
                          v128.origin.CGFloat x = v79;
                          v128.origin.CGFloat y = v80;
                          v128.size.double width = v81;
                          v128.size.double height = v82;
                          if (v83 >= CGRectGetMaxY(v128)) {
                            break;
                          }
                          v129.origin.CGFloat x = i;
                          v129.origin.CGFloat y = v83;
                          v129.size.double width = v78;
                          v129.size.double height = rect;
                          if (CGRectGetMaxY(v129) <= v80) {
                            break;
                          }
                          for (double i = v79; ; double i = i + v78)
                          {
                            v130.origin.CGFloat x = v79;
                            v130.origin.CGFloat y = v80;
                            v130.size.double width = v81;
                            v130.size.double height = v82;
                            if (i >= CGRectGetMaxX(v130)) {
                              break;
                            }
                            CGContextSaveGState(a3);
                            CGContextScaleCTM(a3, 1.0 / v106, 1.0 / v107);
                            v131.origin.CGFloat x = i;
                            v131.origin.CGFloat y = v83;
                            v131.size.double width = v78;
                            v131.size.double height = rect;
                            CGContextClipToRect(a3, v131);
                            CGContextTranslateCTM(a3, i, v83);
                            CGContextTranslateCTM(a3, v84, ty);
                            v132.origin.CGFloat y = v96;
                            v132.origin.CGFloat x = v97;
                            v132.size.double width = v98;
                            v132.size.double height = v99;
                            CGContextDrawImage(a3, v132, v56);
                            CGContextRestoreGState(a3);
                          }
                          double v83 = v83 + v95;
                        }
                      }
                      else
                      {
                        CGContextSaveGState(a3);
                        v133.origin.CGFloat x = v75;
                        v133.size.double height = v91;
                        v133.origin.CGFloat y = v92;
                        v133.size.double width = v93 - v75;
                        CGContextClipToRect(a3, v133);
                        CGContextTranslateCTM(a3, v75, v92);
                        CGContextScaleCTM(a3, v77 / v78, sy);
                        CGContextTranslateCTM(a3, -v76, ty);
                        v134.origin.CGFloat y = v96;
                        v134.origin.CGFloat x = v97;
                        v134.size.double width = v98;
                        v134.size.double height = v99;
                        CGContextDrawImage(a3, v134, v56);
                        CGContextRestoreGState(a3);
                      }
                    }
                    double v75 = v93;
                  }
                  while (v74 != 3);
                }
                double v72 = v87;
                double v73 = v89;
              }
              while (v71 != 3);
              CGContextEndTransparencyLayer(a3);
              int v86 = *((_DWORD *)v5 + 25);
              *((_DWORD *)v5 + 25) = v86 + 1;
              if (v86)
              {
LABEL_84:
                if (!v50) {
                  goto LABEL_142;
                }
                goto LABEL_141;
              }
            }
            os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
            if (!v50)
            {
LABEL_142:
              CGImageRelease((CGImageRef)tinted_contents);
LABEL_143:
              CGContextRestoreGState(a3);
              goto LABEL_144;
            }
LABEL_141:
            CGImageRelease(v50);
            goto LABEL_142;
          }
          CGImageRef v49 = create_tinted_contents((CGImage *)tinted_contents, v46, 0);
        }
        else
        {
          if (v46) {
            CGAffineTransform v48 = v46;
          }
          else {
            CGAffineTransform v48 = (CGColor *)white;
          }
          CGImageRef v49 = create_tinted_contents((CGImage *)tinted_contents, v48, 1);
        }
        CGAffineTransform v50 = v49;
        goto LABEL_72;
      }
LABEL_44:
      (*(void (**)(void *))(*(void *)v25 + 16))(v25);
      goto LABEL_45;
    }
    CGAffineTransform v30 = (CA::Render::Image *)[(mach_port_t *)tinted_contents CA_copyRenderValue];
    CGAffineTransform v25 = v30;
    if (!v30) {
      goto LABEL_31;
    }
    int v31 = *((unsigned __int8 *)v30 + 12);
    if (v31 == 51)
    {
      double v33 = (__IOSurface *)*((void *)v30 + 14);
      unsigned int v34 = (*(uint64_t (**)(CA::Render::Image *))(*(void *)v30 + 104))(v30);
      if (v34 > 0x23) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = dword_184999348[v34];
      }
      CGSize v32 = CACreateIOSurfaceBackedCGImage(v33, v35, *((void *)v25 + 6));
    }
    else
    {
      if (v31 != 23)
      {
        char v17 = 0;
        tinted_contents = 0;
        goto LABEL_43;
      }
      CGSize v32 = CA::Render::Image::copy_cgimage(v30);
    }
    tinted_contents = (mach_port_t *)v32;
    char v17 = 1;
LABEL_43:
    if (atomic_fetch_add((atomic_uint *volatile)v25 + 2, 0xFFFFFFFF) != 1) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_144:
  CA::Transaction::unlock(v5);
}

- (CGColor)contentsMultiplyColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x85u, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (CGAffineTransform)contentsTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x8Bu, (const CGAffineTransform *)0x17, (id *)retstr);
  return result;
}

- (CAEdgeAntialiasingMask)edgeAntialiasingMask
{
  return (*((_DWORD *)self->_attr.layer + 11) >> 7) & 0xF;
}

- (void)setContentsSwizzle:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x8A, (const CGAffineTransform *)3, v3);
}

- (void)setContentsScaling:(id)a3
{
  int v4 = [a3 isEqualToString:@"repeat"];
  layer = (CA::Transaction *)self->_attr.layer;

  CA::Layer::set_bit(layer, 0x89u, 0x4Au, 0xA0u, v4, 0, 0);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  return CAAtomIndexInArray(75, (uint64_t)&-[CALayer(CALayerPrivate) _renderLayerDefinesProperty:]::atoms, a3) != -1;
}

+ (CALayer)layer
{
  id v2 = objc_alloc_init((Class)a1);

  return (CALayer *)v2;
}

- (CALayer)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_attr.magic = 1279351122;
  v15.receiver = self;
  v15.super_class = (Class)CALayer;
  id v2 = [(CALayer *)&v15 init];
  if (v2)
  {
    float v3 = (CA::Layer *)objc_opt_class();
    unsigned int v5 = (CA::Transaction *)CA::Layer::class_state(v3, v4);
    int v6 = v5;
    int v7 = *(_DWORD *)v5;
    double v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v8) {
      double v8 = (CA::Transaction *)CA::Transaction::create(v5);
    }
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    double v10 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v10)
    {
      double v11 = v10;
      *double v10 = 0;
      v10[1] = 0;
      double v12 = (CA::Layer::State *)(v10 + 5);
      if (v7) {
        int v13 = 33554434;
      }
      else {
        int v13 = 0x2000000;
      }
      v11[3] = 0;
      v11[4] = 0;
      v11[2] = v2;
      CA::Layer::State::State(v12, v6, v8);
      v11[19] = 0;
      v11[20] = 0;
      *((_DWORD *)v11 + 44) = 0;
      v11[21] = 0;
      *(_OWORD *)(v11 + 23) = 0u;
      *(_OWORD *)(v11 + 25) = 0u;
      *(_OWORD *)(v11 + 27) = 0u;
      *(_OWORD *)(v11 + 29) = 0u;
      *((unsigned char *)v11 + 248) = 0;
      v11[32] = 0;
      v11[33] = 0;
      v11[35] = 0;
      v11[36] = 0;
      *(_DWORD *)double v11 = 1;
      *((_DWORD *)v11 + 1) = v13;
      v11[34] = 0;
      v2->_attr.layer = v11;
    }
  }
  return v2;
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v4 = CAAtomIndexInArray(49, (uint64_t)&-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::geom_atoms, a3);
  uint64_t v5 = 0;
  while (-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::non_image_atoms[v5] != a3)
  {
    if (++v5 == 7)
    {
      uint64_t v5 = -1;
      break;
    }
  }
  uint64_t v6 = 0;
  while (-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::velocity_atoms[v6] != a3)
  {
    if (++v6 == 8)
    {
      uint64_t v6 = -1;
      break;
    }
  }
  uint64_t v7 = 0;
  do
    int v8 = (unsigned __int16)-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::color_atoms[v7];
  while (v8 != a3 && v7++ != 7);
  if (v5 == -1) {
    unsigned int v10 = (16 * (v4 != -1)) | 0x20;
  }
  else {
    unsigned int v10 = 16 * (v4 != -1);
  }
  if (a3 == 409 || a3 == 257) {
    v10 |= 0x100u;
  }
  if (a3 == 386) {
    v10 |= 0x40u;
  }
  if (v6 != -1) {
    v10 |= 0x800u;
  }
  if (v8 == a3) {
    return v10;
  }
  else {
    return v10 | 0x1000;
  }
}

- (void)removeAllAnimations
{
  float v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  uint64_t v4 = [(CALayer *)self modelLayer];
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (void **)*((void *)v4->_attr.layer + 35);
  if (!v6) {
    return;
  }
  int v7 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v7 + 1;
  if (v7)
  {
    uint64_t v12 = (uint64_t)v6;
    goto LABEL_7;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = v5->_attr.layer;
  uint64_t v6 = (void **)layer[35];
  uint64_t v12 = (uint64_t)v6;
  if (v6)
  {
LABEL_7:
    double v9 = (void **)&v12;
    do
    {
      __int16 v10 = *((_WORD *)v6 + 28);
      if ((v10 & 0x42) != 0)
      {
        *((_WORD *)v6 + 28) = v10 | 4;
        double v9 = v6;
      }
      else
      {
        *double v9 = *v6;
        schedule_stop_callback((uint64_t)v6, (uint64_t *)&animation_state);
        free_non_deferred_animation(v6, 1);
      }
      uint64_t v6 = (void **)*v9;
    }
    while (*v9);
    layer = v5->_attr.layer;
    uint64_t v11 = v12;
    goto LABEL_13;
  }
  uint64_t v11 = 0;
LABEL_13:
  CA::Layer::set_animations(layer, v11);
  CA::Layer::mark_animations((CA::Layer *)v5->_attr.layer, v3, 0);

  CA::Transaction::unlock(v3);
}

- (NSArray)animationKeys
{
  v14[1] = *MEMORY[0x1E4F143B8];
  float v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  uint64_t v4 = [(CALayer *)self modelLayer];
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v6 + 1;
    if (!v6) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    int v7 = (uint64_t *)*((void *)v5->_attr.layer + 35);
    if (v7)
    {
      uint64_t v5 = 0;
      int v8 = (uint64_t **)v7;
      do
      {
        if (v8[2] && ((_WORD)v8[7] & 0x24) == 0) {
          uint64_t v5 = (CALayer *)((char *)v5 + 1);
        }
        int v8 = (uint64_t **)*v8;
      }
      while (v8);
      if (!v5) {
        goto LABEL_22;
      }
      unint64_t v9 = 8 * (void)v5;
      if ((unint64_t)(8 * (void)v5) <= 0x1000)
      {
        MEMORY[0x1F4188790](v4);
        __int16 v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v10, 8 * (void)v5);
        goto LABEL_14;
      }
      __int16 v10 = (char *)malloc_type_malloc(8 * (void)v5, 0x80040B8603338uLL);
      if (v10)
      {
LABEL_14:
        uint64_t v11 = 0;
        do
        {
          uint64_t v12 = v7[2];
          if (v12 && (v7[7] & 0x24) == 0) {
            *(void *)&v10[8 * v11++] = v12;
          }
          int v7 = (uint64_t *)*v7;
        }
        while (v7);
        uint64_t v5 = (CALayer *)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:v5];
        if (v9 > 0x1000) {
          free(v10);
        }
        goto LABEL_22;
      }
    }
    uint64_t v5 = 0;
LABEL_22:
    CA::Transaction::unlock(v3);
  }
  return (NSArray *)v5;
}

- (void)removeAnimationForKey:(NSString *)key
{
  uint64_t v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v6 = [(CALayer *)self modelLayer];
  if (v6)
  {
    int v7 = v6;
    if (*((void *)v6->_attr.layer + 35))
    {
      if ([(NSString *)key length])
      {
        NSUInteger v8 = [(NSString *)key hash];
        int v9 = *((_DWORD *)v5 + 25);
        *((_DWORD *)v5 + 25) = v9 + 1;
        if (!v9) {
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        }
        layer = v7->_attr.layer;
        uint64_t v11 = layer[35];
        uint64_t v15 = v11;
        if (v11)
        {
          uint64_t v12 = &v15;
          while (1)
          {
            if ((*(_WORD *)(v11 + 56) & 4) == 0
              && *(void *)(v11 + 24) == v8
              && [*(id *)(v11 + 16) isEqualToString:key])
            {
              __int16 v13 = *(_WORD *)(v11 + 56);
              if ((v13 & 0x42) == 0)
              {
                *uint64_t v12 = *(void *)v11;
                schedule_stop_callback(v11, (uint64_t *)&animation_state);
                free_non_deferred_animation((void *)v11, 1);
                goto LABEL_14;
              }
              *(_WORD *)(v11 + 56) = v13 | 4;
            }
            uint64_t v12 = (uint64_t *)v11;
LABEL_14:
            uint64_t v11 = *v12;
            if (!*v12)
            {
              layer = v7->_attr.layer;
              uint64_t v14 = v15;
              goto LABEL_19;
            }
          }
        }
        uint64_t v14 = 0;
LABEL_19:
        CA::Layer::set_animations(layer, v14);
        CA::Layer::mark_animations((CA::Layer *)v7->_attr.layer, v5, 0);
        CA::Transaction::unlock(v5);
      }
    }
  }
}

- (CAAnimation)animationForKey:(NSString *)key
{
  uint64_t v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v6 = [(CALayer *)self modelLayer];
  if (!v6) {
    return 0;
  }
  int v7 = v6;
  if (!*((void *)v6->_attr.layer + 35) || ![(NSString *)key length]) {
    return 0;
  }
  int v8 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v8 + 1;
  if (!v8) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  int v9 = (uint64_t **)*((void *)v7->_attr.layer + 35);
  if (v9)
  {
    NSUInteger v10 = [(NSString *)key hash];
    while (((_WORD)v9[7] & 0x24) != 0
         || v9[3] != (uint64_t *)v10
         || ![v9[2] isEqualToString:key])
    {
      int v9 = (uint64_t **)*v9;
      if (!v9) {
        goto LABEL_12;
      }
    }
    uint64_t v11 = v9[1];
  }
  else
  {
LABEL_12:
    uint64_t v11 = 0;
  }
  CA::Transaction::unlock(v5);
  return v11;
}

- (CALayer)modelLayer
{
  layer = (CA::Layer *)self->_attr.layer;
  float v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  CGPoint result = (CALayer *)CA::Layer::model_layer(layer, v3);
  if (result) {
    return (CALayer *)result->_attr.layer;
  }
  return result;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 0;
}

- (void)setNeedsLayoutOnGeometryChange:(BOOL)a3
{
}

- (void)setContentsCenter:(CGRect)contentsCenter
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = contentsCenter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x79, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
}

- (void)insertSublayer:(CALayer *)layer atIndex:(unsigned int)idx
{
  if (layer)
  {
    int v6 = self;
    int v7 = self->_attr.layer;
    if ((*((_DWORD *)v7 + 1) & 0x60000) != 0) {
      self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v7[2] format];
    }
    int v8 = layer->_attr.layer;
    if ((*((_DWORD *)v8 + 1) & 0x60000) != 0) {
      self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v8[2] format];
    }
    int v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    int v10 = *((_DWORD *)v9 + 25);
    *((_DWORD *)v9 + 25) = v10 + 1;
    if (!v10) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, idx);
    CA::Transaction::unlock(v9);
  }
}

- (void)clearHasBeenCommitted
{
}

- (void)setAllowsHitTesting:(BOOL)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)removePresentationModifier:(id)a3
{
  v8[1] = *(objc_object **)MEMORY[0x1E4F143B8];
  layer = (id *)self->_attr.layer;
  int v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  v8[0] = 0;
  CA::Layer::begin_change((CA::Layer *)layer, v6, @"presentationModifiers", (objc_object *)v8, v5);
  [layer[36] removeObject:a3];
  CA::Layer::end_change(layer, v6, 446, (objc_object *)@"presentationModifiers", v8[0]);

  CA::Transaction::unlock(v6);
}

- (CGRect)convertRect:(CGRect)r fromLayer:(CALayer *)l
{
  double height = r.size.height;
  double width = r.size.width;
  double y = r.origin.y;
  double x = r.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!CGRectIsNull(r))
  {
    double v14 = x;
    double v15 = y;
    double v16 = width;
    double v17 = height;
    if (width < 0.0)
    {
      double v14 = width + x;
      double v16 = -width;
    }
    if (height < 0.0)
    {
      double v15 = height + y;
      double v17 = -height;
    }
    CA::Layer::map_geometry((CA::Transaction *)l, self, (void (*)(uint64_t, long long *))applyRect, (void (*)(void, void))unapplyRect, (uint64_t)&v14);
    double x = v14;
    double y = v15;
    double width = v16;
    double height = v17;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)convertRect:(CGRect)r toLayer:(CALayer *)l
{
  double height = r.size.height;
  double width = r.size.width;
  double y = r.origin.y;
  double x = r.origin.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!CGRectIsNull(r))
  {
    double v14 = x;
    double v15 = y;
    double v16 = width;
    double v17 = height;
    if (width < 0.0)
    {
      double v14 = width + x;
      double v16 = -width;
    }
    if (height < 0.0)
    {
      double v15 = height + y;
      double v17 = -height;
    }
    CA::Layer::map_geometry((CA::Transaction *)self, l, (void (*)(uint64_t, long long *))applyRect, (void (*)(void, void))unapplyRect, (uint64_t)&v14);
    double x = v14;
    double y = v15;
    double width = v16;
    double height = v17;
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (BOOL)isFrozen
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 6) & 1;
}

- (void)setRasterizationScale:(CGFloat)rasterizationScale
{
  v18[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)uint64_t v18 = rasterizationScale;
  int v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = self->_attr.layer;
  unsigned int v9 = (*((_DWORD *)layer + 11) >> 28) & 3;
  double v17 = 0.0;
  if (v9)
  {
    double v17 = (double)v9;
  }
  else
  {
    uint64_t v10 = *((void *)layer + 9);
    if (!v10 || (CA::AttrList::get(v10, 458, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v17) & 1) == 0) {
      CA::Layer::default_value((id *)layer, 0x1CAu, (const CGAffineTransform *)0x12, (uint64_t)&v17);
    }
  }
  if (v17 != rasterizationScale)
  {
    double v16 = 0;
    CA::Layer::begin_change((CA::Layer *)layer, v6, @"rasterizationScale", (objc_object *)&v16, v5);
    double v11 = CA::Layer::writable_state((CA::Layer *)layer, v6);
    double v12 = v11;
    if (rasterizationScale == 3.0 || rasterizationScale == 1.0 || rasterizationScale == 2.0)
    {
      *((_DWORD *)v11 + 1) = *((_DWORD *)v11 + 1) & 0xCFFFFFFF | ((rasterizationScale & 3) << 28);
      double v15 = (CA::AttrList *)*((void *)v11 + 4);
      if (v15) {
        double v15 = CA::AttrList::remove(v15, (const void *)0x1CA);
      }
    }
    else
    {
      *((_DWORD *)v11 + 1) &= 0xCFFFFFFF;
      double v13 = (CA::AttrList *)*((void *)v11 + 4);
      if (!v13)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        double v13 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      double v15 = CA::AttrList::set(v13, (const void *)0x1CA, 18, (unsigned __int8 *)v18);
    }
    *((void *)v12 + 4) = v15;
    CA::Layer::end_change((id *)layer, v6, 458, (objc_object *)@"rasterizationScale", v16);
  }
  CA::Transaction::unlock(v6);
}

- (void)setContentsScale:(CGFloat)contentsScale
{
  v18[1] = *MEMORY[0x1E4F143B8];
  *(CGFloat *)uint64_t v18 = contentsScale;
  int v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = self->_attr.layer;
  unsigned int v9 = (*((_DWORD *)layer + 11) >> 26) & 3;
  double v17 = 0.0;
  if (v9)
  {
    double v17 = (double)v9;
  }
  else
  {
    uint64_t v10 = *((void *)layer + 9);
    if (!v10 || (CA::AttrList::get(v10, 136, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v17) & 1) == 0) {
      CA::Layer::default_value((id *)layer, 0x88u, (const CGAffineTransform *)0x12, (uint64_t)&v17);
    }
  }
  if (v17 != contentsScale)
  {
    double v16 = 0;
    CA::Layer::begin_change((CA::Layer *)layer, v6, @"contentsScale", (objc_object *)&v16, v5);
    double v11 = CA::Layer::writable_state((CA::Layer *)layer, v6);
    double v12 = v11;
    *((_DWORD *)v11 + 4) = *((_DWORD *)v11 + 4) & 0xFFFFFFFE | (contentsScale != 1.0);
    if (contentsScale == 3.0 || contentsScale == 1.0 || contentsScale == 2.0)
    {
      *((_DWORD *)v11 + 1) = *((_DWORD *)v11 + 1) & 0xF3FFFFFF | ((contentsScale & 3) << 26);
      double v15 = (CA::AttrList *)*((void *)v11 + 4);
      if (v15) {
        double v15 = CA::AttrList::remove(v15, (const void *)0x88);
      }
    }
    else
    {
      *((_DWORD *)v11 + 1) &= 0xF3FFFFFF;
      double v13 = (CA::AttrList *)*((void *)v11 + 4);
      if (!v13)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        double v13 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      double v15 = CA::AttrList::set(v13, (const void *)0x88, 18, (unsigned __int8 *)v18);
    }
    *((void *)v12 + 4) = v15;
    CA::Layer::end_change((id *)layer, v6, 136, (objc_object *)@"contentsScale", v16);
  }
  CA::Transaction::unlock(v6);
}

- (void)setCornerContentsMasksEdges:(BOOL)a3
{
}

- (void)setMinificationFilter:(CALayerContentsFilter)minificationFilter
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = minificationFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x185, (const CGAffineTransform *)3, v3);
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = borderWidth;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x45, (const CGAffineTransform *)0x12, v3);
}

- (void)setBorderColor:(CGColorRef)borderColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = borderColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x42, (const CGAffineTransform *)2, v3);
}

- (void)setFlipsHorizontalAxis:(BOOL)a3
{
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
}

- (CGPoint)convertPoint:(CGPoint)p toLayer:(CALayer *)l
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CGPoint v6 = p;
  CA::Layer::map_geometry((CA::Transaction *)self, l, (void (*)(uint64_t, long long *))applyVec2r, (void (*)(void, void))unapplyVec2r, (uint64_t)&v6);
  double y = v6.y;
  double x = v6.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGColorSpace)_retainColorSpace
{
  id v2 = CA::Layer::retain_context((CA::Layer *)self->_attr.layer);
  if (v2)
  {
    CGRect v3 = (CA::Context *)v2;
    uint64_t v4 = CGColorSpaceRetain(*((CGColorSpaceRef *)v2 + 14));
    CA::Context::unref(v3, 0);
    return v4;
  }
  else
  {
    CGPoint v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    return CGColorSpaceRetain(v6);
  }
}

- (id)context
{
  id result = CA::Layer::retain_context((CA::Layer *)self->_attr.layer);
  if (result)
  {
    CGRect v3 = (CA::Context *)result;
    uint64_t v4 = (id *)((char *)result + 80);
    if (*((unsigned char *)v3 + 88)) {
      id Weak = objc_loadWeak(v4);
    }
    else {
      id Weak = *v4;
    }
    id v6 = Weak;
    CA::Context::unref(v3, 0);
    return v6;
  }
  return result;
}

- (NSArray)presentationModifiers
{
  layer = (id *)self->_attr.layer;
  CGRect v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v5 = (void *)[layer[36] copy];
  CA::Transaction::unlock(v3);

  return (NSArray *)v5;
}

- (void)setContentsOpaque:(BOOL)a3
{
}

- (void)setEdgeAntialiasingMask:(CAEdgeAntialiasingMask)edgeAntialiasingMask
{
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  double y = anchorPoint.y;
  double x = anchorPoint.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CGPoint v23 = anchorPoint;
  uint64_t v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v8 = *((_DWORD *)v7 + 25);
  *((_DWORD *)v7 + 25) = v8 + 1;
  if (!v8) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  layer = (uint64_t *)self->_attr.layer;
  if (x == 0.0 && y == 0.0)
  {
    if ((layer[7] & 0x10) == 0)
    {
      *(double *)&v21.Class isa = 0.0;
      CA::Layer::begin_change((CA::Layer *)layer, v7, @"anchorPoint", &v21, v6);
      uint64_t v10 = CA::Layer::writable_state((CA::Layer *)layer, v7);
      *((_DWORD *)v10 + 4) |= 0x18u;
      double v11 = (CA::AttrList *)*((void *)v10 + 4);
      if (v11) {
        double v11 = CA::AttrList::remove(v11, (const void *)0x1B);
      }
      *((void *)v10 + 4) = v11;
      CA::Layer::end_change((id *)layer, v7, 27, (objc_object *)@"anchorPoint", (objc_object *)v21.isa);
    }
  }
  else
  {
    *(double *)&v21.Class isa = 0.0;
    double v22 = 0.0;
    if ((layer[7] & 0x10) != 0
      || (uint64_t v12 = layer[9]) == 0
      || !CA::AttrList::get(v12, 27, (const CGAffineTransform *)0x13, (CA::Mat4Impl *)&v21)
      || (*(double *)&v21.isa == x ? (BOOL v13 = v22 == y) : (BOOL v13 = 0), !v13))
    {
      long double v20 = 0;
      CA::Layer::begin_change((CA::Layer *)layer, v7, @"anchorPoint", (objc_object *)&v20, v6);
      double v14 = CA::Layer::writable_state((CA::Layer *)layer, v7);
      double v15 = v14;
      if (y == 0.5 && x == 0.5) {
        int v17 = 0;
      }
      else {
        int v17 = 8;
      }
      *((_DWORD *)v14 + 4) = *((_DWORD *)v14 + 4) & 0xFFFFFFE7 | v17;
      uint64_t v18 = (CA::AttrList *)*((void *)v14 + 4);
      if (!v18)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        uint64_t v18 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      *((void *)v15 + 4) = CA::AttrList::set(v18, (const void *)0x1B, 19, (unsigned __int8 *)&v23);
      CA::Layer::end_change((id *)layer, v7, 27, (objc_object *)@"anchorPoint", v20);
    }
  }
  CA::Transaction::unlock(v7);
}

- (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(CALayer *)l
{
  v10[1] = *MEMORY[0x1E4F143B8];
  *(CFTimeInterval *)uint64_t v10 = t;
  id v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v8 = CA::Layer::convert_time(v6, (CA::Transaction *)v10, l, self, v7);
  CFTimeInterval result = *(double *)v10;
  if (!v8) {
    return 0.0;
  }
  return result;
}

- (id)stateWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = (void *)[(CALayer *)self states];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
      unsigned int v9 = 0;
      if (v6) {
        goto LABEL_4;
      }
      return v9;
    }
  }
}

- (void)addPresentationModifier:(id)a3
{
  v9[1] = *(objc_object **)MEMORY[0x1E4F143B8];
  layer = (CA::Layer *)self->_attr.layer;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  v9[0] = 0;
  CA::Layer::begin_change(layer, v6, @"presentationModifiers", (objc_object *)v9, v5);
  id v8 = (id)*((void *)layer + 36);
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)layer + 36) = v8;
  }
  [v8 addObject:a3];
  CA::Layer::end_change((id *)layer, v6, 446, (objc_object *)@"presentationModifiers", v9[0]);

  CA::Transaction::unlock(v6);
}

- (void)setCornerContents:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x8F, (const CGAffineTransform *)2, v3);
}

- (void)setCornerContentsCenter:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x90, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (void)drawInContext:(CGContextRef)ctx
{
  if ((*((unsigned char *)self->_attr.layer + 57) & 0x40) != 0)
  {
    id v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v8) {
      id v8 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    }
    int v9 = *((_DWORD *)v8 + 25);
    *((_DWORD *)v8 + 25) = v9 + 1;
    if (!v9) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    layer = (char *)self->_attr.layer;
    if ((layer[57] & 0x40) != 0)
    {
      long long v12 = (id *)(layer + 128);
      if (layer[136]) {
        id Weak = objc_loadWeak(v12);
      }
      else {
        id Weak = *v12;
      }
    }
    else
    {
      id Weak = 0;
    }
    CA::Transaction::unlock(v8);
    [Weak drawLayer:self inContext:ctx];
  }
  else
  {
    uint64_t v5 = (char *)CA::Transaction::ensure_compat((CA::Transaction *)self) + 88;
    while (1)
    {
      uint64_t v5 = *(char **)v5;
      if (!v5) {
        break;
      }
      if (v5[28])
      {
        if (v5[24]) {
          return;
        }
        break;
      }
    }
    id v6 = [(CALayer *)self actionForKey:@"onDraw"];
    if (v6)
    {
      int v7 = v6;
      id v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", ctx, @"context", 0);
      [v7 runActionForKey:@"onDraw" object:self arguments:v13];
    }
  }
}

- (void)setZPosition:(CGFloat)zPosition
{
  double v3 = zPosition;
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  if (zPosition > 3.40282347e38 || zPosition < -3.40282347e38)
  {
    NSLog(&cfstr_CoreanimationZ.isa, a2);
    double v5 = -3.40282347e38;
    if (v3 >= -3.40282347e38) {
      double v5 = v3;
    }
    double v3 = fmin(v5, 3.40282347e38);
  }
  v6[0] = v3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x267, (const CGAffineTransform *)0x12, v6);
}

- (id)delegate
{
  layer = (char *)self->_attr.layer;
  double v3 = (id *)(layer + 128);
  if (layer[136]) {
    return objc_loadWeak(v3);
  }
  else {
    return *v3;
  }
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::lock);
  double v5 = (void *)-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys;
  if (!-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys)
  {
    double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"animations", 0);
    -[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys = (uint64_t)v5;
  }
  if (([v5 containsObject:a3] & 1) == 0)
  {
    if (!CAObject_CAMLTypeSupportedForKey((uint64_t)self, (const __CFString *)a3))
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    [(id)-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys addObject:a3];
  }
  BOOL v6 = 1;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::lock);
  return v6;
}

- (void)setContentsGravity:(CALayerContentsGravity)contentsGravity
{
  int v4 = CA::Render::Layer::gravity_from_string((const __CFString *)contentsGravity, (const __CFString *)a2);
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::set_bit_int(layer, 0x83u, 3u, 0x77u, 15, v4);
}

- (void)setContentsFormat:(CALayerContentsFormat)contentsFormat
{
  int v4 = CA::Render::Layer::contents_format_from_string((__CFString *)contentsFormat, (const __CFString *)a2);
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::set_bit_int(layer, 0x7Eu, 0, 0x76u, 7, v4);
}

- (void)setContentsRect:(CGRect)contentsRect
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = contentsRect;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x87, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (id)CAMLTypeForKey:(id)a3
{
  if ([a3 isEqualToString:@"animations"]) {
    return @"NSDictionary";
  }

  return CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  if ([a5 isEqualToString:@"animations"])
  {
    CFDictionaryApplyFunction((CFDictionaryRef)a4, (CFDictionaryApplierFunction)add_animation, self);
  }
  else
  {
    [(CALayer *)self setValue:a4 forKey:a5];
  }
}

- (void)setSecurityMode:(id)a3
{
  if ([a3 isEqualToString:@"unrestricted"]) {
    int v5 = 2;
  }
  else {
    int v5 = [a3 isEqualToString:@"insecure"];
  }
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::set_bit_int(layer, 0x1EDu, 0x1Eu, 0xAAu, 3, v5);
}

- (void)setShadowColor:(CGColorRef)shadowColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = shadowColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F5, (const CGAffineTransform *)2, v3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kContentsStringHash = [@"contents" hash];
    kCATransitionClass = objc_opt_class();
    kCAPropertyAnimationClass = objc_opt_class();
    LINKED_DEFAULT_CONTINUOUS_CORNERS = dyld_program_sdk_at_least();
    CAIsAppSuspended();
  }
}

- (void)setDelegate:(id)delegate
{
}

- (CGFloat)zPosition
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x267u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setDisableUpdateMask:(unsigned int)a3
{
}

- (NSString)toneMapMode
{
  int v2 = (*((_DWORD *)self->_attr.layer + 12) >> 3) & 3;
  CGRect v3 = @"automatic";
  if (v2 == 1) {
    CGRect v3 = @"never";
  }
  if (v2 == 2) {
    return (NSString *)@"ifSupported";
  }
  else {
    return &v3->isa;
  }
}

- (CGSize)size
{
  layer = (double *)self->_attr.layer;
  double v3 = layer[14];
  double v4 = layer[15];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setObservationInfo:(void *)a3
{
  self->_attr._objc_observation_info = a3;
}

- (BOOL)_usesCornerRadii
{
  return *((unsigned char *)self->_attr.layer + 59) & 1;
}

- (void)setAllowsDisplayCompositing:(BOOL)a3
{
}

- (void)setMagnificationFilter:(CALayerContentsFilter)magnificationFilter
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = magnificationFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x175, (const CGAffineTransform *)3, v3);
}

- (BOOL)contentsAreFlipped
{
  return (*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0;
}

- (void)setCornerRadii:(CACornerRadii *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CGSize maxXMaxY = a3->maxXMaxY;
  v5[0] = a3->minXMaxY;
  v5[1] = maxXMaxY;
  CGSize minXMinY = a3->minXMinY;
  v5[2] = a3->maxXMinY;
  v5[3] = minXMinY;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x93, (const CGAffineTransform *)0x19, (double *)v5);
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "CA_initialize_for_decoding");
  [a3 setElementValue:v4];
}

- (void)CA_initialize_for_decoding
{
}

- (CALayer)initWithCoder:(id)a3
{
  id v4 = (atomic_uint **)CAObject_initWithCoder(self, a3);
  if (v4)
  {
    if (CALayerDecodeAnimations(CALayer *,NSCoder *)::once[0] != -1) {
      dispatch_once(CALayerDecodeAnimations(CALayer *,NSCoder *)::once, &__block_literal_global_13139);
    }
    int v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"CALayerAnimations");
    uint64_t v6 = [a3 decodeObjectOfClasses:CALayerDecodeAnimations(CALayer *,NSCoder *)::keys_classes forKey:@"CALayerAnimationKeys"];
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      id v8 = (void *)v6;
      uint64_t v9 = [v5 count];
      uint64_t v10 = [v8 count];
      if (v9)
      {
        if (v10 == v9)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            long long v12 = (CAAnimation *)[v5 objectAtIndex:i];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = (__CFString *)[v8 objectAtIndex:i];
              CFTypeID v14 = CFGetTypeID(v13);
              if (v14 == CFStringGetTypeID()) {
                CA::Layer::add_animation(v4[2], v12, v13);
              }
            }
          }
        }
      }
    }
  }
  return (CALayer *)v4;
}

+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 1);
}

+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 0);
}

- (void)setActions:(NSDictionary *)actions
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = actions;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)2, (const CGAffineTransform *)3, v3);
}

- (void)insertSublayer:(CALayer *)layer above:(CALayer *)sibling
{
  if (!layer) {
    return;
  }
  uint64_t v6 = self;
  BOOL v7 = self->_attr.layer;
  if ((*((_DWORD *)v7 + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v7[2] format];
  }
  id v8 = layer->_attr.layer;
  if ((*((_DWORD *)v8 + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v8[2] format];
  }
  uint64_t v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v10 = *((_DWORD *)v9 + 25);
  *((_DWORD *)v9 + 25) = v10 + 1;
  if (!v10) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  double v11 = (CA::Layer *)v6->_attr.layer;
  if (sibling)
  {
    long long v12 = CA::Layer::sublayers(v11);
    if (v12)
    {
      id v13 = (void *)((char *)v12 + 8);
      unint64_t v14 = *((void *)v12 + 2);
      if (v14 == 1)
      {
        if (!*((void *)v12 + 3))
        {
LABEL_18:
          uint64_t v15 = 0;
          while ((CALayer *)v13[v15] != sibling)
          {
            if (v14 == ++v15) {
              goto LABEL_24;
            }
          }
          if (v15 != -1) {
            unint64_t v14 = v15 + 1;
          }
          goto LABEL_24;
        }
LABEL_17:
        id v13 = (void *)*v13;
        goto LABEL_18;
      }
      if (v14) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
LABEL_24:
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, v14);
    goto LABEL_25;
  }
  CA::Layer::insert_sublayer(v11, v9, layer, 0xFFFFFFFFFFFFFFFFLL);
LABEL_25:

  CA::Transaction::unlock(v9);
}

- (void)insertSublayer:(CALayer *)layer below:(CALayer *)sibling
{
  if (!layer) {
    return;
  }
  uint64_t v6 = self;
  BOOL v7 = self->_attr.layer;
  if ((*((_DWORD *)v7 + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v7[2] format];
  }
  id v8 = layer->_attr.layer;
  if ((*((_DWORD *)v8 + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v8[2] format];
  }
  uint64_t v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v10 = *((_DWORD *)v9 + 25);
  *((_DWORD *)v9 + 25) = v10 + 1;
  if (!v10) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  double v11 = (CA::Layer *)v6->_attr.layer;
  if (sibling)
  {
    long long v12 = CA::Layer::sublayers(v11);
    if (v12)
    {
      id v13 = (void *)((char *)v12 + 8);
      unint64_t v14 = *((void *)v12 + 2);
      if (v14 == 1)
      {
        if (!*((void *)v12 + 3))
        {
LABEL_18:
          unint64_t v15 = 0;
          while ((CALayer *)v13[v15] != sibling)
          {
            if (v14 == ++v15) {
              goto LABEL_24;
            }
          }
          if (v15 != -1) {
            unint64_t v14 = v15;
          }
          goto LABEL_24;
        }
LABEL_17:
        id v13 = (void *)*v13;
        goto LABEL_18;
      }
      if (v14) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
LABEL_24:
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, v14);
    goto LABEL_25;
  }
  CA::Layer::insert_sublayer(v11, v9, layer, 0);
LABEL_25:

  CA::Transaction::unlock(v9);
}

- (void)setPreloadsCache:(BOOL)a3
{
}

- (void)setClearsContext:(BOOL)a3
{
}

- (void)setGeometryFlipped:(BOOL)geometryFlipped
{
}

- (void)setShadowPath:(CGPathRef)shadowPath
{
  v8[1] = *(double *)MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    if (shadowPath)
    {
      CFTypeID v5 = CFGetTypeID(shadowPath);
      if (v5 == CGPathGetTypeID()) {
        CGPathRef v6 = shadowPath;
      }
      else {
        CGPathRef v6 = 0;
      }
    }
    else
    {
      CGPathRef v6 = 0;
    }
    BOOL v7 = (const CGPath *)MEMORY[0x1853223C0](v6);
    *(void *)&v8[0] = v7;
    CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F8, (const CGAffineTransform *)2, v8);
    CGPathRelease(v7);
  }
  else
  {
    *(void *)&v8[0] = shadowPath;
    CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F8, (const CGAffineTransform *)2, v8);
  }
}

- (void)setTimeOffset:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x22E, (const CGAffineTransform *)0x12, v3);
}

+ (void)CAMLParserEndElement:(id)a3
{
  double v3 = (void *)[a3 elementValue];
  if ([v3 needsDisplayOnBoundsChange])
  {
    uint64_t v4 = [v3 contents];
    if (v4)
    {
      [v3 setContents:v4];
    }
    else
    {
      [v3 setNeedsDisplay];
    }
  }
}

- (void)setSortsSublayers:(BOOL)a3
{
}

- (void)setUsesWebKitBehavior:(BOOL)a3
{
}

- (unsigned)disableUpdateMask
{
  return (*((_DWORD *)self->_attr.layer + 11) >> 15) & 0x7FF;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v4 = (objc_class *)objc_opt_class();

  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (a3) {
    double v3 = @"continuous";
  }
  else {
    double v3 = @"circular";
  }
  [(CALayer *)self setCornerCurve:v3];
}

- (NSDictionary)actions
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 2u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setDrawsAsynchronously:(BOOL)drawsAsynchronously
{
}

- (void)setSpeed:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x20E, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setMeshTransform:(id)a3
{
  v4[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v4[0] = [a3 meshTransformForLayer:self];
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x182, (const CGAffineTransform *)3, v4);
}

- (void)setAnchorPointZ:(CGFloat)anchorPointZ
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = anchorPointZ;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1C, (const CGAffineTransform *)0x12, v3);
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
}

- (void)setFillMode:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xDF, (const CGAffineTransform *)3, v3);
}

- (void)setDuration:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xBF, (const CGAffineTransform *)0x12, v3);
}

- (void)setContentsDirtyRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x7B, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (BOOL)layoutIsActive
{
  CGRect v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  char is_active = CA::Layer::layout_is_active((CA::Layer *)self->_attr.layer, v3, 0);
  CA::Transaction::unlock(v3);
  return is_active;
}

- (void)setPunchoutShadow:(BOOL)a3
{
}

- (void)setInvertsMask:(BOOL)a3
{
}

- (CALayerContentsGravity)contentsGravity
{
  unint64_t v2 = ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 3) & 0xF;
  if (v2 > 0xB) {
    return 0;
  }
  else {
    return (CALayerContentsGravity)CAAtomGetString(CA::Render::gravity_atoms[v2]);
  }
}

+ (CGFloat)cornerCurveExpansionFactor:(CALayerCornerCurve)curve
{
  BOOL v3 = [(NSString *)curve isEqualToString:@"continuous"];
  CGFloat result = 1.528665;
  if (!v3) {
    return 1.0;
  }
  return result;
}

- (CALayerContentsFormat)contentsFormat
{
  if ((*((unsigned char *)self->_attr.layer + 44) & 7u) - 1 > 4) {
    unint64_t v2 = (CALayerContentsFormat *)&kCAContentsFormatRGBA8Uint;
  }
  else {
    unint64_t v2 = (CALayerContentsFormat *)off_1E52733A8[((*((unsigned char *)self->_attr.layer + 44) & 7) - 1)];
  }
  return *v2;
}

- (void)replaceSublayer:(CALayer *)oldLayer with:(CALayer *)newLayer
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (oldLayer == newLayer) {
    return;
  }
  CGPathRef v6 = self;
  layer = self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", layer[2] format];
  }
  id v8 = oldLayer->_attr.layer;
  if ((*((_DWORD *)v8 + 1) & 0x60000) != 0) {
    self = (CALayer *)[MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v8[2] format];
  }
  uint64_t v9 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  long long v12 = CA::Layer::retain_parent((CA::Layer *)oldLayer->_attr.layer, (CA::Transaction *)v9);
  id v13 = (CA::Layer *)v12;
  if (v12 != v6->_attr.layer)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CALayerInvalid", @"replaced layer %@ is not a sublayer of %@", oldLayer, v6 format];
    id v13 = (CA::Layer *)v6->_attr.layer;
  }
  unsigned int v14 = v9[25];
  v9[25] = v14 + 1;
  if (v14)
  {
    if (newLayer) {
      goto LABEL_10;
    }
LABEL_19:
    CA::Layer::remove_sublayer(v13, (CA::Transaction *)v9, oldLayer, v10, v11);
    CA::Transaction::release_object((CA::Transaction *)v9, oldLayer);
    goto LABEL_43;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (!newLayer) {
    goto LABEL_19;
  }
LABEL_10:
  unint64_t v15 = newLayer->_attr.layer;
  if ((*((_DWORD *)v15 + 1) & 0x60000) != 0)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CALayerInvalidTree", @"expecting model layer not copy: %@", v15[2] format];
    unint64_t v15 = newLayer->_attr.layer;
  }
  uint64_t v16 = (CA::Layer *)CA::Layer::retain_parent((CA::Layer *)v15, (CA::Transaction *)v9);
  if (v16)
  {
    double v19 = (atomic_uint *)v16;
    CA::Layer::remove_sublayer(v16, (CA::Transaction *)v9, newLayer, v17, v18);
    while (1)
    {
      atomic_uint v21 = *v19;
      if (!*v19) {
        break;
      }
      atomic_uint v22 = *v19;
      atomic_compare_exchange_strong(v19, (unsigned int *)&v22, v21 - 1);
      if (v22 == v21)
      {
        if (v21 == 1)
        {
          CA::Layer::destroy((CA::Layer *)v19);
          CA::Layer::~Layer((CA::AttrList **)v19);
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          malloc_zone_free(malloc_zone, v19);
        }
        break;
      }
    }
  }
  else
  {
    CFRetain(newLayer);
    CA::Layer::remove_from_context((CA::Layer *)newLayer->_attr.layer);
  }
  if (*((CALayer **)v13 + 4) == oldLayer)
  {
    CA::Layer::set_mask((CA::Layer ***)v13, newLayer);
    CA::Transaction::release_object((CA::Transaction *)v9, newLayer);
    goto LABEL_43;
  }
  v35.Class isa = 0;
  CA::Layer::begin_change(v13, (CA::Transaction *)v9, @"sublayers", &v35, v20);
  int v24 = CA::Layer::ancestor_context_id(v13, (CA::Transaction *)v9);
  CA::Layer::update_removed_sublayer((CA::Layer *)oldLayer->_attr.layer, (CA::Transaction *)v9, v24);
  CA::Transaction::release_object((CA::Transaction *)v9, oldLayer);
  CGAffineTransform v25 = (uint64_t *)(*((void *)v13 + 3) + 8);
  uint64_t v26 = *(void *)(*((void *)v13 + 3) + 16);
  if (v26 == 1)
  {
    uint64_t v27 = *((void *)v13 + 3) + 8;
    if (!*(void *)(*((void *)v13 + 3) + 24)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v26)
  {
LABEL_27:
    uint64_t v27 = *v25;
LABEL_28:
    uint64_t v28 = 0;
    while (*(CALayer **)(v27 + 8 * v28) != oldLayer)
    {
      if (v26 == ++v28)
      {
        uint64_t v28 = -1;
        break;
      }
    }
    if (!*(unsigned char *)(*((void *)v13 + 3) + 40))
    {
      if (v26 == 1 && !*(void *)(*((void *)v13 + 3) + 24)) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
LABEL_49:
    abort();
  }
  if (*(unsigned char *)(*((void *)v13 + 3) + 40)) {
    goto LABEL_49;
  }
  uint64_t v28 = -1;
LABEL_38:
  CGAffineTransform v25 = (uint64_t *)*v25;
LABEL_39:
  v25[v28] = (uint64_t)newLayer;
  CA::Layer::update_added_sublayer((CA::Layer *)newLayer->_attr.layer, (CA::Transaction *)v9, v13, v24);
  uint64_t v29 = (CA::Layer *)newLayer->_attr.layer;
  uint64_t v30 = v9[24];
  if ((v30 & 0x80000000) != 0 || (int v31 = *((_DWORD *)v29 + v30 + 68)) == 0) {
    int v31 = *CA::Layer::thread_flags_(v29, (CA::Transaction *)v9);
  }
  CA::Layer::update_for_changed_sublayers((atomic_uint *)v13, (CA::Transaction *)v9, v31);
  CA::Layer::end_change((id *)v13, (CA::Transaction *)v9, 547, (objc_object *)@"sublayers", (objc_object *)v35.isa);
LABEL_43:
  CA::Transaction::unlock((CA::Transaction *)v9);
  if (v12)
  {
    while (1)
    {
      atomic_uint v32 = *v12;
      if (!*v12) {
        break;
      }
      atomic_uint v33 = *v12;
      atomic_compare_exchange_strong(v12, (unsigned int *)&v33, v32 - 1);
      if (v33 == v32)
      {
        if (v32 == 1)
        {
          CA::Layer::destroy((CA::Layer *)v12);
          CA::Layer::~Layer((CA::AttrList **)v12);
          unsigned int v34 = (malloc_zone_t *)get_malloc_zone();
          malloc_zone_free(v34, v12);
        }
        return;
      }
    }
  }
}

- (id)stateTransitionFrom:(id)a3 to:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v4 = (__CFString *)a3;
  }
  else {
    int v4 = &stru_1ED039300;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  if (a4) {
    CFTypeID v5 = (__CFString *)a4;
  }
  else {
    CFTypeID v5 = &stru_1ED039300;
  }
  long long v16 = 0uLL;
  long long v17 = 0uLL;
  CGPathRef v6 = (void *)[(CALayer *)self stateTransitions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_9:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v6);
    }
    double v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    if (objc_msgSend((id)objc_msgSend(v11, "fromState"), "isEqualToString:", v4))
    {
      if (objc_msgSend((id)objc_msgSend(v11, "toState"), "isEqualToString:", v5)) {
        return v11;
      }
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v8) {
        goto LABEL_9;
      }
      return 0;
    }
  }
}

- (id)dependentStatesOfState:(id)a3
{
  Mutable = CFSetCreateMutable(0, 0, 0);
  addDependentStates((CAState *)a3, Mutable, (NSArray *)[(CALayer *)self states]);

  return Mutable;
}

- (void)removeState:(id)a3
{
  CFTypeID v5 = (void *)[(CALayer *)self states];
  if (v5)
  {
    CGPathRef v6 = v5;
    uint64_t v7 = [v5 indexOfObjectIdenticalTo:a3];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      id v9 = (id)[v6 mutableCopy];
      [v9 removeObjectAtIndex:v8];
      [(CALayer *)self setStates:v9];
    }
  }
}

- (void)insertState:(id)a3 atIndex:(unsigned int)a4
{
  id v7 = (id)objc_msgSend((id)-[CALayer states](self, "states"), "mutableCopy");
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v7;
  if ([v7 count] >= (unint64_t)a4) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = [v9 count];
  }
  [v9 insertObject:a3 atIndex:v8];
  [(CALayer *)self setStates:v9];
}

- (void)addState:(id)a3
{
}

- (CGRect)visibleRect
{
  [(CALayer *)self _visibleRectOfLayer:self];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)_visibleRectOfLayer:(id)a3
{
  double v4 = [(CALayer *)self superlayer];
  if (v4) {
    [(CALayer *)v4 _visibleRectOfLayer:a3];
  }
  else {
    [a3 bounds];
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)scrollRectToVisible:(CGRect)r
{
}

- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = [(CALayer *)self superlayer];

  -[CALayer _scrollRect:fromLayer:](v9, "_scrollRect:fromLayer:", a4, x, y, width, height);
}

- (void)scrollPoint:(CGPoint)p
{
}

- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(CALayer *)self superlayer];

  -[CALayer _scrollPoint:fromLayer:](v7, "_scrollPoint:fromLayer:", a4, x, y);
}

- (void)setRasterizationPrefersWindowServerAwareBackdrops:(BOOL)a3
{
}

- (void)setRasterizationPrefersDisplayCompositing:(BOOL)a3
{
}

- (void)setShouldReflatten:(BOOL)a3
{
}

- (void)setShouldFlatten:(BOOL)a3
{
}

- (void)setRimWidth:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1E0, (const CGAffineTransform *)0x12, v3);
}

- (void)setRimOpacity:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1DE, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setRimColor:(CGColor *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1DD, (const CGAffineTransform *)2, v3);
}

- (void)setBorderOffset:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x43, (const CGAffineTransform *)0x12, v3);
}

- (void)setStyle:(NSDictionary *)style
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = style;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x221, (const CGAffineTransform *)3, v3);
}

- (NSDictionary)style
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x221u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setBackgroundFilters:(NSArray *)backgroundFilters
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = backgroundFilters;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x38, (const CGAffineTransform *)3, v3);
}

- (BOOL)invertsMask
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 3) & 1;
}

- (void)setContentsEDRStrength:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x7D, (const CGAffineTransform *)0x12, v3);
}

- (void)setGain:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xF6, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setMinificationFilterBias:(float)minificationFilterBias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = minificationFilterBias;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x186, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setContentsContainsSubtitles:(BOOL)a3
{
}

- (CGRect)cornerContentsCenter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  *(_OWORD *)double v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x90u, (const CGAffineTransform *)0x15, (id *)&v6);
  double v3 = *((double *)&v6 + 1);
  double v2 = *(double *)&v6;
  double v5 = v7[1];
  double v4 = v7[0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setDoubleSided:(BOOL)doubleSided
{
}

- (CGFloat)anchorPointZ
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1Cu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setAutoreverses:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x31, (const CGAffineTransform *)7, (double *)&v3);
}

- (void)setRepeatDuration:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1D6, (const CGAffineTransform *)0x12, v3);
}

- (void)setRepeatCount:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1D5, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setBeginTime:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x39, (const CGAffineTransform *)0x12, v3);
}

- (CGSize)preferredFrameSize
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CALayer *)self sizeRequisition];
  double v10 = v3;
  double v11 = v5;
  if (v3 == 0.0 && v5 == 0.0)
  {
    [(CALayer *)self _preferredSize];
    double v10 = v6;
    double v11 = v7;
    -[CALayer setSizeRequisition:](self, "setSizeRequisition:");
  }
  memset(&v12, 0, sizeof(v12));
  CA::Layer::get_frame_transform((CA::Layer *)self->_attr.layer, &v12, 1);
  float64x2_t v8 = vrndpq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v12.a, v10), *(float64x2_t *)&v12.c, v11));
  double v9 = v8.f64[1];
  result.double width = v8.f64[0];
  result.double height = v9;
  return result;
}

- (void)_validateLayoutHashHasChangedWithLayoutTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [(CALayer *)self _previousLayoutHash];
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToNumber:", -[CALayer _layoutHash](self, "_layoutHash")))
    {
      kdebug_trace();
      if (BYTE4(xmmword_1EB2ACC30))
      {
        double v6 = +[CAPropertyAnimation animationWithKeyPath:@"backgroundColor"];
        double Alpha = CGColorGetAlpha([(CALayer *)self backgroundColor]);
        SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, fmax(Alpha, 0.05));
        [(CABasicAnimation *)v6 setToValue:SRGB];
        [(CAAnimation *)v6 setAutoreverses:1];
        [(CAAnimation *)v6 setDuration:0.5];
        [(CALayer *)self addAnimation:v6 forKey:@"CADebug_RedundantLayoutFlash"];
        CGColorRelease(SRGB);
      }
      if (BYTE3(xmmword_1EB2ACC30))
      {
        if (x_log_hook_p())
        {
          double v11 = a3;
          uint64_t v10 = objc_msgSend(-[CALayer debugDescription](self, "debugDescription"), "UTF8String");
          x_log_();
        }
        else
        {
          double v9 = x_log_category_api;
          if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v13 = objc_msgSend(-[CALayer debugDescription](self, "debugDescription"), "UTF8String");
            __int16 v14 = 2048;
            double v15 = a3;
            _os_log_impl(&dword_184668000, v9, OS_LOG_TYPE_DEFAULT, "Redundant layout on %s which took %f ms", buf, 0x16u);
          }
        }
      }
    }
    -[CALayer _setPreviousLayoutHash:](self, "_setPreviousLayoutHash:", 0, v10, *(void *)&v11);
  }
  else
  {
    [(CALayer *)self _setPreviousLayoutHash:&unk_1ED05B9B0];
  }
}

- (void)_saveCurrentLayoutHash
{
  double v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  if ([(CALayer *)self _previousLayoutHash]) {
    [(CALayer *)self _setPreviousLayoutHash:[(CALayer *)self _layoutHash]];
  }

  CA::Transaction::unlock(v3);
}

- (void)_setPreviousLayoutHash:(id)a3
{
}

- (id)_previousLayoutHash
{
  return objc_getAssociatedObject(self, sel__previousLayoutHash);
}

- (id)_layoutHash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3812000000;
  double v11 = __Block_byref_object_copy__370;
  CGAffineTransform v12 = __Block_byref_object_dispose__371;
  uint64_t v13 = "";
  uint64_t v14 = 190295070;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  double v7[3] = __Block_byref_object_copy__372;
  v7[4] = __Block_byref_object_dispose__373;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  double v6[2] = __22__CALayer__layoutHash__block_invoke;
  v6[3] = &unk_1E527DB38;
  v6[4] = &v8;
  v6[5] = v7;
  v7[5] = v6;
  __22__CALayer__layoutHash__block_invoke((uint64_t)v6, self, 1);
  unsigned int v2 = *((_DWORD *)v9 + 13) ^ *((_DWORD *)v9 + 12);
  unsigned int v3 = -1028477387 * ((-2048144789 * (v2 ^ HIWORD(v2))) ^ ((-2048144789 * (v2 ^ HIWORD(v2))) >> 13));
  int v4 = (void *)[NSNumber numberWithUnsignedInt:v3 ^ HIWORD(v3)];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __22__CALayer__layoutHash__block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [a2 frame];
  int v10 = objc_msgSend((id)objc_msgSend(a2, "sublayers", v6, v7, v8, v9), "count");
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  int v13 = *(_DWORD *)(v11 + 48);
  int v12 = *(_DWORD *)(v11 + 52);
  for (uint64_t i = 16; i != 32; i += 4)
  {
    HIDWORD(v15) = (461845907
                  * ((380141568 * *(_DWORD *)(v32 + i + 16)) | ((-862048943 * *(_DWORD *)(v32 + i + 16)) >> 17))) ^ v13;
    LODWORD(v15) = HIDWORD(v15);
    int v13 = 5 * (v15 >> 19) - 430675100;
  }
  *(_DWORD *)(v11 + 48) = v13;
  *(_DWORD *)(v11 + 52) = v12 + 16;
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  HIDWORD(v17) = *(_DWORD *)(v16 + 48) ^ (461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17)));
  LODWORD(v17) = HIDWORD(v17);
  int v18 = *(_DWORD *)(v16 + 52) + 4;
  *(_DWORD *)(v16 + 48) = 5 * (v17 >> 19) - 430675100;
  *(_DWORD *)(v16 + 52) = v18;
  if ((a3 & 1) == 0)
  {
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    int v22 = *(_DWORD *)(v20 + 48);
    int v21 = *(_DWORD *)(v20 + 52);
    do
    {
      HIDWORD(v23) = (461845907
                    * ((380141568 * *(_DWORD *)(v32 + v19 + 16)) | ((-862048943
                                                                                 * *(_DWORD *)(v32 + v19 + 16)) >> 17))) ^ v22;
      LODWORD(v23) = HIDWORD(v23);
      int v22 = 5 * (v23 >> 19) - 430675100;
      v19 += 4;
    }
    while (v19 != 16);
    *(_DWORD *)(v20 + 48) = v22;
    *(_DWORD *)(v20 + 52) = v21 + 16;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v24 = (void *)[a2 sublayers];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v26);
  }
  unsigned int v29 = -2048144789
      * (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 52) ^ *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 48) ^ ((*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 52) ^ *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 48)) >> 16));
  return (-1028477387 * (v29 ^ (v29 >> 13))) ^ ((-1028477387 * (v29 ^ (v29 >> 13))) >> 16);
}

- (void)_contentsFormatDidChange:(id)a3
{
  layer = self->_attr.layer;
  int v4 = (CA::Transaction *)[a3 integerValue];
  char v5 = (char)v4;
  uint64_t v6 = CA::Transaction::ensure_compat(v4);
  uint64_t v7 = (void *)layer[2];
  int v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  if ([v7 contents] && (*((_DWORD *)layer + 1) & 0x4000000) != 0 && (*((unsigned char *)layer + 58) & 0x40) == 0)
  {
    *((_DWORD *)layer + 11) = *((_DWORD *)layer + 11) & 0xFFFFFFF8 | v5 & 7;
    [v7 setNeedsDisplay];
    CA::Layer::set_commit_needed((CA::Layer *)layer, v6, 1);
  }

  CA::Transaction::unlock(v6);
}

- (void)_colorSpaceDidChange
{
  layer = (id *)self->_attr.layer;
  unsigned int v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  id v4 = layer[2];
  int v5 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v5 + 1;
  if (!v5) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v6 = (const void *)[v4 contents];
  uint64_t v7 = (uint64_t)v6;
  if (v6)
  {
    CFTypeID v8 = CFGetTypeID(v6);
    if (CABackingStoreGetTypeID::once[0] != -1) {
      dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
    }
    if (v8 == CABackingStoreGetTypeID::type)
    {
      uint64_t v9 = (CGColorSpace *)[layer[2] _retainColorSpace];
      if (CABackingStoreSetColorSpace(v7, v9)) {
        [v4 setNeedsDisplay];
      }
      CGColorSpaceRelease(v9);
      LODWORD(v7) = 0;
    }
    else
    {
      LODWORD(v7) = 1;
    }
  }
  if ([v4 backgroundColor]
    || [v4 borderColor]
    || [v4 contentsMultiplyColor])
  {
    LODWORD(v7) = v7 | 0x8000;
  }
  if ([v4 shadowColor]) {
    int v10 = v7 | 0x2000;
  }
  else {
    int v10 = v7;
  }
  if (v10) {
    CA::Layer::set_commit_needed((CA::Layer *)layer, v3, v10);
  }

  CA::Transaction::unlock(v3);
}

- (BOOL)_scheduleAnimationTimer
{
  return 1;
}

- (void)setToneMapMode:(id)a3
{
  if (a3 == @"automatic")
  {
    int v5 = 0;
  }
  else
  {
    int v4 = CAInternAtom((const __CFString *)a3, 0);
    if (v4 == 268) {
      int v5 = 2;
    }
    else {
      int v5 = v4 == 401;
    }
  }
  layer = (CA::Layer *)self->_attr.layer;

  CA::Layer::set_bit_int(layer, 0x232u, 0x23u, 0x83u, 3, v5);
}

- (NSString)securityMode
{
  int v2 = *((_DWORD *)self->_attr.layer + 11) >> 30;
  unsigned int v3 = @"secure";
  if (v2 == 2) {
    unsigned int v3 = @"unrestricted";
  }
  if (v2 == 1) {
    return (NSString *)@"insecure";
  }
  else {
    return &v3->isa;
  }
}

- (BOOL)containsPoint:(CGPoint)p
{
  CGFloat y = p.y;
  CGFloat x = p.x;
  [(CALayer *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (CALayer)hitTest:(CGPoint)p
{
  CGFloat y = p.y;
  CGFloat x = p.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  layer = self->_attr.layer;
  if ((layer[1] & 0x10000) != 0)
  {
    NSLog(&cfstr_CallingHittest.isa, a2, self);
    layer = self->_attr.layer;
  }
  if ((layer[1] & 0x40000) != 0) {
    [MEMORY[0x1E4F1CA00] raise:@"CALayerInvalid" format:@"may only -hitTest: a layer or its presentation layer"];
  }
  if ([(CALayer *)self ignoresHitTesting]) {
    return 0;
  }
  uint64_t v7 = (CA::Transaction *)[(CALayer *)self allowsHitTesting];
  if (!v7) {
    return 0;
  }
  CFTypeID v8 = CA::Transaction::ensure_compat(v7);
  int v11 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v11 + 1;
  if (!v11) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  memset(v31, 0, sizeof(v31));
  CA::Layer::get_frame_transform((uint64_t)self->_attr.layer, v31, 0, 0, 0.0, v9, v10);
  for (uint64_t i = CA::Layer::superlayer((CA::Layer *)self->_attr.layer, v8);
        i;
        uint64_t i = CA::Layer::superlayer((CA::Layer *)i->_attr.layer, v8))
  {
    uint64_t v16 = (uint64_t)i->_attr.layer;
    if ((*(_DWORD *)(v16 + 4) & 0x10000) == 0) {
      break;
    }
    memset(&v30, 0, 128);
    CA::Layer::get_frame_transform(v16, &v30, 0, 0, 0.0, v14, v15);
    CA::Mat4Impl::mat4_concat(v31, v31[0].f64, v30.f64, v17);
  }
  if (CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)v31, (CA::Mat4Impl *)v31, v12)
    && (*(double *)&v32 >= 0.0 || [(CALayer *)self isDoubleSided])
    && ((v30.f64[0] = x,
         v30.f64[1] = y,
         !-[CALayer masksToBounds](self, "masksToBounds", CA::Mat4Impl::mat4_unapply_inverse_to_point2(v31, v30.f64, v19).f64[0]))|| -[CALayer containsPoint:](self, "containsPoint:", v30.f64[0], v30.f64[1]))&& ((uint64_t v20 = -[CALayer mask](self, "mask")) == 0 || -[CALayer hitTest:](v20, "hitTest:", v30.f64[0], v30.f64[1])))
  {
    int v21 = (CALayer **)hitTestSublayers(0, v30.f64, (uint64_t *)[(CALayer *)self sublayers]);
    int v22 = v21;
    if (v21)
    {
      if (v21[1] && [(CALayer *)self sortsSublayers])
      {
        int v18 = 0;
        double v26 = -INFINITY;
        uint64_t v27 = v22;
        do
        {
          double v23 = computeZ(self, *v27, v8, (long long *)&v30, v23, v24, v25);
          double v24 = v26 + 0.00001;
          if (v23 > v26 + 0.00001)
          {
            int v18 = *v27;
            double v26 = v23;
          }
          uint64_t v27 = (CALayer **)v27[1];
        }
        while (v27);
      }
      else
      {
        int v18 = *v22;
      }
      do
      {
        unsigned int v29 = (CALayer **)v22[1];
        free(v22);
        int v22 = v29;
      }
      while (v29);
    }
    else if (-[CALayer containsPoint:](self, "containsPoint:", v30.f64[0], v30.f64[1]))
    {
      int v18 = self;
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }
  CA::Transaction::unlock(v8);
  return v18;
}

- (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(CALayer *)l
{
  v10[1] = *MEMORY[0x1E4F143B8];
  *(CFTimeInterval *)double v10 = t;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v8 = CA::Layer::convert_time(v6, (CA::Transaction *)v10, self, l, v7);
  CFTimeInterval result = *(double *)v10;
  if (!v8) {
    return 0.0;
  }
  return result;
}

- (BOOL)isGeometryFlipped
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 3) & 1;
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  int v5 = CAInternAtom((const __CFString *)key, 1);
  int v6 = v5;
  uint64_t v7 = 0;
  layer = self->_attr.layer;
  do
  {
    if (v5 == (unsigned __int16)-[CALayer shouldArchiveValueForKey:]::always_archived[v7]) {
      goto LABEL_66;
    }
    ++v7;
  }
  while (v7 != 4);
  double v9 = (CA::Transaction *)CAAtomIndexInArray(21, (uint64_t)-[CALayer shouldArchiveValueForKey:]::atoms, v5);
  if (v9 == (CA::Transaction *)-1) {
    goto LABEL_46;
  }
  if (v6 <= 179)
  {
    if (v6 <= 135)
    {
      if (v6 <= 118)
      {
        if (v6 == 27)
        {
          unsigned int v11 = layer[56];
        }
        else
        {
          if (v6 != 74) {
            goto LABEL_46;
          }
          unsigned int v11 = layer[58];
        }
        return (v11 >> 3) & 1;
      }
      if (v6 != 119)
      {
        if (v6 == 131) {
          return layer[58] >> 7;
        }
        goto LABEL_46;
      }
      if ((layer[58] & 0x20) == 0) {
        goto LABEL_61;
      }
      if (!CAEncodeBackingStores)
      {
        double v23 = (const void *)*((void *)layer + 18);
        if (v23)
        {
          CFTypeID v24 = CFGetTypeID(v23);
          if (CABackingStoreGetTypeID::once[0] != -1) {
            dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
          }
          if (v24 == CABackingStoreGetTypeID::type) {
            goto LABEL_61;
          }
        }
      }
      goto LABEL_66;
    }
    if (v6 > 146)
    {
      if (v6 != 147)
      {
        if (v6 == 165) {
          return (layer[58] >> 4) & 1;
        }
        goto LABEL_46;
      }
      LOBYTE(v13) = layer[59];
    }
    else
    {
      if (v6 == 136)
      {
        if ((layer[47] & 0xC) == 0) {
          goto LABEL_46;
        }
        goto LABEL_66;
      }
      if (v6 != 137) {
        goto LABEL_46;
      }
      LOBYTE(v13) = layer[64];
    }
LABEL_56:
    LOBYTE(v14) = v13 & 1;
    return v14;
  }
  if (v6 > 437)
  {
    if (v6 > 492)
    {
      if (v6 != 493)
      {
        if (v6 != 514)
        {
          if (v6 == 547)
          {
            double v10 = CA::Layer::sublayers((CA::Layer *)layer);
LABEL_41:
            LOBYTE(v14) = v10 != 0;
            return v14;
          }
          goto LABEL_46;
        }
LABEL_61:
        LOBYTE(v14) = 0;
        return v14;
      }
      unsigned int v15 = layer[65];
      return (v15 >> 2) & 1;
    }
    if (v6 == 438)
    {
      unsigned int v15 = layer[58];
      return (v15 >> 2) & 1;
    }
    if (v6 != 458 || (layer[47] & 0x30) == 0) {
      goto LABEL_46;
    }
LABEL_66:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (v6 <= 375)
  {
    if (v6 == 180)
    {
      unsigned int v12 = layer[65];
    }
    else
    {
      if (v6 != 194) {
        goto LABEL_46;
      }
      unsigned int v12 = layer[59];
    }
    return (v12 >> 1) & 1;
  }
  if (v6 == 376)
  {
    double v10 = CA::Layer::mask((CA::Layer *)layer);
    goto LABEL_41;
  }
  if (v6 == 377)
  {
    LOBYTE(v13) = layer[65];
    goto LABEL_56;
  }
LABEL_46:
  uint64_t v16 = 0;
  unint64_t v17 = &dword_1E527D530;
  do
  {
    int v18 = *v17;
    v17 += 8;
    if (v6 == v18)
    {
      int v13 = *(_DWORD *)&layer[4 * (BOOL_bits[8 * v16 + 1] >> 5) + 44] >> BOOL_bits[8 * v16 + 1];
      goto LABEL_56;
    }
    ++v16;
  }
  while (v16 != 46);
  uint64_t v19 = CA::Transaction::ensure_compat(v9);
  int v20 = *((_DWORD *)v19 + 25);
  *((_DWORD *)v19 + 25) = v20 + 1;
  if (!v20) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  int v21 = (uint64_t **)*((void *)layer + 9);
  if (v21)
  {
    while (1)
    {
      int v21 = (uint64_t **)*v21;
      if (!v21) {
        break;
      }
      if ((v21[1] & 0xFFFFFF) == v6)
      {
        LOBYTE(v14) = 1;
        goto LABEL_59;
      }
    }
  }
  if ((~*((_DWORD *)layer + 1) & 0x68000) != 0 || (double v25 = [(CALayer *)self modelLayer], v25 == self)) {
    LOBYTE(v14) = 0;
  }
  else {
    int v14 = objc_msgSend(-[CALayer valueForKey:](v25, "valueForKey:", key), "isEqual:", -[CALayer valueForKey:](self, "valueForKey:", key)) ^ 1;
  }
LABEL_59:
  CA::Transaction::unlock(v19);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  CAObject_encodeWithCoder(self, a3);
  if (*((void *)self->_attr.layer + 35))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v9 = (CA::Transaction *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v6 = CA::Transaction::ensure_compat(v9);
    int v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    for (uint64_t i = (uint64_t **)*((void *)self->_attr.layer + 35); i; uint64_t i = (uint64_t **)*i)
    {
      if (i[2]
        && ((_WORD)i[7] & 0x24) == 0
        && (CALayerEncodeAllAnimations || ([i[1] isRemovedOnCompletion] & 1) == 0))
      {
        [v5 addObject:i[1]];
        [(CA::Transaction *)v9 addObject:i[2]];
      }
    }
    CA::Transaction::unlock(v6);
    [a3 encodeObject:v5 forKey:@"CALayerAnimations"];
    [a3 encodeObject:v9 forKey:@"CALayerAnimationKeys"];
  }
}

- (id)CA_archivingValueForKey:(id)a3
{
  int v4 = self;
  if ((~*((_DWORD *)self->_attr.layer + 1) & 0x68000) == 0) {
    int v4 = [(CALayer *)self modelLayer];
  }
  id v5 = (objc_class *)+[CALayer superclass];

  return CAObject_valueForKey(v4, v5, (const __CFString *)a3);
}

- (id)debugDescription
{
  unsigned int v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  layer = (char *)self->_attr.layer;
  id v5 = (__CFString *)[MEMORY[0x1E4F28E78] string];
  int v6 = (objc_class *)objc_opt_class();
  [(__CFString *)v5 appendFormat:@"<%@:%p; ", NSStringFromClass(v6), self];
  int v7 = [(CALayer *)self name];
  if (v7) {
    [(__CFString *)v5 appendFormat:@"name = \"%@\"; ", v7];
  }
  -[__CFString appendFormat:](v5, "appendFormat:", @"position = CGPoint (%g %g); ",
    *((void *)layer + 10),
    *((void *)layer + 11));
  -[__CFString appendFormat:](v5, "appendFormat:", @"bounds = CGRect (%g %g; %g %g); ",
    *((void *)layer + 12),
    *((void *)layer + 13),
    *((void *)layer + 14),
    *((void *)layer + 15));
  int v8 = (id *)(layer + 128);
  if (layer[136])
  {
    id Weak = objc_loadWeak(v8);
    if (!Weak) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id Weak = *v8;
  if (Weak) {
LABEL_5:
  }
    [(__CFString *)v5 appendFormat:@"delegate = %@; ", Weak];
LABEL_6:
  if (*((void *)layer + 18)) {
    [(__CFString *)v5 appendFormat:@"contents = %@; ", *((void *)layer + 18)];
  }
  if (CA::Layer::sublayers((CA::Layer *)layer))
  {
    -[__CFString appendFormat:](v5, "appendFormat:", @"sublayers = (");
    uint64_t v10 = *((void *)CA::Layer::sublayers((CA::Layer *)layer) + 2);
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (i) {
          unsigned int v12 = ", ";
        }
        else {
          unsigned int v12 = "";
        }
        int v13 = CA::Layer::sublayers((CA::Layer *)layer);
        int v14 = (void *)((char *)v13 + 8);
        if (*((void *)v13 + 2) != 1 || *((void *)v13 + 3)) {
          int v14 = (void *)*v14;
        }
        [(__CFString *)v5 appendFormat:@"%s%@", v12, v14[i]];
      }
    }
    [(__CFString *)v5 appendFormat:@"; "]);
  }
  if (CA::Layer::mask((CA::Layer *)layer)) {
    [(__CFString *)v5 appendFormat:@"mask = %@; ", CA::Layer::mask((CA::Layer *)layer)];
  }
  uint64_t v15 = 0;
  uint64_t v16 = &off_1E527D528;
  do
  {
    unint64_t v17 = (0x810842018A8uLL >> v15) & 1;
    if (((*(_DWORD *)&layer[4 * (*((int *)v16 - 2) >> 5) + 44] >> *((_DWORD *)v16 - 2)) & 1) != v17)
    {
      if (v17) {
        int v18 = "NO";
      }
      else {
        int v18 = "YES";
      }
      [(__CFString *)v5 appendFormat:@"%s = %s; ", *v16, v18];
    }
    ++v15;
    v16 += 4;
  }
  while (v15 != 46);
  int v19 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v19 + 1;
  if (!v19) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  if ((layer[56] & 0x10) != 0) {
    [(__CFString *)v5 appendString:@"anchorPoint = CGPoint (0 0); "];
  }
  unsigned int v20 = *((_DWORD *)layer + 11);
  if (((v20 >> 26) & 3) != 0)
  {
    [(__CFString *)v5 appendFormat:@"contentsScale = %u; ", (v20 >> 26) & 3];
    unsigned int v20 = *((_DWORD *)layer + 11);
  }
  uint64_t v21 = (v20 >> 28) & 3;
  if (v21) {
    [(__CFString *)v5 appendFormat:@"rasterizationScale = %u; ", v21];
  }
  int v22 = (CA::AttrList **)*((void *)layer + 9);
  if (v22) {
    CA::AttrList::append_description(*v22, v5);
  }
  if (*((void *)layer + 35))
  {
    [(__CFString *)v5 appendString:@"; animations = ["];
    double v23 = (uint64_t **)*((void *)layer + 35);
    if (v23)
    {
      char v24 = 1;
      do
      {
        if (((_WORD)v23[7] & 0x24) == 0)
        {
          if ((v24 & 1) == 0) {
            [(__CFString *)v5 appendString:@" "];
          }
          if (v23[2]) {
            [(__CFString *)v5 appendFormat:@"%@=%@", v23[2], v23[1]];
          }
          else {
            [(__CFString *)v5 appendFormat:@"%@", v23[1], v26];
          }
          char v24 = 0;
        }
        double v23 = (uint64_t **)*v23;
      }
      while (v23);
    }
    [(__CFString *)v5 appendString:@"]"];
  }
  CA::Transaction::unlock(v3);
  [(__CFString *)v5 appendString:@">"];
  return v5;
}

- (id)_initWithReference:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[CALayer _initWithReference:]", "CALayer.mm", 2059, "[layer isKindOfClass:[self class]]");
  }
  self->_attr.magic = 1279351122;
  v18.receiver = self;
  v18.super_class = (Class)CALayer;
  id v5 = [(CALayer *)&v18 init];
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = *((void *)a3 + 2);
    int v10 = *(_DWORD *)(v7 + 40);
    int v8 = (const CA::Layer::State *)(v7 + 40);
    char v9 = v10;
    unsigned int v11 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v11) {
      unsigned int v11 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v5);
    }
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    int v13 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v13)
    {
      layer = v13;
      *int v13 = 0;
      v13[1] = 0;
      uint64_t v15 = (CA::Layer::State *)(v13 + 5);
      if (v9) {
        int v16 = 33980418;
      }
      else {
        int v16 = 33980416;
      }
      layer[3] = 0;
      layer[4] = 0;
      layer[2] = v6;
      CA::Layer::State::State(v15, v8, v11);
      layer[19] = 0;
      layer[20] = 0;
      *((_DWORD *)layer + 44) = 0;
      layer[21] = 0;
      *(_OWORD *)(layer + 23) = 0u;
      *(_OWORD *)(layer + 25) = 0u;
      *(_OWORD *)(layer + 27) = 0u;
      *(_OWORD *)(layer + 29) = 0u;
      *((unsigned char *)layer + 248) = 0;
      layer[32] = 0;
      layer[33] = 0;
      layer[35] = 0;
      layer[36] = 0;
      *(_DWORD *)layer = 1;
      *((_DWORD *)layer + 1) = v16;
      layer[34] = 0;
      v6->_attr.layer = layer;
    }
    else
    {
      layer = v6->_attr.layer;
    }
    CA::Layer::set_model_layer((CA::Layer *)layer, v11, *((CA::Layer **)a3 + 2));
  }
  return v6;
}

- (unint64_t)retainCount
{
  int refcount = self->_attr.refcount;
  if (refcount <= 1) {
    return 1;
  }
  else {
    return refcount;
  }
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
  return 0;
}

- (double)motionBlurAmount
{
  return 0.0;
}

- (void)setTreatRec709AsSRGB:(BOOL)a3
{
}

- (BOOL)treatRec709AsSRGB
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 3) & 1;
}

- (void)setDefinesDisplayRegionOfInterest:(BOOL)a3
{
}

- (void)setAcceleratesDrawing:(BOOL)a3
{
}

- (void)setBackgroundColorPhase:(CGSize)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x37, (const CGAffineTransform *)0x14, &v3.width);
}

- (CGSize)sizeRequisition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x202u, (const CGAffineTransform *)0x14, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setCreatesCompositingGroup:(BOOL)a3
{
}

- (BOOL)contentsOpaque
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 4) & 1;
}

- (void)setContentsDither:(BOOL)a3
{
}

- (BOOL)contentsDither
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 3) & 1;
}

- (BOOL)contentsAlignsToPixels
{
  return *((unsigned char *)self->_attr.layer + 53) & 1;
}

- (void)setSoftRim:(BOOL)a3
{
}

- (void)setBorderPathIsBounds:(BOOL)a3
{
}

- (void)setRimPathIsBounds:(BOOL)a3
{
}

- (BOOL)usesWebKitBehavior
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 3) & 1;
}

- (BOOL)sortsSublayers
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 2) & 1;
}

- (void)setFrozen:(BOOL)a3
{
}

- (void)setCanDrawConcurrently:(BOOL)a3
{
}

- (BOOL)canDrawConcurrently
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 5) & 1;
}

- (void)setLiteralContentsCenter:(BOOL)a3
{
}

- (void)setHitTestsContentsAlphaChannel:(BOOL)a3
{
}

- (void)encodeWithCAMLWriter:(id)a3
{
  double v5 = (CA::Transaction *)CAObject_encodeWithCAMLWriter(self, a3);
  if (*((void *)self->_attr.layer + 35))
  {
    uint64_t v6 = CA::Transaction::ensure_compat(v5);
    int v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    [a3 beginPropertyElement:@"animations"];
    [a3 beginElement:1];
    for (uint64_t i = (uint64_t **)*((void *)self->_attr.layer + 35); i; uint64_t i = (uint64_t **)*i)
    {
      if (i[2]
        && ((_WORD)i[7] & 0x24) == 0
        && (![i[1] isRemovedOnCompletion]
         || ([a3 encodingForReverseSerializationTest] & 1) != 0))
      {
        [a3 beginPropertyElement:i[2]];
        [a3 encodeObject:i[1]];
        [a3 endElement];
      }
    }
    [a3 endElement];
    [a3 endElement];
    CA::Transaction::unlock(v6);
  }
}

- (id)recursiveDescription
{
  double v3 = (NSMutableString *)[MEMORY[0x1E4F28E78] string];
  appendLayerDescription(self, v3, 0);
  return v3;
}

- (NSSet)identifiers
{
  return (NSSet *)CA::Layer::identifiers((CA::Layer *)self->_attr.layer);
}

- (void)removeIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  layer = (CA::Layer *)self->_attr.layer;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  v9.Class isa = 0;
  CA::Layer::begin_change(layer, v6, @"identifiers", &v9, v5);
  CFMutableSetRef theSet = 0;
  CA::Layer::getter(layer, 0x10Au, (const CGAffineTransform *)2, (id *)&theSet);
  if (theSet) {
    CFSetRemoveValue(theSet, a3);
  }
  CA::Layer::end_change((id *)layer, v6, 266, (objc_object *)@"identifiers", (objc_object *)v9.isa);
  CA::Transaction::unlock(v6);
}

- (void)addIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  layer = (CA::Layer *)self->_attr.layer;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  v10.Class isa = 0;
  CA::Layer::begin_change(layer, v6, @"identifiers", &v10, v5);
  CFAllocatorRef allocator = 0;
  CA::Layer::getter(layer, 0x10Au, (const CGAffineTransform *)2, (id *)&allocator);
  int v8 = allocator;
  if (!allocator)
  {
    CFAllocatorRef allocator = CFSetCreateMutable(0, 2, MEMORY[0x1E4F1D548]);
    CA::Layer::setter(layer, (const void *)0x10A, (const CGAffineTransform *)2, (double *)&allocator);
    CFRelease(allocator);
    int v8 = allocator;
  }
  CFSetAddValue(v8, a3);
  CA::Layer::end_change((id *)layer, v6, 266, (objc_object *)@"identifiers", (objc_object *)v10.isa);
  CA::Transaction::unlock(v6);
}

- (void)setPresentationModifiers:(id)a3
{
  v9[1] = *(objc_object **)MEMORY[0x1E4F143B8];
  layer = (CA::Layer *)self->_attr.layer;
  uint64_t v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  int v8 = (const void *)*((void *)layer + 36);
  v9[0] = 0;
  CA::Layer::begin_change(layer, v6, @"presentationModifiers", (objc_object *)v9, v5);
  *((void *)layer + 36) = [a3 mutableCopy];
  CA::Layer::end_change((id *)layer, v6, 446, (objc_object *)@"presentationModifiers", v9[0]);
  if (v8) {
    CA::Transaction::release_object(v6, v8);
  }

  CA::Transaction::unlock(v6);
}

- (id)layerAtTime:(double)a3
{
  double v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  layer = (CA::Layer *)self->_attr.layer;

  return CA::Layer::layer_at_time(layer, v5, a3, 0, 0);
}

- (id)layerBeingDrawn
{
  double v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    double v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  layer = (CA::Layer *)self->_attr.layer;

  return CA::Layer::layer_being_drawn(layer, v3, 0x800000);
}

- (BOOL)isDescendantOf:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  double v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v5)
  {
    if (self) {
      goto LABEL_4;
    }
LABEL_10:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  double v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  if (!self) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v6 = CA::Layer::superlayer((CA::Layer *)self->_attr.layer, v5);
  if (v6)
  {
    LOBYTE(v6) = [(CALayer *)v6 isDescendantOf:a3];
  }
  return (char)v6;
}

- (BOOL)ignoresHitTesting
{
  if ([(CALayer *)self isHidden]) {
    return 1;
  }
  [(CALayer *)self opacity];
  return v4 <= 0.0;
}

- (void)regionBeingDrawn
{
  CGSize result = [(CALayer *)self contents];
  if (result)
  {
    double v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (CABackingStoreGetTypeID::once[0] != -1) {
      dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
    }
    if (v4 == CABackingStoreGetTypeID::type) {
      return (void *)*((void *)v3 + 56);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)prepareContents
{
  CFTypeID v4 = *(CALayer **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    CFTypeID v4 = (CALayer *)CA::Transaction::create((CA::Transaction *)self);
  }

  CA::Layer::prepare_contents((CA::Layer *)self, v4, v2);
}

- (void)invalidateContents
{
  layer = (id *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    double v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
    unsigned int v4 = v3[25];
    v3[25] = v4 + 1;
    if (!v4) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    double v5 = (const void *)[layer[2] contents];
    uint64_t v6 = (uint64_t)v5;
    if (!v5) {
      goto LABEL_9;
    }
    CFTypeID v7 = CFGetTypeID(v5);
    if (CABackingStoreGetTypeID::once[0] != -1)
    {
      CFTypeID v12 = v7;
      dispatch_once(CABackingStoreGetTypeID::once, &__block_literal_global_907);
      CFTypeID v7 = v12;
    }
    if (v7 == CABackingStoreGetTypeID::type)
    {
      CABackingStoreSetVolatile(v6, 1);
      CA::Layer::mark((CA::Layer *)layer, (CA::Transaction *)v3, 1032, 16);
    }
    else
    {
LABEL_9:
      [layer[2] setContents:0];
    }
    *((_DWORD *)layer + 13) &= ~0x800000u;
    uint64_t v8 = v3[24];
    if ((v8 & 0x80000000) != 0 || (objc_object v9 = (char *)layer + 4 * v8, (v10 = *((_DWORD *)v9 + 68)) == 0))
    {
      uint64_t v11 = CA::Layer::thread_flags_((CA::Layer *)layer, (CA::Transaction *)v3);
      int v10 = *v11;
    }
    else
    {
      uint64_t v11 = (int *)(v9 + 272);
    }
    *uint64_t v11 = v10 & 0xFFFFFEFF;
    CA::Transaction::unlock((CA::Transaction *)v3);
  }
}

- (BOOL)drawsMipmapLevels
{
  return 0;
}

- (void)reloadValueForKeyPath:(id)a3
{
  AtomInKeyPath = (CA::Transaction *)CAInternFirstAtomInKeyPath((const __CFString *)a3);
  int v5 = (int)AtomInKeyPath;
  uint64_t v6 = CA::Transaction::ensure_compat(AtomInKeyPath);
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  CA::Layer::property_did_change((id *)self->_attr.layer, v6, v5);

  CA::Transaction::unlock(v6);
}

- (BOOL)getRendererInfo:(_CARenderRendererInfo *)a3 size:(unint64_t)a4
{
  mach_msg_return_t v19;
  int v20;
  BOOL v21;
  unsigned int v22;
  unsigned int v23[2];
  int msg;
  unsigned char msg_4[48];
  int v26;
  uint64_t v27;

  uint64_t v27 = *MEMORY[0x1E4F143B8];
  layer = (CA::Layer *)self->_attr.layer;
  int v7 = CA::Layer::retain_context(layer);
  if (v7)
  {
    uint64_t v8 = v7;
    if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1) {
      dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_13615);
    }
    if (layer) {
      objc_object v9 = (CA::Layer *)((char *)layer + CA::Render::_render_id_slide);
    }
    else {
      objc_object v9 = 0;
    }
    if (a4 < 0xC) {
      goto LABEL_8;
    }
    int v11 = *((_DWORD *)layer + 66);
    *(void *)double v23 = 0;
    int v22 = 0;
    uint64_t v12 = *((void *)v8 + 13);
    if (v12)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v12 + 72));
      int layer_renderer_info = CA::Render::Context::get_layer_renderer_info((CA::Render::Context *)v12, v9, v11, (int *)&v23[1], v23, &v22);
      pthread_mutex_unlock((pthread_mutex_t *)(v12 + 72));
      if (!layer_renderer_info) {
        goto LABEL_14;
      }
      unsigned int v14 = v23[0];
      int v13 = v23[1];
      unsigned int v15 = v22;
LABEL_13:
      a3->var0 = v13;
      a3->var1 = v14;
      LOBYTE(layer_renderer_info) = 1;
      a3->var2 = v15;
      goto LABEL_14;
    }
    if ((*((unsigned char *)v8 + 241) & 2) != 0)
    {
LABEL_8:
      LOBYTE(layer_renderer_info) = 0;
LABEL_14:
      CA::Context::unref((CA::Context *)v8, 0);
      return layer_renderer_info;
    }
    int v17 = v8[40];
    memset(&msg_4[16], 0, 32);
    *(_OWORD *)msg_4 = 0u;
    *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
    *(void *)&msg_4[28] = v9;
    uint64_t v26 = 0;
    *(_DWORD *)&msg_4[36] = v11;
    mach_port_t reply_port = mig_get_reply_port();
    *(_DWORD *)&msg_4[4] = v17;
    *(_DWORD *)&msg_4[8] = reply_port;
    msg = 5395;
    *(void *)&msg_4[12] = 0x9D5400000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      mach_port_t reply_port = *(_DWORD *)&msg_4[8];
    }
    uint64_t v19 = mach_msg((mach_msg_header_t *)&msg, 3, 0x2Cu, 0x38u, reply_port, 0, 0);
    unsigned int v20 = v19;
    if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
      goto LABEL_40;
    }
    if (v19)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
LABEL_42:
      unsigned int v15 = 0;
      unsigned int v14 = 0;
      int v13 = 0;
      if (!v20) {
        goto LABEL_13;
      }
      if (v20 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_8;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      unsigned int v20 = -308;
    }
    else if (*(_DWORD *)&msg_4[16] == 40376)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 48)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            unsigned int v20 = *(_DWORD *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              int v13 = *(_DWORD *)&msg_4[32];
              unsigned int v14 = *(_DWORD *)&msg_4[36];
              unsigned int v15 = *(_DWORD *)&msg_4[40];
              goto LABEL_13;
            }
            goto LABEL_39;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4]) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = *(_DWORD *)&msg_4[28] == 0;
          }
          if (v21) {
            unsigned int v20 = -300;
          }
          else {
            unsigned int v20 = *(_DWORD *)&msg_4[28];
          }
          goto LABEL_39;
        }
      }
      unsigned int v20 = -300;
    }
    else
    {
      unsigned int v20 = -301;
    }
LABEL_39:
    mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_40:
    if (v20 == 268435459)
    {
      LOBYTE(layer_renderer_info) = 0;
      *((unsigned char *)v8 + 241) |= 2u;
      goto LABEL_14;
    }
    goto LABEL_42;
  }
  LOBYTE(layer_renderer_info) = 0;
  return layer_renderer_info;
}

+ (CALayer)layerWithRenderLayer:(void *)a3 options:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"contextColorspace", 0, v8);
  if (v5) {
    uint64_t v7 = v5;
  }
  return calayer_from_render_layer((uint64_t)&v7, (uint64_t)a3);
}

+ (CALayer)layerWithRenderLayer:(void *)a3
{
  return +[CALayer layerWithRenderLayer:a3 options:0];
}

+ (BOOL)needsLayoutForKey:(id)a3
{
  return 0;
}

- (id)optimizationOpportunities:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = &-[CALayer(Optimizations) optimizationOpportunities:]::entries;
  do
  {
    uint64_t v7 = v6[1];
    if ((*v6)(self)) {
      [v5 addObject:v7];
    }
    v6 += 2;
  }
  while (v6 != (uint64_t (**)(CALayer *))&unk_1ED0314E8);
  if (v3)
  {
    uint64_t v8 = &-[CALayer(Optimizations) optimizationOpportunities:]::internal_entries;
    do
    {
      objc_object v9 = v8[1];
      if ((*v8)(self)) {
        [v5 addObject:v9];
      }
      v8 += 2;
    }
    while (v8 != &-[CALayer(Optimizations) optimizationOpportunities:]::entries);
  }
  return v5;
}

@end