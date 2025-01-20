@interface AVAssetVariantChannelCountPredicate
- (AVAssetVariantChannelCountPredicate)initWithChannelCount:(int64_t)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5;
@end

@implementation AVAssetVariantChannelCountPredicate

- (AVAssetVariantChannelCountPredicate)initWithChannelCount:(int64_t)a3 mediaSelectionOption:(id)a4 operatorType:(unint64_t)a5
{
  SEL v9 = NSSelectorFromString(&cfstr_Channelcountfo.isa);
  v11.receiver = self;
  v11.super_class = (Class)AVAssetVariantChannelCountPredicate;
  return -[AVAssetVariantRenditionSpecificAudioAttributePredicate initWithAttributeSelector:mediaSelectionOption:value:operatorType:](&v11, sel_initWithAttributeSelector_mediaSelectionOption_value_operatorType_, v9, a4, [MEMORY[0x1E4F28ED0] numberWithInteger:a3], a5);
}

@end