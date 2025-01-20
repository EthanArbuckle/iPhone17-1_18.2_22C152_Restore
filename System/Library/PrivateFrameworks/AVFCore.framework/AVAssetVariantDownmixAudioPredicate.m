@interface AVAssetVariantDownmixAudioPredicate
- (AVAssetVariantDownmixAudioPredicate)initWithDownmixAudio:(BOOL)a3 mediaSelectionOption:(id)a4;
@end

@implementation AVAssetVariantDownmixAudioPredicate

- (AVAssetVariantDownmixAudioPredicate)initWithDownmixAudio:(BOOL)a3 mediaSelectionOption:(id)a4
{
  BOOL v5 = a3;
  SEL v7 = NSSelectorFromString(&cfstr_Isdownmixmedia.isa);
  v9.receiver = self;
  v9.super_class = (Class)AVAssetVariantDownmixAudioPredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v9, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v7, a4, [MEMORY[0x1E4F28ED0] numberWithBool:v5], 4);
}

@end