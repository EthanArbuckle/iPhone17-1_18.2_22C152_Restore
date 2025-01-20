@interface DRPDropletViewConfiguration
+ (id)edgeAdaptiveKeylineWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 protrusionFromEdge:(double)a5 centerAlongEdge:(double)a6 containerSize:(CGSize)a7 containerCornerRadius:(double)a8 transform3D:(CATransform3D *)a9 dropletRadius:(double)a10;
+ (id)edgeContentPresentedWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 lengthAlongEdge:(double)a5 protrusionFromEdge:(double)a6 centerAlongEdge:(double)a7 inflationProgress:(double)a8 dropletRadius:(double)a9;
+ (id)edgeHintWithCanvasSize:(CGSize)a3 hintSize:(double)a4 edge:(unint64_t)a5 centerAlongEdge:(double)a6 progress:(double)a7 dropletRadius:(double)a8;
+ (id)rightEdgeContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8;
+ (id)rightEdgeHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5;
+ (id)trailingContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8;
+ (id)trailingHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5;
- (BOOL)disableDropletEffectFilters;
- (BOOL)isEqual:(id)a3;
- (CATransform3D)containerTransform;
- (DRPDropletContextKeylineStyle)keylineStyle;
- (DRPDropletViewConfiguration)init;
- (DRPDropletViewConfiguration)initWithCenterX:(double)a3 centerY:(double)a4 boundaryEdges:(unint64_t)a5 containerCornerRadius:(double)a6 containerHeight:(double)a7 containerWidth:(double)a8 containerTransform:(CATransform3D *)a9 dropletColor:(id)a10 dropletRadius:(double)a11 disableDropletEffectFilters:(BOOL)a12 boundaryOutsets:(UIEdgeInsets)a13 keylineStyle:(id)a14;
- (DRPDropletViewConfiguration)initWithViewConfiguration:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (UIColor)dropletColor;
- (UIEdgeInsets)boundaryOutsets;
- (double)centerX;
- (double)centerY;
- (double)containerCornerRadius;
- (double)containerHeight;
- (double)containerWidth;
- (double)dropletRadius;
- (id)animationBlockForKeyPath:(id)a3;
- (id)animationCompletionBlockForKeyPath:(id)a3;
- (id)anyAnimationCompletionBlock;
- (id)behaviorSettingsForKeyPath:(id)a3;
- (id)copy;
- (unint64_t)boundaryEdges;
- (void)addAlongsideAnimationBlockForKeyPath:(id)a3 animationBlock:(id)a4;
- (void)addAnimationCompletionBlockForKeyPath:(id)a3 animationCompletionBlock:(id)a4;
- (void)addAnyAnimationCompletionBlock:(id)a3;
- (void)changeToIntelligentLightStyle:(unint64_t)a3 preferAudioReactivity:(BOOL)a4 canvasSize:(CGSize)a5;
- (void)defaultResetKeylineForCanvasSize:(CGSize)a3;
- (void)removeAnyAnimationCompletionBlocks;
- (void)setBehaviorSettingsForKeyPath:(id)a3 behaviorSettings:(id)a4;
- (void)setBoundaryEdges:(unint64_t)a3;
- (void)setBoundaryOutsets:(UIEdgeInsets)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setContainerCornerRadius:(double)a3;
- (void)setContainerHeight:(double)a3;
- (void)setContainerTransform:(CATransform3D *)a3;
- (void)setContainerWidth:(double)a3;
- (void)setDisableDropletEffectFilters:(BOOL)a3;
- (void)setDropletColor:(id)a3;
- (void)setDropletRadius:(double)a3;
- (void)setKeylineStyle:(id)a3;
@end

@implementation DRPDropletViewConfiguration

- (double)centerX
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  swift_beginAccess();
  return *v2;
}

- (void)setCenterX:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerX);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)centerY
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  swift_beginAccess();
  return *v2;
}

- (void)setCenterY:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_centerY);
  swift_beginAccess();
  double *v4 = a3;
}

- (unint64_t)boundaryEdges
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  swift_beginAccess();
  return *v2;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryEdges);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (double)containerCornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerCornerRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerCornerRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)containerHeight
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerHeight:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerHeight);
  swift_beginAccess();
  double *v4 = a3;
}

- (double)containerWidth
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setContainerWidth:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerWidth);
  swift_beginAccess();
  double *v4 = a3;
}

- (CATransform3D)containerTransform
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform);
  result = (CATransform3D *)swift_beginAccess();
  long long v6 = v4[1];
  *(_OWORD *)&retstr->m11 = *v4;
  *(_OWORD *)&retstr->m13 = v6;
  long long v7 = v4[3];
  *(_OWORD *)&retstr->m21 = v4[2];
  *(_OWORD *)&retstr->m23 = v7;
  long long v8 = v4[5];
  *(_OWORD *)&retstr->m31 = v4[4];
  *(_OWORD *)&retstr->m33 = v8;
  long long v9 = v4[7];
  *(_OWORD *)&retstr->m41 = v4[6];
  *(_OWORD *)&retstr->m43 = v9;
  return result;
}

- (void)setContainerTransform:(CATransform3D *)a3
{
  long long v12 = *(_OWORD *)&a3->m11;
  long long v10 = *(_OWORD *)&a3->m21;
  long long v11 = *(_OWORD *)&a3->m13;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v9 = *(_OWORD *)&a3->m23;
  long long v6 = *(_OWORD *)&a3->m41;
  long long v7 = *(_OWORD *)&a3->m33;
  CGFloat m43 = a3->m43;
  CGFloat m44 = a3->m44;
  v5 = (char *)self + OBJC_IVAR___DRPDropletViewConfiguration_containerTransform;
  swift_beginAccess();
  *(_OWORD *)v5 = v12;
  *((_OWORD *)v5 + 1) = v11;
  *((_OWORD *)v5 + 2) = v10;
  *((_OWORD *)v5 + 3) = v9;
  *((_OWORD *)v5 + 4) = v8;
  *((_OWORD *)v5 + 5) = v7;
  *((_OWORD *)v5 + 6) = v6;
  *((CGFloat *)v5 + 14) = m43;
  *((CGFloat *)v5 + 15) = m44;
}

- (UIColor)dropletColor
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setDropletColor:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_dropletColor);
  swift_beginAccess();
  v5 = *v4;
  _OWORD *v4 = a3;
  id v6 = a3;
}

- (double)dropletRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setDropletRadius:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_dropletRadius);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)disableDropletEffectFilters
{
  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletViewConfiguration_disableDropletEffectFilters;
  swift_beginAccess();
  return *v2;
}

- (void)setDisableDropletEffectFilters:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletViewConfiguration_disableDropletEffectFilters;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (UIEdgeInsets)boundaryOutsets
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setBoundaryOutsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  long long v7 = (CGFloat *)((char *)self + OBJC_IVAR___DRPDropletViewConfiguration_boundaryOutsets);
  swift_beginAccess();
  *long long v7 = top;
  v7[1] = left;
  v7[2] = bottom;
  v7[3] = right;
}

- (DRPDropletContextKeylineStyle)keylineStyle
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (DRPDropletContextKeylineStyle *)v2;
}

- (void)setKeylineStyle:(id)a3
{
  double v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration_keylineStyle);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)anyAnimationCompletionBlock
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock))
  {
    uint64_t v2 = *(void *)&self->centerX[OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
    v5[5] = v2;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    v5[2] = sub_24D11D2E4;
    v5[3] = &block_descriptor_86;
    double v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (void)removeAnyAnimationCompletionBlocks
{
  uint64_t v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock);
  void *v2 = 0;
  v2[1] = 0;
  sub_24D124CB4(v3);
}

- (void)addAnyAnimationCompletionBlock:(id)a3
{
  double v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  double v6 = self;
  DRPDropletViewConfiguration.addAnyAnimationCompletionBlock(_:)((uint64_t)sub_24D124D48, v5);

  swift_release();
}

- (id)animationBlockForKeyPath:(id)a3
{
  uint64_t v4 = sub_24D149268();
  uint64_t v6 = v5;
  long long v7 = self;
  long long v8 = DRPDropletViewConfiguration.animationBlock(forKeyPath:)(v4, v6);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v8)
  {
    v12[4] = v8;
    v12[5] = v10;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    v12[2] = sub_24D11D81C;
    v12[3] = &block_descriptor_80;
    long long v8 = _Block_copy(v12);
    swift_release();
  }
  return v8;
}

- (void)addAlongsideAnimationBlockForKeyPath:(id)a3 animationBlock:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_24D149268();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_24D124D34;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  DRPDropletViewConfiguration.addAlongsideAnimationBlock(forKeyPath:animationBlock:)(v6, v8, (uint64_t)v5, v9);
  sub_24D124CB4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (id)behaviorSettingsForKeyPath:(id)a3
{
  uint64_t v4 = sub_24D149268();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)DRPDropletViewConfiguration.behaviorSettings(forKeyPath:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)setBehaviorSettingsForKeyPath:(id)a3 behaviorSettings:(id)a4
{
  uint64_t v6 = sub_24D149268();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  DRPDropletViewConfiguration.setBehaviorSettingsForKeyPath(_:behaviorSettings:)(v6, v8, (uint64_t)a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)animationCompletionBlockForKeyPath:(id)a3
{
  uint64_t v4 = sub_24D149268();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = DRPDropletViewConfiguration.animationCompletionBlock(forKeyPath:)(v4, v6);
  uint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v8)
  {
    v12[4] = v8;
    v12[5] = v10;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 1107296256;
    v12[2] = sub_24D11E0A4;
    v12[3] = &block_descriptor_0;
    uint64_t v8 = _Block_copy(v12);
    swift_release();
  }
  return v8;
}

- (void)addAnimationCompletionBlockForKeyPath:(id)a3 animationCompletionBlock:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_24D149268();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    uint64_t v5 = sub_24D124CFC;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = self;
  DRPDropletViewConfiguration.addAnimationCompletionBlock(forKeyPath:animationCompletionBlock:)(v6, v8, (uint64_t)v5, v9);
  sub_24D124CB4((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (DRPDropletViewConfiguration)initWithCenterX:(double)a3 centerY:(double)a4 boundaryEdges:(unint64_t)a5 containerCornerRadius:(double)a6 containerHeight:(double)a7 containerWidth:(double)a8 containerTransform:(CATransform3D *)a9 dropletColor:(id)a10 dropletRadius:(double)a11 disableDropletEffectFilters:(BOOL)a12 boundaryOutsets:(UIEdgeInsets)a13 keylineStyle:(id)a14
{
  long long v22 = *(_OWORD *)&a9->m13;
  v34[0] = *(_OWORD *)&a9->m11;
  v34[1] = v22;
  long long v23 = *(_OWORD *)&a9->m23;
  v34[2] = *(_OWORD *)&a9->m21;
  v34[3] = v23;
  long long v24 = *(_OWORD *)&a9->m33;
  v34[4] = *(_OWORD *)&a9->m31;
  v34[5] = v24;
  long long v25 = *(_OWORD *)&a9->m43;
  v34[6] = *(_OWORD *)&a9->m41;
  v34[7] = v25;
  id v26 = a10;
  swift_unknownObjectRetain();
  v30 = (DRPDropletViewConfiguration *)sub_24D123568(a5, v34, a10, a12, (uint64_t)a14, a3, a4, a6, a7, a8, a11, a13.top, a13.left, v27, v28, v29, *(uint64_t *)&a13.bottom, *(uint64_t *)&a13.right);

  swift_unknownObjectRelease();
  return v30;
}

- (DRPDropletViewConfiguration)initWithViewConfiguration:(id)a3
{
  return (DRPDropletViewConfiguration *)DRPDropletViewConfiguration.init(viewConfiguration:)((char *)a3);
}

- (id)copy
{
  id v3 = objc_allocWithZone((Class)DRPDropletViewConfiguration);
  return objc_msgSend(v3, sel_initWithViewConfiguration_, self);
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_24D11F8DC(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698581A0);
  sub_24D123808((unint64_t *)&qword_2698583A0, (uint64_t *)&unk_2698581A0);
  sub_24D149248();

  swift_bridgeObjectRelease();
  id v3 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  DRPDropletViewConfiguration.debugDescription.getter();

  id v3 = (void *)sub_24D149258();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_24D149388();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = DRPDropletViewConfiguration.isEqual(_:)((uint64_t)v8);

  sub_24D1238B4((uint64_t)v8);
  return v6;
}

- (DRPDropletViewConfiguration)init
{
  UIEdgeInsets result = (DRPDropletViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_24D124CB4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___DRPDropletViewConfiguration__anyAnimationCompletionBlock));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)changeToIntelligentLightStyle:(unint64_t)a3 preferAudioReactivity:(BOOL)a4 canvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  id v10 = objc_allocWithZone((Class)DRPDropletContextIntelligentEdgeLightKeylineStyle);
  long long v12 = self;
  id v11 = objc_msgSend(v10, sel_initWithPreferringAudioReactivity_style_, v7, a3);
  [(DRPDropletViewConfiguration *)v12 setKeylineStyle:v11];

  -[DRPDropletViewConfiguration defaultResetKeylineForCanvasSize:](v12, sel_defaultResetKeylineForCanvasSize_, width, height);
}

- (void)defaultResetKeylineForCanvasSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  DRPDropletViewConfiguration.defaultResetKeyline(forCanvasSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));
}

+ (id)trailingHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5
{
  id v5 = objc_msgSend(a1, sel_rightEdgeHintWithCanvasSize_centerY_progress_, a3.width, a3.height, a4, a5);
  return v5;
}

+ (id)rightEdgeHintWithCanvasSize:(CGSize)a3 centerY:(double)a4 progress:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = objc_msgSend(self, sel_rootSettings);
  objc_msgSend(v10, sel_rightEdgeHintSize);
  double v12 = v11;
  objc_msgSend(v10, sel_rightEdgeHintDropletRadius);
  id v14 = objc_msgSend(a1, sel_edgeHintWithCanvasSize_hintSize_edge_centerAlongEdge_progress_dropletRadius_, 8, width, height, v12, a4, a5, v13);

  return v14;
}

+ (id)edgeHintWithCanvasSize:(CGSize)a3 hintSize:(double)a4 edge:(unint64_t)a5 centerAlongEdge:(double)a6 progress:(double)a7 dropletRadius:(double)a8
{
  id v8 = sub_24D1240C8(a5, a3.width, a3.height, a4, a6, a7, a8);
  return v8;
}

+ (id)trailingContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8
{
  id v8 = objc_msgSend(a1, sel_rightEdgeContentPresentedWithCanvasSize_contentSize_centerY_dropletRadius_isOffscreen_inflationProgress_, a7, a3.width, a3.height, a4.width, a4.height, a5, a6, a8);
  return v8;
}

+ (id)rightEdgeContentPresentedWithCanvasSize:(CGSize)a3 contentSize:(CGSize)a4 centerY:(double)a5 dropletRadius:(double)a6 isOffscreen:(BOOL)a7 inflationProgress:(double)a8
{
  BOOL v8 = a7;
  double width = a4.width;
  double height = a3.height;
  double v11 = a3.width;
  id v12 = objc_msgSend(a1, sel_edgeContentPresentedWithCanvasSize_edge_lengthAlongEdge_protrusionFromEdge_centerAlongEdge_inflationProgress_dropletRadius_, 8, a3.width, a3.height, a4.height, a4.width, a5, a8, a6);
  double v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, sel_centerX);
    objc_msgSend(v13, sel_setCenterX_, width + v14);
  }
  objc_msgSend(v13, sel_defaultResetKeylineForCanvasSize_, v11, height);
  return v13;
}

+ (id)edgeContentPresentedWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 lengthAlongEdge:(double)a5 protrusionFromEdge:(double)a6 centerAlongEdge:(double)a7 inflationProgress:(double)a8 dropletRadius:(double)a9
{
  double height = a3.height;
  double width = a3.width;
  swift_getObjCClassMetadata();
  id v17 = sub_24D121524(a4, width, height, a5, a6, a7, a8, a9);
  return v17;
}

+ (id)edgeAdaptiveKeylineWithCanvasSize:(CGSize)a3 edge:(unint64_t)a4 protrusionFromEdge:(double)a5 centerAlongEdge:(double)a6 containerSize:(CGSize)a7 containerCornerRadius:(double)a8 transform3D:(CATransform3D *)a9 dropletRadius:(double)a10
{
  long long v10 = *(_OWORD *)&a9->m13;
  v16[0] = *(_OWORD *)&a9->m11;
  v16[1] = v10;
  long long v11 = *(_OWORD *)&a9->m23;
  v16[2] = *(_OWORD *)&a9->m21;
  v16[3] = v11;
  long long v12 = *(_OWORD *)&a9->m33;
  v16[4] = *(_OWORD *)&a9->m31;
  v16[5] = v12;
  long long v13 = *(_OWORD *)&a9->m43;
  v16[6] = *(_OWORD *)&a9->m41;
  v16[7] = v13;
  id v14 = sub_24D12464C(a4, (uint64_t *)v16, a3.width, a3.height, a5, a6, a7.width, a7.height, a8, a10);
  return v14;
}

@end