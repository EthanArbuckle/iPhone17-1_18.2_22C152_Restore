@interface FigAlternatePredicateValidator
+ (BOOL)validateKeyPathForMinMaxQualifiers:(id)a3;
- (BOOL)_allowCallingFunctionWithName:(id)a3;
- (BOOL)_keyPathComponentIsAllowed:(id)a3;
- (BOOL)_unsafeEvaluateKeyPathWithDummy:(id)a3;
- (BOOL)_validateKeyPath:(id)a3;
- (BOOL)validateWithError:(id *)a3;
- (FigAlternatePredicateValidator)initWithPredicate:(id)a3;
- (id)_keyPathComponents:(id)a3;
- (void)dealloc;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation FigAlternatePredicateValidator

- (FigAlternatePredicateValidator)initWithPredicate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAlternatePredicateValidator;
  v4 = [(FigAlternatePredicateValidator *)&v6 init];
  if (v4)
  {
    v4->_predicate = (NSPredicate *)[a3 copy];
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_result = 1;
  }
  return v4;
}

- (BOOL)validateWithError:(id *)a3
{
  if (!self->_isEvaluated) {
    [(NSPredicate *)self->_predicate acceptVisitor:self flags:3];
  }
  MEMORY[0x19970E930](self->_mutex);
  if (a3) {
    *a3 = self->_error;
  }
  return self->_result;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigAlternatePredicateValidator;
  [(FigAlternatePredicateValidator *)&v3 dealloc];
}

- (void)visitPredicate:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (self->_result)
  {
    Class Class = objc_getClass("AVAssetVariantChannelCountPredicate");
    Class v6 = objc_getClass("AVAssetVariantBinauralAudioPredicate");
    Class v7 = objc_getClass("AVAssetVariantImmersiveAudioPredicate");
    Class v8 = objc_getClass("AVAssetVariantDownmixAudioPredicate");
    Class v9 = objc_getClass("AVAssetVariantAudioSampleRatePredicate");
    Class v10 = objc_getClass("AVAssetVariantPresentationWidthPredicate");
    Class v11 = objc_getClass("AVAssetVariantPresentationHeightPredicate");
    if (([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
      && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
      && (!Class || ([a3 isMemberOfClass:Class] & 1) == 0)
      && (!v6 || ([a3 isMemberOfClass:v6] & 1) == 0)
      && (!v7 || ([a3 isMemberOfClass:v7] & 1) == 0)
      && (!v8 || ([a3 isMemberOfClass:v8] & 1) == 0)
      && (!v10 || ([a3 isMemberOfClass:v10] & 1) == 0)
      && (!v11 || ([a3 isMemberOfClass:v11] & 1) == 0)
      && (!v9 || ([a3 isMemberOfClass:v9] & 1) == 0))
    {
      self->_result = 0;
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v14[0] = @"failed to validate NSPredicate because only comparison and compound predicates are supported";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      self->_error = (NSError *)(id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-15860 userInfo:v12];
    }
  }
}

- (BOOL)_unsafeEvaluateKeyPathWithDummy:(id)a3
{
  id v4 = +[FigAlternateObjC dummy];
  uint64_t v6 = [v4 valueForKeyPath:a3];
  return [v4 validateValue:&v6 forKeyPath:a3 error:0];
}

- (BOOL)_keyPathComponentIsAllowed:(id)a3
{
  if (_keyPathComponentIsAllowed__buildValidKeysOnce != -1) {
    dispatch_once(&_keyPathComponentIsAllowed__buildValidKeysOnce, &__block_literal_global_74);
  }
  id v4 = (void *)_keyPathComponentIsAllowed__sValidKeys;

  return [v4 containsObject:a3];
}

id __61__FigAlternatePredicateValidator__keyPathComponentIsAllowed___block_invoke()
{
  id result = objc_retain((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"peakBitRate", @"averageBitRate", @"videoAttributes", @"videoRange", @"codecTypes", @"presentationSize", @"presentationHeight", @"presentationWidth", @"nominalFrameRate", @"audioAttributes", @"formatIDs", @"immersiveAttributes", @"packing", @"channelLayout", @"projection", @"@avg", @"@count",
                             @"@max",
                             @"@min",
                             @"@sum",
                             @"@distinctUnionOfObjects",
                             @"@unionOfObjects",
                             @"@distinctUnionOfArrays",
                             @"@unionOfArrays",
                             @"@distinctUnionOfSets",
                             @"videoLayoutAttributes",
                             @"stereoViewComponents",
                             @"packingType",
                             @"projectionType",
                             0));
  _keyPathComponentIsAllowed__sValidKeys = (uint64_t)result;
  return result;
}

- (id)_keyPathComponents:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@"."];
}

- (BOOL)_validateKeyPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  if (v5)
  {
    id v6 = [(FigAlternatePredicateValidator *)self _keyPathComponents:a3];
    if ((unint64_t)[v6 count] <= 5)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
LABEL_6:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          LODWORD(v5) = [(FigAlternatePredicateValidator *)self _keyPathComponentIsAllowed:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
          if (!v5) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
            if (v8) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        LOBYTE(v5) = [(FigAlternatePredicateValidator *)self _unsafeEvaluateKeyPathWithDummy:a3];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_allowCallingFunctionWithName:(id)a3
{
  if (_allowCallingFunctionWithName__sOnceToken != -1) {
    dispatch_once(&_allowCallingFunctionWithName__sOnceToken, &__block_literal_global_107);
  }
  id v4 = (void *)_allowCallingFunctionWithName__sValidFunctions;

  return [v4 containsObject:a3];
}

id __64__FigAlternatePredicateValidator__allowCallingFunctionWithName___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"channelCountForMediaOption:", @"isBinauralMediaOption:", @"isImmersiveMediaOption:", @"isDownmixMediaOption:", @"sampleRateForMediaOption:", 0);
  _allowCallingFunctionWithName__sValidFunctions = (uint64_t)result;
  return result;
}

- (void)visitPredicateExpression:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!self->_result) {
    return;
  }
  uint64_t v5 = [a3 expressionType];
  if (v5 > 9)
  {
    if (v5 == 19)
    {
      uint64_t v11 = *MEMORY[0x1E4F28228];
      long long v12 = @"failed to validate NSPredicate because block expressions are not supported";
      id v6 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v7 = &v12;
      uint64_t v8 = &v11;
      goto LABEL_14;
    }
    if (v5 != 10) {
      return;
    }
LABEL_9:
    uint64_t v9 = [a3 keyPath];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(FigAlternatePredicateValidator *)self _validateKeyPath:v9]) {
        return;
      }
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16 = @"failed to validate NSPredicate because of invalid key path";
      id v6 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v7 = &v16;
      uint64_t v8 = &v15;
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"failed to validate NSPredicate because key path is not a string";
      id v6 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v7 = (__CFString **)v18;
      uint64_t v8 = &v17;
    }
    goto LABEL_14;
  }
  if (v5 == 3) {
    goto LABEL_9;
  }
  if (v5 == 4
    && !-[FigAlternatePredicateValidator _allowCallingFunctionWithName:](self, "_allowCallingFunctionWithName:", [a3 function]))
  {
    uint64_t v13 = *MEMORY[0x1E4F28228];
    long long v14 = @"failed to validate NSPredicate because calling the supplied function is forbidden";
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v7 = &v14;
    uint64_t v8 = &v13;
LABEL_14:
    uint64_t v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];
    self->_id result = 0;
    self->_error = (NSError *)(id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-15860 userInfo:v10];
  }
}

- (void)visitPredicateOperator:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_result && [a3 operatorType] == 11)
  {
    uint64_t v5 = *MEMORY[0x1E4F28228];
    v6[0] = @"failed to validate NSPredicate because custom selector operators are not supported";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    self->_id result = 0;
    self->_error = (NSError *)(id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-15860 userInfo:v4];
  }
}

+ (BOOL)validateKeyPathForMinMaxQualifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[a3 componentsSeparatedByString:@"."];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v3);
      }
      int v8 = [&unk_1EE58E088 containsObject:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
      if (!v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

@end