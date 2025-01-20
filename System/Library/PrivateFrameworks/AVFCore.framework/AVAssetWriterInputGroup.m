@interface AVAssetWriterInputGroup
+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput;
+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5;
- (AVAssetWriterInput)defaultInput;
- (AVAssetWriterInputGroup)init;
- (AVAssetWriterInputGroup)initWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput;
- (AVAssetWriterInputGroup)initWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5;
- (NSArray)inputs;
- (NSArray)provisionalInputs;
- (id)mediaSelectionOptionWithPropertyList:(id)a3;
- (id)options;
- (void)_startObservingInputPropertiesThatMayChangeValueOfOptions;
- (void)_stopObservingInputPropertiesThatMayChangeValueOfOptions;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AVAssetWriterInputGroup

+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput
{
  v4 = (void *)[objc_alloc((Class)a1) initWithInputs:inputs defaultInput:defaultInput];
  return (AVAssetWriterInputGroup *)v4;
}

- (AVAssetWriterInputGroup)init
{
  return [(AVAssetWriterInputGroup *)self initWithInputs:0 defaultInput:0];
}

- (AVAssetWriterInputGroup)initWithInputs:(NSArray *)inputs defaultInput:(AVAssetWriterInput *)defaultInput
{
  if (!inputs)
  {
    v11 = self;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "inputs != nil";
    goto LABEL_13;
  }
  if (![(NSArray *)inputs count])
  {
    v20 = self;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "[inputs count] > 0";
    goto LABEL_13;
  }
  if (defaultInput && ![(NSArray *)inputs containsObject:defaultInput])
  {
    v21 = self;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "defaultInput == nil || [inputs containsObject:defaultInput]";
LABEL_13:
    v22 = (void *)[v17 exceptionWithName:v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)v19), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)AVAssetWriterInputGroup;
  v8 = [(AVMediaSelectionGroup *)&v23 init];
  if (v8)
  {
    v9 = objc_alloc_init(AVAssetWriterInputGroupInternal);
    v8->_internal = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_internal->inputs = (NSArray *)[(NSArray *)inputs copy];
      v8->_internal->defaultInput = defaultInput;
      [(AVAssetWriterInputGroup *)v8 _startObservingInputPropertiesThatMayChangeValueOfOptions];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)dealloc
{
  if (self->_internal)
  {
    [(AVAssetWriterInputGroup *)self _stopObservingInputPropertiesThatMayChangeValueOfOptions];

    CFRelease(self->_internal);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputGroup;
  [(AVMediaSelectionGroup *)&v3 dealloc];
}

- (NSArray)inputs
{
  result = self->_internal->inputs;
  if (!result) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return result;
}

- (AVAssetWriterInput)defaultInput
{
  return self->_internal->defaultInput;
}

- (void)_startObservingInputPropertiesThatMayChangeValueOfOptions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  obj = self->_internal->inputs;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v7 addObserver:self forKeyPath:@"languageCode" options:0 context:@"AVAssetWriterInputGroupOptionsChangedContext"];
        [v7 addObserver:self forKeyPath:@"extendedLanguageTag" options:0 context:@"AVAssetWriterInputGroupOptionsChangedContext"];
        [v7 addObserver:self forKeyPath:@"metadata" options:0 context:@"AVAssetWriterInputGroupOptionsChangedContext"];
        [v7 addObserver:self forKeyPath:@"trackReferences" options:0 context:@"AVAssetWriterInputGroupOptionsChangedContext"];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_stopObservingInputPropertiesThatMayChangeValueOfOptions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v4 = [(NSArray *)inputs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(inputs);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 removeObserver:self forKeyPath:@"languageCode"];
        [v8 removeObserver:self forKeyPath:@"extendedLanguageTag"];
        [v8 removeObserver:self forKeyPath:@"metadata"];
        [v8 removeObserver:self forKeyPath:@"trackReferences"];
      }
      uint64_t v5 = [(NSArray *)inputs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AVAssetWriterInputGroupOptionsChangedContext")
  {
    [(AVAssetWriterInputGroup *)self willChangeValueForKey:@"options", a4, a5];
    [(AVAssetWriterInputGroup *)self didChangeValueForKey:@"options"];
  }
}

- (id)options
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  inputs = self->_internal->inputs;
  uint64_t v5 = [(NSArray *)inputs countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(inputs);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_msgSend(v9, "mediaType"), "isEqualToString:", @"sbtl"))
        {
          uint64_t v13 = +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:v9];
          goto LABEL_18;
        }
        long long v10 = (const void *)[v9 sourceFormatHint];
        if ([v9 outputSettings]) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v10 == 0;
        }
        if (v11
          || (CFTypeID v12 = CFGetTypeID(v10), v12 != CMFormatDescriptionGetTypeID())
          || CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v10) != 1935832172
          || (CMTextDisplayFlags displayFlagsOut = 0, CMTextFormatDescriptionGetDisplayFlags((CMFormatDescriptionRef)v10, &displayFlagsOut))
          || (displayFlagsOut & 0x80000000) == 0)
        {
          objc_msgSend(v3, "addObject:", +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:](AVAssetWriterInputSelectionOption, "assetWriterInputSelectionOptionWithAssetWriterInput:displaysNonForcedSubtitles:", v9, 1));
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "_trackReferences"), "objectForKey:", @"forc"), "count"))
          {
            continue;
          }
        }
        uint64_t v13 = +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:v9 displaysNonForcedSubtitles:0];
LABEL_18:
        [v3 addObject:v13];
        continue;
      }
      uint64_t v6 = [(NSArray *)inputs countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (AVAssetWriterInputGroup)assetWriterInputGroupWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithInputs:a3 provisionalInputs:a4 defaultInput:a5];
  return (AVAssetWriterInputGroup *)v5;
}

- (AVAssetWriterInputGroup)initWithInputs:(id)a3 provisionalInputs:(id)a4 defaultInput:(id)a5
{
  if (a5 && ([a3 containsObject:a5] & 1) == 0)
  {
    objc_super v23 = self;
    long long v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "defaultInput == nil || [inputs containsObject:defaultInput]";
    goto LABEL_16;
  }
  if (![a3 count] || !objc_msgSend(a4, "count"))
  {
    if ([a3 count] || objc_msgSend(a4, "count")) {
      goto LABEL_9;
    }
    v24 = self;
    long long v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "[inputs count] > 0 || [provisionalInputs count] > 0";
LABEL_16:
    v25 = (void *)[v17 exceptionWithName:v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)v19), 0 reason userInfo];
    objc_exception_throw(v25);
  }
  long long v10 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:a3];
  if (objc_msgSend(v10, "intersectsSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a4)))
  {
    BOOL v11 = self;
    long long v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "! [[NSSet setWithArray:inputs] intersectsSet:[NSSet setWithArray:provisionalInputs]]";
    goto LABEL_16;
  }
LABEL_9:
  v26.receiver = self;
  v26.super_class = (Class)AVAssetWriterInputGroup;
  v20 = [(AVMediaSelectionGroup *)&v26 init];
  if (v20)
  {
    uint64_t v21 = objc_alloc_init(AVAssetWriterInputGroupInternal);
    v20->_internal = v21;
    if (v21)
    {
      CFRetain(v21);
      v20->_internal->inputs = (NSArray *)[a3 copy];
      v20->_internal->defaultInput = (AVAssetWriterInput *)a5;
      v20->_internal->provisionalInputs = (NSArray *)[a4 copy];
      [(AVAssetWriterInputGroup *)v20 _startObservingInputPropertiesThatMayChangeValueOfOptions];
    }
    else
    {

      return 0;
    }
  }
  return v20;
}

- (NSArray)provisionalInputs
{
  result = self->_internal->provisionalInputs;
  if (!result) {
    return (NSArray *)[MEMORY[0x1E4F1C978] array];
  }
  return result;
}

- (id)mediaSelectionOptionWithPropertyList:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKey:@"UnsafeUnretainedPointerData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v7 = 0, [v4 length] == 8)
    && ([v4 getBytes:&v7 length:8],
        uint64_t v5 = [(AVAssetWriterInputGroup *)self inputs],
        [(NSArray *)v5 indexOfObjectIdenticalTo:v7] != 0x7FFFFFFFFFFFFFFFLL))
  {
    return +[AVAssetWriterInputSelectionOption assetWriterInputSelectionOptionWithAssetWriterInput:v7];
  }
  else
  {
    return 0;
  }
}

@end