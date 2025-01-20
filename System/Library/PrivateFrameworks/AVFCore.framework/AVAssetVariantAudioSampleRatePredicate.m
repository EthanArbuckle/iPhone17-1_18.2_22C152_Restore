@interface AVAssetVariantAudioSampleRatePredicate
- (AVAssetVariantAudioSampleRatePredicate)initWithSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5;
@end

@implementation AVAssetVariantAudioSampleRatePredicate

- (AVAssetVariantAudioSampleRatePredicate)initWithSampleRate:(double)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  SEL v9 = NSSelectorFromString(&cfstr_Samplerateform.isa);
  v11.receiver = self;
  v11.super_class = (Class)AVAssetVariantAudioSampleRatePredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v11, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v9, a4, [MEMORY[0x1E4F28ED0] numberWithDouble:a3], a5);
}

@end