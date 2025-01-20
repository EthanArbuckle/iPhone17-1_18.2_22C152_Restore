@interface AVAssetVariantQualifier
+ (AVAssetVariantQualifier)assetVariantQualifierWithPredicate:(NSPredicate *)predicate;
+ (AVAssetVariantQualifier)assetVariantQualifierWithVariant:(AVAssetVariant *)variant;
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateForBinauralAudio:(BOOL)isBinauralAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption;
+ (NSPredicate)predicateForChannelCount:(NSInteger)channelCount mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption operatorType:(NSPredicateOperatorType)operatorType;
+ (NSPredicate)predicateForDownmixAudio:(BOOL)isDownmixAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption;
+ (NSPredicate)predicateForImmersiveAudio:(BOOL)isImmersiveAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption;
+ (NSPredicate)predicateForPresentationHeight:(CGFloat)height operatorType:(NSPredicateOperatorType)operatorType;
+ (NSPredicate)predicateForPresentationWidth:(CGFloat)width operatorType:(NSPredicateOperatorType)operatorType;
+ (id)assetVariantQualifierForMaximumValueInKeyPath:(id)a3;
+ (id)assetVariantQualifierForMinimumValueInKeyPath:(id)a3;
+ (id)predicateForAudioSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5;
- (AVAssetVariantQualifier)initWithCoder:(id)a3;
- (AVAssetVariantQualifier)initWithVariant:(id)a3;
- (id)_figAssetVariantQualifier;
- (id)_variant;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)environmentalConditions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEnvironmentalConditions:(int64_t)a3;
@end

@implementation AVAssetVariantQualifier

- (AVAssetVariantQualifier)initWithVariant:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantQualifier;
  v4 = [(AVAssetVariantQualifier *)&v6 init];
  if (v4) {
    v4->_variant = (AVAssetVariant *)a3;
  }
  return v4;
}

+ (AVAssetVariantQualifier)assetVariantQualifierWithPredicate:(NSPredicate *)predicate
{
  if (!predicate)
  {
    id v8 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"predicate cannot be nil";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"supports only NSPredicate objects";
LABEL_8:
    v18 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v16, v9, v10, v11, v12, v13, v19), 0);
    objc_exception_throw(v18);
  }
  objc_super v6 = -[AVAssetVariantQualifierWithPredicate initWithFigAssetVariantQualifierWithPredicate:]([AVAssetVariantQualifierWithPredicate alloc], "initWithFigAssetVariantQualifierWithPredicate:", (id)[objc_alloc(MEMORY[0x1E4F31AE8]) initWithPredicate:predicate]);
  return (AVAssetVariantQualifier *)v6;
}

+ (AVAssetVariantQualifier)assetVariantQualifierWithVariant:(AVAssetVariant *)variant
{
  if (!variant)
  {
    id v8 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"variant cannot be nil";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"supports only AVAssetVariant objects";
LABEL_8:
    v18 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v16, v9, v10, v11, v12, v13, v19), 0);
    objc_exception_throw(v18);
  }
  objc_super v6 = (void *)[objc_alloc((Class)a1) initWithVariant:variant];
  return (AVAssetVariantQualifier *)v6;
}

+ (id)assetVariantQualifierForMinimumValueInKeyPath:(id)a3
{
  if (!a3)
  {
    id v8 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"keyPath cannot be nil";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"supports only NSString objects";
LABEL_8:
    v18 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v16, v9, v10, v11, v12, v13, v19), 0);
    objc_exception_throw(v18);
  }
  objc_super v6 = -[AVAssetVariantQualifierForMinimumInKeyPath initWithFigAssetVariantQualifierForMinimumInKeyPath:]([AVAssetVariantQualifierForMinimumInKeyPath alloc], "initWithFigAssetVariantQualifierForMinimumInKeyPath:", (id)[objc_alloc(MEMORY[0x1E4F31AE0]) initWithKeyPath:a3]);
  return v6;
}

+ (id)assetVariantQualifierForMaximumValueInKeyPath:(id)a3
{
  if (!a3)
  {
    id v8 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"keyPath cannot be nil";
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = a1;
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"supports only NSString objects";
LABEL_8:
    v18 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v16, v9, v10, v11, v12, v13, v19), 0);
    objc_exception_throw(v18);
  }
  objc_super v6 = -[AVAssetVariantQualifierForMaximumInKeyPath initWithFigAssetVariantQualifierForMaximumInKeyPath:]([AVAssetVariantQualifierForMaximumInKeyPath alloc], "initWithFigAssetVariantQualifierForMaximumInKeyPath:", (id)[objc_alloc(MEMORY[0x1E4F31AD8]) initWithKeyPath:a3]);
  return v6;
}

+ (NSPredicate)predicateForChannelCount:(NSInteger)channelCount mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption operatorType:(NSPredicateOperatorType)operatorType
{
  v5 = [[AVAssetVariantChannelCountPredicate alloc] initWithChannelCount:channelCount mediaSelectionOption:mediaSelectionOption operatorType:operatorType];
  return (NSPredicate *)v5;
}

+ (NSPredicate)predicateForBinauralAudio:(BOOL)isBinauralAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  v4 = [[AVAssetVariantBinauralAudioPredicate alloc] initWithBinauralAudio:isBinauralAudio mediaSelectionOption:mediaSelectionOption];
  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForImmersiveAudio:(BOOL)isImmersiveAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  v4 = [[AVAssetVariantImmersiveAudioPredicate alloc] initWithImmersiveAudio:isImmersiveAudio mediaSelectionOption:mediaSelectionOption];
  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForDownmixAudio:(BOOL)isDownmixAudio mediaSelectionOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  v4 = [[AVAssetVariantDownmixAudioPredicate alloc] initWithDownmixAudio:isDownmixAudio mediaSelectionOption:mediaSelectionOption];
  return (NSPredicate *)v4;
}

+ (id)predicateForAudioSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  v5 = [[AVAssetVariantAudioSampleRatePredicate alloc] initWithSampleRate:a4 mediaSelectionOption:a5 operatorType:a3];
  return v5;
}

+ (NSPredicate)predicateForPresentationWidth:(CGFloat)width operatorType:(NSPredicateOperatorType)operatorType
{
  v4 = [[AVAssetVariantPresentationWidthPredicate alloc] initWithPresentationWidth:operatorType operatorType:width];
  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForPresentationHeight:(CGFloat)height operatorType:(NSPredicateOperatorType)operatorType
{
  v4 = [[AVAssetVariantPresentationHeightPredicate alloc] initWithPresentationHeight:operatorType operatorType:height];
  return (NSPredicate *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantQualifier;
  [(AVAssetVariantQualifier *)&v3 dealloc];
}

- (id)_variant
{
  return self->_variant;
}

- (id)_figAssetVariantQualifier
{
  return self->_figAssetVariantQualifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVAssetVariantQualifier alloc];
  variant = self->_variant;
  return [(AVAssetVariantQualifier *)v4 initWithVariant:variant];
}

- (int64_t)environmentalConditions
{
  return self->_environmentalConditions;
}

- (void)setEnvironmentalConditions:(int64_t)a3
{
  self->_environmentalConditions = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  variant = self->_variant;
  [a3 encodeObject:variant forKey:@"variant"];
}

- (AVAssetVariantQualifier)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetVariantQualifier;
  uint64_t v6 = [(AVAssetVariantQualifier *)&v15 init];
  if (v6) {
    v6->_variant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"variant"];
  }
  return v6;
}

@end