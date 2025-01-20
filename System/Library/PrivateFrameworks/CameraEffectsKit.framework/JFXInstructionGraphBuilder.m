@interface JFXInstructionGraphBuilder
+ (double)JFX_scaleForMediaSize:(CGSize)a3 mediaContentMode:(int)a4 clipAspectRatio:(double)a5 outputSize:(CGSize)a6 outputContentMode:(int)a7;
+ (id)JFX_maskNode:(id)a3 maskRect:(CGRect)a4 basisSize:(CGSize)a5;
+ (id)JFX_transformNode:(id)a3 scale:(double)a4;
- (CGAffineTransform)JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:(SEL)a3 mediaScale:(CGSize)a4;
- (CGSize)frameSize;
- (CGSize)outputSize;
- (JFXInstructionGraphBuilder)initWithOutputSize:(CGSize)a3 frameSize:(CGSize)a4 outputColorSpace:(id)a5;
- (PVColorSpace)outputColorSpace;
- (id)JFX_applyCustomRenderingPropertiesToInputNode:(id)a3 customRendererProperties:(id)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 mediaScale:(double)a7;
- (id)JFX_mediaTransformAnimationForPlayableElement:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4;
- (id)_buildTestXFormAnimation:(id *)a3 baseTransform:(CGAffineTransform *)a4 clipNaturalSize:(CGSize)a5;
- (id)_sourceNodeForStillMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 presentationRange:(id *)a7;
- (id)_sourceNodeForVideoMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7;
- (id)applyEffectStack:(id)a3 presentationRange:(id *)a4 toInput:(id)a5;
- (id)applyEffectStack:(id)a3 toInput:(id)a4;
- (id)blendNodeForClipSourceNodes:(id)a3;
- (id)instructionGraphForPlayableElement:(id)a3 presentationTimeRange:(id *)a4 sourceTransform:(CGAffineTransform *)a5 compositionTrackID:(int)a6 liveTransform:(PVTransformAnimationInfo *)a7 excludingEffectType:(int)a8 customRendererProperties:(id)a9;
- (id)sourceNodeForGeneratorEffect:(id)a3 effectRange:(id *)a4;
- (id)sourceNodeForImageBuffer:(id)a3 sourceTransform:(CGAffineTransform *)a4;
- (id)sourceNodeForMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7 presentationTimeRange:(id *)a8 mediaScale:(double)a9 playableAspectRatio:(int64_t)a10 playableAspectRatioPreservationMode:(int64_t)a11;
- (int)renderingIntent;
- (void)setOutputColorSpace:(id)a3;
- (void)setRenderingIntent:(int)a3;
@end

@implementation JFXInstructionGraphBuilder

- (JFXInstructionGraphBuilder)initWithOutputSize:(CGSize)a3 frameSize:(CGSize)a4 outputColorSpace:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v8 = a3.height;
  CGFloat v9 = a3.width;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)JFXInstructionGraphBuilder;
  v12 = [(JFXInstructionGraphBuilder *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_renderingIntent = 0;
    v12->_outputSize.CGFloat width = v9;
    v12->_outputSize.CGFloat height = v8;
    v12->_frameSize.CGFloat width = width;
    v12->_frameSize.CGFloat height = height;
    objc_storeStrong((id *)&v12->_outputColorSpace, a5);
  }

  return v13;
}

- (id)sourceNodeForMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7 presentationTimeRange:(id *)a8 mediaScale:(double)a9 playableAspectRatio:(int64_t)a10 playableAspectRatioPreservationMode:(int64_t)a11
{
  uint64_t v12 = *(void *)&a7;
  uint64_t v14 = *(void *)&a5;
  id v17 = a3;
  id v18 = a6;
  uint64_t v19 = [v17 mediaType];
  if (v19 == 2)
  {
    long long v22 = *(_OWORD *)&a4->c;
    long long v27 = *(_OWORD *)&a4->a;
    long long v28 = v22;
    long long v29 = *(_OWORD *)&a4->tx;
    long long v23 = *(_OWORD *)&a8->var0.var3;
    v26[0] = *(_OWORD *)&a8->var0.var0;
    v26[1] = v23;
    v26[2] = *(_OWORD *)&a8->var1.var1;
    uint64_t v21 = [(JFXInstructionGraphBuilder *)self _sourceNodeForStillMediaItem:v17 sourceTransform:&v27 transformAnimation:v18 transformAnimationContentMode:v12 presentationRange:v26];
    goto LABEL_5;
  }
  if (v19 == 1)
  {
    long long v20 = *(_OWORD *)&a4->c;
    long long v27 = *(_OWORD *)&a4->a;
    long long v28 = v20;
    long long v29 = *(_OWORD *)&a4->tx;
    uint64_t v21 = [(JFXInstructionGraphBuilder *)self _sourceNodeForVideoMediaItem:v17 sourceTransform:&v27 compositionTrackID:v14 transformAnimation:v18 transformAnimationContentMode:v12];
LABEL_5:
    v24 = (void *)v21;
    goto LABEL_7;
  }
  v24 = 0;
LABEL_7:

  return v24;
}

- (id)sourceNodeForImageBuffer:(id)a3 sourceTransform:(CGAffineTransform *)a4
{
  v5 = (objc_class *)MEMORY[0x263F61280];
  id v6 = a3;
  id v7 = [v5 alloc];
  long long v8 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a4->tx;
  CGFloat v9 = (void *)[v7 initWithPVImageBuffer:v6 transform:v11];

  return v9;
}

- (id)sourceNodeForGeneratorEffect:(id)a3 effectRange:(id *)a4
{
  v5 = [a3 renderEffect];
  long long v6 = *(_OWORD *)&a4->var0.var3;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  [v5 setEffectRange:v9];
  id v7 = (void *)[MEMORY[0x263F61278] newGeneratorNode:v5];

  return v7;
}

- (id)applyEffectStack:(id)a3 presentationRange:(id *)a4 toInput:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    v10 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v14 isNone] & 1) == 0)
        {
          objc_super v15 = [v14 renderEffect];

          if (v15)
          {
            v16 = [v14 renderEffect];
            if ((a4->var0.var2 & 1) != 0
              && (a4->var1.var2 & 1) != 0
              && !a4->var1.var3
              && (a4->var1.var0 & 0x8000000000000000) == 0)
            {
              if (v14)
              {
                long long v17 = *(_OWORD *)&a4->var0.var3;
                v21[0] = *(_OWORD *)&a4->var0.var0;
                v21[1] = v17;
                v21[2] = *(_OWORD *)&a4->var1.var1;
                [v14 rangeForPresentationRange:v21];
              }
              else
              {
                long long v23 = 0u;
                long long v24 = 0u;
                long long v22 = 0u;
              }
              v20[0] = v22;
              v20[1] = v23;
              v20[2] = v24;
              [v16 setEffectRange:v20];
            }
            uint64_t v18 = [MEMORY[0x263F61270] newEffectNodeToFilterInput:v10 effect:v16];

            v10 = (void *)v18;
          }
        }
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v10;
}

- (id)applyEffectStack:(id)a3 toInput:(id)a4
{
  long long v4 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
  v7[0] = *MEMORY[0x263F010C0];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
  v5 = [(JFXInstructionGraphBuilder *)self applyEffectStack:a3 presentationRange:v7 toInput:a4];
  return v5;
}

- (id)blendNodeForClipSourceNodes:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v4 = objc_opt_new();
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        [v4 setInputNode:*(void *)(*((void *)&v18 + 1) + 8 * i) forInputID:v8 + i];
        id v11 = objc_alloc(MEMORY[0x263F612E8]);
        LODWORD(v12) = 1.0;
        v13 = (void *)[v11 initWithOpacity:0 mode:v12];
        uint64_t v14 = [NSNumber numberWithInt:v8 + i];
        [v5 setObject:v13 forKey:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = (v8 + i);
    }
    while (v7);
  }

  objc_super v15 = (void *)[MEMORY[0x263F61248] newEffectWithID:*MEMORY[0x263F61330]];
  [v15 setInspectableProperty:v5 forKey:*MEMORY[0x263F616D0]];
  [v4 setEffect:v15];

  return v4;
}

- (id)JFX_mediaTransformAnimationForPlayableElement:(id)a3 liveTransform:(PVTransformAnimationInfo *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 transformAnimation];
  uint64_t v7 = [v6 animationData];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    if (!a4)
    {
      uint64_t v9 = [v5 transformAnimation];
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v11 = [v10 BOOLForKey:@"noPanZoomAnchoring"];

  if (v11)
  {
    double v12 = 0;
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_7:
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F61300]) initWithLiveTransform:a4];
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  PVTransformAnimationInfoIdentity();
  memset(v14, 0, sizeof(v14));
  uint64_t v15 = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F61300]) initWithAnimationInfo:v14];
LABEL_8:
  double v12 = v9;
  if (v9) {
    objc_msgSend(v9, "setAspectRatio:", multiplierForAspectRatio(objc_msgSend(v5, "playableAspectRatio")));
  }
LABEL_10:

  return v12;
}

- (id)instructionGraphForPlayableElement:(id)a3 presentationTimeRange:(id *)a4 sourceTransform:(CGAffineTransform *)a5 compositionTrackID:(int)a6 liveTransform:(PVTransformAnimationInfo *)a7 excludingEffectType:(int)a8 customRendererProperties:(id)a9
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v66 = a9;
  [(JFXInstructionGraphBuilder *)self outputSize];
  double v16 = v15;
  double v18 = v17;
  [v14 playableMediaSizeWithTransform];
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v14 playableMediaContentMode];
  double v24 = multiplierForAspectRatio([v14 playableAspectRatio]);
  double v25 = 1.0;
  int v63 = PVViewContentModeFromAspectRatioPreservationMode([v14 playableAspectRatioPreservationMode]);
  if (!v63 || v24 > -0.0000001 && v24 < 0.0000001) {
    goto LABEL_16;
  }
  double v26 = sizeForAspectRatio([v14 playableAspectRatio]);
  if ((int)v18)
  {
    int v28 = (int)v18;
    int v29 = (int)v16;
    do
    {
      int v30 = v28;
      int v28 = v29 % v28;
      int v29 = v30;
    }
    while (v28);
  }
  else
  {
    int v30 = (int)v16;
  }
  if ((int)v27)
  {
    int v31 = (int)v27;
    int v32 = (int)v26;
    do
    {
      int v33 = v31;
      int v31 = v32 % v31;
      int v32 = v33;
    }
    while (v31);
  }
  else
  {
    int v33 = (int)v26;
  }
  if ((int)v16 / v30 == (int)v26 / v33 && (int)v18 / v30 == (int)v27 / v33)
  {
LABEL_16:
    int v64 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "JFX_scaleForMediaSize:mediaContentMode:clipAspectRatio:outputSize:outputContentMode:", v23, 14, v20, v22, v24, v16, v18);
    double v25 = v34;
    int v64 = 1;
  }
  v35 = [(JFXInstructionGraphBuilder *)self JFX_mediaTransformAnimationForPlayableElement:v14 liveTransform:a7];
  v36 = [v14 playableEffectsOfType:2];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v73 != v39) {
          objc_enumerationMutation(v36);
        }
        [*(id *)(*((void *)&v72 + 1) + 8 * i) setTransformAnimation:v35];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v38);
  }
  v41 = [v14 mediaItem];
  uint64_t v42 = [v14 playableAspectRatio];
  uint64_t v43 = [v14 playableAspectRatioPreservationMode];
  long long v44 = *(_OWORD *)&a5->c;
  long long v69 = *(_OWORD *)&a5->a;
  long long v70 = v44;
  long long v71 = *(_OWORD *)&a5->tx;
  long long v45 = *(_OWORD *)&a4->var0.var3;
  v68[0] = *(_OWORD *)&a4->var0.var0;
  v68[1] = v45;
  v68[2] = *(_OWORD *)&a4->var1.var1;
  v46 = [(JFXInstructionGraphBuilder *)self sourceNodeForMediaItem:v41 sourceTransform:&v69 compositionTrackID:v10 transformAnimation:v35 transformAnimationContentMode:14 presentationTimeRange:v68 mediaScale:v25 playableAspectRatio:v42 playableAspectRatioPreservationMode:v43];

  id v47 = v46;
  if ([v14 shouldRenderVideoAsBlack])
  {
    v48 = (void *)[MEMORY[0x263F61248] newEffectWithID:*MEMORY[0x263F61370]];
    v49 = [MEMORY[0x263F1C550] blackColor];
    [v48 setInspectableProperty:v49 forKey:*MEMORY[0x263F61740]];

    long long v50 = *(_OWORD *)&a4->var0.var3;
    v67[0] = *(_OWORD *)&a4->var0.var0;
    v67[1] = v50;
    v67[2] = *(_OWORD *)&a4->var1.var1;
    [v48 setEffectRange:v67];
    v51 = (void *)[MEMORY[0x263F61270] newEffectNodeToFilterInput:v47 effect:v48];
    id v52 = v47;
    goto LABEL_72;
  }
  v53 = v47;
  if (v64)
  {
    v53 = objc_msgSend((id)objc_opt_class(), "JFX_transformNode:scale:", v47, v25);
  }
  v54 = [(JFXInstructionGraphBuilder *)self JFX_applyCustomRenderingPropertiesToInputNode:v53 customRendererProperties:v66 transformAnimation:v35 transformAnimationContentMode:14 mediaScale:v25];

  if (a8) {
    objc_msgSend(v14, "playableEffectStackExcludingType:");
  }
  else {
  v48 = [v14 playableEffectStack];
  }
  long long v55 = *(_OWORD *)&a4->var0.var3;
  long long v69 = *(_OWORD *)&a4->var0.var0;
  long long v70 = v55;
  long long v71 = *(_OWORD *)&a4->var1.var1;
  v56 = [(JFXInstructionGraphBuilder *)self applyEffectStack:v48 presentationRange:&v69 toInput:v54];

  if (v64)
  {
    double v57 = v18 * v24;
    double v58 = v16;
    if (v63)
    {
      if (v63 > 2)
      {
        double v58 = v16;
        if (v63 != 3)
        {
          double v58 = v16;
          if (v63 != 13)
          {
            double v58 = v24;
            if (v63 == 14) {
              double v58 = v18 * v24;
            }
          }
        }
        goto LABEL_50;
      }
      if (v63 == 1)
      {
        if (v16 <= v18)
        {
          double v59 = v18;
          if (v57 < v16) {
            double v59 = v16 / v24;
          }
        }
        else
        {
          double v59 = v16 / v24;
          if (v16 / v24 < v18) {
            double v59 = v18;
          }
        }
        goto LABEL_49;
      }
      double v58 = v24;
      if (v63 == 2)
      {
        double v59 = v16 / v24;
        if (v16 / v24 > v18) {
          double v59 = v18;
        }
LABEL_49:
        double v58 = v24 * v59;
      }
    }
LABEL_50:
    v60 = objc_msgSend((id)objc_opt_class(), "JFX_transformNode:scale:", v56, v58 / v57);

    if (!v63) {
      goto LABEL_56;
    }
    double v61 = 1.0;
    if (v63 <= 2)
    {
      if (v63 == 1)
      {
        if (v16 <= v18)
        {
          double v61 = v18;
          if (v57 < v16) {
            double v61 = v16 / v24;
          }
        }
        else
        {
          double v61 = v16 / v24;
          if (v16 / v24 < v18) {
            double v61 = v18;
          }
        }
      }
      else
      {
        if (v63 != 2) {
          goto LABEL_70;
        }
        if (v16 / v24 <= v18) {
          double v61 = v16 / v24;
        }
        else {
          double v61 = v18;
        }
      }
      double v24 = v24 * v61;
      goto LABEL_70;
    }
    switch(v63)
    {
      case 3:
LABEL_56:
        double v24 = v16;
        break;
      case 13:
        double v61 = v16 / v24;
        double v24 = v16;
        goto LABEL_70;
      case 14:
        double v24 = v18 * v24;
        break;
      default:
LABEL_70:
        v56 = objc_msgSend((id)objc_opt_class(), "JFX_maskNode:maskRect:basisSize:", v60, (v16 - v24) * 0.5 + 0.0, (v18 - v61) * 0.5 + 0.0, v24, v61, v16, v18);

        goto LABEL_71;
    }
    double v61 = v18;
    goto LABEL_70;
  }
LABEL_71:
  id v52 = v56;
  v51 = v52;
LABEL_72:

  return v51;
}

+ (double)JFX_scaleForMediaSize:(CGSize)a3 mediaContentMode:(int)a4 clipAspectRatio:(double)a5 outputSize:(CGSize)a6 outputContentMode:(int)a7
{
  double v7 = 1.0;
  if (a4 == a7 || !a4 || !a7) {
    return v7;
  }
  if (a4 <= 2)
  {
    if (a4 == 1)
    {
      if (a6.width <= a6.height)
      {
        double v13 = a6.height / a3.height;
        if (a3.width * (a6.height / a3.height) < a6.width) {
          double v13 = a6.width / a3.width;
        }
      }
      else
      {
        double v13 = a6.width / a3.width;
        if (a3.height * (a6.width / a3.width) < a6.height) {
          double v13 = a6.height / a3.height;
        }
      }
      a3.double width = a3.width * v13;
      a3.double height = a3.height * v13;
      goto LABEL_27;
    }
    if (a4 == 2)
    {
      if (a3.height * (a6.width / a3.width) <= a6.height) {
        double v10 = a6.width / a3.width;
      }
      else {
        double v10 = a6.height / a3.height;
      }
      double v11 = a3.width * v10;
      double v12 = a3.height * v10;
      if (v11 <= a3.height * v10)
      {
        double height = a3.height * v10;
        if (v12 * a5 < v11) {
          double height = v11 / a5;
        }
      }
      else
      {
        double height = v11 / a5;
        if (v11 / a5 < v12) {
          double height = v12;
        }
      }
      goto LABEL_30;
    }
  }
  else
  {
    switch(a4)
    {
      case 3:
        double height = a6.height;
        double width = a6.width;
        goto LABEL_31;
      case 13:
        double width = a6.width;
        double height = a6.width / a5;
        goto LABEL_31;
      case 14:
        double width = a6.height * a5;
        double height = a6.height;
        goto LABEL_31;
    }
  }
  double height = 1.0;
  double width = a5;
  if ((a4 - 4) >= 9)
  {
LABEL_27:
    double v14 = a3.width / a5;
    if (v14 <= a3.height) {
      double height = v14;
    }
    else {
      double height = a3.height;
    }
LABEL_30:
    double width = height * a5;
  }
LABEL_31:
  if (a7 <= 2)
  {
    if (a7 == 1)
    {
      if (a6.width <= a6.height)
      {
        double v15 = a6.height;
        if (a6.height * a5 < a6.width) {
          double v15 = a6.width / a5;
        }
      }
      else
      {
        double v15 = a6.width / a5;
        if (a6.width / a5 < a6.height) {
          double v15 = a6.height;
        }
      }
    }
    else
    {
      if (a7 != 2) {
        return a5 / width;
      }
      double v15 = a6.width / a5;
      if (a6.width / a5 > a6.height) {
        double v15 = a6.height;
      }
    }
    a5 = v15 * a5;
    return a5 / width;
  }
  if (a7 == 3)
  {
    a5 = a6.width;
    return a5 / width;
  }
  if (a7 != 13)
  {
    if (a7 == 14) {
      a5 = a6.height * a5;
    }
    return a5 / width;
  }
  return a6.width / a5 / height;
}

+ (id)JFX_transformNode:(id)a3 scale:(double)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (fabs(a4 + -1.0) >= 0.0001)
  {
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, a4, a4);
    CGAffineTransform v9 = v10;
    id v7 = (id)[MEMORY[0x263F612A8] newTransformNode:v6 transform:&v9];
    [v7 setIsDebugDrawingEnabled:JFX_isDrawInstructionGraphNodesEnabled()];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

+ (id)JFX_maskNode:(id)a3 maskRect:(CGRect)a4 basisSize:(CGSize)a5
{
  id v5 = objc_msgSend(MEMORY[0x263F61290], "newMaskNode:normalizedMaskRect:", a3, a4.origin.x / a5.width, a4.origin.y / a5.height, a4.size.width / a5.width, a4.size.height / a5.height);
  [v5 setIsDebugDrawingEnabled:JFX_isDrawInstructionGraphNodesEnabled()];
  return v5;
}

- (id)JFX_applyCustomRenderingPropertiesToInputNode:(id)a3 customRendererProperties:(id)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 mediaScale:(double)a7
{
  uint64_t v8 = *(void *)&a6;
  v36[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v12;
  double v16 = v15;
  if (v13)
  {
    double v17 = [v13 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];

    double v16 = v15;
    if (v17)
    {
      double v18 = [v13 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];
      double v19 = [v18 metadata];
      double v20 = [v19 objectForKeyedSubscript:@"JFXAnimojiRendererMetadata_RenderSize"];
      [v20 CGSizeValue];
      double v22 = v21;
      double v24 = v23;

      double v25 = (void *)MEMORY[0x263F61298];
      double v26 = [v18 renderingDelegate];
      double v27 = [v18 metadata];
      int v28 = objc_msgSend(v25, "newSourceCompositeNodeWithDelegate:inputs:userContext:outputSize:outputFormat:", v26, 0, v27, 1111970369, v22, v24);

      long long v34 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
      -[JFXInstructionGraphBuilder JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:mediaScale:](self, "JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:mediaScale:", v22, v24, a7);
      v32[0] = v33;
      v32[1] = v34;
      v32[2] = v35;
      [v28 setTransform:v32];
      int v29 = [MEMORY[0x263F61230] sRGBColorSpace];
      [v28 setColorSpace:v29];

      [v28 setTransformAnimationContentMode:v8];
      [v28 setTransformAnimation:v14];
      v36[0] = v15;
      v36[1] = v28;
      int v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      double v16 = [(JFXInstructionGraphBuilder *)self blendNodeForClipSourceNodes:v30];
    }
  }

  return v16;
}

- (CGAffineTransform)JFX_calculateCompositeNodeTransformForCropWithCompositeNodeOutputSize:(SEL)a3 mediaScale:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v10 = MEMORY[0x263F000D0];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v27 = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v26;
  long long v25 = *(_OWORD *)(v10 + 32);
  *(_OWORD *)&retstr->tx = v25;
  result = (CGAffineTransform *)[(JFXInstructionGraphBuilder *)self outputSize];
  double v14 = v13;
  double v15 = v12;
  BOOL v16 = v13 == width && v12 == height;
  if (!v16 || fabs(a5 + -1.0) >= 0.0001)
  {
    [(JFXInstructionGraphBuilder *)self outputSize];
    double v18 = v17 / height;
    [(JFXInstructionGraphBuilder *)self outputSize];
    double v20 = v19 / width;
    if (v18 >= v20) {
      double v20 = v18;
    }
    float v21 = v20;
    float v22 = v21 * a5;
    memset(&v34, 0, sizeof(v34));
    CGAffineTransformMakeScale(&v34, v22, v22);
    CGRectForInnerSizeCenteredInOuterSize(v14, v15, height * v34.c + v34.a * width);
    uint64_t v33 = 0;
    memset(&v32, 0, sizeof(v32));
    PVTransformAnimationInfoForLiveCapture();
    *(_OWORD *)&t1.a = v27;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tx = v25;
    CGAffineTransform t2 = v34;
    CGAffineTransformConcat(retstr, &t1, &t2);
    CGAffineTransform t1 = v32;
    uint64_t v29 = v33;
    CGAffineTransformFromPVAnimInfo();
    long long v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t2.c = v23;
    *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&t1, &t2, &v30);
    long long v24 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  }
  return result;
}

- (id)_sourceNodeForVideoMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 transformAnimation:(id)a6 transformAnimationContentMode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a5;
  double v11 = (void *)MEMORY[0x263F612A0];
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v13 playableMediaContentMode];
  [v13 naturalSize];
  double v16 = v15;
  double v18 = v17;

  double v19 = objc_msgSend(v11, "newSourceTrackNode:animation:fillMode:clipNaturalSize:", v8, v12, v14, v16, v18);
  long long v20 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v20;
  v22[2] = *(_OWORD *)&a4->tx;
  [v19 setTransform:v22];
  [v19 setTransformAnimationContentMode:v7];
  return v19;
}

- (id)_sourceNodeForStillMediaItem:(id)a3 sourceTransform:(CGAffineTransform *)a4 transformAnimation:(id)a5 transformAnimationContentMode:(int)a6 presentationRange:(id *)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = [v11 assetURL];
  if ([v11 mediaState] == 3)
  {
    uint64_t v14 = [v13 URLByAppendingPathComponent:@"trash"];

    id v13 = (void *)v14;
  }
  double v15 = objc_msgSend(objc_alloc(MEMORY[0x263F61288]), "initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:", v13, v12, self->_renderingIntent == 1, v11, self->_renderingIntent, objc_msgSend(v11, "playableMediaContentMode"));

  long long v16 = *(_OWORD *)&a4->c;
  v18[0] = *(_OWORD *)&a4->a;
  v18[1] = v16;
  v18[2] = *(_OWORD *)&a4->tx;
  [v15 setTransform:v18];
  [v15 setTransformAnimationContentMode:v7];

  return v15;
}

- (id)_buildTestXFormAnimation:(id *)a3 baseTransform:(CGAffineTransform *)a4 clipNaturalSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  CGAffineTransform v9 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  long long v36 = *(_OWORD *)&a3->var0.var0;
  CMTimeEpoch var3 = a3->var0.var3;
  double tx = a4->tx;
  double ty = a4->ty;
  double v12 = sqrt(a4->d * a4->d + a4->a * a4->a);
  id v13 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[JFXInstructionGraphBuilder _buildTestXFormAnimation:baseTransform:clipNaturalSize:](a4, v13);
  }

  *(_OWORD *)&range.start.value = v36;
  range.start.epoch = var3;
  *(double *)&range.duration.value = tx;
  *(double *)&range.duration.timescale = ty;
  *(double *)&range.duration.epoch = v12;
  uint64_t v35 = 0;
  uint64_t v14 = [MEMORY[0x263F08D40] valueWithPVTransformAnimationInfo:&range];
  [v9 addObject:v14];
  int64_t var0 = a3->var1.var0;
  int64_t v16 = a3->var0.var0;
  long long v17 = *(_OWORD *)&a3->var0.var1;
  memset(&v32, 0, sizeof(v32));
  long long v18 = *(_OWORD *)&a3->var0.var0;
  long long v19 = *(_OWORD *)&a3->var0.var3;
  long long v33 = v17;
  *(_OWORD *)&range.start.value = v18;
  long long v20 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&range.start.epoch = v19;
  *(_OWORD *)&range.duration.timescale = v20;
  CMTimeRangeGetEnd(&v32, &range);
  CMTimeValue v21 = v16 + 1;
  range.start.value = v21;
  *(_OWORD *)&range.start.timescale = v33;
  CMTime v31 = v32;
  if (CMTimeCompare(&range.start, &v31) < 0)
  {
    double v22 = (double)var0;
    double v23 = 0.2 / (double)var0;
    double v24 = 0.1 / v22;
    do
    {
      uint64_t v25 = v21 - a3->var0.var0;
      double v26 = ty + (double)v21 * v24;
      double v27 = tx + (double)v21 * v24;
      if (height <= width) {
        double v26 = ty;
      }
      else {
        double v27 = tx;
      }
      *(_OWORD *)&range.start.timescale = v33;
      range.start.value = v21;
      *(double *)&range.duration.value = v27;
      *(double *)&range.duration.timescale = v26;
      *(double *)&range.duration.epoch = v12 + (double)v25 * v23;
      uint64_t v35 = 0;
      int v28 = [MEMORY[0x263F08D40] valueWithPVTransformAnimationInfo:&range];
      [v9 addObject:v28];

      range.start.value = ++v21;
      *(_OWORD *)&range.start.timescale = v33;
      CMTime v31 = v32;
    }
    while (CMTimeCompare(&range.start, &v31) < 0);
  }
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F61300]) initWithAnimation:v9];

  return v29;
}

- (int)renderingIntent
{
  return self->_renderingIntent;
}

- (void)setRenderingIntent:(int)a3
{
  self->_renderingIntent = a3;
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

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void)setOutputColorSpace:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_buildTestXFormAnimation:(_OWORD *)a1 baseTransform:(NSObject *)a2 clipNaturalSize:.cold.1(_OWORD *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v3 = a1[1];
  *(_OWORD *)&v5.a = *a1;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.double tx = a1[2];
  long long v4 = NSStringFromCGAffineTransform(&v5);
  LODWORD(v5.a) = 138412290;
  *(void *)((char *)&v5.a + 4) = v4;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "newInstructionGraphNodeToShowImageWithClip: clipTransform = %@", (uint8_t *)&v5, 0xCu);
}

@end