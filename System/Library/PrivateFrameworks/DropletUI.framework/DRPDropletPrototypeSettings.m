@interface DRPDropletPrototypeSettings
+ (id)settingsControllerModule;
- (BOOL)intelligentEdgeLightKeylineStyleHardRimIsSoft;
- (BOOL)intelligentEdgeLightKeylineStyleHardScreenBlendMode;
- (BOOL)intelligentEdgeLightKeylineStyleSoftRimIsSoft;
- (BOOL)intelligentEdgeLightKeylineStyleSoftScreenBlendMode;
- (BOOL)suppressCompositingFilterDestOut;
- (BOOL)suppressCompositingFilterMultiply;
- (BOOL)suppressDropletEffectFilters;
- (DRPDropletCAColorMatrixPrototypeSettings)edgeContentPresentedKeylineAdaptiveColorMatrix;
- (DRPDropletCAColorMatrixPrototypeSettings)edgeHintKeylineAdaptiveColorMatrix;
- (DRPDropletCAColorMatrixPrototypeSettings)intelligentEdgeLightKeylineStyleColorMatrix;
- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterXAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterYAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerHeightAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerWidthAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeContentPresentedKeylineStyleAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeHintCenterXAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeHintCenterYAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeHintContainerHeightAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeHintContainerWidthAnimationSettings;
- (SUIAFluidBehaviorSettings)edgeHintKeylineStyleAnimationSettings;
- (SUIAFluidBehaviorSettings)intelligentEdgeLightKeylineStyleDefaultBehaviorSettings;
- (double)edgeContentPresentedKeylineInnerWidth;
- (double)edgeContentPresentedKeylineOuterWidth;
- (double)edgeHintKeylineInnerWidth;
- (double)edgeHintKeylineOuterWidth;
- (double)intelligentEdgeLightEDRGainAmount;
- (double)intelligentEdgeLightKeylineStyleHardAlpha;
- (double)intelligentEdgeLightKeylineStyleHardLargeAmount;
- (double)intelligentEdgeLightKeylineStyleHardLargeBlurRadius;
- (double)intelligentEdgeLightKeylineStyleHardLargeEnd;
- (double)intelligentEdgeLightKeylineStyleHardLargeStart;
- (double)intelligentEdgeLightKeylineStyleHardSmallWidth;
- (double)intelligentEdgeLightKeylineStyleSoftAlpha;
- (double)intelligentEdgeLightKeylineStyleSoftLargeAmount;
- (double)intelligentEdgeLightKeylineStyleSoftLargeBlurRadius;
- (double)intelligentEdgeLightKeylineStyleSoftLargeEnd;
- (double)intelligentEdgeLightKeylineStyleSoftLargeStart;
- (double)intelligentEdgeLightKeylineStyleSoftSmallWidth;
- (double)rightEdgeHintDropletRadius;
- (double)rightEdgeHintSize;
- (void)setDefaultValues;
- (void)setEdgeContentPresentedCenterXAnimationSettings:(id)a3;
- (void)setEdgeContentPresentedCenterYAnimationSettings:(id)a3;
- (void)setEdgeContentPresentedContainerHeightAnimationSettings:(id)a3;
- (void)setEdgeContentPresentedContainerWidthAnimationSettings:(id)a3;
- (void)setEdgeContentPresentedKeylineAdaptiveColorMatrix:(id)a3;
- (void)setEdgeContentPresentedKeylineInnerWidth:(double)a3;
- (void)setEdgeContentPresentedKeylineOuterWidth:(double)a3;
- (void)setEdgeContentPresentedKeylineStyleAnimationSettings:(id)a3;
- (void)setEdgeHintCenterXAnimationSettings:(id)a3;
- (void)setEdgeHintCenterYAnimationSettings:(id)a3;
- (void)setEdgeHintContainerHeightAnimationSettings:(id)a3;
- (void)setEdgeHintContainerWidthAnimationSettings:(id)a3;
- (void)setEdgeHintKeylineAdaptiveColorMatrix:(id)a3;
- (void)setEdgeHintKeylineInnerWidth:(double)a3;
- (void)setEdgeHintKeylineOuterWidth:(double)a3;
- (void)setEdgeHintKeylineStyleAnimationSettings:(id)a3;
- (void)setIntelligentEdgeLightEDRGainAmount:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleColorMatrix:(id)a3;
- (void)setIntelligentEdgeLightKeylineStyleDefaultBehaviorSettings:(id)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardAlpha:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardLargeAmount:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardLargeEnd:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardLargeStart:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardRimIsSoft:(BOOL)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardScreenBlendMode:(BOOL)a3;
- (void)setIntelligentEdgeLightKeylineStyleHardSmallWidth:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftAlpha:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftLargeAmount:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftLargeEnd:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftLargeStart:(double)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftRimIsSoft:(BOOL)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftScreenBlendMode:(BOOL)a3;
- (void)setIntelligentEdgeLightKeylineStyleSoftSmallWidth:(double)a3;
- (void)setRightEdgeHintDropletRadius:(double)a3;
- (void)setRightEdgeHintSize:(double)a3;
- (void)setSuppressCompositingFilterDestOut:(BOOL)a3;
- (void)setSuppressCompositingFilterMultiply:(BOOL)a3;
- (void)setSuppressDropletEffectFilters:(BOOL)a3;
@end

@implementation DRPDropletPrototypeSettings

- (BOOL)suppressCompositingFilterMultiply
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressCompositingFilterMultiply:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)suppressCompositingFilterDestOut
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressCompositingFilterDestOut:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)suppressDropletEffectFilters
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressDropletEffectFilters:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)rightEdgeHintSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  swift_beginAccess();
  return *v2;
}

- (void)setRightEdgeHintSize:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)rightEdgeHintDropletRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setRightEdgeHintDropletRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)edgeHintKeylineInnerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeHintKeylineInnerWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)edgeHintKeylineOuterWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeHintKeylineOuterWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)edgeHintKeylineAdaptiveColorMatrix
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setEdgeHintKeylineAdaptiveColorMatrix:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeHintCenterXAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintCenterXAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeHintCenterYAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintCenterYAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeHintContainerWidthAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintContainerWidthAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeHintContainerHeightAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintContainerHeightAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeHintKeylineStyleAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintKeylineStyleAnimationSettings:(id)a3
{
}

- (double)edgeContentPresentedKeylineInnerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeContentPresentedKeylineInnerWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)edgeContentPresentedKeylineOuterWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeContentPresentedKeylineOuterWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)edgeContentPresentedKeylineAdaptiveColorMatrix
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setEdgeContentPresentedKeylineAdaptiveColorMatrix:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterXAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedCenterXAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterYAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedCenterYAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerWidthAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedContainerWidthAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerHeightAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedContainerHeightAnimationSettings:(id)a3
{
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedKeylineStyleAnimationSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedKeylineStyleAnimationSettings:(id)a3
{
}

- (BOOL)intelligentEdgeLightKeylineStyleSoftScreenBlendMode
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftScreenBlendMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftScreenBlendMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftScreenBlendMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftAlpha
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftAlpha:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftAlpha);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeBlurRadius
{
  v2 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeStart
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeStart);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeStart:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeStart);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeEnd
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeEnd);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeEnd:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeEnd);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)intelligentEdgeLightKeylineStyleSoftRimIsSoft
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftRimIsSoft;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftRimIsSoft:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftRimIsSoft;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftSmallWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftSmallWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)intelligentEdgeLightKeylineStyleHardScreenBlendMode
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardScreenBlendMode;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardScreenBlendMode:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardScreenBlendMode;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardAlpha
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardAlpha);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardAlpha:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardAlpha);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeBlurRadius
{
  v2 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeStart
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeStart);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeStart:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeStart);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeEnd
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeEnd);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeEnd:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeEnd);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)intelligentEdgeLightKeylineStyleHardRimIsSoft
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardRimIsSoft;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardRimIsSoft:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardRimIsSoft;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardSmallWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardSmallWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)intelligentEdgeLightEDRGainAmount
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightEDRGainAmount:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  swift_beginAccess();
  double *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)intelligentEdgeLightKeylineStyleColorMatrix
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setIntelligentEdgeLightKeylineStyleColorMatrix:(id)a3
{
}

- (SUIAFluidBehaviorSettings)intelligentEdgeLightKeylineStyleDefaultBehaviorSettings
{
  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setIntelligentEdgeLightKeylineStyleDefaultBehaviorSettings:(id)a3
{
}

- (void)setDefaultValues
{
  v2 = self;
  DRPDropletPrototypeSettings.setDefaultValues()();
}

+ (id)settingsControllerModule
{
  _sSo27DRPDropletPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
}

@end