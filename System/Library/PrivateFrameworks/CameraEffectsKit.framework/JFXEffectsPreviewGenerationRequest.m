@interface JFXEffectsPreviewGenerationRequest
+ (CGRect)JT_centerRect:(CGRect)result aspectRatio:(double)a4;
+ (PVTransformAnimationInfo)centerAnimationInfoForOutputSize:(SEL)a3 imageRect:(CGSize)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- (BOOL)highQuality;
- (BOOL)scaleAnimationTransformInfoToOutputSize;
- (CGAffineTransform)JFX_scaleToFitSize:(SEL)a3 withTransform:(CGSize)a4;
- (CGAffineTransform)_scaleAndTransformToFitSize:(SEL)a3;
- (CGAffineTransform)sourceTransform;
- (CGAffineTransform)userSourceTransform;
- (CGSize)frameSize;
- (CGSize)outputSize;
- (JFXEffect)generatorEffect;
- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7;
- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6;
- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7;
- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6;
- (NSArray)effectStack;
- (NSArray)pickerPreviewEffectList;
- (NSDictionary)customRenderingProperties;
- (PVImageBuffer)image;
- (PVTransformAnimationInfo)animationTransformInfo;
- (id)generatorJobWithGraphBuilder:(id)a3;
- (id)placeholderGeneratorBackground;
- (id)sourceIGNodeUsingGraphBuilder:(id)a3 includeAnimoji:(BOOL)a4;
- (int)priority;
- (unsigned)childCode;
- (unsigned)parentCode;
- (void)centerAnimationInfo;
- (void)setAnimationTransformInfo:(PVTransformAnimationInfo *)a3;
- (void)setChildCode:(unsigned int)a3;
- (void)setCustomRenderingProperties:(id)a3;
- (void)setHighQuality:(BOOL)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPickerPreviewEffectList:(id)a3;
- (void)setPriority:(int)a3;
- (void)setScaleAnimationTransformInfoToOutputSize:(BOOL)a3;
- (void)setTransformAnimationInfo:(PVTransformAnimationInfo *)a3 scaleToOutput:(BOOL)a4;
- (void)setUserSourceTransform:(CGAffineTransform *)a3;
@end

@implementation JFXEffectsPreviewGenerationRequest

+ (PVTransformAnimationInfo)centerAnimationInfoForOutputSize:(SEL)a3 imageRect:(CGSize)a4
{
  objc_msgSend((id)objc_opt_class(), "JT_centerRect:aspectRatio:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a4.width / a4.height);
  double v7 = v6;
  double v9 = v8;
  *(_OWORD *)&retstr->time.value = 0u;
  *(_OWORD *)&retstr->time.epoch = 0u;
  *(_OWORD *)&retstr->translation.y = 0u;
  retstr->rotation = 0.0;
  result = (PVTransformAnimationInfo *)PVTransformAnimationInfoIdentity();
  retstr->translation.x = -v7;
  retstr->translation.y = -v9;
  return result;
}

- (void)centerAnimationInfo
{
  v3 = [(JFXEffectsPreviewGenerationRequest *)self image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [(JFXEffectsPreviewGenerationRequest *)self userSourceTransform];
  CGSizeApplyAffineTransformWithPositiveResult(v15, v5, v7);

  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  double v8 = objc_opt_class();
  [(JFXEffectsPreviewGenerationRequest *)self outputSize];
  if (v8)
  {
    objc_msgSend(v8, "centerAnimationInfoForOutputSize:imageRect:");
  }
  else
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }
  v9[0] = v11;
  v9[1] = v12;
  v9[2] = v13;
  uint64_t v10 = v14;
  [(JFXEffectsPreviewGenerationRequest *)self setAnimationTransformInfo:v9];
}

+ (CGRect)JT_centerRect:(CGRect)result aspectRatio:(double)a4
{
  double height = result.size.height;
  if (result.size.width / result.size.height >= a4)
  {
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v7 = result.size.height * a4;
    double v5 = (result.size.width - v7) * 0.5;
    result.size.width = v7;
  }
  else
  {
    double v5 = *MEMORY[0x263F001A8];
    result.size.double height = result.size.width / a4;
    double v6 = (height - result.size.width / a4) * 0.5;
  }
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v10 = a5.height;
  CGFloat v11 = a5.width;
  id v15 = a3;
  id v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)JFXEffectsPreviewGenerationRequest;
  v17 = [(JFXEffectsPreviewGenerationRequest *)&v30 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_image, a3);
    generatorEffect = v18->_generatorEffect;
    v18->_generatorEffect = 0;

    v18->_outputSize.CGFloat width = v11;
    v18->_outputSize.CGFloat height = v10;
    v18->_frameSize.CGFloat width = width;
    v18->_frameSize.CGFloat height = height;
    objc_storeStrong((id *)&v18->_effectStack, a4);
    pickerPreviewEffectList = v18->_pickerPreviewEffectList;
    v18->_pickerPreviewEffectList = 0;

    long long v21 = *(_OWORD *)&a7->var0;
    v18->_renderTime.epoch = a7->var3;
    *(_OWORD *)&v18->_renderTime.value = v21;
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v18->_animationTransformInfo.time.value = v26;
    *(_OWORD *)&v18->_animationTransformInfo.time.epoch = v27;
    *(_OWORD *)&v18->_animationTransformInfo.translation.y = v28;
    v18->_animationTransformInfo.rotation = v29;
    *(_WORD *)&v18->_highQuality = 256;
    v18->_childCode = 0;
    *(void *)&v18->_priority = 0xFFFFFFFF00000001;
    customRenderingProperties = v18->_customRenderingProperties;
    v18->_customRenderingProperties = 0;

    uint64_t v23 = MEMORY[0x263F000D0];
    long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v18->_userSourceTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v18->_userSourceTransform.c = v24;
    *(_OWORD *)&v18->_userSourceTransform.tx = *(_OWORD *)(v23 + 32);
  }

  return v18;
}

- (JFXEffectsPreviewGenerationRequest)initWithInput:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a6;
  return -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:frameSize:renderTime:](self, "initWithInput:effectStack:outputSize:frameSize:renderTime:", a3, a4, &v7, a5.width, a5.height, a5.width, a5.height);
}

- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 frameSize:(CGSize)a6 renderTime:(id *)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v10 = a5.height;
  CGFloat v11 = a5.width;
  id v15 = a3;
  id v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)JFXEffectsPreviewGenerationRequest;
  v17 = [(JFXEffectsPreviewGenerationRequest *)&v30 init];
  v18 = v17;
  if (v17)
  {
    image = v17->_image;
    v17->_image = 0;

    objc_storeStrong((id *)&v18->_generatorEffect, a3);
    v18->_outputSize.CGFloat width = v11;
    v18->_outputSize.CGFloat height = v10;
    v18->_frameSize.CGFloat width = width;
    v18->_frameSize.CGFloat height = height;
    objc_storeStrong((id *)&v18->_effectStack, a4);
    pickerPreviewEffectList = v18->_pickerPreviewEffectList;
    v18->_pickerPreviewEffectList = 0;

    long long v21 = *(_OWORD *)&a7->var0;
    v18->_renderTime.epoch = a7->var3;
    *(_OWORD *)&v18->_renderTime.value = v21;
    PVTransformAnimationInfoIdentity();
    *(_OWORD *)&v18->_animationTransformInfo.time.value = v26;
    *(_OWORD *)&v18->_animationTransformInfo.time.epoch = v27;
    *(_OWORD *)&v18->_animationTransformInfo.translation.y = v28;
    v18->_animationTransformInfo.rotation = v29;
    *(_WORD *)&v18->_highQuality = 256;
    v18->_childCode = 0;
    *(void *)&v18->_priority = 0xFFFFFFFF00000001;
    customRenderingProperties = v18->_customRenderingProperties;
    v18->_customRenderingProperties = 0;

    uint64_t v23 = MEMORY[0x263F000D0];
    long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v18->_userSourceTransform.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v18->_userSourceTransform.c = v24;
    *(_OWORD *)&v18->_userSourceTransform.tx = *(_OWORD *)(v23 + 32);
  }

  return v18;
}

- (JFXEffectsPreviewGenerationRequest)initWithInputGenerator:(id)a3 effectStack:(id)a4 outputSize:(CGSize)a5 renderTime:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a6;
  return -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:frameSize:renderTime:](self, "initWithInputGenerator:effectStack:outputSize:frameSize:renderTime:", a3, a4, &v7, a5.width, a5.height, a5.width, a5.height);
}

- (id)placeholderGeneratorBackground
{
  if (placeholderGeneratorBackground_onceToken != -1) {
    dispatch_once(&placeholderGeneratorBackground_onceToken, &__block_literal_global_67);
  }
  v2 = (void *)placeholderGeneratorBackground_sTempGeneratorInputImage;
  return v2;
}

void __68__JFXEffectsPreviewGenerationRequest_placeholderGeneratorBackground__block_invoke()
{
  v6.CGFloat width = 1.0;
  v6.CGFloat height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v1 = [MEMORY[0x263F1C550] clearColor];
  [v1 setFill];

  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.CGFloat width = 1.0;
  v7.size.CGFloat height = 1.0;
  CGContextFillRect(CurrentContext, v7);
  UIGraphicsGetImageFromCurrentImageContext();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  uint64_t v2 = [MEMORY[0x263F61268] imageWithUIImage:v4];
  v3 = (void *)placeholderGeneratorBackground_sTempGeneratorInputImage;
  placeholderGeneratorBackground_sTempGeneratorInputImage = v2;
}

- (CGAffineTransform)sourceTransform
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  CGRect v7 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];

  if (v7)
  {
    double v8 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];
    double v9 = [v8 renderEffect];
    CGFloat v10 = [v9 effectType];
    char v11 = [v10 isEqual:*MEMORY[0x263F61630]];

    if ((v11 & 1) == 0)
    {
      long long v13 = [(JFXEffectsPreviewGenerationRequest *)self placeholderGeneratorBackground];
      [v13 size];
      double v15 = v14;
      double v17 = v16;
      [(JFXEffectsPreviewGenerationRequest *)self userSourceTransform];
      -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", v27, v15, v17);
      long long v18 = v29;
      *(_OWORD *)&retstr->a = v28;
      *(_OWORD *)&retstr->c = v18;
      *(_OWORD *)&retstr->tx = v30;
    }
  }
  else
  {
    v19 = [(JFXEffectsPreviewGenerationRequest *)self image];

    if (v19)
    {
      v20 = [(JFXEffectsPreviewGenerationRequest *)self image];
      [v20 size];
      double v22 = v21;
      double v24 = v23;

      [(JFXEffectsPreviewGenerationRequest *)self userSourceTransform];
      result = -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", &v26, v22, v24);
      long long v25 = v29;
      *(_OWORD *)&retstr->a = v28;
      *(_OWORD *)&retstr->c = v25;
      *(_OWORD *)&retstr->tx = v30;
    }
  }
  return result;
}

- (id)sourceIGNodeUsingGraphBuilder:(id)a3 includeAnimoji:(BOOL)a4
{
  BOOL v4 = a4;
  v63[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CGRect v7 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];

  if (v7)
  {
    double v8 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];
    double v9 = [v8 renderEffect];
    CGFloat v10 = [v9 effectType];
    char v11 = [v10 isEqual:*MEMORY[0x263F61630]];

    if (v11)
    {
      long long v12 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];
      long long v58 = kDefaultEffectPreviewAnimationRange;
      long long v59 = xmmword_234D62718;
      long long v60 = xmmword_234D62728;
      long long v13 = [v6 sourceNodeForGeneratorEffect:v12 effectRange:&v58];
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v58 = 0u;
      [(JFXEffectsPreviewGenerationRequest *)self sourceTransform];
      v45 = [(JFXEffectsPreviewGenerationRequest *)self placeholderGeneratorBackground];
      long long v55 = v58;
      long long v56 = v59;
      long long v57 = v60;
      v46 = [v6 sourceNodeForImageBuffer:v45 sourceTransform:&v55];

      v47 = [(JFXEffectsPreviewGenerationRequest *)self generatorEffect];
      v63[0] = v47;
      v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:1];
      long long v55 = kDefaultEffectPreviewAnimationRange;
      long long v56 = xmmword_234D62718;
      long long v57 = xmmword_234D62728;
      long long v13 = [v6 applyEffectStack:v48 presentationRange:&v55 toInput:v46];
    }
  }
  else
  {
    double v14 = [(JFXEffectsPreviewGenerationRequest *)self image];

    if (v14)
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v58 = 0uLL;
      [(JFXEffectsPreviewGenerationRequest *)self sourceTransform];
      id v15 = objc_alloc(MEMORY[0x263F61280]);
      double v16 = [(JFXEffectsPreviewGenerationRequest *)self image];
      long long v55 = v58;
      long long v56 = v59;
      long long v57 = v60;
      double v17 = (void *)[v15 initWithPVImageBuffer:v16 transform:&v55];

      long long v18 = [(JFXEffectsPreviewGenerationRequest *)self customRenderingProperties];
      v19 = [v18 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];

      if (!v4
        || ([v19 metadata],
            v20 = objc_claimAutoreleasedReturnValue(),
            BOOL v21 = v20 == 0,
            v20,
            v21))
      {
        long long v13 = v17;
      }
      else
      {
        *(void *)&long long v55 = 0;
        *((void *)&v55 + 1) = &v55;
        *(void *)&long long v56 = 0x3032000000;
        *((void *)&v56 + 1) = __Block_byref_object_copy__25;
        *(void *)&long long v57 = __Block_byref_object_dispose__25;
        *((void *)&v57 + 1) = 0;
        double v22 = [(JFXEffectsPreviewGenerationRequest *)self effectStack];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __83__JFXEffectsPreviewGenerationRequest_sourceIGNodeUsingGraphBuilder_includeAnimoji___block_invoke;
        v54[3] = &unk_264C0D380;
        v54[4] = &v55;
        [v22 enumerateObjectsUsingBlock:v54];

        if (*(void *)(*((void *)&v55 + 1) + 40))
        {
          double v23 = [v19 metadata];
          double v24 = (void *)[v23 mutableCopy];

          [v24 setObject:*(void *)(*((void *)&v55 + 1) + 40) forKeyedSubscript:@"JFXAnimojiRendererMetadata_Effect"];
          v51 = [v24 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_RenderSize"];
          [v51 CGSizeValue];
          double v27 = v26;
          double v28 = v25;
          if (v26 == *MEMORY[0x263F001B0] && v25 == *(double *)(MEMORY[0x263F001B0] + 8))
          {
            long long v29 = [(JFXEffectsPreviewGenerationRequest *)self image];
            [v29 size];
            double v27 = v30;
            double v28 = v31;
          }
          v32 = (void *)MEMORY[0x263F61298];
          v33 = [v19 renderingDelegate];
          v34 = objc_msgSend(v32, "newSourceCompositeNodeWithDelegate:inputs:userContext:outputSize:outputFormat:", v33, 0, v24, 1111970369, v27, v28);

          v35 = [MEMORY[0x263F61230] sRGBColorSpace];
          [v34 setColorSpace:v35];

          long long v36 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          *(_OWORD *)v53 = *MEMORY[0x263F000D0];
          *(_OWORD *)&v53[2] = v36;
          *(_OWORD *)&v53[4] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", v53, v27, v28);
          v52[0] = *(_OWORD *)&v53[7];
          v52[1] = *(_OWORD *)&v53[9];
          v52[2] = *(_OWORD *)&v53[11];
          [v34 setTransform:v52];
          v37 = (void *)[MEMORY[0x263F61248] newEffectWithID:*MEMORY[0x263F61330]];
          id v38 = objc_alloc(MEMORY[0x263F612E8]);
          LODWORD(v39) = 1.0;
          v40 = (void *)[v38 initWithOpacity:0 mode:v39];
          id v41 = objc_alloc(MEMORY[0x263F612E8]);
          LODWORD(v42) = 1.0;
          v43 = (void *)[v41 initWithOpacity:0 mode:v42];
          v61[0] = &unk_26E801E00;
          v61[1] = &unk_26E801E18;
          v62[0] = v40;
          v62[1] = v43;
          v44 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
          [v37 setInspectableProperty:v44 forKey:*MEMORY[0x263F616D0]];
          long long v13 = objc_opt_new();
          [v13 setEffect:v37];
          [v13 setInputNode:v17 forInputID:0];
          [v13 setInputNode:v34 forInputID:1];
        }
        else
        {
          long long v13 = v17;
        }
        _Block_object_dispose(&v55, 8);
      }
    }
    else
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v58 = 0uLL;
      [(JFXEffectsPreviewGenerationRequest *)self sourceTransform];
      v49 = [(JFXEffectsPreviewGenerationRequest *)self placeholderGeneratorBackground];
      long long v55 = v58;
      long long v56 = v59;
      long long v57 = v60;
      long long v13 = [v6 sourceNodeForImageBuffer:v49 sourceTransform:&v55];
    }
  }

  return v13;
}

void __83__JFXEffectsPreviewGenerationRequest_sourceIGNodeUsingGraphBuilder_includeAnimoji___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 type] == 7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)generatorJobWithGraphBuilder:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v30 = a3;
  double v27 = -[JFXEffectsPreviewGenerationRequest sourceIGNodeUsingGraphBuilder:includeAnimoji:](self, "sourceIGNodeUsingGraphBuilder:includeAnimoji:");
  v3 = [(JFXEffectsPreviewGenerationRequest *)self customRenderingProperties];
  double v25 = [v3 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];

  long long v29 = [v30 applyEffectStack:self->_effectStack toInput:v27];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(JFXEffectsPreviewGenerationRequest *)self pickerPreviewEffectList];
  if (v6
    && ([(JFXEffectsPreviewGenerationRequest *)self pickerPreviewEffectList],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v9 = [(JFXEffectsPreviewGenerationRequest *)self pickerPreviewEffectList];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v42 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v13 = v42;
          double v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v42, 1, v25);
          id v15 = [v30 applyEffectStack:v14 toInput:v29];

          [v4 addObject:v15];
          [v5 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }
  }
  else if (v29)
  {
    double v16 = [(JFXEffectsPreviewGenerationRequest *)self effectStack];
    if (v16
      && ([(JFXEffectsPreviewGenerationRequest *)self effectStack],
          double v17 = objc_claimAutoreleasedReturnValue(),
          uint64_t v18 = [v17 count],
          v17,
          v16,
          v18))
    {
      v19 = [(JFXEffectsPreviewGenerationRequest *)self effectStack];
      uint64_t v20 = [v19 lastObject];
    }
    else
    {
      v19 = +[JFXEffectFactory sharedInstance];
      uint64_t v20 = [v19 createEffectForType:1 fromID:*MEMORY[0x263F61618] withProperties:0];
    }
    BOOL v21 = (void *)v20;

    [v4 addObject:v29];
    [v5 addObject:v21];
  }
  if (objc_msgSend(v25, "animojiTapPoint", v25))
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__25;
    long long v36 = __Block_byref_object_dispose__25;
    id v37 = 0;
    double v22 = [(JFXEffectsPreviewGenerationRequest *)self effectStack];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __67__JFXEffectsPreviewGenerationRequest_generatorJobWithGraphBuilder___block_invoke;
    v31[3] = &unk_264C0D380;
    v31[4] = &v32;
    [v22 enumerateObjectsUsingBlock:v31];

    if (v33[5])
    {
      [v4 addObject:v27];
      [v5 addObject:v33[5]];
    }
    _Block_object_dispose(&v32, 8);
  }
  double v23 = [[JFXEffectsPreviewGeneratorJob alloc] initWithRenderOutputs:v4 callbackKeys:v5];

  return v23;
}

void __67__JFXEffectsPreviewGenerationRequest_generatorJobWithGraphBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 type] == 7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setTransformAnimationInfo:(PVTransformAnimationInfo *)a3 scaleToOutput:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = *(_OWORD *)&a3->time.epoch;
  v7[0] = *(_OWORD *)&a3->time.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->translation.y;
  double rotation = a3->rotation;
  [(JFXEffectsPreviewGenerationRequest *)self setAnimationTransformInfo:v7];
  [(JFXEffectsPreviewGenerationRequest *)self setScaleAnimationTransformInfoToOutputSize:v4];
}

- (CGAffineTransform)_scaleAndTransformToFitSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  [(JFXEffectsPreviewGenerationRequest *)self userSourceTransform];
  return -[JFXEffectsPreviewGenerationRequest JFX_scaleToFitSize:withTransform:](self, "JFX_scaleToFitSize:withTransform:", &v8, width, height);
}

- (CGAffineTransform)JFX_scaleToFitSize:(SEL)a3 withTransform:(CGSize)a4
{
  uint64_t v8 = MEMORY[0x263F000D0];
  long long v23 = *MEMORY[0x263F000D0];
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v24;
  long long v22 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tx = v22;
  double v9 = a4.height * a5->c + a5->a * a4.width;
  double v10 = a4.height * a5->d + a5->b * a4.width;
  [(JFXEffectsPreviewGenerationRequest *)self outputSize];
  double v12 = v11 / fabs(v10);
  [(JFXEffectsPreviewGenerationRequest *)self outputSize];
  double v14 = v13 / fabs(v9);
  if (v12 >= v14) {
    double v14 = v12;
  }
  float v15 = v14;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, v15, v15);
  *(_OWORD *)&t1.a = v23;
  *(_OWORD *)&t1.c = v24;
  *(_OWORD *)&t1.tx = v22;
  long long v16 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  [(JFXEffectsPreviewGenerationRequest *)self animationTransformInfo];
  CGAffineTransformFromPVAnimInfo();
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v17;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &t2, &v26);
  long long v18 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  result = (CGAffineTransform *)[(JFXEffectsPreviewGenerationRequest *)self scaleAnimationTransformInfoToOutputSize];
  if (result)
  {
    long long v20 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t2.c = v20;
    *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransform v25 = v29;
    result = CGAffineTransformConcat(&t1, &t2, &v25);
    long long v21 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v21;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (PVImageBuffer)image
{
  return self->_image;
}

- (JFXEffect)generatorEffect
{
  return self->_generatorEffect;
}

- (NSArray)effectStack
{
  return self->_effectStack;
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)frameSize
{
  double width = self->_frameSize.width;
  double height = self->_frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (CGAffineTransform)userSourceTransform
{
  long long v3 = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].b;
  return self;
}

- (void)setUserSourceTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_userSourceTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_userSourceTransform.c = v4;
  *(_OWORD *)&self->_userSourceTransform.a = v3;
}

- (NSDictionary)customRenderingProperties
{
  return self->_customRenderingProperties;
}

- (void)setCustomRenderingProperties:(id)a3
{
}

- (NSArray)pickerPreviewEffectList
{
  return self->_pickerPreviewEffectList;
}

- (void)setPickerPreviewEffectList:(id)a3
{
}

- (PVTransformAnimationInfo)animationTransformInfo
{
  long long v3 = *(_OWORD *)&self[3].time.epoch;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[3].time.value;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[3].translation.y;
  retstr->double rotation = self[3].rotation;
  return self;
}

- (void)setAnimationTransformInfo:(PVTransformAnimationInfo *)a3
{
  long long v3 = *(_OWORD *)&a3->time.value;
  long long v4 = *(_OWORD *)&a3->time.epoch;
  long long v5 = *(_OWORD *)&a3->translation.y;
  self->_animationTransformInfo.double rotation = a3->rotation;
  *(_OWORD *)&self->_animationTransformInfo.translation.y = v5;
  *(_OWORD *)&self->_animationTransformInfo.time.epoch = v4;
  *(_OWORD *)&self->_animationTransformInfo.time.value = v3;
}

- (BOOL)highQuality
{
  return self->_highQuality;
}

- (void)setHighQuality:(BOOL)a3
{
  self->_highQuality = a3;
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (unsigned)childCode
{
  return self->_childCode;
}

- (void)setChildCode:(unsigned int)a3
{
  self->_childCode = a3;
}

- (BOOL)scaleAnimationTransformInfoToOutputSize
{
  return self->_scaleAnimationTransformInfoToOutputSize;
}

- (void)setScaleAnimationTransformInfoToOutputSize:(BOOL)a3
{
  self->_scaleAnimationTransformInfoToOutputSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerPreviewEffectList, 0);
  objc_storeStrong((id *)&self->_customRenderingProperties, 0);
  objc_storeStrong((id *)&self->_effectStack, 0);
  objc_storeStrong((id *)&self->_generatorEffect, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end