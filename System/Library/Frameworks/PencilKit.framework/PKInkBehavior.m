@interface PKInkBehavior
+ (double)inkRadiusOverride;
+ (id)arrayFromVector:(uint64_t)a1;
+ (id)loadInkV2WithURL:(id)a3;
+ (void)outputFunctionFromInkFunction:(void *)a3;
- (BOOL)isEraser;
- (BOOL)supportsCombiningStrokes;
- (BOOL)useUnclampedWeight;
- (CGAffineTransform)inkTransform;
- (NSArray)inkFunctions;
- (NSArray)uiWidths;
- (NSString)identifier;
- (NSString)variant;
- (PKInkAnimationDescriptor)animationDescriptor;
- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(id)a22 inkFunctions:(id)a23;
- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(void *)a22 radiusOutput:()vector<PKOutputFunction radius2Output:(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std::allocator<PKOutputFunction>> *)a28 allocator<PKOutputFunction>> *)a27 allocator<PKOutputFunction>> *)a26 allocator<PKOutputFunction>> *)a25 allocator<PKOutputFunction>> *)a24 allocator<PKOutputFunction>> *)a23 opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:;
- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 variant:(id)a4;
- (PKInkFeatheringDescriptor)featheringDescriptor;
- (PKInkFeatheringDescriptor)pencilFeatheringDescriptor;
- (PKInkParticleDescriptor)particleDescriptor;
- (PKInkParticleDescriptor)secondaryParticleDescriptor;
- (PKInkRenderingDescriptor)renderingDescriptor;
- (PKInkSmoothingDescriptor)smoothingDescriptor;
- (double)alphaForStroke:(double *)a1;
- (double)alphaForStrokeColor:(double *)a1;
- (double)baseAlpha;
- (double)blendAlpha;
- (double)brushOpacityForPoint:(uint64_t)a3 context:;
- (double)defaultWidth;
- (double)edgeWidthForPoint:(uint64_t)a3 context:;
- (double)solve:(uint64_t)a3 forPoint:(uint64_t)a4 context:(double)a5 weight:;
- (double)targetMultiple;
- (id).cxx_construct;
- (id)description;
- (id)inkFunctionsForProperty:(uint64_t)a1;
- (id)mutableCopy;
- (id)particleTextureName;
- (uint64_t)outputForPoint:(uint64_t)a3@<X2> context:(uint64_t)a4@<X8>;
- (unint64_t)version;
- (void)_calculateUsesAzimuthOrAltitude;
- (void)addNewInkFunction:(id)a3;
- (void)functionsForProperty:(void *)a1;
- (void)inkFunctionDidChange:(id)a3;
- (void)outputFunctionFromInkFunction:(void *)a3;
- (void)radiusForPoint:(uint64_t)a3 context:;
- (void)removeInkFunction:(id)a3;
- (void)setAnimationDescriptor:(id)a3;
- (void)setBaseAlpha:(double)a3;
- (void)setBlendAlpha:(double)a3;
- (void)setDefaultWidth:(double)a3;
- (void)setFeatheringDescriptor:(id)a3;
- (void)setInkTransform:(CGAffineTransform *)a3;
- (void)setPencilFeatheringDescriptor:(id)a3;
- (void)setSmoothingDescriptor:(id)a3;
- (void)setSupportsCombiningStrokes:(BOOL)a3;
- (void)setTargetMultiple:(double)a3;
- (void)setUiWidths:(id)a3;
- (void)setUseUnclampedWeight:(BOOL)a3;
@end

@implementation PKInkBehavior

- (id).cxx_construct
{
  *((void *)self + 27) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

- (BOOL)useUnclampedWeight
{
  return self->_useUnclampedWeight;
}

- (PKInkRenderingDescriptor)renderingDescriptor
{
  return self->_renderingDescriptor;
}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(void *)a22 radiusOutput:()vector<PKOutputFunction radius2Output:(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std::allocator<PKOutputFunction>> *)a28 allocator<PKOutputFunction>> *)a27 allocator<PKOutputFunction>> *)a26 allocator<PKOutputFunction>> *)a25 allocator<PKOutputFunction>> *)a24 allocator<PKOutputFunction>> *)a23 opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:
{
  id v60 = a3;
  id v59 = a9;
  id v58 = a10;
  id v57 = a11;
  id v56 = a12;
  id v40 = a13;
  id v61 = a15;
  id v41 = a16;
  v62.receiver = self;
  v62.super_class = (Class)PKInkBehavior;
  v42 = [(PKInkBehavior *)&v62 init];
  v43 = v42;
  v44 = v42;
  if (v42)
  {
    objc_storeStrong((id *)&v42->_renderingDescriptor, a3);
    objc_storeStrong((id *)&v43->_smoothingDescriptor, a9);
    objc_storeStrong((id *)&v43->_featheringDescriptor, a10);
    objc_storeStrong((id *)&v43->_pencilFeatheringDescriptor, a11);
    objc_storeStrong((id *)&v43->_animationDescriptor, a12);
    v44->_useUnclampedWeight = a8;
    v44->_blendAlpha = a4;
    v44->_targetMultiple = a5;
    v44->_baseAlpha = a6;
    long long v45 = *(_OWORD *)&a7->a;
    long long v46 = *(_OWORD *)&a7->tx;
    *(_OWORD *)&v44->_inkTransform.c = *(_OWORD *)&a7->c;
    *(_OWORD *)&v44->_inkTransform.tx = v46;
    *(_OWORD *)&v44->_inkTransform.a = v45;
    uint64_t v47 = [v40 copy];
    identifier = v44->_identifier;
    v44->_identifier = (NSString *)v47;

    uint64_t v49 = [v61 copy];
    variant = v44->_variant;
    v44->_variant = (NSString *)v49;

    uint64_t v51 = [v41 copy];
    uiWidths = v44->_uiWidths;
    v44->_uiWidths = (NSArray *)v51;

    v44->_defaultWidth = a17;
    v44->_version = a14;
    v44->_showBrushIndicator = a18;
    v44->_supportsCombiningStrokes = a19;
    v44->_rulerOffsetScale = a20;
    v44->_rulerOffsetConstant = a21;
    value = v44->_weightFunction.__ptr_.__value_;
    v44->_weightFunction.__ptr_.__value_ = (PKFunction *)a22;
    if (value) {
      (*(void (**)(PKFunction *))(*(void *)value + 40))(value);
    }
    if (&v43->_radiusOutput != a23) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_radiusOutput, a23->__begin_, a23->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a23->__end_ - a23->__begin_) >> 3));
    }
    if (&v43->_radius2Output != a24) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_radius2Output, a24->__begin_, a24->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a24->__end_ - a24->__begin_) >> 3));
    }
    if (&v43->_opacityOutput != a25) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_opacityOutput, a25->__begin_, a25->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a25->__end_ - a25->__begin_) >> 3));
    }
    if (&v43->_edgeWidthOutput != a26) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_edgeWidthOutput, a26->__begin_, a26->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a26->__end_ - a26->__begin_) >> 3));
    }
    if (&v43->_aspectRatioOutput != a27) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_aspectRatioOutput, a27->__begin_, a27->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a27->__end_ - a27->__begin_) >> 3));
    }
    if (&v43->_brushOpacityOutput != a28) {
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_brushOpacityOutput, a28->__begin_, a28->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a28->__end_ - a28->__begin_) >> 3));
    }
    [(PKInkBehavior *)v44 _calculateUsesAzimuthOrAltitude];
  }

  return v44;
}

- (void)_calculateUsesAzimuthOrAltitude
{
  v13[3] = *MEMORY[0x1E4F143B8];
  memset(v9, 0, sizeof(v9));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v9, self->_radiusOutput.__begin_, self->_radiusOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radiusOutput.__end_ - self->_radiusOutput.__begin_) >> 3));
  memset(v10, 0, sizeof(v10));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v10, self->_radius2Output.__begin_, self->_radius2Output.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radius2Output.__end_ - self->_radius2Output.__begin_) >> 3));
  memset(v11, 0, sizeof(v11));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v11, self->_opacityOutput.__begin_, self->_opacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_opacityOutput.__end_ - self->_opacityOutput.__begin_) >> 3));
  memset(v12, 0, sizeof(v12));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v12, self->_edgeWidthOutput.__begin_, self->_edgeWidthOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_edgeWidthOutput.__end_ - self->_edgeWidthOutput.__begin_) >> 3));
  memset(v13, 0, 24);
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v13, self->_aspectRatioOutput.__begin_, self->_aspectRatioOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_aspectRatioOutput.__end_ - self->_aspectRatioOutput.__begin_) >> 3));
  for (uint64_t i = 0; i != 5; ++i)
  {
    v4 = &v9[3 * i];
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1];
    while (v5 != v6)
    {
      if ((*(void *)(v5 + 24) & 0xFFFFFFFFFFFFFFFELL) == 2) {
        self->_usesAzimuthOrAltitude = 1;
      }
      v5 += 40;
    }
  }
  for (uint64_t j = 12; j != -3; j -= 3)
  {
    v8 = (void **)&v9[j];
    std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v8);
  }
}

+ (id)loadInkV2WithURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = specialized static PKInkBehavior.loadInkV2(url:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v8;
}

+ (void)outputFunctionFromInkFunction:(void *)a3
{
  id v5 = a3;
  self;
  a1[4] = 0;
  *a1 = [v5 inputMask];
  a1[1] = [v5 deviceMask];
  a1[2] = 3;
  uint64_t v4 = [v5 inkInput];
  a1[3] = v4;
  if (v4 != 5)
  {
    if ([v5 functionType] == 6) {
      operator new();
    }
    operator new();
  }
}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(id)a22 inkFunctions:(id)a23
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v53 = a9;
  id v54 = a10;
  id v55 = a11;
  id v56 = a12;
  id v58 = a13;
  id v59 = a15;
  id v60 = a16;
  id v32 = a22;
  id v61 = a23;
  v70.receiver = self;
  v70.super_class = (Class)PKInkBehavior;
  v33 = [(PKInkBehavior *)&v70 init];
  v34 = v33;
  if (!v33) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v33->_renderingDescriptor, a3);
  objc_storeStrong((id *)&v34->_smoothingDescriptor, a9);
  objc_storeStrong((id *)&v34->_featheringDescriptor, a10);
  objc_storeStrong((id *)&v34->_pencilFeatheringDescriptor, a11);
  objc_storeStrong((id *)&v34->_animationDescriptor, a12);
  v34->_useUnclampedWeight = a8;
  v34->_blendAlpha = a4;
  v34->_targetMultiple = a5;
  v34->_baseAlpha = a6;
  long long v35 = *(_OWORD *)&a7->a;
  long long v36 = *(_OWORD *)&a7->tx;
  *(_OWORD *)&v34->_inkTransform.c = *(_OWORD *)&a7->c;
  *(_OWORD *)&v34->_inkTransform.tx = v36;
  *(_OWORD *)&v34->_inkTransform.a = v35;
  uint64_t v37 = [v58 copy];
  identifier = v34->_identifier;
  v34->_identifier = (NSString *)v37;

  uint64_t v39 = [v59 copy];
  variant = v34->_variant;
  v34->_variant = (NSString *)v39;

  uint64_t v41 = [v60 copy];
  uiWidths = v34->_uiWidths;
  v34->_uiWidths = (NSArray *)v41;

  v34->_defaultWidth = a17;
  v34->_version = a14;
  v34->_showBrushIndicator = a18;
  v34->_supportsCombiningStrokes = a19;
  v34->_rulerOffsetScale = a20;
  v34->_rulerOffsetConstant = a21;
  if (!v32)
  {
    value = v34->_weightFunction.__ptr_.__value_;
    v34->_weightFunction.__ptr_.__value_ = 0;
    if (!value) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  +[PKInkBehavior outputFunctionFromInkFunction:v32];
  value = v34->_weightFunction.__ptr_.__value_;
  v34->_weightFunction.__ptr_.__value_ = v69;
  if (value) {
LABEL_4:
  }
    (*(void (**)(PKFunction *))(*(void *)value + 40))(value);
LABEL_5:
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_radiusOutput.__begin_);
  v34->_radiusOutput.__begin_ = 0;
  v34->_radiusOutput.__end_ = 0;
  v34->_radiusOutput.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_radius2Output.__begin_);
  v34->_radius2Output.__begin_ = 0;
  v34->_radius2Output.__end_ = 0;
  v34->_radius2Output.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_opacityOutput.__begin_);
  v34->_opacityOutput.__begin_ = 0;
  v34->_opacityOutput.__end_ = 0;
  v34->_opacityOutput.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_edgeWidthOutput.__begin_);
  v34->_edgeWidthOutput.__begin_ = 0;
  v34->_edgeWidthOutput.__end_ = 0;
  v34->_edgeWidthOutput.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_aspectRatioOutput.__begin_);
  v34->_aspectRatioOutput.__begin_ = 0;
  v34->_aspectRatioOutput.__end_ = 0;
  v34->_aspectRatioOutput.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_brushOpacityOutput.__begin_);
  v34->_brushOpacityOutput.__begin_ = 0;
  v34->_brushOpacityOutput.__end_ = 0;
  v34->_brushOpacityOutput.__end_cap_.__value_ = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v44 = v61;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v63 != v46) {
          objc_enumerationMutation(v44);
        }
        [(PKInkBehavior *)v34 addNewInkFunction:*(void *)(*((void *)&v62 + 1) + 8 * i)];
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v45);
  }

  [(PKInkBehavior *)v34 _calculateUsesAzimuthOrAltitude];
LABEL_13:

  return v34;
}

- (id)mutableCopy
{
  uint64_t v3 = [PKInkBehavior alloc];
  long long v36 = [(PKInkBehavior *)self renderingDescriptor];
  long long v35 = (void *)[v36 mutableCopy];
  [(PKInkBehavior *)self blendAlpha];
  double v5 = v4;
  [(PKInkBehavior *)self targetMultiple];
  double v7 = v6;
  [(PKInkBehavior *)self baseAlpha];
  double v9 = v8;
  [(PKInkBehavior *)self inkTransform];
  BOOL v10 = [(PKInkBehavior *)self useUnclampedWeight];
  v34 = [(PKInkBehavior *)self smoothingDescriptor];
  v33 = (void *)[v34 mutableCopy];
  id v32 = [(PKInkBehavior *)self featheringDescriptor];
  v31 = (void *)[v32 mutableCopy];
  v30 = [(PKInkBehavior *)self pencilFeatheringDescriptor];
  v29 = (void *)[v30 mutableCopy];
  v28 = [(PKInkBehavior *)self animationDescriptor];
  v11 = (void *)[v28 mutableCopy];
  v27 = [(PKInkBehavior *)self identifier];
  unint64_t v12 = [(PKInkBehavior *)self version];
  [(PKInkBehavior *)self variant];
  v26 = BOOL v24 = v10;
  v25 = [(PKInkBehavior *)self uiWidths];
  [(PKInkBehavior *)self defaultWidth];
  double v14 = v13;
  BOOL showBrushIndicator = self->_showBrushIndicator;
  BOOL supportsCombiningStrokes = self->_supportsCombiningStrokes;
  double rulerOffsetScale = self->_rulerOffsetScale;
  double rulerOffsetConstant = self->_rulerOffsetConstant;
  value = self->_weightFunction.__ptr_.__value_;
  if (value) {
    uint64_t v20 = (*(uint64_t (**)(PKFunction *))(*(void *)value + 24))(value);
  }
  else {
    uint64_t v20 = 0;
  }
  memset(v42, 0, sizeof(v42));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v42, self->_radiusOutput.__begin_, self->_radiusOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radiusOutput.__end_ - self->_radiusOutput.__begin_) >> 3));
  memset(v41, 0, sizeof(v41));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v41, self->_radius2Output.__begin_, self->_radius2Output.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radius2Output.__end_ - self->_radius2Output.__begin_) >> 3));
  memset(v40, 0, sizeof(v40));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v40, self->_opacityOutput.__begin_, self->_opacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_opacityOutput.__end_ - self->_opacityOutput.__begin_) >> 3));
  memset(v39, 0, sizeof(v39));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v39, self->_edgeWidthOutput.__begin_, self->_edgeWidthOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_edgeWidthOutput.__end_ - self->_edgeWidthOutput.__begin_) >> 3));
  memset(v38, 0, sizeof(v38));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v38, self->_aspectRatioOutput.__begin_, self->_aspectRatioOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_aspectRatioOutput.__end_ - self->_aspectRatioOutput.__begin_) >> 3));
  memset(v37, 0, sizeof(v37));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v37, self->_brushOpacityOutput.__begin_, self->_brushOpacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_brushOpacityOutput.__end_ - self->_brushOpacityOutput.__begin_) >> 3));
  BYTE1(v23) = supportsCombiningStrokes;
  LOBYTE(v23) = showBrushIndicator;
  v21 = -[PKInkBehavior initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:](v3, "initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:", v35, v43, v24, v33, v31, v29, v5, v7, v9, v14, rulerOffsetScale, rulerOffsetConstant, v11, v27,
          v12,
          v26,
          v25,
          v23,
          v20,
          v42,
          v41,
          v40,
          v39,
          v38,
          v37);
  v44[0] = (void **)v37;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v38;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v39;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v40;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v41;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v42;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);

  return v21;
}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 variant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKInkBehavior;
  double v9 = [(PKInkBehavior *)&v14 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_renderingDescriptor, a3);
    uint64_t v11 = [v8 copy];
    variant = v10->_variant;
    v10->_variant = (NSString *)v11;
  }
  return v10;
}

+ (double)inkRadiusOverride
{
  if (qword_1EB3C5F38 != -1) {
    dispatch_once(&qword_1EB3C5F38, &__block_literal_global_34);
  }
  return *(double *)&_MergedGlobals_129;
}

void __34__PKInkBehavior_inkRadiusOverride__block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v1 doubleForKey:@"PKInkRadiusOverride"];
  _MergedGlobals_129 = v0;
}

- (PKInkParticleDescriptor)particleDescriptor
{
  return [(PKInkRenderingDescriptor *)self->_renderingDescriptor particleDescriptor];
}

- (PKInkParticleDescriptor)secondaryParticleDescriptor
{
  return [(PKInkRenderingDescriptor *)self->_renderingDescriptor secondaryParticleDescriptor];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)variant
{
  return self->_variant;
}

- (double)blendAlpha
{
  return self->_blendAlpha;
}

- (void)setBlendAlpha:(double)a3
{
  self->_blendAlpha = a3;
}

- (CGAffineTransform)inkTransform
{
  long long v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].tx;
  return self;
}

- (void)setInkTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_inkTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_inkTransform.tx = v4;
  *(_OWORD *)&self->_inkTransform.a = v3;
}

- (void)setUseUnclampedWeight:(BOOL)a3
{
  self->_useUnclampedWeight = a3;
}

- (double)targetMultiple
{
  return self->_targetMultiple;
}

- (void)setTargetMultiple:(double)a3
{
  self->_targetMultiple = a3;
}

- (double)baseAlpha
{
  return self->_baseAlpha;
}

- (void)setBaseAlpha:(double)a3
{
  self->_baseAlpha = a3;
}

- (PKInkSmoothingDescriptor)smoothingDescriptor
{
  return self->_smoothingDescriptor;
}

- (void)setSmoothingDescriptor:(id)a3
{
}

- (PKInkFeatheringDescriptor)featheringDescriptor
{
  return self->_featheringDescriptor;
}

- (void)setFeatheringDescriptor:(id)a3
{
}

- (PKInkFeatheringDescriptor)pencilFeatheringDescriptor
{
  return self->_pencilFeatheringDescriptor;
}

- (void)setPencilFeatheringDescriptor:(id)a3
{
}

- (PKInkAnimationDescriptor)animationDescriptor
{
  return self->_animationDescriptor;
}

- (void)setAnimationDescriptor:(id)a3
{
}

- (BOOL)supportsCombiningStrokes
{
  return self->_supportsCombiningStrokes;
}

- (void)setSupportsCombiningStrokes:(BOOL)a3
{
  self->_BOOL supportsCombiningStrokes = a3;
}

- (NSArray)uiWidths
{
  return self->_uiWidths;
}

- (void)setUiWidths:(id)a3
{
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (void)setDefaultWidth:(double)a3
{
  self->_defaultWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiWidths, 0);
  objc_storeStrong((id *)&self->_animationDescriptor, 0);
  objc_storeStrong((id *)&self->_pencilFeatheringDescriptor, 0);
  objc_storeStrong((id *)&self->_featheringDescriptor, 0);
  objc_storeStrong((id *)&self->_smoothingDescriptor, 0);
  objc_storeStrong((id *)&self->_renderingDescriptor, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  p_brushOpacityOutput = &self->_brushOpacityOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_aspectRatioOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_edgeWidthOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_opacityOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_radius2Output;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_radiusOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  value = self->_weightFunction.__ptr_.__value_;
  self->_weightFunction.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(PKFunction *))(*(void *)value + 40))(value);
  }
  objc_storeStrong((id *)&self->_cachedAspectRatioFunctions, 0);
  objc_storeStrong((id *)&self->_cachedEdgeWidthFunctions, 0);
  objc_storeStrong((id *)&self->_cachedOpacityFunctions, 0);
  objc_storeStrong((id *)&self->_cachedRadius2Functions, 0);
  objc_storeStrong((id *)&self->_cachedRadiusFunctions, 0);
}

- (id)description
{
  long long v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(PKInkBehavior *)self identifier];
  unint64_t v7 = [(PKInkBehavior *)self version];
  id v8 = [(PKInkBehavior *)self variant];
  double v9 = [v3 stringWithFormat:@"<%@ %p %@ %lu %@>", v5, self, v6, v7, v8];

  return v9;
}

- (NSArray)inkFunctions
{
  long long v3 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_cachedRadiusFunctions)
  {
    long long v4 = (void *)MEMORY[0x1E4F1CA48];
    double v5 = -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 0);
    double v6 = [v4 arrayWithArray:v5];
    cachedRadiusFunctions = self->_cachedRadiusFunctions;
    self->_cachedRadiusFunctions = v6;
  }
  if (!self->_cachedRadius2Functions)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA48];
    double v9 = -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 4);
    BOOL v10 = [v8 arrayWithArray:v9];
    cachedRadius2Functions = self->_cachedRadius2Functions;
    self->_cachedRadius2Functions = v10;
  }
  if (!self->_cachedOpacityFunctions)
  {
    unint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
    double v13 = -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 1);
    objc_super v14 = [v12 arrayWithArray:v13];
    cachedOpacityFunctions = self->_cachedOpacityFunctions;
    self->_cachedOpacityFunctions = v14;
  }
  if (!self->_cachedEdgeWidthFunctions)
  {
    v16 = (void *)MEMORY[0x1E4F1CA48];
    v17 = -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 2);
    v18 = [v16 arrayWithArray:v17];
    cachedEdgeWidthFunctions = self->_cachedEdgeWidthFunctions;
    self->_cachedEdgeWidthFunctions = v18;
  }
  if (!self->_cachedAspectRatioFunctions)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA48];
    v21 = -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 3);
    v22 = [v20 arrayWithArray:v21];
    cachedAspectRatioFunctions = self->_cachedAspectRatioFunctions;
    self->_cachedAspectRatioFunctions = v22;
  }
  [v3 addObjectsFromArray:self->_cachedRadiusFunctions];
  [v3 addObjectsFromArray:self->_cachedRadius2Functions];
  [v3 addObjectsFromArray:self->_cachedOpacityFunctions];
  [v3 addObjectsFromArray:self->_cachedEdgeWidthFunctions];
  [v3 addObjectsFromArray:self->_cachedAspectRatioFunctions];

  return (NSArray *)v3;
}

- (id)inkFunctionsForProperty:(uint64_t)a1
{
  v56[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v36 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v39 = (uint64_t *)(a1 + *(void *)&aP_3[8 * a2]);
    if (v39[1] != *v39)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      unint64_t v5 = 0x1E4F1C000uLL;
      do
      {
        uint64_t v38 = v4;
        self;
        uint64_t v41 = *v39;
        double v6 = [*(id *)(v5 + 2632) array];
        unint64_t v7 = [*(id *)(v5 + 2632) array];
        id v8 = [*(id *)(v5 + 2632) array];
        id v40 = [*(id *)(v5 + 2632) array];
        uint64_t v9 = v41 + v3;
        if ((*(unsigned int (**)(void))(**(void **)(v41 + v3 + 32) + 16))(*(void *)(v41 + v3 + 32)) == 3)
        {
          uint64_t v10 = *(void *)(v9 + 32);
          id v52 = 0;
          uint64_t v53 = 0;
          __p = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v10 + 56), *(void *)(v10 + 64), (uint64_t)(*(void *)(v10 + 64) - *(void *)(v10 + 56)) >> 3);
          uint64_t v11 = +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&__p);

          if (__p)
          {
            id v52 = __p;
            operator delete(__p);
          }
          uint64_t v49 = 0;
          uint64_t v50 = 0;
          v48 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v48, *(const void **)(v10 + 8), *(void *)(v10 + 16), (uint64_t)(*(void *)(v10 + 16) - *(void *)(v10 + 8)) >> 3);
          uint64_t v12 = +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v48);

          if (v48)
          {
            uint64_t v49 = v48;
            operator delete(v48);
          }
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v45 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v45, *(const void **)(v10 + 32), *(void *)(v10 + 40), (uint64_t)(*(void *)(v10 + 40) - *(void *)(v10 + 32)) >> 3);
          uint64_t v13 = +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v45);

          if (v45)
          {
            uint64_t v46 = v45;
            operator delete(v45);
          }
          v43 = 0;
          uint64_t v44 = 0;
          v42 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v42, *(const void **)(v10 + 104), *(void *)(v10 + 112), (uint64_t)(*(void *)(v10 + 112) - *(void *)(v10 + 104)) >> 3);
          uint64_t v14 = +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v42);

          if (v42)
          {
            v43 = v42;
            operator delete(v42);
          }
          unint64_t v7 = (void *)v12;
          id v8 = (void *)v13;
          id v40 = (void *)v14;
          double v6 = (void *)v11;
        }
        if ((*(unsigned int (**)(void))(**(void **)(v9 + 32) + 16))(*(void *)(v9 + 32)) == 1)
        {
          uint64_t v15 = *(void *)(v9 + 32);
          +[PKInkProperties rangeForInput:*(void *)(v41 + v3 + 24)];
          double v17 = v16;
          v18 = (void *)MEMORY[0x1E4F1CA48];
          v19 = objc_msgSend(NSNumber, "numberWithDouble:");
          v56[0] = v19;
          uint64_t v20 = [NSNumber numberWithDouble:v17];
          v56[1] = v20;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
          v22 = [v18 arrayWithArray:v21];

          uint64_t v23 = (void *)MEMORY[0x1E4F1CA48];
          BOOL v24 = [NSNumber numberWithDouble:*(double *)(v15 + 64)];
          v55[0] = v24;
          v25 = [NSNumber numberWithDouble:*(double *)(v15 + 64)];
          v55[1] = v25;
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
          v27 = [v23 arrayWithArray:v26];

          v28 = (void *)MEMORY[0x1E4F1CA48];
          v29 = [NSNumber numberWithDouble:*(double *)(v15 + 72)];
          v54[0] = v29;
          v30 = [NSNumber numberWithDouble:*(double *)(v15 + 72)];
          v54[1] = v30;
          v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
          id v32 = [v28 arrayWithArray:v31];

          v33 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F200EBE0];
        }
        else
        {
          v27 = v7;
          id v32 = v8;
          v22 = v6;
          v33 = v40;
        }
        v34 = [[PKInkFunction alloc] initWithProperty:a2 input:*(void *)(v41 + v3 + 24) inputMask:*(void *)(v41 + v3) deviceMask:*(void *)(v41 + v3 + 8) inputPoints:v22 minOutputPoints:v27 maxOutputPoints:v32 outputPoints:v27 controlPoints:0 functionType:0];
        [(PKInkFunction *)v34 setControlPoints:v33];

        [v36 addObject:v34];
        uint64_t v4 = v38 + 1;
        v3 += 40;
        unint64_t v5 = 0x1E4F1C000;
      }
      while (v38 + 1 < 0xCCCCCCCCCCCCCCCDLL * ((v39[1] - *v39) >> 3));
    }
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

+ (id)arrayFromVector:(uint64_t)a1
{
  self;
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = [NSNumber numberWithDouble:*(double *)(v4 + 8 * v5)];
      [v3 addObject:v6];

      ++v5;
      uint64_t v4 = *a2;
    }
    while (v5 < (a2[1] - *a2) >> 3);
  }

  return v3;
}

- (void)functionsForProperty:(void *)a1
{
  if (a1)
  {
    switch(a2)
    {
      case 0:
        uint64_t v3 = (void *)a1[4];
        goto LABEL_9;
      case 1:
        uint64_t v3 = (void *)a1[6];
        goto LABEL_9;
      case 2:
        uint64_t v3 = (void *)a1[7];
        goto LABEL_9;
      case 3:
        uint64_t v3 = (void *)a1[8];
        goto LABEL_9;
      case 4:
        uint64_t v3 = (void *)a1[5];
LABEL_9:
        a1 = v3;
        break;
      default:
        a1 = [MEMORY[0x1E4F1CA48] array];
        break;
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)inkFunctionDidChange:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[PKInkBehavior functionsForProperty:](self, [v9 inkProperty]);
  uint64_t v5 = [v9 inkProperty];
  if (self)
  {
    id v6 = v9;
    switch(v5)
    {
      case 0:
        p_radiusOutput = &self->_radiusOutput;
        break;
      case 1:
        p_radiusOutput = &self->_opacityOutput;
        break;
      case 2:
        p_radiusOutput = &self->_edgeWidthOutput;
        break;
      case 3:
        p_radiusOutput = &self->_aspectRatioOutput;
        break;
      case 4:
        p_radiusOutput = &self->_radius2Output;
        break;
      default:
        p_radiusOutput = 0;
        break;
    }
  }
  else
  {
    p_radiusOutput = 0;
    id v6 = v9;
  }
  uint64_t v8 = [v4 indexOfObject:v6];
  [(PKInkBehavior *)(uint64_t)v10 outputFunctionFromInkFunction:v9];
  PKOutputFunction::operator=((uint64_t)p_radiusOutput->__begin_ + 40 * v8, (uint64_t)v10);
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 40))(v11);
  }
}

- (void)outputFunctionFromInkFunction:(void *)a3
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    if ([v5 inkInput] == 2 || objc_msgSend(v6, "inkInput") == 3) {
      *(unsigned char *)(a2 + 8) = 1;
    }
    +[PKInkBehavior outputFunctionFromInkFunction:v6];
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

- (void)removeInkFunction:(id)a3
{
  id v4 = a3;
  id v5 = -[PKInkBehavior functionsForProperty:](self, [v4 inkProperty]);
  uint64_t v6 = [v4 inkProperty];
  if (self)
  {
    switch(v6)
    {
      case 0:
        p_radiusOutput = &self->_radiusOutput;
        break;
      case 1:
        p_radiusOutput = &self->_opacityOutput;
        break;
      case 2:
        p_radiusOutput = &self->_edgeWidthOutput;
        break;
      case 3:
        p_radiusOutput = &self->_aspectRatioOutput;
        break;
      case 4:
        p_radiusOutput = &self->_radius2Output;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    p_radiusOutput = 0;
  }
  uint64_t v8 = [v5 indexOfObject:v4];
  [v5 removeObjectAtIndex:v8];
  end = p_radiusOutput->__end_;
  uint64_t v10 = (uint64_t)p_radiusOutput->__begin_ + 40 * v8;
  uint64_t v11 = (PKOutputFunction *)(v10 + 40);
  if ((PKOutputFunction *)(v10 + 40) != end)
  {
    do
    {
      PKOutputFunction::PKOutputFunction((PKOutputFunction *)v16, (const PKOutputFunction *)(v10 + 40));
      PKOutputFunction::operator=(v10, (uint64_t)v16);
      uint64_t v12 = v17;
      uint64_t v17 = 0;
      if (v12) {
        (*(void (**)(uint64_t))(*(void *)v12 + 40))(v12);
      }
      uint64_t v13 = v10 + 40;
      uint64_t v14 = v10 + 80;
      v10 += 40;
    }
    while ((PKOutputFunction *)v14 != end);
    uint64_t v11 = p_radiusOutput->__end_;
    uint64_t v10 = v13;
  }
  while (v11 != (PKOutputFunction *)v10)
  {
    uint64_t v15 = *((void *)v11 - 1);
    *((void *)v11 - 1) = 0;
    if (v15) {
      (*(void (**)(uint64_t))(*(void *)v15 + 40))(v15);
    }
    uint64_t v11 = (PKOutputFunction *)((char *)v11 - 40);
  }
  p_radiusOutput->__end_ = (PKOutputFunction *)v10;
}

- (void)addNewInkFunction:(id)a3
{
  id v4 = a3;
  [(PKInkBehavior *)(uint64_t)v10 outputFunctionFromInkFunction:v4];
  id v5 = -[PKInkBehavior functionsForProperty:](self, [v4 inkProperty]);
  uint64_t v6 = [v4 inkProperty];
  if (self)
  {
    switch(v6)
    {
      case 0:
        self = (PKInkBehavior *)((char *)self + 80);
        break;
      case 1:
        self = (PKInkBehavior *)((char *)self + 128);
        break;
      case 2:
        self = (PKInkBehavior *)((char *)self + 152);
        break;
      case 3:
        self = (PKInkBehavior *)((char *)self + 176);
        break;
      case 4:
        self = (PKInkBehavior *)((char *)self + 104);
        break;
      default:
        self = 0;
        break;
    }
  }
  [v5 addObject:v4];
  unint64_t v7 = *(void *)&self->_usesAzimuthOrAltitude;
  if (v7 >= *(void *)&self->_rulerOffsetScale)
  {
    uint64_t v8 = std::vector<PKOutputFunction>::__push_back_slow_path<PKOutputFunction>((uint64_t *)self, (const PKOutputFunction *)v10);
  }
  else
  {
    PKOutputFunction::PKOutputFunction(*(PKOutputFunction **)&self->_usesAzimuthOrAltitude, (const PKOutputFunction *)v10);
    uint64_t v8 = v7 + 40;
    *(void *)&self->_usesAzimuthOrAltitude = v7 + 40;
  }
  *(void *)&self->_usesAzimuthOrAltitude = v8;

  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 40))(v9);
  }
}

- (double)brushOpacityForPoint:(uint64_t)a3 context:
{
  double v3 = 0.0;
  if (a1)
  {
    id v5 = a1 + 25;
    if (a1[26] != a1[25])
    {
      unint64_t v7 = objc_msgSend(*(id *)(a3 + 136), "ink", *a2, a2[1], a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15]);
      [v7 weight];
      double v3 = -[PKInkBehavior solve:forPoint:context:weight:](a1, v5, (uint64_t)&v10, a3, v8);
    }
  }
  return v3;
}

- (double)solve:(uint64_t)a3 forPoint:(uint64_t)a4 context:(double)a5 weight:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v10 = *(void *)(a4 + 96);
  double v12 = *(double *)(a4 + 104);
  double v11 = *(double *)(a4 + 112);
  double v13 = *(double *)(a4 + 120);
  if (v10 == 1)
  {
    uint64_t v14 = [*(id *)(a4 + 136) ink];
    if ([v14 _isEraserInk])
    {
      uint64_t v15 = *(void *)(a4 + 144);

      if ((v15 & 2) != 0) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 4;
      }
    }
    else
    {

      uint64_t v16 = 1;
    }
  }
  else if (*(double *)(a3 + 16) >= 0.0)
  {
    uint64_t v16 = 2;
  }
  else
  {
    uint64_t v16 = 4;
  }
  if (*(unsigned char *)(a4 + 88)) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v18 userInterfaceIdiom]) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }

  v22 = *a2;
  v21 = a2[1];
  if (v22 == v21) {
    return 1.0;
  }
  if (v10) {
    double v23 = 1.0;
  }
  else {
    double v23 = v11;
  }
  double v24 = 1.0;
  do
  {
    uint64_t v25 = *v22;
    if ((*v22 & v16) != 0
      && (v22[2] & v17) != 0
      && (v22[1] & v19) != 0
      && ((v25 & 8) == 0 || (*(unsigned char *)(a4 + 144) & 4) == 0)
      && ((v25 & 0x10) == 0 || (*(unsigned char *)(a4 + 144) & 2) == 0))
    {
      switch(v22[3])
      {
        case 1:
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(void *)(a3 + 40);
          break;
        case 2:
          if ([a1 useUnclampedWeight] && (*(unsigned char *)(a4 + 144) & 2) == 0) {
            goto LABEL_42;
          }
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(void *)(a3 + 32);
          break;
        case 4:
          if ([a1 useUnclampedWeight] && (*(unsigned char *)(a4 + 144) & 4) == 0) {
            goto LABEL_42;
          }
          v20.n128_f64[0] = *(double *)(a3 + 16) / v23;
          v26 = (double (***)(__n128, double))v22[4];
          break;
        case 5:
          double v24 = v24 * v12 + 2.0;
          goto LABEL_42;
        case 6:
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(void *)(a3 + 48);
          break;
        case 7:
          v27 = (void *)v22[4];
          v28 = (double *)v27[7];
          double v29 = *v28;
          double v30 = v28[1];
          v31 = (double *)v27[1];
          double v32 = *v31;
          v33 = (double *)v27[4];
          double v34 = *v33;
          double v35 = *(double *)(a3 + 16);
          double v36 = v30 - v29;
          BOOL v37 = v13 > v29 && v35 < v13;
          double v38 = fmax(fmin((v35 - v29) / v36, 1.0), 0.0);
          double v39 = v38 * (v38 * (v38 * -2.0)) + v38 * 3.0 * v38;
          double v40 = v31[1] - v32;
          double v41 = v32 + v39 * v40;
          double v42 = fmax(fmin((v13 - v29) / v36, 1.0), 0.0);
          double v43 = v32 + v42 * v40;
          double v44 = fmax(fmin(v35 / v13, 1.0), 0.0);
          double v45 = v44 * (v44 * (v44 * -2.0)) + v44 * 3.0 * v44;
          double v46 = v32 + v45 * (v43 - v32);
          double v47 = v34 + v42 * (v33[1] - v34);
          if (v37)
          {
            double v48 = v45;
          }
          else
          {
            double v47 = v33[1];
            double v48 = v39;
          }
          if (!v37) {
            double v46 = v41;
          }
          v20.n128_f64[0] = v46 + (v34 + v48 * (v47 - v34) - v46) * ((a5 + 1.0) * 0.5);
          goto LABEL_41;
        default:
          v20.n128_u64[0] = 0;
          v20.n128_f64[0] = (**(double (***)(__n128, double))v22[4])(v20, a5);
          goto LABEL_41;
      }
      v20.n128_f64[0] = (**v26)(v20, a5);
LABEL_41:
      double v24 = v24 * v20.n128_f64[0];
    }
LABEL_42:
    v22 += 5;
  }
  while (v22 != v21);
  return v24;
}

- (double)alphaForStroke:(double *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 ink];
    id v6 = [v5 color];
    double v7 = -[PKInkBehavior alphaForStrokeColor:](a1, (CGColor *)[v6 CGColor]);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)alphaForStrokeColor:(double *)a1
{
  if (a1)
  {
    if (a2)
    {
      id v4 = [a1 renderingDescriptor];
      if ([v4 type] == 1)
      {
        unint64_t v5 = [a1 version];

        if (v5 <= 2) {
          return CGColorGetAlpha(a2) * a1[35];
        }
      }
      else
      {
      }
      id v6 = [a1 renderingDescriptor];
      uint64_t v7 = [v6 blendMode];

      if (!v7) {
        return CGColorGetAlpha(a2) * a1[35];
      }
    }
    return a1[35];
  }
  return 0.0;
}

- (void)radiusForPoint:(uint64_t)a3 context:
{
  if (a1)
  {
    id v6 = [*(id *)(a3 + 136) ink];
    [v6 weight];
    double v8 = v7;

    uint64_t v9 = *(double (****)(void, double, double))(a1 + 72);
    if (v9) {
      double v8 = (**v9)(v9, v8, v8);
    }
    uint64_t v10 = [(id)a1 particleDescriptor];
    double v11 = v10;
    if (v10) {
      [v10 particleSize];
    }

    if (*(void *)(a1 + 88) != *(void *)(a1 + 80))
    {
      long long v12 = a2[5];
      v21[4] = a2[4];
      v21[5] = v12;
      long long v13 = a2[7];
      v21[6] = a2[6];
      v21[7] = v13;
      long long v14 = a2[1];
      v21[0] = *a2;
      v21[1] = v14;
      long long v15 = a2[3];
      v21[2] = a2[2];
      v21[3] = v15;
      -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 80), (uint64_t)v21, a3, v8);
    }
    if (*(void *)(a1 + 184) != *(void *)(a1 + 176))
    {
      long long v16 = a2[5];
      v20[4] = a2[4];
      v20[5] = v16;
      long long v17 = a2[7];
      v20[6] = a2[6];
      v20[7] = v17;
      long long v18 = a2[1];
      v20[0] = *a2;
      v20[1] = v18;
      long long v19 = a2[3];
      v20[2] = a2[2];
      v20[3] = v19;
      -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 176), (uint64_t)v20, a3, v8);
    }
  }
}

- (double)edgeWidthForPoint:(uint64_t)a3 context:
{
  double v3 = 0.0;
  if (a1)
  {
    double v7 = [*(id *)(a3 + 136) ink];
    [v7 weight];
    double v9 = v8;

    uint64_t v10 = *(double (****)(void, double, double))(a1 + 72);
    if (v10) {
      double v9 = (**v10)(v10, v9, v9);
    }
    if (*(void *)(a1 + 160) != *(void *)(a1 + 152))
    {
      long long v11 = a2[5];
      v16[4] = a2[4];
      v16[5] = v11;
      long long v12 = a2[7];
      v16[6] = a2[6];
      v16[7] = v12;
      long long v13 = a2[1];
      v16[0] = *a2;
      v16[1] = v13;
      long long v14 = a2[3];
      v16[2] = a2[2];
      v16[3] = v14;
      return -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 152), (uint64_t)v16, a3, v9);
    }
  }
  return v3;
}

- (uint64_t)outputForPoint:(uint64_t)a3@<X2> context:(uint64_t)a4@<X8>
{
  if (result)
  {
    uint64_t v7 = result;
    *(void *)a4 = *(void *)(a2 + 64);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)a2;
    *(void *)(a4 + 48) = *(void *)(a2 + 16);
    long long v8 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 56) = v8;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a4 + 72) = _Q0;
    *(void *)(a4 + 40) = 0;
    long long v14 = (double *)(a4 + 40);
    *(_OWORD *)(a4 + 24) = _Q0;
    int v15 = *(unsigned __int8 *)(a3 + 88);
    if (*(unsigned char *)(a3 + 88) && *(void *)(a3 + 96) == 1)
    {
      *(void *)&long long v8 = *(void *)(a3 + 56);
      uint64_t v16 = *(void *)(a3 + 64);
      *(void *)(a2 + 24) = v8;
      *(void *)(a2 + 32) = v16;
      *(void *)(a4 + 56) = v8;
      *(void *)(a4 + 64) = v16;
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
    }
    long long v60 = v8;
    long long v18 = objc_msgSend(*(id *)(a3 + 136), "ink", *(double *)(a2 + 40));
    [v18 weight];
    double v20 = v19;

    v21 = *(double (****)(void, double, double))(v7 + 72);
    if (v21) {
      double v20 = (**v21)(v21, v20, v20);
    }
    if (objc_msgSend((id)v7, "useUnclampedWeight", v60))
    {
      v22 = [*(id *)(v7 + 320) lastObject];
      [v22 floatValue];
      double v24 = v20 / v23 * 2.0 + -1.0;

      long long v25 = *(_OWORD *)(a2 + 80);
      v68[4] = *(_OWORD *)(a2 + 64);
      v68[5] = v25;
      long long v26 = *(_OWORD *)(a2 + 112);
      v68[6] = *(_OWORD *)(a2 + 96);
      v68[7] = v26;
      long long v27 = *(_OWORD *)(a2 + 16);
      v68[0] = *(_OWORD *)a2;
      v68[1] = v27;
      long long v28 = *(_OWORD *)(a2 + 48);
      v68[2] = *(_OWORD *)(a2 + 32);
      v68[3] = v28;
      double v29 = v20
          * -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 80), (uint64_t)v68, a3, v24);
      *(double *)(a4 + 24) = v29;
      if (*(void *)(v7 + 112) != *(void *)(v7 + 104))
      {
        long long v30 = *(_OWORD *)(a2 + 80);
        v67[4] = *(_OWORD *)(a2 + 64);
        v67[5] = v30;
        long long v31 = *(_OWORD *)(a2 + 112);
        v67[6] = *(_OWORD *)(a2 + 96);
        v67[7] = v31;
        long long v32 = *(_OWORD *)(a2 + 16);
        v67[0] = *(_OWORD *)a2;
        v67[1] = v32;
        long long v33 = *(_OWORD *)(a2 + 48);
        v67[2] = *(_OWORD *)(a2 + 32);
        v67[3] = v33;
        *(double *)(a4 + 80) = v20
                             * -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 104), (uint64_t)v67, a3, v24);
      }
      double v34 = [(id)v7 renderingDescriptor];
      uint64_t v35 = [v34 type];

      if (!v35)
      {
        double v29 = v29 + 2.0;
        *(double *)(a4 + 24) = v29;
      }
    }
    else
    {
      long long v36 = *(_OWORD *)(a2 + 80);
      v66[4] = *(_OWORD *)(a2 + 64);
      v66[5] = v36;
      long long v37 = *(_OWORD *)(a2 + 112);
      v66[6] = *(_OWORD *)(a2 + 96);
      v66[7] = v37;
      long long v38 = *(_OWORD *)(a2 + 16);
      v66[0] = *(_OWORD *)a2;
      v66[1] = v38;
      long long v39 = *(_OWORD *)(a2 + 48);
      v66[2] = *(_OWORD *)(a2 + 32);
      v66[3] = v39;
      double v29 = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 80), (uint64_t)v66, a3, v20);
      *(double *)(a4 + 24) = v29;
      if (*(void *)(v7 + 112) != *(void *)(v7 + 104))
      {
        long long v40 = *(_OWORD *)(a2 + 80);
        v65[4] = *(_OWORD *)(a2 + 64);
        v65[5] = v40;
        long long v41 = *(_OWORD *)(a2 + 112);
        v65[6] = *(_OWORD *)(a2 + 96);
        v65[7] = v41;
        long long v42 = *(_OWORD *)(a2 + 16);
        v65[0] = *(_OWORD *)a2;
        v65[1] = v42;
        long long v43 = *(_OWORD *)(a2 + 48);
        v65[2] = *(_OWORD *)(a2 + 32);
        v65[3] = v43;
        *(double *)(a4 + 80) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 104), (uint64_t)v65, a3, v20);
      }
    }
    if (*(void *)(v7 + 160) != *(void *)(v7 + 152))
    {
      long long v44 = *(_OWORD *)(a2 + 80);
      v64[4] = *(_OWORD *)(a2 + 64);
      v64[5] = v44;
      long long v45 = *(_OWORD *)(a2 + 112);
      v64[6] = *(_OWORD *)(a2 + 96);
      v64[7] = v45;
      long long v46 = *(_OWORD *)(a2 + 16);
      v64[0] = *(_OWORD *)a2;
      v64[1] = v46;
      long long v47 = *(_OWORD *)(a2 + 48);
      v64[2] = *(_OWORD *)(a2 + 32);
      v64[3] = v47;
      *long long v14 = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 152), (uint64_t)v64, a3, v20);
    }
    if (*(void *)(v7 + 184) != *(void *)(v7 + 176))
    {
      long long v48 = *(_OWORD *)(a2 + 80);
      v63[4] = *(_OWORD *)(a2 + 64);
      v63[5] = v48;
      long long v49 = *(_OWORD *)(a2 + 112);
      v63[6] = *(_OWORD *)(a2 + 96);
      v63[7] = v49;
      long long v50 = *(_OWORD *)(a2 + 16);
      v63[0] = *(_OWORD *)a2;
      v63[1] = v50;
      long long v51 = *(_OWORD *)(a2 + 48);
      v63[2] = *(_OWORD *)(a2 + 32);
      v63[3] = v51;
      *(double *)(a4 + 32) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 176), (uint64_t)v63, a3, v20);
    }
    if (*(void *)(v7 + 136) != *(void *)(v7 + 128))
    {
      long long v52 = *(_OWORD *)(a2 + 80);
      v62[4] = *(_OWORD *)(a2 + 64);
      v62[5] = v52;
      long long v53 = *(_OWORD *)(a2 + 112);
      v62[6] = *(_OWORD *)(a2 + 96);
      v62[7] = v53;
      long long v54 = *(_OWORD *)(a2 + 16);
      v62[0] = *(_OWORD *)a2;
      v62[1] = v54;
      long long v55 = *(_OWORD *)(a2 + 48);
      v62[2] = *(_OWORD *)(a2 + 32);
      v62[3] = v55;
      *(double *)(a4 + 72) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 128), (uint64_t)v62, a3, v20);
    }
    id v56 = [(id)v7 particleDescriptor];
    int v57 = [v56 initialRandomRotation];

    if (v57) {
      *(double *)(a4 + 56) = v61
    }
                           + (double)[*(id *)(a3 + 136) randomSeed]
                           * 6.28318531
                           / 4294967300.0;
    id v58 = (double *)(a3 + 40);
    if (!v15) {
      id v58 = (double *)(a4 + 40);
    }
    *long long v14 = *v58;
    if (v15) {
      double v29 = fmax(*(double *)(a3 + 24), 2.0);
    }
    *(double *)(a4 + 24) = v29;
    if (v17) {
      *(void *)(a4 + 32) = *(void *)(a3 + 32);
    }
    result = os_variant_has_internal_diagnostics();
    if (result)
    {
      result = [(id)objc_opt_class() inkRadiusOverride];
      if (v59 > 0.0) {
        *(double *)(a4 + 24) = v59;
      }
    }
  }
  else
  {
    *(void *)(a4 + 80) = 0;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  return result;
}

- (BOOL)isEraser
{
  uint64_t v2 = [(PKInkBehavior *)self renderingDescriptor];
  BOOL v3 = [v2 blendMode] == 2;

  return v3;
}

- (id)particleTextureName
{
  if (a1)
  {
    id v1 = [a1 particleDescriptor];
    uint64_t v2 = [v1 textureName];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end