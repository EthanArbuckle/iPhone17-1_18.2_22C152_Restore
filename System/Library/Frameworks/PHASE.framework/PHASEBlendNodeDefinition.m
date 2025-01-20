@interface PHASEBlendNodeDefinition
+ (PHASEBlendNodeDefinition)new;
- (NSMutableArray)ranges;
- (PHASEBlendNodeDefinition)init;
- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition;
- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition identifier:(NSString *)identifier;
- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition;
- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition identifier:(NSString *)identifier;
- (PHASENumberMetaParameterDefinition)blendParameterDefinition;
- (PHASESpatialMixerDefinition)spatialMixerDefinitionForDistance;
- (id)children;
- (void)addRangeForInputValuesAbove:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree;
- (void)addRangeForInputValuesBelow:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree;
- (void)addRangeForInputValuesBetween:(double)lowValue highValue:(double)highValue fullGainAtLowValue:(double)fullGainAtLowValue fullGainAtHighValue:(double)fullGainAtHighValue lowFadeCurveType:(PHASECurveType)lowFadeCurveType highFadeCurveType:(PHASECurveType)highFadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree;
- (void)addRangeWithEnvelope:(PHASEEnvelope *)envelope subtree:(PHASESoundEventNodeDefinition *)subtree;
- (void)setRanges:(id)a3;
@end

@implementation PHASEBlendNodeDefinition

- (PHASEBlendNodeDefinition)init
{
  return 0;
}

+ (PHASEBlendNodeDefinition)new
{
  return 0;
}

- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition identifier:(NSString *)identifier
{
  v6 = blendMetaParameterDefinition;
  v7 = identifier;
  v8 = [(PHASEBlendNodeDefinition *)self initWithBlendMetaParameterDefinition:v6];
  v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (PHASEBlendNodeDefinition)initWithBlendMetaParameterDefinition:(PHASENumberMetaParameterDefinition *)blendMetaParameterDefinition
{
  v5 = blendMetaParameterDefinition;
  if (!v5)
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a blend node definition with a nil blendMetaParameterDefinition"];
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASEBlendNodeDefinition;
  id v6 = [(PHASEDefinition *)&v12 initInternal];
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v7;

  objc_storeStrong((id *)v6 + 2, blendMetaParameterDefinition);
  v9 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = 0;

  self = (PHASEBlendNodeDefinition *)v6;
  v10 = self;
LABEL_7:

  return v10;
}

- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition identifier:(NSString *)identifier
{
  id v6 = spatialMixerDefinition;
  id v7 = identifier;
  v8 = [(PHASEBlendNodeDefinition *)self initDistanceBlendWithSpatialMixerDefinition:v6];
  v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (PHASEBlendNodeDefinition)initDistanceBlendWithSpatialMixerDefinition:(PHASESpatialMixerDefinition *)spatialMixerDefinition
{
  v5 = spatialMixerDefinition;
  if (!v5)
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a blend node definition with a nil spatialMixerDefinition"];
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)PHASEBlendNodeDefinition;
  id v6 = [(PHASEDefinition *)&v12 initInternal];
  if (!v6)
  {
    self = 0;
    goto LABEL_6;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v7;

  v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = 0;

  objc_storeStrong((id *)v6 + 3, spatialMixerDefinition);
  self = (PHASEBlendNodeDefinition *)v6;
  v10 = self;
LABEL_7:

  return v10;
}

- (id)children
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_ranges;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 8), (void)v9);
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)addRangeForInputValuesBelow:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  v22 = subtree;
  long long v9 = objc_alloc_init(BlendRange);
  long long v10 = [[PHASEEnvelopeSegment alloc] initWithEndPoint:fadeCurveType curveType:value];
  long long v11 = [PHASEEnvelope alloc];
  long long v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
  __asm { FMOV            V0.2D, #1.0 }
  uint64_t v18 = [(PHASEEnvelope *)v11 initWithStartPoint:v12 segments:fullGainAtValue];
  blendEnvelope = v9->blendEnvelope;
  v9->blendEnvelope = (PHASEEnvelope *)v18;

  objc_storeStrong((id *)&v9->subtree, subtree);
  [(NSMutableArray *)self->_ranges addObject:v9];
}

- (void)addRangeForInputValuesBetween:(double)lowValue highValue:(double)highValue fullGainAtLowValue:(double)fullGainAtLowValue fullGainAtHighValue:(double)fullGainAtHighValue lowFadeCurveType:(PHASECurveType)lowFadeCurveType highFadeCurveType:(PHASECurveType)highFadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  v28 = subtree;
  v13 = objc_alloc_init(BlendRange);
  uint64_t v14 = [PHASEEnvelopeSegment alloc];
  __asm { FMOV            V0.2D, #1.0 }
  v20 = [(PHASEEnvelopeSegment *)v14 initWithEndPoint:lowFadeCurveType curveType:fullGainAtLowValue];
  v21 = [[PHASEEnvelopeSegment alloc] initWithEndPoint:highFadeCurveType curveType:highValue];
  if (fullGainAtLowValue == fullGainAtHighValue)
  {
    v23 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v20, fullGainAtHighValue, fullGainAtLowValue, v21, 0);
  }
  else
  {
    v22 = [[PHASEEnvelopeSegment alloc] initWithEndPoint:1668435054 curveType:fullGainAtHighValue];
    v23 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v20, v22, v21, 0);
  }
  v24 = [[PHASEEnvelope alloc] initWithStartPoint:v23 segments:lowValue];
  blendEnvelope = v13->blendEnvelope;
  v13->blendEnvelope = v24;

  objc_storeStrong((id *)&v13->subtree, subtree);
  [(NSMutableArray *)self->_ranges addObject:v13];
}

- (void)addRangeForInputValuesAbove:(double)value fullGainAtValue:(double)fullGainAtValue fadeCurveType:(PHASECurveType)fadeCurveType subtree:(PHASESoundEventNodeDefinition *)subtree
{
  v23 = subtree;
  long long v9 = objc_alloc_init(BlendRange);
  long long v10 = [PHASEEnvelopeSegment alloc];
  __asm { FMOV            V0.2D, #1.0 }
  v16 = [(PHASEEnvelopeSegment *)v10 initWithEndPoint:fadeCurveType curveType:fullGainAtValue];
  v17 = [PHASEEnvelope alloc];
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObject:v16];
  uint64_t v19 = [(PHASEEnvelope *)v17 initWithStartPoint:v18 segments:value];
  blendEnvelope = v9->blendEnvelope;
  v9->blendEnvelope = (PHASEEnvelope *)v19;

  objc_storeStrong((id *)&v9->subtree, subtree);
  [(NSMutableArray *)self->_ranges addObject:v9];
}

- (void)addRangeWithEnvelope:(PHASEEnvelope *)envelope subtree:(PHASESoundEventNodeDefinition *)subtree
{
  long long v9 = envelope;
  id v7 = subtree;
  v8 = objc_alloc_init(BlendRange);
  objc_storeStrong((id *)&v8->blendEnvelope, envelope);
  objc_storeStrong((id *)&v8->subtree, subtree);
  [(NSMutableArray *)self->_ranges addObject:v8];
}

- (PHASENumberMetaParameterDefinition)blendParameterDefinition
{
  return self->_blendParameterDefinition;
}

- (PHASESpatialMixerDefinition)spatialMixerDefinitionForDistance
{
  return self->_spatialMixerDefinitionForDistance;
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_spatialMixerDefinitionForDistance, 0);

  objc_storeStrong((id *)&self->_blendParameterDefinition, 0);
}

@end