@interface AVVideoCompositionInstruction
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVVideoCompositionInstruction)init;
- (AVVideoCompositionInstruction)initWithCoder:(id)a3;
- (BOOL)containsTweening;
- (BOOL)enablePostProcessing;
- (BOOL)isEqual:(id)a3;
- (CGColorRef)backgroundColor;
- (CMPersistentTrackID)passthroughTrackID;
- (CMTimeRange)timeRange;
- (NSArray)layerInstructions;
- (NSArray)requiredSourceSampleDataTrackIDs;
- (NSArray)requiredSourceTrackIDs;
- (NSString)description;
- (id)_deepCopy;
- (id)blendingTransferFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_setValuesFromDictionary:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBlendingTransferFunction:(id)a3;
- (void)setEnablePostProcessing:(BOOL)a3;
- (void)setLayerInstructions:(id)a3;
- (void)setRequiredSourceSampleDataTrackIDs:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation AVVideoCompositionInstruction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (AVVideoCompositionInstruction)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVVideoCompositionInstruction;
  v2 = [(AVVideoCompositionInstruction *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVVideoCompositionInstructionInternal);
    v2->_instruction = v3;
    if (v3)
    {
      CFRetain(v3);
      long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      v6[0] = *MEMORY[0x1E4F1FA20];
      v6[1] = v4;
      v6[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      [(AVVideoCompositionInstruction *)v2 setTimeRange:v6];
      [(AVVideoCompositionInstruction *)v2 setEnablePostProcessing:1];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVVideoCompositionInstruction)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVVideoCompositionInstruction;
  long long v4 = [(AVVideoCompositionInstruction *)&v12 init];
  if (v4)
  {
    v5 = objc_alloc_init(AVVideoCompositionInstructionInternal);
    v4->_instruction = v5;
    if (v5)
    {
      CFRetain(v5);
      v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      -[AVVideoCompositionInstruction _setValuesFromDictionary:](v4, "_setValuesFromDictionary:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0), @"AVVideoCompositionInstruction"));
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = [(AVVideoCompositionInstruction *)self dictionaryRepresentation];
  [a3 encodeObject:v4 forKey:@"AVVideoCompositionInstruction"];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  p_timeRange = &self->_instruction->timeRange;
  if (a3) {
    [a3 timeRange];
  }
  else {
    memset(&range2, 0, sizeof(range2));
  }
  long long v6 = *(_OWORD *)&p_timeRange->start.value;
  long long v7 = *(_OWORD *)&p_timeRange->duration.timescale;
  *(_OWORD *)&v15.start.epoch = *(_OWORD *)&p_timeRange->start.epoch;
  *(_OWORD *)&v15.duration.timescale = v7;
  *(_OWORD *)&v15.start.value = v6;
  int v8 = CMTimeRangeEqual(&v15, &range2);
  if (v8)
  {
    backgroundColor = self->_instruction->backgroundColor;
    uint64_t v10 = (CGColor *)[a3 backgroundColor];
    if (backgroundColor)
    {
      if (!CGColorEqualToColor(backgroundColor, v10)) {
        goto LABEL_14;
      }
    }
    else if (v10)
    {
      goto LABEL_14;
    }
    layerInstructions = self->_instruction->layerInstructions;
    uint64_t v12 = [a3 layerInstructions];
    if (layerInstructions)
    {
      if ([(NSArray *)layerInstructions isEqual:v12])
      {
LABEL_12:
        int enablePostProcessing = self->_instruction->enablePostProcessing;
        LOBYTE(v8) = enablePostProcessing == [a3 enablePostProcessing];
        return v8;
      }
    }
    else if (!v12)
    {
      goto LABEL_12;
    }
LABEL_14:
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(AVVideoCompositionInstruction *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    v5 = [+[AVVideoCompositionInstruction allocWithZone:a3] init];
    if (v5)
    {
      if (self) {
        [(AVVideoCompositionInstruction *)self timeRange];
      }
      else {
        memset(v7, 0, sizeof(v7));
      }
      [(AVVideoCompositionInstruction *)v5 setTimeRange:v7];
      [(AVVideoCompositionInstruction *)v5 setBackgroundColor:[(AVVideoCompositionInstruction *)self backgroundColor]];
      [(AVVideoCompositionInstruction *)v5 setLayerInstructions:[(AVVideoCompositionInstruction *)self layerInstructions]];
      [(AVVideoCompositionInstruction *)v5 setRequiredSourceSampleDataTrackIDs:[(AVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs]];
      [(AVVideoCompositionInstruction *)v5 setEnablePostProcessing:[(AVVideoCompositionInstruction *)self enablePostProcessing]];
    }
    return v5;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(AVVideoCompositionInstruction *)+[AVMutableVideoCompositionInstruction allocWithZone:a3] init];
  if (v4)
  {
    if (self) {
      [(AVVideoCompositionInstruction *)self timeRange];
    }
    else {
      memset(v6, 0, sizeof(v6));
    }
    [(AVMutableVideoCompositionInstruction *)v4 setTimeRange:v6];
    [(AVMutableVideoCompositionInstruction *)v4 setBackgroundColor:[(AVVideoCompositionInstruction *)self backgroundColor]];
    [(AVMutableVideoCompositionInstruction *)v4 setLayerInstructions:[(AVVideoCompositionInstruction *)self layerInstructions]];
    [(AVMutableVideoCompositionInstruction *)v4 setRequiredSourceSampleDataTrackIDs:[(AVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs]];
    [(AVMutableVideoCompositionInstruction *)v4 setEnablePostProcessing:[(AVVideoCompositionInstruction *)self enablePostProcessing]];
  }
  return v4;
}

- (id)_deepCopy
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (id)[(AVVideoCompositionInstruction *)self mutableCopy];
  id v4 = [(AVVideoCompositionInstruction *)self layerInstructions];
  v5 = [(AVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs];
  long long v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v6, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v10++), "copy"));
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  [v3 setLayerInstructions:v6];
  if ([(AVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs])
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v11, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15++), "copy"));
        }
        while (v13 != v15);
        uint64_t v13 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
    [v3 setRequiredSourceSampleDataTrackIDs:v11];
  }
  return (id)[v3 copy];
}

- (void)dealloc
{
  instruction = self->_instruction;
  if (instruction)
  {
    backgroundColor = instruction->backgroundColor;
    if (backgroundColor)
    {
      CFRelease(backgroundColor);
      instruction = self->_instruction;
    }

    CFRelease(self->_instruction);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVVideoCompositionInstruction;
  [(AVVideoCompositionInstruction *)&v5 dealloc];
}

- (CMPersistentTrackID)passthroughTrackID
{
  return 0;
}

- (NSArray)requiredSourceTrackIDs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  layerInstructions = self->_instruction->layerInstructions;
  uint64_t v5 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(layerInstructions);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) trackID];
        -[NSArray addObject:](v3, "addObject:", [MEMORY[0x1E4F28ED0] numberWithInt:v9]);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)containsTweening
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  layerInstructions = self->_instruction->layerInstructions;
  uint64_t v4 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(layerInstructions);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [(AVVideoCompositionInstruction *)self timeRange];
        uint64_t v9 = (void *)[v8 dictionaryRepresentationWithTimeRange:&v11];
        if ([v9 objectForKey:@"TweenedAffineMatrix"]
          || [v9 objectForKey:@"TweenedOpacity"]
          || [v9 objectForKey:@"TweenedCropRectangle"])
        {
          LOBYTE(v4) = 1;
          return v4;
        }
      }
      uint64_t v5 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v12 objects:v16 count:16];
      LOBYTE(v4) = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (CMTimeRange)timeRange
{
  uint64_t v3 = *(void *)&self->start.timescale;
  long long v4 = *(_OWORD *)(v3 + 24);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 8);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 40);
  return self;
}

- (void)setTimeRange:(id *)a3
{
  instruction = self->_instruction;
  long long v4 = *(_OWORD *)&a3->var0.var0;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&instruction->timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&instruction->timeRange.start.epoch = v5;
  *(_OWORD *)&instruction->timeRange.start.value = v4;
}

- (CGColorRef)backgroundColor
{
  return self->_instruction->backgroundColor;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  instruction = self->_instruction;
  backgroundColor = instruction->backgroundColor;
  if (backgroundColor)
  {
    CFRelease(backgroundColor);
    instruction = self->_instruction;
  }
  instruction->backgroundColor = a3;
}

- (NSArray)layerInstructions
{
  return self->_instruction->layerInstructions;
}

- (void)setLayerInstructions:(id)a3
{
  layerInstructions = self->_instruction->layerInstructions;
  if (layerInstructions != a3)
  {

    self->_instruction->layerInstructions = (NSArray *)[a3 copy];
  }
}

- (BOOL)enablePostProcessing
{
  return self->_instruction->enablePostProcessing;
}

- (void)setEnablePostProcessing:(BOOL)a3
{
  self->_instruction->int enablePostProcessing = a3;
}

- (id)blendingTransferFunction
{
  return self->_instruction->blendingTransferFunction;
}

- (void)setBlendingTransferFunction:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  instruction = self->_instruction;
  blendingTransferFunction = instruction->blendingTransferFunction;
  if (blendingTransferFunction)
  {
    CFRelease(blendingTransferFunction);
    instruction = self->_instruction;
  }
  instruction->blendingTransferFunction = (NSString *)a3;
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return self->_instruction->requiredSourceSampleDataTrackIDs;
}

- (void)setRequiredSourceSampleDataTrackIDs:(id)a3
{
  requiredSourceSampleDataTrackIDs = self->_instruction->requiredSourceSampleDataTrackIDs;
  if (requiredSourceSampleDataTrackIDs != a3)
  {

    self->_instruction->requiredSourceSampleDataTrackIDs = (NSArray *)[a3 copy];
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  memset(&v38, 0, sizeof(v38));
  if (self) {
    [(AVVideoCompositionInstruction *)self timeRange];
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&time.start.value = *(_OWORD *)&v38.start.value;
  time.start.epoch = v38.start.epoch;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&time.start, v4);
  [v3 setObject:v5 forKey:@"StartTime"];
  if (v5) {
    CFRelease(v5);
  }
  CMTimeRange time = v38;
  CMTimeRangeGetEnd(&v37, &time);
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&v37, v4);
  [v3 setObject:v6 forKey:@"EndTime"];
  if (v6) {
    CFRelease(v6);
  }
  if ([(AVVideoCompositionInstruction *)self requiredSourceSampleDataTrackIDs]) {
    objc_msgSend(v3, "setObject:forKey:", -[AVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs"), @"RequiredSampleDataTrackIDArray");
  }
  backgroundColor = self->_instruction->backgroundColor;
  if (backgroundColor)
  {
    Components = CGColorGetComponents(backgroundColor);
    ColorSpace = CGColorGetColorSpace(self->_instruction->backgroundColor);
    if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
    {
      float v10 = *Components;
      float v11 = Components[1];
      float v12 = Components[2];
      float v13 = Components[3];
      long long v14 = NSArrayFromRGBAComponents(v10, v11, v12, v13);
      if (v14) {
        [v3 setObject:v14 forKey:@"BackgroundColorARGB"];
      }
      long long v15 = CGColorGetColorSpace(self->_instruction->backgroundColor);
      if (v15)
      {
        CFDataRef v16 = CGColorSpaceCopyICCData(v15);
        if (v16)
        {
          CFDataRef v17 = v16;
          [v3 setObject:v16 forKey:@"BackgroundColorICCProfile"];
          CFRelease(v17);
        }
      }
    }
  }
  uint64_t v18 = [(NSArray *)self->_instruction->layerInstructions count];
  if (v18 >= 1)
  {
    v31 = v3;
    long long v19 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v30 = self;
    layerInstructions = self->_instruction->layerInstructions;
    uint64_t v21 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      LOBYTE(v23) = 0;
      uint64_t v24 = *(void *)v33;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(layerInstructions);
          }
          v26 = *(void **)(*((void *)&v32 + 1) + 8 * v25);
          CMTimeRange time = v38;
          uint64_t v27 = (void *)[v26 dictionaryRepresentationWithTimeRange:&time];
          if (v27) {
            [v19 addObject:v27];
          }
          BOOL v23 = v23
             || [v27 objectForKey:@"TweenedAffineMatrix"]
             || [v27 objectForKey:@"TweenedOpacity"]
             || [v27 objectForKey:@"TweenedCropRectangle"] != 0;
          ++v25;
        }
        while (v22 != v25);
        uint64_t v28 = [(NSArray *)layerInstructions countByEnumeratingWithState:&v32 objects:v39 count:16];
        uint64_t v22 = v28;
      }
      while (v28);
    }
    else
    {
      BOOL v23 = 0;
    }
    uint64_t v3 = v31;
    if ([v19 count]) {
      [v31 setObject:v19 forKey:@"LayerStack"];
    }
    self = v30;
    if (v23) {
      [v31 setObject:*MEMORY[0x1E4F1CFD0] forKey:@"ContainsTweening"];
    }
  }
  if (![(AVVideoCompositionInstruction *)self enablePostProcessing]) {
    [v3 setObject:*MEMORY[0x1E4F1CFC8] forKey:@"EnablePostProcessing"];
  }
  return v3;
}

- (void)_setValuesFromDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v32 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)long long v33 = v6;
  *(_OWORD *)&v33[16] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  *(_OWORD *)v36 = v32;
  *(_OWORD *)&v36[16] = v6;
  long long v37 = *(_OWORD *)&v33[16];
  [(AVVideoCompositionInstruction *)self setTimeRange:v36];
  [(AVVideoCompositionInstruction *)self setBackgroundColor:0];
  [(AVVideoCompositionInstruction *)self setLayerInstructions:0];
  [(AVVideoCompositionInstruction *)self setEnablePostProcessing:1];
  [(AVVideoCompositionInstruction *)self setRequiredSourceSampleDataTrackIDs:MEMORY[0x1E4F1CBF0]];
  CFDictionaryRef v7 = (const __CFDictionary *)[a3 objectForKey:@"StartTime"];
  uint64_t v8 = [a3 objectForKey:@"EndTime"];
  if (v7)
  {
    CFDictionaryRef v9 = (const __CFDictionary *)v8;
    if (v8)
    {
      CMTimeMakeFromDictionary((CMTime *)&v32, v7);
      CMTimeMakeFromDictionary(&lhs, v9);
      *(_OWORD *)&rhs.value = v32;
      rhs.epoch = *(void *)v33;
      CMTimeSubtract((CMTime *)v36, &lhs, &rhs);
      *(void *)&v33[24] = *(void *)&v36[16];
      *(_OWORD *)&v33[8] = *(_OWORD *)v36;
      *(_OWORD *)v36 = v32;
      *(_OWORD *)&v36[16] = *(_OWORD *)v33;
      long long v37 = *(_OWORD *)&v33[16];
      [(AVVideoCompositionInstruction *)self setTimeRange:v36];
    }
  }
  if ([a3 objectForKey:@"BackgroundColorICCProfile"])
  {
    float v10 = (CGColorSpace *)MEMORY[0x199712DD0]();
    CGColorSpaceRef v11 = v10;
    if (v10) {
      CFRetain(v10);
    }
    if (v5) {
      CFRelease(v5);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    CGColorSpaceRef v11 = v5;
  }
  float v12 = (void *)[a3 objectForKey:@"BackgroundColorARGB"];
  if (v12)
  {
    memset(v36, 0, sizeof(v36));
    rhs.value = 0;
    *(void *)&rhs.timescale = 0;
    NSArrayGetRGBAComponents(v12, &rhs, (_DWORD *)&rhs.value + 1, &rhs.timescale, (_DWORD *)((unint64_t)&rhs | 0xC));
    *(float64x2_t *)v36 = vcvtq_f64_f32((float32x2_t)rhs.value);
    *(float64x2_t *)&v36[16] = vcvt_hight_f64_f32(*(float32x4_t *)&rhs.value);
    CGColorRef v13 = CGColorCreate(v11, (const CGFloat *)v36);
    if (v13)
    {
      CGColorRef v14 = v13;
      [(AVVideoCompositionInstruction *)self setBackgroundColor:v13];
      CFRelease(v14);
    }
  }
  long long v15 = (void *)[a3 objectForKey:@"LayerStack"];
  uint64_t v16 = [v15 count];
  if (v16 >= 1)
  {
    v26 = v11;
    CFDataRef v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
          BOOL v23 = objc_alloc_init(AVVideoCompositionLayerInstruction);
          *(_OWORD *)v36 = v32;
          *(_OWORD *)&v36[16] = *(_OWORD *)v33;
          long long v37 = *(_OWORD *)&v33[16];
          [(AVVideoCompositionLayerInstruction *)v23 _setValuesFromDictionary:v22 timeRange:v36];
          [v17 addObject:v23];
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v15 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v19);
    }
    [(AVVideoCompositionInstruction *)self setLayerInstructions:v17];
    CGColorSpaceRef v11 = v26;
  }
  uint64_t v24 = (void *)[a3 objectForKey:@"EnablePostProcessing"];
  if (v24) {
    -[AVVideoCompositionInstruction setEnablePostProcessing:](self, "setEnablePostProcessing:", [v24 BOOLValue]);
  }
  uint64_t v25 = [a3 objectForKey:@"RequiredSampleDataTrackIDArray"];
  if (v25) {
    [(AVVideoCompositionInstruction *)self setRequiredSourceSampleDataTrackIDs:v25];
  }
  CGColorSpaceRelease(v11);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"AVVideoCompositionInstruction %@", objc_msgSend(-[AVVideoCompositionInstruction dictionaryRepresentation](self, "dictionaryRepresentation"), "description")];
}

@end