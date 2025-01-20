@interface _TDLayerStackFilterHelper
- (BOOL)allowKey:(id)a3;
- (NSMutableArray)excludedDirections;
- (NSMutableArray)excludedHorizontalSizeClasses;
- (NSMutableArray)excludedIdioms;
- (NSMutableArray)excludedLayers;
- (NSMutableArray)excludedPresentationStates;
- (NSMutableArray)excludedScaleFactors;
- (NSMutableArray)excludedSizes;
- (NSMutableArray)excludedStates;
- (NSMutableArray)excludedSubtypes;
- (NSMutableArray)excludedValues;
- (NSMutableArray)excludedVerticalSizeClasses;
- (TDLayerStackRenditionSpec)layerStackRendition;
- (_TDLayerStackFilterHelper)init;
- (void)dealloc;
- (void)establishExclusionsWithHelper:(id)a3 idioms:(id)a4 sizeClasses:(id)a5;
- (void)setExcludedDirections:(id)a3;
- (void)setExcludedHorizontalSizeClasses:(id)a3;
- (void)setExcludedIdioms:(id)a3;
- (void)setExcludedLayers:(id)a3;
- (void)setExcludedPresentationStates:(id)a3;
- (void)setExcludedScaleFactors:(id)a3;
- (void)setExcludedSizes:(id)a3;
- (void)setExcludedStates:(id)a3;
- (void)setExcludedSubtypes:(id)a3;
- (void)setExcludedValues:(id)a3;
- (void)setExcludedVerticalSizeClasses:(id)a3;
- (void)setLayerStackRendition:(id)a3;
@end

@implementation _TDLayerStackFilterHelper

- (_TDLayerStackFilterHelper)init
{
  v4.receiver = self;
  v4.super_class = (Class)_TDLayerStackFilterHelper;
  v2 = [(_TDLayerStackFilterHelper *)&v4 init];
  if (v2)
  {
    v2->_excludedIdioms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedSubtypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedScaleFactors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedHorizontalSizeClasses = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedVerticalSizeClasses = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedDirections = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedPresentationStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedSizes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_excludedValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (void)establishExclusionsWithHelper:(id)a3 idioms:(id)a4 sizeClasses:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec", a3, a4, a5), "idiom"))
  {
    uint64_t v8 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
    if (v8 == [a4 objectAtIndex:0])
    {
      uint64_t v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom");
      if (v14 != [a4 objectAtIndex:0]) {
        -[NSMutableArray addObject:](self->_excludedIdioms, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom"));
      }
    }
    else if (![(NSMutableArray *)self->_excludedIdioms count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(a4);
            }
            uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            if (v13 != objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom"))-[NSMutableArray addObject:](self->_excludedIdioms, "addObject:", v13); {
          }
            }
          uint64_t v10 = [a4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v10);
      }
    }
  }
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom"))
  {
    uint64_t v15 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
    if (v15 != [a4 objectAtIndex:0])
    {
      uint64_t v16 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
      if (v16 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom"))
      {
        uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "subtype");
        if (v18)
        {
          uint64_t v19 = v18;
          if (v18 != objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "subtype"))-[NSMutableArray addObject:](self->_excludedSubtypes, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v19)); {
        }
          }
      }
    }
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "scaleFactor");
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "scaleFactor") != v17)-[NSMutableArray addObject:](self->_excludedScaleFactors, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17)); {
}
  }

- (BOOL)allowKey:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![a3 idiom]
    || (-[NSMutableArray containsObject:](self->_excludedIdioms, "containsObject:", [a3 idiom]) & 1) == 0)
  {
    if ([a3 subtype]
      && (long long v26 = 0u,
          long long v27 = 0u,
          long long v24 = 0u,
          long long v25 = 0u,
          excludedSubtypes = self->_excludedSubtypes,
          (uint64_t v7 = [(NSMutableArray *)excludedSubtypes countByEnumeratingWithState:&v24 objects:v29 count:16]) != 0))
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
LABEL_8:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(excludedSubtypes);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        int v12 = [a3 subtype];
        if (v12 == [v11 unsignedIntValue]) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)excludedSubtypes countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v8) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      excludedScaleFactors = self->_excludedScaleFactors;
      uint64_t v14 = [(NSMutableArray *)excludedScaleFactors countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
LABEL_16:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(excludedScaleFactors);
          }
          uint64_t v18 = *(void **)(*((void *)&v20 + 1) + 8 * v17);
          int v19 = [a3 scaleFactor];
          if (v19 == [v18 unsignedIntValue]) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [(NSMutableArray *)excludedScaleFactors countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v15) {
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
      }
      else
      {
LABEL_22:
        if ((![a3 sizeClassVertical]
           || (-[NSMutableArray containsObject:](self->_excludedVerticalSizeClasses, "containsObject:", [a3 sizeClassVertical]) & 1) == 0)&& (!objc_msgSend(a3, "direction")|| (-[NSMutableArray containsObject:](self->_excludedDirections, "containsObject:", objc_msgSend(a3, "direction")) & 1) == 0)&& (!objc_msgSend(a3, "layer")|| (-[NSMutableArray containsObject:](self->_excludedLayers, "containsObject:", objc_msgSend(a3, "layer")) & 1) == 0)&& (!objc_msgSend(a3, "presentationState")|| (-[NSMutableArray containsObject:](self->_excludedPresentationStates, "containsObject:", objc_msgSend(a3, "presentationState")) & 1) == 0)&& (!objc_msgSend(a3, "size")|| (-[NSMutableArray containsObject:](self->_excludedSizes, "containsObject:", objc_msgSend(a3, "size")) & 1) == 0)&& (!objc_msgSend(a3, "state")|| (-[NSMutableArray containsObject:](self->_excludedStates, "containsObject:", objc_msgSend(a3, "state")) & 1) == 0)
          && (![a3 value]
           || (-[NSMutableArray containsObject:](self->_excludedValues, "containsObject:", [a3 value]) & 1) == 0))
        {
          return 1;
        }
      }
    }
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_TDLayerStackFilterHelper;
  [(_TDLayerStackFilterHelper *)&v3 dealloc];
}

- (NSMutableArray)excludedIdioms
{
  return self->_excludedIdioms;
}

- (void)setExcludedIdioms:(id)a3
{
}

- (NSMutableArray)excludedSubtypes
{
  return self->_excludedSubtypes;
}

- (void)setExcludedSubtypes:(id)a3
{
}

- (NSMutableArray)excludedScaleFactors
{
  return self->_excludedScaleFactors;
}

- (void)setExcludedScaleFactors:(id)a3
{
}

- (NSMutableArray)excludedHorizontalSizeClasses
{
  return self->_excludedHorizontalSizeClasses;
}

- (void)setExcludedHorizontalSizeClasses:(id)a3
{
}

- (NSMutableArray)excludedVerticalSizeClasses
{
  return self->_excludedVerticalSizeClasses;
}

- (void)setExcludedVerticalSizeClasses:(id)a3
{
}

- (NSMutableArray)excludedDirections
{
  return self->_excludedDirections;
}

- (void)setExcludedDirections:(id)a3
{
}

- (NSMutableArray)excludedLayers
{
  return self->_excludedLayers;
}

- (void)setExcludedLayers:(id)a3
{
}

- (NSMutableArray)excludedPresentationStates
{
  return self->_excludedPresentationStates;
}

- (void)setExcludedPresentationStates:(id)a3
{
}

- (NSMutableArray)excludedSizes
{
  return self->_excludedSizes;
}

- (void)setExcludedSizes:(id)a3
{
}

- (NSMutableArray)excludedStates
{
  return self->_excludedStates;
}

- (void)setExcludedStates:(id)a3
{
}

- (NSMutableArray)excludedValues
{
  return self->_excludedValues;
}

- (void)setExcludedValues:(id)a3
{
}

- (TDLayerStackRenditionSpec)layerStackRendition
{
  return self->_layerStackRendition;
}

- (void)setLayerStackRendition:(id)a3
{
}

@end